Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13407C3DA4D
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 16:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7B610E076;
	Thu, 17 Aug 2023 16:29:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8C010E076
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692289754; x=1723825754;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M1DsXMe0ruXhRJZy9OnOxaj351iLQrx344odpnMIg+k=;
 b=F6eUAOhdagORhVGOFNxOfMu6QPokVE0UOOu3nGP5BXtqZFDXXoKMYcMA
 KMy99h8UsFiuTpgm9a+rJJY1scUWMlCOvAg+/FbPxTarmVXLIOHXrYo+G
 +PegPSuP2TdTzwSFXne8tQ91Hx+WJyGHs4vOMIXJPDwPzsBlzMMnzsCtm
 lAJGWzwjiH6shjzUun18JdupPECSRSFWDavMPFfaz6gkk3QE6s3pWDSeO
 boZCjDFaDFrUJdF12TfkOfTUwFgdICthwICwY1iQcTE0Xo65TCm7apV9k
 zz+5Kkoxji93ARN/fgXfBIwnYqnginTgeyRNDvEakGrAhy0hbO5LpUvWQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375645275"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="375645275"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 09:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858286162"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="858286162"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 17 Aug 2023 09:29:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 09:29:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 09:29:13 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 09:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWKCbma1dGOG+ZgI9f9hitkhsQg1B9a0PS2Nu/8iEoyjuJ2hIhMDk+WiXFUrAfP5tuiLaTtey0gaYjKcNPGAegWJertBf1kaxfb9ml6pGgELXwwWXORcVukTypoYj+zX3iTH4jeKKuUOiEJNKQEkKMKeiMqMTUR3maMDqfkM5ZSyxzjXu6AfXk/+4qqUdh/GtO1Q+NZse0FoitozVjiPwPa4rEekaq0WE7hRrc+XfHS8/tETdAvIS42AXVdKzBO4B1G8Q9To/EsmPilFMp83QBPx0kjSH1Q7Q4xtzvzTm7p3IMdMnhqJ73lm63E/bQ+kOaiPXwaiJZmXu/ZXf1oxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Bukyrr7KQ7L13+xq3siDPoDoiNch8FZxvNrNO5E17E=;
 b=Db4FySpmuBoadnuFzuVtfZr91aGRf46vRsameWiKgM/KSTj5Y93M9EwbKeK/AEaTQ2o7EHyGwYIWQpDX9krgu3wMNLNgWBMPuvgpYBZ5HIYmv9lJZC2XP+KlPPUettO/ki0WyJ8ciN0F3t39AgfqKNfi2VLONFLmbAaL9LI36eV8ij+ZGgMw7GHXRltibobiswrT3/E8SboN76/1GYLV1ZgZM21c9GnZDuPZe2vVX5JbFM7CcsPh958nubduRGNvaXlQ1W7B3PNkAAi95+QtHjMVeYVplkNB0jvhTmxyKR9Rxxmd9+UtZOefAAA3JKH+QzUy9BwiTiSROqDhFV8EdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.31; Thu, 17 Aug 2023 16:29:10 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 16:29:10 +0000
