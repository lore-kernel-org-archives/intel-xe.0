Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C5AD6A222
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 17:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A459010E094;
	Thu, 14 Nov 2024 17:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8HLnP9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A0D10E094
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 17:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731605831; x=1763141831;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VrtCcOtx3oe69jnblv8hmuvt9gt/NcE0dptN69i6h1I=;
 b=J8HLnP9Wn6KZyVOyyn8SNP6WZKOR+HBmvCTyMYfU+thTSk2RUh2qCXtU
 kcMauwamxyeXx5KqM8FGzE1tpRraENXA9HnArw5UxNVYxtAjWVmkzLm7Z
 yA4MSF7tzLqsHE9t6qNQTc6ms9FMYU1lcExLxkJ8xuX4hywlw51LPZD2T
 J7VsVd97W8mUixAiN89ohJbjoGFo1EvUz+Oj3Q9H3DckTCCa695Uzo9fY
 YR8q8EFZbEpKcekzSjU7XGjCuS4wwFbbRsl2DxiPtTbAo5zWs1vJBA2iv
 HRBPZtvdAFFwGI4Z4l308ei/oTi5RKyUtINb0wBMbFDrsSsAim1OJNQ76 w==;
X-CSE-ConnectionGUID: ozQZdBbgT4mTKl3SYL5BwQ==
X-CSE-MsgGUID: TOYjejsIT/uNA9/3lCzKug==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42683849"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42683849"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 09:37:11 -0800
X-CSE-ConnectionGUID: 2Nyrc/zlRCKJxKPiiMFM0w==
X-CSE-MsgGUID: HKaynLcFQwW0pjZBD9Kwhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88691860"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 09:37:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 09:37:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 09:37:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 09:37:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxAkhywQAatWD6uv6DZVX7hOSZv+Sxz9Bq42jzjXKYPwK6DnKAN5E7WUHRrc67kjEHc+iNtTd1MZ2HUb4BW9Zq3HYrekbBUzNEJNC3RyUhb9m327AokttHYc3hfiEUYn7WH60nrPIAoKHbhoD1nEZB4cf5+l5MEE31xMxL52QrJI7wtormCdLdt2FYLRyib6B8iXeqcTYICw7uIHJbhlst9byp5X5zOuWO4KrKQ2l7xBmjOi5QarlsbINIRPJA1hxsNW0nILJvs6s3Y2IQIIRYIweUz54+oO8taPSP6YjkNbxEX4d8jIHRM1c+pSjxUyTSGfjK6u54z6CvmAu0XKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP+KZuck3U/WnsNRXBBebv6Ue1UIugy6Jgxkc7kOLyc=;
 b=udmlF2aqwYL7mL8Basd74O9/iFVIzGD4vzPDDuXuK1Q1TEwm+9YktZ+VTPkPO/tPYBFOqGP3G1NOCCP7lb0NImqbj8HebEkizmcYQLXFpXVWuLRFYMBZY5YI+LT/ClU2A/uoE1+2wmd2nx4r8NLPkuKAbW36mvbX+BGGL1j9ljj0MtoePRkIYxxbOYqqiGdzswH2jneS4j6HGj4SmKdPDv77AgM85Ey56CX1iPpmxUj3+t2cihajndg2oPx3bAFMdNFkGppNCbFbgG7p5QjAzRsZc29rdAslySbhjpX+EjU8TSXBnqPSga6EQsfGh4swehUVc519xh+taqpuYb2fyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 17:37:07 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 14 Nov 2024
 17:37:07 +0000
