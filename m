Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1CDC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 22:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841AC10E601;
	Tue, 16 Jan 2024 22:25:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300E010E601
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 22:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705443923; x=1736979923;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LMYcYTobybirvgNfqyt4BHMfnk5W8BXEYoZxbAbEFgI=;
 b=iLdPJ+8Z6IwUaLs+ujK0vhCAiSQ5XQfWjEDKIVCs2obflIKKLgBD/Lgm
 5yJlNXd+6lojsTQr+BRb38/wkcaLYqUNduyt5KyCmcqJz8EXC8uwLljx4
 jG/4vWBhgGVLhUnIZ6AhAGksWSGOtUCFEN/8NO6A4Se8Fo1CNv5t/xTyj
 TNoPVZUEIYy+HB4lJzNuM81i3iCDSJ9/EH0yEo3c5ny4d7D7rEXgn8tAc
 5J+3SyDgK98AE/ZPZ9oV9ExzHZxp8Rqkwf/u/MTr0R4Ymgw8QQhq/DANc
 5HV/y29FCmMpwcPR/q8iVcHr/EFImffqiRhMhk6tqf38y7myz/42eBGEF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399673204"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="399673204"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 14:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="1031140609"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="1031140609"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 14:25:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 14:25:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 14:25:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 14:25:21 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 14:25:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iX/RuHQJjQF4Qkkq6FAth3JEBCvU17Jqj6pRg3+o3i6a1/pYiBjE8Aq1AkDw4dAcn8vrcNo/c02Ipp9SQXp54soD60OPFDufBeO4zVGoQ3DW5gMI/I3uy6pZ6agUjacPeDoIEo52JjzH4WgMfHQIHAAhT7qPmtu7IlY4onRE8n/4ghQWHXKDyXaR/ZmK4QhimPk6wbPjASNUB290JYt1xyVGB7HV3hQ5p6OABq6R7vYd+sLbS1g3xTk85nYrpbvVQdJnv4S7Q22NQMBjeI0R4OIG1vUUe09ptviQhD6VxgG4KugTPQmTu1kAfq4VFQB+eEI1Xi1UpgYzo4xn2VlMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9wArdOOIeeEPuCZr/zgfjuJEghEObhHrIO8rs56rIU=;
 b=PSTbZF6W7ch3LWC4v2n9cTw6+zh6EFVgBiO/C2McjzyWwdvlVKaiwstoccsgQ2hGapR8sziEpq2sz64IjaYEbQbSon8+fxjVXxqfFTwnsmT6IyK+ojolb/p9kAC1hT3GKojI6Jvh9kNJUpvdaTbY573ciPW60sn1W+qibZ9b8R1wIsKl2XQAzjYJT7he6ZoL9R63cufwTohWL3uj2DOyE9emmZZWNwWKnDuTi0cfm5CL5nx04S9oFumnnNftbZ/aY3r4mJNAJYfM8Y1YJCoE8PvekbpRhG5xfBsoxzxySZsuOtymCCtGoi+Tjn9L5M7RCprVKhJnv/DmKlNr8oJpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Tue, 16 Jan
 2024 22:25:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Tue, 16 Jan 2024
 22:25:14 +0000
