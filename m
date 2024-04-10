Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C101ECD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 15:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A067B10ECD6;
	Wed, 10 Apr 2024 15:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bq7OwqJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBEF10EAC4
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712763064; x=1744299064;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ojdAGKf3MwJA4+YXfhwIt6VSQ6/k0zsY1lBNaFqKQHU=;
 b=Bq7OwqJMxPw6ikzOCZJ+iaFPa39pPNiocBkVB9vMnf5LGgAdLKbYOxCQ
 9z+XQoHcDDq9teoqsC9HifSIO+Q84TlK436djbp52JMtpj2Xafx7NFetG
 Rq4uocxTl1X8olqH4zGPVxSPRzz452h9Fm9I4ekiTVspmwHvXfotn+wM0
 acfMgtVZY42dC3Cljz+YkF8OtAytitlj08hFaRHmpgUhR8OcIyIdfJPmk
 jBHuW/3M3A64455EdVyGaGX2QCXQnsy5JtHcfowcyeaOtZhOYqMj06nhL
 0ZoI3uhFMmef3GQtLXtKGqS3d0yafCxkJuXAzv6PhNnBKbFpOiRsukVMT Q==;
X-CSE-ConnectionGUID: S5HYimOZRSWR2VNtezKQuA==
X-CSE-MsgGUID: 79X1RmApSrGOsHJVJQuVqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8238215"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8238215"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:31:04 -0700
X-CSE-ConnectionGUID: j+I1ED6lSnWwgMQzD/jPHg==
X-CSE-MsgGUID: gGmTTJS2QTuq285taSVk+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25369545"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 08:31:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 08:31:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 08:31:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 08:31:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 08:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkBpxlMgB3cLqb0UKSfdDpfrdoi+wqXmPCW33WRLqNN3yarGRaTSgYlDfEH2ZjoSgWElwEvcolEOtPuy81ZcqQBE2Nq0LTHZh1w3+LKHCF+X1sNYvUtWIKw+IvsBy6Qc1qOaNnpYy/xxEMGzdafrYmAK2emgeY4jKPwJVP7pskzwmCt4XnjKQkKAUK22b1AvKE0e0igTlOGZDyQ/Jhf730y+Blhwk/2+rQIxUgl/YSP6bz+gv4zrkiIb/RuttymsgwByzJlJ2X0s9FW7y762TCk9EnQt+2PtOSp3HxvYb3bX7XsUVs4wAHVpq2BqInN/EzaOIBGPaLMTKLS/Y3w+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wv7ktOqgvTDEYhPnEr9d3On9EdrNIupWbjhM1PM5DBw=;
 b=LwzVCPCuJNocHraxbCI2X4AWMvtdtXh7KABOZf9K1hvmq4jYOctOhTR513GzkbcNzfrEXN3v620IJt4IJlZAClT9Lwe1YvTGCWIwbM7DGpLiSEYRhkz7DHek+qvmTmgQKWKGNqS095EZYDeyQEmmMpm+Bbfx2UrEGNOIMrnzuJFMyRW8VCs/6SYzvyYfNTslBZlIU4b3GI4TGA6bIql6ztgVO0LIcc69kFcuGCu2ys20hoMue2mFoLfkdYkSEBSDehLR6hDdMfiZKAg/7aCOjgxtoZXzdCOBDC3Wo8QuyVpbEOxMj77sJ74+OU8d7QtQRgq7XvHH2Oqk0Uiwlmhy5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM3PR11MB8757.namprd11.prod.outlook.com (2603:10b6:8:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 10 Apr
 2024 15:31:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 15:31:00 +0000
Date: Wed, 10 Apr 2024 17:30:57 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/guc: Add helpers for GuC KLVs
Message-ID: <20240410153057.gevtuk53n6vifc3f@intel.com>
References: <20240410123125.1155-1-michal.wajdeczko@intel.com>
 <20240410123125.1155-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410123125.1155-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0002.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::9)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM3PR11MB8757:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z5FfG8Grp/ehL8rnPWZD74aZQ/jX0ezGS7eEMRQ/K3xH7eVLZkXmAjpiNurBGZUnMcM4jUXWFkZktqatl2/TTHGL7xhRxLT8UbeMe6Kjy/l9dXvDOknvj/fjE/Nk7OPu6syFhbQdjsyXo3o5h3niMsC2qemH06FPr2m0DMZYfZz1CJS3BoVI+KUQgs+7hq17CNYgZvXwZuZJK3uJINdo01Z+hxIhCVU7soHCTULhIfD83RWpSkAPnPvfeuY3suRI7nuNe82Wa5HPiHCMAijQvZU0gnqVgQ0HT8kLnx+2xGqvx7pkK4fQBsYCic1cwvJdF7TLq2mrtaXgmL/0xHx/m+TIDG22BnJPL5bk3iBptJNkafskGYs4kUu29b3SQIlW59leN5HevNj2LYyNHz+JXe8F3y/inhGKBG1ohGfKm3yJq8mYwtF42mZyKTtg46hjVJo9YMLgiw8cLCok6CtVeqadBBIApR//XmiLP4dVU3k7I7CTNHvZzWGHT3l1z9AqCZ8QUuQuFEuMfbomF4+96e4N6j+xaj87SscOvIh+livEtgj1Ub5SC/HcLx+nqgoraN46ingYeWLqq7TLSdnLqbxMXLPEoTr1CLN2Yng97lwMzDeMQceTTy0i2wdmpOA4Pq4qqYZWIPnxznH+jEAymnFXieOs30REeFOEu7EUQFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGRndW5vbkZrNXg5clNlaVpsZEZmRmFkclFCMVNRNXFIVkpzVk1pZitROS9X?=
 =?utf-8?B?d1pZWHVia0ZBZ1BlWVhMMGhyUWRCWWUyelUrZkVGbzNYQzJMMU0yTndyakRJ?=
 =?utf-8?B?K1gyMGN5VGpwMWlLNk1uRkpDR1QzbnpiUDNrR2hCd29xdUw1OXd0Vk5CcEdT?=
 =?utf-8?B?aFZWb0JnYXlrNWlBSllXTTJLNjQwZVowNnYrWmlFWERWMGpuZEQ5aVh2YUtK?=
 =?utf-8?B?U2t0M1drT3ppQSsrZW9ReGcxZldJL0dtMmd4OWJLK1krc1Q5em15VkFsMzZ4?=
 =?utf-8?B?Znh2ZkNYY3F5TC9ZS1FuWWxZbG9Wd0NsVHlRQ20wUkZham5qVVZvc1ZPUnBP?=
 =?utf-8?B?QkdGcVRQTTlnbXBUc2N1WVR0STVsMklxcTVTU1VOVENUWFJESGdFYTBBakpB?=
 =?utf-8?B?Q0phY0NuYXpLeTZJbVZaSkxxSGExWmptTTltWEp3UjJjY0w1Y0VoTWRScHF2?=
 =?utf-8?B?UXEzNmRndmpGS1plYm52MkZGeWl0ZWN3amRXclNMZUd6Ukl1S3dmbVJxRk9B?=
 =?utf-8?B?TXpqLzhYSDRNRlhZT0tnaTlIOS9qUEg0emt0bUpXSWZWYXFZM2s1V0d2VUYr?=
 =?utf-8?B?VFRSWlB1SXljcjV0R2x4VGRRYnBLUUh2cnIxZnBRNERRWTZFNUtaTjZSeHdj?=
 =?utf-8?B?RGdrajdNZHhKTVB4eXlSamZ0ZDI0OENkTUlZY0Z6UUdqSWxBanlhU1hCaUlu?=
 =?utf-8?B?SWJFMjJwMlo3cmJQelBxdGlKMVliQnc5ZUFra3NSc2ZwSHhYQkdsaGNGTUgw?=
 =?utf-8?B?Q0pNWm1aVUZadUs1QmFjdmFvZ21xUWt2eWFSWTRYOWFrNWpaSEUzUWVEVlFq?=
 =?utf-8?B?MC8rb1lwK1JoZEFQaW44SkNKRjBJVVArVnk5S1QvWmNMUGJvbk95eHhYSTVQ?=
 =?utf-8?B?YWNMdGt1WHVuNStjOGRSeTJuOVMxdmVHYWFOUUtrVkFqZmhMaW1zUWJkNlVF?=
 =?utf-8?B?Z0lDL0kwd0plQzlEVXdvcGVBSXA2eW92RFhGYWk3YTgwTnVBVG9ZbS9DaXR1?=
 =?utf-8?B?MUx4S0d1eEg2UENiTUFrVzNlc3YrU2Fma2FhV2o3Z3lFSHNkMWVLYUFQM1VL?=
 =?utf-8?B?NGRhazdvK2UrcWpNdzJiK3MwYXdxV2ZrVFFlZGsyN2pQWkxmQXdGbFpEMTFw?=
 =?utf-8?B?TWlYb28yY0FON1kzK2FrbzQ5UDU5ZGdjMyt5UlpEZVpOWjNOdXdqbkVHOUpE?=
 =?utf-8?B?SVhhMGkxWmQ4OUQzSmRXSW9YWEpiT3NvOENRcCtpYzVwcmlxUzRjT0FQTnhP?=
 =?utf-8?B?dnhCM2U3WjU0MzNjeTRxa0hmTk1adUxSRHBBcjBxUTRJMlQxOXNZR053UkFw?=
 =?utf-8?B?eEtwVjJGd0orbXY1T1NQajZPVEJ6Sk5aZmxERWJBUHBiQ3RGaERoY1pPUDgx?=
 =?utf-8?B?WHFpUkhwZDh3TVVjeTdHMC9DeWF3RlgrYlgvUkduVlNHM0xvNE9aamVmUnZ5?=
 =?utf-8?B?cGRwMGFRYkdSb1B2TFFHSGJRSmhJTFh2aUdKMXR2enlnTi9BaHhSRVpGbmpN?=
 =?utf-8?B?ZmVIV2tvZU9DZEFaNDZ4dURXUVhCN3NmODFpZUpGRmtrUEliMS9jTXQxbFhz?=
 =?utf-8?B?NTVYNnBGcFl4NlR3V0dxWWVORmRUTUpNS25UYnhSVUl0bjdKTlN0RnppT2FF?=
 =?utf-8?B?d1ZVVlBTM1FoYjZUUXNlNVFzN3E4TEdNdlhNVFdjT29oRWtwdzNYWEo5NmZT?=
 =?utf-8?B?ZG1PSmtWSVQ5aTRpV05sU1dwYXBPSXg0Nk1henQyTUpTTk9ZZ28zU3M2eDVz?=
 =?utf-8?B?VjJlbFFSdlRlNUtmRkF2cUMxU1VHaVAxRm1wZnBiRUlQZ2RTTXpMU0xvY2Er?=
 =?utf-8?B?djZ4a1RxNnorN0d2UkNsRWpNNktyOE56VFdQNU0yeTdiZVJrdmZQb2U0bjh1?=
 =?utf-8?B?VjZSV2cwT0Fvc3pyN0dyeE15U2VmZlZSWjlTd1Y4MXVmYWoyaUV5b0tTcTBu?=
 =?utf-8?B?dHhKNXpIL3pkNUNaVWhTb0w1aU45aktqYUN6OTJFckFQTEFPZlNhVC9UK2VD?=
 =?utf-8?B?R1lkcjJrZ3JLQVJsc0hzK1lPc3lTdVRBSXdYNjlldjJMcXNPUFJoWTlOOFRr?=
 =?utf-8?B?MnZSVHdZQ09IQ1g2KzF1cERyd3dOK0p5Ukt1eXpmTEhKQ0VzWVNzZlhoRFdG?=
 =?utf-8?B?TFJNZkQrK3J2bkhlbkZrWDNBRDl1bzVJYnlyR3dQazI0WXd2U05XNThtcTdI?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc3e21c-d2dc-4e60-3353-08dc59733972
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 15:31:00.0944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTf6mhSu67LQJxyRtq/6zg3qnik6BWrpHF/C5HNOk7yjateMauYZflY6PT7BqJHTyQyKVgjtgmpcIyFBPGfM04Hcco9BfSoY7rFk2uUCLks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8757
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-kwi-10 14:31:24 +0200]:
> Many of the GuC actions use KLVs to pass additional parameters or
> configuration data. Add few helper functions for better reporting
> any information related to KLVs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> v2: review comments from Himal
> ---
>  drivers/gpu/drm/xe/Makefile             |   1 +
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 134 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  51 +++++++++
>  3 files changed, 186 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8d79df05b84f..ad238f48cf51 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>  	xe_guc_debugfs.o \
>  	xe_guc_hwconfig.o \
>  	xe_guc_id_mgr.o \
> +	xe_guc_klv_helpers.o \
>  	xe_guc_log.o \
>  	xe_guc_pc.o \
>  	xe_guc_submit.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> new file mode 100644
> index 000000000000..8927374f55ff
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_klvs_abi.h"
> +#include "xe_guc_klv_helpers.h"
> +
> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> +

