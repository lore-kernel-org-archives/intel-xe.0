Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB37BC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 13:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5655810EBF9;
	Fri, 12 Apr 2024 13:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/3AFPjV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA7610EBF9
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712927346; x=1744463346;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+zB2EiLBIv5QoH9MUUPJyvfXQPpojs5zswgOvK1u2bE=;
 b=n/3AFPjVJPpDBFsioPkIExytqHcLtZSAG1QEWzMswDSL8dqwjkbyEd2+
 HHDPiOKmX7qY50TGW63mSqKerXLRjSOKqul40S97uu+rNdfI2jnTA65fs
 /zLsf6zP77vSf6yKLvjJGii+y5gujMO2cE2///PUeuIExURQxT55gVkkc
 i1mey+JlW4cpShGfdfhTH9bOkYswBc23GBPSfL8ZxzwKbaUevNrLG0+HK
 ib8sWb+SOboYHqwdv7lQU+/eMyQFIp1JoTReA/UmxT3c540etZZlCTbVq
 XCGMDFm9cGZgu8eiy6xZvM2lyopiDtPtIplquHG+kh8TDZj4uJJOW7OmL Q==;
X-CSE-ConnectionGUID: SfFGb/vJRh6xJC8Cwl809w==
X-CSE-MsgGUID: z/pcTBfHQkKOZRpFXaQY+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12230830"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="12230830"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 06:09:05 -0700
X-CSE-ConnectionGUID: MKvk0rQ9T8S86slhnjXl5g==
X-CSE-MsgGUID: L1DiTXocQcy2zAKGU19k/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="26037486"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 06:09:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 06:09:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 06:09:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 06:09:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 06:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jivy0OXsjQFEo9L49SfIEQqikfaMufbZbrImxg4IwOAV/g3n/k3QKuXm50hgrQHlmB0vQtxEMNSHD5doHdKFQlt0H9UvzEb5qziQCaF1JciNTvSTrLaBj8Fy5ovPM+vKct74Z5EBKinBXv3rKxC8E4Rvj7U82nBZFR5u2PcTsz6D4JIZi2GQQfX426rsmxAxZJzC87xZCgPZkaf886ZHfWfgzBypOz8P16wxdP3Y8HhQRJ0DjOWMzxd1CPf5TTOwXjBCqTJtR8eawG2ec1MKDu9VNr2Oa1+QTKJo0+dHtUfQ8C1R+Q7SN/+JPSl7X9EWPPOBdGSFobWR3OAv+XGBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AI2sp/QozHw2JRXZBJ9hWtPanr4xjAMpdA31gcaM6Q=;
 b=PSt7Aqeerbz2GXddkXOEl13Ns/qpuJMhyBI+Tvh0tKsI3aBMi9BrIlXlmxYwl7H8zJ7j4n2vCRz+OV8GSm98l+MR3mmz6PcXKYcbOHnTzPr2tKdGs+MT1Yn1Mrkf3aR5GktV07XvJkM8lkI74aCfn4IwipSjyTd3it7+lnjy8dtwzh+jXLFBzfYLMDH/x0vyA7ZN338FbQ5JA3rDdmeLIpZ92YhVJ17SqgDDnTNbkuhMnjzDAa0rcaWa7+MimNoPK2N88fJ/LClft3gO5QPHoLOjIdyZ0dnXJzJ3EL7Xy4a3fOvQM9En29G+2wDjYb5rbaEsDU/ZKBqyh3awwVEpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7497.namprd11.prod.outlook.com (2603:10b6:510:270::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 12 Apr
 2024 13:09:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 13:09:02 +0000
Date: Fri, 12 Apr 2024 08:09:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v3 2/7] drm/xe: Incase of action add failure, remove
 sysfs only once
