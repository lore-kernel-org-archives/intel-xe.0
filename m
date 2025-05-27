Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CE4C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 18:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B9710E061;
	Tue, 27 May 2025 18:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6Ivop8G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5A210E061
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748370414; x=1779906414;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dRUtkDUlC9gSJzBlnGgPcZfjMRAg/TtqczKdbVcCo4Q=;
 b=M6Ivop8GIiYlpfgvgnI9mipnb8+4tIMdHFdfHgJtQqssCfj+4mK+xrav
 2+btP/3Mdn0/1OVrVwCWDOWTFwvYbnGocG0N96P7L0erPFtvLnnI9Kzjb
 ZeSCqKTsTHR4T3y87lYZc4t6ONvPFPuhT0c4HZL/ccu4azBAWbFbbL1hk
 bCpDCThoRhh8U5qe1qgTqeMVNZBdzxkCf92OhYo7T86aLQFfMPspG8ScF
 O3vvnBSo4+HzOqgb78qoNvAhA8h0tEcdksDppcD1d0FuTWHZ0eP6m71h5
 JKRbuF3c4CZPzO53EfNK5uwjhYI1H+s0FuV5045i9GfOBmBo3gtln876Y w==;
X-CSE-ConnectionGUID: WqmryfiFSPGzyFdEPVTwow==
X-CSE-MsgGUID: 2Nplbm12TGO8rKZ6eQLovA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50534506"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="50534506"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:26:53 -0700
X-CSE-ConnectionGUID: oAdRLlwlRz6M2F2DHDy/hQ==
X-CSE-MsgGUID: tgo22EFCShevVsafJPxTpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="146798348"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:26:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 11:26:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 11:26:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 11:26:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ji/6gjbbUym8lI9ZF65oMQ0Nw8P2u8MFXJ9tO7cMedKlukrMx44B1lMBicb6bjuuVj42tY5GQzrFVJRhDzpqNX0l1gPjYyvKJZLN/aD6wk6kjfEEbfTtKGyOrVecc3Owtj3iJE5y47lmpRK6+vTuJxA86W+xLMbv/+tK33tmrx1uZGgpCV+e5DI6h03HQwR+h208WiX4kMETTo3ZtNW6h//pd1myCe/3BKPdtmghQDe/TSLdYcmFsThhS0amOXtwDClLlo68c/wg6ZoHE8qTKwmg9I9lEY8ol/PJRGungneV2e2zrQ+3EbjQUGMOCMy3N7Osi+Evue7oIVashDcwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CLcN+MLEZoX8UE3y7vdjmxuMxedQj/U3i8aHamf9KI=;
 b=JiSqHrohIn+03dPz93kv6k/kLKQyTXj5pr83WMT00imKGZYvaNLZGcRjxLVsu8/zl0A6nNj3Bx82mRQ9i/VntP8zmfjvZ/AeNww48koMRaBxlIlQoN8R3geZk50/0PZP5P0XVACeBIGp7efvjuWhw8GKLxqN09PzazI9FgarZS2F3tYFBWOIyUttef1CvfWK4PBkn+MEYjH0G5EGh8m4iFvvo0kTfHEUuAleC70uFbdyoFlbv9Uvb5pvqyz68BAc+0J7HgE46DlqCmu9kzpYAoORG7v5yh31dN37+iBiPN1Gj18N6MfkP1aI6eD+ysq5TCrYGK+CfDKwNGKbrFG0ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 18:26:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 18:26:50 +0000
Date: Tue, 27 May 2025 11:28:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe/svm: Avoid duplicate eviction on get_pages()
 failure
