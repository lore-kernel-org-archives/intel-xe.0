Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A3DCD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 21:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F0211289B;
	Mon,  8 Apr 2024 21:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQnSx2P/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B735D11289B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 21:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712612779; x=1744148779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N0CfCOhXLT5b8Fmirm0+zDxmZvX0qwUBw6K5ygY95UI=;
 b=gQnSx2P/s8MWbR5rNuxDRiq1B8vBt1VUk74Hpbi0vlrttFtNDWYtcnKj
 vOP7m2Vy4CHB5zxFJGlGbTmCXL7nnqFdWo666cUR5CZ1d2yLDysBkHKmR
 1VMaPVR85HH1GYLBynWbikJ8q7VFp2NLR2tsmg+2Uw4OSc22pKScs6K/Z
 3KJwrVQ7VogS9j4eo8frT84bgGZ+p2EH4TLhClC57+/u5M09QmU4HfETE
 5C4gkGh+I/RdFycczZeqT0X7uHYK9AuLPtoxvo0McSQlnLQ2hpLWdZKK6
 /0Sqxah4V2AajiMI67R2Gi6/Dm7ocNmaUgfpMf+2ofqwEmKVtmF28E8HH A==;
X-CSE-ConnectionGUID: HNI5ZcsQROOrm3olSOeKTg==
X-CSE-MsgGUID: F7BamDi4RAeymmDl7HC7zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30399811"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="30399811"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 14:46:18 -0700
X-CSE-ConnectionGUID: qcbPkdAyQjqJaK2TAZ9uzw==
X-CSE-MsgGUID: iXfv9u31RpyxdGfUKHCyVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="51204239"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 14:46:07 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 14:46:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 14:46:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 14:46:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdFc7kiUj5Z1EWkPCPquCUsgdYnIUPkhB9vGumRNihkqpT5zF+UNVp5hwda2Xb9gVYmN4ubLR2LLDFiHnQN9MycSlot9yfmMBuQQcmu3DeV+5tOsfykuSXo34qR2fzzPHLQf/cXQ3WNEndnjI/jkd5tGqZwWFXVlsekQ+CxRD6h2HVY0gFA1OeLQrfO+MYXCeZcSMhrQ4z4OXS6UhN5rJfb1U+WRcjFTR/iej0E7vF3R+uwPqM/voM6yII4mT4tUQuw6g79MtXuEDwhS2RiTGEFBf/XPOS++BIOZyPxus3uBMQbBobSK5S7m6+H2biJpC1D3+/YwkqOLE0QMt6lLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwM0t8rMBV4Og2UjYKd3rTFiF0Nn6GwDE3IiReEVX5A=;
 b=bvi70iqXAA3dH/3TwhheoEq2gxWuzYWjCDHP4tRJfo8kkO+9CO7/Dn1Vl6MH0i/sZmN/z3qkJeuW6s9PQG93Ywajo2Xy4ArQT1M1KFW3hziNrX70XM+KQ+s/SYsdxmXm0/T1UxTopkvtUpoQDOgTu0kczw1nKrWfoCoArjEIE/cWFjDar7OhpTHieyXL7kdBBPXcSlFf9zmzCAMS9371LZ3NJHkCxZKY8SvQm/VK3SdxYy16c82crdUOn4WO+jD7Z+EW2FN8Gy7vrASrjkcvNlH06wStXf6Byw71EW9+IDoz013NvgjuZ8rVSqrWcs8p4NwecEuMX8IBbudfbff+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB6718.namprd11.prod.outlook.com (2603:10b6:a03:477::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Mon, 8 Apr
 2024 21:46:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.7430.045; Mon, 8 Apr 2024
 21:46:04 +0000
Date: Mon, 8 Apr 2024 14:46:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH v3 07/11] drm/xe/xe2hpg: Remove extra allocation of CCS
 pages for dgfx
