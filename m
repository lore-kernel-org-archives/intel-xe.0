Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127A5C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 05:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAB410ECF6;
	Tue, 26 Mar 2024 05:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKoC/3Df";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD4F10ECF3
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 05:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711432219; x=1742968219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4nf7b75rXwwDtfUWTkAFmZX3sfnXBUcAn+DfucTrJvg=;
 b=jKoC/3DfEO4sRiUi/AkRZSFRwuPPTwB7wojuXu2imEK4tfAI6ZvBXack
 Fw6hwoADIk7RA+a6nn/OsSPYzASkZTpQ15Kd5X9vIxNLk8InaBVtmJzTb
 uS9eTwXuXgaahXvxp6729SJABjBm9kzPbFj4skl9vRv+KPYgM9Na16zns
 nPQ8ZiHMOT22/o5rAIZ2ft25egnp590utaM6MDmSRZoBVvxVqxmxhsi+4
 EVdC2diDqUlLhOo29GVauTg9aNmr/cLbcmtZuVqFG+QM7aEo7YdNi+n+m
 xOaBLpSgfAIEFGTv1g9+VCAH4Yne3FMgGW2juZc9bC0m5SpztTY4QOnnB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10259573"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="10259573"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 22:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="20570057"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 22:50:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 22:50:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 22:50:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 22:50:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkxY2aVuzCv+7PrS0Ai4iPHXZRqKsMT55mSuLD1mUVxjNkIoEdTFX/erKwuxyzOIIzgxK8CTdD9XhZPy95Thb1ck60l0HERyu75kKu7OqKYMLY9JB3/X94Nby2EzzdRe/LGuAsz/tQfyVTLB4JVzaaFmVc2cHr6mz8Ve6dzJzqnVnyUkUXOSWfjjXBG9pYqBKefV46uGKxBDKX/s9nfX+fHzoH0zT87wcPX1JrVEVf1h9KgSoyMILwpQwTNpTOTBWq9/fLSQuRtdbdrEB/ZXmgGnzIjG5No1jBM0QukZMErNjb8Al86p/kxLm78o9EvDl/uDfr1Kd0ncXJ4qIYN1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6i2b6PPehcPVlvnUiB9/sNSD83zQ63oW5RdAx9YjbY=;
 b=ZGcgBwMMeq+FhZdcFG/pgO3HDkJbPJjV6eqBlpp3LW6ctAH7JzE5RDwcQr0m24ntws0lbIkOZsCW/LS8X8mslTYkqMRPMGsugXpLQ68gMm2i9dlOFw1JL3fGn4fkMbWVamvV+v/8bcI2gnLOoYUUN3S0ePtatOYog155FUjrOLQoLV+6m7rNfqdgvgud67xxR1bEWE/UdpQ/uGoZwNU6Hnm3rjC9Erq53akkEvxY/0j662NO9HPlPpgh+hfYucx9Zh2fEmnqTRvpPychM0x9FGinD1VbrxC/tJj5QRTPkJgVD7dhXXmR/I9FINWnanbvHD4aOdNqbLjPg8su9IS0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 05:50:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 05:50:16 +0000