Date: Thu, 17 Aug 2023 09:29:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230817162906.GD3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
 <20230817110352.7601-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230817110352.7601-4-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: ae14be5a-a1cf-403e-9b80-08db9f3f15a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GarcKTUfAykonWP1ViuXp1OlXI6q5AWvaYjcRe4JmUfhmHrr7k4lCBnWGsZu99PkPrguTUpx4PJR0st7od616eatXA75IRjHE9GuleFWfIW5O5THajM5wN04Cv0GDKOHbMviBO/NhrFH1R83tjAJ01LpG8X1rNQMBsnzc9DOsUqfhvomQkURCKJ2zusS6ZXuMP3nUDCVXoloqseoscDzRlISIRnfwL7VDi+bVX+WWVc6gnmrUpgZ9RG6mFzrYiz+TI+d80/URv4dPT6PHESlxclkOlgPJ9TjjK4PbXdoffG3FLZIiEYH9l6M+jrYdUYM47nTeVQarehdGgCul/wyb7PVFNW0efDX6frqFneFG7kWrhjDWYcljE3JLq5FpTvFRW1oIx/J5MU+Fj3BFVzyr/Mfkyz0EyPbx7B7cMckYljG3Yzn7IVP8fMPFOYwnc+pOhTAaz3W4HMJzKrq985rEiqW2JfzAOanCTTB9lYtnwXqK4kHOtG4eUJjJVPD0I0CI00DMqnJQL2+OpXCwZSK3lRESv+znX8XvATOaUTMIvKURdNhBzqx7sQ4gjNKLkjl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(1800799009)(186009)(451199024)(83380400001)(2906002)(478600001)(66946007)(66556008)(6636002)(66476007)(6666004)(6506007)(316002)(6486002)(107886003)(5660300002)(4326008)(8936002)(26005)(1076003)(6512007)(6862004)(8676002)(41300700001)(86362001)(33656002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/+W5p+0F7DLxsH8yjsc/x2LtSTaMaOWns5lcdyeLYtzxECCIBEjDRrx59G8o?=
 =?us-ascii?Q?Q820uD1EqMBnL1jaPWI1IIA8x3XlPTUmvZny86o2zficXRb41er9EvS3imVQ?=
 =?us-ascii?Q?LU05kdigqeqn15F5irpdi9oBnrFm2/TNqHML6lwv+pEBSs8Kp8sVYUe6V5hm?=
 =?us-ascii?Q?25DCoCWwnVf9S1ga0rN1RtkTHbjwjdX8BWRMR344pbcbSghLnnpZfgyngws/?=
 =?us-ascii?Q?zmKRn8fLsdJpCTkfhzuqb05FWIPgSs3xj3yq7RNKIiuE9Byr2CHO+Lgyz3DW?=
 =?us-ascii?Q?UhKC4UPZfb69jK6M+d06w4OPhdOE/6LBR+xSEnQb1ZN9Pz3d/DogeEWxWB6g?=
 =?us-ascii?Q?1vOtnwUcvpUW3p5P8hJDMDusGoLOFhiiZBzaO/U6o2wpLSmremE89u4IdvE3?=
 =?us-ascii?Q?FFExp8hTejHEfq12CzGewUFBVeXqSSmyHbhkujwmRLgXJXpwhgfzWIuD72PI?=
 =?us-ascii?Q?Qjb4nw9MS33XZQZGoDV7Yp4j6isHLMw+3SEoD57p1B8v/qaXD+2Npjt4mtXD?=
 =?us-ascii?Q?CD9ONTS1ZRKts3NIP67R5TOaITg6IJH3KQGtGckMs5gF2PzoMlwOP7Rf9ftO?=
 =?us-ascii?Q?gexU+tFpol5OEIa/uKda19b9G1r/KPlA9eqw+lACNmL+Q50V8yH0Z+2arr+a?=
 =?us-ascii?Q?0m4kt3rzoQnOx5gZpFvsrNJ+TSoQQOWYbO/c1cT/0Sryr+1g6Q4p115wPn0G?=
 =?us-ascii?Q?uilxK/YJgmTHJ7eJxvBpEA/IoW6mMpJule9/N/Kfetb0RdTrbRF3Tx9a/SDW?=
 =?us-ascii?Q?IQBwk1MBln8ylu3QORfp1Fq/DZ8+2S/235WNUTAvLs+dz0KCnXJODeUvPDX3?=
 =?us-ascii?Q?2Lu2rhgQmc4Hlz1NfFNIo1Vqj+cKVyQUIqaeHfd2tqmPUUouOJEjkZYrcmGZ?=
 =?us-ascii?Q?/8n8efA/NU6rfAeE7hu1Ei7BEQdvQSVEYxfKh47CBpsXSrWrgGeUQl+znjzh?=
 =?us-ascii?Q?qmgdpbj1str9GP2cc+cT0YlxK9NRYRYSCaWOPjqn9bNREAN7z9chihj8Oe1C?=
 =?us-ascii?Q?7+cLNPPyK5VdHw1ibQ4sIsokDphL9pMTgMKrNgby3RiJqtn76/HlkSklG8hs?=
 =?us-ascii?Q?UHOKcnLV8JslhkWSxZkAWdqwYw0xozeuA1+lAo6KElJGzdEFI5xJSdlE/Faf?=
 =?us-ascii?Q?i84UctkxylJ7XSPkoJmGD/vUWuxImDoGjs0PLo2/fPRlOanAxruZYdIptpYi?=
 =?us-ascii?Q?IYj2ZyW4K9h+M1q7qqa83MM5bmJjMAkk3fAuiilETwlkdW22lWS4CwLTRwTw?=
 =?us-ascii?Q?TRHvF7zf67AN3WiCQm1P0BW6x4kRLpXHt+YQJ2QARNRgi5jxkufUDbiLygPM?=
 =?us-ascii?Q?7gfowWOFGEdUrJYGTofDkd5vDMx0waRhUv6kINBkkgA37Wb0baMXgSW4cOBY?=
 =?us-ascii?Q?2RXow97e3ElBHDFfwEojfrTAwhM5RYd5noOVYTTSvepBCCHiiPcsPafyLgBY?=
 =?us-ascii?Q?Jq5vWShEpIihwxAL7cqvhT9PS1TEAeA8RPKCNnupGgzCyGsfH9WQQ89QEb8t?=
 =?us-ascii?Q?vUuxo2pt7AoQvqHsrlBzvOuDFbD1eFred1guRzhE7OPWByrIrOtheBa5Fpte?=
 =?us-ascii?Q?UAB7H7Km1cEETtCTt/0nhBGFuAawlQ2S2YhM4iLZuywvASd2177Wr2skgXuE?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae14be5a-a1cf-403e-9b80-08db9f3f15a1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:29:09.9416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRgP8NsNorfK7fIMZ1yhmhJJ22u55IKRYa1jKZvSZTwvWVagxcK4XwujpaIhTtALj00Gyv3NtIU13873/sjyOoRDSJRv0BeCokhaeT/amKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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

On Thu, Aug 17, 2023 at 04:03:52AM -0700, Niranjana Vishwanathapura wrote:
> Some copy hardware engine instances are faster than others on PVC.
> Use a virtual engine of these plus the reserved instance for the migrate
> engine on PVC. The idea being if a fast instance is available it will be
> used and the throughput of kernel copies, clears, and pagefault
> servicing will be higher.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 31 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>  drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
>  3 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 4c812d04e182..00329efbd968 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -791,3 +791,34 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
> +
> +/**
> + * xe_hw_engine_migrate_logical_mask - Return logical mask for migrate engine.
> + * @gt: gt instance
> + *
> + * On PVC, due to workaround 16017236439, odd instance hardware copy engines
> + * are faster than even instance ones.
> + * This function returns the mask involving all faster copy engines and the
> + * reserved copy engine to be used as logical mask for migrate engine.
> + * Including the reserved copy engine is required to avoid deadlocks due to
> + * migrate jobs servicing the faults gets stuck behind the job that faulted.
> + */
> +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 logical_mask = 0;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	/* Only support this function on PVC for now */
> +	if (XE_WARN_ON(xe->info.platform != XE_PVC))

Here you warn if the platform isn't PVC...

> +		return 0;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		if (hwe->class == XE_ENGINE_CLASS_COPY &&
> +		    (hwe->instance & 1 || xe_gt_is_usm_hwe(gt, hwe)))
> +			logical_mask |= BIT(hwe->logical_instance);
> +	}
> +
> +	return logical_mask;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 71968ee2f600..edee71e26c57 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -52,6 +52,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>  				enum xe_engine_class engine_class);
> +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt);
>  
>  struct xe_hw_engine_snapshot *
>  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 956a96b38346..cb9a82d13089 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -338,11 +338,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  							   XE_ENGINE_CLASS_COPY,
>  							   primary_gt->usm.reserved_bcs_instance,
>  							   false);
> -		if (!hwe)
> +		u32 logical_mask = xe_hw_engine_migrate_logical_mask(primary_gt);

...but here you call the function unconditionally on all platforms...

> +
> +		if (!hwe || !logical_mask)
>  			return ERR_PTR(-EINVAL);
>  

...and here we fail out if logical mask isn't set (which is will never
be on non-PVC).

I think you probably want an OOB workaround for some of this logic (see
xe_wa_oob.rules); then you can do something like

        if (XE_WA(gt, 16017236439))

to guard any code that should only be executed on platforms where this
workaround applies.


Matt

> -		m->q = xe_exec_queue_create(xe, vm,
> -					    BIT(hwe->logical_instance), 1,
> +		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1,
>  					    hwe, EXEC_QUEUE_FLAG_KERNEL);
>  	} else {
>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
