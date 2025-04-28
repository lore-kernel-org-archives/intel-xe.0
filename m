Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A4CC369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 18:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA3010E674;
	Mon, 28 Apr 2025 18:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2eqARzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B8E10E674
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 18:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745863782; x=1777399782;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zeH+L+Gt38i2/B9+ACJEw2JajaLTvN1taC0R2V/K8Pg=;
 b=W2eqARzGY+0yD8c65j+2ShRp09z0/GikkZ9ODg9vBfJMUIKXAfksXDnQ
 irdROXkJyNgqjqk7xtamDVOvvK5LjOz3/EgA4ayddAVoDQMW1y4CHIfe1
 TyqGhUwQ3shsTyejBOpdR+kJmpbCgsgNGxqQ9czFkX57++kIQWgM8kMcD
 n2rdEX7KyFX0NrkOivnZcP9SpFWar3rdhMttzlIKot77CV9pKcpiPN7jT
 y9w7PFpyGeTnFE8arDDl6v691dQsKjxR7u4CcPdDLn5qfUJAUpLL0NgwF
 9PvFByZ95wT+1NCArsAB/wJxFIN+cn6GxCBDdd20USnPHXAL+jMgB3cRM Q==;
X-CSE-ConnectionGUID: EzuAEcX2RcePbbDVAOMFoQ==
X-CSE-MsgGUID: Kpwz7PvxTFCPsEkF6d7JqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="69969606"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="69969606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 11:09:41 -0700
X-CSE-ConnectionGUID: 9PyuMFWzQv2P7nzVsF57EQ==
X-CSE-MsgGUID: 5avhz+GtTKS2sIvRglcFEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="156824088"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 11:09:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 11:09:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 11:09:32 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 11:09:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnzeYzqRIOzkS/bcgTqr0R98Jl67eqOEYrZDxK9JoAW0R8FsT4GsGK6l3JhuU3yVHPHpzN7qcWWt1HwR46VxeHhT2O+wP15mPjvWni3Ah6hKeWiI3GZPkne5e6LXvYBQsonH+IZxUGJsHN5C0a3iFCKJUayoyMDWRv5r27sUBa9McIwajp9UNizd0z/f8AeF/LV0zxL9PU0itxMia87I9j8HWR/1o9HzdguV8pHDCTeadDFb+TNtu/cmsPcFL4FeSMe1See05l9q7L1rlAqnIIKxEScURtqNuYz1wjI0NJpvhDJ4svYexrLAKLwiROso1grvAGf4/hgM1tz+LUyYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89G6U5ivH+FsJ0H7sXV3n2eMW/9N5tCWM9gNYVb1OUo=;
 b=Cby69suVpsvw/TPwyxyt9kfVi9TndoIXBj0sSoGxEwVueUzmNNXhRiN/YMO4l2N1aFbvrO2JXMFCXv9Strvm/rkF1XEdrhNLIlDDc1VyRG+vGhlQlUYqMDldzZKkkBRAkZJDXhDuzhhzIaRv9iwVkSfb1wZYDdnt/Ez/i78HWMtc/wYPfgYJAPH/aoAltudQvcx9/iatk1fJ59KpXnFiCnYEC39b3EepvKOvrvUX7uegCmNr9A4Lmoj/owOQbJCoWSFO+crelAWI8oZ6Tf/Y34j3ZnM3/o3nHsUV3MyjdOlDC50UwjMTpnQHQCNXXBK4UD5fwc+7H/RAmKIe09c1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 18:09:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 18:09:30 +0000
