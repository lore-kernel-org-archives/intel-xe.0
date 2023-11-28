Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C95C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 18:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7088110E171;
	Tue, 28 Nov 2023 18:35:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCF310E171
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 18:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701196547; x=1732732547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=88kzoVCMNMNYB26XxYcmpyA7Y/ldsDgQlZJgEFTLO4Y=;
 b=iSDVGTMnz4p0rwp+JKWOpltIPtGkKlGcVt451xjj9wHuA7uRPD1EbDY+
 XZsNnJdQqS+ZpitY8TXLgXwipALJF9JMvpKIHmE5jbG0/PTO09qEul3FZ
 4aF/2LNDaCKkfzIUNES9BTYuw/vprhrfAnhg06MICvi4Xxzp3HX8b6bFt
 PaUk9Sjsa+6BVmNHRgUMo1+x4iqttYsKrDKdMfl348d3VjCeGlNIDRKDd
 IsyC4oV/RsxMPKyUXh0lVFd6YpYCR0LYPnIw2vasMSNG/fZwJRjgryAqX
 8qCjfC8ef9BnZgIZhhbVwbHRkiCNAVWP8ek8Jm2ftwoKN+s+hp5En+t9N Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="14553137"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="14553137"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 10:35:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="942022129"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="942022129"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 10:35:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:35:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 10:35:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 10:35:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCQVsXI5V0kHwHAO5stU690gKcYAMq2Gfb/dq1iRNgdDAg0+lxRE2XSdreo1SCUeWfJnXHJDGleKaDNwrG07y1mWgZ5M0s2bbzeG9Mo8qQqQFqSeXKcnu/BlrmIqOW/5cPsDT3utlJBP6f/vD5Y7IFQshsOU25LK2nRefmt52XpeyCyYKSVimom56jM/GTk6TEKQamP213BFFNNyaDTgYAXfYYO8URMJlry6zHnbRH5ellp9bfZloNAMxeCuyYxoeyjzNltZrPXkXR1WXqNUff6+IrwclCVenTtiecUhVEQ0GECltb9115ZD7bHCysayfGlqpuOrhS8azl3iE8OZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb8qqni9nN0VcKe2gFBe9V/uwGnWgXwuDnVtmJZHLMM=;
 b=X2Zxfn0hL44QGXPQQhGLfRdMS2L0xXmcleSrcn0EpVdmJHUNDAM1vqWMInOrNRYRlEi/hlK046EBxKOC7TD4gmDVqAxTkaJUp89I/dXnn32WjF1mcTfsW8SHuQMLXgRSNOa0gk3hncOympZPR3mbDdcj9A6VSeKL7PN9sqoVWh1AdCNK6hS/1f/MJtdg1X1Xf3QhV1zU4R2f7yR3K8MkcXAvr5E6lfhFUCcKgruskZBQsp0ds84FATpF2MKkfOBbfx1OYdsyF/4n/eOiZX7eimphwyFbU4Mx88LgiALZnctC+nDaWi1WCDsqkycM06ss2RyaFQEh8zoUezXdbdeSNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 18:35:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 18:35:38 +0000
