Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140CFCD4853
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 17:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE54810E4F1;
	Wed,  4 Sep 2024 17:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3VfXLZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6B110E4F1
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 17:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725469327; x=1757005327;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OBRwfKFWnKsIHuMaBKvri+pExWNYP/YOuS6pNJmDd7M=;
 b=h3VfXLZsDrUt3arcmsRLHIqCgP7sa8jraI5o5B4tXUHLJ5gZj58xd4B3
 ZhL9m7QLMahetPvHchEpoKwXdkRy219l8qQwaszhFHRGKYx9gozfQrdqf
 KV/c/i+MXZEk3Km9ds6R0Zt7jABSTcLI4xf35d2RqRNSNXB0oCIdhj3fF
 1gIGm1kCr43HnSFJ37R0Q9l8+RdPrsvsHoSOmLFKOjfa/Fxw+gsxrCa5j
 mkhoKi9ElWxrIkTLS9JGKhbY34PM2zuhpF0MpJqB+C0admZIILB2uyii4
 fMcte29BjurMChnxLKnjc/7Ke3D6ZHELzunx1fDYLluBSgZIaaJxUIa50 Q==;
X-CSE-ConnectionGUID: 6FB1t21QQpCnIKGSQfPvMA==
X-CSE-MsgGUID: +8jLDBZpTRGRRwyoGsalGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24258606"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24258606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:02:03 -0700
X-CSE-ConnectionGUID: MHaDlQ3YRqejs5KrANLEGQ==
X-CSE-MsgGUID: dgmg+Df3STCK6djm8tHNdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="96136564"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 10:02:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:02:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 10:02:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 10:01:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6d6nDVAGdbXdCqAWzcmWxBc06IxLejeAdingC1EU/oSmQbKxnPzpx/JiXt3YgdndAh7gs4ZAryLv+GTwm73bkAk7InQPIgHcgEOlbzaMCnPxXsh4ahJ2cpaRfJ7KRGJ0/dW9NxAX4oPQeBJjlMQflRfvrO1NSD7t/eRMjACZ3O2Zwo+AIExbji4wZGDUfHWhPSAG6lh8RBJKlnsd5AcLPJLtZFaE2BdPJj37DoK2QGWJxsG98VeerxdoAn0ifmWtPNeNHg8OIq8/j+lDKzDixZgo/hyhmAwPfNcHmp8XALjmkzWVgr5D8HJ5U9qv3vkpoFa28Ht/aAtugcbcpoEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B93YqPOuVoEhqfRUDTtw47ixZG/+ntf6+Q7VFUF/sMo=;
 b=Qt8mEdJ+WsYO1IiTlF1sWH93DCRZmjkMvaH0N1o3xp6r9fpLDL//grUzDFfZh3muOvEwtcC2RdS0zCtrWrikrZXdYjSX6AoME/3dEtisg7meF/COtVmBLXBfReT4BxlS9lOkX6AM30KQWwi/JsKtUjRN8ERo7ryVnbbu1UgSh+isuxZmk5tQmvP/+r3DK/rI3B0J+fF2NjsJpaeBZEPVGYhJZPhK0KHZTYBh20pE9ap4epPz8y35FnDIUhFmkqxDbEzs7D14bObozJiVfHaTpknj8t//T3KWgmaX3MYKlt1jnqUeWk/Z4GuHZShHErApYptFq7JCUErpgoRKSqZK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 17:01:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 17:01:43 +0000
