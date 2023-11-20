Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0BDC197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 19:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA6910E0F4;
	Mon, 20 Nov 2023 19:48:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB87E10E0F4
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 19:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700509684; x=1732045684;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P8FeTHW6A/GfP9N5ETy7Icy5+pV7nVe2zJkSBTGenPw=;
 b=NWAzbJcIA/CMikmx6EnYk5zuFdtUqH9hOhJD36c2p5c33WPm8PgbFcmX
 kbLB2eRTcyQvasuB80gj8ieqrGEuoqm++bqBc5KVkxRwoC3zQSEekPhhQ
 VtzKLcsT6EcVEdjQw7UK8ljLaJ/jdIE8nnDGg7Ws0Zn1B9uG8QeycDJgi
 4lYhFwRdNW6QMlS3NNdGV1Xv/aX3qqskP2nAJi7NqmbNtXndhxgmbi3vc
 PtOnKAyiz6aWQi4MakY48/4lsJt+hkAMxx9U9IJBXY3c5G/4XxpzljTTi
 63XylyP714WE8gVsRo7CmhBrFYaBJmdA6fVMyg0w5WzfnmN7fdEwGq9Jh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13239025"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="13239025"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 11:48:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="14673954"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 11:48:04 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:48:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:48:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 11:48:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 11:48:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpgdGN3xLacyZyO+YKxDHnsKn0gg9PSA7h7Oo7xHrF/Htd2ZwXkzyl3IYbKeTuFBeqr2C+UXm4n4GL7NBbCeRuqrwhDY8vvvBjskxIpQIHWt9xh1g+VmFAaRbOIxtSXAFESl9yeKWtdTH2GX5Gf2Z52HvjbthHw6oVP8kJ4N/BGFdEuDbmWW0rMnr4lSagSOFiqfoBCmNDuwXLvszFTfNxEYCBF8qfjzNxHHpLAUXoyhSZWa/QljD5aNegRrAPkJoIK2r9bcsGYHP0GGlxIXs7wf5VQdF4FsyBKsdDhx5rIzfVgYEyEqqGbMOEG30am49vRv/qHS1IsIWXNFfWSmLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2y6tQiJRVqz6ul4QD4sMUxLX1Y0S+ojBi7G3iwHnU4=;
 b=Bsmpd88/mDwJ4wOFfnoDqA6zgJcbNvW5tyYSEsbH9nt3bieZn/TW+XT/U3HbaKFRQW5cDbx5+kT3fiTEPpPuetzCyaIF/z55vKnriejMR6M6BhvZMAWupOnKaNK6rPvgEvDuESPfDq1R/QNxn0+ZHuF6+tzNjHFKDtUx33g6Hm3qBoOW+z//8a4pB59ah+Is5qLFJHnk6ENCHKd898AZf77t1+70R8zGbW2AnBZecHbJ1YL1dE0bRphVKsh/w2w0Yv/e3/oDNI5F49gimTicilYPLNMFMpfZ5U0IRzuogra34uGbHLe9IuXttuZN1+2J0ELlTaf9qWbFPauO/kQfUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.27; Mon, 20 Nov 2023 19:47:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 19:47:59 +0000
