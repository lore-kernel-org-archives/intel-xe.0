Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B51C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 17:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713B410E2BB;
	Mon,  8 Jul 2024 17:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4NBCwNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211ED10E1BF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720460034; x=1751996034;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iFBntlrCIR0SaoOhDMMXtRsvfFpIyuax+akYT4lsrAY=;
 b=i4NBCwNyxBsJBIixjnCh8wuUC3vi1w2fw4Dr/s4MmrPjyoDarRbhkb/U
 AakHLikLF3XzDigoZP5niC6XiP2VhMaU0MtHadnu8FBXshVTKab1muM5M
 SevvOQDNMkeiHnwrWGtdSdDZKSQIKb+B4udLK8Y5R8L0RXzIn1fr21k6l
 Nrky45AM2Htafb1ys9jQynLB4lcb1KHP9rj5yttg42S95dts/hHaZ9YnN
 c6M9yA+na/QBH2tLaphKSVCeGD5+X/ElD4WHqtCX03tk3LXHJVk+bV2iR
 Lsf1QAqfm6TBAHP8C245FYCViupD1QSkvYLhFfdzyeoveYkVooCQ4E/7j A==;
X-CSE-ConnectionGUID: f2MRca8xTfyxy7z9LwwKlg==
X-CSE-MsgGUID: 99jjS1nBTJKfwbxbVzcl+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28279450"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="28279450"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 10:33:52 -0700
X-CSE-ConnectionGUID: AdZ7PCknQZehsE80YhANTA==
X-CSE-MsgGUID: ShhghBBoRf+qbxidU7XFYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47672263"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 10:33:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 10:33:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 10:33:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 10:33:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 10:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COBQxbyFiPpLMw+sNo5Rys7cc02j3cvaKYzaGBXlcBFXMGcDOLorX1VWY+lD9qcgo6PohuRUXyzXt/MH5FtN6fn188aUNhjAnhl5Ca3hGbaetLwAbaMFvGJ6XJRUfhEWiGhKnW6JXWAuZmWO9zqMr2i88CTY6omNEf/87HZ5yE8CfkJris93uoNceV7TwvMUwKEfDMPQJIGbhtVure8vxQCrtBGkZrPNn3/hPB2ircMEZkEEH0j0VA4/nPCltDTGBw6uUuNj5zgdRGZa+dd9Vem6O6fJtaPp1b2l4IOJwijrk1xVFCOb8GUCl7+uxawB2Tw3S72MyQZ3EPZSYbDg5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFYZE8kh5mg5cPXmiHxcWXUDV/weCSMCwdzfMM9Cjik=;
 b=l9TAckdmVN4DKDDJlpMH/RLVIyQv3HY1n5cE1cGBFeSvcO8xbJk1VVJl5GfQet1Z+L9BbldCid40mgw1nmdlkRv7uASE/gt+wKxJvEvu87v5gEfgmWo2SYMkTo0Q/jdZ0wFv0RZOBKiMhii6SCc4oEioCNhGND/KwvVd/6awVIkfpCPB3WLKTApEYvzrYIR4TO2kC42gmWA7g3rHtQJEULZbVRtVX9AcHlGY7EJvi8ITDTJd0HN3MobhF6iumlnQy9K360cz/QSd3p6P/C94GF/KeRgq3OuUHa0+oecycQUPMgMRLuy3ylwM3RqHASXLtfrg9ctpdSAusYO1dAO3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB8167.namprd11.prod.outlook.com (2603:10b6:610:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 17:33:47 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Mon, 8 Jul 2024
 17:33:47 +0000
Date: Mon, 8 Jul 2024 17:33:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Simplify selecting caching mode
Message-ID: <Zowi0V1icginCJVX@DUT025-TGLU.fm.intel.com>
References: <20240708120550.131683-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240708120550.131683-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: ccdac27d-ae45-4202-ed34-08dc9f741fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AS66WIhcNcpPkRa7X0YUt4mldypZyNxx/i+NHzv9shCKIfGlODLrWm95o6mD?=
 =?us-ascii?Q?vMNkFpltO+aoHxOGgjafqRtzH20lMplj++D/rFdup2+w6slDX9DAznYpOUAH?=
 =?us-ascii?Q?IzAr0mF+WgzfO5ttt2oC4eABzLik4CcGr/WLW/K9RrCVV1BQR8R4XvsGMZXu?=
 =?us-ascii?Q?KriwgjRw4BxNVqT5EWJiRCd+haHbta8DLkz8oI+sejq0s5BfexHEJFI2cVw7?=
 =?us-ascii?Q?FeXeVsoFxMv+6P5Dc3q6+h+ZqMsuKznjsqrTsMdviGfW/n9tdlZh+S8uc7Ql?=
 =?us-ascii?Q?lQvpUFqVsWjzTZSbpy+lf3shujwDm226/pZf2/E670Ua0tHl7zdeu3Yrx3Mc?=
 =?us-ascii?Q?M2LinqHZBs+1NqVIp8KmcVdDnkvC4o2WdIM8krLi7LCoRbhKEvVVMqPZQ2Gq?=
 =?us-ascii?Q?4qyCq1LSrFfAOOyLlLQbv/4ddH3BpkrOF174sU5Bg+dhiFH9A5xxuvqN62Uz?=
 =?us-ascii?Q?brarFMn8tkC2dmFRFAnP8LuzDhpVcE0uB+2hJ+ZXAiBmGv6gjsLYb2mxLaQB?=
 =?us-ascii?Q?96F7iUY5VDHpfdO7tdzGjr3jM6gbzQj0yPJ6HHFybhulvXcasPitNiTy+Yp1?=
 =?us-ascii?Q?gUds1bQUe+Q4VraNom9fB9shivt2qX1EFTpey9g2zRsXI1jrBIu7qFX+hUgg?=
 =?us-ascii?Q?050E+zLITVOLxAQclq7wn+/mURmDK9npPs2Rl+7Vj6Em+Co2o1ntP86IpCvj?=
 =?us-ascii?Q?k2NKvqsLWKfr8RyMFkEmokkWxYT+h0wAS4B4JgsxPPni5WRFdGdyno4pbZ2A?=
 =?us-ascii?Q?RqZ0SaQE0zs0cssaeHeAeLyBq+AfD0GDAh0D/pokV+LvZKcY4tlMIHwRRfj4?=
 =?us-ascii?Q?1ON8GkwXUPFPET0mXFRZg+UdBT7JLELvebHa+Q6QxfSYMnmt4r/4Lq5JcODN?=
 =?us-ascii?Q?5x4xqQWgV1ouzzvglsapaEyO+Qd1LO7G1x+vsGLAnxHeTswTWSSu4byW4UrX?=
 =?us-ascii?Q?RO/zYibBLJ8hn3bjfDpVgDFNgSv9QK1xGG7qh+qt9Lrj7elVa/Wx4mCIfVCu?=
 =?us-ascii?Q?+OrLTU3SURJnWmNMVQhiMPYjQtVL+g+PRWcplGI2Hs78IKK5ZF6nZ7/68Aat?=
 =?us-ascii?Q?BPPw737EcurTv2zlAr1ZmcGQ1L+ABArifaoYzeMVbhxvcXQrtQ+mTlY6mCCj?=
 =?us-ascii?Q?rIVebAqJi0bgt3UTvkP/dBuWogP0UAFSGTElWda+F8Q7PL6LSSCQ3AzD+eak?=
 =?us-ascii?Q?WCW+DMgAhiCy61pkxmYDF/Cai0G+OOfmuvdDWY9S+tEmH6LLPP408JhEnR4e?=
 =?us-ascii?Q?UhYUcizj9Ya13ri+LUPW7jXVtpzHRqsPFT3TPdRQp4NmTXgYY1swkMGJjaI+?=
 =?us-ascii?Q?4oL2EAPiuX60SjvmMjyTTmWrB8/8WKvB3Egh0am3NO67/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6BONiVaUy+Xz0mnWQ9lgOVB6jJ8DOXM7KyzYtudkKlh61yuVyLnCxk5V/y0?=
 =?us-ascii?Q?If/edKvdvm1D0HDU5PZKvlCXdZbTofLpoguy8ddpsM6bHfhVvaO8NuFfme0x?=
 =?us-ascii?Q?QyijTi9dOKOq29oElImMCMStAolNxmifPN7Q+RjNRy4X7PnnsDpjyrbOgLba?=
 =?us-ascii?Q?JOwPWohFJEM3uInmLxseTVCfdpLd04Tv7dFcR0phBQVAO4JefNADYJZumlKD?=
 =?us-ascii?Q?vTfoz2ITRYo0FJFoOBl9T6Xjg03voNpHw9jXoRU0q0KLyj0n5j5kcXlvUad1?=
 =?us-ascii?Q?jnX/Mj3c+ciUdidMmNHeErS72+UwAIbvUzZ+GCFNvjsfiphh5m22pAynRS6V?=
 =?us-ascii?Q?f0oz9jw3K1bFXPqpxxhBpYkX+2dVgXHz8QcQmUp4PzlibTP1fuMCdrqoIlDj?=
 =?us-ascii?Q?vQj9RPSdPdnFA6Hzi75TWg8rqNWQu/5yylue5IsfkYUnGPHmxpM9Hg+3zPFh?=
 =?us-ascii?Q?oJDKmx8gVfZcDAkgpYVP2GHhf+hO+/I7ObNA1/wpwW3RnbVNIXj8mGcNdpjm?=
 =?us-ascii?Q?3ijgOS8EyFa50Oycwh2PZkITeLHLNHXWM6sgrkITJmkzBJoIMcE2JL/3TXN3?=
 =?us-ascii?Q?5KcPyMtbH5YJL1oPQWQVV2iFipI/ssBxzNm9PBzrZbclmTU6iv7199LJS8Pd?=
 =?us-ascii?Q?PzGzo53RhJAbUH4dSNA6ma9/3kM+iwS3m/WmW4NN1AGB7Mew3Ki0Ri6PLALe?=
 =?us-ascii?Q?4BzIWdk1f4lClHcMBLKlyJe42imPQ7rcjSncNN2bKfkyTN3OUEsq5mtRn6yS?=
 =?us-ascii?Q?Zo7qNsdQNaWWi6Jj010xd7ePPKRWZ3uFBpLfG8T71xM3BnHlZq2b79OPaLqw?=
 =?us-ascii?Q?qLFVX8NrEYq3SwSVzKYKuIKqYZaOdHDHvhGoF90Ehpv1XPM/5UJabK964m0k?=
 =?us-ascii?Q?I52RovR5LQvhGUlfdfpvVYf2OlWkraJ9lc/bYjllHSwETqywyswZGKAPRHwm?=
 =?us-ascii?Q?vO39oBp1S3MXW72++FAe3Z6OSObGPTU5ByTDSxFGieg+7qxt2I4sfrYyK231?=
 =?us-ascii?Q?mo+pCtmQOyWNGwOqTAxc0RSMWNKJ9+Vn4OUprXqSvTSHBH8VPt7EUGQ8ja/v?=
 =?us-ascii?Q?5WQM6Xx5sAWoWBUuOoenQBnaAMXtwxaeYnHFCrSjMQb3XSVpEYFEH08Y5S2m?=
 =?us-ascii?Q?EV0UWFfWWvV/ajmf4wY2xZNnr5BHlsSrVKQRqikJbR1xE2RgAww/WJnJ5A+q?=
 =?us-ascii?Q?Ekv+bI3JiNXcux2xfCeAgTCb3+zihcxs41aDdqo7isH90sNYkvdVDV9ZCf5Z?=
 =?us-ascii?Q?pH9JrHuZSVzUw+wBg0/rpRhtbk4WfSuE8p5ZmypCT/h5wj9W61IaNAMhIOUI?=
 =?us-ascii?Q?I1UJ3EegArNOzIWv3fc3w2rBuyZY+2fEcbPrFGJwj57Zuy0ApANPOsAXNU/V?=
 =?us-ascii?Q?2uChbbL1hzTbXL3y40vhTe1oUv/NK2ViqrZvMdyuHPDImwpD7IwsNzclDdpS?=
 =?us-ascii?Q?GUnp0lYKtseGKKefrvArH/ua3X5jJlerJrMVR5ZZloLEYUbZ4ewaPWoy9g40?=
 =?us-ascii?Q?06vO4E9SHkyDAZvghbwIWyBG++o2G+NFtMYj78K1t9IDJGUwkHtlz8K4Knh9?=
 =?us-ascii?Q?L9nbJ5RsPaKUHMEePMZ/HMQNHhyTfB4y0273TuQEIMfffxkjRbaltY6cAnSu?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdac27d-ae45-4202-ed34-08dc9f741fbb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 17:33:47.8168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMGckl7Rl2IVnaVsWxPG74QYUouRR0qz8HS1UQsioqh5Hu23MiOCwUNMnXx9Got38oYdOb+MIv5uXohpc1EVLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8167
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

On Mon, Jul 08, 2024 at 02:05:50PM +0200, Maarten Lankhorst wrote:
> The switch is slightly overkill, with the default already set to cached
> since previous commit.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Good cleanup.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 31192d983d9e..d3511dd4a488 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -364,15 +364,6 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  	 * CPU.
>  	 */
>  	if (!IS_DGFX(xe)) {
> -		switch (bo->cpu_caching) {
> -		case DRM_XE_GEM_CPU_CACHING_WC:
> -			caching = ttm_write_combined;
> -			break;
> -		default:
> -			caching = ttm_cached;
> -			break;
> -		}
> -
>  		WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
>  
>  		/*
> @@ -381,7 +372,8 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  		 * For Xe_LPG and beyond, PPGTT PTE lookups are also
>  		 * non-coherent and require a CPU:WC mapping.
>  		 */
> -		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
> +		if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WC ||
> +		    (!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
>  		    (xe->info.graphics_verx100 >= 1270 &&
>  		     bo->flags & XE_BO_FLAG_PAGETABLE))
>  			caching = ttm_write_combined;
> -- 
> 2.45.2
> 