Date: Tue, 28 Nov 2023 11:34:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZWXQLUsj9PMbs8zc@DUT025-TGLU.fm.intel.com>
References: <20231128175559.21326-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128175559.21326-1-brian.welty@intel.com>
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef6d47d-40df-4d68-7d59-08dbf040d104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4JqZ5q1L5nm9wWxOhLMyCSulsB+FG97nqBz54hiubcorGpFzoiN23KVmwooYuMdMXgoSw9u+Id8miW7ituw9v075bqFIGRDMaXLPMbXYMZAWbLXfN2cBj4Dppke5aymCYZTW8JkZbO4exKSzK2SyfC2GGOxw2ozi2qdtATVqrQtDXxW/McD0tJ5JAGkF78xhp87Lm/jLtgas5xFmXshnyljLJADEdP/XGDZD3CKqN/M2ScaaPOfxD3Q9x+KNBcd3mSC7CGMC/CicmeajEhYRK0hPk8zFfP0/kkqBDt8FXTmCF8noo4CznwnNdDw1UOQZBUL15ySjAThCqF0c6lI83Z47WNem7OSU46xNyrUtUmqllVa+6G2YkdJc6Qvy8t0UzFf/v5yLpBt6niINKJjqyY865WHzoCivosXknN28bj+bOyEjH3RbDcmqYluIAeyrAkn0HtY7eaLxBGQrtPtidaVvq7iAix48wrzn1c/Dlzf+LamesjBmfO2Mh0GHJgweMfXxZQE+ud8Hvl4kW1ie0BRM1DX/vHCyE7KFiLtolZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66476007)(66556008)(66946007)(8676002)(6636002)(316002)(6862004)(8936002)(4326008)(44832011)(83380400001)(2906002)(38100700002)(6486002)(966005)(6512007)(478600001)(6666004)(86362001)(6506007)(41300700001)(82960400001)(5660300002)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OpFL4FtNflKJUZLASfzHOnn/XyooWBlKg8wOvCx9+AN8YJVcd+oUzPBXsOfA?=
 =?us-ascii?Q?umzj35uMMVx7XPjjQKHbImxvGikPYP5cw0xtXf96V+NHdDG/h9Th4mG27+T4?=
 =?us-ascii?Q?GuCCriPz74H3tpHgRqRS0TbnOyYz2FI2qZSXQy+1SxTT0lRJbrSfjaPaM7j9?=
 =?us-ascii?Q?C2UEdJ5eWt5LebFplgUmZk9tVMbncvGxR7fQDxzRxMwV1VFB5NTZkkYJoXda?=
 =?us-ascii?Q?32lupcivNjEY9SSYlcHhi5oAbKGZeOeZKNaN8g1IgauvVAhWE7NiM1rt78an?=
 =?us-ascii?Q?O97s8XeQtItnot16fcof1KbdPhVInE2Hfz81PSqgz9DhHjanQxbO35eyLa4o?=
 =?us-ascii?Q?3AIu1Us45W7P9JaHteZuwf35NJo7iwg/4zgXV8sbMVoGqR5MfxluxsqmJMo3?=
 =?us-ascii?Q?TW6B1Bho/QTDgt2lTRLFT1l3Uvq+r7JOkeWvjFGri7vNVYyJcj3h6a0XvukD?=
 =?us-ascii?Q?sJqwKGNTbVQ6D4xuqQiN/JNz7ZBGOElVumxGZt/ccy+XjooPdZeDpG+G3wbq?=
 =?us-ascii?Q?DiklnvklvLF/+xbPO98J1rrdGcZ1aqzDfk3Zn1/IrE5mIk+85QQS7R9mzwN0?=
 =?us-ascii?Q?JMBxe1vidmDkblr3G3KKTk9aggTSrNA6nknRzRRVN1cAuS6TTH+1kVnO6lEu?=
 =?us-ascii?Q?TLJ6yW4ROh5BArbQcq1P4W58zFpAI0uhNDn7Nu9O18KKqz/6fvlz3lbAYRat?=
 =?us-ascii?Q?yU1Zm5jYWDiKwp5XI8BhaghqKFmNbaP/35d7z+v0r2HbuqIN6M1qLjJWwjdr?=
 =?us-ascii?Q?t0hciMR0Bop17R5AMFmSJ+mnpDe28MJSq7MKuTzSBcxdcoDF0+4Uk+2vFmik?=
 =?us-ascii?Q?n4aAUeqAEwiIDA8Ai7YXAYtqBkdqTVSseiPpu/qvwLMK02KEHDaYbCUmTJ+a?=
 =?us-ascii?Q?lB/TXXPAsYQy8c77jcMsJGnRi+AU3MVbCOEWn2vyKiI9ohFP1gcg/iFNZDez?=
 =?us-ascii?Q?iMUqEV1yWy6ItFAOWUYMoNd2f7oc17BwmsU3C3YH2n/kUY1w6c5ZlmyjsJcJ?=
 =?us-ascii?Q?KELVMLPENRZkJmnIhOFWqyTJChyCnS3KNPR/0LDnQboyjMjttdDGuWWm6wDL?=
 =?us-ascii?Q?lMcXyavsKxv6OIlj7YKZEyDPuLeF7nOAHGntTS8zG9cniHZzBmzHEFZTOVR0?=
 =?us-ascii?Q?3X9FQCLyvm+4A78PaiXsOnPxBk5xSDCEGiKJxmLY5S5YQ2zvQV1CDAsdhZtE?=
 =?us-ascii?Q?M2sBJCC2+IfjsRvFQVo2EErsbfI+bCsLp3BV8FIbkQd7PeHXXyW+ijl2/d0t?=
 =?us-ascii?Q?V3VfZr1dyjnVWhpH4ILB8CcshB3H3zrn/gGkdUIzU6gvYuZ4LZA8KbHINuTl?=
 =?us-ascii?Q?riBRCpg21X9Q3Io99nW9+5N/xsdE8f/uYvs9xLhs5PZfA2bedGVirrptaZCC?=
 =?us-ascii?Q?N3KWKNOg1pjjLLGNMCwebGsH1fBc2OvaS9H6XGIlN5I6TqB/Q+ZA0RWDAJKa?=
 =?us-ascii?Q?PYzgPrlI4XGvWKRYD6St+oK0zIHRxzjVp0EANpheocb6+RCDIDPqz5uETaSN?=
 =?us-ascii?Q?KhcRP7XdJlUvGmv8NKZsdXezRPHovGDaoSmNGaWWDpxBf1JDF6hnoLqoLMiw?=
 =?us-ascii?Q?4KoLBYMg94aSiHfvrZ75mwrZ3z6JzFXP6+68+F1lvnrZrK85EYy9j8wPyoEY?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef6d47d-40df-4d68-7d59-08dbf040d104
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 18:35:37.9755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFcGuUtKwvRXN+dYgrY7to/cNeu3rD2NZZq5gCbHyBlp04VUkban1au4cvVAW2DCNnNS6U1SzQvVuFgy+h5OKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Memory allocations are
 tile-based, not GT-based
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 09:55:59AM -0800, Brian Welty wrote:
> Fix a missed conversion of GT to tile in vma_is_valid().
> Best is to update the function to take a tile argument.
> 
> This bug causes page faults to not complete successfully from media
> engines and when the PTE had been invalidated prior.
> (Caught by igt@xe_exec_fault_mode and INVALIDATE tests.)
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

