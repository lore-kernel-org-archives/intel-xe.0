Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD036C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 23:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954C510E11F;
	Tue, 28 Jan 2025 23:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlkPs4aZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E3910E11F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 23:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738106306; x=1769642306;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1l7eCClsCLbwPWB5jD+VpXt7O5exf7PVI5uVqid0iv4=;
 b=ZlkPs4aZ3rKT6pvtNh4pnrL39AmrYU83OhbQXJuIJyHtWlivjAgRuV0c
 Fip0U4S9o3TDZfuxu8uq2NH5LXVSk0zdt1Wc8XHaOlAwFD6FZK0axMTnw
 BNQUHYODMOzPcRvpeWRtaBdfz+IwMQXqdKcgoZKMzaZ8Twzh7XuERaSvl
 wUBNDV2hJxqYuRR3lWdYsWovpKZu+R8889shZm8vuqv7cGR8vsY3W79xx
 FWeT9MHzSgd08AjSyMIIK75f6bjnILkzWJkcvs9UGWtBj7asnrFTkAa3n
 nz4uNcLeIuIxSxvvT61z9/WcDlQwApPw2OHIkllbrMH4tp4ewEpbPepQO g==;
X-CSE-ConnectionGUID: k2fI2RRxQoSfmNRp6e8CvA==
X-CSE-MsgGUID: FDsTyvThTQGFetE0oOMDBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38494589"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38494589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 15:18:26 -0800
X-CSE-ConnectionGUID: CHNUOfIjQJSzI+8tLAlQnQ==
X-CSE-MsgGUID: Bc2PnkuaSBGdtUWKfWyDGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="113856979"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 15:18:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 15:18:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 15:18:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 15:18:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDimUeI5GsOnnuVwMDDbL3+mC8vXT6gYj4eOMecfGYbkprPdniJkJ06y7xvwCzayBmFELooygKefbBNJWLF44zX7mBB2R0pmC41Zp44z9yVz0QO5gCPo/qQLtqYKStWbDRRJE7JOo4brMDSP7+NfXA3qX66/EFS24/OFGRW2buT3ZTZemuw1VbN6FHFUFtQfPP7R05ZzyF0gq4nxGF4zAj8vqOTj3jtPmWEWaBkSaW487epKR2OB855+EuOf+asWYV2GxTL0gmF3GqrDGGiMAyEdi4ea26eluOE+eaJUWgNYEr9ixyUwbYACrPd+uAt3uHHY2YESguPKHAWAIqwM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUKCwPfagMt7B7iTC47kPIBbtcxtFZTSKz4ln6C+thc=;
 b=DV2ZkcRpsSARQWHBnmjvBp68mFoZ4Ke6nci6Lftt2GzsEO2t1dceOEHbcYVlTBx4zRT6KC6owxtRKPN7iAGzQnss0C6L/ezEf8j7c6j4XyIgLtgzRtqqfR8pUmTiegr4022g+yigB2a7KdYDjfU8Jp4OVADsw7Wy78QcJPlJaHtuLgnWMdCBlo2KeNMM0rdHGfF/AzhRAjzaZhbcAhlSFS/tdNtgLR2nIXM80w8QNyIKRV+1eGrlpqgNSo98R0WCDgEHz/Oe91WnU5Nq/oJfae8U8mQjqtQGUmMQkAwSlUpo+q1dAtlmgFa1NhP05W4F8qk6ybbZQkHfHTo6T1gkDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV1PR11MB8842.namprd11.prod.outlook.com (2603:10b6:408:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 23:18:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 23:18:17 +0000
Date: Tue, 28 Jan 2025 15:19:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>,
 <Thomas.Hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Message-ID: <Z5ll8YZidnxz9Pp6@lstrano-desk.jf.intel.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250128222145.3849874-2-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR04CA0347.namprd04.prod.outlook.com
 (2603:10b6:303:8a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV1PR11MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 74570665-f3de-4e04-321a-08dd3ff20bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GEU4R2npaQA4RKXRLqOVP9jxaWLKJuCxfNqhKaLKdufRQApwrqOGaKSTQBZE?=
 =?us-ascii?Q?vlsEcaNxulOiAxwzb6goqZAFc5CR6MTQT1pR4FbigvrMmrtVDcqq/d1D7V16?=
 =?us-ascii?Q?1Op7F3oiDS/F/gEscRIPxb+33X1D9+QS6yqD9svGSD+b2kOQghFHRMgOfCQ1?=
 =?us-ascii?Q?QfLsGgp7+tHxCJDAgIDhpPF+ZKv7dOaGn0RFFckCRg816vdbnh3w6lSxR0Ew?=
 =?us-ascii?Q?szIe16isYg7aU+Fut3kwO275k4h91EYCyg+AgVG5Bu+dfm+EvWzkHtt5jdNd?=
 =?us-ascii?Q?pfLZDqEHxiJ0RZrvA0ZriMZbLf9sayFy+WAmOYzV9/00PTDNqx5DDxktHCrW?=
 =?us-ascii?Q?MWvt3Modcx/XWXoJqtyalcbQ61m9Y+sjioUPDK1Q3yzg0aLGzRXH69Gcxg4m?=
 =?us-ascii?Q?g8Iald6vvZBj4Vbu/9/zSPdiehBOMt0wKYJcgjNICJIQWRbXz/r+Sl2kbsAc?=
 =?us-ascii?Q?85tfv4gz+GkxWhKLbt9tkK1DWwmiV5IdKHdMyYKJyQof+FerRnMURaL3p6Ww?=
 =?us-ascii?Q?JDFiqALsT+g2DIbyR8xg5s+ksJma8nex2zLdXoX3Tcwc+UdIUhwD6uyD5R5V?=
 =?us-ascii?Q?/+DbfK7tkqQ5rXPztLAh7JCG7UqE7e94WkjuFSB7LJnucVDDIGRHkj3xmdpM?=
 =?us-ascii?Q?lyM/zPnNFRJeKL869VbPjdufEQFL5cC5wMKOi+Viq7ytDXblqz4hSCNfG6l+?=
 =?us-ascii?Q?vgtJeusXrmpK4a6fNxNUGGpnwsUkpYywOcN8cZRhbHIZuWkXgcunrmDZWsxa?=
 =?us-ascii?Q?OkvukGtUdA3JLOETyU744q83lxB06sdbLy0ba/PONAKoMJGX2dKJg+1jrcpE?=
 =?us-ascii?Q?wL6ZT5z4K97ECnl8XVeAmAatZpBt0jBE0OcXwzyvN9f35FTSV5nMvfjkywoU?=
 =?us-ascii?Q?GGLvTodhg0t4T9IulVrjXcxYIbHFl71n6adqZGBTaZTVSpvf0DHZDGcm7BMP?=
 =?us-ascii?Q?OPkxn/UXekRaQ8t/rrTeoCIjKC9oQkLIMPu5v1uvDzpsMDjIMQseAKipbk5q?=
 =?us-ascii?Q?GKgvmBbPZ4x/lxLK9EhBq8vOGKCe5NmSSCSBqWc4ktYw16cfLhQY+TYvgUoD?=
 =?us-ascii?Q?6qn1T8An0vivis4hEC0482u9VHxgUmqzhrWohecfhdNB3Uj1bwEW4MM2byac?=
 =?us-ascii?Q?OSOn6g0TBek6nLaeKbqSJkjkIdwZJvJsc+vypQjgPS7HCSoQ7LXUSiLlmwWE?=
 =?us-ascii?Q?jxr3znB/q3D65JZ4qJiX0gQiQZxqKoDblCwJZqr5tIb4P1dBddM3rcSsb1Tx?=
 =?us-ascii?Q?CBQrdCOni0AnmxKneAM6rKoVmXg3u+ggQxiM13A4Ttzq9rVzQqlrWZDYF68I?=
 =?us-ascii?Q?ez2JMECDU4LSPdZUHy4oDShgOzzU2Ob5dPEADK+YUc02X74ZZM3HRclXVPEp?=
 =?us-ascii?Q?zj5Te9ptmt2A7GpVLRinNd+9p4CS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eMGINvLVxY/T3x6kvvq2atPe6qhyuTRN25I8tJALdTPg42cJwXr5FSIAiK9h?=
 =?us-ascii?Q?mMFj2IQaByNpC7G1SPtodtmKHSDGPcMAnuYXtoI1B5gRVxor/zrqO7MpV7vB?=
 =?us-ascii?Q?btNmCFc9HkDWuppUmqSMBNX8MoHIdOYV6CnVypbfoOaQPanhrQD0O8RUM+Cx?=
 =?us-ascii?Q?xYIeE8TDIteE5dzdIAdHTbDphMIsTAXxEKCHRzOIcJbSk/HuBGAgu9SgbTT+?=
 =?us-ascii?Q?ox16tJes0qlXh+HZVVrMdoHB49eNlTvgWB5n675iPNtgeTIKoN7Ahi1Y6Hv1?=
 =?us-ascii?Q?JtzoWJy2ivfY8r+JJ9Hyx6FxKRdhx67YjYpumrimqWtxaOIxspOaiUNAmdDC?=
 =?us-ascii?Q?EUrvgajC7AlnWn+b0gldNaus3Qtva3UUAmgRsOLS00eZpnvCP9hMY0H1LHie?=
 =?us-ascii?Q?mGZgTyzNXkx0Nv2AQdxEO8kt++kL8m4l0n5w1uAEy6cS9tSG/Dn2NJSDCXG4?=
 =?us-ascii?Q?8Et4sHe8CX2Yoy1ZYIhImz+R0ekNJCUkBZ8LGKdrgxyaAy0JAK1IRq0L1cRw?=
 =?us-ascii?Q?Bagik3H7E4BKP5n9LbPLPSvNa7UE9KMk9tS67sYsA8PAOws2eNaKaK/fHUsH?=
 =?us-ascii?Q?xU2WqOG0k2F9Qq7WMInlqg6RxuHOwiSDGHv1i6nN2JkA622c2InRKrczzbs3?=
 =?us-ascii?Q?+IDKNRs5C6WrdeddwSub7/1FT0X+WmFobaqN/x+vlL766nrqSQZSGvYHhNT6?=
 =?us-ascii?Q?7O/yv+kMf0tUauBLuz9//Hqvev5OnUZYV3+SedH9xN46SqtZhtJCycEub3Xn?=
 =?us-ascii?Q?7+Ywh8lcNo8mA/gzm5YHYwmpRR9bS6Vsa590bg2greLTJ+L9ayACVxJRPHfJ?=
 =?us-ascii?Q?WGnQhqz18gkUZl463dKUPn3EOP0qU05IcH5tKh9qbJ7Kq3ZlIvZf81KAAZXa?=
 =?us-ascii?Q?/Yzry/DmRln7qhBx8LomJyyDHRi7/G1OeONXGPxlIz9n5/dYb30M/6hxCS0e?=
 =?us-ascii?Q?ey6m5fj9KOgN6/CqqSQ/WQmlxJgC8W0dv5+7GAQFSdB2ZcCHkgf26vNQ9TyV?=
 =?us-ascii?Q?kDGso+sakdZvG6QD92EJgPbfxRQyYv8/nQCfkygOj34yTbs084JTyngBoJ8T?=
 =?us-ascii?Q?ZSCxx5DEd5hhJ9l316MvP3NOPj7PB7G8qK5au607tHkbJcKHjw8c8xuZ51Va?=
 =?us-ascii?Q?3w4WAjeSiqhVwG3z6rmmlWpIGSdyKNoeI5trntLnEzJyA8Caz7SAqfEpYdPM?=
 =?us-ascii?Q?1s97S+4hOTGOx0VVa1hOXWVkZVxZXyn662esreShFK2rwyr4CjusZJcu2IUv?=
 =?us-ascii?Q?yoGNtjXgEgsO+tyZUESShvVMhOjvH00JRYOXNiYEKhTcnfPTL9wB66tAu5Wf?=
 =?us-ascii?Q?io+YSHsKqrvSE++EHfL2iUzGrkxVKJOwim5Thb0yroGRBbt90mC5W4LuPrOp?=
 =?us-ascii?Q?U/Xr6WFJQiMoErDo1UgmvzB5aVsFyvDFQh/746zS89+hpcEHUu5gVHflUdiz?=
 =?us-ascii?Q?8Y7R4HBpyWN6OiO7+/2d8/aFkf18eIIokFPwnmryfhwGPMDSThRBah0MsjVe?=
 =?us-ascii?Q?rvfTi1T+5PLXquitB3DXayrZ91mVnRClE/1YPZB8PwLLJcfBl/jxXpzsNxF2?=
 =?us-ascii?Q?XVB6xftKdd1bd4hguXIdgXU/kjCG9TMhUirq0+bO5ayWIPoZSLtdn6sHzWaV?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74570665-f3de-4e04-321a-08dd3ff20bff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 23:18:17.4259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76a2bqFY2LgrjH7UvjO7SC1+FQfghCMBn5nBKa6nTom3LPtSJCo/FrY5O6bcsnmRFCicRKjzmrOGcgf4yr3G/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8842
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

On Tue, Jan 28, 2025 at 05:21:44PM -0500, Oak Zeng wrote:
> When a vm runs under fault mode, if scratch page is enabled, we need
> to clear the scratch page mapping before vm_bind for the vm_bind
> address range. Under fault mode, we depend on recoverable page fault
> to establish mapping in page table. If scratch page is not cleared,
> GPU access of address won't cause page fault because it always hits
> the existing scratch page mapping.
> 
> When vm_bind with IMMEDIATE flag, there is no need of clearing as
> immediate bind can overwrite the scratch page mapping.
> 
> So far only is xe2 and xe3 products are allowed to enable scratch page
> under fault mode. On other platform we don't allow scratch page under
> fault mode, so no need of such clearing.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 690330352d4c..196d347c6ac0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -38,6 +38,7 @@
>  #include "xe_trace_bo.h"
>  #include "xe_wa.h"
>  #include "xe_hmm.h"
> +#include "i915_drv.h"
>  
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  {
> @@ -2917,6 +2918,34 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>  	return 0;
>  }
>  
> +static bool __xe_vm_needs_clear_scratch_pages(struct xe_device *xe,
> +					      struct xe_vm *vm, u32 bind_flags)
> +{
> +	if (!xe_vm_in_fault_mode(vm))
> +		return false;
> +
> +	if (!xe_vm_has_scratch(vm))
> +		return false;
> +
> +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> +		return false;
> +
> +	if (!(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) || IS_PANTHERLAKE(xe)))
> +		return false;
> +
> +	return true;
> +}
> +
> +static void __xe_vm_clear_scratch_pages(struct xe_device *xe, struct xe_vm *vm,
> +					u64 start, u64 end)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id)
> +		xe_pt_zap_range(tile, vm, start, end);
> +}
> +
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -3062,6 +3091,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index = bind_ops[i].pat_index;
>  
> +		if (__xe_vm_needs_clear_scratch_pages(xe, vm, flags))
> +			__xe_vm_clear_scratch_pages(xe, vm, addr, addr + range);

