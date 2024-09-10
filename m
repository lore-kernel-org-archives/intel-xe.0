Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5CAEDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B1810E161;
	Tue, 10 Sep 2024 18:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B29nZzfw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADD210E161
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725993911; x=1757529911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/rl8YKvuYvZ0VDohfFJQDsVfvHDohBteaa3CNn10X3s=;
 b=B29nZzfwX/eNg5Se4ACfx/3n9Jae7XJ8+4Nxw61W8BDoL76VK+opzpj7
 RtBOQIRRWhT/TBFebf2jqs2j2PTpPJcc7tBt+q0w1eYESSOF62AHRp5vn
 p2ZVFVoSNM3jxKfcgKexsi6eFg0OfFSnZbL4wqh/QLjrPp/jiJmGDzdTn
 fhpFrUcCfL0zLtiOcGOsXUUjukg+IEWSR7ENm2tKqQefnkNNU8llYp2OP
 haYPndOCvwK8CR+EARwmNIcxEKvR+/gpJ+vDWy06RrQM7gwSDDgPz/WfK
 EqkjwT5sow1xp7RmkU3XXxZ3x8rwJ9/7J7qrHOM2fgmSwQzH5OexF54Fn g==;
X-CSE-ConnectionGUID: DKyEZnnLS7GnUrcgUmbs2Q==
X-CSE-MsgGUID: WfBUx9QCTUG6gKazho325A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24630796"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24630796"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:45:10 -0700
X-CSE-ConnectionGUID: 22HpQezzQSSZ2UkNHxvJQw==
X-CSE-MsgGUID: rYBQ8hhHT1O2pQ9qi7ZVXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="90403704"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:45:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:45:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:45:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGdK59+nyz86CRjB8x++Ddgnktcsct0ja954k9H2ztbNA4cUoGUu1624+R4ZRr2ZkzCzyyqq9FiZe2U4UzHVIElt4pb7RrcHm3uaqWtYplnwAWRshxjrucriaJFDwPPb3NdGIa4bfqvx1c6nE3Zym5Wghc7UyX2uNV07Hn3C7iQv2LlqfIONtwDWCRREsVVHohS4pz/OpPqpW76Ct3KQ70i/WrO0qha4eiVhXCpMcCipTrgMYraJf7GHakQQA042VXLX6+UiFXR1Y02R2K5ntaDIiog1WwDN5Qi+lkycHOOQqpUpKaP8oNyOVjFelZNd4wBzYyqFB6peMzQctYusQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNayaGv7OjWneDA1eV9NTtvo8VyYcf8d/gY8SUDQa04=;
 b=pHLYVxCHIU1E5y5D83TgDFiF4t7TNYauwGn8PHBVfJW15BPDzrzVaPgyu8ZWgMe31MZXby8GIUXRROjnTK7DMbaW4y62tOWzaaQI3WUYYKk8heNAUa6DRynYbFPLmCzSkdWmAVv6wv29w8fLkAKgcSiCsJhFpOCkObcne859a7RYwosVu3LbjuZltzPSo5/Y1lHLR2LiVuRvd5jEiz2ETBGCXuYco6H/8BTqUrLfL4TbeNT1+LOlGK4dDi1frS0WbcZ1SODnXBAeNN4WAJQDBNhz43CdzlXG4BQOpW0dMuN0xBWpT24d6lZIXxiZMAnFjEa8kws+YbiNY8t2hepfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 18:45:06 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:45:06 +0000
Date: Tue, 10 Sep 2024 14:45:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 38/43] drm/xe/tlb: Convert register access to use
 xe_mmio
