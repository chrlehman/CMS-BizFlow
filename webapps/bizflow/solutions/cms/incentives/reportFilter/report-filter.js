/* global _ angular $ CMS_REPORT_FILTER */
(function () {
    'use strict';

    angular.module('bizflow.app').component('incentiveReportFilter', {
        templateUrl: function ($element, $attrs, bizflowContext) {
            var template = 'incentives/reportFilter/report-filter.html';
            return template;
        },
        controller: Ctrl
    });

    function Ctrl($scope, blockUI, bizflowContext, $log, $window, $filter, $location) {
        var vm = this;

        // Attributes
        vm.report = {'name': '', 'description': ''};
        vm.group = {};
		vm.hrSpecialists = {};

        // Primitive Options - Not for Selectize
        vm._components = ['By Request Number', 'By Admin Code', 'Office of the Administrator (OA) Only'];
        vm._incentiveTypes = [];
        vm._incentiveTypes_All = [{value: "LE", key: "Leave Enhancement (LE)"},{value: "PCA", key: "Physician's Comparability Allowance (PCA)"},
            {value: "SAM", key: "Salary Above Minimum (SAM)"},{value: "PDP", key: "Physician and Dentist Pay (PDP)"}];
        vm._incentiveTypes_SAM_LE = [{value: "LE", key: "Leave Enhancement (LE)"},{value: "SAM", key: "Salary Above Minimum (SAM)"}];
        vm._incentiveTypes_PCA_PDP = [{value: "PCA", key: "Physician's Comparability Allowance (PCA)"},{value: "PDP", key: "Physician and Dentist Pay (PDP)"}];
        vm._pcaTypes = ['All', 'New', 'Renewal'];
        vm._includeSubOrgs = ['Yes', 'No'];
        //vm._requestStatus = ["Completed", "Active", "Both"];
        vm._requestTypes = ['All','Appointment', 'Recruitment'];
        vm._appointmentTypes = ['All', '30% or more disabled veterans', 'Expert/Consultant', 'Schedule A', 'Veteran Recruitment Appointment (VRA)'];
        vm._scheduleATypes = ['All', 'CMS Fellows-Paid (R)', 'Digital Services', 'Disability (U)', 'Innovator-In-Residence', 'Interpreters (LL)', 'WRP (Summer Hire)'];
        vm._volunteerTypes = ['All', 'CMS Fellows-Unpaid', 'Student Volunteer', 'Wounded Warriors', 'Youth Works'];
		vm._dayTypes = ['Business', 'Calendar']; //#290605 - Business and Calendar Days filter 

        vm.reportMap = [
			{
				'name': 'CMS HR Incentives Time to Completion Report - SAM & LE',
				'description': 'Incentives Time to Completion Report - SAM & LE',
				'dateLabel': 'Date Request Entered'
			},
			{
				'name': 'CMS HR Time to SAM/LE Report - Completed',
				'description': 'Time to SAM/LE Report - Completed',
				'dateLabel': 'Date Request Entered'
			},
			{
				'name': 'CMS HR Incentives PCA Report - Complete',
				'description': 'Incentives PCA Report - Complete',
				'dateLabel': 'Date Request Entered'
			},
			{
				'name': 'CMS HR Incentives Time to Completion Report for PCA & PDP - Completed',
				'description': 'Incentives Time to Completion Report for PCA & PDP - Completed',
				'dateLabel': 'Date Request Entered'
			},
			{
				'name': 'CMS HR Cancelled Incentives Report',
				'description': 'Cancelled Incentives Report',
				'dateLabel': 'Date Request Entered'
			},
			{
				'name': 'CMS HR Incentives Workload Summary Report - Active',
				'description': 'Incentives Workload Summary Report - Active',
				'dateLabel': 'Date Request Entered'
			},
			{
				'name': 'CMS HR Incentives Workload Summary Report - Completed',
				'description': 'Incentives Workload Summary Report - Completed',
				'dateLabel': 'Date Request Entered'
			}
		];

        // Default Values
        vm.orgSelected = {
            component: '',
            incentiveType: 'All',
            incentiveTypes: [],
            adminCode: '',
            includeSubOrg: 'Yes',
            pcaType: 'All',            
            requestType: 'All',
            classificationType: 'All',
            appointmentType: 'All',
            scheduleAType: 'All',
            volunteerType: 'All',
            fromDate: null,
            toDate: null,
            hrSpecialist: null,
        };
        // Selected Values
        vm.selected = {};

        // Date From - To
        vm.dateLabel = "Date Request Completed";
        
        vm.fromDateOpened = false;
        vm.toDateOpened = false;
        vm.dateOptionFrom = {showWeeks: false, maxDate: new Date()};
        vm.dateOptionTo = {showWeeks: false, maxDate: new Date()};

        // Selectize configuration for members in User Group
        vm.membersInGroupConfig = {
            maxItems: 1,
            create: false,
            valueField: 'memberid',
            labelField: 'name',
			sortField: 'name',
            searchField: ['name']
        };
        // Selectize configuration for simple list
        vm.simpleConfig = {
            maxItems: 1,
            create: false,
            valueField: 'value',
            labelField: 'key'
        };

        vm.multipleConfig = {
            create: false,
			allowEmptyOption: false,
            valueField: 'value',
            labelField: 'key',
            maxItems: null
        };

        vm.getSelectizeOptions = function (items) {
            if (vm.isSection508User == false) {
                return items.map(function (item) {
                    return {key: item, value: item};
                })
            } else {
                return items;
            }
        };
		
        vm.getSelectizeOptionsEx = function (items) {
            return items.map(function (item) {
                return item;
            })
        };
		
        vm.copyItems = function (targets, sources) {
            if (targets) {
                if (targets.length > 0) {
                    targets.length = 0;
                }

                for (var i = 0; i < sources.length; i++) {
                    targets.push(sources[i]);
                }
            }
        }

        vm.classTypesForClass = [];
        vm.classTypesForRecruitment = [];
        vm.classTypesForAppointment = [];
        vm.classTypesForOther = [];

        vm.allClassificationTypes = ['All', 'Audit Position', 'Create New Position Description', 'Reorganization Pen & Ink',
            'Reorganization for New Position', 'Review Existing Position Description', 'Update Coversheet', 'Update Major Duties'];
        vm.recruitmentClassificationTypes = ['All', 'Create New Position Description', 'Reorganization Pen & Ink',
            'Reorganization for New Position', 'Review Existing Position Description', 'Update Coversheet', 'Update Major Duties'];

        // Functions
        vm.getClassificationTypes = function () {
            if (vm.selected.requestType === '') {
                if (vm.classTypesForClass.length == 0) {
                    vm.classTypesForClass = vm.classTypesForClass.concat(vm.allClassificationTypes);
                    vm.classTypesForClass.sort();
                    vm.classTypesForClass = vm.getSelectizeOptions(vm.classTypesForClass);
                }
                return vm.classTypesForClass;
            } else if (vm.selected.requestType === 'Recruitment') {
                if (vm.classTypesForRecruitment.length == 0) {
                    vm.classTypesForRecruitment = vm.classTypesForRecruitment.concat(vm.recruitmentClassificationTypes);
                    vm.classTypesForRecruitment.sort();
                    vm.classTypesForRecruitment = vm.getSelectizeOptions(vm.classTypesForRecruitment);
                }
                return vm.classTypesForRecruitment;
            } else if (vm.selected.requestType === 'Appointment') {
                if (vm.classTypesForAppointment.length == 0) {
                    vm.classTypesForAppointment = vm.classTypesForAppointment.concat(vm.recruitmentClassificationTypes);
                    vm.classTypesForAppointment.sort();
                    vm.classTypesForAppointment = vm.getSelectizeOptions(vm.classTypesForAppointment);
                }
                return vm.classTypesForAppointment;
            } else {
                return vm.classTypesForOther;
            }
        };

        vm.adjustBizCoveUI = function () {
            try {
                $('#mainWrapper table.tableTab', window.parent.document).remove(); // Remove BizCove Header
                $('#mainWrapper table.list td', window.parent.document).css({'padding': '0px 0px 0px 0px'}); // Adjust padding
                $('#modalPopupMax0Title', window.parent.parent.document).text(vm.report.name); // Set report name
            } catch (e) {
                $log.error(e);
            }
        };    

        vm.initUserGroups = function () {
            var groups = JSON.parse(CMS_REPORT_FILTER.GROUPS).groups;
            CMS_REPORT_FILTER.GROUPS = null;
            vm.group = _.groupBy(groups, 'grpname');
            for (var prop in vm.group) {
                if (vm.group.hasOwnProperty(prop)) {
                    vm.group[prop].unshift({grpname: '', grpid: '', memberid: 'All', name: 'All'});
                }
            }
            var amIDCOManagerLeads = _.filter(vm.group['DCO Managers and Leads'], function (item) {
                return item.memberid === CMS_REPORT_FILTER.CURUSERID;
            });
            var amIAdminTeam = _.filter(vm.group['Admin Team'], function (item) {
                return item.memberid === CMS_REPORT_FILTER.CURUSERID;
            });
            if (amIDCOManagerLeads.length > 0 || amIAdminTeam.length > 0) {
                vm._components = ['By Request Number', 'By Admin Code', 'CMS-wide', 'Office of the Administrator (OA) Only'];
            }
			
			//TODO: merge group A and B
            vm.hrSpecialists = vm.group['HR Specialists Group B'].concat(vm.group['HR Specialists Group A']);
            vm.hrSpecialists.unshift({name: 'All', memberid: 'All'});
            vm.orgSelected.hrSpecialist = vm.hrSpecialists[0];
        };

        // Calendar functions & configuration
        vm.changeFromOption = function () {
            vm.dateOptionTo.minDate = vm.selected.fromDate ? vm.selected.fromDate : null;
        };
        vm.changeToOption = function () {
            vm.dateOptionFrom.maxDate = vm.selected.toDate ? vm.selected.toDate : new Date();
        };
        vm.openFromDate = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();
            vm.toDateOpened = false;
            vm.fromDateOpened = true;
        }
        vm.openToDate = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();
            vm.toDateOpened = true;
            vm.fromDateOpened = false;
        }

        vm.getDateString = function (when) {
            var month = when.getMonth() + 1;
            month = month < 10 ? ('0' + month) : month;
            var day = when.getDate();
            day = day < 10 ? ('0' + day) : day;
            var year = when.getFullYear();
            var dateString = year + '-' + month + '-' + day;
            return dateString;
        };

        vm.getTargetReportURL = function () {
            var url = '/bizflowadvreport/flow.html?_flowId=viewReportFlow&decorate=no';
            url = url + '&j_memberid=' + CMS_REPORT_FILTER.CURUSERID; // j_memberid
            url = url + '&j_username=' + CMS_REPORT_FILTER.CURLOGINID; // j_username
            url = url + '&reportUnit=' + CMS_REPORT_FILTER.REPORTPATH; // reportUnit

            if (vm.selected.component === "By Request Number") {
                url += '&REPORT_MODE=' + encodeURIComponent("By Request Num");
                url += '&REQ_NUM=' + vm.selected.requestNumber;
            } else {
                url = url + '&REPORT_MODE=' + encodeURIComponent("By Component");

                if (vm.selected.component.length > 0) { // Component
                    url = url + '&COMPONENT=' + vm.selected.component;
                }
                if (vm.selected.adminCode != undefined && vm.selected.adminCode.length > 0) { // Admin Code
                    url = url + '&ADMIN_CD=' + vm.selected.adminCode.toUpperCase();
					url = url + '&INC_SUBORG=' +  vm.selected.includeSubOrg;
                } else {
                    url = url + '&ADMIN_CD=~NULL~';
                }
            }

            var date_from = "DATE_FROM";
			var date_to = "DATE_TO";
            if (vm.selected.fromDate != null) {
                var from = vm.getDateString(vm.selected.fromDate);
                url = url + '&' + date_from + '=' + from;
            } else {
                url = url + '&' + date_from + '=2000-01-01';
            }
            if (vm.selected.toDate != null) {
                var to = vm.getDateString(vm.selected.toDate);
                url = url + '&' + date_to + '=' + to;
            } else {
                url = url + '&' + date_to + '=2050-12-31';
            }

            if (vm.selected.hrSpecialist) {
                url = url + '&HRS_ID=' + (vm.isSection508User == true ? vm.selected.hrSpecialist.memberid : vm.selected.hrSpecialist); // HR Specialist
            }

            if (vm.selected.incentiveType) {
                var incentiveTypeArray;
                
                if (vm.isSection508User == false) {
                    incentiveTypeArray = vm.selected.incentiveType;
                } else {
                    incentiveTypeArray = vm.selected.incentiveTypes;
                }

				if(incentiveTypeArray.length > 0) {
					var incentiveType = incentiveTypeArray.join(",");
					if(incentiveType != "") {
                        url = url + '&INCEN_TYPE=' + encodeURIComponent(incentiveType); // Incentive Type -- EncodeD
					}
				}
            }
            if (vm.selected.pcaType) {
				url = url + '&PCA_TYPE=' + vm.selected.pcaType;
            }            
            if (vm.selected.requestType) {
				url = url + '&REQ_TYPE=' + vm.selected.requestType; // Request Type 
            }
            if (vm.selected.appointmentType) {
                url = url + '&APPT_TYPE=' + encodeURIComponent(vm.selected.appointmentType); // Appointment Type -- EncodeD
            }
			
            if (vm.selected.dayType) {
				url = url + '&DAYS=' + vm.selected.dayType; // Type of Days [Business Days | Calendar Days]
            }
            url = url + '&INC_SUBORG=' + vm.selected.includeSubOrg;
            url = url + '&_bf508=' + (vm.isSection508User ? 'y' : 'n');
            return url;
        };

        vm.submit = function () {
            if (vm.selected.component !== 'By Request Number') {
                vm.selected.requestNumber = '';
            }
            if (vm.selected.component !== 'By Admin Code') {
                vm.selected.adminCode = '';
                vm.selected.includeSubOrg = '';
            }
            var url = vm.getTargetReportURL();

            window.open(url, '_blank');
            setTimeout(function () {
                vm.close();
            }, 0);
        };

        vm.reset = function () {
            vm.selected = _.assign({}, vm.orgSelected);
            vm.selected.incentiveTypes = [];
        };

        vm.close = function () {
            try {
                $('#modalPopupMax0CloseButton', window.parent.parent.document).click();
            } catch (e) {
                $log.info('Cancel button is clicked but failed to dismiss BizCove. ' + e);
            }
        }

        vm.initReportMap = function () {
            if (CMS_REPORT_FILTER.REPORTNAME && CMS_REPORT_FILTER.REPORTNAME.length > 0) {
                var foundReportMap = _.find(vm.reportMap, function (item) {
                    if (item.name === CMS_REPORT_FILTER.REPORTNAME) {
                        return true;
                    } else {
                        return false;
                    }
                });

                if (foundReportMap) {
                    vm.report = foundReportMap;
                    if (foundReportMap.requestType && foundReportMap.requestType.length > 0) {
                        vm.copyItems(vm._requestTypes, foundReportMap.requestType);
                        if (vm._requestTypes.length == 1) {
                            vm.orgSelected.requestType = vm._requestTypes[0]
                        }
                    }

                    if (foundReportMap.dateLabel && foundReportMap.dateLabel.length > 0) {
                        vm.dateLabel = foundReportMap.dateLabel
                    }
                    
                    // Setting the allowable multi-select Incentive Options
                    if (CMS_REPORT_FILTER.REPORTNAME == 'CMS HR Incentives Time to Completion Report - SAM & LE' 
                        || CMS_REPORT_FILTER.REPORTNAME == "CMS HR Time to SAM/LE Report - Completed") {
                        vm._incentiveTypes = vm._incentiveTypes_SAM_LE;
                    } else if (CMS_REPORT_FILTER.REPORTNAME == "CMS HR Incentives PCA Report - Complete") {
                        vm._incentiveTypes = [];
                        vm.orgSelected.pcaType = vm._pcaTypes[0];
                    } else if (CMS_REPORT_FILTER.REPORTNAME == "CMS HR Incentives Time to Completion Report for PCA & PDP - Completed") {
                        vm._incentiveTypes = vm._incentiveTypes_PCA_PDP;
                    } else {
                        vm._incentiveTypes = vm._incentiveTypes_All;
                    }
                        
                    
                } else {
                    $log.info('No report found from report map. [' + CMS_REPORT_FILTER.REPORTNAME + ']');
                }
            }
        };

		vm.requestType_onChange = function() {
			console.log("requestType_onChange!!!!!!");
			if (vm.selected.requestType == "Recruitment") {
				vm.selected.appointmentType = "All";
			}
        }
        
        vm.getValidMember = function($event, model, groupName) {
            console.log('Model type [' + typeof model + '] - Typed [' + $($event.currentTarget).val() + ']' );
            if (typeof model == 'object' && $($event.currentTarget).val() == model.name) {
                console.log('Same');
                return model;
            } else {
                console.log('Not Object, or different name');
                return vm.group[groupName][0];
            }
        }        
        
        vm.onKeyDownComponent = function($event) {
            setTimeout(function() {
                var component = $('#selectComponent option:selected').text();
                var keyCode = $event.keyCode;
    
                if (component == 'By Admin Code' && keyCode == 9) {
                    $event.preventDefault();
                    setTimeout(function() {
                        $('#adminCodeInput').focus();
                    }, 0);
                } else if (component == 'By Request Number' && keyCode == 9) {
                    $event.preventDefault();
                    setTimeout(function() {
                        $('#requestNumberInput').focus();
                    }, 0);
                }
            }, 0);
        }

        vm.errorMessages = {
            'selectComponent': {
                'required': 'Select a value from the component filter'
            },
            'requestNumberInput': {
                'required': 'Type a request number for the report'
            },
            'adminCodeInput': {
                'required': 'Type an administrative code for the report',
                'minlength': 'Enter a minimum of three characters for the administrative code'
            },
            'dateRCompletedFromInput': {
                'required': 'Type the from date in the format MM/DD/YYYY for the request date range',
                'date': 'Type the date in the format: MM/DD/YYYY'
            },
            'dateRCompletedToInput': {
                'required': 'Type the end date in the format MM/DD/YYYY for the request date range',
                'date': 'Type the date in the format: MM/DD/YYYY'
            },
            'dayType': {
                'required': 'Select Business or Calendar Days'
            }
        }

        vm.getErrorMessage = function(which, $error) {
            var message = '';
            if (which != undefined && which && $error != undefined && $error) {
                var names = Object.getOwnPropertyNames($error);
                var count = names.length;
                for (var index = 0; index < count; index++) {
                    if ($error.hasOwnProperty(names[index]) && $error[names[index]] == true) {
                        message = vm.errorMessages[which][names[index]];
                        break;
                    }
                }
            }
            return message;
        }

        vm.addIncentiveType = function(value) {
            if (value == undefined) {
                return;
            }

            if (vm.selected.incentiveTypes == undefined) {
                vm.selected.incentiveTypes = [];
            }

            if (value == 'All') {
                vm.selected.incentiveTypes = [];
                vm.selected.incentiveType = 'All';
            } else {
                var index = _.findIndex(vm.selected.incentiveTypes, function(item) {
                    return item == value;
                });
    
                if (index == -1) {
                    vm.selected.incentiveTypes.push(value);
                }
            }
            setTimeout(function() {$scope.$apply();}, 0);
        }

        vm.removeIncentiveType = function(value) {
            console.log("removeIncentiveType [" + value + "]");

            if (value == undefined) {
                vm.selected.incentiveTypes = [];
            } else {
                var index = _.findIndex(vm.selected.incentiveTypes, function(item) {
                    return item == value;
                });
    
                if (index != -1) {
                    vm.selected.incentiveTypes.splice(index, 1);
                }
            }

            if (vm.selected.incentiveTypes.length == 0) {
                vm.selected.incentiveType = 'All';
            }
        }

        vm.getIncentiveTypeLabel = function(value) {
            console.log('getIncentiveTypeLabel - [' + value + ']');
            var foundItem = _.find(vm.incentiveTypes, function (item) {
                if (item.value === value) {
                    return true;
                } else {
                    return false;
                }
            });

            var label = value;
            if (foundItem != undefined && foundItem) {
                label = foundItem.key;
            }
            console.log('Found label - [' + label + ']')
            return label;
        }

        vm.$onInit = function () {
            $log.info('reportFilter $onInit');
            vm.isSection508User = Section508.isSection508User();

            // This should be called first.
            vm.initReportMap();
            vm.initUserGroups();
            vm.adjustBizCoveUI();

            vm.selected = _.assign({}, vm.orgSelected);

            vm.requestTypes = vm.getSelectizeOptions(vm._requestTypes);
            //vm.requestStatus = vm.getSelectizeOptions(vm._requestStatus);
            vm.appointmentTypes = vm.getSelectizeOptions(vm._appointmentTypes);
            vm.scheduleATypes = vm.getSelectizeOptions(vm._scheduleATypes);
            vm.volunteerTypes = vm.getSelectizeOptions(vm._volunteerTypes);
            vm.components = vm.getSelectizeOptions(vm._components);
            vm.includeSubOrgs = vm.getSelectizeOptions(vm._includeSubOrgs);
            
            vm.incentiveTypes = vm.getSelectizeOptionsEx(vm._incentiveTypes);
            vm.incentiveTypes.unshift({value: 'All', key: 'All'});

            vm.pcaTypes = vm.getSelectizeOptions(vm._pcaTypes);            
            vm.dayTypes = vm.getSelectizeOptions(vm._dayTypes); //#290605 - Business and Calendar Days filter 

            if (vm.isSection508User == true) {
                // #selectComponent is not processed yet. So, use setTimeout.
                setTimeout(function() {
                    $('#selectComponent').on('keydown', vm.onKeyDownComponent);
                }, 0);
            }

            setTimeout(function() {
                $('#reportFilterBody').attr('aria-busy', 'false');
                $('#reportFilterBody').removeClass('hidden');
                $('#selectComponent').focus(); 
            }, 100);
        };

        vm.$onDestroy = function () {
            $log.info('reportFilter $onDestroy');
        };
    }
})();


