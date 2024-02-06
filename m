Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738C9C48286
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 09:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FD310E8C6;
	Tue,  6 Feb 2024 09:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhMiYf6o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB4610FE53
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707211073; x=1738747073;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Ma8MvN/5MIGW6OVjtBKp2rO75XrqIVMtCTd0QvO8ag=;
 b=PhMiYf6oTXLfBnYQdW1N6kGsrh6+hsglMnAx0KfmN23/XAZAy+qr6fIs
 xo5nfJPHhJJBmPUnFKK5AtMVg+2grg0SZJfwy/6KVpqPSnkPyq+ElIlYv
 sfG6QwzYyL1i+TF8ZXn9N0T8d0P5cHEIXVv4/K2zhb1D0rkUe/fYtE9B0
 uvOTtiUDi3aB1CqDodJHEJrHhcpOUbn+0jpC2HBPqU/YxlhRQdi2yXCL6
 G6yD6NMYew8i70FPUHN1u8d190pPtd63xxvZZZOdGp1SfcB95trlcrsj8
 lhhXb8SHzohntv2/XY463vZyen+ydgOCYesy2fAwR72PEs+oxF3T1BiXY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="602013"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="602013"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 01:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="32031275"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 01:17:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 01:17:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 01:17:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 01:17:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBO3/BLaDO/nD/1OXBtTc+m/njdEmTj9I1bxTroknO0RrOQK4eCiD96TeiWEMI4GPZoVPJAVe+moolFdMMgLqgPU0IvQwA83NYmF8j4chcqo+vg1Mp6ICXxZMSo5QFL0NIqUx0E8P9SaKWTDvu5BlVdWG4tS8pqlrNs/o2Go3ohACcfSM6FtWBqU4aIYlsq7mu1q0QUkT7t71xpj7hTYEJncegpAq7N367sFWi+6Slf4RIk0P8J3i5WN8CNmlQVEbA1sSHt7EDrsgMyPXGdOmEWJrMyIWQK5GLk8TbWZKFyddtLDHPWkounw/Iqqx1rSHDLUnZikN/fvvsKwtSw4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdVNdBcppJ2NhBT5pXb05Zf+IvgliKTsSYE4+GAG7k8=;
 b=hCFV81gpgP+PuYVyn7qXUmKKk6DmY1jqtw9RLw9t9UKOdzyj9o4q8MTR9fgPhqeLR6B1naieLm5i3E1r6oLK5Zc0WchSwm2j35Mskxe2fxCWfsfiLAb/r2j1roSTobU56oDtE2LSIaT7Sr833A5qZ2YWmQG4HN/aem+B4JQ7DbL0bQhR4CnHMpRfL7dvlHIHvtbnZk3GMEuQODkXc3QWtHTY1d0DlWmGJ0adqre4TXcwrUs4vxzx/POBMwnwZ0B8uFzEMzM0G47AyUVA+9mUYoW32L0TwOxsZlZqGNahCh+ZzWPyxKD0+B6gsUvZ6uOAo4/vtJK1HQXjqzxpHQRIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 09:17:39 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 09:17:38 +0000
