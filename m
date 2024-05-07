Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A17C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 22:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58F71126D7;
	Tue,  7 May 2024 22:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1d/tOgW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3FB112E39
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 22:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715120472; x=1746656472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tC/pZfpXI0Ju5nTA2t7GSATX7KzFLs+s8xp3/9mxu2I=;
 b=C1d/tOgWm4AWY4a2sM4wL3gKG4tkP50P7nTw1E0Ir7jaUoBjg8SC3qMy
 DuuHOHXibyOPDoplowT7gYDxmzFwYsyZpy5cxoJm6iEdLkCsCXWgqnmmI
 REwWseWZ9st6nxgs4ynE5GP3MozKIdkNMvCgObAPWxSPgwep5KUfrc4Pj
 TmWVIWwPgQLSDlFTEvN2beBCoLnAZtDy8Z4yP7R7M6nCcLREp2uaed9Zl
 uFMGEo9497oklLkCOnTjm5gSvhZN1mjW6Kc3ycdS+VPx1qAxzFo5ILeS1
 R1SafWskEoY3YZSSAng+eVeC8Q3fIwb8Lw9UFc1BEz50nHOsDD66JuHVP w==;
X-CSE-ConnectionGUID: 7KOGT/+yRBm+nB63EwwDhQ==
X-CSE-MsgGUID: 9TwSIIprSLyA7VrCpBbw9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10805640"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="10805640"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:21:11 -0700
X-CSE-ConnectionGUID: KlITcGfvR267NmEdK1hcZw==
X-CSE-MsgGUID: w4x8r0FWRXKJCiHba5SM4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="28766646"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 15:21:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 15:21:11 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 15:21:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 15:21:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 15:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AI5Xm/b776eW419Hp5dzw1v4VZob8H7rQHUAFYy+4bCTghBie9Y23IGTJQzjKWUvOOnCbnPnlCL3rztlZUuAHIvVVm6m/+HKWJYWkxqdmId1odgotb9EV5nSr8PXIvDedqLUSTGR2bGDBcFAtDmdYyGop9RLAXZZgEqSf0JiMDusGawIbMHivYuXO3zdNqAliD6lxUFw0N0dgsTfbtxEYTDso3w7QrR4WWQWsEmsqYhwRIkz4M9WqDf+QWAAtgW0hKhbeb/zPyBwedz3Rkxc4SGDNiNryquLKIQMcwNwtn965PTvlwIDg5RW8deYT8I9qsUgs8nK/AMoepdd6kVw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaLB1iiUT1scgJfYxgsQ4wyji/ecPsvrwYDy7PpSMEI=;
 b=QkQXWZ4t7Bzealhb/fJayGe6/TKuO0lIflbxY2aeD2RUYvBCmXwUw2A7d4lOfBd+tkRkuZPj/P84HvQrFEVovczLF2uuDoaEMqthsYUl3zH/z34poSmgCISOXampwS9SHoludFCdBQ25niUIno/vYMv+C5BSEqeJLizSUlKK38kXnFkLxtELZMA3IGGXeP1pVkB2wN02HEq515lry3TD8ElkfS9cK2UOc/pJRniD710eXNTwlAvaiLaNWi6du398b50+B5bQqusKtgDWiYAHwOkLTsjtsXE1kndJ4JmUnNZT5RCyZC+GaqiLke7DkdXS3ok3TbibCMl9E1tqvge21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Tue, 7 May
 2024 22:21:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7544.036; Tue, 7 May 2024
 22:21:08 +0000