A few things...

- I believe this is only needed for bind user operations or internal MAP
  GPU VMA operations.
- I believe a TLB invalidation will be required.
- I don't think calling zap PTEs range works here, given how the scratch
  tables are set up (i.e., new PTEs need to be created pointing to an
  invalid state).
- This series appears to be untested based on the points above.

Therefore, instead of this series, I believe you will need to fully
update the bind pipeline to process MAP GPU VMA operations here.

So roughly...

- Maybe include a bit in xe_vma_op_map that specifies "invalidate on
  bind," set in vm_bind_ioctl_ops_create, since this will need to be
  wired throughout the bind pipeline.
- Don't validate backing memory in this case.
- Ensure that xe_vma_ops_incr_pt_update_ops is called in this case for
  MAP operations, forcing entry into the xe_pt.c backend.
- Update xe_pt_stage_bind_walk with a variable that indicates clearing
  the PTE. Instead of calling pte_encode_vma in xe_pt_stage_bind_entry,
  set this variable for PT bind operations derived from MAP operations
  that meet the "invalidate on bind" condition.
- Ensure needs_invalidation is set in struct xe_vm_pgtable_update_ops if
  a MAP operation is included that meets the "invalidate on bind"
  condition.
- Set the VMA tile_invalidated in addition to tile_present for MAP
  operations that meet the "invalidate on bind" condition.

I might be missing some implementation details mentioned above, but this
should provide you with some direction.

Lastly, and perhaps most importantly, please test this using an IGT and
include the results in the next post.

Matt

> +
>  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>  						  addr, range, op, flags,
>  						  prefetch_region, pat_index);
> -- 
> 2.26.3
> 
