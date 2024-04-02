Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AF9C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 19:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C466910FFC9;
	Tue,  2 Apr 2024 19:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIOFZg/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7223F10FFC9;
 Tue,  2 Apr 2024 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712086829; x=1743622829;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y6GYHpdp+0NPJt5cfXCvRdQ/CEFqenmcB4FCY7d7bcw=;
 b=LIOFZg/V42qQB9xrWeSWZKI3vsTNt2P1ccRLW4VzT1S8zxpHNS5QsX5u
 XJgIknd0ItEumzkTuFwRe4cpN5nP/o4SDwWFF1tySDAgJXNOdDjTk8VZH
 sPqL13kOi8ruwHxNkJoXTNrCDWNCyiTu1tLisYDOpEMCl+q/vbZXywcql
 LOXud+r1F0LoCIA8aYiDEkMuf2K3qmfsZNHcn3JZFyaEsdT55kK6l1b/F
 xt6d9IVa0THg9wR2GPjLF6U9aCez6CA5rPqtjE/32EuUyvIIX7TN+pGWJ
 s3mdbjGaXBsBjDSwbMQOQzsKQLZBCxBQ/v2e7DgJrOyjP6yfhnqLYU/b6 A==;
X-CSE-ConnectionGUID: L2EKRxv3SLSJmMmr8S6npg==
X-CSE-MsgGUID: 99xtByUVQS6AmwAVvOTbfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="24774711"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="24774711"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 12:40:29 -0700
X-CSE-ConnectionGUID: ev5QDGMxT/Gsg+1ypubHow==
X-CSE-MsgGUID: nwtMGeQmSdOITauLX/O/pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18154601"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 12:40:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 12:40:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 12:40:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 12:40:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 12:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiCni8yNnqpRbSdmdrW3dRuKcgwOGrsIiJ1IUGgmDaUX5LVE8/hLzUIs0iKz7zusj0QcXAq7dZwh3IiZaVjYCfWGk6tDYUm17kAHcRW57UaEIbmKgGCFVblKAAupQOo+zRAPBB40k9w+RxNsaASj1ekCZai/beb47Cnuk64FrFiy4ps8rNPbQskGdpWErjpV7URd+W+m85QF9Axi5fnI8GAzJwHwg8FzVsYcdCXrrvmmeKIs9IYO4FC6B9xc4okWPxFwxgVGg1MTU/tvxS9AdyZkZHWDJqXbdkrqXzVQII8WrNdyAnApUjCMd9mUAqtaV/LIr9F846G0fSeUtp5vDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H468hX6QNzG4A0HU7kWa47W1MgLSiJmvjZGP4uy+TEs=;
 b=MH8Sr8+wd80bhxqJCtEmyWb/YMlqlMmbbmhnf6VxSqDGYgvqBbnRniJfoWsQRPDoPX6UOl52sIzbBj6Wk62Yba0Wgiimk+Cu2UnvPjQgRrpwExOisC+KzlUtRblmE1vvxEQSq5Nx3i0XT3ZyVsGlKhM14V2dA7Jqaq9GggdpB7bM6SQOk9zFWS/xqnyGuIRVvhElBg7MuthGCmiP3yU91COUpFTHXZIzc4tkoJsbCDU1NdkcChEjCCgNIRgtWyNzgiFCUyrUOgEaXKTZxNI986WFuXppT6mb8KFTDlGVFlvUH3Tn5FHYx+DQmFJwUy1WHHTcWsjdQnR98tRLLQVzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 2 Apr
 2024 19:40:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 19:40:24 +0000
