Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94932E7E657
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 17:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B34810E415;
	Tue, 26 Sep 2023 17:36:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7517F10E415
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 17:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695749796; x=1727285796;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pl6d3A2esvLD8ygtR6HmPpLu2dCdsbxp5uU4MmTgCLQ=;
 b=a5mJJvzP7KFXu8NSB2coG2n5qJxdAeHjnmldfwjHXZZAJKRESJanPH6m
 dv7fxOFuU98uzSM3USo9G/e4m372jHbZpGyMP97+98m44Oka+hD5+Gyoa
 9MxBAZeufl6yFwyMp/Zio6lA1hupZ1Sjy6I4pKO/eTKbu10ENgbPU8iMV
 poz5PItemDqQJ72G1j4QGsZvz8osgPTR1M9sCWTn1Gl5zO0eDTH+cUgGm
 LOLg03sPQDXkgTnOXDbEK0oqUyu2qo8UDcrU4bAx8EkHEY+4YWZLDewH5
 SlQpmCsziVNu9YVzyuF5qotdL6+o6uC3LWjfW717VvTBKNAu2kcZ1S/Xr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366689625"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="366689625"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 10:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864481357"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="864481357"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 10:35:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 10:35:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 10:35:49 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 10:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V43ojiCbJ/ydt+t/zvXzCzfSQWJmQYCJOPhFqgifLx8efvNtFFXiDZayf6SYWnvzf/bwoYu/x/s0LDotShy4ThpANPmrknxGiR6aCAm8UqaQUCnOD2SMg4Z6RfiZok8V3ShrSUwrZgQ02ZMAbPDeSj+ZaD3rWheshA0QCOu6+WFLJTSaG+8DkY5Qlx/SXadGVuqZIdIL+HrEi9Sg1yJJVBssGxBpnuTai4yeQqAJGDCoBj6fiy1rksoNsleETtJssK2ehgWKRoeN8CNem/svKoEXYABx+7Ofy3MXLbV44ZgrRYWfOD3xEeqKm6oRBSRStFrmhCSCCQz6UL3lBj3WRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92YbJvR2mnHH7+In4H3YYksl8y3t9xYpd6Vs4cU7V68=;
 b=jzqB8TsFQimtlZQ1GqDiLVjDcYWAxxpLNPd0fZGBJdUO+BzMpltfMVTtubdQlRnB1XCR/Bru3Blu627o9VWJQhBblRjVwl80GkbDD8nklPopd28UaIwjw+QxvoRzW8JE1mYGh8LJqU+ucSLY/q5i7MphWlG074RIsApBSskllH6Zvdce2jUdbzN3B6oRQcbJRV8yeDySiDwiBs14DBEM+inD7MAtq5nJvvSGWCqnKRF0QAkTZb7Uhptf4ahKEyrQxBMfCO5O0R2BkalpXJjuoRqLnLuNGjYTgDmgZr8AVhacJqj5tjO84kj+4d7QTnxIBA7+SSfjqExotIwhENH4CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 17:35:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 17:35:42 +0000
