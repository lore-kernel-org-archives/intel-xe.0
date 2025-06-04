Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC79EC5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 10:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1CC10E76C;
	Wed,  4 Jun 2025 10:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5y1XTMr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C443D10E76C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749032734; x=1780568734;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7kLNVt7PBeG4inVkvmhJPesXrjtaL17iUBRCiR7TXx4=;
 b=j5y1XTMrxOOvUL/kbQbzxSw+fuYPQJeMPlHNhKNLj5FUmB6DjwgXffEW
 ifeYr9YkAJEdHJZlzov21kFXHBxS+cDO3eCZptkbBvaTCOJav8+HntVNZ
 cY1eJU9VzoD1cgIWJzyVZjaUq3x7BhiQGtW0K64d3rX+JG1yzJnavw7LG
 QAIG6beYZAdPuM5C4KnSs77naLc8I8zYZsQt1SntUR55os3u+Vxi/mQfS
 Z1fbwCSHE2LsisVrg+o281qerLbfySjjmraEN7v9WDg5AD9oecFawRHbs
 001hP5L+0N8gLB7alQrIWKf72yEwpOAHUVfvASAd5CjqEq26fPCYZ95ig Q==;
X-CSE-ConnectionGUID: fuQTmDTeQs6vlApZovCVXg==
X-CSE-MsgGUID: aNBE9zEgT66Bjm4egdPv1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="38738933"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="38738933"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:25:34 -0700
X-CSE-ConnectionGUID: HJSii8YATPCGb2awgDqR9g==
X-CSE-MsgGUID: iID5kMhBQ/GVyJaC9EybGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="148985800"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:25:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 03:25:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 03:25:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.87)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 03:25:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmA8amCkS93vEa9laFoTDsTEZUZEcOmOpQRJNDjsUjRUQ7SygcyheUipYmCC2y7pYTOiP8ejM9Rt3lHdsY6ZLoUA51rLQbphxlSUJyPehaXBK7wfgc8TD0rk/HUUxQ1t2/Xzecm0W6KKvmJGZiekJdDGamMrUV+7kFKhPkpgp6v9OAD/yx8ZEyXcEABzC/updC3fODW0pA6cnMublq98S7lAGFwxwel8lShrTLXLUuUCyTSTATLIc/uUE+eEiNLsZBt6UPN1Ko0CNaYnllxDHYJpZB0pPnrL2ujAk4iO2FwYVdxiuD23jyebBM8BtDDTHFRA/OlT5Lcd6BL3WjFuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au+wou8MUj6Ve5urekiA7gRsXNkghz+nrWbQQ6IziQ4=;
 b=c/5NSVdnYoy5lQ1z7QuWa1BjOXowcpO5DeIh6cVuitRgDMwmkk6irVwJleBU7W8r1qxHiiy1urHANjtt5MUApocd767quezSTI5kjvhswZ4NuEtkJqIFoB3Oc7eHyU0ALd04R5xfLiqmdMlIxFkikUOkChzLz/IjUGzRxr8kiYkRuUQ/juUK4DGFbrEwHlIxwxCj4KDnxcOvDPw7qPeZL+dRJM3Vj4VJIyc9Uam/u0MDj+S6oAQvT1ukiyltHqiVVjadVFounjisBv2w5ADOC4tRCHqhfP29W6Uqo5Y0uSof/uqayLlraWdky/QYtlLSLDcGYDjBCclAc9oeVoKvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB8294.namprd11.prod.outlook.com (2603:10b6:a03:478::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Wed, 4 Jun
 2025 10:24:49 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 10:24:49 +0000
Date: Wed, 4 Jun 2025 12:24:41 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Add more SVM GT stats
Message-ID: <aEAe4dnl5MaFW0r9@fdugast-desk>
References: <20250603233445.2304383-1-matthew.brost@intel.com>
 <20250603233445.2304383-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603233445.2304383-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: QR2P297CA0001.MEXP297.PROD.OUTLOOK.COM
 (2603:10b6:3d0:6a::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3bab31-45ae-4712-18b2-08dda35208c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X42QC+Mp6GZeCvU7yc9S8j6fzlNjDIkRxpnOpfBxxPiAGBk8/ECH1euyy7qd?=
 =?us-ascii?Q?iIdn6QgeXKfXAw5hP/CiPbVeeqhKa3c5Hl4TPLsGCjSE2oM+c1qX66Qp2AOQ?=
 =?us-ascii?Q?GNwKyHFCsrlx10IeNh5gbX7S2WQ6VIwdT9IdfktPYuec7gOpxyBDIYZC2eRA?=
 =?us-ascii?Q?MMzgd83SWaDPXmR3s8KDY/2qx+E6bBeNjuozRGMe54ncRZMjRUJV2i2ZBWxJ?=
 =?us-ascii?Q?YfqzmxTo4iNLJnvhh1msrJvlPYGn6OOComXM/KOoYU6fu/uBnqhJK6AbTZo9?=
 =?us-ascii?Q?QwF9U/w9DvKgzvvmOZF/9eQ+eDDN9h2pHvpRm+29+NYZknvXbR2o1wmG3wYu?=
 =?us-ascii?Q?polPMaorlHPhbCybRg1jXH1VBa+klxMkXQAFWdi/HxL6RJxchaWAdRojO29Y?=
 =?us-ascii?Q?lGXEv6XO2zbrTRLcJusk6f3dUQu6lEzlZI5kj99CjG0iAfJDip6Mgm6/3v07?=
 =?us-ascii?Q?M4JvEXTwf0WpAKNR9lSXe3d4/idINip32xc/W4P8B2zZ6CWAZxiby6DYsk+3?=
 =?us-ascii?Q?s2O0gYw2S6iogVFSLCPqi59hOuK3vt5ntxYY+AlUxW8eOtXrJhdk0e9vU0ti?=
 =?us-ascii?Q?1pJ7hXjToRpBgs7ncmGEdFjKbdyib54SSE1AcdKes6i3R6NeyYj2VjomjDvz?=
 =?us-ascii?Q?g6jt8cIQzcK8noeLa+vot2xyhojxvVZqGFmtn/fuTC9710YGmnoIwjBjPMRc?=
 =?us-ascii?Q?T9aqAh9ta1yTNN+vn1o0je+CDt1t+SYxtqXFBh9Ono0SmPJKHjy4WEjwGsko?=
 =?us-ascii?Q?SKLcjXRnjIhuSg7SZf0M9IYCUkHi9V7qoe67g2sNFMsKxc4Un2uds89nCpva?=
 =?us-ascii?Q?BgxvazsVOChgZKO2WnwC1GjDkmOlLrknFKDuR+vK7h6MTa1NYTpbC+tLlLTY?=
 =?us-ascii?Q?JbsdZ2tYr/N2zb/wtCoCegpGeHU3JOJJEBmTJDvh1dCZ8Btpr+TLO5JFlfsb?=
 =?us-ascii?Q?elWrq81Nzaz0LQ8GNORQZaBO5pXWlKWABupxZd0WTEtl11UCZ2UMQNWCcVi0?=
 =?us-ascii?Q?pbpV+39SLI5J9vjUAI5PbuCCW9RmCqEPji3DCkmIGU2pLLc11YVVWNErv2fN?=
 =?us-ascii?Q?VOObx56VjSkf5+zrJ4CUhD3S9ItIRQK7aOVckihVtgHfox/BynFSoMs1Syrc?=
 =?us-ascii?Q?1vjw9lZn1ZLJHsbVbPHvABrzbeZIG01s0w+ffCpYpGQxkX4wptQbylU0gHWm?=
 =?us-ascii?Q?v5xnsoWX/H50n/hKc1Syfu5jn8vkSOE2B2Qrnc5owPNdJRnda5P3kYnNuwzV?=
 =?us-ascii?Q?xZ+jrJZCUoknLCZpesd5hx6lIzmHEjveNplpIzNI1a7hL18gE1FUJJ+I9VgQ?=
 =?us-ascii?Q?O0z8eNnEf/IwrcVNCf/qlKhDPnR/73uSdkoGlsqWMh5sDhRDAU54UvEsng9n?=
 =?us-ascii?Q?DWT0WQpllyGAdnq5dqav++dXDXxpvbyzUbUyPbGy26YM6HMkPtcHUtymwU6v?=
 =?us-ascii?Q?vY37D+YH7tU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?asAqsV1ehXZ//dyfNan+kfScfBLQ7Xc4/ErAT8k9NddAwwDgH3Rzai17ctLy?=
 =?us-ascii?Q?qvPSf4GAefpGI4ExPy4v80Vl+D8IPPenlEvJjfd8KzI1uoXTjbkiQVrkWFTF?=
 =?us-ascii?Q?5M90BwAZ3bsPiWsSL5J0Fa6zkoKTEq8Vls0UvJejpKcfhMyylUszDZ1T+ubp?=
 =?us-ascii?Q?1dX7W1CMvj7w9/Wqj6lNlr6JHMFU361rYFiYfiuUs1gf9VEzfjespzv7GBmC?=
 =?us-ascii?Q?yzVPAmwcKSdlA1HbSbN5vfXddcnmK1JMQwfO60Wo2OVUSVgC6EX45VGsrRiZ?=
 =?us-ascii?Q?REmB976gGBLDh61lhOds4TmDm6Zog78oVfN/Rbe/OEVDIijizAte2/gQOixx?=
 =?us-ascii?Q?H4TC1V5WBPTWBI7N3zBVeH0KgQdEnQddUfgNQT93QDzdGCZ2/Y1nw0YmJupo?=
 =?us-ascii?Q?pTFdd/R3aeGx4AWelaSc2fotHq0BGH6NMYFvsusSRlRYCvKW1UEldbxPCcYw?=
 =?us-ascii?Q?c+yuPdurmt+XsfjDkmj+wJ6bVAQ9AkDmFI5C/1BGcYZGgy4S9X4hmmFBXY5X?=
 =?us-ascii?Q?La61r4aZ+7WT9h6ZjJwAtI48oq/M8gO6T5DR+Hc5U61CZ0EeflJ3n0biYWhU?=
 =?us-ascii?Q?fsPnMgoVhANUq3+iFC3iWXj7y9xojd36/Zi0noGK94H4mBSFQOREvJoOJlVh?=
 =?us-ascii?Q?v5uF/lzYcxJRYQKOKE0Y4+BNSwY3DIlCrhZTlvIX/J0K0A3f6xp+sMVI2RTX?=
 =?us-ascii?Q?0fDCoad7mUzNLeLMpQJXAsjwHg0NrO7yvgV7uOOp1us/1W9Xz/yF/ty0Q7Kj?=
 =?us-ascii?Q?NsunBGuGDrZdZFITnmUN3HPdzomde5DmQWitu4qpvAarvObTXq1OdeAhiJhr?=
 =?us-ascii?Q?vJN0RYG3/qeKQ1e1cwWbZP81GsAfQ+g4/jtNd75Y2njgp4CTuVT9ZCWjRxSw?=
 =?us-ascii?Q?jp7lfhT8Kh59JTl87IlFXPblrLPaYWqqC+9KonNzyJFjXOuHEZ6ac1k/RHAh?=
 =?us-ascii?Q?DHH8mDj4MBPY4o1rj9ZK8WXx/vZbvaMY6T+nR6V/lryiG60wnZW7bbWeXkrT?=
 =?us-ascii?Q?QlIp44MJ4xk6w84iQj9gFa/H1dZcmguB/VX+F6VENKetpqx5lcKPZgAElozY?=
 =?us-ascii?Q?/SBxkjPIpNmoa0uEpDck0RpUdShLL2DZJ4SGLs10o+75v+UXXvFpx0yN/Lpu?=
 =?us-ascii?Q?xDuHrywpICSx7QOI9KvyJkvPnG4AFOxbR9SR+Dp5oapSBnEy/Kv4h1kufNLE?=
 =?us-ascii?Q?8mKrkbKXNn6Je3K5jFaoCIv4sL2tKtIG4OinCcI7XMQbCUuRnihsYYemJCWb?=
 =?us-ascii?Q?C/PFXn/5V24GiRxseZ95Skvn3OCB3fExEJcIBcA2Gj6HcDvR4tFm/EAvMQMc?=
 =?us-ascii?Q?57QR8NCgbJnMDBGx5SHhKBGwKZPLECMp8RAz+kAO6O2E0IQxvTAlo1sKoC7A?=
 =?us-ascii?Q?aPhPrSN3MNCcMye1+0gczoGeL2g0Cee44dMNJyTboDq4Um1M6DUisml0yx9x?=
 =?us-ascii?Q?7nIrVHJWgzqbpM0H4pRmscfZYdToxEz4l1OylMI3xMm08bl0CsuwEOQsNlvU?=
 =?us-ascii?Q?7TmK8tp0HvF9aOkHvgf+WS6/q0ktuyTFmnRmiRnnvG2GDo+KoaLoDGRlqM4R?=
 =?us-ascii?Q?VFMxqhasqrcc1rJFB+cuGHsp+YUlqAg8BaVxEt81dTJadGBBj47fh9ONc2lw?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3bab31-45ae-4712-18b2-08dda35208c8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 10:24:48.9342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++UhnPphi4tbEeL+ViQadsv2sQffeIVvS/qai6gLgTtp4XRlk2ZCxF20DoPbGxPiCkilkdiuGb0OLNE9r5QloxiLLjbNw+UZIZIttArI1Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8294
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

Hi,

On Tue, Jun 03, 2025 at 04:34:45PM -0700, Matthew Brost wrote:
> Add more SVM GT stats which give visibility to where time is spent in
> the SVM page fault handler. Stats include number of faults at a given
> size, total SVM page fault time, migration time in us, copy time in us,
> copy kb, get pages time in us, and bind time in us. Will help in tuning
> SVM for performance.

Any idea about performance impact of collecting this data? Should we put
more behind IS_ENABLED(CONFIG_DEBUG_FS) to limit function jumps?

> 
> v2:
>  - Include local changes
> v3:
>  - Add tlb invalidation + valid page fault + per size copy size stats
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c       |  33 +++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++
>  drivers/gpu/drm/xe/xe_svm.c            | 274 ++++++++++++++++++++++++-
>  3 files changed, 332 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 7e12fc3759e2..8fb43cbb2de4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -29,8 +29,41 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
>  static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  	"svm_pagefault_count",

Maybe this one should be removed to prevent confusion with
svm_*_pagefault_count entries below.

Francois

>  	"tlb_inval_count",
> +	"svm_tlb_inval_count",
> +	"svm_tlb_inval_us",
>  	"vma_pagefault_count",
>  	"vma_pagefault_kb",
> +	"svm_4K_pagefault_count",
> +	"svm_64K_pagefault_count",
> +	"svm_2M_pagefault_count",
> +	"svm_4K_valid_pagefault_count",
> +	"svm_64K_valid_pagefault_count",
> +	"svm_2M_valid_pagefault_count",
> +	"svm_4K_pagefault_us",
> +	"svm_64K_pagefault_us",
> +	"svm_2M_pagefault_us",
> +	"svm_4K_device_copy_count",
> +	"svm_64K_device_copy_count",
> +	"svm_2M_device_copy_count",
> +	"svm_4K_migrate_us",
> +	"svm_64K_migrate_us",
> +	"svm_2M_migrate_us",
> +	"svm_device_copy_us",
> +	"svm_device_2M_copy_us",
> +	"svm_device_64K_copy_us",
> +	"svm_device_4K_copy_us",
> +	"svm_cpu_copy_us",
> +	"svm_cpu_2M_copy_us",
> +	"svm_cpu_64K_copy_us",
> +	"svm_cpu_4K_copy_us",
> +	"svm_device_copy_kb",
> +	"svm_cpu_copy_kb",
> +	"svm_4K_get_pages_us",
> +	"svm_64K_get_pages_us",
> +	"svm_2M_get_pages_us",
> +	"svm_4K_bind_us",
> +	"svm_64K_bind_us",
> +	"svm_2M_bind_us",
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index be3244d7133c..5a92226ef033 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -9,8 +9,41 @@
>  enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_TLB_INVAL,
> +	XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT,
> +	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
> +	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
> +	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
> +	XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_COUNT,
> +	XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_COUNT,
> +	XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_COUNT,
> +	XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
> +	XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
> +	XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
> +	XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> +	XE_GT_STATS_ID_SVM_DEVICE_2M_COPY_US,
> +	XE_GT_STATS_ID_SVM_DEVICE_64K_COPY_US,
> +	XE_GT_STATS_ID_SVM_DEVICE_4K_COPY_US,
> +	XE_GT_STATS_ID_SVM_CPU_COPY_US,
> +	XE_GT_STATS_ID_SVM_CPU_2M_COPY_US,
> +	XE_GT_STATS_ID_SVM_CPU_64K_COPY_US,
> +	XE_GT_STATS_ID_SVM_CPU_4K_COPY_US,
> +	XE_GT_STATS_ID_SVM_DEVICE_COPY_KB,
> +	XE_GT_STATS_ID_SVM_CPU_COPY_KB,
> +	XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
> +	XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
> +	XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> +	XE_GT_STATS_ID_SVM_4K_BIND_US,
> +	XE_GT_STATS_ID_SVM_64K_BIND_US,
> +	XE_GT_STATS_ID_SVM_2M_BIND_US,
>  	/* must be the last entry */
>  	__XE_GT_STATS_NUM_IDS,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f27fb9b588de..cd7c391282a7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -108,6 +108,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>  		   &vm->svm.garbage_collector.work);
>  }
>  
> +static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> +{
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT, 1);
> +}
> +
>  static u8
>  xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  				  const struct mmu_notifier_range *mmu_range,
> @@ -140,6 +145,11 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  	 */
>  	for_each_tile(tile, xe, id)
>  		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> +			if (!(tile_mask & BIT(id))) {
> +				xe_svm_tlb_inval_count_stats_incr(tile->primary_gt);
> +				if (tile->media_gt)
> +					xe_svm_tlb_inval_count_stats_incr(tile->media_gt);
> +			}
>  			tile_mask |= BIT(id);
>  			range->tile_invalidated |= BIT(id);
>  		}
> @@ -161,6 +171,24 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  						   mmu_range);
>  }
>  
> +static s64 xe_svm_stats_ktime_us_delta(ktime_t start)
> +{
> +	return IS_ENABLED(CONFIG_DEBUG_FS) ?
> +		ktime_us_delta(ktime_get(), start) : 0;
> +}
> +
> +static void xe_svm_tlb_inval_us_stats_incr(struct xe_gt *gt, ktime_t start)
> +{
> +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> +
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_US, us_delta);
> +}
> +
> +static ktime_t xe_svm_stats_ktime_get(void)
> +{
> +	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
> +}
> +
>  static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  			      struct drm_gpusvm_notifier *notifier,
>  			      const struct mmu_notifier_range *mmu_range)
> @@ -171,6 +199,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  	struct drm_gpusvm_range *r, *first;
>  	struct xe_gt_tlb_invalidation_fence
>  		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> +	ktime_t start = xe_svm_stats_ktime_get();
>  	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
>  	u8 tile_mask = 0;
>  	u8 id;
> @@ -261,6 +290,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  	r = first;
>  	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
>  		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> +	for_each_tile(tile, xe, id) {
> +		if (tile_mask & BIT(id)) {
> +			xe_svm_tlb_inval_us_stats_incr(tile->primary_gt, start);
> +			if (tile->media_gt)
> +				xe_svm_tlb_inval_us_stats_incr(tile->media_gt, start);
> +		}
> +	}
>  }
>  
>  static int __xe_svm_garbage_collector(struct xe_vm *vm,
> @@ -363,6 +399,60 @@ enum xe_svm_copy_dir {
>  	XE_SVM_COPY_TO_SRAM,
>  };
>  
> +static void xe_svm_copy_kb_stats_incr(struct xe_gt *gt,
> +				      const enum xe_svm_copy_dir dir,
> +				      int kb)
> +{
> +	if (dir == XE_SVM_COPY_TO_VRAM)
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_KB, kb);
> +	else
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_KB, kb);
> +}
> +
> +static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
> +				      const enum xe_svm_copy_dir dir,
> +				      unsigned long npages,
> +				      ktime_t start)
> +{
> +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> +
> +	if (dir == XE_SVM_COPY_TO_VRAM) {
> +		switch (npages) {
> +		case 1:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_4K_COPY_US,
> +					 us_delta);
> +			break;
> +		case 16:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_64K_COPY_US,
> +					 us_delta);
> +			break;
> +		case 512:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_2M_COPY_US,
> +					 us_delta);
> +			break;
> +		}
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
> +				 us_delta);
> +	} else {
> +		switch (npages) {
> +		case 1:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_4K_COPY_US,
> +					 us_delta);
> +			break;
> +		case 16:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_64K_COPY_US,
> +					 us_delta);
> +			break;
> +		case 512:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_2M_COPY_US,
> +					 us_delta);
> +			break;
> +		}
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_US,
> +				 us_delta);
> +	}
> +}
> +
>  static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  		       unsigned long npages, const enum xe_svm_copy_dir dir)
>  {
> @@ -374,6 +464,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  	u64 vram_addr = XE_VRAM_ADDR_INVALID;
>  	int err = 0, pos = 0;
>  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
> +	ktime_t start = xe_svm_stats_ktime_get();
>  
>  	/*
>  	 * This flow is complex: it locates physically contiguous device pages,
> @@ -431,6 +522,9 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  			int incr = (match && last) ? 1 : 0;
>  
>  			if (vram_addr != XE_VRAM_ADDR_INVALID) {
> +				xe_svm_copy_kb_stats_incr(tile->primary_gt,
> +							  dir, (i - pos + incr) *
> +							  (PAGE_SIZE / SZ_1K));
>  				if (sram) {
>  					vm_dbg(&tile->xe->drm,
>  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> @@ -467,6 +561,8 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  
>  			/* Extra mismatched device page, copy it */
>  			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
> +				xe_svm_copy_kb_stats_incr(tile->primary_gt,
> +							  dir, (PAGE_SIZE / SZ_1K));
>  				if (sram) {
>  					vm_dbg(&tile->xe->drm,
>  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> @@ -500,6 +596,13 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  		dma_fence_put(fence);
>  	}
>  
> +	/*
> +	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> +	 * compute always uses the primary GT so accumlate stats on the likely
> +	 * GT of the fault.
> +	 */
> +	xe_svm_copy_us_stats_incr(tile->primary_gt, dir, npages, start);
> +
>  	return err;
>  #undef XE_MIGRATE_CHUNK_SIZE
>  #undef XE_VRAM_ADDR_INVALID
> @@ -828,6 +931,142 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	return true;
>  }
>  
> +static void xe_svm_range_fault_count_stats_incr(struct xe_gt *gt,
> +						struct xe_svm_range *range)
> +{
> +	switch (xe_svm_range_size(range)) {
> +	case SZ_4K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT, 1);
> +		break;
> +	case SZ_64K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT, 1);
> +		break;
> +	case SZ_2M:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT, 1);
> +		break;
> +	}
> +}
> +
> +static void xe_svm_range_valid_fault_count_stats_incr(struct xe_gt *gt,
> +						      struct xe_svm_range *range)
> +{
> +	switch (xe_svm_range_size(range)) {
> +	case SZ_4K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT, 1);
> +		break;
> +	case SZ_64K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT, 1);
> +		break;
> +	case SZ_2M:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT, 1);
> +		break;
> +	}
> +}
> +
> +static void xe_svm_range_fault_copy_count_stats_incr(struct xe_gt *gt,
> +						     struct xe_svm_range *range)
> +{
> +	switch (xe_svm_range_size(range)) {
> +	case SZ_4K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_COUNT, 1);
> +		break;
> +	case SZ_64K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_COUNT, 1);
> +		break;
> +	case SZ_2M:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_COUNT, 1);
> +		break;
> +	}
> +}
> +
> +static void xe_svm_range_migrate_us_stats_incr(struct xe_gt *gt,
> +					       struct xe_svm_range *range,
> +					       ktime_t start)
> +{
> +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> +
> +	switch (xe_svm_range_size(range)) {
> +	case SZ_4K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
> +				 us_delta);
> +		break;
> +	case SZ_64K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
> +				 us_delta);
> +		break;
> +	case SZ_2M:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
> +				 us_delta);
> +		break;
> +	}
> +}
> +
> +static void xe_svm_range_get_pages_us_stats_incr(struct xe_gt *gt,
> +						 struct xe_svm_range *range,
> +						 ktime_t start)
> +{
> +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> +
> +	switch (xe_svm_range_size(range)) {
> +	case SZ_4K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
> +				 us_delta);
> +		break;
> +	case SZ_64K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
> +				 us_delta);
> +		break;
> +	case SZ_2M:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> +				 us_delta);
> +		break;
> +	}
> +}
> +
> +static void xe_svm_range_bind_us_stats_incr(struct xe_gt *gt,
> +					    struct xe_svm_range *range,
> +					    ktime_t start)
> +{
> +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> +
> +	switch (xe_svm_range_size(range)) {
> +	case SZ_4K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_BIND_US,
> +				 us_delta);
> +		break;
> +	case SZ_64K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_BIND_US,
> +				 us_delta);
> +		break;
> +	case SZ_2M:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_BIND_US,
> +				 us_delta);
> +		break;
> +	}
> +}
> +
> +static void xe_svm_range_fault_us_stats_incr(struct xe_gt *gt,
> +					     struct xe_svm_range *range,
> +					     ktime_t start)
> +{
> +	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
> +
> +	switch (xe_svm_range_size(range)) {
> +	case SZ_4K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
> +				 us_delta);
> +		break;
> +	case SZ_64K:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
> +				 us_delta);
> +		break;
> +	case SZ_2M:
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
> +				 us_delta);
> +		break;
> +	}
> +}
> +
>  /**
>   * xe_svm_handle_pagefault() - SVM handle page fault
>   * @vm: The VM.
> @@ -863,6 +1102,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
>  	ktime_t end = 0;
> +	ktime_t start = xe_svm_stats_ktime_get(), bind_start, get_pages_start;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -881,17 +1121,29 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (IS_ERR(range))
>  		return PTR_ERR(range);
>  
> -	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
> -		return -EACCES;
> +	xe_svm_range_fault_count_stats_incr(gt, range);
>  
> -	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> -		return 0;
> +	if (ctx.devmem_only && !range->base.flags.migrate_devmem) {
> +		err = -EACCES;
> +		goto out;
> +	}
> +
> +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
> +		xe_svm_range_valid_fault_count_stats_incr(gt, range);
> +		range_debug(range, "PAGE FAULT - VALID");
> +		goto out;;
> +	}
>  
>  	range_debug(range, "PAGE FAULT");
>  
>  	if (--migrate_try_count >= 0 &&
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> +		ktime_t migrate_start = xe_svm_stats_ktime_get();
> +
> +		xe_svm_range_fault_copy_count_stats_incr(gt, range);
> +
>  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
>  			if (migrate_try_count || !ctx.devmem_only) {
> @@ -908,6 +1160,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		}
>  	}
>  
> +	get_pages_start = xe_svm_stats_ktime_get();
> +
>  	range_debug(range, "GET PAGES");
>  	err = xe_svm_range_get_pages(vm, range, &ctx);
>  	/* Corner where CPU mappings have changed */
> @@ -927,11 +1181,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	}
>  	if (err) {
>  		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> -		goto err_out;
> +		goto out;
>  	}
>  
> +	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
>  	range_debug(range, "PAGE FAULT - BIND");
>  
> +	bind_start = xe_svm_stats_ktime_get();
>  retry_bind:
>  	drm_exec_init(&exec, 0, 0);
>  	drm_exec_until_all_locked(&exec) {
> @@ -939,7 +1195,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		drm_exec_retry_on_contention(&exec);
>  		if (err) {
>  			drm_exec_fini(&exec);
> -			goto err_out;
> +			goto out;
>  		}
>  
>  		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> @@ -953,15 +1209,17 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			}
>  			if (xe_vm_validate_should_retry(&exec, err, &end))
>  				goto retry_bind;
> -			goto err_out;
> +			goto out;
>  		}
>  	}
>  	drm_exec_fini(&exec);
>  
>  	dma_fence_wait(fence, false);
>  	dma_fence_put(fence);
> +	xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
>  
> -err_out:
> +out:
> +	xe_svm_range_fault_us_stats_incr(gt, range, start);
>  
>  	return err;
>  }
> -- 
> 2.34.1
> 