Message-ID: <ZuCTrKQSJXi7MgPG@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-83-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-83-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:303:8c::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: c99c259b-8bd5-43eb-323b-08dcd1c8ae5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WWdiHn7tdWm1L72McCqFd1E/BjyqjarUpewcQf9s/6Mk8si5XRqM7XxCxiJF?=
 =?us-ascii?Q?l1wqRemrougW4WvZWRq4Yw2HYywP4AEipm0X2fTXrmgbb94G02CtGD03sfpN?=
 =?us-ascii?Q?UnAgDvIL5wQB6pbLixwyDS1Vr2aeiWFLoq+Pzkv69/zP/baPi2lWor4xi5aX?=
 =?us-ascii?Q?TOAzPiEvEuKi75iU1EHeX/rxFseC0GTioMIf/HBtJ6QV3mXyWfEZFRGCkTpC?=
 =?us-ascii?Q?Dw47r2m5uWJjidz5MDtQxkfF0D6Pn4eQT7HqoRodbaGo9oYg/9iG4ogyumN9?=
 =?us-ascii?Q?CmqDR2pHdi6fub/hxOU/fS0mv10twlSHkVdZwsv88W3GlDa1pugzvBEbNUho?=
 =?us-ascii?Q?iCJePXdDbhN89llPqaKojPyOrSD1ueEcXKylHoycI92EX4lhGf5K5SVQ//es?=
 =?us-ascii?Q?Y5SG8nFQvAQmF4EDUZdfPe6XYh6KzT+/Jnw6dsxRZFGzX2O52BEDKheq8rw4?=
 =?us-ascii?Q?IhMV8CM3OM2Il75X7/Tnf8AMiKudOhvA6muSVE+OrFnhJ8A04lxluAHrB0rc?=
 =?us-ascii?Q?IDzpop0WyxYH/e+3MbWqpiUIAzEXqVK82/2YgV2yq7Gv23Ay1hDwvj0qRJir?=
 =?us-ascii?Q?aH6J7HVwZ/2w1AHrE2C4dCW3ys2ZjXKSvdFYVARw02oOpjaVXWv7ZtW8CdsT?=
 =?us-ascii?Q?s95pNqZbFphG5m4N7JdkEAoO7uV49rm+xtX5DEaXHhOBq0dkT063Ut6E6nh0?=
 =?us-ascii?Q?4QKkX8WYsXZ3hfyyWkQeU2fUCH08ttb1MKIxUl2TMgnVIIqMOZ/R4JGnWkzb?=
 =?us-ascii?Q?KCSTMmwmB3PPEU2EUtgBOP29z2QarIJpv0rrNgr3MfYf1SIClpHpPQKq7gVR?=
 =?us-ascii?Q?RZVX3sk6QYa/ck28xZCQHsJP2mdQ+IGX9UiiZqxm9s/xvycqgmlWFvX4UMuT?=
 =?us-ascii?Q?MDQgo+GORbCWo3ipebgOKYCDYly5vAhEfj/FS1hBp897HlypAcFXKy4Ru9iZ?=
 =?us-ascii?Q?4E3LdW71BqAozd3h4g0NdABbK4Gj2zUlGlieuBMr+9rb+hztylq2FueX7Nct?=
 =?us-ascii?Q?bh73tt2UlXQutLmDuZ+wPQQ4z8oQbU2Py2r0sR9OMzczk65u7MTX9FwOlyJr?=
 =?us-ascii?Q?78Rk+AP+5XmhVwQqaIa9PMWnwVIVFth4qRIJ3SfVhol9+YEF4pWO/4g3BpEh?=
 =?us-ascii?Q?UUZQNtzZKUVW1ARuYLscjXnn7bazxBmxxbFq3IMX1wCpBAhiE8BOmsFME5sP?=
 =?us-ascii?Q?GPaT+30/CybZCE5bmfPwrCu7/636CynITMXw/lXLLMopMxGljMG5hA1TTmsU?=
 =?us-ascii?Q?mljRegkbqhBXx3HSAJLNs/UcyMCVdtCIix2c/kXY2p0pNMr2TZoqyyjMxi9A?=
 =?us-ascii?Q?5BHDnqXwulUMD46x1IctOWLcbnskjVsOlsK8TlyFXtK46A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hrzyueF6o6bzVJaVL2pX6zEXuhRvp0H73kmUnWgOwY6gjtoAkYffDrC8a+Wh?=
 =?us-ascii?Q?XS0dcLmfrYjB3PI//szfBYYDV0Iq81X1HBPhHlBk9wkJsLGgJeQgkdrmRVW+?=
 =?us-ascii?Q?SEUrdTXMt20Mznz5HSxwFfbihE1KdUz19j6LaQ+BiufaO3ZUAERwsCSUtJcL?=
 =?us-ascii?Q?o5rvk8YKqSimXhqTFpZq4LV7tRd8QbEQiBBMSecRj50kWdV/hSONh6RBQ5Zi?=
 =?us-ascii?Q?yeRAGbv6G8hywUDp19oga6ei6lzp6/IojFLaQJupp1iwnWkDAmqyXqmZuqtE?=
 =?us-ascii?Q?aFRt26ThWe3BFJE2GB5az+QtahYHV4bS2gHxg5tDKpRWlyWAojrUGLhonMWj?=
 =?us-ascii?Q?TtGxbtwoxPr+UmrHKAP2xPrApZfqPGyZlyTKpU/SXbuWY5mh1+B4hpDUNkcm?=
 =?us-ascii?Q?DaBdt99ZLObKcFLYHxOr6e2c0pNhvIP6+sJON9S0wSsudjZiI8DasuybUBBX?=
 =?us-ascii?Q?GwUZ4w5cPKydUsSsGdP+fztKTxPxmnr21PJzs6IjlgTqDhsXh86bveFQk3Ko?=
 =?us-ascii?Q?69jNsA3ngNW3LJHXS7Cj/adCqIXG8REaFPtFOWI8vGjc8nkY20N0zX/X25jE?=
 =?us-ascii?Q?VD4Hy3YxmlpyUT+WWS5VKlWydiJQWQLzpXCdTS37NCFXbL+m47gDF2WI6C4/?=
 =?us-ascii?Q?3LZ28ZO8XcuPSvpIcKBUJRiutFG+XrSbLI/HiFxl3BpfRZxhHBKSVputF0o0?=
 =?us-ascii?Q?nQem/SYMoL2X7Mp7Cwufi4AraZ1YVR2DF50ugTP5sm9Cp7i1jznbX/aIxLN4?=
 =?us-ascii?Q?YAQof9xeWtrcvj0hAMVyqcZb8l8FatUVovkr9InOLI0SuM6d1W8DCUPc+kQc?=
 =?us-ascii?Q?5WRTP8UPP5TlRcf0w5ajCSClfttWHI2r8Vhmc6l6STvBdMAeUS5bHeC0lvYl?=
 =?us-ascii?Q?Dtdp7QG6Edld8/UsaDwqloTPH1ypAzWt7I9wjns191vO+DdqkjPjhFH9FKCG?=
 =?us-ascii?Q?lRmEhUvREmqmqrkNU3y/m+cy7iOyYJh/sw+CTi9zfFZfYBupOk3DPCmY3Fgp?=
 =?us-ascii?Q?Dj5UahdIxTAdh5bkOOW32w6nGEMmlHiQhlLTnNv/uNv1Dvor86AiRzroeyCN?=
 =?us-ascii?Q?RG2p2ghhIluFFLi+YjJJMTQC74lCSkRvf/wFvrX2he/fz+dQWxpNcu5RYtu9?=
 =?us-ascii?Q?+dCJsmPap9g+5qMYWGQYnW2JpZ6v5QEX5o7p6VbUCuhFes+2KkR64tunBj8P?=
 =?us-ascii?Q?nx94g38rhm70CBuIbuEyE5Xl9H5SyxL3UiKzdrvXFClTNYW+122H94dsyT2N?=
 =?us-ascii?Q?9Cbxh36zlV4N6jkE+KDmjR6c2xZKQuO13rfqwtN8qxjwC4Mx74UfV9fcvTIX?=
 =?us-ascii?Q?I37YkfXVHn0i1Dyb780YSC5ilVvqVe4G6BfHiSpwYs7CGF878gJUWjeW6/bV?=
 =?us-ascii?Q?ZvedPHmhZ71azqZs3KfROENrKC1grE5oOQdgb01PddWvPZ1nJ1LiquGTKy/2?=
 =?us-ascii?Q?0r8V7HFvGc2eW9Ur4MNS47YgJBQZ9s3PdQBiuEYdCSSbcIrmGthQUIwXw4/4?=
 =?us-ascii?Q?K7CFXOTaD8YUiVSTML/YkOFDPuezfQ5NhbzNMvs/ebS5102gODJrnQeZl0Vi?=
 =?us-ascii?Q?TAtigEJSWPJ806DHewl4NDyDCFqH95PaupZgkSDs3FCIfsYEr2lj/EDVpT1b?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c99c259b-8bd5-43eb-323b-08dcd1c8ae5d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:45:06.2526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cS+XydFVA9U+HmQF1v7Si1sTbqZDhB77EwikmnL1zdyPdcPr92I9UohbCoZYJXoGgWOwTQjeq2Xrc+kf1GbRdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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

On Fri, Sep 06, 2024 at 05:08:27PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index cca9cf536f76..98616de0c5bb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -274,17 +274,19 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  
>  		xe_gt_tlb_invalidation_fence_wait(&fence);
>  	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> +		struct xe_mmio *mmio = &gt->mmio;
> +
>  		if (IS_SRIOV_VF(xe))
>  			return 0;
>  
>  		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> -			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> +			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
>  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> -			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
> +			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
>  					PVC_GUC_TLB_INV_DESC0_VALID);
>  		} else {
> -			xe_mmio_write32(gt, GUC_TLB_INV_CR,
> +			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
>  					GUC_TLB_INV_CR_INVALIDATE);
>  		}
>  		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -- 
> 2.45.2
> 