Date: Tue, 26 Sep 2023 13:35:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZRMWairdcW2ADPRt@intel.com>
References: <20230926143916.333958-1-sujaritha.sundaresan@intel.com>
 <20230926143916.333958-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926143916.333958-2-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: cee7f17d-e0bd-4979-6219-08dbbeb701e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5JcJa3BDHRBcesB/8R1VMcarwIRk8WgxskempNMcuxpKcmSpgtAuLNg2W78NUZWCVZ3RfSz14ZCnQ3JEqrDex8QTlDIZVKP04piOvFbJ4JN63rbxk6Tfr+CP1nvASQcKGCgX92VOSHyvjqOorT7vN3LK9exFElL/1BTla2RDwIoVAeJ8eiz6WfL8T86rcGEAyd2oM7y5K1khdkr/MHeDqVxg1qRQYA/IE9xbwMl/vKvsU0Fpely2KJmhm1zzxkyx3QjahsXhunEC3+cBwBmNmM/a+8Y5hageMSRX1jXSqKcWYB2HMFBf96kOL5Bhfvse/0icCjkg0Q4SxmpajPfrvBd7+u4j0/wEfJJJSCb7EUnBe4+XWTjGvGBYv125MJTgM8WP332cJFwXWBMPBdVJTtv31+L3ok2+kLkpZK97tJzeHDAecqdgRZC1MnrKLdTYM/KdWIiUdozyA8jr3sywsJpAjUe6Vy+mg6t40DHhjvic4i45EF2merEbw6CiU9D0pu8OPqw+KnW55m3jIOqEJkD0Ec4WDi+pCKdd++X8YKXrjlZWXnxN14uPtwj373P+iWu1DNOvUKg2fiKwPvqFH6sezenhhZCkb3f4pi1MTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(136003)(366004)(230922051799003)(186009)(451199024)(1800799009)(86362001)(36756003)(6506007)(6486002)(5660300002)(26005)(6666004)(37006003)(66946007)(6512007)(66556008)(66476007)(2616005)(316002)(6862004)(44832011)(6636002)(41300700001)(478600001)(8676002)(8936002)(4326008)(2906002)(82960400001)(38100700002)(83380400001)(30864003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2JlRDdIemswWEZGWWczcmpySkE1eUEwSmo0elJhMkVSTkJsVlpjazllNUQy?=
 =?utf-8?B?NC9OM2U4azlrSFAxYjE2cUYyaVU3ZnhXcXFieGRmRXcyc3RoUDFOdXZuamVO?=
 =?utf-8?B?VmIyTFJJNy9MUk85TnJ6eWxLSGVWZ0VtN3o5RS9LeVBXZW5pNEhtdW0xdGlI?=
 =?utf-8?B?QkI0OWhSdkMxYlA1YnMvOVI0ZVRMcEkzWmF1dGErR0E0Mk5Ya2tUVzN0Umd6?=
 =?utf-8?B?S2lKeURPQ21vOUlZUEFPcEhsM1l3UXhmRlZrSGNNN3ZpNjhIVlpRTEdNTjhC?=
 =?utf-8?B?enRtZzJKdHhDdldycU9vSXV5V05RbWtsT2FGbmtEYlZqT3ZnNWZxN0NtSyt2?=
 =?utf-8?B?SFpoeDYzTHJVdTJ4aWVmcUJsU0Q5bFI3ZnU5TlVVUDJ2a2RCY0E2YllnQm9q?=
 =?utf-8?B?VDBrZU1kVUZodm96WWJ4ZmV0ZGR5ckd1ZUN0L1ZWVUwrc1o1T2duR1J4Rnpl?=
 =?utf-8?B?cVlXSHFCcm1Dd2ZDQ3JCNmEwdXBnWEV3M3IzeWwwaGNLTlB0VXdLT3NvdlZH?=
 =?utf-8?B?c2lYeFFUU3pVek91MTJ3TTN5Rm9JK3hqR0RiOXIzS0dUenR4MEJpKy9RczF3?=
 =?utf-8?B?ZVhqM042K2dub1ZYQk56VXhGbmNXMVRNa2poY0tVWnhuOGhjMTUvRFB5RFVm?=
 =?utf-8?B?LzNVRUpRZmtKeGlWQTdxMEV1Ryt3cGJjd3JsaHppbUlKRUdubml4YUlSTStV?=
 =?utf-8?B?Skduem85VGlSNUc2c3lWbU5pTVFCWVpJOExnWE9lOU9jNVU1cG81Z0lCdzdG?=
 =?utf-8?B?eWNzVGxkazRDdVZ6TnR1cXcwTkk3bklIaWdvM3VDaUkxWHJiNDMrYzQwcUR6?=
 =?utf-8?B?ZFlEWTU2OG5qMDhCM2EzOXJmeXpCRE1BUGhDY3d6ZEJTZ0t3S1B3OTFlb2xa?=
 =?utf-8?B?T1BnVFB5ZCtlWGlvbG9lOTNHR3BKMW1iajBpYTBnclV5WDNWaHdFK3YxQytw?=
 =?utf-8?B?bDdhMUpVL2t1b3JlWFRFN3RRQkR4MmJRZlVnWkFZR0E2VGdHc28wM2NDVGFX?=
 =?utf-8?B?aDdLTUY5aVV4dUxNVjNhUmpQZjVZMlUydEVFOE96b0IwVHl5QkRYMFpPellz?=
 =?utf-8?B?bDdJV3BsTlBOa0FJRnhPYVF6dmN5N2t0UTkvNFJkcmxCQ2F4T2hTRXpuUmlN?=
 =?utf-8?B?WW5QejlqODdHTDdOUHhhbHMzeWpiUmJab1VnTkdGSGYrUVk2QS9DeXhMMi9K?=
 =?utf-8?B?bHk2aDFmUnNOWm5pYjkxWm9xcktOQVlxTVhGS0tNemZJZ3RhM0dBOEp2MWY3?=
 =?utf-8?B?UTA5V1RxRk8yWDF0a0JRTTU3TGdaRExGMytSMy9xQy9XQUhWZkQ0ZjZlZmti?=
 =?utf-8?B?YUF6MmhTYi93a1VPUWxsbWQyUUsxcXZpTWdkRDgrRlkveWQ1dGduWCszMFgx?=
 =?utf-8?B?S1pvd2ZNb2lkbXJsbTZNUWZ1cGl4ZEZkb2kxaysxRTY4UlV1TGFUMGJacmVN?=
 =?utf-8?B?ZjBnWDkrU2ZJeXQvcGhPdW1YVDd3d3VFVDhHVkhJRkErTnNlK29rbFBoRmIr?=
 =?utf-8?B?bGM4MUhSbXpEOWg1NTlXZjRkc0FlMmxQeXpEYTNQV21nYXZSTGtvL0k2MmZW?=
 =?utf-8?B?eVVIQzhrVC80Z09VWWZlNDB5WkJhbVVVSVk4bU1ndWxLU2txRXpPaERSUnQ5?=
 =?utf-8?B?VU0wNWgvZFJGdnhPbmpmVzlUKzFPelkxSXQ1S0NxeEZEZDhLMGN5aFhnbEgw?=
 =?utf-8?B?b3hBSTV3dys0SjJSdndCTXJnUVVuN0ZwRU5lTTFBR3hlNkVicm9FZjFQVzFB?=
 =?utf-8?B?R00vVUVhSWNqSk9iYUplTFVPc1RiaEc1aUI2RWZEbC9lV05FanpQZk5mdEh1?=
 =?utf-8?B?K1RtVkFSRTBsZXB1U0lsdlVKeVlZVU1sSVJPSEVUK2pzZEdPSEs4clBBZVEx?=
 =?utf-8?B?UFZvajkvbEltSWlOc1llUUhmaHZuSit0ZDg0VFoxNDViVmloZDBhWFlqSUFw?=
 =?utf-8?B?VkVOa3dycDhaSGtlM2ttSHZVMkxxdEZPK0M1ak9EaCt2akJmUHhuUzd0WFFy?=
 =?utf-8?B?RFhSaFVVSFROdHVMQ2huN0hBclFqNGVJYWZwbURocXNCZTBDdmhYaWFDdlIv?=
 =?utf-8?B?UktEdXJ3WjkrdTM4akJobEV1Y0c1Q0Ywd3BXYjJvUEpBYnFGb1BxeGVTdCsy?=
 =?utf-8?B?OHFiblhJL1BQMmFRaVdCbFJIVTE2Q0xBbTIwZmtMeGFidEdXT2Nkc1I2MFJo?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cee7f17d-e0bd-4979-6219-08dbbeb701e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 17:35:42.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2jSLmjgbw6IUrtXEnOJ+xS7+U0IPkxWdX92NWP135AVmT54b/ITN3YB5wFTwdmuEWRSsvnEhvZ3ErAawMLUyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/1] drm/xe: Add throttle reasons sysfs
 attributes
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 08:09:16PM +0530, Sujaritha Sundaresan wrote:
> Add throttle reasons sysfs interface under device/../gt#/
> Currently there is one overall status and eight reasons
> attributes.
> 
> The new sysfs structure will have the below layout
> 
> device/tile<n>/gt<n>
>                ├── gt0
>                │   └── throttle
>                │       ├── <throttle_reasons>
>                │
>                │
>                ├── gtN
>                │   └── throttle
>                │       ├── <throttle_reasons>
> 
> v2: Fix review comments (Riana)
>     Move init call (Matt)
> 
> v3: Remove xe_gt_throttle (Riana)
>     Make functions static (Rodrigo)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile               |   1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>  drivers/gpu/drm/xe/xe_gt_sysfs.c          |   3 +
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 257 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  16 ++
>  5 files changed, 289 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b1681d1416eb..9aa61e416a24 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -64,6 +64,7 @@ xe-y += xe_bb.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> +	xe_gt_throttle_sysfs.o \
>  	xe_gt_tlb_invalidation.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3a4c9bcf793f..374238dd8a06 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -411,4 +411,16 @@
>  #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>  #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>  
> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> +#define   PROCHOT_MASK				REG_BIT(0)
> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> +#define   RATL_MASK				REG_BIT(5)
> +#define   VR_THERMALERT_MASK			REG_BIT(6)
> +#define   VR_TDC_MASK				REG_BIT(7)
> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index c69d2e8a0fe1..dc3f841b49d0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "xe_gt.h"
> +#include "xe_gt_throttle_sysfs.h"
>  
>  static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>  {
> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>  
>  	gt->sysfs = &kg->base;
>  
> +	xe_gt_throttle_sysfs_init(gt);
> +
>  	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>  	if (err) {
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> new file mode 100644
> index 000000000000..12facebd8989
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_gt_regs.h>
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * DOC: Xe GT Throttle
> + *
> + * Provides sysfs entries for frequency throttle reasons in GT
> + *
> + * device/gt#/throttle/status - Overall status
> + * device/gt#/throttle/reason_pl1 - Frequency throttle due to PL1
> + * device/gt#/throttle/reason_pl2 - Frequency throttle due to PL2
> + * device/gt#/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> + * device/gt#/throttle/reason_thermal - Frequency throttle due to thermal
> + * device/gt#/throttle/reason_prochot - Frequency throttle due to prochot
> + * device/gt#/throttle/reason_ratl - Frequency throttle due to RATL
> + * device/gt#/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> + * device/gt#/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
> + */
> +
> +u32 read_perf_limit_reasons(struct xe_gt *gt)

I'm afraid that you forgot to make this static...

> +{
> +	u32 reg;
> +
> +	if (xe_gt_is_media_type(gt))
> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> +	else
> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +
> +	return reg;
> +}
> +
> +static u32 read_status(struct xe_gt *gt)
> +{
> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> +
> +	return status;
> +}
> +
> +static u32 read_reason_pl1(struct xe_gt *gt)
> +{
> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> +
> +	return pl1;
> +}
> +
> +static u32 read_reason_pl2(struct xe_gt *gt)
> +{
> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> +
> +	return pl2;
> +}
> +
> +static u32 read_reason_pl4(struct xe_gt *gt)
> +{
> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> +
> +	return pl4;
> +}
> +
> +static u32 read_reason_thermal(struct xe_gt *gt)
> +{
> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> +
> +	return thermal;
> +}
> +
> +static u32 read_reason_prochot(struct xe_gt *gt)
> +{
> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> +
> +	return prochot;
> +}
> +
> +static u32 read_reason_ratl(struct xe_gt *gt)
> +{
> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> +
> +	return ratl;
> +}
> +
> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> +{
> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> +
> +	return thermalert;
> +}
> +
> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
> +{
> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> +
> +	return tdc;
> +}
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr,
> +			   char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool status = !!read_status(gt);
> +
> +	return sysfs_emit(buff, "%u\n", status);
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static ssize_t reason_pl1_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool pl1 = !!read_reason_pl1(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl1);
> +}
> +static DEVICE_ATTR_RO(reason_pl1);
> +
> +static ssize_t reason_pl2_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool pl2 = !!read_reason_pl2(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl2);
> +}
> +static DEVICE_ATTR_RO(reason_pl2);
> +
> +static ssize_t reason_pl4_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool pl4 = !!read_reason_pl4(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl4);
> +}
> +static DEVICE_ATTR_RO(reason_pl4);
> +
> +static ssize_t reason_thermal_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool thermal = !!read_reason_thermal(gt);
> +
> +	return sysfs_emit(buff, "%u\n", thermal);
> +}
> +static DEVICE_ATTR_RO(reason_thermal);
> +
> +static ssize_t reason_prochot_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool prochot = !!read_reason_prochot(gt);
> +
> +	return sysfs_emit(buff, "%u\n", prochot);
> +}
> +static DEVICE_ATTR_RO(reason_prochot);
> +
> +static ssize_t reason_ratl_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool ratl = !!read_reason_ratl(gt);
> +
> +	return sysfs_emit(buff, "%u\n", ratl);
> +}
> +static DEVICE_ATTR_RO(reason_ratl);
> +
> +static ssize_t reason_vr_thermalert_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool thermalert = !!read_reason_vr_thermalert(gt);
> +
> +	return sysfs_emit(buff, "%u\n", thermalert);
> +}
> +static DEVICE_ATTR_RO(reason_vr_thermalert);
> +
> +static ssize_t reason_vr_tdc_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool tdc = !!read_reason_vr_tdc(gt);
> +
> +	return sysfs_emit(buff, "%u\n", tdc);
> +}
> +static DEVICE_ATTR_RO(reason_vr_tdc);
> +
> +static const struct attribute *throttle_attrs[] = {
> +	&dev_attr_status.attr,
> +	&dev_attr_reason_pl1.attr,
> +	&dev_attr_reason_pl2.attr,
> +	&dev_attr_reason_pl4.attr,
> +	&dev_attr_reason_thermal.attr,
> +	&dev_attr_reason_prochot.attr,
> +	&dev_attr_reason_ratl.attr,
> +	&dev_attr_reason_vr_thermalert.attr,
> +	&dev_attr_reason_vr_tdc.attr,
> +	NULL
> +};
> +
> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, throttle_attrs);
> +	kobject_put(kobj);
> +}
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)

... and to add a kernel doc to the non-static one

> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobject *kobj;
> +	int err;
> +
> +	kobj = kobject_create_and_add("throttle", gt->sysfs);
> +	if (!kobj) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}
> +
> +	err = sysfs_create_files(kobj, throttle_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> new file mode 100644
> index 000000000000..c318d98215a0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
> +#define _XE_GT_THROTTLE_SYSFS_H_
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"

do not include .h inside a .h

struct xe_gt;

should be enough here
and the rest of includes if needed they should be in the .c

> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
> -- 
> 2.25.1
> 
