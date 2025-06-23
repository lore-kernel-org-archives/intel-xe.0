Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D98C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 22:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C3610E467;
	Mon, 23 Jun 2025 22:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6ZCijmQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8171010E467
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 22:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750716379; x=1782252379;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=THKrnQVTW1OSV91Lb1kE9ftB4JwIY4/c7CvNKb1dz6U=;
 b=O6ZCijmQ0x93N2IkLcH10gFM2SMAJXDJg6y0JAfCR4WZFs0Q9bAOJqH6
 8CZ+rK1AKFQDfYyYBL6O7ia5MZh6zzvLQmDaE4zs+YgoSPeWH30Z9i40+
 lfiplxPdT52tyFJWPhErU3+W/wk3vizNdD0AV1/Fv1xVxCHK2YgZPcl1S
 atsYuyNBH3mByhC2BGkHwBrJeO9dRmqE+wolrdotrXay0emKF1+hHFVfq
 r8FHm3s7DjyV5ecHH85JjCFXYhjKIEzKq/cGfVGQbPGnIwjhmlCuHL7VQ
 NnazB3Zi/ptevjMK9/XSalIRrOlAUNbwLwrK7M4viMZN1niXHz6C7bJZ8 g==;
X-CSE-ConnectionGUID: Flj2o47NQIGUZKHWyeRyfg==
X-CSE-MsgGUID: 9ECZgWK5Swim+HOe0UHfWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52054917"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52054917"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 15:06:13 -0700
X-CSE-ConnectionGUID: grgm0mlGRMyrt+xQzsxYhg==
X-CSE-MsgGUID: +X2WDxZhSwilugjnLCXdHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="152026522"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 15:06:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 15:06:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 15:06:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.64)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 15:06:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2FyJOGM+HbSrX9XPpzvTqzTi9Ssl1zpwDfISaYySW3jdf6dKw7pvmQnGkxpzo6O7FUYLBZA7DzaXoLIvMLJ9FARw8ULuxqyq+nmkf70d6jEIxDR1ot8PDdWipX1pPfkT2P7AdmeEtoQIiTGXE+yCpVy0oiSDmQt3SPjjseeERatMUR3PMwaFavVNFhb88YsQBZImBbGyiZ37xiYxu/ksAdPqHirIMYQ52K13VCtOQsrMXcdDrgW+Jm7uRi4OTBivLEgSKSR8PDS0l7OiKiNcPfbGqOFuBWFagsN24sCNjNCJ/p337aBkZsk6U1AXrl4H9J0KThuFaXRezlHTjRbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBdWh7z7wBwxEPrilDgHKO6zmsT5ujJCftqHAFumivo=;
 b=iyWFLEYaZ/LkvuoLQt3TZs7ucKf3WOoABdjc3sChdhMMVphvMVu075yRM3caEcymSgZ1dESQPw4HjBJktRcU5tH5mFPcM3DKC+5kTSr4FjuoHDm3qlJ964e0cT2gt8Q0MdvnEAIzwXeaWhGvhiKJrKW29VHRafMpGyvywK16Xpgqn8A24I69wNKrknTwNlwoUQM89h6dP+hh9dmYFlx+8sL06U1qNGvDNWzoxFH2vQyLHQ5+gNHCf2JLDZ1gVZuLaRgeabZUvpp7DGrOKqNSMuiq6D+FTrK21J0H1XpFvYKAmsDhWZ1r7kf1JpxzF9hU5/1yE/iPy+l2hLy2ejugnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8212.namprd11.prod.outlook.com (2603:10b6:610:164::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 22:06:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 22:06:09 +0000
Date: Mon, 23 Jun 2025 15:07:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 16/20] drm/xe/svm: Consult madvise preferred location
 in prefetch