Message-ID: <f4316a0e-2d9f-4ed0-95ed-e87aa74ea707@intel.com>
Date: Tue, 6 Feb 2024 14:47:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Refactor xe hwmon
Content-Language: en-US
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>
References: <20240201180600.434822-1-karthik.poosa@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240201180600.434822-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acd24b7-d705-4948-8f97-08dc26f47685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAMP1LqwmJ4KjIk099sd0DEH6V5O92BfwfGBHHWfIDahYmxxiApRe9bKHDR2bO1jk0pHL1vEnQlkmqge3RUE9mAsZiKn8ITkX58cIJTbgPDunMUDPLDO6FG3L79gX5hDXESlPslA00R2J4MLS3Ps03hriic4tiBE7ix+Kq43+a/8c/Ecz1o6J7OlFuGtqaNCbv/tat4LDHVZrKK4psEFPAtJg+BgXSoABeu9OeZd1Cxaam0P0lFY+u2bAww1HKTRcw4dwy/QVjIXIR4CZXUyJ5js4N+0uitV2vxJnOrlV4qY62mDm8eGI+IajZksFM4K5WOK8aHwIu4pn3poEXIghfTGcn/DwdV+w7xE6rvXyMwCHI3O8NFthGnX/MR9UHyveZxLA/lKk1RMooKQSlOXw14DIHzsgHG9TqtljQz6YkmzRS89dt6vwHcBIC7K3/Y//p8ICPtK+YBN17T045ualF5x7OnbR4hCZQ8dZVy9hNRlw8dGJjNqc2kRl4wQYAt/LOR6nAfA5o64rOpKgfLqbDIszFege/HqBixjZrUxRJ1U3tXG5y3Q6k7rqZATsdH6aypKE+FCspcW0wyvOwKfjLYom5sXICu2F9elGRlgDSTLN/KjWmeecnJ+rOViXXxLYmRlomzgnPwZqumJSGHskA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(31686004)(2906002)(83380400001)(38100700002)(82960400001)(41300700001)(26005)(66556008)(66946007)(66476007)(316002)(31696002)(86362001)(4326008)(8676002)(8936002)(53546011)(6506007)(2616005)(6512007)(6666004)(36756003)(5660300002)(107886003)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFEvTitSZmZGckROR2Z3QjNGWUh3VGNldXJPM1lIL3dKRlcvVlNGVFdVTjIx?=
 =?utf-8?B?WFRQQy9tclY2ajdoUmxmRDhwa1J0MlYyWVZBdXZGZndERzZlQm5aZlJOcDZH?=
 =?utf-8?B?MXdhSWJoZWdDRkJseUNvdFBDVE1GYytQdkllbXVGNWhMejlkZTJkYzhrRm1U?=
 =?utf-8?B?SUN6ak9FbFkzYTJYODBhU2EwazZVLzV3NlZNbElVM3puNThlNTJxa2l6TjJz?=
 =?utf-8?B?K2w3RkxxbGU0WmtPdFpGZFN5VGliS2YwMThiSW1tTkpDUnBCS0dNY2pWaDNH?=
 =?utf-8?B?cU1ER3Z1WVZqTkJNSThMU2ttQlk5M1VwUk13WDFvUnNoemkzSTlMa2VkejJj?=
 =?utf-8?B?SVNiYlBlVGNXS0RrQWZsV2RTVWJheTNOYVhDU3lvZWlKTENFa29hSUJwUnRn?=
 =?utf-8?B?VE5jc3FIZTd5NThIUlZlNTUwRytRT05iVXdNaEtWamdtbFZoRHdGNVhMTTRu?=
 =?utf-8?B?dSs0Ymp5SmRacmdRZUcreTBhTjA0WkRTd0dBdm5ZTjlGNXo5cmRmZFkyNVV4?=
 =?utf-8?B?UFVKVVpzUUc3dm5WNURRTGVHNktSeUd4TDhKMFNaWFRQYjBLUFcwai81YnVh?=
 =?utf-8?B?Z3BoYjRIU0lSSExqVmk5YW5ZenhVL1BTQW9Oa0xudExZM1plYnkvVHF0S2Zl?=
 =?utf-8?B?WHJQM0Jrd2VMK3F6eXNoblVsSmNTeklDVFNNYTV2RW1yTkpMTVIrMDRGbi9p?=
 =?utf-8?B?Q25PU3ppb05YZC9UOGFYWVkxRW5Td3VDQzJ5QlRndVZ0S3AycVBMeitVOXR2?=
 =?utf-8?B?dm5TQkFaRmJJeEVtRzdjdkM0Tm1RcTlLVmo1dmdSNFZVUkNwNEluKy9nNU83?=
 =?utf-8?B?KzNNdUFTcXFOWUxJZHYzWlpTakdKekh0bUNQVUNZTnNhS1BDNENVM05PSnY1?=
 =?utf-8?B?UGpWNkVUSWdSVjhMR0gvOHhTNVloT1BsSzZRL21SUUVsU3Nmd3k2WG9Vd0xp?=
 =?utf-8?B?TkNVb3lIa2N5ak5ya0dYNXBqSDhiM3lkenJrUTRXNitoQWZrWWhKREJwYndX?=
 =?utf-8?B?ME13d25GT0JQN2pac3ZmbVRnKzBLSHNNTlM1UFVUbTFQQkRJckpCeGNDT2FD?=
 =?utf-8?B?bTdyQ04rdzBUbi9CcjNHZzIyL002K25MRWUwNXdzV2J5Y20wczFBQUtCWXox?=
 =?utf-8?B?cHBtK20rK3JJWnBqWjJaQlVmVlJNUmZTRmM1U2xpSE0rQWJRSVphMDhXV08z?=
 =?utf-8?B?RkhoU2JJdlBGNmVRMXFDcVZsRXkzaTZTcDUvRVhVbFRTRDlWS0d3TmRmRkdm?=
 =?utf-8?B?ZmFoUU5POUp2dmVRWVliYTA4eW9PQ3NKVUtlUlErUzg5TG13enlVNFVDRzFo?=
 =?utf-8?B?Q0twTWdBN1ZIaGs3TDRjTy9mMm16S2t4N0dHeEk2aGpaR1d4M1h1VjB5WDQr?=
 =?utf-8?B?RSsycWtTM09Ua2N6QVF0dVlEWWowbi9sS0o4TmhRcXBOUDR6YVl1ckZVSGJ5?=
 =?utf-8?B?OW5OMFlqbENPUngzeVhWMzZYNURkbmV1cW8zeThxYTNuZ3dMMFBCWnp4UzQ3?=
 =?utf-8?B?aGswWjBvMElhN043aXhBK1BrYXpCUGEwTzB6RjlXY29iQTN1cWZyNTNvMmVk?=
 =?utf-8?B?WWdtZFBJMFNkT2tqYk1PUFZ6OHVQM090c3JTekFTdVY1d1Z5bnFUYjNKY3hn?=
 =?utf-8?B?RWp3dzViRW1hNEhpUmZrUEI1TGJ5UFloTVBMbXhrSGM0QVkrMUZvaEFLTWlp?=
 =?utf-8?B?SWU3OVpjNDdFRDJVOURnVlllcjA5UG4vVVB4MktCSHdpek1scDEyUEQvNnpH?=
 =?utf-8?B?RmloNTNmcFAxcUtheENMWjlNOUY0VlVwYTZDdW03SEhBSkFXbmxYWng5OGlP?=
 =?utf-8?B?cjEzMGJxNVZackU0Zm1XL0hvZHFJcjlxSWJYU0dxaWN2ckpUblhoNXV0Zndt?=
 =?utf-8?B?cTVqMUFMbVFxcVlNcFRwNmRZa0dlS0ErSFlVNUF0VW5wYXlTbm5KUUE3Z3cz?=
 =?utf-8?B?WFpFTTZ6RUxSNit6dkxnMXc2Q2Y0czFoUVZ5UVNvUmRqM083T2VhSVMwMnRj?=
 =?utf-8?B?b0lvMUFlTHA4SGdOcEIvMDRTWUNqeGtjTXlUZzV3L0RDenhOREFKYWV5Ymsw?=
 =?utf-8?B?RUZ5ODNMSXRqSFo0SnkxcHRId0dqRWJSSXU5WGdCWFBNV3k4Q1daQVVYRGwy?=
 =?utf-8?B?aXcrdGFpMG93ZUM5eTM2dXI5SVg3RmFybVBvUGhzRzJxR29raVYyZUNDVGtv?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acd24b7-d705-4948-8f97-08dc26f47685
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 09:17:38.4985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBa/mTFt03ZVG9BsE6aFZy/aFsSV0qZXEVoHbnzBb0U8Rw7YOnkCj09E+TmYh+CMeRpxGBSJjsQkUx7NFChRtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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



