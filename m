Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44782C54798
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 14:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DFF10EC24;
	Fri, 23 Feb 2024 14:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgCRJK2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD0E10EC26
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Feb 2024 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708697773; x=1740233773;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O8Gy+Qi4HVc5mYwPFe+RXtuTbS3UeDq2NZn6VqjRrNY=;
 b=LgCRJK2Bf2sR6IOuMXJ3k1tQSwekoydmSNXz6qBJt+TdiWwBy8KUFaOY
 aBQIeM9mfGjXH7Oh/yU34K1cSdqBKrKjoesJLRepKPyWfRT/iIOlEfX2z
 AjWQ3hurraBf7dpWKk1uAYtAoo7ij3ulRoA4f8V9ApN8rLoMFhzgTfBIL
 PWnmxMoG+h7vw7ShHXuP2ck61umAX5A3a6dxChHPSZfOQxalfEUCvYy6W
 s70P0AUFt5xuV+SJZ0qoVLeSmHuZCng17mNR0Uh306YafNdeTVUuBIoQo
 SqTn6nVXfqyhOu/uOZ9Qlmk89eyA5bWndbKU6ayH6HbiATWx7YKhLaTLU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="5958330"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5958330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 06:16:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5896849"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 06:16:12 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 06:16:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 06:16:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 06:16:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xd7c21eCFRoyWoZ8QMZlAUWSnqf2d4iR0BoiqJ0OSC4NdEBXKdFwSw5Al/MpYyOJAxh92GB6xuWkXvRRXBmsUskVyoWl6cLWJb4G4iWdDNuitVmDMI/WDnGUgizBB0HMN/ZQlkNfudSgMsYBhsF1F6N7Yt4hdudcBlNhLMTB+qSDaVW06qLil5XpNgqqbyFUiGTpDa/vQBPOKJM5iQg/d6cya5H78MyZum7cJwsSvAJlZjnMmgpRTcWcguRxdd2Mz/fhOcA/AaDOgxaDSNg1tgOwzIJ+oS0aMdXyVeLNT0yrO6pgO2NGJsdlfvajWpoyKD7K+ipHUI4R7feLfT2YIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uHLGp8a0osow0IktCGHKK2NvLqh+NSPaVJcHZLdN3A=;
 b=SLJlrMIyGQRRBxFeL1pIVbICa0mOwmAsY69/fQ6llGD6tX+Z0jmaFGGRdejImgM59OdbGENr7OJr++uNof3PUBvyvkC3GUGmh2VRxnklhDVgWUVeap/1Qzu0L8OTvivFqfVWeZog7PqOdw3NCLhLKbhy/MdrY7UqHAlwf546/q4ylo8uU55WgQdogR1GRU7yfj9Y6rxhoAfWJeKgUjuXcfKtWyYBEWwEXSXcUnCZb3GyNMK5g+El0vIGFhjEnmaXu8VUUVy9p4ZtVaoah+0lHfU9Tyl91YNlj2Kl6agQVSjaz8agckpUNVpyJ7l36hUomHxl/tjik/04ELSqhtVL3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Fri, 23 Feb
 2024 14:16:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 14:16:09 +0000
Date: Fri, 23 Feb 2024 09:16:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/xe: Don't support execlists in
 xe_gt_tlb_invalidation layer