Date: Tue, 26 Mar 2024 05:49:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Use enum instead of hard coding
Message-ID: <ZgJhpTlz6OfqiaQg@DUT025-TGLU.fm.intel.com>
References: <20240322031558.3343719-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240322031558.3343719-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5073:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZAiwTjVtkEDua/4UCb9XpH53RdzqiKzeJs0RxtwxihDjT3titlFfdKTOKwlpDw/hM/pdk0efxT463D2kJTqYvLse6xxRnjxabjayYN0HpqukNlozMrcxizKuMGtghkjfrET+jN7Uzv5OzMwHpOVNw4QZGTz4VxRfms7QM8vvopqlr/FP2rPyMWCLk4xcJ5sOvWIwLjcU88+PfC14KkxvFfpJ4kodFKHW49FcvBxeinKvV3/c34+BQ3gWqrPCzrmY0V0Y+knI/O0ZP+gzWVzpBu3fFqfzBG0T1Q8jYXCUsR9CMR4tIiS3ow6nE/mDjM5FG0b/6Nb1B9UdLvhCuDaP5v2Y8FgYczolM2P0l0rcRprlau53xB7Di85wg47O2M0BMxr8NzceW7GSaVbNK1G5yYw2D/LQqX08+RhM3T3Vs1a6ALVOqJ6myz4Qoedc7OGw9x9yOPg1PfUOPLpEDHI71VkAxXxnDbt9S53tWUqSUYnrQwMhMsEJQYicwwMglNCefO6DW/O+5ZQ5S0hVhmO+GwwGw4z87KyM6xlsVu9dZqplJwfhy31/1iX0umbA8dj4qU+VhOibtz+xWHiDkHXw2EOQz09DOS1krvmO2sfGhp5U06etmCM4gml8kPq8EouxKv77cnv7yrnCO/7QYJT43Fj/Jy9i56ZypIrVzlo/pZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RDsbJQrJpCVXCVGy4tjBC9L3BuaWxUoxANK542oWMfn5yWtDavkgCbbfYZzk?=
 =?us-ascii?Q?6+Y2guhPXNhsaZ+sYNFZSnxRqj50HX9+AnqZUXjWRNHKtvwvbnwqkif55bj1?=
 =?us-ascii?Q?vD1/t6Yt2yyocPxbBgnDLIqUNWU7slROuWOs27aYI4m4JLr/tKJqSR1v1qqc?=
 =?us-ascii?Q?9KTr7dpIpcKycDGVMSQokJC3zIGjajsMjlcqfJFKT6VbJUXRXHDJRRDdkAeh?=
 =?us-ascii?Q?Q393HPP/R7XTpX1o2K9i71ETVqodYh81Q/jhfInTQ1ru3DmRi9R38RDW9xCX?=
 =?us-ascii?Q?kYQp1UG8/BOTNqQVgdwmy6lrT7S7S5kHKaffEsvV60nCLJ1A1WfZeM03AJP4?=
 =?us-ascii?Q?E9NUyHx72JlOjdziIhw3JbvJO6RrAZV0mUmfxyj1j3g/ygGeHSvz7svHTZor?=
 =?us-ascii?Q?1SeucJalebogwCp6gH4ItKJcb6wQfd6/US+VG4ZVzG3Vz/G6mMxoO2H8gOXY?=
 =?us-ascii?Q?Qget1F4mRJu/vz5KUL5fXupWaydYXhDiVuPp23hDCBFTJYf1hhhRoXHHLVHj?=
 =?us-ascii?Q?gDzGopIB1oH20o+Zkym1qKpb5CFiiDWswzjzMlaKLzcLHwauPGl0vN0NTc4G?=
 =?us-ascii?Q?fsRumGtDUOSxIRqklbU34tuyT/TdtvupZMCADU1hlNKWODP3wIzMlnUILQyM?=
 =?us-ascii?Q?4OO81Mt1L/5EDPkbIql6UwiNMNjunzRKVJaxcMawbR1kYBA1uhjg6uM//rM1?=
 =?us-ascii?Q?QzGVP1wt/jh9jrmtlX62LiGAwwCRV5UqFbQLcrWoHnr+2W/cvFmgR/wnmZos?=
 =?us-ascii?Q?Pe7NdfpVU6Z12wNrBESdxCBjg6c8z3h62tJjQoLC2sAWwgsCt6SGFic+7QSB?=
 =?us-ascii?Q?xcc4Iqxn6NJSFaEKHj/F45F9nNSju9nSZyqVz05OIxDcBExBtlg+iJjbBsV6?=
 =?us-ascii?Q?YSiSAMp1CGU7osAa44hDTh6E7Exopc7XU0oS+N9aMm6YNOsdd1A8jNvXbc9v?=
 =?us-ascii?Q?3S5qI7hPVcZtR0+bPIWBUUgptYx/bBD6Vm9+D72SvxrjJIBy9AKSokIzm8m5?=
 =?us-ascii?Q?bZekvvMGzg6z2OikfZAihOOZtp+b3Debh/5kcOzg70WZ5Opws58Kn6h5Bniq?=
 =?us-ascii?Q?lJ+ktqgOhlRzQd9dStqAMDvMCu1AJMPGtpS+HFh3CMw0s/ZHEvD6lc8cdy0F?=
 =?us-ascii?Q?16NJpKBCiu+8XlpxxN4wJMeJvRof99MWRobvYf3AjB+l7lR8ENyGIjZcKJ+1?=
 =?us-ascii?Q?f6XEkalGUjULly4SwShyoHV35ZvGqSH93krZKafr42O18oreS3gwIRRlVRQV?=
 =?us-ascii?Q?17EWECxZeRJVr495Eo/EX/tqv8kjxjWmv1RkOEebnhiteMWUynnwXI3W5KyF?=
 =?us-ascii?Q?ftlvVR7zeUohpDMcMZ9faWLmxANQEcBlt+U3ALG2I8LCVJ8/NZbEUxWQC+Bw?=
 =?us-ascii?Q?YKc/OXlQ/HCk8CNC/cVMrWI+n10NsdwXERMhTquaC7CQhtJSAXBw2KBgC70c?=
 =?us-ascii?Q?8vTa8WFBrhR4Sz7ifYJitVXQpcgRu9DbrU3HNX5W/MgpodSBQ7JtFb/eIjUN?=
 =?us-ascii?Q?WYDliMSDaIm1lVO3D6QMw4AFq+7oGIZaTEq06O5G9I3WQqVUfCLldRVxdrYc?=
 =?us-ascii?Q?+JS22yJKMiISy2FF01a/oAerPu+pNBDqNgCVP1njLxSJxIQCesycauHGn5mY?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3a60cb-1bc3-4bbc-e203-08dc4d589c7c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 05:50:15.9245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sawh7xOqPYbp6oRHY3rw7g0gCLci/rp9XByeWhXkUZ0dsCaul0gJancoPeLOrkkbOfTGR4byzgd3axCqHNTCrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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