Date: Mon, 20 Nov 2023 12:46:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZVtVQTQkrSgJQeca@DUT025-TGLU.fm.intel.com>
References: <20231031103525.2433645-1-tejas.upadhyay@intel.com>
 <20231031103525.2433645-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231031103525.2433645-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0204.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 330ee1ae-e5eb-448a-8ccb-08dbea019929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sx4y9ysNuKu9AlOdVJwQSkStmgwP16i06cDPuh9yYIXjjTHZ78BQO8Hj58m3/5PVU5VXExCpp+XdIjU2p6GTfJonWowgrOFdWWFQcqhgxsHqXqgJz79KtE0vg6B2uvOGFbdgjyGaZ38JCJPhtsM2EO7EgHCDBwEqTtd6qRrdnZhIemd121rESGci+5+usJY28CEHmIH6pHU32TagRfWYslBPykxEqrPnV77LGMOF8DBM8Z4e60l6aDbtcGyoiu7TvaeEuOwkLnKE/Wz8EfTrFtVEp7qQPR7ibW9HhL0SQR0og4Fpq1I8ceF1WU/ZYZdwLPyQgf3rDkZEX7ubCEeFUyF2qg5ws015/GrCrefYTg+rxNvtbPrDb5LTGT9KP5VTGTSdS5fQpA0uubboRj23rsaNWri97sEaAxfsIeFU1N9VZVnSgSBqweJpA5cc88VNkOReFbpfKc96JYQn3Lp1cU9LaFbg9BdHGReAa3aOvP9HRp1lUGW5FfZ1iL4bGDoRVSl8xms00h5Xl0n7l6LL46RLOzxg21A7sWs8H8+wqLhZJ/B/J5GeI+VcT5R4mQnS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(6512007)(26005)(41300700001)(4326008)(6862004)(8676002)(38100700002)(8936002)(15650500001)(2906002)(30864003)(44832011)(5660300002)(478600001)(6486002)(6506007)(6636002)(66476007)(66556008)(66946007)(316002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eNWF7LGU+M/Q1Fd583T11q7dWInCzEF8DiXLNEG3hVRxrlFbFNy98qTO4Ogr?=
 =?us-ascii?Q?glk6FJMgmg9jdX5rQt2f65V454G2fkmR8oBtDcmq+YzqQTlH53ykVegea/Id?=
 =?us-ascii?Q?JxipIPry40IkCGHsKwz7dq1ap7YdENtfjc1r5cdnUDd876eTnhSjXDQ1vCx+?=
 =?us-ascii?Q?OKuW2PNLfGErcTDeWZX7CirI7TR/2hmltJFrxHZyWpqB6+dPlei/m7qKq9yu?=
 =?us-ascii?Q?2DSE8NC0PZNCokgvrBgN7qusuwhm6J8pAcxOn0AHe+g0H2tPqkaTUEveH78m?=
 =?us-ascii?Q?DEnETomTYm+b8IhR1KbZI1Mn5geKCqyHSLk+sxlt/Uv9IGfX+GOPUBw+JnDA?=
 =?us-ascii?Q?meZHQhTnw5hLidpgPMQdGzePaEX7gEf90nnz78idfSThsyF2ngycZ5B/M3Fr?=
 =?us-ascii?Q?QVhzsnM2EwLmzXhfjTxPzUbSDYqcxsx+YaiRIK7I9GrkJkr8p1bhxmj3FZeN?=
 =?us-ascii?Q?4lYd0KHyQbrtN27aUDPBE9uZnXeK3uolJhXRTi9SmOkmrDvhqRJpKt/gc1rS?=
 =?us-ascii?Q?No2IgF/B6ytTfPLtKpwarvBBumGoopztWjbA9VvpBwvclsH0C6nOSJ+PTU8c?=
 =?us-ascii?Q?Sz5OSARhGm6gD3o4upcFJ0YxAhX4p8cBfPtmcAe94TvJsWVr2oUcfewhK0hj?=
 =?us-ascii?Q?SVX8KVf512HxfBUCNxuK84vLgcY2kqGV0VnyFyJrEnYfdTWU3O4k5EDEdp1A?=
 =?us-ascii?Q?kT6ElOTgUQDKd8OX69swIgue+61hp5GP5WiYqtw0hGT0Nf/0dfWXCnedgOh5?=
 =?us-ascii?Q?YbDygtljZGWfLyXza6xCvUC4jI1myoZtPqXZ5hMjUQf3B4TP7g7PbG1E9Msq?=
 =?us-ascii?Q?QjFqkR0xjZrZTvRmZEToFf/O5q79MAHY7/WQq78HahWs9TF1IKf0ipKeJGW/?=
 =?us-ascii?Q?vY0iCZcIxl74SzzrsXVlqJf+7dgofVffIdQ8ZFvwr8CExUSi9O9Z0a/HVu9D?=
 =?us-ascii?Q?P8wk4/04rdpq3sN5RuWp18QPa7kL5pj/qDveb84+MPXOrDbl4uzPWAegj8GR?=
 =?us-ascii?Q?dXXJaiQqNyy13dj7dH7CILU8BKgABmLsYrqlyoOTHiyEje9fXW6Q2aBqjpaM?=
 =?us-ascii?Q?p97JMY1QduV3E/lLcCmfcBztEozWSC4yo8bd3hWcwqSTgG7AEqcEK4hlnf2U?=
 =?us-ascii?Q?xL8w7YkC4hFJP+nLXnC1R4jvtit0nKIyF5kHa3h5SgqBPbDMBUA1qkoMGX3k?=
 =?us-ascii?Q?NZIt2cClQJnqS6BRSOQ+kgeSBDF4R1/aKH51wv54UVbhirZ3EPqpZC16a7+C?=
 =?us-ascii?Q?f5JcROXoEBQWs8eYRKhxulfdf9ElI/f/a0BXk9rP7FFqlC650hNGCvxXw3HZ?=
 =?us-ascii?Q?PIyBrqLG9m4VA9wB4nyXHYwkfStSaQm0PeAvOqq1bKCNo4I77nUrijkwDHP0?=
 =?us-ascii?Q?aiQuUJlPQ79Lsko1YFsIs/FpNIs9yMbyN3U0s/02XGldKROunx3WprotLZUx?=
 =?us-ascii?Q?HBZgobNBmLH6zGtcsy4P+OMx4ufNCJXPepz6C6DsLlTSaXnxGB4DIqsgYVUP?=
 =?us-ascii?Q?mVsMKXoqonUtYJPo+TrU5LANSb7OxBaUd1d1NJGIX5aOvCCgY0/PwFi45F+K?=
 =?us-ascii?Q?esstcTyau+f1+ZAvQsL43UCU/4AMA3okdajhUnZCm1rR5WAEHz/5wgITP9pw?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 330ee1ae-e5eb-448a-8ccb-08dbea019929
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 19:47:59.0851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJVFW7REBD8KHAliyjw9HFed5rDUYc7sKVjqfOxAHaHP8jExaPhloKgI821rhPZgRAkgmsMKuYXCPJn0/bMHHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V11 1/1] drm/xe: Introduce and update counter
 for low level driver errors
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

