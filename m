Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A54DF531CE
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 21:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AFB10E0B1;
	Mon, 13 Apr 2026 21:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUN5Iuzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1334B10E0B1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 21:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776116665; x=1807652665;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MyfUUgBE2zxwB48fcws7io+gr9UcdCgJFI2Ex9uI9nA=;
 b=mUN5IuzdBwOytBCAiQljVTgDflmDRtmUMdimnvAQJU718docvQ5X7NmN
 lWwiAtoHvfWHLGUwakCoFaqrfgUeAQngdg3rNBasTQLRS/0aOKJ9hptvg
 j48ZDKU8LYPEhI+UGcUWO5zNiI9kSJz0vkLUC9CpTv1UURz3Mx89uVapd
 pKPeykO+Keza23KnsVd7LkHxeX6GmM/LX9b1nnPxiAOF/OurLS6xxZncg
 1gDJdxOhhzuO6hlOh+thJbCoHuOC4lwlT6LUx73DVtdpDuEYVMyOca+sE
 dQri/urnpE6haNTsy4kUEMTJLicZ28q9tBfgiG1UYUj+yWhA5ltS6V07/ Q==;
X-CSE-ConnectionGUID: ZNfKa8v+TIG+NuHCh9Sa3Q==
X-CSE-MsgGUID: vslx+5yKQumhHTyQC31Oxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80652608"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="80652608"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 14:44:25 -0700
X-CSE-ConnectionGUID: SZKrvdVuRde0/rKRatgNMg==
X-CSE-MsgGUID: dO+xmkPPRFa86MjZzKgx9Q==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 14:44:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 14:44:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 14:44:23 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 14:44:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYutg3FK3T/zUEhaRLZAaYsK9L5MT63LP40HydSqBJRUvwBpvDA24EtDa+8VXamAz3J88sj1kAor9YnfrEN3fb0uEjm5sAigmJZB86r/fHArDlh7ZR5T9YDs+ZhGApN6w3Hz3xxeWky0l30eqBhbWscIKnCFlYttLYNvYvVA6X+fzFseW/yovJAoCuvWhmMxPE1JgXtC/L0BDSCSDxHeQm56YHxXKg0M31J3H5umK8RTbzXlbTVnUQLOoiT3JSv41SYdsUyTQvSTrNtmD3pkjvdLcKQRQOG2gIWYIipohCO1Wqh4dm368+kSmaabKufHQn3jEi2jXLzz+swNx/fgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkvXVYr6uOvzFTKLxkY4nH3ySK1LyWCtny9XHqs1FiE=;
 b=ja+gTf0HPUPC1XeRKjSUz7UU5phmDWxTntm5JPv6JYp8Ge6w6rdKlkFzS+o7gHvqrfgsp8OpXpwYHEM5eYobMu8qerSEYT9yb8x0cAUvPt2uNY3ZEQUgrzJeEUt1QltgYN2PB7PESiNVbQ/b3wwGSVbYw85X5Nwt0hBUJo2dSO1UqjLjrVLETfYAnaxRLTPXTan9B1Wlb1/08tYKoTC5gGPT1m8H4Q3tjfctvmYwWTpS47MaitHcWGHD9QYwx3aCxx4LZeu3G3wwLK2UxCJ7pR9pZBAA5F1i47iGGkmrXJagPd8FZkZsOv/xZlQ8FRU6Co/qf00CK0LEV6RWzCtHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CH3PR11MB7865.namprd11.prod.outlook.com (2603:10b6:610:128::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.45; Mon, 13 Apr
 2026 21:44:21 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Mon, 13 Apr 2026
 21:44:21 +0000
Date: Mon, 13 Apr 2026 14:44:18 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/multi_queue: Add helpers to access CS QUEUE
 TIMESTAMP from lrc
Message-ID: <ad1jsmhJ5pJYw8mH@nvishwa1-desk>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260409203714.1887402-9-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CH3PR11MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: a86a08bc-3a35-4acd-9a00-08de99a5d268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: BI9uskztadDS3ODrneJwODvFm1W+sB3Xa/GeS6cyXGWQham761ytsZpAPUDfy9OzuwPsj6tsD+oYuSLDR974z0ZcBEfC96vHQRRX5k27TIm+ck8uze8tZY+pUoEd1ZM1ZHK5VGEsXrEHPfd4HyMSNMXwzUfommEtHWDZOPjAehNyJZLKrmLaGsg/EwqhKa6x5jskxs++wbygLy4LdsJp6/OW+pcYZkDNq2CzwUhLoNbe6TNjC0w2JRFwlR9Y7MOYWVbfIctfFOrmRh5xt4E30+ywYQImMU0vtyEKO0AHBJC9viyQChTFIRkLygjgovxaBSTf8YDNhB+lNCWXTfyxPmOf/v6WAwhlFtgT0yNi8z+NLdk/jBPx9YExrizsxE8XIGR2Vfu9iogRWAPKONLlp3aRV1+oLKMeIJ3nq2EAEnwlczxpDWX02KB+wHtE8tTb29O0cur8rEV7MVz1BBwvN5ppLPMXpBCdkG6WvdMx5omSNQ79qj4Ypd9K730gVcy9InXU05mXOkq9S30jfgfLue7Nw39qG5TTAY1Uac90n2wZ2OxelNzNgkw+GSfK0llzjdI2sXAmkO+c248ANeWQR0/1hSa1Rb+WZ32ocGbpW21/eEgQRVm6kCkBUB1EasAmxFxJNAd7abuvjX7swScJulxr22hfzb878ePh+CWleADvAlW4Fg+CWsXau8ktLw2zy/e4YmbLVTHCYzsezwEddd2ajBb6Ru6lSyX69MCi8Po=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Jqm67SSnkqmd/z6/ps2upMIwLhfx7v5npuaImmPxih+4rRKaBfMJoVia475?=
 =?us-ascii?Q?IhWnODQxyhCInPsNfMWIobiGBE52E3Uvr+n+opj0UwjmI5XNDDDyJRM6C/zG?=
 =?us-ascii?Q?P9oH4PGglijJ3rGkMrBi4TBejegYmkAd8ivsRoB4BAoWyyt8HHXnQt/XZNl0?=
 =?us-ascii?Q?JTQi5DLFzmRvI4RmuubbkzYdk6AcXo5lDwnEZR5U46MTzaSUHjcm1j6VScp7?=
 =?us-ascii?Q?vltPqqvha63ewBYMBYdex2eacv54j5Td/O84sQbxzBxSCpQZRDnj0ns0eqhw?=
 =?us-ascii?Q?bYode54+jpNUlwg/GHYJ9Av1dLc63cNZRpxfQ+qgJ9beDkNs/P4mcn/A3QAi?=
 =?us-ascii?Q?dbdTu7Z3gLaClahKtsiljBRBsa9l3R+ztM1s7gkRkEhskz5T4gJzQKWZgl0j?=
 =?us-ascii?Q?5Vqmmc9W6uEriV2EEvjpw6t+93Z+qurRmnSAbelTsEYYpcssFZa1unEuKLSD?=
 =?us-ascii?Q?fR1c2gDsTxtjo+52w1/r7SRfPCQbS2otV3oDNR3EyH79VJAboDsq8UF2/W5Q?=
 =?us-ascii?Q?SeCSNlwjMVNGKHFXL7uv1+g+pj1+2DdSXyDx++Ee1+T60VaTEng8M+tkGkgv?=
 =?us-ascii?Q?iFKYctLO4VLDM959+/y3L+gOpyF+Ko3H96mG8y3QsYNelAtSKE77XKlX0sq/?=
 =?us-ascii?Q?YyDHN5xWJ7XGfxMCYjdjLXvSMAZ0CetapBueqVduirgmopT3g9V0zKY05Rfr?=
 =?us-ascii?Q?Tf8KBM3ppkEqMviOght/JwKrzbdTINHTgZbhgg03xOTjlUT+phz0v+1OZBd+?=
 =?us-ascii?Q?vmzZZ6QHhXI+xOLlgYttOvIghH8jYsRr8YNyz0MfUbEjoDRijAX+Aulx4REw?=
 =?us-ascii?Q?7Uzt92XjO2nwRV6r8+vVDhv93Nb5jVt8YlEfMOcu4mVtrJmOJjvQ6WDI9bVp?=
 =?us-ascii?Q?mI/2FtSZkS4kKyD0Io83YKUQY5RwioUiOeYYc5zPnlY8yRFFUHIivK7Y/B+9?=
 =?us-ascii?Q?OnRwTnGr65jA/g7ffcrM5i+lHlDuRhd6Nat7LuQipUGTT6jmMS+QVEIj9x1y?=
 =?us-ascii?Q?AAQGeCEh5pVHor/iLxeN73AvZNTQAKvxNrOmVokn4IHsY4h1xZwrj3I/5+8D?=
 =?us-ascii?Q?4VT4SKx0ISAQu5GDtCJRwEuVLb57SQN6ZXVdbbxEPTDPFmbxgrHhR4+B3B6t?=
 =?us-ascii?Q?vYFd4z1JNg3s7yuq76caORVfY4uY8HPRQ/m7dtORfykoz0Pio4VMdiITLsDt?=
 =?us-ascii?Q?PV7ghCkx1+TtbyjCpNPpo+CmVlWWEG/dDF89eO0uPFv+Eim0E4YR+/8wvWxC?=
 =?us-ascii?Q?mnBwVzAoy/Bn55FNhg2NZQqAp3Hn/9B6o69zwMRf3+JUtIxONsUFgQ2LOqF3?=
 =?us-ascii?Q?nTrwkbrT0r5Pfuqjns7UWaVbA2Qyl7vlvaBhlee6JX4l06JCyLfRSOfBJrnv?=
 =?us-ascii?Q?MrXK5mh20u4Mxr043mapXy4oJ1HkVUqZq/kKIUX0uxO14BK6vo6CJvuqDjHi?=
 =?us-ascii?Q?C4lFp4fGudLzczDzLeSaIPVCjU8g/kHV6HyP/+T+j1/aOjENk5RDCVe+/EFX?=
 =?us-ascii?Q?K3mP4JA8Ojd4bTzUsr2TUJFR8z0BLgjcElgiNwK5d/mvtSWjU70XWEL1dp/X?=
 =?us-ascii?Q?ERWGsGG8u0q9IpY9NEPJ3oGgq5N3qXz+vhq6Tn6Wr4FP63dVaJj2I9bodrNW?=
 =?us-ascii?Q?0bFz3KgWekNqx1jv1rG+CEmwYylTEQfdDUAOu0hSJ6HNLLQZvhx5+RzIH9fK?=
 =?us-ascii?Q?jD73+1OkCXh2UBfsnyc87xmlFFsIFLZQtf+vPbBG7Koaas2DaAaOJpd8d/pQ?=
 =?us-ascii?Q?QgYrnHBEy5JvkTMM0OBJrK36k5xfH0O5be/hq8L1o/6q6B/kdlPi?=
X-Exchange-RoutingPolicyChecked: KcmQHdQ83gPC9Bbp6ptUIRGPR1rmKkMR+5WPxN/9NnrxqHRzI7v/Vkgt7CxTUXZGVuxFkksHU6p39znVboCyVk+LNM1ikFg37bndMvcXN3kAWEcBm+G0rLYf/Y+JnqVmHtfPYCINciYGLHYjh4tlSvJJIBV8hekllkJO3N9Om3BmMW9eN1c14lDdAn0aBsmb78IjF7LBFUDJ54G4dNTN3+Np4ZK330sNc/VISsbsYwmL+r0BbBaAl8OP0JbDdWjqCjaTXLu6jzBGgrHT251TH8IV35ftK4Et3Ut5aR+X8shRFoT52jsdLQ4OtZXKAr+9kSDe3LSMsAV4RxWCM+2/WQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a86a08bc-3a35-4acd-9a00-08de99a5d268
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 21:44:21.3392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4C0KHhOxdxBvgXWKTJ7fsNvRa+Dbi3iKMZFoFHTuJAacWBOYok8lZKveiKJ7367uQaF4Qt8l7PFNLIVJSqXAJWkPHGSNgCrzDVRJaCi36Sg80s8YRtARLcLtdt87F1b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7865
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

On Thu, Apr 09, 2026 at 01:37:17PM -0700, Umesh Nerlige Ramappa wrote:
>In secondary queue LRCs, the QUEUE TIMESTAMP register is saved and
>restored allowing us to view the individual queue run times. Add helpers
>to read this value from the LRC.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
> drivers/gpu/drm/xe/xe_lrc.c             | 44 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_lrc.h             |  1 +
> drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
> 4 files changed, 51 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index b5eff383902c..4ab86fc369fd 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -34,6 +34,9 @@
> #define CTX_CS_INT_VEC_REG		0x5a
> #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
>
>+#define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
>+#define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
>+

Should we also add these to XE2_CTX_COMMON() in xe_lrc.c?

> #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
> #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
> #define INDIRECT_CTX_RING_START		(0x06 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 9d12a0d2f0b5..be1030c74e21 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -788,6 +788,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
> 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
> }
>
>+static u32 __xe_lrc_queue_timestamp_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP * sizeof(u32);
>+}
>+
>+static u32 __xe_lrc_queue_timestamp_udw_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP_UDW * sizeof(u32);
>+}
>+
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
> 	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>@@ -837,6 +847,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
>
> #undef DECL_MAP_ADDR_HELPERS
>
>@@ -885,6 +897,30 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> 	return (u64)udw << 32 | ldw;
> }
>
>+/**
>+ * xe_lrc_queue_timestamp() - Read queue timestamp value
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: queue timestamp value
>+ */
>+static u64 xe_lrc_queue_timestamp(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map;
>+	u32 ldw, udw = 0;
>+
>+	if (!xe_lrc_is_multi_queue(lrc))
>+		return 0;
>+
>+	map = __xe_lrc_queue_timestamp_map(lrc);
>+	ldw = xe_map_read32(xe, &map);
>+
>+	map = __xe_lrc_queue_timestamp_udw_map(lrc);
>+	udw = xe_map_read32(xe, &map);
>+
>+	return (u64)udw << 32 | ldw;
>+}