Date: Wed, 4 Sep 2024 10:01:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Cleanup has_flat_ccs handling
Message-ID: <20240904170139.GR5774@mdroper-desk1.amr.corp.intel.com>
References: <20240904162238.2831202-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240904162238.2831202-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:a03:167::47) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN6PR11MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: f25a8e4a-0a37-4189-dc23-08dccd034077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NdW2dOT+J0+BY1uJ50H1LQFaDQ2xlKTnaoKtOcbUDNT1cifNBWOEyEM2dqdT?=
 =?us-ascii?Q?ceeslXxphnkJfJxjOzGUPhtTSpoGDcyc9gaDlsKbR27/0H8T6Q9s1KeU63gf?=
 =?us-ascii?Q?bMFukxJMQOFilgm7kB1KyrsWjff8e/kv0zBxJQDRYtTG5nI5IrhlM1Jwnu9B?=
 =?us-ascii?Q?bHXf85ViDTRB6plmFkEFnc2/58QNIotVdkpekXB0h/iQPX+4p2iP602B714L?=
 =?us-ascii?Q?3eDtCZsctIh2sztpxKHvc+YvcAPStM3+BtoJjIeIpG/dJQ/HXs60qhy5Sn6a?=
 =?us-ascii?Q?hzIYvcwec6SR4GmU2cYGJi+qV6ksfvcpMrYzSuFODNDw3vGhPGBb6VrGTVgw?=
 =?us-ascii?Q?0TtQw1koI0nd4J2pXzEjrX3VfqfP/gJcLB+H0nJNF+gxPfg07SbT9BNXti+/?=
 =?us-ascii?Q?hfLJzG/fnS9OBfaf9bA0N2O3vaUu41sUkDvV40O3j+egrD47hZOvfs0L6HTh?=
 =?us-ascii?Q?nzwx29CmyiN69nu6g42QUeOsNn520/29hOKMCruQmnXxRtiM7gG4Si45rS5Y?=
 =?us-ascii?Q?lSl3CWvGgHV2pdaVoeCclC5ei9rGgK4vRmsIRDCgSm+L8mhQHqz8hJ6OcSIn?=
 =?us-ascii?Q?GsbwtTiKjclKAeRMH7yYSv8Sud07HT6NJe/PtGljohcs7cnq+ZQe3WVYJAB6?=
 =?us-ascii?Q?9TK3y1M3+JlCZpBsoIhROftkkNPY4NSYOLXaf71hno/x/xMWNVND6S6KE6Fd?=
 =?us-ascii?Q?hQMW8AkhAPQNn/veTbYUjd3SdddhMZ36M3UzOEATBdiGGbvzu66EhqdcDsZx?=
 =?us-ascii?Q?p/jZBAAHLayYG8M1FQAKiZ3hVmgJu8ZQrhSxjC1vrlss4MuzhMf+sc4lrGZD?=
 =?us-ascii?Q?AYStST3qaHvCYclJMfrS4CDJQTZn7IHKYgEwwLklX1Ar0PhtfeVvpeS+BYXA?=
 =?us-ascii?Q?31OxmrKmMe++Q7Bvx+TV1t6v1VyFnFVgV+XyqyKhcZG6qHY/7z/DV9o+KFev?=
 =?us-ascii?Q?Qn5Sf2CbCeJOdlztC2Gjoos0WTEAsnvy9kh3S+dgrmFPXzIpNeHxM+2p40eI?=
 =?us-ascii?Q?F42OcmzipksZrhsIcqvfEeYXN+SEB2m3vSEC3sZ43K8KLtYyaN0q4N8ep9pz?=
 =?us-ascii?Q?YItDguisyza7O/fygvSf10C+3j/VAJxXCj+jlmdh5rkkSb3dlKxTS19lXp0W?=
 =?us-ascii?Q?ggHPuGqY8BemLBfxs29Nr3FtnMBa/ftyPg79Q544uVWl18XXw6zjopl95FZu?=
 =?us-ascii?Q?RrOji6Ta5b+JYT+sIe06Ef9LHywXATFZLeTnbaYbUNV/HZJY4INqrlb9y/eG?=
 =?us-ascii?Q?PlmKJYz3Xlc6QNhv/5nSA8qDBem05LfBhhUU0xCBqUvLcFYB6oOT1Dsv3TCp?=
 =?us-ascii?Q?5gVNkNhAWtmd/aej+EHQJBAxHlK0mZsaE2AmZ9s5jDkJFA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tps3ur07RIUas8MmWJ8xvW9zDz5tqq5QWu5i8R40PSF97bMJ2m5+Cr5JLrdJ?=
 =?us-ascii?Q?JNkzZkMGh/v4gxVFk1yxzZV1laZIrPLOTHbO6xXreVMQjXwSJz3eS8XeBXkz?=
 =?us-ascii?Q?Je2HUdtYPGgtEsPF+KBdPtzmNaDvdthYGoBkjDNa9pS4IylOCbJnANoLVX/M?=
 =?us-ascii?Q?+cnrPU3MQ59pdAzkh1uutR77M6Gi9MS6cUHLQZUcY3Uewbn/Q0CQZuFRSRXQ?=
 =?us-ascii?Q?4C4+/Fjw/XUjnQM2Uf1IvYD6vyX4MdN6sj1R/GYfNWKxvlCY2NGNpgAr2doF?=
 =?us-ascii?Q?DPk/CsIUiGNIzKNxVYF/FVUO2vKIW2UnrgOP+0FhIvk3/K+O8QG4xxRL52Kx?=
 =?us-ascii?Q?yDUk2ZiXiG17i+MdW2Z8ANG9DrP2OGQfxQK8ThnitF/YSna30eGRsdWF8gSQ?=
 =?us-ascii?Q?iU9e0CwjUQC4N5wdh767SF23udXhQ1UwWbrUTKjDVe6v1rwltlZaqJ2dVDuX?=
 =?us-ascii?Q?JlyxuQ3Lijq3O8dU/5kWFIpaX4Iqyf93z2gm2zyib3AuSkwIx3nIhRNCd/jn?=
 =?us-ascii?Q?fy21E+kqcpjbC0eCTNgMAx1vZm9PwwctschLQJRn0sNyoAYes2rPZ4c372yx?=
 =?us-ascii?Q?9SceYd+QooWi/lkzq0Ld0r0jousQI+qgIRJcXQr/UpbFrwlZVY4rc8wYPJuS?=
 =?us-ascii?Q?JNaAv57u5WmMWjcDrnKEAzgvuHmHGG7+64n6mQJ5uo3jY4yhCll1tQhVkjgX?=
 =?us-ascii?Q?Qw51Aywe0Rmuhez657SAZx64iPULnk2um5e1xW7g3nBDgTAmBTJDUxwI+0Bn?=
 =?us-ascii?Q?6J0hLCR0HAaneSOmuC0/+QpPum8JWNl/yCJqWFolU2HRbnsr8e4BwIzdYXqb?=
 =?us-ascii?Q?p9rQT8u79neoz2u5qe8IGmvhSz3bELjVUrL/5+ZFaVP3KETwbn2Ezsx0or0Z?=
 =?us-ascii?Q?0K/Bld2yBBRhzhCHSoIrUBLxdjtmTNQiep6WgpKKoyblMvPieyQbQUrmqJzp?=
 =?us-ascii?Q?l/mRnxR9MvR9sdaNtTnF/t85/bvJ+sMzTXh/ljjMcnBmUSozVTjQsnOitUCF?=
 =?us-ascii?Q?rtrCnpumUmL0uTx4PdMxYTwKQvpBW2dcCeF/VZxpV9TxVBCwoHhIw3Jq50mn?=
 =?us-ascii?Q?fDYyuizGOOnBJjHKjyVu77N7hJ23w0p2ldtWLxnSmcomk3pZupLugAC+S2K8?=
 =?us-ascii?Q?gD86vUgoSFvVSetJeQ/TiOB5p4WD5jywHazXnAkCuOg3uGCSPbD1qudmCyXm?=
 =?us-ascii?Q?1rPICZjbT8DGJZd6rl894VsKkvYAPDcAyzVfpYktMUXP7+GiXCFn5CT6DfCV?=
 =?us-ascii?Q?Azs7Xf3ZHPHhqnoI5mW/3GIyTDlAnkADBVZjKISZPGthOSPHBDCCCECReHjc?=
 =?us-ascii?Q?ZxsU+52bnKjBDL/BbizJZ8EK/vxaogOiBqq1Zmy/jhMGqlxCFkHwHXrtWoS+?=
 =?us-ascii?Q?iYUTR+14GPLsZrDFn0fA2h3pW8tKouLJtSqpF4V8Ou8CRXNtG5myqPkDxR0w?=
 =?us-ascii?Q?uZv8bHCg8EXO4yoT0uT5JfDdUGTGmJXeUZKYLRIslz0bvdpulq6jmnzjc2lz?=
 =?us-ascii?Q?Tk1fNFK2YExHW3YoTfvM+5srERcjfIk2xpv+KaJvd6u4g+NgcHLPijlNQzOr?=
 =?us-ascii?Q?TU72e1T386kB62DZAOr2xm/HbGz19ve/7gf+KswxaJTuKo9gLIUuM/TLQZuC?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f25a8e4a-0a37-4189-dc23-08dccd034077
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 17:01:43.1596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFPhoIytv3V952lnk7iCWL6vxXl5Lo53jPOfIlsKuR4Wd+M9wF5ENWUXZH7xEsWICPsJwrDGJwcdSbfnd7KctrONoiNDq1Y5rg5dL4rL7Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
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

