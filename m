Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34671C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 18:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F2F10E201;
	Tue,  5 Mar 2024 18:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBJEV6p0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7349510E201
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709665122; x=1741201122;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w/ZPJEeBwPaIJn7dAb12ZVKIk7JlQGQBS6Oz2dBDQX0=;
 b=QBJEV6p0hYetw+NB2+6azGQ1+WJlReZjb9W4SiZ+39nt4s88GdJZGgSr
 SrZG6jNh7DbpXZy3U/rIJCMo7bKeVMKF4T+eD7jYjmxf+6ivD+lSsssEE
 aleszmm8Dx7c4Nq+iWNoA8mzKOoomhthyVXh9UzUH8uVKfWbXkwSt+oJ2
 qve8ypsKSsHM70El6Zouw/0JQxM48qYg1uRm2uEkEOY2HlKn7JfD608zP
 xX+cIRVnuV5asxnuvufcdhX5hwFLIJy01bgw+Uvz/s0/Q6DK6ppuTKlsV
 qiIFpEiM3nbaJKG+7hBpq06/sbbCQ96+WtXqpyLYZhDFsOhymnBuGChPU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4416143"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4416143"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 10:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9545120"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 10:58:41 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 10:58:40 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 10:58:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 10:58:39 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 10:58:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVxVDBawW2Gp+jqRjJKze6R9kewNHDufLDIfvexMefrXKebL6pcnKZwoKW1bZkPDVPUD4wbTBXGCNb9Kda6Oi2grp8rKNnir9Bwr749GmkNVyIWVbfnk0ho7ZX+DUHF6BIyh6tpHl8uzevU36tGfYaEas25/8SaXfKIr65XW4WSAkZvTvapndJCCsusphtkLSVAjywXfgdNak9JLfYMlkM/uwe2j751tvYUvCJQOH3gFx5Y7ogvx73VWDfSITJAE8QVolO432ZZ71bh7RQHd3zNKBDjJiIn+9t0kxRA52/+8t57rpjEw/1X9WmOuSm+LenziH8y2BhVbPak4E3vqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yl5er84GG4zLMrvtfL5WUwjuf6xsW260o53i94Y96MU=;
 b=hMPGCzUUehVZVjB2fQ3WwKffreX85FzB+YEVdvhGWpaJ+mLINoYwDcZNzf1oRQ69eLl/F/oDYY7dAhuEgHgb3/CxGzWxUm/dG4iOxHkbigQDLxoepyuds5V9T3BZbjsKEKvOb2/haSV5NQTZsBcYCq3DQu2Cwbr6a0Ds3OGRAaTiGRLjIrPku6lJSEpLaCRCmRP1NsNDu+ep9+s/RFysdvR4MKqMSSQpZ9DZ1YZZJPrNBe3MXoA86bfGAN6ISON2QQMoxNuZsYbnGGt8fSF5C5vc9TnjOtN+v0NaHjxUhPc0aFRX2QCw+puilg6AetZtRhHnFNjSfu9Jl54E6twaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6656.namprd11.prod.outlook.com (2603:10b6:806:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 18:58:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 18:58:37 +0000
Date: Tue, 5 Mar 2024 18:57:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Do not grab forcewakes when issuing GGTT TLB
 invalidation via GuC
Message-ID: <ZedrH8URnZU/PGTS@DUT025-TGLU.fm.intel.com>
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
 <20240305131250.5330-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240305131250.5330-3-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BYAPR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:40::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: f4107eb2-eb97-4aab-71f3-08dc3d4643c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5xh6Kd8dFQDBVg/EKfEGORlREOAnSkJHfZyRYrMM9zKpz9UMxDEz7aU2WhPOWYOg6ShhWaA2jTHyNwsXNwZ5R70I98PBp0kq9uHd7aueKppgVTdsyYXNKmCcKcJdRmOxdj7Ul9WK/U0vCzKsdNfOlVL7UzQazmzOq1W+McGiiaasRMFrHgb8IxfRKJ08/tQeYClVgOFa2I7bgy/hiRnf/lmPSdlz+fVgryMqZGkK5Quodi6a6IhKP2qR39FAB7sBxSdQ73Q4+K6gKs/1hcJX75IfBc6JEOqiVmzsJ8KGEH6LtDlaZlR3s6y1Ip7SsOBKbQFFOGP5Zwkh8iLTLxpUe+52nRXwAkzJzMg1xDkAB6eQdGtrTiWVu63rYbEKcJctTeMCBZugQsrhy1QN3evysMqq47XkgYWb7AYrDgz7827o/uEJjtBB7dckFRsP8IHYSGfaywFx2+iv+TWi7lqfHZBzOL0Fd9SSp7jqqure55o44DkBnyspvGTLnZkkMiixunjtHSIac7trOzWy1OC095oofs4ARgkNh4S05EVdtMVnohJZDBvjwWGuJO3g1IFchCvt35oFLgvvpG1M2rjOP5GPNuvm8dpGEsUpio7lC2TCLT57jhjR7Z2TpWlMPR1OKg4Kn7xjLHH7uFPp3xVSdW8afrgmpwBUzT/Jxc0T6I8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uNSGnCNz9TW3pW/5/KZo2VJekbxWKPoyvl3iag1gLZ+RlVPv8mN5rXwJlUrL?=
 =?us-ascii?Q?Vr4yUhi9sWPm2FqPPhOoOqNJceiCu04/p/+186r15IP0FnDH03ZsxdLXogb+?=
 =?us-ascii?Q?7Wv614m3iW5thOoD+jYOxuNWS/xDYmacU9JPXYwH71E4nzWUmaMTFUPjtYF3?=
 =?us-ascii?Q?2Fz99WCQs0xOnNsKpX1HBAlXSSAigobmBHI70tVvdZw42UY4VQj731/Glwx3?=
 =?us-ascii?Q?XWruYClHpT+gHtfI1w7wsCXFwGKTv7GUqMHfvn6WiPqQJwpS+kaIKmh0jJ60?=
 =?us-ascii?Q?0VLFMAEIoEAJQVfMr+s+wvlKgbnB+gD1LOcc4frs/imA1kEMKDtK5MhdTqBQ?=
 =?us-ascii?Q?nIswqCcZ9LznbifcHMj7w0XeuUVPqyljn9Fd/v64qxOqnLUIpD4ClwaIznye?=
 =?us-ascii?Q?wfMHHyxtQBChugSqtaVZMIQUAK81DuKURCilmpAEBGC/iPwJe9BaDwBDiHKK?=
 =?us-ascii?Q?T4yqG9il9saLQFZattKLcMYOniS+yLn0Kr9D1tD8o/OgJEgYFACgJJ6I2W9W?=
 =?us-ascii?Q?99pUUtDR9u8aZybYFn2TcrO/8E11VtoLVL9pU/EWR/ZSDsgINonyB0Nn7g/a?=
 =?us-ascii?Q?1zfF8SOeWjFmmY+rbl6qrxYJ7AyTyLNcv0yufs7KzJiZtWgkPZvQWu9t4Nds?=
 =?us-ascii?Q?Cgfnkta59vgi7oDJbGKrz1KYEFblBENXNZv7huhlNnULIIjENhpROPzgaeEs?=
 =?us-ascii?Q?QydAv34DpnTPzqMLrs6xULKCwmbQy00tuS8EtciRQQ+bEwL7LqPtez7NLlaS?=
 =?us-ascii?Q?TlJ4TZ6cdG9lx7wX2wRLDSKes9uRIvm91LczpU0vrfkUi8RbS3v5YpdPhmgi?=
 =?us-ascii?Q?HO3hHE5v50tPh8RfJdzwe2vKS8Kxxywprub7uzL1HgADVREpMGKslytJ4mhD?=
 =?us-ascii?Q?gXDUq8L5sILfGzjVa2GU0e11gCiM3r75s+HjtBoIK8mN2aLaQxDcHPEGWCHU?=
 =?us-ascii?Q?Awyc5TgDwozWrFLHXFDONbPr44Z/EqBeAWyzVn6EreJXAHsRZGH6O/Vphsb0?=
 =?us-ascii?Q?fCEUZtbS8dInzXIAo/58ql3OjMLgTwvUzMyQjcqJL80rirJlGiz4YiVSIVs4?=
 =?us-ascii?Q?ERShIwIyCFBp7jnmkV+ynJfeSVUFX33brKUlpaHBhoKvRqq1OFJDtxivscWg?=
 =?us-ascii?Q?28bHIwnL4atfcIs/+tm2ctxTcgWbUpIDbovDmmfkWE5+23HQCvY+bbicWlMH?=
 =?us-ascii?Q?DudKJdEi6IBdW2F5XrDdwzQGp0aIpbYrqz0Wb9xdb6si3u5YgnOdJSNM9lrp?=
 =?us-ascii?Q?XgOekb5v6gL96DjERwjeCbEpKRZMRjUP11n61QKiVm11ee6DvqJ1QTJARlBf?=
 =?us-ascii?Q?b4FtdRtmbATY2q0XyIZUUv/+tha8Wt6pBqsIkYm0XoEW8rMdSBbQh3paWEum?=
 =?us-ascii?Q?hVishhoKDX4D3CSN911aYsU7IEl3tqj4X04aiJlpCwJHojJRul43HAmg2Ga1?=
 =?us-ascii?Q?rvGGKcgD2xxagnc9REly7ow0UB9bs+vcIb2mAvM20PbrkrP8CShl5K2j+0ky?=
 =?us-ascii?Q?Ctal5T59p9aig5NyAe+VejECzJcViJHqGkyq/20P14/CB88y4nZF5h8V0feb?=
 =?us-ascii?Q?6+g4jjy9J9RpCgnm/s+D0aP28caSRx4+4fSvpaFxfHGucYSCArev8ygBkj4N?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4107eb2-eb97-4aab-71f3-08dc3d4643c8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 18:58:37.5335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZ43RhcAiJQxB1b9fNHcAuoRQiI7ebFnkfVVVOh6ErhGTdxfdOVRBbMiCkgO7vK0tloitV+nCA8p6g7/+lOzDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6656
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

On Tue, Mar 05, 2024 at 02:12:48PM +0100, Maarten Lankhorst wrote:
> Forcewakes are not required for communication with the GuC via CTB
> as it is a memory based interfaced. Acquring forcewakes takes
> considerable time. With that, do not grab a forcewake when issuing a
> GGTT TLB invalidation via the GuC.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I am the author too.

Matt

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c                | 7 -------
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0435e1202c46..325337c38961 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -256,16 +256,9 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  	if (!gt)
>  		return;
>  
> -	/*
> -	 * Invalidation can happen when there's no in-flight work keeping the
> -	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
> -	 * and GuC are accessible.
> -	 */
> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	err = xe_gt_tlb_invalidation_ggtt(gt);
>  	if (err)
>  		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  }
>  
>  void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index f29ee1ccfa71..a3c4ffba679d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -247,6 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  
>  		xe_gt_tlb_invalidation_wait(gt, seqno);
>  	} else if (xe_device_uc_enabled(xe)) {
> +		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> @@ -256,6 +257,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  			xe_mmio_write32(gt, GUC_TLB_INV_CR,
>  					GUC_TLB_INV_CR_INVALIDATE);
>  		}
> +		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 