Message-ID: <feu33jam6y6vt3bstv55iqjlrn4ene4gnwbbkaa3qkbe5tbwg2@ngcykzglygfs>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240412080245.1044902-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b7fee9-81f2-4a60-0a03-08dc5af1b94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: usZ45fvNfNfuryuKNyz4uoFDpSzUvZZp8E/F8P7bsmWf51NbWs2HC1Q0iYSABve4BRx9rM/B+Arlk024KNQgxLrMEioWDj2gZZ3N1+THaLQeHkZmA9KM+xFbtLvbRjV1FxN7zIFwBN8R6xPgQ94a3pxocvt6aLb7Wl90bEi/Tf8ZRsSbmppA3hkOCnTS/PmrbzmD7TrjeR1P78N56cIJcXDta1t2DeSPj2hE+iY75BKyWVKath7PvOSGFGYcz9S2BpI68b7/o5FKtU7KZmCGUdHSG7s+rmjtGvwFUsOp03TztjsXEJyUwq7hF3iYUdeoMIboF98hgS89tGoeTYLfAAIAs49e+SjoPSv4gYjVtgVMZ2vsMUwgaW4IOkIFMUZ0yrjzV5DXjPBV0rw4DePF9f+4kCgM/T4HAV1r/ffUzCHeT+iUcLRvaL/FkH0Kapn6DKySGsIcwvq7v0tdJ4zqdI8vezBes1ATMyB5H3GpNN3x2xKEe8CajGP/wkJmA9YI9NNrePXLfw+5aLbEObHKUPpOF2Q3T+mAKLjmrEMZQEo+aRb/m4w4+XB7dMYwr0c++P94tv5R155GdRcEYISeYvxDUfyNST0C5BPZH41WzyJ/txsIEfufDRRXljy7YRa2e4M300hMEb1pLBWbYX/Q/i1hYfjGYL9X9TAKKvCR02AWfkRFVIg9pIj74CLOossrQ3W3/udnYxGU0b8To4skTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zmnGx1OdPEtrHuSDCFSo8vKDoaOE3WJc1F+mYqjV3WYwgUvWcMxlWN7caqAl?=
 =?us-ascii?Q?4M4/iVU8WXLLl3XideMG+XmNaVi6gp5FAzbNtKklRIyIYu9CqtQwcTDIlAV2?=
 =?us-ascii?Q?LT1x4ZXYQHZ3+XNYs79+9Nz3Nxu3ZukZ9EpPulfPxd42SeQC1UL4lfvjjFVr?=
 =?us-ascii?Q?fWbtbILPHArJeDps0XB8MmcDXlJ5J7hyHOvI+rXMwrVSS/3Rkbji35jzrPdT?=
 =?us-ascii?Q?7G4kuyHz8hyVgwufsxUfisRK3foLUR/EjQqmN3w4Kx1aKOZmKgCGltK1Kp6v?=
 =?us-ascii?Q?yoUfK22tksha+nODziZTjX/KS8oA+YxRjIDWaGvfQGDkFvUnoXJzaDcMCcIf?=
 =?us-ascii?Q?NGq23kK8NGlrQt6CCnihfGIow4rdkSGNpKXgLHsbwrUz3ufZX5FGtYUxV3ir?=
 =?us-ascii?Q?ROIM+1nOk9/kVFQlFTNztwNN0SOieF7/Rae0FFmCbAuKKEuR49P+zvb1bug/?=
 =?us-ascii?Q?ESwGeUEFvuLgL7x8ZDvGpdWAPlVZHdOIb7tqwl2My+W2iyfLDupX2cOUJAM0?=
 =?us-ascii?Q?TuDS24tIRn6mpmXeTKdQiK4HdE1HK4vligIMtIgVxSG/6OgGIUbX13z4J3cS?=
 =?us-ascii?Q?l7aqJ/75Gis6T4eD/q83wJMxLNCubik7DIUX0F1CqPUMltUyR1098o1SlIIU?=
 =?us-ascii?Q?iMZQKvOfikXgGgaIm12L0qWQ38ZFQVMokguKl/TiMD/TLyJDdd9RqD26N9yN?=
 =?us-ascii?Q?c5MlKII1byTNrWGtcbW8jca+Guacg6nquCby6Za1fqW8OXChyy/juVC1sFIm?=
 =?us-ascii?Q?R7S7ppUHQCgeyyPZKMP2y7SVtE47JLOymOXOHOu1/F0BUIWi7k767VWFFflz?=
 =?us-ascii?Q?3dbwCOZo7mqcD3dWMSO58dMVrAtsD8vpmN7QDSF6PQr25w4DhvYt6K1D8v0n?=
 =?us-ascii?Q?fVn2ZkqAyHO4MUE7UMo56btZ2izGKooNahD1XCxZPsHW7c1oOT8FLRq796NH?=
 =?us-ascii?Q?1J9a7D1VRa6XzS9+RGR8iBoIRCFWCqxUadU/njWX+IStQlqei9BGUI7btbkL?=
 =?us-ascii?Q?Rg2iEVwkb6fbG2VR1MaNK0ZxxaploDhhn/ad4c5Ea7fRMj++ykWdxA/YPBTb?=
 =?us-ascii?Q?pAO5mJ/O+6O8eDfS63t2PbpuT0u+KhQVPC6NYkEhqDNMU/skPZi4XkkPkkc7?=
 =?us-ascii?Q?8M9eIzhagmnJSvGa4rTcCHM+mXgRTlKJ4B1rIyog/iqeC/dhBGaNMbM7UMp/?=
 =?us-ascii?Q?RASJOv6N0rGurogmJRoeAlM78sZEf0u06NCehNOODmwWwwSM4gR4QWy/pcWv?=
 =?us-ascii?Q?GaEV7951vSFgnUR5XzF+50zrZDNtguqGpiBuns3xfu7xlE3EEU+np1fZQalr?=
 =?us-ascii?Q?mqIZaL3ZYNjUDyF44thGpmnB04UsH0fTF+1Z/lh9iw3cosP9EEnsl9p6f2lM?=
 =?us-ascii?Q?6u0ZgE8xdc28X/cQTrRe2ikVXVxq1HqGebu3ft+AA0gDW238KSDHTemFB6uV?=
 =?us-ascii?Q?GThGY3dZuiTdZWByomcLxE8OteXTMrJd0xrGmQuCnM2klHmVpcSjzF/qWp3n?=
 =?us-ascii?Q?kRS1mnD3AVhsRECBO51l3FQADzyk7XmMdOWotSuxHUNQ71o32snAcLmh7S6U?=
 =?us-ascii?Q?QxOxTOZ3BKCnRFlBDfX7p5fgb9kHxqtm4Km7ArbVYklCYYeZ9jOBdtT2+os8?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b7fee9-81f2-4a60-0a03-08dc5af1b94a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 13:09:02.3229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0ScVUte1Y8+M9IrLgKkwPFQG0QMWF4TAkBE+LeyPQ1GFWbQKUNNfrcd+e1fsS6sXgegVahrXWedjpGxUpMiYhHPDkbL0NbB8tzjDHWvMm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7497
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