Date: Tue, 2 Apr 2024 12:40:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, Matthew
 Brost <matthew.brost@intel.com>
Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Message-ID: <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402122223.643413-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7673:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i0kcH681NWvxr5A1N/FxxAo+d8FhTRx7tqy7iayiVdHXwJhY4D3Jyq9CeJdLNUbN8+CBWYnWCIiNdufXC1otOtupr9jKTwU6a04D3624TXp6mpuvk/a8LW3frFZrTGYDO0fT0lPHKDUT0NeJmprTEwUgGJ+xSVBHdZMQAzbM6eL+h5Tu7f3DE/BQ1QzuH3DQVTXsp9Ybg02aSjd5Pot67uHPnIJ5OofHUMK4n5slZeshtSJhr7L6crUNwILyhl5GAzJD71ik5PuUpPHFu6Uojv1E6WNZKuznF5O2kZzrBl8RepeyPAyaNsmoF3Xy406DdIwYzg7Bs5zTQ4a1bEQ56FFM2jjnJNTUSdldhSlGka8Slza6RiuJPS83hRizAOm7+eRCqDBAJf6+ftoaE57gBWl/Miwa6/1LBP4PFakHWgCMvBQJCgjTOrTSYu31wZgATNVKn6bycyb+xcyOR1eAhRL7hh5wd8+eDkN20c+o72bBoxfda7jaNI47gldLHcl3AGUOfSd+jynOT7hwai7Tp2euCuHaI8zw+W9/grp/hfyAVfKnoIV6XvSa0kkcmtuLX9YMTTgXM+V9SxrGQLnDq1+bPjqW7PiG5HdegVOmEDVIheJXTqkm8q8icGumLr43YG2E8BgMLqsOjyvGym0RclN34CAa5wbjMbaSRp/P0wI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+oR1N9nPesTdH0vn06n+tiBcm/vRpXQ+BNVGNPiJnVv3LywDfWracFS5VFxh?=
 =?us-ascii?Q?B/YhTeiUdzITgCbLxd4YfbZRpt0rzWJqJt8dnxRPcWVkTnBaPsg84/PUq4Km?=
 =?us-ascii?Q?GGKuM4uCwJ8KxsusO12oy+6yn9Sq8cRJcmAHc6Yd9jqtt4WFWJVPeSIdWbqN?=
 =?us-ascii?Q?RmVfHnkP5jDQsavbeOW3Fay4CU5/ocE+ys+RQlf3/aEGRrzG2D/RMXjLEiKy?=
 =?us-ascii?Q?SFdJ1bBEv8BqUiO01gl3XLuVQsNe0LtCdP8UEf9MMIaH23sj521WN/sstUVj?=
 =?us-ascii?Q?SAc5l7B9Zz6APcfrf39uBVLDf+pMgZf9dkgeAliy2NWFvVrYYTkOnQISpClV?=
 =?us-ascii?Q?Mqt7rB5D59NjiyixGIX2Ql5eiYwKYw6d72sbCEdhYAukTWZqNd89qAT1I+lW?=
 =?us-ascii?Q?ZbMiH3xmC9yZYW1diY2N8XsAMzgt+/gQClv35Jj6hYFh48w5urLvTHbdksuy?=
 =?us-ascii?Q?kuVZnm0YrVLCWWlPFWhkmFDfWr9MRUkV26m5L4Dt3aJXC/Xj994cgj0mThuq?=
 =?us-ascii?Q?5NyzWF2WkICuZjZNtPTkyD+sr+4IWgJVYnJm5sjJdGvON84KM0h2bG0ExXP6?=
 =?us-ascii?Q?ntzT4lWf04U3YmmHedxPpp8j2L1swvr1IkiyFbrCQuRJ0eFKYTDAG+l8TScR?=
 =?us-ascii?Q?UvYRvRcMCXCmjz+oUpu4R1UnPDD4uNaQeK1OnFE8tXoXCh4fzY4pYpCKDJ/A?=
 =?us-ascii?Q?vu3tmTjl0mfBxy6yzFGXG0392ncJRsnW6hclZbHzdQoangmIkO1dXJQHLvH7?=
 =?us-ascii?Q?ibHnUyZsRvvdMoxPFxPDhcEPCGZb0KCBl+9oVFqcy8GwjTSA1KxtLWhyA4IZ?=
 =?us-ascii?Q?WBHn9tjS9J/lJZJ5xZ6nQPRtM7e5yfUFnURn7Ue+xAgFT+uEtsaAxmY3x8Qx?=
 =?us-ascii?Q?wRlPWS66s9KtXSWb1UyWEnJpYNIaBSONe/cldK9LSJBwnozlLDLODyG5uiZr?=
 =?us-ascii?Q?3fhAV85YoQd9dNT5W0cErWWN6P9h3ikZH2eog/5Cpy50ajEZckSF32qjsxQG?=
 =?us-ascii?Q?LdVUkhUb2AnfSyeAlYC525EKXfIjnPUlrl3jQUM8cdRKfq7m762VrXAOS+Ze?=
 =?us-ascii?Q?6m7lYxvFAyJgo8y+aDfBQmkoMuo79tlDA0dO6vC6CbNJ57XsA31VoBHIvsPx?=
 =?us-ascii?Q?twi0fBNm6Gn3XBu4UOj7pWKEsgpWj0JjKakUbf42qz8rNMuv1BoZiGerJ6bw?=
 =?us-ascii?Q?XlywY0wapoK23yDdkrpj5sIYdszFyB1fV+Ew6heD0B7oqpsIZVuYFDppitEq?=
 =?us-ascii?Q?Q0jBlMHiR/g2IW/sd6q7SRiJLe4egBt+jteyvb1q+Huna7Dh2NKV+uNHR96O?=
 =?us-ascii?Q?sg5ohcxXuSgabdcKAs1ag41ItRx7rKyt/TiNEDmiuARr3fAUoFODtzoUNRQF?=
 =?us-ascii?Q?VrzwG+Kd+uUMiyBlA+ZS2F7HOyyUbTKX9Box1slPO1DTzlMDS9YISePbA+uS?=
 =?us-ascii?Q?76tt4AMSKes6/qUdFCyvL0QENQx+6yhfAK2Ycppkihr7vlOYAH1AS8h0bMDX?=
 =?us-ascii?Q?YuEYk1dJ1C85A8ktWRo7BscJP0T0ZeK0Qyfi8rKKALStAZMXdkzr39n2MfWa?=
 =?us-ascii?Q?55qnJZXxZWUU+ps1FIoovxatvZFix9tAgyJaswXChZrQwLerXmgd1Rll0iqA?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 139c1b65-17da-4e10-9055-08dc534cbd9a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 19:40:24.6160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOoG3asIfLiwP+C3SzBSuZeeZyo0P9AbAYJkbftYPwiQCD0au8TjgFYIJp1jvgQBbhGN1E7q2YvO/Ykx3XzwJ+jDOKiFenHCTlopnYCowFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
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

