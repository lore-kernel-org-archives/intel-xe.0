Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACEDC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 16:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6626110E033;
	Wed,  5 Jun 2024 16:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tq7T6fM3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3B210E033
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 16:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717605931; x=1749141931;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W4EGTzYf9uRHNO4uFnXOgD6IXwiTeI2jU175kI9JnwU=;
 b=Tq7T6fM3Xzc2nOSgBCz65oNRXBQeunf0SYfcaq80JRpltzt9TlgmSq9h
 DsS9jvlWUEUjJ/lywEmGNKno3KcPPh6CLiwrQci2tvn1Wz/NHIwhvhL0O
 O7UV6zJpbWtSW5TfyEtD9RX7nzYIg8qrUcF9mpGotNcAApMnhJNy8sbld
 4waPKzNFND8jozrRuYD9yBvMIvZmlWSOluNKjSUyzmK7tRfFMDG2KgVhM
 ntjMmgEQsskubdCnAW77ch5wr3LiZQuYKacI8/LZAeqYHV+TWt+GbZEiK
 G4zq0gkzqIcS/NHExYhDG5bl189/ptVbtJhravqESuaUw+Cy2Aa+EEB6/ g==;
X-CSE-ConnectionGUID: DIHShFZVSmCg1wQudy92TA==
X-CSE-MsgGUID: RtHqFR8IQJ2fEEr/mY8lFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31776157"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="31776157"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:45:30 -0700
X-CSE-ConnectionGUID: 7pKY0Kp9TfCuqnPlLcY9BQ==
X-CSE-MsgGUID: BsN/Gn2oTVOsD3ZvG1n27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37714602"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 09:45:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 09:45:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 09:45:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 09:45:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUOcu9zY3013/kA7iqKlrfkXRUKtbsOqYL7E1KBMXFwGl79VBYiHqny0h95mC5NbZgbhZwzuS8lmSEd/NUQEa7FrdylFlTTMbFeRUG6+LUrnl1bDUrg0meNQ+dqB8guna9TwTmwYoVygUkiGB4uTbMbFxqcmFMXgWEyXhzdjtaJxAyi8sxJ5WJos89H+F4A10MtTTis/eT38epJzuu3nFh9n7hKZGXQFM72AXjc0hViiY3Xf6VF1WirXkSvTBGvBMqzNr0G7HMOk7GD28IerHAv1vol6hfYjlMMMEaQPngI5YBV030ZF9jyO7k+IbE/ifyMdJKtr9BvSP1t2572flg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbmef34Z5VjXVCrpEHeCxFK8Emh1UI/CVy6UhTMLPCw=;
 b=O9jjq8BpFPrUD8a3zJO5vdrPQ3IqmXBXGk1CKpmk+9pB6QmBRwKDDhJvPtvvOiCPmBWrNCYkQ1uBp68bP7NnzSiaRDjX1+PWZBUqU7iqCHUpRcp3CQ91RJrz9af/9pQU6IhRUOspc3PHTIvRptz9mOTM57Ht3AwL/0P6NSVqYCp9cxG4weFuhuV+xxp3jZNKJW17ih+KWQUgQ6ZOjndNdjDfQNJGWmfm1mPaElve8bZfPBQSuh/6RjRA3X2LhNA4MfXcZyzwW77OpnfnWMTnMCB4YeLaWd6adQJwQ0B1myBoqf+TWGzAEtcKC6iXJ3x3o7vh6V+DyMpAKoRQS270Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Wed, 5 Jun
 2024 16:45:26 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 16:45:26 +0000
Date: Wed, 5 Jun 2024 16:44:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>
Subject: Re: [RFC] drm/xe: Ensure write lock is held when calling
 xe_vma_rebind()
