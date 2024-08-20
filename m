Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E73C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 21:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F9D10E492;
	Tue, 20 Aug 2024 21:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Upmg73GC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC57010E492
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724187863; x=1755723863;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4vQDuw2ayNWXHm0MvgKEUnDVATatjibeQC3CaroRdI0=;
 b=Upmg73GCSVcls6E6S4RzOmTnM01jk3Qqxr/uAQh8aqIit3BRen+MD0z6
 NwYraaGJjhF5XlvcsVA1FXe/eRSdV6awFZWyYh9Cy2K4e0NadmnKAGcqA
 oO7tyH1RCCpgyyzfLxHrBLob3xdcIhKwGh7ANODtj3J6Wb+c/gey6FMhu
 Ny95H4BFUFJOY6ckKCLECz7KvDx4b4TQrmkSXOc7QrKLaL0CNLS1QsKQy
 J24RVZxt11G35E0GBPBJr79sHhW/roUkTo8HWlVvS//gFhX0cC0lNFTB3
 LN4yfyDucSg6gklBzyKTK4hGyr8uW/kOct/apXotDlQlmPYnLNiEl+nH0 Q==;
X-CSE-ConnectionGUID: P1XieazcQcaaedYeq/O7JQ==
X-CSE-MsgGUID: WYzK42WqSwWNk9rUdVSYMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="13118057"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="13118057"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 14:04:23 -0700
X-CSE-ConnectionGUID: 1NtEFqqBSAmCR+jCa7EebQ==
X-CSE-MsgGUID: stDij3A9TZudKfISL2tc3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60715488"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 14:04:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:04:21 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:04:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 14:04:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 14:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtFPndwzxOFBsy4ZwXgSx/9jqiNfZj6wF3plyejTkkUm0kS4FRgkq1j3Z8Gs5WpdSn4ad+UXRg8n6re29xa3pK5CHCo8ri6/XwfWakUsieKanZ73kcd8iMBmd8E447S6drq3zHD2YjOblDLqQHEVGiWx3pEu+fJK30RtoZbjKYxcbskN6XWeDC3KUxgmrAxEKG6mCXkR/PuNIZP4MJSp+qzHUMD+/YVMiEU7OEC/wH+msv27d6QovfnrjlvnYIaNrM3oWNzAPMrKg6UGrNF0ONwLuwXNOO1V+KqN4pleSsB6PSfbF0KHoq5JRoAvf+zyk/ACwiF6Ja5AG//UKu4bfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SD4GKBG4I7nvlXVzQN6aXDHI5E2UT8Bv4ZRFiQKDW/s=;
 b=n2idOuR58y7/kvFfQnEKjsvdkIs+/0Xz0UF/ehnJN2NwCwlcxpK/iJ4i84ltdX00ZOGqemkVU2O3G6iztNbdkjq5SbtUwzg8+UaQkVe2+pxBT53820dDZT+OwuWoygCIgX9ka61Yp3J/mILCwxWn/4vFaYwQuWjkYejenOg14SqHmxqmyaucnQ0yAWAi8iIRseHuFNNa6BQTcewFiJqai7uaUl/ytfWqSDEN1/2t42wKhJCUVFQrhhTUlXJ4pQuSmt/qnHhipUkYxvELbu4uoOm1CgZjX/5zVc5uP65f8xrW5vF+aTTbmnnnFwfZuk5lro9mXE4dw8tTuznsk2M/nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Tue, 20 Aug
 2024 21:04:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 21:04:19 +0000
Date: Tue, 20 Aug 2024 16:04:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/6] drm/xe: Set firmware state to loadable before
 registering guc_fini_hw