Date: Tue, 7 May 2024 15:21:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/4] drm/xe: Minor cleanup in LRC handling
Message-ID: <20240507222105.GH5615@mdroper-desk1.amr.corp.intel.com>
References: <20240506171111.16280-1-niranjana.vishwanathapura@intel.com>
 <20240506171111.16280-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240506171111.16280-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: eae72ba3-b215-46d0-b57f-08dc6ee3fe06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zfw+l4CuBvB++AaeLl9byL/PbrdJZH4NBOCzEyf+D+GExNvRViRE8vU7CgxU?=
 =?us-ascii?Q?x8VUyUYnLyv6dbeWWA1u/oHImvOYuyKe6iRSL2bzInGJK+0LC4ddUpNcR2Xa?=
 =?us-ascii?Q?djivc+6S60lEYRWqr9hK9Bp4t8GJbKuKd6+acXtw0N43VIwDxFso/IdzZhpv?=
 =?us-ascii?Q?SS2w7TI1dRZRgVaxs++54zGaLSGwVayGxqM7tMJHk8XiDnty7pe3mnj/rCwy?=
 =?us-ascii?Q?o8Kpv14psif97LrEE0UYAv97gaGNWkzaPwm3ubHZuRvAALEP8wAlf2GRRJ8+?=
 =?us-ascii?Q?5+UGVwv8aNh7G7Rf6QvYcj2Wt/2OiczFFGNT0R7omviUEYfWGpnMqwnRrd4N?=
 =?us-ascii?Q?5e29ULmxfLCkg+eo45veMbD4w/01sU92MfJiYosjnkg9+iK+1dlq+hCbFgUv?=
 =?us-ascii?Q?4D9gi142V3AGGpJt0O4eOlJRo3t3M5cLaeDxuAaKMA4lz8LaKFBNeeVY0Zp5?=
 =?us-ascii?Q?Ohj6bJwBlI4yGlaFa+g/3i5KauL2jDMDrM6hOgMjHRB7VED/ZkzQcAfPsOIL?=
 =?us-ascii?Q?nqUjybuuoawbKRLr8S/vG+y4XQ774Y8tVQeDkf5ZcnR+y5IIv0lsYNxef1Et?=
 =?us-ascii?Q?EUKSq2AC59VQq/FtWeQ2ltFBVGGeNNb3uevFv5KBucuVomsb88jJG4ziLt2R?=
 =?us-ascii?Q?kyoVcyvsbvb/ii7DKDK6itITGSBgv+/LQ6b3kgFVg161d7oxPJZrVlMcJcze?=
 =?us-ascii?Q?jw3n+d6rffElq00QAitKLohJ23ONwS+wBz98TZKoCA6eqdoaSQ5CCxmDI+9M?=
 =?us-ascii?Q?vWHXqa57D3Okp4V82ZolloYF3fQcOgtfzwXzK5ADd8H9T/sWEoZeKr+5QNIj?=
 =?us-ascii?Q?swfXxpcLeBwltgMB4gZbZfdwECoT5o+qAceA20TuV82Il9bDihra6UF+6Ciy?=
 =?us-ascii?Q?5mI5aC1v7nY5DwWoGKce1chA4RT5zxdSvbwLTVxtAIBB1vHRzebViakF9rF2?=
 =?us-ascii?Q?5iIWUkpsjzVeGww+NjDnvpQswgrTUwmo1ymB4ebSv/BawQPEkU+4ycGRiI2K?=
 =?us-ascii?Q?PAf4aUOgy9J+d0LYpaB9JyvnWyA5HKsoQfnP8XUjtIqLyyK4dQqvHgJxVzLm?=
 =?us-ascii?Q?aYGkGdYaI5D5iC1zZJGx15CcfgA4d8lrMYOSAKAP2MeEn0+Xj2uXB8Lbhwh3?=
 =?us-ascii?Q?xx2m3GtstKY4+RRAvIY9vwxnDPRfo1hi0M46Or6i5qDq/oLWFNwkYFF6CuY2?=
 =?us-ascii?Q?///YqsH9jH86TAHDfG6biiu7b5yV5874dPs57NIs1mcqa+vhMYpS4vnSZJFG?=
 =?us-ascii?Q?SyKTtUOhOGRSIWy7P0nQjIH0nOTI1bLx7/fX3Ei7tw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FK6r8HmEvxAeytadOaVkO28fpMlkGwyBO3sK0VbCYBYhjmyXZ4zpcHUsr5s3?=
 =?us-ascii?Q?REJf5F2iY0UMPGte2/avxUWB43o2V360IAv41/TwJtzmjKvkHkLge+xViPdv?=
 =?us-ascii?Q?mrLxX/nm1QbfFY2DcFF22DSNYTXZOv+ITyeN99J9DVEk3jYK6OndjYNvzukT?=
 =?us-ascii?Q?UccJ66XGDC7GlgNDWhVOf4vGHt5miCYejsoYPdijWtOPxiqSWdklOeGTuvIJ?=
 =?us-ascii?Q?V+u9lbF2wVyM7+NfBPPK19nx8RML1EnNI2rYgk5SeAmPzeuqNDnlmhv9oKCy?=
 =?us-ascii?Q?df3pEY8EEzwceGMgHl09o+NZPRIEpiUQXfmkUAWcIPCudrqZE8iamYRDm7ky?=
 =?us-ascii?Q?JDS9rD9IQAOwLe8/ZzdhLr7S2rH/zZEvmDCHAH0VqzRZ6+sIKdPqv3CF+Tff?=
 =?us-ascii?Q?1hljwrwHzoBQBaZSpSgpK6CJo8QRvloP6Sird0xI3IrWOz+Zv10qr7bl654O?=
 =?us-ascii?Q?gdH3RuFLcisKPkz38aOYilWfrrR060AuiGkDdbKAMAtnofc1DvOTSaFc+6Pt?=
 =?us-ascii?Q?izizPkOl+4VLYREU1dX4ei1YnjC1iT20xLfEbH1sknUNK+SKXlPqZMlh899+?=
 =?us-ascii?Q?7vBhLUUGGjm3TobOjMR5qkOhqXpvFUueJ2oQ4+VyEpw1MoErZOp9P6Nz7nOq?=
 =?us-ascii?Q?z6MsaI/ZWq0h3pvYy4emHS+CMig2IDRBLCL0eJ4g/DPC6BqTZcye6mOZd6DZ?=
 =?us-ascii?Q?0ZbHAvlKjo6RkNaL926+soNikuv0In0jxmYwYE07N2GAABKKTeobaf1UwhDr?=
 =?us-ascii?Q?PjFg+jR8d1gG3jjXEWssgD//4ZEb8OHWaX1CeOXJEP1cpe2z0s9kXUIrxGVc?=
 =?us-ascii?Q?EIA/bd9kzrJnzQ6lkXVMlf1Sv4br/jl6E17G8s2sCBRYTyVQgXIKUE5utgWb?=
 =?us-ascii?Q?eX2GzKGWKkAmcBdUyIKMEFxkd5wOlu/BaQo3HifU/R5XeUl/nQVOlMpqKVjr?=
 =?us-ascii?Q?I6KQ8x5qZ5aiaXMwG7PrM22+99tiOjFMmex4S5fq3bvsAZE1fz76B+Istpmn?=
 =?us-ascii?Q?xuHcxZsE3p5ZNNSOT0I+IIFbmAQGWKMVJR0/cF+LTlUs7udBKaqFmLwFZ/vi?=
 =?us-ascii?Q?dob0B+5xDIUQNpQaz/zt0yPZcj+TK3don1DkDbq/Z4gpcQ1HpQsBnlNs+yL+?=
 =?us-ascii?Q?ZAR2lRDVlxDkjvXSKcd0IPLK2UdSGKJtrVS2hz0pBYoNdB72NZjLW9uPdb+9?=
 =?us-ascii?Q?v7+JMMv0mK9TPNRG7kW3JSjUJauubXX1xHUIsEU4B4TqhDqtTDc6Z/+Fbehb?=
 =?us-ascii?Q?ymjXsetIx0dg5s4kzEjYEebYg2BFF9ExcW6ztRU7BkmSbUr+RkFpuoII7sjA?=
 =?us-ascii?Q?RcZZ0c38MFhGGtIOp8PS7ZN6fPMDKrUo97W9VxjFM/2CeU/+T19KTAR1hdX1?=
 =?us-ascii?Q?kiQMZwgvvDG7fHcwzBBobr49M7cviY3oMC1cAE+osuVCdcdg3d5rdR8iSiLj?=
 =?us-ascii?Q?Y7i5sLb8DnExE91HeQ5pQdAeqDrfAIm9VltNJ9YCxAKN4xExQTznyt0RjL3u?=
 =?us-ascii?Q?ugEaGvRyEabjGGMSZemciif1Bz5M4WZJ1LnsN1yKbUXwuAOwgOGnDSm/75M2?=
 =?us-ascii?Q?RYASzLqtcxCjsO0hdDCnkkLD/6U8wtSSbyrzF08NLzRTdBFMaw4Ag1/eqV2s?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eae72ba3-b215-46d0-b57f-08dc6ee3fe06
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 22:21:07.9664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g76PxQ46rkfgFpDvvKvxVt1k6ktQln0W9Cb7mIKl++wNLB0OkDHEKHyfSIh4MfE8xGlfwwc1kna5ewdYSANzhAfbBElnCoGeZxmQiM88WdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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