Message-ID: <20240408214601.GD958162@mdroper-desk1.amr.corp.intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
 <20240408170545.3769566-8-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240408170545.3769566-8-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY5PR17CA0003.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB6718:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2x7gcV8FNeh7HoCuE86MWzlie2bYUA2HCa1yoK9XUlrAG0k8uhylOU5uhgJLmIunSO7TXG/1ZERBVLPeVuqUvIgAJ/Bw0hMHCN/Kv/282FLAQsZtTr4SNZ+LnbthZ0WIfaK1HbSBwZ2HxgbKmRoCKAy5RX+PkZNiyI8KKZVsuey0eqGOt1NAsJpmJnvt0bBuy/jpStx4UfxDK2DWVZ1EwLy2+qPGe3Vu41ZPZUI83e2tEytVi/je+m0tGWHS0BdeQJ+K3dISMTGbzYp6X3Aw5BNIUZ78hVemTV5ZBZKiDN+Gxmd9IPZBFlR8rjy+HTgEqJX2LcsUqzsRha23ICrDprVvAS12FzzsK7JyBn2acEUfbZuClOaR7bpEUG2K6RfdMkFTML+NgSXWXdbVJgDEZFBgJmZ16+GKyMFWWg0BN2/11oV2hscB8pNiUv9Izf0rFaetfVZRxLj8eKvE9GS3ozzpi2Dl7kmv97bNbvzHAKMDpniVzulW/6Oc/gZt8K0OXitScypy0w5UAQry54t+Q9E01AIdzn2T9q9WQdhBu/dMuRMscS7g44GdTWXkYd4nNZjm5EqOJuy2KtsnSdUjQVPMvpi/iW/vwYcnsI3fUN2KyyEmhz7Z7P8VL9XCwmSXyUYqf+irmqN0gVjeVJ1SOYebWybvnHUr7jT+hqQNJ00=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0+ZgVDYF2YkMEbX57km6Tu8Jbbzbq9R5P2L/K69CtqFWCJ0c7gj5olwFOWo5?=
 =?us-ascii?Q?o2VeTWJPKCBgbs6wrK6doX396mrJqu4tf58amKxWbcUUP5ldvf7p5ObOp1wK?=
 =?us-ascii?Q?abJrj5ZVnd5gortY0G7b761QYSWDymYRAT9zjDs4s8/FmbHsixD7YUQTmUTj?=
 =?us-ascii?Q?vjzU53Ae7XojyrAk8oSnd8fFlrB5zcUEhGFDbhO8crCaVRSHZLP/MfZk4VD8?=
 =?us-ascii?Q?g1LTqmgK37fzccDStvTX8uyK5+Ys8h09rzHcw/t8MIRvTXcp5UZAMR3NJ+CY?=
 =?us-ascii?Q?nL7cKT18bQhYFVlIO7Nxck2FZq+6YSGDhl5mRrMcwZ8rA9aug4hy1/LmzEy7?=
 =?us-ascii?Q?kpy4RVwP1aCUnl503VFoMdemueyeHzTXzCY7JDXwq+KFpfDY6qWO3zlxhxOD?=
 =?us-ascii?Q?Bx8x+qk/Uf53j/lxwg0i7ylK4OqqIUBndlwV2ISxz3DDFHzoEQGrVNT5hYki?=
 =?us-ascii?Q?lt6i/xawwhUfi9D1VQTULQ+W9mRz2+TRem90hcrXKcXqTuROdADLNbrbmHea?=
 =?us-ascii?Q?OK4s7V6qEBc6enyvZdyLDTeqmh6dCLhW/Bc9YY31l4IU8T0p0NQtFNYJstwq?=
 =?us-ascii?Q?mEarGJfq3c2+8JH6ecdgsVdvN6mlh8AerO7GkS+ZromGzZMhz5H/YnPZkVOg?=
 =?us-ascii?Q?UdCz83QFWtJmziu/n0OMdUS5BhDZKJEflqDdGEH9OJc8zqW2VZ7W3GAkks8l?=
 =?us-ascii?Q?Xthf9nXMr8e2zUmw3iQfV07tlbMbRKrD3mUfz6rGKOaCFjJ24YPKmIUvF8WI?=
 =?us-ascii?Q?5flH4AxORcymrkAmbuknmwg83N4QMeaCXVH37wLNuAVyW1ERHtirVG0wtDqy?=
 =?us-ascii?Q?0cpTMefI0Zfb/fS371Ti2nsoHlrEvPr71Zt53WHza8EQiErS0EKvNBxAI2V2?=
 =?us-ascii?Q?As2gDkbeWgLuGu80/w/zHUoWB5yo3iI790R8Fcd8Ml4qacVAFwRPV0OJIDhj?=
 =?us-ascii?Q?3a1kctP4CUrGUIhe34S0oktOB3cGfI6c2uKrmihGJDgp1FbqJfDPYtu7qz5P?=
 =?us-ascii?Q?SR5ljoY+AQ0nn9k54el4ky8yvT2uzld88LQoZorovbmGUFeGvpwusX4F2eIn?=
 =?us-ascii?Q?zqpF+lv9dKlJF2FG5BxqCklkfy1Lw0amdDJkqoPyuR4RmkbXK2woz+NK67qu?=
 =?us-ascii?Q?8RxXaE5trtfLZI7FvvCtkFln8oWG5iHbI6fkA98444wf4ez4xPn5iZ8CLzUQ?=
 =?us-ascii?Q?lp6XDl0piX9h4n7pUZxKtG+fJeeg0QhziT4hbN3bKvvNAvmYSk89Ovy5hE0X?=
 =?us-ascii?Q?AmLMIEOmsEfbwPdrYajLGbaUBhpdjHF/Sg/W+SJ4bLYyBm/2dYPLCXlZmu7C?=
 =?us-ascii?Q?a5uHmAqPcqsxAyajWzbsbhUWvC9AdfAIQblndcquCvSv1PHVhsMm1pSBiwWK?=
 =?us-ascii?Q?B5SNfU+YDw64GFIGAfCzYwip11xhOYaHPUv+XLKG6UgE5WC1Zsng2Z2gRnNX?=
 =?us-ascii?Q?tWkM8RkCqr5g45YvYKrO2Tn9eGrpiipwKRqmYEKl11YoWua6VcjffGeiRqM3?=
 =?us-ascii?Q?2z9UmiINCAVbfMUHrdCedtGCjMvo2fHr3GtojM9aGmMV25gdNfjvZh9YNCaC?=
 =?us-ascii?Q?5gUQhEEkSeFwJyUV3NgOd6EhAFmNIpQqmzNJCyzjaFhQvkHp+YzK7Z8DoQTX?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2db9aa3-f88c-4097-76b0-08dc58154a26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 21:46:04.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yfqk36gLLJlekCveD/3+jpkMsZxGjlN5J58ba7qidjSe1yvH4hst3AFtNtvgXkn2iGAaMjCqptDw04+aANcs+Lv3GWg2MU8U0Nru1fIj+Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6718
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

On Mon, Apr 08, 2024 at 10:35:41PM +0530, Balasubramani Vivekanandan wrote:
> From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> 
> On Xe2 dGPU, compression is only supported with VRAM. When copying from
> VRAM -> system memory the KMD uses mapping with uncompressed PAT
> so the copy in system memory is guaranteed to be uncompressed.
> When restoring such buffers from system memory -> VRAM the KMD can't
> easily know which pages were originally compressed, so we always use
> uncompressed -> uncompressed here.
> so this means that there's no need for extra CCS storage on such
> platforms.
> 
> v2: More description added to commit message
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6166bc715656..fdeb3691d3f6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2201,6 +2201,9 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  
> +	if (GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe))
> +		return false;
> +
>  	if (!xe_device_has_flat_ccs(xe) || bo->ttm.type != ttm_bo_type_device)
>  		return false;
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