Message-ID: <aDYEMuvMKNaU46UP@lstrano-desk.jf.intel.com>
References: <20250526163907.1011529-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250526163907.1011529-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: c12ec13c-3361-4bc0-8a69-08dd9d4c00c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FcSXmx6xnZ4DathIAmz1CCRFQI29gqBOwp0+NNR9aZsf8mVJcEwy3VqeFxPM?=
 =?us-ascii?Q?QtFpnZKXg1RaZur83Cx0sAEGVSOsKQKcwRAjY7LuSxC5746etFCt3KPZLtwE?=
 =?us-ascii?Q?XRwrgy/8T75ECy/lIfG5OXQ0T57rk94xQEycIoK67WNm/0gLmj0aHkwRash1?=
 =?us-ascii?Q?sgIxmr/nkmMcCmTzRoZmAPcrvmUbQmZ8FFUTcuopw4PCFILoakuWUHo1JczE?=
 =?us-ascii?Q?MVbYIeieKD65L56mq/qL+hW4VIRKOFuJFzZlbV5MK4wt764EzLIBlOVIsvVR?=
 =?us-ascii?Q?8v7K7dR92q/5BknzuOYI5tAGeta/eDM0PjQn5HzvmYWV6OcqBDA9rxSyQ5+T?=
 =?us-ascii?Q?fhKTNw6jUFoo18AnAShcXU2zVYukXZLuqsoxfOKnAvkoYRLBCsycAoWKapAj?=
 =?us-ascii?Q?OrWNpkQwqA5E0+QHw47CcClJdMu8LQdDDLmUPEU9f5HwN62ps3juZcgn/XNd?=
 =?us-ascii?Q?5PgROvITpBc9CxESRB5hL+L/Um62X6LyTTIVqLJj0bYydd89SD2AANb2fpuV?=
 =?us-ascii?Q?U4URfINpVP3KFixKH0xPED1HWALtzGcVeAmThG3Yw4ebj1e0ZiWmVUQIe+Z2?=
 =?us-ascii?Q?9/xVrKCsiQnNZeEEIPCUnm8kGoZFUjsKD7tc6HSTf6jon+Td51KuAzLwS/UB?=
 =?us-ascii?Q?2T2/U+LUFMfdMgo8yg99VKCNwJq2Uu/+uc14KKslD97OZAJdKLGbd7LCERi4?=
 =?us-ascii?Q?pVrdlLOmapfEylJus0rq2+TqQOexBswDcT8ZvonKGf7ZzdeqEDx1SFBGXgsl?=
 =?us-ascii?Q?4bqB+/s4DXB2ew7VEXEipTgUvkDxkabEmGb8/QyVlapsGQZ9MtR/bSOZ/UH9?=
 =?us-ascii?Q?Uz/esmySpdM0RP/+oAfwQrmML530++N1uvNmhGS/IARVHlp/i43AdnvrVZni?=
 =?us-ascii?Q?HkAlzhjwVKmeCPynffI8p07nKh9dcmbtH+nULjRjdjI9+bxTo0DdSgreDuNE?=
 =?us-ascii?Q?66nmW+10RGjocTTNUCE29vxJFH+qaZSABW58tAPJvxmKzfBnzcWu81oZ8Y4i?=
 =?us-ascii?Q?vIO+JqJ7bIhHfQBWELdi0hRgyykoIX7Wdzud4zQjaqpbobaPufOeiLRPYRV6?=
 =?us-ascii?Q?41wORXGGHIEYRVJxZ0lG9yKFkapvE2ALwpHSYDi5H3eCxLQpgJ/CHTzb5Cf3?=
 =?us-ascii?Q?jAo3ZIpqFWwDKk+bqcB2b2fw6sXmcihnvzkiMmvJh5RNLludScg/gLnGZ5ZZ?=
 =?us-ascii?Q?Y2LtcPQo/bvjTRhI5aA6BHXwhu3k0w3Q7aDcI94+EtmHgyBt4ZKnl8eggmMv?=
 =?us-ascii?Q?k6i490yTm1jhbj09pdU5AX8YrdcZFbehRR0Hv/lPOSxCSZ8Qk/xrF1429Jgr?=
 =?us-ascii?Q?2yeJT00WdPsSpDRVHas3Eeeh9+h1NgFHtL1xA5en0jy8gKeGbdM/auqwiJgs?=
 =?us-ascii?Q?XxfiDDeqloMKh3OYw4MyOyjsqrrDx/SzZnmenjURN2a7ITigijnjEHWxTWTK?=
 =?us-ascii?Q?4T3vEZAhJ0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z+HwS+digHM11/SRXQOwCvOIAixFXWKYf4Ns+8hVGjp9VC796SPQL/6TAy2d?=
 =?us-ascii?Q?mHwze6Iyq3gm8tFxUstpMC7Ua/j12Ng6oBs1xtQtAlYgOnoPoCcJQytLihDm?=
 =?us-ascii?Q?UpfPCXsf04N2OG/BV93gjk+LiyXaM4ICDGl7NOdrDXiwv73ZGdihpUGytnf7?=
 =?us-ascii?Q?i2zQ9LAkZAXFKWJlRmoH7HIqs+tovVBwC85h7xxklh+/ioJlAQWpUy4OiHl9?=
 =?us-ascii?Q?4hIXzJpU2O781hL9Xib057lLHsDxlFE0t/b9woxSc6W4ZfNw8lsCpgKJmAap?=
 =?us-ascii?Q?BZ7oY1Vmp1TM+rD7eB/5Qd9SOh2DS6M4rZdtigiyyzrZT5dZTTFk/cjR/mhQ?=
 =?us-ascii?Q?GEzvcBPW8pPsBhL2osxEhDzTUZYMDORa76aj3jccRhVON4I4nItVW4gbrbb1?=
 =?us-ascii?Q?f1cUQgwaF74PSs9AgP0OA9Jifmc4W2zJ43i7MHZKWvqh8i3JEYhLJ9SW6sjI?=
 =?us-ascii?Q?MSjQOVWeoohWLBdM13bs+J3P4oq9sdiDYv7V1+HOpyMCw/lrwnl6pK0U2jGz?=
 =?us-ascii?Q?ckW5usyTCG/rxWYy8vzcS9plMrUOKUHAnkjs5zDcA+zBqqzOV6Jp2Lo8IG6L?=
 =?us-ascii?Q?6W/lQJIRoOVMaydWm6Yznjaq9fwwSh/9E92NqlLUbl4lDPEoTmVX67nOjEKX?=
 =?us-ascii?Q?qq7vTRAcBFjzMeCFCxdkciLs75QX5gabGPXirIGx1RiGK7nHEloYo5kcTXl+?=
 =?us-ascii?Q?3sIIa6TUg1cOpl4p5SIP98vImcM5xRieKg70Mrp3TftXPRr9EHazQG1erNMN?=
 =?us-ascii?Q?cG3IKZcAGeERyCphsrrqECPcjbOVvhdYzdWPWJ/3D91r6n+GKqfKejWjanHs?=
 =?us-ascii?Q?oV2wMCe3jUwNTdUNd17MfCTVgm1A187z1bVyQRCIX0Jc7L7RGgBP/bg0WGWf?=
 =?us-ascii?Q?CNVTPz7LNV17YSDd1R3XJfB1c+hxrOFSgbPQkUkZq2dvvZagNCxJAE+7t9RL?=
 =?us-ascii?Q?1dq/dPMa3Wa7Jc1s4MsBN8XRtW8IEazLxqyP+wV6XmywKopZK8Q+va2YJIdE?=
 =?us-ascii?Q?mmvsGUKNTWcJ7B80bAL8swUMSP3ilXyTDEjbk0cCP7+15iC2mLM8PoHjveDg?=
 =?us-ascii?Q?eLPc8yGP6FHJGLLwh2wgQTu1ekySWCdjPEqEhw+T0gTm7q7V+HMU1Yh3sCAN?=
 =?us-ascii?Q?7W+AV1FQnCwy5ApdlO8BiMCqB9wEvwObamo0ZxO5gCbyP92+bmySmizlpd++?=
 =?us-ascii?Q?oRwnwyj3rwxeXvdVqtFecGUBAsW5Jx6IJr7MahYlo2qT9DBjVdBQea18GjIA?=
 =?us-ascii?Q?9tynPiCZbGWh8RP9MsghqeLHhUAkow4exFT2M6/zlAmTGhbJaRmuZIWiIQCK?=
 =?us-ascii?Q?czFEWhVFQFVSIrHTGgwR14NaS8YDeXx+BwGhFxZIvlKBF/GpbJAaOC0VlrFX?=
 =?us-ascii?Q?jVGakX7t0IGPoHygaif8QI5KD2knfrueIYtRcPjHBQnG85xJq/PpJYJAfPOx?=
 =?us-ascii?Q?BnsEfHl7HaoNiTg7//T6YKcVB5iJq52ksHzSI/uYkkUhJ9pVw+TzXuCyfZJu?=
 =?us-ascii?Q?x1gVFkpdsBIW485KX33fnkycStWzhEtFWfH+YFEnV1dvd0PI6JOsvY3KS8X8?=
 =?us-ascii?Q?nDTg1+oS0YJHaK4c4kciya6JmIZLZ1ghDQ/UAN+Mv0d8bbvf9eCVlkYenlBP?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c12ec13c-3361-4bc0-8a69-08dd9d4c00c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 18:26:31.3628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C15RCRBJFaGBlgeyFDiF6zkbf/viqYfjSIyT9UbyeZubMkjLWn2j1oogAKeiwhOWMNvUYmt/J6fim7IMNP3/fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
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

On Mon, May 26, 2025 at 10:09:07PM +0530, Himal Prasad Ghimiray wrote:
> xe_svm_range_get_pages() already calls drm_gpusvm_range_evict()
> internally when it fails with -EOPNOTSUPP. Remove the redundant eviction
> call in the caller to prevent duplicate handling.
> 
> Fixes: e0ff0d7cf928 ("drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 4432685936ed..871ac81bb04a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -914,11 +914,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (migrate_try_count > 0 || !ctx.devmem_only) {
> -			if (err == -EOPNOTSUPP) {
> -				range_debug(range, "PAGE FAULT - EVICT PAGES");
> -				drm_gpusvm_range_evict(&vm->svm.gpusvm,
> -						       &range->base);
> -			}
>  			drm_dbg(&vm->xe->drm,
>  				"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
>  				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -- 
> 2.34.1
> 