Should we make this function similar to xe_lrc_ctx_timestamp()
with the xe->info.has_64bit_timestamp check?

Other than these, patch LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>+
> /**
>  * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
>  * @lrc: Pointer to the lrc.
>@@ -1550,6 +1586,12 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
> 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
> 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>
>+	if (xe_lrc_is_multi_queue(lrc)) {
>+		lrc->queue_timestamp = 0;
>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP, 0);
>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
>+	}
>+
> 	if (xe->info.has_asid && vm)
> 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>
>@@ -2476,6 +2518,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->replay_size = lrc->replay_size;
> 	snapshot->lrc_snapshot = NULL;
> 	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
>+	snapshot->queue_timestamp = lower_32_bits(xe_lrc_queue_timestamp(lrc));
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> 	return snapshot;
> }
>@@ -2529,6 +2572,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
> 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
> 	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
>+	drm_printf(p, "\tQueue Timestamp: 0x%08x\n", snapshot->queue_timestamp);
> 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>
> 	if (!snapshot->lrc_snapshot)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index b544c8169967..178d9519b196 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -38,6 +38,7 @@ struct xe_lrc_snapshot {
> 	u32 start_seqno;
> 	u32 seqno;
> 	u32 ctx_timestamp;
>+	u32 queue_timestamp;
> 	u32 ctx_job_timestamp;
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 93972536214a..4bca394ff024 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -64,6 +64,9 @@ struct xe_lrc {
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>
>+	/** @queue_timestamp: value of QUEUE_TIMESTAMP on last update */
>+	u64 queue_timestamp;
>+
> 	/** @multi_queue: Multi queue LRC related information */
> 	struct {
> 		/** @multi_queue.primary: Primary queue corresponding to this LRC */
>-- 
>2.43.0
>
