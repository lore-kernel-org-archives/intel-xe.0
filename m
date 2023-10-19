Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30987CDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 19:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C0710E065;
	Thu, 19 Oct 2023 19:26:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DC310E065
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 19:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697743579; x=1729279579;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5cMveagh1/YXIara5FXoiFchhwgw1Z4zLLqk0j/t/k8=;
 b=SdVwC4gClZnRKTheXmfl3lZ4l8cf4oFNk9ZF46++c1l8bHXnwUh4mwKm
 ubVXmfRr6nyjKGK5Pcw2Ru9zuTdMQcOQkTI4EbutKBVwMlDtk66c8ctxB
 4v+AbKWX3Wk20KS0cjO6nPUpDGt9gKqxmzVCCihv9ULWCFTgZuhY5K1Yr
 69MgSfa+fBRU9jUn85dlYJ8JJrSREqqtYvlIhxXNPfglxmaXrq6hV6aUp
 +nUk4kGjp2YdRLu1jI/IVhkXYXkk72heE9Fmh90WJGejgy0SJd44x46ax
 A4ADwpaYLgyOM6ZSyzGGoGyYkFsCuH2lmOKgX9S8gv5DkK4IlDRCw07qj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="383563552"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="383563552"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 12:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="760760166"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="760760166"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 12:23:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 12:23:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 12:23:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 12:23:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 12:23:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRB+R/givPMNEn8ywooyocRwrzM2PRXrs0UBPlejEbMhO9pZ1bZM3y4zbxYSHKjGhFvHccGQ+tX0QttJjGcXxUGJRhcJ7gC644QyvnJksKQu2gExpNqjHwMcpLWjFUJXopVRtYG6RgrqLMuXGR/fJLiMalDTeHdzZecnO7r1rPCVPEY8wqqD0hjKOXfGz64nI7DVNUZEujjP6jVdRq57S2w3CURwObOIvbrInh9wBQ4ZEBRo5GoPLCaIHhVzxWMoi56/3kWLX1/OfzfSBjQZG4UCdBk8L2rcDkrlBDGy25RQitNTeW7T5Lsu8EoHdMhxpvWCgQsbM6lJDsC8XhLRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BMW6RC4KKOHsLtx1wgPJQDSHNVLq2jrKVZ3QNF2XGA=;
 b=XM9rFQHZkJU9zDpeaUG4IiRF7B7ODnYY51RwNMYWy2mnPnfx1KNgHXcogOni1A6Bs6wIJPfRJH+L5Q3mRvDzVid7aT1DU1ZTTMIDP+cJ0UBq+n/lMFEIsFfzl3Pd0obBj6e5XQ+Vfg++vwFCLW8nX0ceKLhjBM6OjVma6n4WiC36L47T/JETvh3I75yfrHbHe4zLUpt9yizMeUvmoDrQ5Y0hZ3GP+/JuZNgpqaV7QjvDN1Jtb0BoeGNy2OT2Na+onm1T+KCrsfYVI1QFH5btz45DKZUhMds/qNIBrfUF6NnkalLUG9OczcisLbN5FhvH56t4KJDIDGklxRPo3kk+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6984.namprd11.prod.outlook.com (2603:10b6:303:22e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 19:23:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 19:23:02 +0000
Date: Thu, 19 Oct 2023 19:21:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZTGBzMa1kLzwZGeJ@DUT025-TGLU.fm.intel.com>
References: <20231019173343.17987-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231019173343.17987-1-brian.welty@intel.com>
X-ClientProxiedBy: BYAPR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c24876-9596-4daf-f3c7-08dbd0d8d02d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4O9dRJ793zHWiwC9rLbl9rgl4ZtmaQBjt1sDtWx2AkE1QCwJzBckEKTtl56HEN6i9Akz+zILqr7ePHSNl0epyth8UoJOkOWwXklSL4POHtIzHW7JJ5OMNDU//dB4hdhG1wVZ2lebl/JwIMWllkRMdhjDWf0zR04GSX+SG9v3+3RO8CVEkCbJWHzACx+US+jLXBXLoPgUT8/pwsgH7xip0iwNt2VhAx/IJ/pw/y6Ar4VvMAboVBmPINTmWJMyGixc4mHma+elR+6mS5bf6w/4jCb2zSeYvobk/NMpxOk+QPXOqTLXVtzItIZvDGLIWjEnTxN7XToGhjHBBoV12krkVZgoKfofjgbElYPRfchxvCurIHH+wsainJnCBm0Xk8ngJE81TsI6N/LLgHAa3/D7z7NKFHvWqCMBQB9aCrUk5T7SmR78PGemMU4cDXX0l9TjOmEzczM33m9d7y9y5VHXNS43c75Y8EGsDeg3gG5ddPs9LtTaXH+sh02bS8XZdYa6/9rrqYvN3V605puwQjHSdkKwpQRO+DErwRJovlRA7I1S0jzONEXu0eagtUGTsN5I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(396003)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6666004)(478600001)(6512007)(6486002)(6506007)(82960400001)(38100700002)(86362001)(2906002)(316002)(66556008)(41300700001)(83380400001)(26005)(8676002)(5660300002)(4326008)(6862004)(8936002)(6636002)(44832011)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HEuPPbzpVfBp249r+Xov9sDJK7b2ImK96wzctBamNI3CNIO6ra5DnW9G040f?=
 =?us-ascii?Q?i7+yumEnH7Ckb4yxYkCp9nIPt2ZQl2vrGXrFoW72U6kxlEW1kRXc5Qe0jSGW?=
 =?us-ascii?Q?eB8EA2YRh+yHsiRoMEVv0hkyR9Y2sDbZY47x1Gdspdl34Q32RzvgEn6YaKZx?=
 =?us-ascii?Q?9IHDfLoMuKjdwc56B2SH3jG4qiEoLwZ7ozidM2A4wQpGMGaysov+Y2wc3bS7?=
 =?us-ascii?Q?zSJU5BSu+eRJCosRoR/m637JwDr15pGOreYK6n0BKrFQRHvleHuBOiIHGKYr?=
 =?us-ascii?Q?UEFltmdjQF2+JnHUvMGxxdH6WpCzUGNrRa/rT17bNw+PgutFXrLEsI/pE1QB?=
 =?us-ascii?Q?uxRES8xeXRPt/TzRC76Sj3wmjkxlN5/X3BP1ryM62TCabfInLRwbBP4kfb4E?=
 =?us-ascii?Q?k+T4bYAh7WG/WMjqV9IK1E7o93XlXj5J/nrsyt9xHrkJu1tAfKq3X2+9boyU?=
 =?us-ascii?Q?4XHBFWjhBAIfaqeoMqPvIA1++S7wVCTYFWqwMLQNUnwExNtJTwNtZ4Jp6tnu?=
 =?us-ascii?Q?E95gasrR/Ef4JM7Nzf7c35e324slYPSWvTgRxSvYyDnMMw9iQxWdmEP7YoXW?=
 =?us-ascii?Q?V2Id7/GRGFiG6y9loWETELQTJ492JDloX+CoIhhWe/HuKNyFLSXvbSnhBJIw?=
 =?us-ascii?Q?+0o1Uy83NM0q66cij8SrtiWVNRjEFz9KZqIU6Nx5oKLuGl7yP4RYnqTMu/oJ?=
 =?us-ascii?Q?CmcebEBaIt5OALg3L3m+ZCqivWVIriXlIifTy+4pNB8B7M4VVZARbBx+8NMO?=
 =?us-ascii?Q?SPxT0H8YPtL/gZaubhiri0lhBEcT9G4spE6zpJj/n8OnctPBSYplBe7I+u9+?=
 =?us-ascii?Q?utGPmysq0/e4TKCjjaf+AdzK7ernqAKpViZTaPW16juJqnKDPl9QcwqafNwu?=
 =?us-ascii?Q?lhalG+ejbeKR00Vp7SOC1N2kuEgMZJ7NfZsg4H5Jd+RYOfnQEkVHoqwMx0QF?=
 =?us-ascii?Q?nOU84TKm9s5AmwzVMcHQh6N2Zvg5E1oRxR7yoF3PRE5E1Y3Gh93BDfGP7dFS?=
 =?us-ascii?Q?B/h71y3UxUhhnH8Pv+Qetoxf5hCn1AVk+UVR+965InkAsHILOUiKwzsLbU9T?=
 =?us-ascii?Q?7N0FfeUPqRLTIKteNnmF/h0UQKc4IfG4QTDzt5MZpuLMjCax1cXJ53EjzdP4?=
 =?us-ascii?Q?0yhxup1WghQA7IxwoRKB+iWM/e3SnIb6L3uPIFBLqyFfzzhB98KMS1Xga6Z2?=
 =?us-ascii?Q?NZUEf5limhia1doDdrn2zJbfpFkP4G8J2Yg+f5C0u50ThSO2P7iGtprxI+PL?=
 =?us-ascii?Q?5WxfCp8OqdU9ADUDwhtYtog5qe5fuiApNUBfaulofHqS9/2OdRpsgWyBipHk?=
 =?us-ascii?Q?0VGrFCHzHvY8EMJhBi0SNASJPwnf+nyCKL/L2PX5WvPGRnKJ+V+o2vNeNaGN?=
 =?us-ascii?Q?kJQD31SJZ6MgGG0fWNJNHhUmg6ExyxzwNLLQtvljHIppRWb3L2tHhHMjHbAg?=
 =?us-ascii?Q?FK1lW/Ve3gvR6EdOjOmXIIp77dlKyy6gFfliye6AHE/U/7eLqKu4f02MtKX2?=
 =?us-ascii?Q?vCrV28ZCE93AC+QfTcnIbaR+QkOVKyQLKtJgEpc03nf9FjSY7CuNkzcuYDz4?=
 =?us-ascii?Q?Nmx0lCAyNty3HQwIZufPtsGhFZEJUBdZhDf23lGsebNrrCZpjGcySnUA+fEB?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c24876-9596-4daf-f3c7-08dbd0d8d02d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 19:23:02.8913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poL+8r28rBh+Hn+qv3ST08qkDiLBV6Tm/8kf+C3/RVIyM+E/wZuCDIrYhwN6IB/41tQWihq49eeAM4sy24IwlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6984
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Convert pagefaulting code to
 use drm_exec
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

On Thu, Oct 19, 2023 at 10:33:43AM -0700, Brian Welty wrote:
> Remove unneeded num_shared argument to xe_pf_begin().
> Per discussion w/ Matthew Brost, we request to preallocate 2 fence slots
> from xe_vm_prepare_vma() for binding and potential move.
> This should be hardcoded to 2, and not use tile_count which just happens
> to be correct on PVC platform.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index c0027982ab4c..2ec0db7a4b29 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -100,10 +100,11 @@ static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>  }
>  
>  static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
> -		       unsigned int num_shared, bool atomic, unsigned int id)
> +		       bool atomic, unsigned int id)
>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_vm *vm = xe_vma_vm(vma);
> +	unsigned int num_shared = 2; /* slots for bind + move */
>  	int err;
>  
>  	err = xe_vm_prepare_vma(exec, vma, num_shared);
> @@ -195,7 +196,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	/* Lock VM and BOs dma-resv */
>  	drm_exec_init(&exec, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		ret = xe_pf_begin(&exec, vma, xe->info.tile_count, atomic, tile->id);
> +		ret = xe_pf_begin(&exec, vma, atomic, tile->id);
>  		drm_exec_retry_on_contention(&exec);
>  		if (ret)
>  			goto unlock_dma_resv;
> @@ -525,7 +526,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  	/* Lock VM and BOs dma-resv */
>  	drm_exec_init(&exec, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		ret = xe_pf_begin(&exec, vma, xe->info.tile_count, true, tile->id);
> +		ret = xe_pf_begin(&exec, vma, true, tile->id);
>  		drm_exec_retry_on_contention(&exec);
>  		if (ret)
>  			break;
> -- 
> 2.38.0
> 
