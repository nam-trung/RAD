USE [dbWarehouse]
GO
/****** Object:  Table [dbo].[Accountant]    Script Date: 5/12/2023 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accountant](
	[AccountantID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 5/12/2023 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Company] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 5/12/2023 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset](
	[AssetID] [int] IDENTITY(1,1) NOT NULL,
	[SerialID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UnitPrice] [numeric](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsDeliveryNotes]    Script Date: 5/12/2023 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsDeliveryNotes](
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[DateD] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsReceiveNotes]    Script Date: 5/12/2023 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsReceiveNotes](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[DateR] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Index]    Script Date: 5/12/2023 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Index](
	[SerialID] [int] IDENTITY(1,1) NOT NULL,
	[RFID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SerialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 5/12/2023 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/12/2023 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[BillingAddress] [nvarchar](max) NOT NULL,
	[OrderStatus] [nvarchar](25) NOT NULL,
	[PaymentMethod] [nvarchar](25) NOT NULL,
	[Total] [numeric](11, 2) NOT NULL,
	[Paid] [numeric](11, 2) NOT NULL,
	[AccountantID] [int] NOT NULL,
	[AgentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLineItem]    Script Date: 5/12/2023 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLineItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[AssetID] [int] NOT NULL,
	[NoteID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[ReceiptID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseStaff]    Script Date: 5/12/2023 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseStaff](
	[WSID] [int] IDENTITY(1,1) NOT NULL,
	[WSName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [core_asset_SerialID_a396608d_fk_core_index_SerialID] FOREIGN KEY([SerialID])
REFERENCES [dbo].[Index] ([SerialID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [core_asset_SerialID_a396608d_fk_core_index_SerialID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_AccountantID_5d6d953f_fk_Accountant_AccountantID] FOREIGN KEY([AccountantID])
REFERENCES [dbo].[Accountant] ([AccountantID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_AccountantID_5d6d953f_fk_Accountant_AccountantID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_AgentID_89c74c52_fk_Agent_AgentID] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([AgentID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_AgentID_89c74c52_fk_Agent_AgentID]
GO
ALTER TABLE [dbo].[OrderLineItem]  WITH CHECK ADD  CONSTRAINT [OrderLineItem_AssetID_8639afaf_fk_Asset_AssetID] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Asset] ([AssetID])
GO
ALTER TABLE [dbo].[OrderLineItem] CHECK CONSTRAINT [OrderLineItem_AssetID_8639afaf_fk_Asset_AssetID]
GO
ALTER TABLE [dbo].[OrderLineItem]  WITH CHECK ADD  CONSTRAINT [OrderLineItem_NoteID_82c5205c_fk_GoodsDeliveryNotes_NoteID] FOREIGN KEY([NoteID])
REFERENCES [dbo].[GoodsDeliveryNotes] ([NoteID])
GO
ALTER TABLE [dbo].[OrderLineItem] CHECK CONSTRAINT [OrderLineItem_NoteID_82c5205c_fk_GoodsDeliveryNotes_NoteID]
GO
ALTER TABLE [dbo].[OrderLineItem]  WITH CHECK ADD  CONSTRAINT [OrderLineItem_OrderID_0a535116_fk_Order_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderLineItem] CHECK CONSTRAINT [OrderLineItem_OrderID_0a535116_fk_Order_OrderID]
GO
ALTER TABLE [dbo].[OrderLineItem]  WITH CHECK ADD  CONSTRAINT [OrderLineItem_ReceiptID_19b3935e_fk_GoodsReceiveNotes_ReceiptID] FOREIGN KEY([ReceiptID])
REFERENCES [dbo].[GoodsReceiveNotes] ([ReceiptID])
GO
ALTER TABLE [dbo].[OrderLineItem] CHECK CONSTRAINT [OrderLineItem_ReceiptID_19b3935e_fk_GoodsReceiveNotes_ReceiptID]
GO