Date: Mon, 28 Apr 2025 11:10:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 07/18] drm/xe: Make xe_svm_alloc_vram public
Message-ID: <aA/ErWtLB8T/ulH4@lstrano-desk.jf.intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
 <20250428103224.69534-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428103224.69534-8-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:74::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: b908a885-055e-4a32-11c4-08dd867fd22b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h0D1sKR7c1FJ/DJk24FnPZWTVJYvqTytHr40BmuRv7YiyRuSB+w3Szqf00oY?=
 =?us-ascii?Q?cYf+a6TVVHfoFhfwVx4IWliK3aGY4e+JQXWMQoFzYfAh1C12sLI/rxoM9qrs?=
 =?us-ascii?Q?O607DFJj4v0XA9GanrhGtkAvs8ShqypGTAqto7j0LOHKQl0mhHmaIwcSIqgx?=
 =?us-ascii?Q?FaOVzwCGoQrDwuZzh71e+qV5PYDkt9xpOpXGY+YNhDOZCo4e+ITzpGb5RjmY?=
 =?us-ascii?Q?1Km3rsJCRRNOdc6AV91hH03VxZGXQbMbFl/QIPctmuig7zbCEX3LHY2d+g7c?=
 =?us-ascii?Q?nV04GbuIzTAzvlqtl0+ljzCEDdFLILYsZc+qy9idxqZEx4nyoyVVfzMX0I+M?=
 =?us-ascii?Q?yE3LV8gU4mTznBSZOU0FcxDSQTPvwEEIQ9VgGD3672AMBCtAQnqwgz314SC4?=
 =?us-ascii?Q?ns6YgcnCMdwk2r7VVA8UPx/kgVEqj/47RZG3hrAKq6PSxxS5I+w0bNcEfFe7?=
 =?us-ascii?Q?z87RgXp4ML+k4KFT8GmEjpL6DP3AUVEakvfzBIFpJ7+Y93HpMUzKQhkojNe3?=
 =?us-ascii?Q?BeoJmgOZuQeOCtXKluwTSNtEvqQ3MzE/k/CW/zMx6Ubd2hLrsmDtRfjdof+s?=
 =?us-ascii?Q?IqBwk93no0UPxfLckJJ4KY61ItFl3RiQkiMZAOd3f2a4fLvRWI7+Ib7DwV+S?=
 =?us-ascii?Q?vxlFy/2v/7BBEbHt4UpI4FV5P80JLh02/N+hOIfPN23U+hpJmtWgrq4YI8Wl?=
 =?us-ascii?Q?gA3DUECDKPMHtGh96jqloAVQQc0DEz0LMvt+izqeNg6jEFfDL2U/LqP9KgP9?=
 =?us-ascii?Q?uAWG1pyMeqAht551gtixIPWh0e87+EDa3aJz2avgKgmLuOZ6xk9O8xcc7ozO?=
 =?us-ascii?Q?9tv6wyP7t3HxsQ56eT8N9z0zs4jHP/y1PAnxn0p0cTgpFfd+AbZcQMNEq5ck?=
 =?us-ascii?Q?TieFH43E3nrU6RRxQio2eDoR6OjK1rfeK6zEfK8+l6ZAagcGoCSSmz7EZBkt?=
 =?us-ascii?Q?Wi8FYpPkaqD9OXWxIXhJRbw7wUQY2YfXrtQBpnIY5L0S0XWiwH7CCCl5oyQi?=
 =?us-ascii?Q?WATRCLJip8QLPBCEpJhqWaTb3b1VxIzvMSrLUWcmlyTSMv+nruYZRZjBE1p8?=
 =?us-ascii?Q?fHDjKgkvq9iQRiZvih3RudPqeu/qXr5ufF02tDsRjOHf53f6vwl+MVajCj2t?=
 =?us-ascii?Q?wCrkaycJvZYvBpCGV9syLZy1bY6mIWYXfuPLyeITrDMkEh3OA1PpfSpPKxie?=
 =?us-ascii?Q?qf+P5mThw0usrLO8vdbiFozTkPG1ZveqzZLeEOSijXZ1yRISxZYOpu99TmLy?=
 =?us-ascii?Q?coxh0r5GB7vp47/LwnBwzLR7eP9RL0gMylDWCKP9MkV6iuBeVFL9RaZ5NPJS?=
 =?us-ascii?Q?8CrhY6HdrKTQF7NicMusAyPL6ekd9G7zPzgbN9sT7NhlVR4HWWbgyfpXLGaT?=
 =?us-ascii?Q?hld6CPg2q7tX8M1lbnOHnaFUSoZbYKpRA2wEbsXAuSnIS8oZJDBhFKUHdrBf?=
 =?us-ascii?Q?NsbgEMcxpQw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2tUqODKIJO+RHfVpE1ulzFovJBAV91DGg3Hbn0mkQCpAfBUZAG4gr6XWIpld?=
 =?us-ascii?Q?a+Uu2zvCLn6a5MHIHOG/wq8UIawzdQOFT0dLnywT6ZQBPa77yjllGhJyb85t?=
 =?us-ascii?Q?uqjJAkmkPShe79KveD1XB6qh3XyrAj3v05jYg4lpH5/5L+zqChn+Ub6GJeqR?=
 =?us-ascii?Q?Nwy+3Tb45hesdrQRAxXKySr8ZNbeiBFSjauqaMzksNiBnJHvFbISo1KoX/H8?=
 =?us-ascii?Q?/5PrEUnedJ+JZB3FP7FukiDyKzKnK0vtf4LdZ7OnxOD1KdQmUwTFyr1QG1RH?=
 =?us-ascii?Q?+2EOdcMXIZ+A9/IP/LA6CY30KwMCjH43vIK5YXKCgkC9tk3m4iU1wU3f3f89?=
 =?us-ascii?Q?mm167zJ/8XhQQH62WY3RGqeu1VzabDNqdiNaXZskOFJeCAohLjZpIDIBx8wY?=
 =?us-ascii?Q?d414b8yWFaO/2LN3UXEe+Zc5qwqjfGCPInQhsHv3e9dnXT0rEnqt2kADwI79?=
 =?us-ascii?Q?IjEc/bKW5Ip8eLLYNnRv+eBiNj16AfeEKSZcp9MZcUVpA7urUM81wSsZ0GPp?=
 =?us-ascii?Q?xER1jg/N3lqW3Ft7KSEoTNJp9j+M2fS43Cr0YPE5uwsfoXRSTp0xOcw9oCfu?=
 =?us-ascii?Q?0jJBtZOjPSVDf9NH+t5UpillNTTAuzSnoWgHGrABpoJaOCAhwZtiUwkJ8tJY?=
 =?us-ascii?Q?r9rMU9N/VRFnlr31spEOs/M3HU+XgDb8XJTZeYKE0rlwk16j2+fUEfpTlXxm?=
 =?us-ascii?Q?lj2vu7GFLbz1/ZSZK5U3C9EquyHoaeUNMMNgldOUranAciurf1UrU05vADsY?=
 =?us-ascii?Q?5Au9sjc666uwddO+F0Y+3TNQby2o+T1+g3NbotZ8R7FcAmg/Wpcna6w3S3oW?=
 =?us-ascii?Q?FavroRS2IM1k81GCAnyisBc4WGsrQ4D24EVu38zm1bbsSCLZ1ngAvptF6XU6?=
 =?us-ascii?Q?rkLRGqP0TYEsvXNbiqJdfIUA2D+70Hh2i36s6lD7cMM8LPGRJGE8PUDD8DGJ?=
 =?us-ascii?Q?mo+u9BwIRMSPryDAjH8zwHStJELoA7kLxNa9AKfEXuM3aWmwRiUB5WwPMsQj?=
 =?us-ascii?Q?wDJjZFd0Wxu4ulSm6Pj1n6emWHxK6jRSuun16SUQXDwkpgr+vBPJWu6K6fnk?=
 =?us-ascii?Q?guAShIkdAdrp92EXS6YE7RUP+7dzox3OFyITnWtF46Ho/rjagROHF/sdFjIg?=
 =?us-ascii?Q?QHjM8Uprw7awNI6oqd6h4yTQyoTzap96oD+cy0rsDhjv7tKIU6aS4oxjbwA4?=
 =?us-ascii?Q?39+YwEXc5Au6DDub/HnYuTAZdrMtpMToCSQdhNhpmFF2epjb1U/Pmx5qU9Ik?=
 =?us-ascii?Q?a78mlyvTEX/VpuZAfxF2vnQ6MN6UlctPLh/BB9N4vNP26V13ZVsnTUmFrTc5?=
 =?us-ascii?Q?X69S0ogArwtF7M3gMm+xhmiFm7nGPr5vHBB7CpmdVDX0/JDoxG3jX8MFuWFz?=
 =?us-ascii?Q?zkvs5R76fyodBsH/sG+xd0U8Y2kA6KZKPW/YoSLrPv1pcE8ec+CcHk3tRPtJ?=
 =?us-ascii?Q?WsZCdu1qmQsFQ7IcNbJmNPspJqRqoyLfl7Z4+bTe/IdwxIvSgm6YF6qgfK/9?=
 =?us-ascii?Q?lG6Rs619V8P/wb30uZgpx2/1X9LGN/TmQQizJdQpVjkpa21uve5zE1A3nToI?=
 =?us-ascii?Q?KiS41lPsl7T9AwAVi5v/ri3U8my4WePLKGyszKIT87lI7bmHbgbSG2DvA21s?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b908a885-055e-4a32-11c4-08dd867fd22b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:09:30.3243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0S5yXb/HDwg3yWxe1rhPHAQ4JidrizZlWmTTw0d6eYL7/jRAQDyBlOzQjDrBzCLWldG6qUbSK0CfbLTJTmUMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
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