On Fri, Apr 12, 2024 at 01:32:40PM +0530, Himal Prasad Ghimiray wrote:
>The drmm_add_action_or_reset function automatically invokes the action
>(sysfs removal) in the event of a failure; therefore, there's no
>necessity to call it within the return check.
>
>Modify the return type of xe_gt_ccs_mode_sysfs_init to int, allowing the
>caller to pass errors up the call chain. Should sysfs creation or
>drmm_add_action_or_reset fail, error propagation will prompt a driver
>load abort.
>
>Fixes: f3bc5bb4d53d ("drm/xe: Allow userspace to configure CCS mode")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c          |  5 ++++-
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 17 +++++++----------
> drivers/gpu/drm/xe/xe_gt_ccs_mode.h |  2 +-
> 3 files changed, 12 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 2421a8d34324..dca0e9fb3315 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -379,7 +379,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 			 err);
>
> 	/* Initialize CCS mode sysfs after early initialization of HW engines */
>-	xe_gt_ccs_mode_sysfs_init(gt);
>+	err = xe_gt_ccs_mode_sysfs_init(gt);
>+	if (err)
>+		goto err_gt_sysfs_create;
>
> 	/*
> 	 * Stash hardware-reported version.  Since this register does not exist
>@@ -395,6 +397,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>
> err_force_wake:
> 	dump_pat_on_error(gt);
>+err_gt_sysfs_create:
> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);

gt_fw_domain_init() is a mess: this function is not really about
gt_fw_domain_init() and the error unwinding is wrong. But let's not add
to it.

this jump here in the middle, leaving dump_pat_on_error() out doesn't
seem good as it breaks the unwind orde. Let's just jump to err_force_wake
and clean it up further later?

otherwise, lgtm.

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> err_hw_fence_irq:
> 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index 529fc286cd06..67a5bd71770d 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -167,25 +167,22 @@ static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
>  * and it is expected that there are no open drm clients while doing so.
>  * The number of available compute slices is exposed to user through a per-gt
>  * 'num_cslices' sysfs interface.
>+ *
>+ * Returns: Returns error value for failure and 0 for success.
>  */
>-void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>+int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
> 	int err;
>
> 	if (!xe_gt_ccs_mode_enabled(gt))
>-		return;
>+		return 0;
>
> 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
> 	if (err) {
>-		drm_warn(&xe->drm, "Sysfs creation for ccs_mode failed err: %d\n", err);
>-		return;
>+		drm_err(&xe->drm, "Sysfs creation for ccs_mode failed err: %d\n", err);
>+		return err;
> 	}
>
>-	err = drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
>-	if (err) {
>-		sysfs_remove_files(gt->sysfs, gt_ccs_mode_attrs);
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>-	}
>+	return drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>index f39975aaaab0..f8779852cf0d 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>@@ -12,7 +12,7 @@
> #include "xe_platform_types.h"
>
> void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>-void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>+int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>
> static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
> {
>-- 
>2.25.1
>