Message-ID: <ZmCV9Kc4LBXtT0ev@DUT025-TGLU.fm.intel.com>
References: <20240605101607.29931-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605101607.29931-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: c460a490-7936-48fa-25ad-08dc857ee6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L4VNB+4eJUiFgUSR0+tpKoR83b9Ab0MCMqPDGvRDJsYSfnnDTxFDbIDCNUpw?=
 =?us-ascii?Q?x+KdwGC/dvCVY5vRwHhaPPiqCj3WyaMfo6/pNVZxfMYxwdawemBsnGMlDiVq?=
 =?us-ascii?Q?/lcfTy0HqkL39HFHvwtuEakMBL2RNcMrYo8QrIxC6RATvgmm6bdtwM6eHxh7?=
 =?us-ascii?Q?CDMctqWesUAoEzz4Mq+x3kpSQQIupqdJRTZ+v3bgmFOkDGbrDu2CLok++ITK?=
 =?us-ascii?Q?rHxhWUqdfmsyWjnq3Rr5Mm7R873TjVBsUQXJg2fGgl0QA9vIby9oPgY5OhwD?=
 =?us-ascii?Q?tNlcBMX11LvTR5y/0uhCWZvZNp3ebQVlDGDW2pjnlphqcoYXTTRHFcim34Mq?=
 =?us-ascii?Q?Drmig8+ixTbgxmuDPg06/6CJLsM1CY3qcNcLgolnPMzm0rzq+F3z2sD5uuEp?=
 =?us-ascii?Q?7oCg83jJFGMvhUT8gRyFqOBV47f3ExdGGUWpS3HFbvqajYIRo4Jb4+xb2eP0?=
 =?us-ascii?Q?dfC2y4Dwtr+mUIuf6ctNBKgzVK1uimJZhJHEy8yXuIa6cHPUMW25t/1hL//z?=
 =?us-ascii?Q?NekkTSwsSYmvv4mBvEBEl360zF/4S4QlnRdvY1ipjb8hX9PVe9+KJHeLKM7F?=
 =?us-ascii?Q?V3WUyc2axBFF6fgg1goJj3nLN2TP9Irwu9cbRcIfjglP4ZNzN8h9FQ84JRNH?=
 =?us-ascii?Q?YJGOGgereyz8knRCrSVWMrDz8tlJ7hQWwZX2f3icMwK9Mpc+8AkLfQ5AsqP4?=
 =?us-ascii?Q?KPdgtoTRRn8ES72ouph4Qdws00CEWnOSSuKf5fg+0E2m1dYskzQpcdLc4bTY?=
 =?us-ascii?Q?7bKEgQfNivc0k4uy45RJXFxYsgML7Zdgk/rmEjwG1J3fEVYpzVCudTzO+F8x?=
 =?us-ascii?Q?I/6tM5YaKRVm1HVUOSHJPTfDtZya31X5IoXaXOLZwgk7eUHh1tm52iIdPwKm?=
 =?us-ascii?Q?SQdwx7DccGw5Us9WMF6NGxghJQwfxEjVKBrr7pI28iGdsdR/AcYFUV2PIcft?=
 =?us-ascii?Q?1Xf4P4pWt3sZaBjZ79ivsOvfbEsmiSrNU1zholTS+bBb2igYwrDB9TXkGSOP?=
 =?us-ascii?Q?/WqM0E012rw4vuFu1k4LjbmRxWjA4mN+QI+QU636+FuxejDGuvmB5C4vEHKO?=
 =?us-ascii?Q?9q5u9kEERwDrS+P2fPLBMf06rVQGySCys4IAB58fVjSeqPl9eBACbPegLsCh?=
 =?us-ascii?Q?OT4+LWVsQ9WBNi0V86cwHIZLY0PTLs8tEVonWJDDfHNK7dfg4tdfAqDSV9ah?=
 =?us-ascii?Q?F/4Q1pem/lm2M4nPIc93n5bdcJFKSCYbjTJWzYUynWkn953s1hMLiAOsTBBr?=
 =?us-ascii?Q?IeVvHLjbVo0H3zaXe/lI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NOt527maAvxOL6EO27DwZq0DQxXUCwWNeRk4+KTY15t8lQU7R+cVWJo5E6YG?=
 =?us-ascii?Q?9yy/u05agSPxhNfWdp7d2907fIfSTFrjedsccRcnHtTYzHBzYWkjqYsi0r9E?=
 =?us-ascii?Q?J20PKnz3hoGXVGj+7ReS8GQG0FzWpfZzHOG0uTKVtRlyTtMQi1dqVWkrvd4x?=
 =?us-ascii?Q?WLnuD4qrKtcJ39uey18G0bC9EmOnik3kMpjnBMHCVoikm5BAhAslH8CrZi2Z?=
 =?us-ascii?Q?eBQvKL506ni0BY3M6K63AOONUNEz/ESdmnz6djnltVaLND1ltbhuTjuA+pwX?=
 =?us-ascii?Q?w3elMUwE2PuMqXjKbVWm96+GCMzpxPxxjp1q1KdgD+CHOrR4u0+BgNLfictP?=
 =?us-ascii?Q?wZqvvY9UlCS/i7psX+Xs8a2RA2KQLLsyYm+anx176XpH/GtUVxTJ2fGi86ha?=
 =?us-ascii?Q?jKzpxjGws/HKv0pmb6012Ko4uDJQkcrTfL94UL7waCHfkHjynvr3+VzTfsnJ?=
 =?us-ascii?Q?Gc1Yn8Cr6W5DZgcUIT24UP9jSxtb9sp8IHySX7kqTdgj7KKAZlbCE9wmjM7R?=
 =?us-ascii?Q?yGbYZx0vFBwCPZjg8JVNZsgeo46BhJiyE7NtzW/N+64OG6opT+cJyPXkBdmg?=
 =?us-ascii?Q?FQal5cN+rntA43FMApSGMdGcFF5czKz8MJUtMVVJTncvZewVIRzLIP7msdRw?=
 =?us-ascii?Q?C1VFtE65Qtc+wohj+hYUkksV/WdRpJqxxEB778kGXeQEL1m3IfL3rWvCnmDr?=
 =?us-ascii?Q?g3HuLWHzruIAfoZM+EpgBoTtRlTopBkB4lEa14bVLYqmVl/ufY+di9qyiaBA?=
 =?us-ascii?Q?atRF76aIDE9T2EeaouJ5Q1wU8oKJmPGeZJavAqPr+qpFp0dv1d+SZkvKitXa?=
 =?us-ascii?Q?6frFxaM6XqhikLvvxRuXluNba6idkusNpukF0UJ47Ot1mvq9tTAXejBt4CbI?=
 =?us-ascii?Q?0vyBvnobFYjMVWCgmWuMKAf4Bh8gcyHUt861xFn2JuxMgQk1F7LillPQiJxp?=
 =?us-ascii?Q?Tme3nHa9PDFdyWbN73jO3QQH44ok8zgHJnHGhPRlROODc9N2uoYKkfeAU9qP?=
 =?us-ascii?Q?0v0rbjbw2ZXT9PKGBqzRCTCKBtVHqQsMNhR4BDAOE3A1n8SYG2DbM9v2ytJv?=
 =?us-ascii?Q?wWsB7jy/5smzFsWyGwTJfudW0p3GYmUrMOhchKWaELnzbXyk8fSGl87Shiiv?=
 =?us-ascii?Q?EzUlN/nR5aQDKfWcHzLiM93nht5Dx0Y5bo/l+mW+9gZdW2BiaZXbZ60EyIpX?=
 =?us-ascii?Q?JMUllp7mww/GgtptdmGebaX/OdAA/zxEfNxkO6cXWhGBJPVwDkbJ6/Xxbr+n?=
 =?us-ascii?Q?lvFjxn6R32q1Wntfewx89ZyEUdqRDkL436jTWqG9qt1faRaAlENgXVJkM6YO?=
 =?us-ascii?Q?5ZfI653mEfd6CFYjzPud0DN9X+ZzUa44eSkZcpsgJ1qD2zrsSltX+dczFtbc?=
 =?us-ascii?Q?m65loi4LPdVkVyAHLFATCl2nEbE0Jat2XThTvbNUBgQyru81NedgtU0Q2bQu?=
 =?us-ascii?Q?DUTuFKBGABhz2ZhEThEq7PEU54Hy38GwadHcKYr6vDriTBdNpSMWLvwM9E0I?=
 =?us-ascii?Q?rnfOkvsHLAnACLUb+Zfh8GMg+nz31//6VUjY7rrC6rCzTh1Wp4NLXwoYIfg9?=
 =?us-ascii?Q?YXxK+NyZCyXt9LEIEWwxEkauL5pXBNjalOjxACjzj67SyN9W2uCFCTRzrOfh?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c460a490-7936-48fa-25ad-08dc857ee6da
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 16:45:26.6231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvFXP0OSSH+sLtxDpP1kcMiOfVJdoPkVHwg+9vTNPQ/e8tqmrLVWioB1NMK1Qt4BQLBoiYaM+PODm63B6r7HtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
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

