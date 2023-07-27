Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF749C001E0
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A438410E59E;
	Thu, 27 Jul 2023 14:47:56 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA9B10E59E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469274; x=1722005274;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v2PKFXyziQo/a65bKCNBy5rUcduLStQ/CoCX5LIG6ww=;
 b=KGdG8zbucTetb7ls50iPDAm7yO4t3junek2FwptTIK87u3iVn5s3aIns
 mkIowpwFB1cuk9XNP/V1mVJX46Zw+yPJB5W7HokVHxQDI6t6ZBGraCZd6
 iB415o0Za7biGdnUlTpsYuP5gQGE7TQlYFJHoJ2RcbjKQclWHG6ql1rg5
 XYS7LWh23ZWMzU1rvT+v3UL5qnlsjdTLJHwzLZ9pAuQbTG7H0PvdfQjVA
 LuSPIg6ERL+/xO9/YFwsM7dcsli9QShIcZVrU1q/ALKl7e4rAbVIpx9rV
 Uf+aP4TRyXEtM+rnPszNwp6BF8NbC4MAxsbVI9kXsp4GImBcNtRUQ9Vgr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368345570"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="368345570"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="973587803"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="973587803"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2023 07:47:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:47:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 07:47:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 07:47:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPHOzZ3wruvPAEf7Z0d5fpuAnYMRits40HAbu9IzXHjPdlUJ97NcGdMMBsB4Qm0nMIL/gbZVQjMo8aZDcBbzUwKr5JvvqTy5t+Pmvb796WfTxJ+3hZ58o+V632zpJ08C/3xdjcn7J1oAWEi4Y1G3p1XMzMp5hZUY0YD50twG9k2N+HJPiSQhFXg1vEmecq807RAr9fEFCfLLxxDtbNu4GqfCmLrUKNyucNbfb3Syl+L/1f6oVmBlKEuAAix260qG+HzM4Fo2RJrT5jX9pTmAU1XYqLkCy1UAUKCB4yfOUpTjgJy0pQRfyodFiYwfu2ZIKIypiDj3UG+pwjM9PR/gsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJBGqvbhK6jpAimpTt4c05oUNlkkzMd7zJoVa4DJZuY=;
 b=IkemruqvGeESqsMUqAkLl+smRPMreey4CwoxFnrYiBtGy8czcO7UcTZ5qDJ2ocXOBcvNynLIXYt4pcJ+tfBMVPxizKtSPVJMk6Q3P8O7JSQjTgFUpoQndX/iOHqoM3q2ZDh//U4t1p2JKgOXoND8s0SJkxgjcxf5BeO+ss4f1EjAtz8mu51qrpzwZXwThXf49bINpK2oxxzTBMJiQeMBTEKfoGEjB651P21Slqi38S9/PpswZ9p0VgWxQQKWEQ/Ueh9ecpkvqycN7hQfZ/Ay42Ww/vmxQ+dtGwEvgHkp42PRkt952vo6Ai/XwIUEVEIkia9oWUFmu09pmXerBHWk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:47:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:47:51 +0000