On 01-02-2024 23:36, Karthik Poosa wrote:
> Check latest platform first in xe_hwmon_get_reg.
> Move PVC HWMON registers to regs/xe_pcode.h.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h    |  6 ------
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 21 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hwmon.c           | 25 +++++++++++++------------
>   3 files changed, 34 insertions(+), 18 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cd27480f6486..15ac2d284d48 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -490,10 +490,4 @@
>   #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>   #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>   
> -#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
> -#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> -#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> -#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
> -#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> -
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> new file mode 100644
> index 000000000000..3dae858508c8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PCODE_REGS_H_
> +#define _XE_PCODE_REGS_H_
> +
> +#include "regs/xe_reg_defs.h"
> +
> +/*
> + * This file contains addresses of PCODE registers visible through GT MMIO space.
> + */
> +
> +#define PVC_GT0_PACKAGE_ENERGY_STATUS           XE_REG(0x281004)
> +#define PVC_GT0_PACKAGE_RAPL_LIMIT              XE_REG(0x281008)
> +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT          XE_REG(0x281068)
> +#define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
> +#define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
> +
> +#endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 89c6f7f84b5a..f0194d5121a5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -10,6 +10,7 @@
>   #include <drm/drm_managed.h>
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_mchbar_regs.h"
> +#include "regs/xe_pcode_regs.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
>   #include "xe_hwmon.h"
> @@ -77,32 +78,32 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>   
>   	switch (hwmon_reg) {
>   	case REG_PKG_RAPL_LIMIT:
> -		if (xe->info.platform == XE_DG2)
> -			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
> -		else if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC)
>   			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
> +		else if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>   		break;
>   	case REG_PKG_POWER_SKU:
> -		if (xe->info.platform == XE_DG2)
> -			reg = PCU_CR_PACKAGE_POWER_SKU;
> -		else if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC)
>   			reg = PVC_GT0_PACKAGE_POWER_SKU;
> +		else if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_POWER_SKU;
>   		break;
>   	case REG_PKG_POWER_SKU_UNIT:
> -		if (xe->info.platform == XE_DG2)
> -			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
> -		else if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC)
>   			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> +		else if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>   		break;
>   	case REG_GT_PERF_STATUS:
>   		if (xe->info.platform == XE_DG2)
>   			reg = GT_PERF_STATUS;
>   		break;
>   	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_DG2)
> -			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
> -		else if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC)
>   			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
> +		else if (xe->info.platform == XE_DG2)
> +			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
>   		break;
>   	default:
>   		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