Date: Thu, 14 Nov 2024 12:37:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Sort again info flags
Message-ID: <ZzY1P49f-h-HCVx-@intel.com>
References: <20241114152148.572447-1-lucas.demarchi@intel.com>
 <20241114152148.572447-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241114152148.572447-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:303:b4::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a05272-038f-46cb-4104-08dd04d2f5ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?66O29pFLSQL+L1O+Kb9UaLYPYPOCXyAa7QaLb+ee0b4Py7VTq58RGo4YwmMp?=
 =?us-ascii?Q?PVfxyDBCJTUGdSP74peE/GtAygqeorhF7o/tXKEeJFPOJODrFKal/7O9iY9B?=
 =?us-ascii?Q?ZOj6oZE8O0/0oGXKE/bQA5VZwAjHG7T707xU/BpIGadhyM6tsufLPrK6oQYe?=
 =?us-ascii?Q?Vw49hDkWrkgs7YbOegYSV0LO0UGvKsPBfvlRflZ6t1A3utPZpSta2jQuPjuf?=
 =?us-ascii?Q?UAoBR+Vra9meNWtCdDceMrnKHkTWK5tBS2KhKOl/7jqquA2HDjo06of/LAnO?=
 =?us-ascii?Q?dlCghhxCoTa57mZ6aoESV0wJY2nnHnMmbanRYD05zhmpBBWuvUdDcVPzcH8C?=
 =?us-ascii?Q?KGRoS3Akn3gGvFr49HEYlVnkmgDLELtgePA3dXZXRDjhqNKVxiAsic8viO1f?=
 =?us-ascii?Q?vWDOcwN7V3nU/fEhqPjcC91BC+Zwp80qtZNXcVOyHpRHFIwGY3gSc1qQ1U3L?=
 =?us-ascii?Q?4GQ53CnT0ceYDCVsGKUbUO96fSS8NhgrBRE8Em+hG9j4+CSDF0fR4pnkyTt2?=
 =?us-ascii?Q?zfcN6db2ZFt/di/ZUvcWk9JSFxoezqORlU5Jdj1Os3adgEAb1bhFNcORj7N8?=
 =?us-ascii?Q?YI4b0/BcHtZF/iexf4kz1sk4iWmTYckLCLSEC+jl+KSJDJrmiqikWafkWV7W?=
 =?us-ascii?Q?hcyyj3nf6bMNHOZnzWCyKTAANXQG5BOJ4k2h3BufnI+8ac4NXTxV8JIXYA7G?=
 =?us-ascii?Q?nJXlgZ/SulyeTuEct49bEiYlpX/8g/+rNbaqcjKv28/79IdVTaBxyA2s2Z36?=
 =?us-ascii?Q?WUTo9B8qBloa25L0Aw+dkyCr+bLdaNd35tZpE14t33L1naF2vN2GulxDAGwD?=
 =?us-ascii?Q?6kcynbCa66ykgeWCyrBKTD0jdtoPXV1hSmjz7CffnurszUST+DbBeOEpzghj?=
 =?us-ascii?Q?1OCTe/4kcCdQ3sf++6IBRIgGqdtVgmAviPaISH/xNGOJUljxV8PiQs0BTyKb?=
 =?us-ascii?Q?3O8CGYFOz65sLlI+JAQCwAF0MG4UPBjCiohYBMjg2FPwiicM9Kkq83X+6+3v?=
 =?us-ascii?Q?zhMjEuk6xTv+WZXG9cCghUs1OCGbzcdLw2DmeRjAFUCJlyyZkSedDuRkDWT6?=
 =?us-ascii?Q?LUqDjoDjO8RVfE/EawQKdLiQu3KLLh483xEZEMakHGVdIme0kOppxTwFCkSP?=
 =?us-ascii?Q?rhX4i74wE5XJSOXuld/qtLj+vWPfVDrqfLx5cHujpS1XJ2AiLPzmges0BHXB?=
 =?us-ascii?Q?oKDHbhjbE8Nt1o923oHv255iIdZtMfRQOPUi0iISilLwjsw5MoxP+6OG63/W?=
 =?us-ascii?Q?EKsRQzK5joxK91POtXzOYXfBybZvbiAEy90qTKkR8XNM2SVPTcpZBSwE2Z79?=
 =?us-ascii?Q?x0i3rMC7klMlLqoaKGpy9RJd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Kz3QVdTx5XO9zjUL38AKal+zY8UWoAvYWOcoZGug5jRAuUJAVgD7nmEwnir?=
 =?us-ascii?Q?3/u20k2JG+JcnMwxXqGkQvLD9csj4UDmadokd5XlY0kMCG64RBqt2StHR3Fp?=
 =?us-ascii?Q?k6kofLx/w7xM/lbvrpVpl//n95b6pczeg9aFl0yCB7F7PbLYBwy3c+CjDWHC?=
 =?us-ascii?Q?yNVS5UcV4lr27Ab/TlUPlk8lhXe2qW+0kRfgPQbWMFAbVjdKEuM6fZVke4/o?=
 =?us-ascii?Q?qczbTqCfGpEEW+4Dho3otlYWwrDuqKDUIZYkAsyarhfQe9c3+kqM6FOW3OlO?=
 =?us-ascii?Q?7gsC1bzjwkHhEVgOw3ABP/5paW7IJ9ZfMqLdY3SjAX9/rgVo1ibM1Gvg4UJ8?=
 =?us-ascii?Q?MnmXkBAIy8Z7l8qKt8hTWG8m/K1miMVGeq9fF7vZ3Ag/APifZKD45dZN4udW?=
 =?us-ascii?Q?My/Fu171WVdPShqi0t/C5EYK7vlwRqBIyBuRgbwZH//T+qsNDzwFmbljlWXJ?=
 =?us-ascii?Q?ffwjPDSm5hFUcLeLtks/HXf2pQehCkbmI8sRDRZ7ctWc5LcfZbFZSbuGhgHt?=
 =?us-ascii?Q?xgSWzeJ+j0mEQG2BXy+o1wVic7ztryfJ6k4vwoXCjh8YhOO6TGfvh76RofJE?=
 =?us-ascii?Q?/uyIcJPPe3CIrf977fY0ve7px8I7pSocDGSAX8J4jT79F6sFG5fAunswlyy7?=
 =?us-ascii?Q?vJrUEmP92LCzYvGZIO1HhJh1atAsw7iBwP6AwXkSHRRDsHZgrfPdZ4czvXog?=
 =?us-ascii?Q?CMndO/JlAdWo26s8xCbz+4y9RrGWhPhHZYV0izX3DaX3XXf21dMZf96mMWpk?=
 =?us-ascii?Q?i+wvGULUfz0/14AlnQwc/zmavrYKpV2eDR3ry5vVLibN5BBv3hxh2g94NZVi?=
 =?us-ascii?Q?kYlFl+55nRTVeRwcA62zRKnjaW9xk+wtiLNeqp6wfG1y6DkTxMkJY8KO4+wl?=
 =?us-ascii?Q?nlvkfrIfjT8qWpg7HqidJJ7zO0ysA69iBNR9Ro3+AThSi44iJ5s2LbB0tceA?=
 =?us-ascii?Q?7dJBBT0W4b4tci8zKoskTZ8tE10Qe4MFk6bEkFSldaaEMV2bkbIoj7yEOm5t?=
 =?us-ascii?Q?Z7bKLumUo7Ni+4ecCzL4aoSfzP35dHDlih5qdKBEwUppQnzWPuYBh6OV+Cgk?=
 =?us-ascii?Q?bdkUgIainaZMnVBZYbcSdvGAWYbKcJqHbQusccxhAoJYRLdkDWXuZtA9M5hQ?=
 =?us-ascii?Q?P/jyCUWjQLDaQ7Kj/EprZ/3dcawu1TSOVeU6sFYDH/9O350ZCdwEOptaKAGO?=
 =?us-ascii?Q?XE9AhfLh+FJroSv2scSM8Q0jheig/sbxQSxZRzFYfzVlA4SM1pdHdjqHFZ2x?=
 =?us-ascii?Q?DjhRmlLD/yIxRAonCYVFIg1U93EPK3EmL4N6jdl9GXJ3V1VjvRha9mwtfyIv?=
 =?us-ascii?Q?92zINI8YEemq+MbTHx/Brda6LeZDmYOr+VWaYw3s/F/mOVj60KzNNLxmqmmY?=
 =?us-ascii?Q?3Lh2m0K9l8Zwtl6Z+lpy8IFH3BrWHlZyo3JvQ/3I2Bi+65STreJ82NzVS1a/?=
 =?us-ascii?Q?rRRsdX2yVCerBOSZ9bxEpj2YKIonb8f7AnJfLT8vs9vMsMgHgefgJKO9wC/n?=
 =?us-ascii?Q?g3AWajWdY5p52v9DvC2duWEtqtOJ3Rx9iI9xxNB2860GBoCZHFzpfemyKgxy?=
 =?us-ascii?Q?wA402y6LegckIM2urOytxnPPHRcL8lf+GitL/AWirWi1rGIXk2+sZyz6Vt7F?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a05272-038f-46cb-4104-08dd04d2f5ac
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 17:37:06.9877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXRN4zolXXGx3OJ8AKKSqhPk/asOz/rSF3gAOENU+MNFPB/ou8IdrXqZ7RN3T0TY7o3e7/yho8y8VWMzWXPAbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
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