Message-ID: <aFnQNFM87/jRVqXZ@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-17-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-17-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:303:2b::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: 26db19bb-3426-469c-06b4-08ddb2a2286e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8kweZgpAeDnrY4r743drkVQ6VrhtrBkZe9H4pABdPIX6Z1bjTkRsi45z3fQB?=
 =?us-ascii?Q?ZbJV5QaGuMBBtfcYdoC/zpfk1DNqULJuyarhTxvfRwH4fCPb8fDDhgfuyM69?=
 =?us-ascii?Q?FPveU2be5Ymudnuvx1nlLkzjcH+9UlIeP+oLoccf3WpD0M7NCojJlP6bzwG9?=
 =?us-ascii?Q?nBrrsefx16MbGa3B6jvKiRHNZ3bcXGaN7OZX1nX8gsXQ6BvXEerDQWv6MNMC?=
 =?us-ascii?Q?r/spmLlWPUl2I1mhg18TxbDwPFd2zSyeMc75jptBvSXL6Hgs9PN0XlONs5gt?=
 =?us-ascii?Q?s+QjunaRGDkXpQTWjRvlrsuN7eTW3BVOI+rt97k/W9EeupRuklLQqJTU7pZu?=
 =?us-ascii?Q?4m07nnlRtuIDVKkzMbBrSrKhEmTyVD1kTBgDI3ffn4K4xjoRFqs36yLdIbGr?=
 =?us-ascii?Q?42BygI/+DQcM5aZzTNdKbqOsVAnJKps4Y518fNIRTuHHBCTTmU5/516B6E35?=
 =?us-ascii?Q?8t3KhrpiuLT5RTzVmclmICHZUwjpsP/JTyNQrZSXlDcGFQovZO2tHdmQhdDs?=
 =?us-ascii?Q?Lbv2sMk7/txZtzvvHH3kib4UnCOQXiZpxXPCg/pEg07OEw0ZlzTWaEYMXBIR?=
 =?us-ascii?Q?cslbMumkWyCDezqV4eSzvluL9ttZ4IogkWqgoBeZGLGnHOAp1PMXHUaUa/2L?=
 =?us-ascii?Q?46AChw8rh2PjdF2IUlzhw5Pw+DZkgZV/66dG5eTqT70ct4fQIEy71xyTrYFs?=
 =?us-ascii?Q?g4vtdGaRLWj8GbLfwHtqEmg4/mFvB+NP4rxWlrBH4HvkHgzERvuDIsUu2M1+?=
 =?us-ascii?Q?Ujr8oPqbgAx4el63eDp6H+YabAiwr94Tsxy0CU1lNJO/HymGY5xoLt2exAt7?=
 =?us-ascii?Q?uddH+nhMRVUZvwulD0fuV7LUpNTwdeUMWM2k12n6uOw7FyR9przH1CUypyk0?=
 =?us-ascii?Q?FScOCrIM/M8d0//1ewAzLH6ukhxvtOLmUV+15NcgT3Mf+sIVYHvcZN+K9+ym?=
 =?us-ascii?Q?njFTHu7bAN9PRHLGKuKDVmHqEIe/qWxteOvLIwOdAkzxhYFj0RZ3ACbYNEhv?=
 =?us-ascii?Q?9qut/jJTPvv9RhqTgDe9h/M1awayf24M99V/6OFDOR1Sy+AKM0ZHXCgO8RIR?=
 =?us-ascii?Q?M6lIlJq8bbjAKwPucpB8xoojXH+PCq4xLQmZss+wYLJz7GpoNRI5CxBSxFGU?=
 =?us-ascii?Q?bxigNBgjyCpssEZs8JD5ipczNG7MSX9MXb3rWeYPak/S4gg19HNVeUVcKONk?=
 =?us-ascii?Q?EMw6YlUmAfa9I23oYGKDSDnAaAvw8PARbCTPZJs1SamKdWiHtEgHsPaT0YT0?=
 =?us-ascii?Q?DHDfl8ugN8L3mfZZIkO3V+12bgezXdZAbwhpDsYBAv/xrWookpgMkfomLTUF?=
 =?us-ascii?Q?eIsJasvtf5sANORvoGLhP3ZtkpwclFDRjuUhhnfgi7wmfr3NpLpLqeEDG1KO?=
 =?us-ascii?Q?BMuQyxMnBzDobzi0c0kWMY3iFp/Du9aThvCJtBnRRnJa386mZahFGhooljft?=
 =?us-ascii?Q?GdsGt3riAB4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yPIhrCt5IhtiCEzh2LNZTGf7//AqsAfAWTW6kVh5M1dUXAozkuYSEo9KN3PR?=
 =?us-ascii?Q?vyIPYPiMjBqi8qqNl0z0qj3v0Yjd74QMNc2UnjpV+2DGbph44wc7FGAGSSdd?=
 =?us-ascii?Q?+OQK1mw7BxGjlxPhMP+AOlRFytcKLgVOy8EIXPFsCamtJYYjwk4TJPAeVU63?=
 =?us-ascii?Q?qwdV5vRWns8Ewi8z4zM3HvVpwYf35qfgI29SytjenxIGxn3r4t8GtwsUpOGF?=
 =?us-ascii?Q?HI/z6nh157O03/v8AALxnCz+AE9hs5K1r/Qglz+YFZBmlI5G4riUt6rCl2I8?=
 =?us-ascii?Q?WeJ293lBtOtcPqyNTsTWxcHrj6htN5lAiYUboxBSLt/lUAAPSGMo4cak7t54?=
 =?us-ascii?Q?HLK0P65UVhbarw9zm7vgkPI2PJkZGfHGe1lixS8FlFej7fSLYH4wL+g78afl?=
 =?us-ascii?Q?JFX9BpXKdMbIXMeG4mgSfHeD9N3DLKbU/H9hIvBwnW6EqdDJCuYwXjJRHtw7?=
 =?us-ascii?Q?/ErdaO1paAot2Fe1i6OoXG9COXs6j5C2zk9Y/Ulvmd8XPna8EMz2C5ufRwKR?=
 =?us-ascii?Q?O1cHQSxZ0Ot4fUxa98Wb4U+gzB7pUvE+BzNVkY7gG8Lk1Pdf36qrIjJxxu2H?=
 =?us-ascii?Q?R1d41vofjOsHhKchyxvPONavubsJsLBR6YLwrc6bAxUOv7aaahfOhl9ZtxoZ?=
 =?us-ascii?Q?Z2yaul1TWhOykMu6zUlWOibOqSpUQkhhl+qEIozD7WAU7kmwYUrwoOaanDJg?=
 =?us-ascii?Q?MwmqJucsg6DF9KCzqP3TB75xkSv8e1JUk/rWzXAahEF3Fz8RLU/S1t0ntW//?=
 =?us-ascii?Q?7H2x8hHBchlJwgqYBYeSNoRdkrsb+euUzfPpkM9smOJomKrZkqHghPusQhib?=
 =?us-ascii?Q?vejZUhbmv6uUo4fxrQfxIB76zVqveQaKWjuuPYcYSS04PRXRmTmRdIDdfTa2?=
 =?us-ascii?Q?++4dAJ8jQieQjJRSX5jvgK55whjdDZsJZTrfZ93pvNtyancw85F+aEHH5ujw?=
 =?us-ascii?Q?Chjn8yDKZBn6a9Dpa2LOpOjMR/2OwyAWKjKazxXhS4aGD5wGJJN+o8MgMnkJ?=
 =?us-ascii?Q?T5mxloh9IBxt5JS6HKT4iITt313NseZz4w4YSjTYygbQKu74zcKrX+0HX8b+?=
 =?us-ascii?Q?cE4dHjmTOHZazJeig2dUD83XlTRqwY2zBAIeXp8j0FrYlbQU2pMBZbWD1sqN?=
 =?us-ascii?Q?z64xa2tbpGPsdtS/UO8O5qGEN2kpFMwpigN7TKTieFGdAKyzgwhjcqlptZaH?=
 =?us-ascii?Q?TZD+iSiv0M2D+AVwJxH8HIuij+LSMSkhAlvUqBgiPY7OhFY5BHeKWxyvaY34?=
 =?us-ascii?Q?eQtR4ZJeBPETs2ekya47ZcJ1d2DAYFGi9utRT4x2qVJpchHHSOCQIadnMVs5?=
 =?us-ascii?Q?95EiGRNFCoVCtPhGb+Kd0xzTlSPR+7SxU6n6qoUa4eEKD5uUQ0B9XY5C0pai?=
 =?us-ascii?Q?3MBEpAdMAFpv+J5zN0IlDoJRXdQ9NyBlcE8e9ncv1+4JnQvNlcby5g2cp0Bu?=
 =?us-ascii?Q?BOEuCro75ejgWIN8iwfpyVtf1M0NUqS3oROFumQZEIxF3Uw6fa4HHfeMClcn?=
 =?us-ascii?Q?NG7QBGK386zBChLbhIlsc98Zir3iiZMouRIpO75Oeuqozal6RncOU3KoqoN5?=
 =?us-ascii?Q?fM3vgXLYkWsjCG/9FBo8+DDrjetpIvHcbRR56PqqMGUeB0oUP2pItOQD4z99?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26db19bb-3426-469c-06b4-08ddb2a2286e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 22:06:09.0269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lw700vfW+dBsRPbo5SC6g0beBNj+RHTUSQRuGOi8sdraZIf6LjjBLU387O4//ZsKoB2QS2e8k6FHzRDilToAHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8212
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