On Mon, Apr 28, 2025 at 04:02:13PM +0530, Himal Prasad Ghimiray wrote:
> This function will be used in prefetch too, hence make it public.
> 
> v2:
>   - Add kernel-doc (Matthew Brost)
>   - Rebase
> 
> v3:
>  - Move CONFIG_DRM_XE_DEVMEM_MIRROR stub out to xe_svm.c (Matthew Brost)
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
>  2 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index de4eb04fc78e..d30b36763240 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -663,9 +663,19 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  	return &tile->mem.vram;
>  }
>  
> -static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -			     struct xe_svm_range *range,
> -			     const struct drm_gpusvm_ctx *ctx)
> +/**
> + * xe_svm_alloc_vram()- Allocate device memory pages for range,
> + * migrating existing data.
> + * @vm: The VM.
> + * @tile: tile to allocate vram from
> + * @range: SVM range
> + * @ctx: DRM GPU SVM context
> + *
> + * Return: 0 on success, error code on failure.
> + */
> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
>  {
>  	struct mm_struct *mm = vm->svm.gpusvm.mm;
>  	struct xe_vram_region *vr = tile_to_vr(tile);
> @@ -719,13 +729,6 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  
>  	return err;
>  }
> -#else
> -static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> -			     struct xe_svm_range *range,
> -			     const struct drm_gpusvm_ctx *ctx)
> -{
> -	return -EOPNOTSUPP;
> -}
>  #endif
>  
>  static bool supports_4K_migration(struct xe_device *xe)
> @@ -1006,6 +1009,13 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  	return 0;
>  }
>  #else
> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>  int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  {
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 0e1f376a7471..55695097a8d1 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -70,6 +70,9 @@ int xe_svm_bo_evict(struct xe_bo *bo);
>  
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>  
> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx);
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -95,6 +98,7 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>  #include <linux/interval_tree.h>
>  
>  struct drm_pagemap_device_addr;
> +struct drm_gpusvm_ctx;
>  struct xe_bo;
>  struct xe_gt;
>  struct xe_vm;
> @@ -165,6 +169,14 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  {
>  }
>  
> +static inline
> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 