Message-ID: <uiteuditjvkmnlo4qpakcthio7eitszphyt2xxot6opp57p3ii@3g6s5lsfst5y>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
 <20240820172958.1095143-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240820172958.1095143-3-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:303:8f::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 8630c0dc-7da9-412a-1668-08dcc15ba85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y10ot3RovuJXRMuY8V6u2HVc5ArnlKwOv56Dw64oI21DnzDC3uNRT4JY3qNJ?=
 =?us-ascii?Q?lV4UutBB/Yc3cO22Dk1IFm2u5q583UtA/M5tvUyWrJPRZX1Tewkt3qWqhWFK?=
 =?us-ascii?Q?sQnW71ZZFbNhGcYfNzMqzzgdcfEiZ75GYms5B3PtlgjaalKdHnD7sJgB6aZk?=
 =?us-ascii?Q?pkA3SsUuvH899hKP7eTnW61vGSNo24YdXklkNCdYonfrW/9kd31uMgRT4x72?=
 =?us-ascii?Q?+iOQLMYPUc6xzwVHiNV/J1jHZS61oUc6ddeREot5w0ynkTf2JnH3/6sMHT/4?=
 =?us-ascii?Q?2wLem5tbxsQL9I+mUhRzf84Rd/DZ/XQlfAaZtS+2MiqPLvmjfDZngKgF2jzr?=
 =?us-ascii?Q?+2kLwzoxee4f8UeSGQz+61xcO/rUqancfw3x8trLhJdxckU0JlOUlRjQRT86?=
 =?us-ascii?Q?GAt8wAIZerfkoc3MDObNdLzRLYdTGVLyRj4fHy/WPSLoU6EfZ45Oykt8K3ue?=
 =?us-ascii?Q?Eg0Higa4G4qZW0f8v9LgQMsQNlTIip24k+I7mc1c4J0yhf09U1BlRtaYXfoP?=
 =?us-ascii?Q?Fee/QhdebjgnON6S0bJWNGJmZJma50SOxPbFmV0NivJjWXQZJIEk98Un9AxG?=
 =?us-ascii?Q?wVXUXAebkvDrKOasjzIOM8dqiTLAm0Hvq+ZejGcI51D0+i+DboFLOOobrfwb?=
 =?us-ascii?Q?VzphQ3ouw08QX6Nr/s28kUv5kw1Euj9H4otrPtU0fW+bju3WE2Ryiz07vgrE?=
 =?us-ascii?Q?8t+dRGINXnZ1y7Xyg+/w8caF+LOADFvc9RESoOgMzZQu1KoE0sMm8YJjJBLs?=
 =?us-ascii?Q?2pRYIalzsHD9HfILtdiJze4xPe+GcCUQ9kJScwKHauLPt/HZJm6JqRGFjFuB?=
 =?us-ascii?Q?57451YH03iSjAmCu7l1lBmbK8j39OIGu3Ha3VSfZt5ZmQNYz2MOL4Qwcr+Ms?=
 =?us-ascii?Q?O9kXU5DXPEM029Uj0tFH4TYGVHcpeRVpKyAnJGVv51MDRySoY776ghUfk/Mx?=
 =?us-ascii?Q?rxqlGEWWN5erPk7nafo47/ekq1ZL2jMl+mFEYZ1HF09AcSN0/7wGM7DvWf4x?=
 =?us-ascii?Q?CJqNCJt4HghfPIy/G3F7wKO/dc1X2tMpPFy/uVt9cKfNZIsfcb9PDcwaeP3O?=
 =?us-ascii?Q?8Myk2TRfDhxD7XP8Ud5e9EZlZnUFoz71c2g37LUfUww4tRKI02p64lhsvB0j?=
 =?us-ascii?Q?03HqN9CegqwK141llKwYE9/XwcP382KZlppg2c4aazscxzX7fP3Wg3VJF+LE?=
 =?us-ascii?Q?58q8Pf3k5L2UhilIKnqqwCjBcT6bZ7PRj1Cq04hd65dAnKFTZjWuw+UqNO/z?=
 =?us-ascii?Q?VSlXRe0Iy+sFGWrx8d0RiM+gBXTrQU1DxF5KIVFKaIGs9FC9UhCTJjefNYp4?=
 =?us-ascii?Q?+AkgGL9FYxStb/eoSEIIH6xv08aRoZYYmQyKwrzcl0xPdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?haScknZzLob1k2mkY2xzzQyrPcaw6z92sbtHdMMeE+HtGQejPFowmt823TtZ?=
 =?us-ascii?Q?n4oBL0ShQ+sCvhb5yGBiB0uhgguVlj5Kcup+8mICa7Dpil6+V2N4S8No264W?=
 =?us-ascii?Q?j+G0j5j/gDDE9P4aLM71d7x4543bQ5HEHoALu7bURoE5owK4sFljxawlcxM3?=
 =?us-ascii?Q?pkuzogv3iJSg7boNITUCz6zZqU53O1I525Qvzsmwq5Bc7O/t/S0li/JryeZ3?=
 =?us-ascii?Q?ktJnO/fsqoYeDqCmwZdp9SfVEyKvcJBJ5PSLBsKHi0W52gqhTXf0PXI8Hr0z?=
 =?us-ascii?Q?ZUe0NW6k69hYPZiRV/GMKaKQr/sOMSL6hajoChMxC6h5WgCyMTgGUujSv/OY?=
 =?us-ascii?Q?vm4kf8pxpZxeEJFrNezxMdhKbpRQl/YI3lyFBEScfKC1mpxoqBWSGboeOK7o?=
 =?us-ascii?Q?V0zy5IErfSHC5YMQEfGtNlLkKCExsKfZSXMfbCl5ekCo7s3votqi+lbGJ0zq?=
 =?us-ascii?Q?A8LTLotOA25pD3Yy2Db+TrQOJOWUjVGOYo2Sj+kbe8CcU1s0zcy0t3IZUyhT?=
 =?us-ascii?Q?uwbeCDvCZ42D56APHvOdJ/zuLbiQIP67NmgaRBF4v4OllcldxZ3kjnx5OihC?=
 =?us-ascii?Q?am6i3UEPXyvyN0vJOir6GIjeXx+mKujY4sgp0209WvY6Dwv5LPYBNyLAXsnL?=
 =?us-ascii?Q?hG6ddIXIvyixfu0ov3VZEK4bhQxVQuNnuFwp14oydmM6QtsfstK5STD7xWHZ?=
 =?us-ascii?Q?pcPshFpsVVwpLqYjHsAoPPymomGUcELppbQOYO5o/Kx7O0KYnqtTjjCY8+yY?=
 =?us-ascii?Q?/K1AaMBi9iFrZd8224MTHPFf3hoYV0bxpk25kwXT24ITX56GHmePOt32zFRG?=
 =?us-ascii?Q?w3YkX0U9ihQuItGUj4VqI3/t2eJJacbyNWGWrwDqvEKQn9g35aeBgTuoLPhw?=
 =?us-ascii?Q?OFeGLelB8jeIv7fQW67id/6yz3/wO4rFWaLj87zQhEvUuzXN7aHTpBIVO9+F?=
 =?us-ascii?Q?xHptK0wUta6qSh4yTZCgY1FTaJuR0nv5q11Pc8ljBZ7/9uwslC/0I7NXJcDu?=
 =?us-ascii?Q?piAWtYxS9a/mOLA4uee+qx3nWt6nLcP8wqFwRNil+X8iiM5EzODe4F0S+ZGr?=
 =?us-ascii?Q?04gQXJ9tdEQrPrGooGBk8ssYetUMihG6IEG1eOImCNcVAU1rZxRibL26zBHS?=
 =?us-ascii?Q?j4ZLCKoILdHAaFAa+AjWIQVzMydOb9hj1V7CFfAYBRfEA+a6XnuHFszwk7xi?=
 =?us-ascii?Q?MyfN8GX7vNHIfbSZddi/EUAIiu2j1UQ/jqSFZ+XU+9wlesRUGQTWupALaz+9?=
 =?us-ascii?Q?iGg3/lm+9zv7cZ3KBzK5tr7f+Ur0+xEdQTyz/Pkg6OeiT6YSA/nmAxMI2n7P?=
 =?us-ascii?Q?PnsD/PwQdZnS3YN4qFvpmLkT1qB9l0MBJJ7Shzub3Qr1UlO1CnGpYoUY74fk?=
 =?us-ascii?Q?NuXkro5Vfbug8OsglbC0yKEWE64tKd1GmB3P7KgovMc0h+T4cI336235i3mi?=
 =?us-ascii?Q?LgdrREDG/bWtG7pgfmHTDDBfXDiBpIAtD1Dz0zYjY60m+QdKOPBRw15SFY1D?=
 =?us-ascii?Q?jOoraEePZnWVU584l9eWTcz5i3ahWD64oq7gZ85GX9eRczTVyQDPByg59IVE?=
 =?us-ascii?Q?qrpPCyZZcu2S/fYlrVjRynkF0dve8fwIrjeacCgoWKxno6mwrcAxQ+6OayWj?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8630c0dc-7da9-412a-1668-08dcc15ba85f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:04:19.2575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9+MaUL6id0qOYHRPkXkvmnylkTlZFkAIlWRJNOjJDh+mejC0qYYc6O407fkcnMCWzLNtK0XOCIxGwNGrvVyz8A1b9JFozofVDCbwOGImZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 20, 2024 at 10:29:54AM GMT, Matthew Brost wrote:
>The guc_fini_hw registered calls __xe_uc_fw_status which is only
>expected to be called after initializing fw state. Move this before
>registering guc_fini_hw.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_guc.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index de0fe9e65746..52df28032a6f 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -350,6 +350,8 @@ int xe_guc_init(struct xe_guc *guc)
> 	if (ret)
> 		goto out;
>
>+	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>+
> 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
> 	if (ret)
> 		goto out;
>@@ -358,8 +360,6 @@ int xe_guc_init(struct xe_guc *guc)
>
> 	xe_guc_comm_init_early(guc);
>
>-	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>-
> 	return 0;
>
> out:
>-- 
>2.34.1
>