On Thu, Nov 14, 2024 at 07:21:45AM -0800, Lucas De Marchi wrote:
> Those flags are supposed to be kept sorted alphabetically. 

It is a good thing to keep a dream alive :)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Unfortunately
> it's a constant battle as new flags are added to the end or at random
> places. Sort it again.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index fffbb7d1c40b4..2c6a2040f0d82 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -300,10 +300,18 @@ struct xe_device {
>  		u8 is_dgfx:1;
>  		/** @info.has_asid: Has address space ID */
>  		u8 has_asid:1;
> +		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
> +		u8 has_atomic_enable_pte_bit:1;
> +		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
> +		u8 has_device_atomics_on_smem:1;
>  		/** @info.force_execlist: Forced execlist submission */
>  		u8 force_execlist:1;
>  		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
>  		u8 has_flat_ccs:1;
> +		/** @info.has_heci_cscfi: device has heci cscfi */
> +		u8 has_heci_cscfi:1;
> +		/** @info.has_heci_gscfi: device has heci gscfi */
> +		u8 has_heci_gscfi:1;
>  		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
>  		u8 has_llc:1;
>  		/** @info.has_mmio_ext: Device has extra MMIO address range */
> @@ -323,20 +331,12 @@ struct xe_device {
>  		 * state the firmware or bootloader left it in.
>  		 */
>  		u8 probe_display:1;
> +		/** @info.skip_guc_pc: Skip GuC based PM feature init */
> +		u8 skip_guc_pc:1;
>  		/** @info.skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
>  		u8 skip_mtcfg:1;
>  		/** @info.skip_pcode: skip access to PCODE uC */
>  		u8 skip_pcode:1;
> -		/** @info.has_heci_gscfi: device has heci gscfi */
> -		u8 has_heci_gscfi:1;
> -		/** @info.has_heci_cscfi: device has heci cscfi */
> -		u8 has_heci_cscfi:1;
> -		/** @info.skip_guc_pc: Skip GuC based PM feature init */
> -		u8 skip_guc_pc:1;
> -		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
> -		u8 has_atomic_enable_pte_bit:1;
> -		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
> -		u8 has_device_atomics_on_smem:1;
>  	} info;
>  
>  	/** @irq: device interrupt state */
> -- 
> 2.47.0
> 