This is the second such macro in Xe - maybe it would be worth moving
it to a common header somewhere ?


> +/**
> + * xe_guc_klv_key_to_string - Convert KLV key into friendly name.
> + * @key: the `GuC KLV`_ key
> + *
> + * Return: name of the KLV key.
> + */
> +const char *xe_guc_klv_key_to_string(u16 key)
> +{
> +	switch (key) {
> +	/* VGT POLICY keys */
> +	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
> +		return "sched_if_idle";
> +	case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
> +		return "sample_period";
> +	case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
> +		return "reset_engine";
> +	/* VF CFG keys */
> +	case GUC_KLV_VF_CFG_GGTT_START_KEY:
> +		return "ggtt_start";
> +	case GUC_KLV_VF_CFG_GGTT_SIZE_KEY:
> +		return "ggtt_size";
> +	case GUC_KLV_VF_CFG_LMEM_SIZE_KEY:
> +		return "lmem_size";
> +	case GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY:
> +		return "num_contexts";
> +	case GUC_KLV_VF_CFG_TILE_MASK_KEY:
> +		return "tile_mask";
> +	case GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY:
> +		return "num_doorbells";
> +	case GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY:
> +		return "exec_quantum";
> +	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
> +		return "preempt_timeout";
> +	case GUC_KLV_VF_CFG_BEGIN_DOORBELL_ID_KEY:
> +		return "begin_db_id";
> +	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
> +		return "begin_ctx_id";
> +	default:
> +		return "(unknown)";
> +	}
> +}
> +
> +/**
> + * xe_guc_klv_print - Print content of the buffer with `GuC KLV`_.
> + * @klvs: the buffer with KLVs
> + * @num_dwords: number of dwords (u32) available in the buffer
> + * @p: the &drm_printer
> + *
> + * The buffer may contain more than one KLV.
> + */
> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p)
> +{
> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> +		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);

