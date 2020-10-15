USE HMR_DEV; -- uncomment appropriate instance
--USE HMR_TST;
--USE HMR_UAT;
--USE HMR_PRD;
GO

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_CODE_RULE_ID], [ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
           (0, '','Default','DEFAULT',0)
GO

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
           ('ROAD_LENGTH','Not Applicable','NOT_APPLICABLE',1)
GO

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
           ('ROAD_LENGTH',N'[Qty] ≤ [TBD Application Rate] * [Lane KM]','RATE_LANE_KM',2)
GO

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
           ('ROAD_LENGTH',N'[Qty] ≤ [2.0] * [Lane KM] * [3.5]','RATE_LANE_KM_35',3)
GO

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
           ('ROAD_LENGTH',N'[Qty] ≤ [3.0] * [Lane KM] * [6.0]','RATE_LANE_KM_60', 4)
GO

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Lane KM * 1000.0] * [3.5]','LANE_METERS_35',5)
GO 

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Road KM Non-Paved]','ROAD_KM_NONPAVED',6)
GO 

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Lane KM Paved] * 2.0','LANE_KM_PAVED_20',7)
GO 

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Road KM] * 2.0','ROAD_KM_20',8)
GO 

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Road KM * 1000.0] * 2.0','ROAD_METERS_20',9)
GO 

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Road KM] * 2.0','ROAD_KM_20',10)
GO 

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Road KM]','ROAD_KM',11)
GO 

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Road KM * 1000.0]','ROAD_METERS',12)
GO 

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Lane KM]','LANE_KM',13)
GO 

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Lane KM * 1000.0]','LANE_METERS',14)
GO 

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_LENGTH',N'[Qty] ≤ [Barrier Length * 1000.0]','BARRIER_LEN_METERS',15)
GO 



INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('SURFACE_TYPE','Not Applicable','NOT_APPLICABLE',1)
GO
INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('SURFACE_TYPE','GPS on Paved Surface/within 100m of Structure','GPS_PAVED_STRUCTURE',2)
GO
INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('SURFACE_TYPE','GPS on Paved Surface','GPS_PAVED_SURFACE',3)
GO
INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('SURFACE_TYPE','GPS on Non-Paved Surface','GPS_NON_PAVED_SURFACE',4)
GO

INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_CLASS','Not Applicable','NOT_APPLICABLE',1)
GO
INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_CLASS','Class 8 or F Only','CLASS_8_OR_F',2)
GO
INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_CLASS','Not Class 8 or F','NOT_CLASS_8_OR_F',3)
GO
INSERT INTO [dbo].[HMR_ACTIVITY_CODE_RULE]
           ([ACTIVITY_RULE_SET],[ACTIVITY_RULE_NAME],[ACTIVITY_RULE_EXEC_NAME],[DISPLAY_ORDER])
     VALUES
			('ROAD_CLASS','All Classes','ALL_CLASSES',4)
GO