On Fri, Mar 22, 2024 at 08:45:58AM +0530, Himal Prasad Ghimiray wrote:
> Instead of hardcoding the value 0, pass DRM_SCHED_PRIORITY_KERNEL as an
> argument to drm_sched_entity_init.
> 
> v2
> - Make changes in xe_execlist too. (Rodrigo)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Hold on, this is intentionally set to 0 not DRM_SCHED_PRIORITY_KERNEL.
In Xe we configure the scheduler with 1 priority level, thus the value
has to be zero. i.e. if enum DRM_SCHED_PRIORITY_KERNEL changes to
non-zero we are broken.

Better leave as is, or add new define like XE_SCHED_PRIORITY_DEFAULT == 0.

Matt

> ---
>  drivers/gpu/drm/xe/xe_execlist.c      | 2 +-
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index dece2785933c..57d3c11da591 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -341,7 +341,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  		goto err_free;
>  
>  	sched = &exl->sched;
> -	err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
> +	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_KERNEL, &sched, 1, NULL);
>  	if (err)
>  		goto err_sched;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 10c6bb9c9386..1f712f4fc76a 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -63,7 +63,7 @@ static inline int
>  xe_sched_entity_init(struct xe_sched_entity *entity,
>  		     struct xe_gpu_scheduler *sched)
>  {
> -	return drm_sched_entity_init(entity, 0,
> +	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
>  				     (struct drm_gpu_scheduler **)&sched,
>  				     1, NULL);
>  }
> -- 
> 2.25.1
> 