Date: Thu, 27 Jul 2023 14:47:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMKDaNCbLnMjYIHv@DUT025-TGLU.fm.intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727082235.905240-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7e1275-8f7b-459c-343c-08db8eb07424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n2PLDEAS6maFblFmg5/a+wFISrbSRBiTdIX3wouo9rrOX1QJnyk905tcFHGIQ340NNou6/Rk07aRrBXmZlbm2UWJP32pdPCgaYLaY3RWp6Hty1KTlvRCI4ZijKDhYW+oxekReB4M6tNOo06GoENnqz5tHDpH+V3C01f5gJ8eH0/DUcGlc8ySXiRoa6SaaenKSw04nwSMX58YNMXSjWedVURtExM+WigwUYofLFtlvcR9VqdWHAb8THxg92NrAsqoskNwc5BAmMKzIfwnihdjn2dZgrwonpS7lv4P3dDiSebTgFqQyUf+PhmnENs7GKwdeepSmTSzmufweqVjRqhrBePTEPXIq9xTr9GhNHR+cAJ9PaeINwAlYT1JwryfrrsBrnZi4PnLCz9uvgGSRa1+q4bUqAJyKpJdodw1gBrFEV70s8ZxV+Ps3hxbYjSFPYwkf3aLCDupRDmkZBhnAUB5XGqhN7HQhU463jK71Pyl2A0ODCrL45SHsMFQI9XgIPxGlfSijVMNY8zQtf1agTHHZWkBH+JYZsmyd6vO3ERPhQEkh0GDW0H3V0LMq0sSqPT6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(2906002)(66899021)(316002)(8936002)(8676002)(6862004)(5660300002)(30864003)(44832011)(41300700001)(86362001)(6512007)(26005)(6506007)(107886003)(478600001)(82960400001)(6666004)(6486002)(83380400001)(6636002)(186003)(4326008)(66476007)(66556008)(66946007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fSipSAxjth/v9d1rfUBy8REvTve0FyefqsD/DVRcWu9Jr69Thzuv32BZDDLL?=
 =?us-ascii?Q?EZ51S6pT01w7pQGXGDBdmOXYEo8Lk/m/M7M53CXbl9t+OZvtFijuXwpExojm?=
 =?us-ascii?Q?QSUWELGNRUEcZ/NAlSqnEu6D03/eOESqoHt1LFeN+pQ/qx4rMZM445MRMiPe?=
 =?us-ascii?Q?7/NRuI+pCS9pAY+iLwylQtmFEYm5N7Odn4SRTnQiXugl9evmIF2i8XJQudFj?=
 =?us-ascii?Q?//mI4NdeJuN0+fBk+AKhVl/ByuZgmsdsqF6+7tSfnOi3cd8fZ7N1lf05aJyR?=
 =?us-ascii?Q?5kqvLopOPumlwDu58CDJ1Bf9FxDmJZvs2Cd0fQZm21c0KPvRZNjgj3TMOyzV?=
 =?us-ascii?Q?1HbGzbPJHe+5r92jGKypKaobgCmchzWyNo1pufneVncb48gf8EfgB5FMgwh4?=
 =?us-ascii?Q?3UP/pKZPScLB/9vtBeXFR5VAwDEStVAYoPJnFdNCenAej0kiKRRI7EVfTnUW?=
 =?us-ascii?Q?B7Z+OqdM6a29DiQWi6byQzTPg40inl5qulxvAXdHcjI1NzLRUWSovswUYLmU?=
 =?us-ascii?Q?yFN8mTdNYLn3w0FhEDluY6tP6Pwh7WIZfXxzALvNkTncFM/2VYVeQVOZIov1?=
 =?us-ascii?Q?uy7shkENJ6pSiOal6pVJNf8mA7NAWzC/hGi77qnODDzoJ1Xc4abzxVGX47zM?=
 =?us-ascii?Q?Oz0lNSvDj8Q9t+Dx1V6I+WnaEeZW1llzBnkvfrvjWyy2NaXLZo+ZiJXZ3vlY?=
 =?us-ascii?Q?t/9QwzNMI2XG/hdDmIcqYFPtDPQelmsTkBriYxhv4jnXAhDQyCo2LPIePso4?=
 =?us-ascii?Q?agEuIrRSLD45BPKr08BejgWOwL7PPjeaz/HALnQXviLlnxbbeK1s7Icg5Q21?=
 =?us-ascii?Q?jICdaUacUmXcA8SC6owfEyW7fUlD3AgRwc/ex9MIVa9ogtP8kct0qjoMjnTr?=
 =?us-ascii?Q?DGnWR8hbyimVzwdzdB8mWaVRfrphWFt6IDKsqf+2Hbq9gqr3rFQ6hxOZ0QSc?=
 =?us-ascii?Q?ylLbegQjrv0eg0YBUcN14vu6IVOYZRPuZkwdm39BWXoZKTZG13qnxyHmLBbX?=
 =?us-ascii?Q?bBwBQkHB+Dv3E3UM9bvXyNsEg5tr6P2uoU/KxCkzkLCl2aXQp1DLT8nBEue0?=
 =?us-ascii?Q?mnPZpgwLYILz33SlUyODzhgisNaZOs08oouqXXX9Xr7gYgXZ2HvfWCFwVmRj?=
 =?us-ascii?Q?NOgFAKtNabOWkYH5Paz/qv64Wu9Or0LHx1+Q663UmoK4ZiEBtPOk+S4ILbkN?=
 =?us-ascii?Q?4rXk5Gxxia7ITX8W2RmfUhzBDgmgMi0JH0nfyH26uY8fBBPz89f2Ri/VRXKn?=
 =?us-ascii?Q?xlthjoz3zKBUevAYr778J+e3AZyLtVgFgVGHL+8jqGznxkTkiFbLa+83xvQJ?=
 =?us-ascii?Q?+ncWjMilqzl8iXi9xf7NZGcIs6sb/obBTlmSWweIy52/FuAtLqSCNSxBsC/o?=
 =?us-ascii?Q?AJuWurv67jsjN7JjNAeJzFlkp+5fh1CKuwzQSX+ZGontmNVKWbtEPnDpISYz?=
 =?us-ascii?Q?EdHxO7F+SoGRRnWxPClXJbyJG6Qoc2DCJHTg+yf7AjK7dz7UASY+96lSEUsI?=
 =?us-ascii?Q?2PakwyKTxHl4HDQYogcRzxTQ2fy7GYkHlttU0/eZ3vlHTSsh+I2dKeq5KPuP?=
 =?us-ascii?Q?NNCqJgy7tohlCIgegzDTLDmABRSrevmL890YMOCOwWwpTCeu5ppwBsnM/hNY?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7e1275-8f7b-459c-343c-08db8eb07424
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:47:51.8316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOKV60hKEqm32hir6t7pbb+yvXLv5eQqhO+v04Fi7hgaB57fipQQSaZ6/Z8deOIvYOEH0kQ6t0EeOccedgbWzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
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

On Thu, Jul 27, 2023 at 01:52:31PM +0530, Tejas Upadhyay wrote:
> For each HW engine under GT we are adding defaults sysfs
> entry to list all engine scheduler properties and its
> default values. So that it will be easier for user to
> fetch default values of these properties anytime to go
> back to default.
> 
> For example,
> DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/bcs/.defaults/
> job_timeout_ms         preempt_timeout_us     timeslice_duration_us
> 
> where,
> @job_timeout_ms: The time after which a job is removed from the scheduler.
> @preempt_timeout_us: How long to wait (in microseconds) for a preemption
>                      event to occur when submitting a new context.
> @timeslice_duration_us: Each context is scheduled for execution for the
>                         timeslice duration, before switching to the next
>                         context.
> 
> V8 :
>    - replace xe_engine with xe_hw_engine - Matt
> V7 :
>    - Push all errors to one error path at every places - Niranjana
>    - Describe struct member to resolve kernel doc err - CI hooks
> V6 :
>    - Use engine class interface instead of hw engine
>      in sysfs for better interfacing readability - Niranjana
> V5 :
>    - Scheduling props should apply per class engine not per hardware engine - Matt
>    - Do not record value of job_timeout_ms if changed based on dma_fence - Matt
> V4 :
>    - Resolve merge conflicts - CI
> V3 :
>    - Rearrange code in its own file
>    - Rebase
>    - Update commit message to reflect tile addition
> V2 :
>    - Use sysfs_create_files in this patch - Niranjana
>    - Handle prototype error for xe_add_engine_defaults - CI hooks
>    - Remove unused member sysfs_hwe - Niranjana
> 

One NIT below, with that fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c                |   6 +-
>  drivers/gpu/drm/xe/xe_gt_types.h              |   3 +
>  drivers/gpu/drm/xe/xe_guc_submit.c            |   3 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c             |   9 ++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 118 +++++++++++++++---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  20 +++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h       |  37 ++++++
>  7 files changed, 173 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 0102dad16e29..9e167b113963 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -53,9 +53,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>  	INIT_LIST_HEAD(&e->compute.link);
>  	INIT_LIST_HEAD(&e->multi_gt_link);
>  
> -	/* FIXME: Wire up to configurable default value */
> -	e->sched_props.timeslice_us = 1 * 1000;
> -	e->sched_props.preempt_timeout_us = 640 * 1000;
> +	e->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> +	e->sched_props.preempt_timeout_us =
> +				hwe->eclass->sched_props.preempt_timeout_us;
>  
>  	if (xe_engine_is_parallel(e)) {
>  		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 78a9fe9f0bd3..d70460feeb96 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -286,6 +286,9 @@ struct xe_gt {
>  	/** @hw_engines: hardware engines on the GT */
>  	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
>  
> +	/** @eclass: per hardware engine class interface on the GT */
> +	struct xe_hw_engine_class_intf  eclass[XE_ENGINE_CLASS_MAX];
> +
>  	/** @pcode: GT's PCODE */
>  	struct {
>  		/** @lock: protecting GT's PCODE mailbox data */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 911d4965c27c..7978f7efd702 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
>  	ge->engine = e;
>  	init_waitqueue_head(&ge->suspend_wait);
>  
> -	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
> +	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
> +		  e->hwe->eclass->sched_props.job_timeout_ms;
>  	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
>  			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>  			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1af5cccd1142..afa7d25c3852 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -362,6 +362,15 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	hwe->fence_irq = &gt->fence_irq[info->class];
>  	hwe->engine_id = id;
>  
> +	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
> +		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ * 5;

This is ms value, HZ is jiffies. 5 * 1000 makes more sense then.

> +		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
> +		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
> +		/* Record default props */
> +		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
> +	}
> +	hwe->eclass = &gt->eclass[hwe->class];
> +
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>  	xe_wa_process_engine(hwe);
>  	hw_engine_setup_default_state(hwe);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index c2f092b54af1..15c2b0b9f1fd 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -9,6 +9,8 @@
>  
>  #include "xe_hw_engine_class_sysfs.h"
>  
> +static int xe_add_hw_engine_class_defaults(struct kobject *parent);
> +
>  static void kobj_xe_hw_engine_release(struct kobject *kobj)
>  {
>  	kfree(kobj);
> @@ -19,22 +21,88 @@ static const struct kobj_type kobj_xe_hw_engine_type = {
>  	.sysfs_ops = &kobj_sysfs_ops
>  };
>  
> -static struct kobject *
> -kobj_xe_hw_engine(struct kobject *parent, char *name)
> +static struct kobj_eclass *
> +kobj_xe_hw_engine_class(struct kobject *parent, char *name)
> +{
> +	struct kobj_eclass *keclass;
> +
> +	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
> +	if (!keclass)
> +		return NULL;
> +
> +	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
> +	if (kobject_add(&keclass->base, parent, "%s", name)) {
> +		kobject_put(&keclass->base);
> +		return NULL;
> +	}
> +
> +	return keclass;
> +}
> +
> +static ssize_t job_timeout_default(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
> +}
> +
> +static struct kobj_attribute job_timeout_def =
> +__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> +
> +static ssize_t timeslice_default(struct kobject *kobj,
> +				 struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
> +}
> +
> +static struct kobj_attribute timeslice_duration_def =
> +__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> +
> +static ssize_t preempt_timeout_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr,
> +				       char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
> +}
> +
> +static struct kobj_attribute preempt_timeout_def =
> +__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> +
> +static const struct attribute *defaults[] = {
> +	&job_timeout_def.attr,
> +	&timeslice_duration_def.attr,
> +	&preempt_timeout_def.attr,
> +	NULL
> +};
> +
> +static int xe_add_hw_engine_class_defaults(struct kobject *parent)
>  {
>  	struct kobject *kobj;
> +	int err = 0;
>  
>  	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
>  	if (!kobj)
> -		return NULL;
> +		return -ENOMEM;
>  
>  	kobject_init(kobj, &kobj_xe_hw_engine_type);
> -	if (kobject_add(kobj, parent, "%s", name)) {
> -		kobject_put(kobj);
> -		return NULL;
> -	}
>  
> -	return kobj;
> +	err = kobject_add(kobj, parent, "%s", ".defaults");
> +	if (err)
> +		goto err_object;
> +
> +	err = sysfs_create_files(kobj, defaults);
> +	if (err)
> +		goto err_object;
> +
> +	return err;
> +err_object:
> +	kobject_put(kobj);
> +	return err;
>  }
>  
>  static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
> @@ -62,14 +130,12 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>  	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
>  
>  	err = kobject_add(kobj, gt->sysfs, "engines");
> -	if (err) {
> -		kobject_put(kobj);
> -		return err;
> -	}
> +	if (err)
> +		goto err_object;
>  
>  	for_each_hw_engine(hwe, gt, id) {
>  		char name[MAX_ENGINE_CLASS_NAME_LEN];
> -		struct kobject *khwe;
> +		struct kobj_eclass *keclass;
>  
>  		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
>  		    hwe->class == XE_ENGINE_CLASS_MAX)
> @@ -97,15 +163,29 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>  			strcpy(name, "ccs");
>  			break;
>  		default:
> -			kobject_put(kobj);
> -			return -EINVAL;
> +			err = -EINVAL;
> +			goto err_object;
>  		}
>  
> -		khwe = kobj_xe_hw_engine(kobj, name);
> -		if (!khwe) {
> -			kobject_put(kobj);
> -			return -EINVAL;
> +		keclass = kobj_xe_hw_engine_class(kobj, name);
> +		if (!keclass) {
> +			err = -EINVAL;
> +			goto err_object;
>  		}
> +
> +		keclass->eclass = hwe->eclass;
> +		err = xe_add_hw_engine_class_defaults(&keclass->base);
> +		if (err) {
> +			drm_warn(&gt_to_xe(gt)->drm,
> +				 "Warning: adding .defaults to engines failed!, err: %d\n",
> +				 err);
> +			goto err_object;
> +		}
> +
>  	}
> +
> +	return err;
> +err_object:
> +	kobject_put(kobj);
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> index c461fac717c2..757136614672 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> @@ -10,4 +10,24 @@
>  
>  #define MAX_ENGINE_CLASS_NAME_LEN    16
>  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> +
> +/**
> + * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
> + * eclass.
> + *
> + * When dealing with multiple eclass, this struct helps to understand which eclass
> + * needs to be addressed on a given sysfs call.
> + */
> +struct kobj_eclass {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @eclass: A pointer to the hw engine class interface */
> +	struct xe_hw_engine_class_intf *eclass;
> +};
> +
> +static inline struct xe_hw_engine_class_intf *kobj_to_eclass(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct kobj_eclass, base)->eclass;
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 803d557cf5aa..97d9ba31b5fc 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -63,6 +63,41 @@ struct xe_bo;
>  struct xe_execlist_port;
>  struct xe_gt;
>  
> +/**
> + * struct xe_hw_engine_class_intf - per hw engine class struct interface
> + *
> + * Contains all the hw engine properties per engine class.
> + *
> + * @sched_props: scheduling properties
> + * @defaults: default scheduling properties
> + */
> +struct xe_hw_engine_class_intf {
> +	/**
> +	 * @sched_props: scheduling properties
> +	 * @defaults: default scheduling properties
> +	 */
> +	struct {
> +		/** @set_job_timeout: Set job timeout in ms for engine */
> +		u32 job_timeout_ms;
> +		/** @job_timeout_min: Min job timeout in ms for engine */
> +		u32 job_timeout_min;
> +		/** @job_timeout_max: Max job timeout in ms for engine */
> +		u32 job_timeout_max;
> +		/** @timeslice_us: timeslice period in micro-seconds */
> +		u32 timeslice_us;
> +		/** @timeslice_min: min timeslice period in micro-seconds */
> +		u32 timeslice_min;
> +		/** @timeslice_max: max timeslice period in micro-seconds */
> +		u32 timeslice_max;
> +		/** @preempt_timeout_us: preemption timeout in micro-seconds */
> +		u32 preempt_timeout_us;
> +		/** @preempt_timeout_min: min preemption timeout in micro-seconds */
> +		u32 preempt_timeout_min;
> +		/** @preempt_timeout_max: max preemption timeout in micro-seconds */
> +		u32 preempt_timeout_max;
> +	} sched_props, defaults;
> +};
> +
>  /**
>   * struct xe_hw_engine - Hardware engine
>   *
> @@ -107,6 +142,8 @@ struct xe_hw_engine {
>  	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
>  	/** @engine_id: id  for this hw engine */
>  	enum xe_hw_engine_id engine_id;
> +	/** @eclass: pointer to per hw engine class interface */
> +	struct xe_hw_engine_class_intf *eclass;
>  };
>  
>  /**
> -- 
> 2.25.1
> 