On Tue, Apr 02, 2024 at 05:52:23PM +0530, Tejas Upadhyay wrote:
> RCS/CCS are dependent engines as they are sharing reset
> domain. Whenever there is reset from CCS, all the exec queues
> running on RCS are victimised mainly on Lunarlake.
> 
> Lets skip parallel execution on CCS with RCS.

I haven't really looked at this specific test in detail, but based on
your explanation here, you're also going to run into problems with
multiple CCS engines since they all share the same reset.  You won't see
that on platforms like LNL that only have a single CCS, but platforms
like PVC, ATS-M, DG2, etc. can all have multiple CCS where a reset on
one kills anything running on the others.


Matt

> 
> It helps in fixing following errors:
> 1. Test assertion failure function test_legacy_mode, file, Failed assertion: data[i].data == 0xc0ffee
> 
> 2.Test assertion failure function xe_exec, file ../lib/xe/xe_ioctl.c, Failed assertion: __xe_exec(fd, exec) == 0, error: -125 != 0
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 8083980f9..31af61dc9 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -710,6 +710,17 @@ static void *thread(void *data)
>  	return NULL;
>  }
>  
> +static bool is_engine_contexts_victimized(int fd, unsigned int flags)
> +{
> +	if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
> +		return false;
> +
> +	if (flags & HANG)
> +		return true;
> +
> +	return false;
> +}
> +
>  /**
>   * SUBTEST: threads-%s
>   * Description: Run threads %arg[1] test with multi threads
> @@ -955,9 +966,13 @@ static void threads(int fd, int flags)
>  	bool go = false;
>  	int n_threads = 0;
>  	int gt;
> +	bool has_rcs = false;
>  
> -	xe_for_each_engine(fd, hwe)
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER)
> +			has_rcs = true;
>  		++n_engines;
> +	}
>  
>  	if (flags & BALANCER) {
>  		xe_for_each_gt(fd, gt)
> @@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
>  	}
>  
>  	xe_for_each_engine(fd, hwe) {
> +		/* RCS/CCS sharing reset domain hence dependent engines.
> +		 * When CCS is doing reset, all the contexts of RCS are
> +		 * victimized, so skip the compute engine avoiding
> +		 * parallel execution with RCS
> +		 */
> +		if (has_rcs && hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE &&
> +		    is_engine_contexts_victimized(fd, flags))
> +			continue;
> +
>  		threads_data[i].mutex = &mutex;
>  		threads_data[i].cond = &cond;
>  #define ADDRESS_SHIFT	39
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