On Wed, Sep 04, 2024 at 09:22:37AM -0700, Lucas De Marchi wrote:
> The flag is set in XE_HP_FEATURES, but then overridden in all but one
> xe_graphics_desc. Make it set only where needed.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7eb00a87b786..8642c079bc65 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -103,7 +103,6 @@ static const struct xe_graphics_desc graphics_xelpp = {
>  
>  #define XE_HP_FEATURES \
>  	.has_range_tlb_invalidation = true, \
> -	.has_flat_ccs = true, \
>  	.dma_mask_size = 46, \
>  	.va_bits = 48, \
>  	.vm_max_level = 3
> @@ -120,6 +119,8 @@ static const struct xe_graphics_desc graphics_xehpg = {
>  
>  	XE_HP_FEATURES,
>  	.vram_flags = XE_VRAM_FLAGS_NEED64K,
> +
> +	.has_flat_ccs = 1,
>  };
>  
>  static const struct xe_graphics_desc graphics_xehpc = {
> @@ -145,7 +146,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  
>  	.has_asid = 1,
>  	.has_atomic_enable_pte_bit = 1,
> -	.has_flat_ccs = 0,
>  	.has_usm = 1,
>  };
>  
> @@ -156,7 +156,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  		BIT(XE_HW_ENGINE_CCS0),
>  
>  	XE_HP_FEATURES,
> -	.has_flat_ccs = 0,
>  };
>  
>  #define XE2_GFX_FEATURES \
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