On Wed, Jun 05, 2024 at 12:16:07PM +0200, Nirmoy Das wrote:
> xe_vma_rebind() expects write vm lock is held so start out with a
> read lock and upgrade if a vma rebind is required.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1894
> Fixes: bf69918b7199 ("drm/xe: Use xe_vma_ops to implement page fault rebinds")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 040dd142c49c..543cfa9892f6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -153,24 +153,15 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		return -EINVAL;
>  
>  retry_userptr:
> -	/*
> -	 * TODO: Avoid exclusive lock if VM doesn't have userptrs, or
> -	 * start out read-locked?
> -	 */
> -	down_write(&vm->lock);
> -	write_locked = true;
> +	/* start out with read-locked and upgrade of vma is needed a rebind */
> +	down_read(&vm->lock);
> +	write_locked = false;
>  	vma = lookup_vma(vm, pf->page_addr);
>  	if (!vma) {
>  		ret = -EINVAL;
>  		goto unlock_vm;
>  	}
>  
> -	if (!xe_vma_is_userptr(vma) ||
> -	    !xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> -		downgrade_write(&vm->lock);
> -		write_locked = false;
> -	}
> -
>  	trace_xe_vma_pagefault(vma);
>  
>  	atomic = access_is_atomic(pf->access_type);
> @@ -179,9 +170,14 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	if (vma_is_valid(tile, vma) && !atomic)
>  		goto unlock_vm;
>  
> +	/* xe_vma_rebind() expects a write lock so upgrade the vm lock */
> +	up_read(&vm->lock);
> +	down_write(&vm->lock);