On Mon, May 06, 2024 at 10:11:02AM -0700, Niranjana Vishwanathapura wrote:
> Properly define register fields and remove redundant
> lower_32_bits().
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 4 ++--
>  drivers/gpu/drm/xe/xe_lrc.c              | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 97d2aed63e01..7e1b0fd68275 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -44,9 +44,10 @@
>  #define GSCCS_RING_BASE				0x11a000
>  
>  #define RING_TAIL(base)				XE_REG((base) + 0x30)
> +#define   TAIL_ADDR				REG_GENMASK(20, 3)
>  
>  #define RING_HEAD(base)				XE_REG((base) + 0x34)
> -#define   HEAD_ADDR				0x001FFFFC
> +#define   HEAD_ADDR				REG_GENMASK(20, 2)
>  
>  #define RING_START(base)			XE_REG((base) + 0x38)
>  
> @@ -136,7 +137,6 @@
>  #define   RING_VALID_MASK			0x00000001
>  #define   RING_VALID				0x00000001
>  #define   STOP_RING				REG_BIT(8)
> -#define   TAIL_ADDR				0x001FFFF8
>  
>  #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
>  #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 2066d34ddf0b..f759f4c10914 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1354,7 +1354,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (!snapshot)
>  		return NULL;
>  
> -	snapshot->context_desc = lower_32_bits(xe_lrc_ggtt_addr(lrc));
> +	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
>  	snapshot->head = xe_lrc_ring_head(lrc);
>  	snapshot->tail.internal = lrc->ring.tail;
>  	snapshot->tail.memory = xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