I believe I have the same change on list too [1].

Anyways let's get yours merged, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/patch/566225/?series=125608&rev=2

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 03c1ab0ab0ca..1e083dda0679 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -64,10 +64,10 @@ static bool access_is_atomic(enum access_type access_type)
>  	return access_type == ACCESS_TYPE_ATOMIC;
>  }
>  
> -static bool vma_is_valid(struct xe_gt *gt, struct xe_vma *vma)
> +static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
>  {
> -	return BIT(gt_to_tile(gt)->id) & vma->tile_present &&
> -		!(BIT(gt->info.id) & vma->usm.tile_invalidated);
> +	return BIT(tile->id) & vma->tile_present &&
> +		!(BIT(tile->id) & vma->usm.tile_invalidated);
>  }
>  
>  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> @@ -169,7 +169,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	atomic = access_is_atomic(pf->access_type);
>  
>  	/* Check if VMA is valid */
> -	if (vma_is_valid(gt, vma) && !atomic)
> +	if (vma_is_valid(tile, vma) && !atomic)
>  		goto unlock_vm;
>  
>  	/* TODO: Validate fault */
> @@ -215,7 +215,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  
>  	if (xe_vma_is_userptr(vma))
>  		ret = xe_vma_userptr_check_repin(vma);
> -	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
> +	vma->usm.tile_invalidated &= ~BIT(tile->id);
>  
>  unlock_dma_resv:
>  	drm_exec_fini(&exec);
> -- 
> 2.38.0
> 
