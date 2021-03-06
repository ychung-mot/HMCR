USE HMR_DEV; -- uncomment appropriate instance
--USE HMR_TST;
--USE HMR_UAT;
--USE HMR_PRD;
GO

INSERT INTO HMR_SUBMISSION_STATUS 
	(STATUS_CODE, DESCRIPTION, LONG_DESCRIPTION, STATUS_TYPE, STAGE, CONCURRENCY_CONTROL_NUMBER, 
	APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_CREATE_USER_DIRECTORY,
	APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID, APP_LAST_UPDATE_USER_DIRECTORY)
	VALUES 
	('3P', 'Stage 3 – Validation in Progress', 'Indicates a submitted file has been received and is being checked against expected submission requirements corresponding to the selected report type.', 'F', 3, 1, 
	'sa', getutcdate(), '00000001-0000-0000-0000-000000000000', 'WIN AUTH',
	'sa', getutcdate(), '00000001-0000-0000-0000-000000000000', 'WIN AUTH');
GO
INSERT INTO HMR_SUBMISSION_STATUS 
	(STATUS_CODE, DESCRIPTION, LONG_DESCRIPTION, STATUS_TYPE, STAGE, CONCURRENCY_CONTROL_NUMBER, 
	APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_CREATE_USER_DIRECTORY,
	APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID, APP_LAST_UPDATE_USER_DIRECTORY)
	VALUES 
	('4P', 'Stage 4 – Validation in Progress', 'Indicates a submitted file has been received and is being checked against expected submission requirements corresponding to the selected report type.', 'F', 4, 1, 
	'sa', getutcdate(), '00000001-0000-0000-0000-000000000000', 'WIN AUTH',
	'sa', getutcdate(), '00000001-0000-0000-0000-000000000000', 'WIN AUTH');
GO
INSERT INTO HMR_SUBMISSION_STATUS 
	(STATUS_CODE, DESCRIPTION, LONG_DESCRIPTION, STATUS_TYPE, STAGE, CONCURRENCY_CONTROL_NUMBER, 
	APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_CREATE_USER_DIRECTORY,
	APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID, APP_LAST_UPDATE_USER_DIRECTORY)
	VALUES 
	('3E', 'Stage 3 - Service Area Error', 'Indicates a submitted file has been evaluated and conflicting values and/or conflicting service areas have been submitted. The file will need to be uploaded again after making required corrections.', 'R', 3, 1, 
	'sa', getutcdate(), '00000001-0000-0000-0000-000000000000', 'WIN AUTH',
	'sa', getutcdate(), '00000001-0000-0000-0000-000000000000', 'WIN AUTH');
GO
INSERT INTO HMR_SUBMISSION_STATUS 
	(STATUS_CODE, DESCRIPTION, LONG_DESCRIPTION, STATUS_TYPE, STAGE, CONCURRENCY_CONTROL_NUMBER, 
	APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_CREATE_USER_DIRECTORY,
	APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID, APP_LAST_UPDATE_USER_DIRECTORY)
	VALUES 
	('SW', 'Validation Successful with Warnings', 'Indicates a submitted file has been fully evaluated and the data meets submission requirements corresponding to the selected report type but also contains warnings based on system analysis of validation rules.', 'F', 5, 1, 
	'sa', getutcdate(), '00000001-0000-0000-0000-000000000000', 'WIN AUTH',
	'sa', getutcdate(), '00000001-0000-0000-0000-000000000000', 'WIN AUTH');
GO
UPDATE HMR_SUBMISSION_STATUS 
	SET DESCRIPTION = 'Stage 2 – Validation in Progress'
	, CONCURRENCY_CONTROL_NUMBER = CONCURRENCY_CONTROL_NUMBER + 1
	WHERE STATUS_CODE = 'DP'
GO
UPDATE HMR_SUBMISSION_STATUS 
	SET DESCRIPTION = 'Validation Successful'
	, CONCURRENCY_CONTROL_NUMBER = CONCURRENCY_CONTROL_NUMBER + 1
	WHERE STATUS_CODE = 'VS'
GO