Date: Tue, 16 Jan 2024 16:25:12 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Cleanup CCS mode related code
Message-ID: <vyqdj7jwut56pord3gz37ncgajlobnqfumfshthfei3yzmyd2a@5wltdwata2t2>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
 <20231216214120.7394-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231216214120.7394-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: def00422-762c-4674-3a8c-08dc16e20287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9pPP2QiO1FCoqCl3mBS7cHeoJ38IHoz5wCVsds2MYWEXY7J1/GZcDAH1b30asSctKhMbH5xOpyFI2WIaVR+XfKKxb5x9ke2L9Ibj1oHfcVpUlFFByu8u9KE0v8QPdphRkQY7MZIHR5+4vwj+7o9Nq/bIAG2dKhkTPe9F1AUyZ/+WKKZu4CSsckhSAXt0yyTWAMaIsplPb1kpkwkWnvqirzuk2+2Spm8Lpul3ijF4K5q9tSxqrZZaRaiVVfSapKE2VtPE//eK46qF3Whp4X0Ig6ZfD9MGo7uK51y6CosTuSZHx/8lnghewASKa2IJRx56Xpg8bsELIQNOfwnSt5YIdaHHqbeDgDI/MxVMRSwHCY8BNzZsU87OLL+/C2Fv/olo7zR77yGKeGlaNyGoDOVxew4CI6VmDskEOn0BxTewnXZAcxbMgegv9IkmkTjHPefJspyi1do4BMfaG/Kx1/hQ36y10KabOluHMpUdLwYWrMrTeQq1RdRXa1YaazV2YWs1Ec+t1yYW1HueV+ij1+NG8gIqBk7pP0dmYMTHD7dAQVmYl9mJ1/9+mgbkfTLFYwhb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6506007)(6512007)(86362001)(26005)(9686003)(5660300002)(83380400001)(8676002)(6862004)(4326008)(33716001)(41300700001)(2906002)(8936002)(6486002)(66946007)(6636002)(478600001)(316002)(66556008)(66476007)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MkUNXED1n4Oyvq3DsoB+QrHqnl391Op7P7FEnDJqlWNSWPaVPcpMjG2P/BdM?=
 =?us-ascii?Q?OspzB/Yi39rOUxMwnb73ZCO7e7GBvl3kPzX7q5vF6jT4xzHQ2sUTOWc302c9?=
 =?us-ascii?Q?GYdHAgU3G38/sgDrAayc6WTokFdP+txgIIjxSTdCLpvl4wZfFaX0hWS4wlT/?=
 =?us-ascii?Q?B4FuhRlLJu/Xte0w7WWvR0jpQbPwJcnBf+eQhWjvRLbDXmGArcSHhmZdpsE4?=
 =?us-ascii?Q?/FI7/w3utYtwH2ppqqZ+rA+TfDQwPMcwkaWWtt0heHgG4f+HWlS1t+JNs+sA?=
 =?us-ascii?Q?5QjkLCGjkvrf/nmdLsGqOlOrIr5Wexzr+6MawzAC5ThCvBbKCz0RXDSlm2qX?=
 =?us-ascii?Q?9X5bHlcr+/o/EdNiIyDbBD8VyksxVGqpMNLmpKSVwLmtoWmtq/KzMzzE+Bw2?=
 =?us-ascii?Q?hIszchIlJGp2DyZBWECDas2x5bxzTmjj3vnM8voepduLF91kJr+HDczZ6gJf?=
 =?us-ascii?Q?9Hdo/1dX6I4utjtr98SeEbyP9Hu4njy69CArqCllQUO3pUh5BXnsbC92Z3DA?=
 =?us-ascii?Q?eDUShBCPObf+gfBRFYk+KXw6aeT+l2gHa/UoNQdIGa027WczQFtas5VSx8i6?=
 =?us-ascii?Q?SmgbaVic6p9WHzhMJK3D561tdhfvCw7HwJF9qH97dWzVRRX99cnKT5H3etxC?=
 =?us-ascii?Q?swxpmESJl0KioSES16uvRcSt6xzYEqmS2cVC+EsFjs2IvE+4TxsOzJ+TBCiE?=
 =?us-ascii?Q?pMVERcxFNeUsR2aqpzJ3JkshiY0tlw86x8ErjHUONkHEaeattBIa/vY21dhb?=
 =?us-ascii?Q?vAOsvIZ3dnk5xr1yIoKooNHwmlFNLeBfF4TrpkQ3O21SJbf8OFdPfr3nOZOV?=
 =?us-ascii?Q?ChIhUphx6WyJ+f5psQgyJ8kLdZgbM89x31NouTZ32UlTkzYjZ+SpJgj+pGJ9?=
 =?us-ascii?Q?GuKey0ZHowRxb9LA9gEQr1RjhI8J5YTsg4+wTT8djhIA27evHbK6WUFLqeMT?=
 =?us-ascii?Q?qPcywIIQOU33hxkfeslcgEZNxuLxO4qa9hbF4CEB0jJY2yJkeOQ0JBrQXH5i?=
 =?us-ascii?Q?29q4Sk2th2AueNMGGM/crGpgC0fQUDPQQHuauXD79wz8WeJgCUK/WCZ6Ve1c?=
 =?us-ascii?Q?1+HwELNCRMokOD0hCN6JZh4Vye8UMUHZZZDD0aefcYYyvELc7xKL5ojewVbI?=
 =?us-ascii?Q?R/HV//YjX1+6fvuQ281d2KOCHbWeJZDA+ycvpjOMi8rO2Fg/W2ZSXH9cF3VE?=
 =?us-ascii?Q?4oL0aRGbRzwWNDIcYE6AtJAcXsLnyNgyoh5G8g2Xs9qorkAtj5/yNJKs72+G?=
 =?us-ascii?Q?IwluC+tprZQbMeRuubcJqNGVcv+1UJhSmA2mGBVJUhfuGs1m1yoUPJYlEYu5?=
 =?us-ascii?Q?CztzUKAf29krR316CxjGjDzib5aQdNvydOBDh8BHdTCH80PD6WIthQ7Qry7W?=
 =?us-ascii?Q?34JVXx12JcbpRUn+FBl5gNJWr4o2TROJ04s6qwqwpPpuqDY2EVMaR/hX5sgc?=
 =?us-ascii?Q?Mwf4SBRQxpD+IDgGrY7W9+u1dsov11DBSax4noPPCr1Caa2Y3GsyBrfAvAcN?=
 =?us-ascii?Q?J7oXyQUNOxmKX4lQAF9XeYD4sCFcilRNKqEQePCIMkRJzGJuHnul5VdiPvqY?=
 =?us-ascii?Q?5w2c0jljN5vBWluO3CS4bTLLdQw4pgoWZAcJM2mVAe85gzWuqkXXwvJY+hKS?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: def00422-762c-4674-3a8c-08dc16e20287
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 22:25:14.2614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ONhtvlaXflnzBriJkkgSJHiADIwJZgfZ+TEIYX5TkxkVGevuCUK0KP96V+PMcHqxp4Z+EW0jVNEUQ8CezA8JOYMuA2FfAFnnt+XYWPmaGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Dec 16, 2023 at 01:41:16PM -0800, Niranjana Vishwanathapura wrote:
>Refactor some of the CCS mode related code to make it compliant
>with the coding guidelines.
>
>v2: Fix macro usage
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +-------
> drivers/gpu/drm/xe/xe_gt.c           |  4 +--
> drivers/gpu/drm/xe/xe_gt.h           |  2 --
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 45 ++++++++++++++++++++--------
> drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 12 ++------
> 5 files changed, 37 insertions(+), 38 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 1dd361046b5dc..2d9c004838437 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -386,18 +386,8 @@
> #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
> #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>
>-/*
>- * Total of 4 cslices, where each cslice is in the form:
>- *   [0-3]     CCS ID
>- *   [4-6]     RSVD
>- *   [7]       Disabled
>- */
> #define CCS_MODE				XE_REG(0x14804)
>-#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>-#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>-#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>-#define   CCS_MODE_CSLICE(cslice, ccs) \
>-	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>+#define   CCS_MODE_CSLICE_ASSIGNMENT		REG_GENMASK(2, 0)
>
> #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
> #define   FORCEWAKE_KERNEL			BIT(0)
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 3af2adec12956..342f82f245f39 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -462,7 +462,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
> 	/* Configure default CCS mode of 1 engine with all resources */
> 	if (xe_gt_ccs_mode_enabled(gt)) {
> 		gt->ccs_mode = 1;
>-		xe_gt_apply_ccs_mode(gt);
>+		xe_gt_ccs_mode_apply(gt);
> 	}
>
> 	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
>@@ -584,7 +584,7 @@ static int do_gt_restart(struct xe_gt *gt)
> 	}
>
> 	/* Get CCS mode in sync between sw/hw */
>-	xe_gt_apply_ccs_mode(gt);
>+	xe_gt_ccs_mode_apply(gt);
>
> 	return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index f3c780bd266dd..11265e851a811 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -17,8 +17,6 @@
> 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
> 			  xe_hw_engine_is_valid((hwe__)))
>
>-#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>-
> #ifdef CONFIG_FAULT_INJECTION
> extern struct fault_attr gt_reset_failure;
> static inline bool xe_fault_inject_gt_reset(void)
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index 529fc286cd06c..ee1065c44da7f 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -12,17 +12,38 @@
> #include "xe_gt_sysfs.h"
> #include "xe_mmio.h"
>
>-static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>+#define CCS_MODE_CSLICE_WIDTH		ilog2(CCS_MODE_CSLICE_ASSIGNMENT + 1)
>+#define CCS_MODE_CSLICE(cslice, ccs)	\
>+	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>+
>+#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)