On Tue, Oct 31, 2023 at 04:05:25PM +0530, Tejas Upadhyay wrote:
> Introduce low level driver error counter and incrementing on
> each occurrence. Focus is on errors that are not functionally
> affecting the system and might otherwise go unnoticed and cause
> power/performance regressions, so checking for the error
> counters should help.
> 
> Importantly the intention is not to go adding new error checks,
> but to make sure the existing important error conditions are
> propagated in terms of counter under respective categories like
> below :
> - GT
>   - GUC COMMUNICATION
>   - ENGINE OTHER
>   - GT OTHER
> 
> - Tile
>   - GTT
>   - INTERRUPT
> 
> Currently this is just a counting of errors, later these
> counters will be reported through netlink interface when it is
> implemented and ready.
> 
> V11:
>   - Unify tlb invalidation timeout errs - Michal
>   - Improve kernel doc comments - Michal
>   - Improve logging output message - Michal
> V10:
>   - Report and count errors from common place i.e caller - Michal
>   - Fixed some minor nits - Michal
> V9:
>   - Make one patch for API and counter update - Michal
>   - Remove counter from places where driver load will fail - Michal
>   - Remove extra \n from logging
>   - Improve commit message - Aravind/Michal
> V8:
>   - Correct missed ret value handling
> V7:
>   - removed double couting of err - Michal
> V6:
>   - move drm_err to gt and tile specific err API - Aravind
>   - Use GTT naming instead of GGTT - Aravind/Niranjana
> V5:
>   - Dump err_type in string format
> V4:
>   - dump err_type in drm_err log - Himal
> V2:
>   - Use modified APIs
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h        | 16 ++++++++
>  drivers/gpu/drm/xe/xe_gt.c                  | 41 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 ++++---
>  drivers/gpu/drm/xe/xe_gt_types.h            | 18 +++++++++
>  drivers/gpu/drm/xe/xe_guc.c                 | 16 +++++++-
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 43 ++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
>  drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
>  drivers/gpu/drm/xe/xe_tile.c                | 41 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.h                |  3 ++
>  11 files changed, 198 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index cb537cac1ef9..0626640f06d9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -61,6 +61,19 @@ struct xe_pat_ops;
>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>  		 struct xe_tile * : (tile__)->xe)
>  
> +/**
> + * enum xe_tile_drv_err_type - Types of tile level errors
> + * @XE_TILE_DRV_ERR_GTT: Error type for all PPGTT and GTT errors
> + * @XE_TILE_DRV_ERR_INTR: Interrupt errors
> + * @__XE_TILE_DRV_ERR_MAX: Number of defined error types, keep this last
> + */
> +enum xe_tile_drv_err_type {
> +	XE_TILE_DRV_ERR_GTT,
> +	XE_TILE_DRV_ERR_INTR,
> +	/* private: number of defined error types, keep this last */
> +	__XE_TILE_DRV_ERR_MAX
> +};
> +
>  /**
>   * struct xe_mem_region - memory region structure
>   * This is used to describe a memory region in xe
> @@ -190,6 +203,9 @@ struct xe_tile {
>  
>  	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>  	struct kobject *sysfs;
> +
> +	/** @drv_err_cnt: driver error counter for this tile */
> +	u32 drv_err_cnt[__XE_TILE_DRV_ERR_MAX];
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d380f67b3365..30a4b837f01a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -49,6 +49,47 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +static const char *const xe_gt_drv_err_to_str[] = {
> +	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
> +	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
> +	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
> +};
> +
> +/**
> + * xe_gt_report_driver_error - Count driver error for GT
> + * @gt: GT to count error for
> + * @err: enum error type
> + * @fmt: debug message format to print error
> + * @...: variable args to print error
> + *
> + * Increment the driver error counter in respective error
> + * category for this GT.
> + *
> + * Return: void.
> + */
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err,
> +			       const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_drv_err_to_str) !=
> +		     __XE_GT_DRV_ERR_MAX);
> +
> +	xe_gt_assert(gt, err >= 0);
> +	xe_gt_assert(gt, err < __XE_GT_DRV_ERR_MAX);
> +	WRITE_ONCE(gt->drv_err_cnt[err],
> +		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	xe_gt_err(gt, "[%s] %pV\n", xe_gt_drv_err_to_str[err], &vaf);
> +	va_end(args);
> +}
> +
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>  {
>  	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a0..efd83707b367 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -67,4 +67,8 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
>  
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err,
> +			       const char *fmt, ...);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index bd6005b9d498..8db4018a2c3a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -9,6 +9,7 @@
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> +#include "xe_tile.h"
>  #include "xe_trace.h"
>  
>  #define TLB_TIMEOUT	(HZ / 4)
> @@ -35,8 +36,10 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  			break;
>  
>  		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
> -		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
> -			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> +					    "GT%u: TLB invalidation time'd out, seqno=%d recv=%d",
> +					    gt->info.id, fence->seqno,
> +					    gt->tlb_invalidation.seqno_recv);
>  
>  		list_del(&fence->link);
>  		fence->base.error = -ETIME;
> @@ -317,7 +320,6 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   */
>  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int ret;
>  
> @@ -329,8 +331,9 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  				 tlb_invalidation_seqno_past(gt, seqno),
>  				 TLB_TIMEOUT);
>  	if (!ret) {
> -		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
> -			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> +					    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
> +					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>  		return -ETIME;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d3f2793684e2..5bb7a2c6ecc2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,6 +24,21 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> +/**
> + * enum xe_gt_drv_err_type - Types of GT level errors
> + * @XE_GT_DRV_ERR_GUC_COMM: Driver guc communication errors
> + * @XE_GT_DRV_ERR_ENGINE: Engine execution errors
> + * @XE_GT_DRV_ERR_OTHERS: Other errors like error during save/restore registers
> + * @__XE_GT_DRV_ERR_MAX: Number of defined error types, keep this last
> + */
> +enum xe_gt_drv_err_type {
> +	XE_GT_DRV_ERR_GUC_COMM,
> +	XE_GT_DRV_ERR_ENGINE,
> +	XE_GT_DRV_ERR_OTHERS,
> +	/* private: number of defined error types, keep this last */
> +	__XE_GT_DRV_ERR_MAX
> +};
> +
>  #define XE_MAX_DSS_FUSE_REGS	3
>  #define XE_MAX_EU_FUSE_REGS	1
>  
> @@ -347,6 +362,9 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @drv_err_cnt: driver error counter for this GT */
> +	u32 drv_err_cnt[__XE_GT_DRV_ERR_MAX];
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 84f0b5488783..d25fb605e9dc 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -619,8 +619,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
>  	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>  }
>  
> -int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> -			  u32 len, u32 *response_buf)
> +static int __xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> +				   u32 len, u32 *response_buf)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
> @@ -724,6 +724,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
>  }
>  
> +int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> +			  u32 len, u32 *response_buf)
> +{
> +	int ret = __xe_guc_mmio_send_recv(guc, request, len, response_buf);
> +
> +	if (ret < 0)
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
> +					  "MMIO send failed (%pe)",
> +					  ERR_PTR(ret));
> +	return ret;
> +}
> +
>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
>  {
>  	return xe_guc_mmio_send_recv(guc, request, len, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a84e111bb36a..ce8ba923a4cd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -547,9 +547,9 @@ static void kick_reset(struct xe_guc_ct *ct)
>  
>  static int dequeue_one_g2h(struct xe_guc_ct *ct);
>  
> -static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			      u32 g2h_len, u32 num_g2h,
> -			      struct g2h_fence *g2h_fence)
> +static int _guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			       u32 g2h_len, u32 num_g2h,
> +			       struct g2h_fence *g2h_fence)
>  {
>  	struct drm_device *drm = &ct_to_xe(ct)->drm;
>  	struct drm_printer p = drm_info_printer(drm->dev);
> @@ -621,6 +621,20 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return -EDEADLK;
>  }
>  
> +static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			      u32 g2h_len, u32 num_g2h,
> +			      struct g2h_fence *g2h_fence)
> +{
> +	int ret = _guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> +
> +	if (ret < 0)

I think this can fail in a way where (the CT is disabled, returns
-ENODEV) this is harmless during a GT reset. This might make CI unhappy
if this case pops. If the device is suspended and the CT is disables,
this is likely an error.

> +		xe_gt_report_driver_error(ct_to_gt(ct),
> +					  XE_GT_DRV_ERR_GUC_COMM,
> +					  "CTB send failed (%pe)",
> +					  ERR_PTR(ret));
> +	return ret;
> +}
> +
>  static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		       u32 g2h_len, u32 num_g2h, struct g2h_fence *g2h_fence)
>  {
> @@ -690,8 +704,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  	return true;
>  }
>  
> -static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			    u32 *response_buffer, bool no_fail)
> +static int __guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			      u32 *response_buffer, bool no_fail)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct g2h_fence g2h_fence;
> @@ -755,6 +769,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret > 0 ? 0 : ret;
>  }
>  
> +static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			    u32 *response_buffer, bool no_fail)
> +{
> +	int ret = __guc_ct_send_recv(ct, action, len, response_buffer, no_fail);
> +
> +	if (ret < 0)

This is actually probably an error for the case mentioned above, I'd
have to double check on the use case but my feeling the caller should
ensure a GT reset isn't occuring if it needs recv some information. Or
at the very least retry after the reset is complete.

> +		xe_gt_report_driver_error(ct_to_gt(ct),
> +					  XE_GT_DRV_ERR_GUC_COMM,
> +					  "CTB send failed (%pe)",
> +					  ERR_PTR(ret));
> +	return ret;
> +}
> +
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			u32 *response_buffer)
>  {
> @@ -1133,6 +1160,12 @@ static void g2h_worker_func(struct work_struct *w)
>  		ret = dequeue_one_g2h(ct);
>  		mutex_unlock(&ct->lock);
>  
> +		if (ret < 0)

Same as first comment, this is not really an error for the -ENODEV if a
GT reset is occuring, likely an error for the suspend case.

Matt 

> +			xe_gt_report_driver_error(ct_to_gt(ct),
> +						  XE_GT_DRV_ERR_GUC_COMM,
> +						  "CTB receive failed (%pe)",
> +						  ERR_PTR(ret));
> +
>  		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>  			struct drm_device *drm = &ct_to_xe(ct)->drm;
>  			struct drm_printer p = drm_info_printer(drm->dev);
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 21d5273d7e61..29a22cb64825 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -18,6 +18,7 @@
>  #include "xe_guc.h"
>  #include "xe_hw_engine.h"
>  #include "xe_mmio.h"
> +#include "xe_tile.h"
>  
>  /*
>   * Interrupt registers for a unit are always consecutive and ordered
> @@ -227,8 +228,9 @@ gt_engine_identity(struct xe_device *xe,
>  		 !time_after32(local_clock() >> 10, timeout_ts));
>  
>  	if (unlikely(!(ident & INTR_DATA_VALID))) {
> -		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> -			bank, bit, ident);
> +		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR,
> +					    "INTR_IDENTITY_REG%u:%u 0x%08x not valid!",
> +					    bank, bit, ident);
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 87adefb56024..f2e20e10d927 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -125,12 +125,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	return 0;
>  
>  fail:
> -	xe_gt_err(gt,
> -		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> -		  idx, e->clr_bits, e->set_bits,
> -		  str_yes_no(e->reg.masked),
> -		  str_yes_no(e->reg.mcr),
> -		  ret);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
> +				  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d",
> +				  idx, e->clr_bits, e->set_bits,
> +				  str_yes_no(e->reg.masked),
> +				  str_yes_no(e->reg.mcr),
> +				  ret);
>  	reg_sr_inc_error(sr);
>  
>  	return ret;
> @@ -207,7 +207,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	return;
>  
>  err_force_wake:
> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d", err);
>  }
>  
>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> @@ -234,9 +234,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	p = drm_debug_printer(KBUILD_MODNAME);
>  	xa_for_each(&sr->xa, reg, entry) {
>  		if (slot == RING_MAX_NONPRIV_SLOTS) {
> -			xe_gt_err(gt,
> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE,
> +						  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more",
> +						  hwe->name, RING_MAX_NONPRIV_SLOTS);
>  			break;
>  		}
>  
> @@ -259,7 +259,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	return;
>  
>  err_force_wake:
> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d", err);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 131752a57f65..4de9b5e558a2 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -71,6 +71,47 @@
>   *  - MOCS and PAT programming
>   */
>  
> +static const char *const xe_tile_drv_err_to_str[] = {
> +	[XE_TILE_DRV_ERR_GTT] = "GTT",
> +	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
> +};
> +
> +/**
> + * xe_tile_report_driver_error - Count driver error for tile
> + * @tile: tile to count error for
> + * @err: Enum error type
> + * @fmt: debug message format to print error
> + * @...: variable args to print error
> + *
> + * Increment the driver error counter in respective error
> + * category for this tile.
> + *
> + * Return: void.
> + */
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err,
> +				 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_tile_drv_err_to_str) !=
> +		     __XE_TILE_DRV_ERR_MAX);
> +
> +	xe_tile_assert(tile, err >= 0);
> +	xe_tile_assert(tile, err < __XE_TILE_DRV_ERR_MAX);
> +	WRITE_ONCE(tile->drv_err_cnt[err],
> +		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	drm_err(&tile->xe->drm, "TILE%u [%s] %pV\n",
> +		tile->id, xe_tile_drv_err_to_str[err], &vaf);
> +	va_end(args);
> +}
> +
>  /**
>   * xe_tile_alloc - Perform per-tile memory allocation
>   * @tile: Tile to perform allocations for
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 782c47f8bd45..c79108fb9579 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -14,5 +14,8 @@ int xe_tile_alloc(struct xe_tile *tile);
>  int xe_tile_init_noalloc(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err,
> +				 const char *fmt, ...);
>  
>  #endif
> -- 
> 2.25.1
> 