You can't do this, or even if it works it is bad, bad practice to drop
the lock as someone else could come in and acquire the lock in write
mode. In this case, a user unbind of the VMA could happen and the VMA
could be destoryed. Now the VMA refs below are accessing corrupt memory.

I have on going refactor [1] here which just takes the vm->lock in write
mode for page faults. I suggest we just review / use that now.

Long term I think we need to audit the read / write usage of vm->lock as
I'm almost certain we have broken the intended usage of this lock. Or
honestly maybe just change this lock to a mutex as I'm unsure if the
read vs. write buys us anything and complicates the driver.

Matt

[1] https://patchwork.freedesktop.org/series/133628/

> +	write_locked = true;
>  	/* TODO: Validate fault */
>  
> -	if (xe_vma_is_userptr(vma) && write_locked) {
> +	if (xe_vma_is_userptr(vma) &&
> +	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
>  		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>  
>  		spin_lock(&vm->userptr.invalidated_lock);
> @@ -191,9 +187,6 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		ret = xe_vma_userptr_pin_pages(uvma);
>  		if (ret)
>  			goto unlock_vm;
> -
> -		downgrade_write(&vm->lock);
> -		write_locked = false;
>  	}
>  
>  	/* Lock VM and BOs dma-resv */
> -- 
> 2.42.0
> 