u16 is probably sufficient in this case,
especially since you use u16 in xe_guc_klv_key_to_string() also for the
same key.
> +
> +		klvs += GUC_KLV_LEN_MIN;
> +		num_dwords -= GUC_KLV_LEN_MIN;
> +
> +		if (num_dwords < len) {
> +			drm_printf(p, "{ key %#06x : truncated %zu of %zu bytes %*ph } # %s\n",
> +				   key, num_dwords * sizeof(u32), len * sizeof(u32),
> +				   (int)(num_dwords * sizeof(u32)), klvs,
> +				   xe_guc_klv_key_to_string(key));
> +			return;
> +		}
> +
> +		switch (len) {
> +		case 0:
> +			drm_printf(p, "{ key %#06x : no value } # %s\n",
> +				   key, xe_guc_klv_key_to_string(key));
> +			break;
> +		case 1:
> +			drm_printf(p, "{ key %#06x : 32b value %u } # %s\n",
> +				   key, klvs[0], xe_guc_klv_key_to_string(key));
> +			break;
> +		case 2:
> +			drm_printf(p, "{ key %#06x : 64b value %#llx } # %s\n",
> +				   key, make_u64(klvs[1], klvs[0]),
> +				   xe_guc_klv_key_to_string(key));
> +			break;
> +		default:
> +			drm_printf(p, "{ key %#06x : %zu bytes %*ph } # %s\n",
> +				   key, len * sizeof(u32), (int)(len * sizeof(u32)),
> +				   klvs, xe_guc_klv_key_to_string(key));
> +			break;
> +		}
> +
> +		klvs += len;
> +		num_dwords -= len;
> +	}
> +
> +	/* we don't expect any leftovers, fix if KLV header is ever changed */
> +	BUILD_BUG_ON(GUC_KLV_LEN_MIN > 1);
> +}
> +
> +/**
> + * xe_guc_klv_count - Count KLVs present in the buffer.
> + * @klvs: the buffer with KLVs
> + * @num_dwords: number of dwords (u32) in the buffer
> + *
> + * Return: number of recognized KLVs or
> + *          a negative error code if KLV buffer is truncated.

ident too large by one space - I do not know if it is not allowed, but it catches my eye :)

> + */
> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
> +{
> +	int num_klvs = 0;
> +
> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> +
> +		if (num_dwords < len + GUC_KLV_LEN_MIN)
> +			break;
> +
> +		klvs += GUC_KLV_LEN_MIN + len;
> +		num_dwords -= GUC_KLV_LEN_MIN + len;
> +		num_klvs++;
> +	}
> +
> +	return num_dwords ? -ENODATA : num_klvs;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> new file mode 100644
> index 000000000000..b835e0ebe6db
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_KLV_HELPERS_H_
> +#define _XE_GUC_KLV_HELPERS_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_printer;
> +
> +const char *xe_guc_klv_key_to_string(u16 key);
> +
> +void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p);
> +int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
> +
> +/**
> + * PREP_GUC_KLV - Prepare KLV header value based on provided key and len.
> + * @key: KLV key
> + * @len: KLV length
> + *
> + * Return: value of the KLV header (u32).
> + */
> +#define PREP_GUC_KLV(key, len) \
> +	(FIELD_PREP(GUC_KLV_0_KEY, (key)) | \
> +	 FIELD_PREP(GUC_KLV_0_LEN, (len)))
> +
> +/**
> + * PREP_GUC_KLV_CONST - Prepare KLV header value based on const key and len.
> + * @key: const KLV key
> + * @len: const KLV length
> + *
> + * Return: value of the KLV header (u32).
> + */
> +#define PREP_GUC_KLV_CONST(key, len) \
> +	(FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
> +	 FIELD_PREP_CONST(GUC_KLV_0_LEN, (len)))
> +
> +/**
> + * PREP_GUC_KLV_TAG - Prepare KLV header value based on unique KLV definition tag.
> + * @TAG: unique tag of the KLV definition
> + *
> + * Combine separate KEY and LEN definitions of the KLV identified by the TAG.
> + *
> + * Return: value of the KLV header (u32).
> + */
> +#define PREP_GUC_KLV_TAG(TAG) \
> +	PREP_GUC_KLV_CONST(GUC_KLV_##TAG##_KEY, GUC_KLV_##TAG##_LEN)
> +
> +#endif

Only minor comments, besides LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