Message-ID: <ZdiopL7khdFSJSXE@intel.com>
References: <20240222232021.3911545-1-matthew.brost@intel.com>
 <20240222232021.3911545-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240222232021.3911545-4-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c92ade-e286-438e-c693-08dc3479fb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FevLAKp6alDDG3r9bU3raroAI/8glxhebVx81X2DWh7xXsNhBambt05Yi8eJpuQIrOzdtTGJxlV6Y1y2apcRr0iPTjtfoWgWceAXnmUfDHgWQugL/KcCj+XnXoTn7r8//xpjm0E7Crd3uKMwgK0wh5Op+QwcbMLpNNsziuuxi1p7YhTuN5/1BBkFRpmj8iTxcVou27+RrY4qq8CgF8Ucy9R1DexyAWv72x48UdkU+YaAKwLu2eh5jZ+M2CRKuw3+CnIOJgGDNkCPpjlILs08bxovdbG8Cz2wWE38iLWQRk8fQZ52FeldZeGnxsKoKQV6inAGngviHhu7NDvH0NUkLGbour2qQgf7VGMiGSjdXohsLmfeXTc1fFnCwoNLc9pV2WudytlAM/q1YeVumXD+Mvv+vuW8juZBy3E7J3G5yKYcgaQJz/igc2J5ZxoSRIlkM6sJ2eL0p+dfmlSz/+rwzY8tyz4LmZ+gj8nSYQFanN1faQF6g5VMLyG5wrCstN5LquPwysxmI/D8jHcl1ngWencYAZ476ydfo45NLphf7J4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EoC13zKC/ykDAA3jxfg4WKeGR3zdZh+jSRtAO8jLojxQ1wcPjASwbR0lffzV?=
 =?us-ascii?Q?rRkIV20HzTnyU/60l5c7rAv0fFgzOfmKPflVUhFAS7atxt09AlH/yaQijVOJ?=
 =?us-ascii?Q?Vz7Xywg23FnKiyki8i8UEOHNSS1NslatNpC2XHFVgluvuGKyhRInd6l+sdPY?=
 =?us-ascii?Q?Cam6pkB74nQa4etFT/NLkz8vg7K0lKBeOyLb5t9zTNwUbjHJl0UIF0YRyTMy?=
 =?us-ascii?Q?q33s5jArD170IDjVnxzwIqlVG6TsC3Kml9GqIvvehCvhXajWdzPmqjsUl4kh?=
 =?us-ascii?Q?Izs7YkNo5SnGskbekB5ztSYSJYiLRcOPkVnnYhRKvhVXXTv7tRQwYa772g8g?=
 =?us-ascii?Q?huqNPoygw3DsMego6skRw486TsSW/0IANz1ziR8bOSE9Z+waJ2lHOWV6loy0?=
 =?us-ascii?Q?2YtXj430cZec0pl9+5nA7gUoH4iqHRHG8IMF3omdkWVsce/k3nIEyjrXZA3q?=
 =?us-ascii?Q?FYfKN4cRyUnRKe0YWp2Ta24I++V1OaRNLfegBpdoD5UplxZ1p1GjPdlD9ScA?=
 =?us-ascii?Q?Lqz1BeLUUg9Nh4mD3UAyGV3qsDHIoTDr7C4u3rCQMkgcqzkKJtXi5qjHVbB7?=
 =?us-ascii?Q?yoocMm5gT3xH8CpW4zGjtmO12XgTJ974aZMsAQj6egQfnP0GwupKPbVX0pvt?=
 =?us-ascii?Q?cABbDGUgW5czwc7LIgJrw5MJBZknhnWelSVYVkXJGSsItRnbPjnf5J+yXxX0?=
 =?us-ascii?Q?MGKlNE7eCSRsWIUqswJPRzKgtGz8hzru8XZlUgdnXCn4ZJ74EXouMXtgeOzj?=
 =?us-ascii?Q?2q/gOmnGSQKHJs+yHITVzBabL1MVYuMmAagb9+AloyMrA1qJuhIBfY2eBYhO?=
 =?us-ascii?Q?X3nEY9IpmS44bKYelYBOdiA15A1dF/JGrp4qyFKS2oNCvjVNw3xvQWte2/a+?=
 =?us-ascii?Q?Qk61lf3rmLRJO5aHFKqly9sAoC4pSq7+hmPu2R/41W4LhG9paiQ1h/usjpnq?=
 =?us-ascii?Q?U3m08ONdXbgo6irrPSF6OR0HA38DYjKE5PdqUnHbaQ7xLXOdFEyCRIlgwjFR?=
 =?us-ascii?Q?iTm0INpRt6UNcKyXbp2Jl+ALIKmd6ZCoBXydx/dMPvS+6eci6fssVm8nBUCo?=
 =?us-ascii?Q?2kjipKwSOQ6xbiJiHplxrW4Vh8qCVMNHTSisr3KdGtcv9HeCDSi72q0Bk4Ew?=
 =?us-ascii?Q?Fzp5zFfmZ13Lb4H3MlGjwaHfuslj96GpeaFZbGUULxtXypT2vuJvzJg6vBx6?=
 =?us-ascii?Q?os/cNT06CdcubgmHsLANEcatGEH+4e6dmwSEYPUluzAsxzEya6UX8KkLKDmH?=
 =?us-ascii?Q?QNdQbn60dUsLm2MoUokCiZSei4iwHTolamUA18fMbDv6jYq6/6CmWo9o+uO/?=
 =?us-ascii?Q?O2MqHg0Kt+VWyPNoDA/GjktDYtHe0RUojYAUToBVohDehcaLKd6fJNInhyl1?=
 =?us-ascii?Q?ZOnLkj84K27kvvMz9WTAYS179V9X6E0AwxcIdTauY2eMfkyWTJXZLrgWpgir?=
 =?us-ascii?Q?eTrUntrCPwW5vFI8I2noxfvwnVR6y/CBmMoTS+4lHW6RGxxaM44/ng8CnTUh?=
 =?us-ascii?Q?TNoLw9bWuyfy9am+l9hpkXzKoyr04X9SRNRxdDSei7E0VEixlEIkVHZ6m97P?=
 =?us-ascii?Q?eATDwh/ccHwY5Eo10SvR9tjwLG8DIem+Ppzaa6bO5w/YBil11fpbDizHmj11?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c92ade-e286-438e-c693-08dc3479fb43
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 14:16:09.3991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ThaQ53VlVD2+njPwzEPnoL7NoG8XSfqtt0rtY9ngSS379IzA6sIDIgeo91Fqr9YfXmOrm0slK+VyAR0q1OspA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
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

On Thu, Feb 22, 2024 at 03:20:21PM -0800, Matthew Brost wrote:
> The xe_gt_tlb_invalidation layer implements TLB invalidations for a GuC
> backend. Simply return if in execlists mode. A follow up may properly
> implement the xe_gt_tlb_invalidation layer for both GuC and execlists.
> 
> Fixes: a9351846d945 ("drm/xe: Break of TLB invalidation into its own file")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 48bf5fdb0fbe..71ab03956670 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -286,6 +286,14 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  
>  	xe_gt_assert(gt, vma);
>  
> +	/* Execlists not supported */
> +	if (gt_to_xe(gt)->info.force_execlist) {
> +		if (fence)
> +			__invalidation_fence_signal(fence);
> +
> +		return 0;
> +	}
> +
>  	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
>  	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
>  	if (!xe->info.has_range_tlb_invalidation) {
> @@ -354,6 +362,10 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int ret;
>  
> +	/* Execlists not supported */
> +	if (gt_to_xe(gt)->info.force_execlist)
> +		return 0;
> +
>  	/*
>  	 * XXX: See above, this algorithm only works if seqno are always in
>  	 * order
> -- 
> 2.34.1
> 