On Fri, Jun 13, 2025 at 06:25:54PM +0530, Himal Prasad Ghimiray wrote:
> When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, prefetch svm
> ranges to preferred location provided by madvise.
> 
> v2 (Matthew Brost)
> - Fix region, devmem_fd usages
> - consult madvise is applicable for other vma's too.
> 
> v3
> - Fix atomic handling
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.h  |  1 -
>  drivers/gpu/drm/xe/xe_tile.h | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.c   | 26 ++++++++++++++++++--------
>  3 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 900a5883951f..1658e28f3773 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -327,7 +327,6 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  {
>  	return NULL;
>  }
> -
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index eb939316d55b..142ed5cf654b 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -10,6 +10,24 @@
>  
>  struct xe_tile;
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +/**
> + * xe_tile_from_dpagemap - Find xe_tile from drm_pagemap
> + * @dpagemap: pointer to struct drm_pagemap
> + *
> + * Return: Pointer to xe_tile
> + */
> +static inline struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
> +{
> +	return container_of(dpagemap, struct xe_tile, mem.vram.dpagemap);
> +}
> +
> +#else
> +static inline  struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
> +{
> +	return NULL;
> +}
> +#endif
>  int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
>  int xe_tile_init_noalloc(struct xe_tile *tile);
>  int xe_tile_init(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6dd1f868942d..0dd9f9e11030 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -38,6 +38,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_svm.h"
>  #include "xe_sync.h"
> +#include "xe_tile.h"
>  #include "xe_trace_bo.h"
>  #include "xe_wa.h"
>  #include "xe_hmm.h"
> @@ -2907,15 +2908,24 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	int err = 0;
>  
>  	struct xe_svm_range *svm_range;
> +	struct drm_pagemap *dpagemap;
>  	struct drm_gpusvm_ctx ctx = {};
> -	struct xe_tile *tile;
> +	struct xe_tile *tile = NULL;
>  	unsigned long i;
>  	u32 region;
>  
>  	if (!xe_vma_is_cpu_addr_mirror(vma))
>  		return 0;
>  
> -	region = op->prefetch_range.region;
> +	if (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
> +		dpagemap = xe_vma_resolve_pagemap(vma, xe_device_get_root_tile(vm->xe));
> +		if (dpagemap)
> +			tile = xe_tile_from_dpagemap(dpagemap);
> +	} else {
> +		region = op->prefetch_range.region;
> +		if (region)
> +			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +	}
>  
>  	ctx.read_only = xe_vma_read_only(vma);
>  	ctx.devmem_possible = devmem_possible;
> @@ -2923,11 +2933,10 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  
>  	/* TODO: Threading the migration */
>  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		if (!region)
> +		if (!tile)
>  			xe_svm_range_migrate_to_smem(vm, svm_range);
>  
> -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> -			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile)) {
>  			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
>  			if (err) {
>  				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> @@ -2995,7 +3004,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		else
>  			region = op->prefetch.region;
>  
> -		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
> +		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
> +			  region <= ARRAY_SIZE(region_to_mem_type));
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> @@ -3413,8 +3423,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
> -				       xe->info.mem_region_mask)) ||
> +		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> +				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
>  			err = -EINVAL;
> -- 
> 2.34.1
> 