if you are using this as argument to hweight32(), you actually don't
need it

num_ccs = hweight32(gt->info.engine_mask & XE_HW_ENGINE_CCS_MASK)

>+
>+/* Get CCS mode mask to disable all compute slices */
>+static u32 xe_gt_ccs_mode_disabled(struct xe_gt *gt)
> {
>-	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
>+	int i, num_slices = hweight32(gt->info.__engine_mask & XE_HW_ENGINE_CCS_MASK);

what's up with the use of __engine_mask here?

>+	u32 mode = 0;
>+
>+	for (i = 0; i < num_slices; i++)
>+		mode |= CCS_MODE_CSLICE(i, CCS_MODE_CSLICE_ASSIGNMENT);
>+
>+	return mode;
>+}
>+
>+void xe_gt_ccs_mode_apply(struct xe_gt *gt)
>+{
>+	u32 mode = xe_gt_ccs_mode_disabled(gt); /* disable all by default */
> 	int num_slices = hweight32(CCS_MASK(gt));
> 	struct xe_device *xe = gt_to_xe(gt);
>+	u32 num_engines = gt->ccs_mode;


this is a source of confusion I mentioned. Just above you do:

	mode = xe_gt_ccs_mode_disabled(gt)

in which "mode" refers to the register format. Then here you do:

	num_engines = gt->ccs_mode

so "ccs_mode" means something else. Am I misunderstanding anything or
gt->ccs_mode should be called something else?

> 	int width, cslice = 0;

cslice = 0, but still using num_slices rather than num_cslices. Similar
thing here:

         /*
          * Loop over all available slices and assign each a user engine.
				   ^^^^^^

Lucas De Marchi

> 	u32 config = 0;
>
>-	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>+	if (!num_engines)
>+		return;
>
>-	xe_assert(xe, num_engines && num_engines <= num_slices);
>+	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>+	xe_assert(xe, num_engines <= num_slices);
> 	xe_assert(xe, !(num_slices % num_engines));
>
> 	/*
>@@ -60,7 +81,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> 			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
> 				cslice++;
>
>-			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>+			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_ASSIGNMENT);
> 			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
> 			cslice++;
> 		}
>@@ -72,14 +93,6 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> 		   mode, config, num_engines, num_slices);
> }
>
>-void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>-{
>-	if (!gt->ccs_mode)
>-		return;
>-
>-	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
>-}
>-
> static ssize_t
> num_cslices_show(struct device *kdev,
> 		 struct device_attribute *attr, char *buf)
>@@ -189,3 +202,9 @@ void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
> 			 __func__, err);
> 	}
> }
>+
>+bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>+{
>+	/* Check if there are more than one compute engines available */
>+	return hweight32(CCS_MASK(gt)) > 1;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>index f39975aaaab0d..0dc191a59525c 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>@@ -6,19 +6,11 @@
> #ifndef _XE_GT_CCS_MODE_H_
> #define _XE_GT_CCS_MODE_H_
>
>-#include "xe_device_types.h"
>-#include "xe_gt.h"
> #include "xe_gt_types.h"
>-#include "xe_platform_types.h"
>
>-void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>+void xe_gt_ccs_mode_apply(struct xe_gt *gt);
> void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>-
>-static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>-{
>-	/* Check if there are more than one compute engines available */
>-	return hweight32(CCS_MASK(gt)) > 1;
>-}
>+bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt);
>
> #endif
>
>-- 
>2.43.0
>
