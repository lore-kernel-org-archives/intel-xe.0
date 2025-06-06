Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE14CC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 23:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713AD10EAFD;
	Fri,  6 Jun 2025 23:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0oKcgY3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0493D10EB7D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 23:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749252831; x=1780788831;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+KOisvLXzOJ8fvWLkrm9yZWkwocRqDl2vfAA2gBoTpU=;
 b=M0oKcgY3yg3IqaL+vOnxClLjIqgneVsjnZBiJkXDT0BgEFwyNHUbSVlu
 +o/cSxr3uLeArFeRX4Qlq/OOkiiGqbwWpcROvXsWOJjLZ+qhorb1kwOOs
 fbOdnyrNOfazyfMg1xHZaZeeEarNar1ZgSomGLO0WhGYDFOoht7qGC0ck
 emLkHHIk0x8TCvVdtvw5fXPf+w/P3uoOQMWlw//tGkxexctDQ9W30kU0G
 fYECkmCMxVVJbDnwxKm+AcV0ET+WH2FTi6lP0zz8NMaIBT7RuGrcLudFk
 mL3DC9ZsvRq4hoJzxjRrLtMKJ1bz1M2aQQ/c86cXotfYStjjjyn9Mr4Uv A==;
X-CSE-ConnectionGUID: tcvKbL8ESr6+nJ0KJUnHTA==
X-CSE-MsgGUID: A5iR2KfGTp2JPYizD39YGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68859015"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="68859015"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 16:33:50 -0700
X-CSE-ConnectionGUID: 1tYkxFnFQBaN4B3VluCkZQ==
X-CSE-MsgGUID: ZoRlVYlgTM68aNF+I0mpNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="146471374"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 16:33:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 16:33:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 16:33:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.58)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 16:33:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I60GXr42zQouPaN2kXzcvlEGZtpOXNhYTFlNOgd50QqQPOxupNOTwB4uL77hvAngR8dZLI8mLWI45o//Wld15SXOL41A+FXo8BIqnlBah5JmMMsHlnOWlpBcibEmAAFV9re9EUV5qFeCwm1TE09ahiaZyPKxYi6NcaKeBiJ078JE9FLJSZg0VnvOeSsjBSPcsASjtGL4BcMkfeEdgGV4ZKVRNB2L9O3vcc010Anz8kfVSCyMAexqavDTtBRMAftBnix83pUDeoVmYmtdpZV5wfKX7LX0oZ34wn0wlXgJxxqpbvSmrsR8ckrtUNmppi5mH/nSwEVJNwWcbhsLfviE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3W+2z8ka1T8Jug1yy+LYHs9YTMRwLSlmYig0LCPFgAU=;
 b=zG7/nfdgA5fvBxPScMyreXY7YYT+sHVzpXrlLqsw1irY6siMfB0sj2c/4bfLOokddQlEzRknH+NshgqrKMyqkqMU5Kbs9RMxOjFeuoZJOLLu+IeKIRsDTR2GSWp7E8l5sRP+nZUPVVt+7YjRJodtABj1XlbA+l4OkfomV7GHaxL/Y/DKbgyCicbtZcNBeHcyh3T+pBPqw27qUtasZWIaZ4PQZlsPq4D9D3XmFbIwDZcUkOI8f9UI4hp5eR1fAqe/gLrnYmtcBwsFjdPLx3Gw61w8B3lE5PCqGBDwB2ywZDB/+MwhIl5uGg4a0sBujqYBfufP6bxsX3zu/cHVfahbOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 23:33:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 23:33:44 +0000
Date: Fri, 6 Jun 2025 18:33:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH] drm/xe: Fix early wedge on GuC load failure
Message-ID: <rdxw5wg55eu2h6spzwenrnlz4dgqdjg33pllk2i4udylp73cpk@3me4w4putga2>
References: <20250605222256.804888-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250605222256.804888-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 71636c9d-4c59-46c9-8870-08dda5529389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3wWcF+MaNlHJ3OXGaxxfwXFTlpI+Qkm+Lep2lClQYfu3j+YodA6+Bb3SSr2h?=
 =?us-ascii?Q?4WnqYHOS9Nx6PmOn+slbp15P+MTVbPNSI1PuczDEKE29QB+wj/KhTTKl3dLk?=
 =?us-ascii?Q?4ubd5tRA5vdO9tbvVM8cFKeZehhgXcWGkegBINkA5HaMJ2DsyA21ea17uoYh?=
 =?us-ascii?Q?jF17kwKD6sFdQ2TymzkUfjP8NUP5Bxyin4+BPL0SDCcsPuTRET+2fjXSPYJe?=
 =?us-ascii?Q?uMC0FsxacogP1xEAnUwvfBKtS7vY7DoJWbGGyk7cJ1StHMLfKoJsls/GB6YC?=
 =?us-ascii?Q?Hg/nC+LrcbvYQrLYQPBAix4C21IqQdXloivOh/KFIpCOZFECqvQoT1a2RiCQ?=
 =?us-ascii?Q?l0t01xiyzdYXX9/bHppPE64znyVkcq8bFPLd0u8b7tFzie0cVDjyqaUDf+Jc?=
 =?us-ascii?Q?t4KndunAoLkGZzDXHKehwiCQfm6z/gr2k47sT6BTYZcxCDZi7XBoIs4UZ5CY?=
 =?us-ascii?Q?L2RjkINsbj4uxGvPDMUdv2Sf9QVzUhTi6tLrEIGIclN5yh1eoh9JrUB/nxwb?=
 =?us-ascii?Q?973DjFmKEg4cuXxPFEz+y3IBUSnesYb8vaH8pju00uOmZtX3ChNVZlGmZS4s?=
 =?us-ascii?Q?7jn6YOos+pRvytRsiNowQd4WCoK5u8fuzR8bt+EjlOwTgvw4NzAKAQ76j2Jh?=
 =?us-ascii?Q?ije4rZiKXimXRjlaJ6DbNaFyxkIekz8GTftrI2nj1ZU+RGRzijGnYpW5uYE/?=
 =?us-ascii?Q?74kENC7wOBmuWWewyya9HDRSFMH1TgS/NLkBi0fMEx8umUn0DTyFYXJfgjnJ?=
 =?us-ascii?Q?xOuumSq66nRLRs3PtIEOLXuQMmKvyJpo6wCErukugwXmyZm5JkJQpIfHswoM?=
 =?us-ascii?Q?4we+NuKFSu17Lh6iWmmBidGnvUafmJvp99EyC0b1mrEZsKd1lVaZxddA8kRf?=
 =?us-ascii?Q?+/HcYGBj9aer9zysh+3t/yJbu+X/ink/xTc8BevSXYKfnHDNlqGjTpyAIxrn?=
 =?us-ascii?Q?xWt/v2+pHUieD2EOa7/dVTVJ5yy383CBwq3egaNKlf+OLD+fe1pcDRK5e2zs?=
 =?us-ascii?Q?je7OrbWaYCrZ2sqXqTR2SczHgtW80wCyarP9ezp0GjuSqObB/c9QnwV6TxGC?=
 =?us-ascii?Q?4HleVpWCF8Hy7huaJepyBHUbwQ9G9QDGPzC2xAz9XYcsezgQKmor3aAiMGDq?=
 =?us-ascii?Q?BiRHcBRxeWofuVwK9w1k9Jn/KImOD6iqvdJclW6bLggpk15aq7bm288Tsh/h?=
 =?us-ascii?Q?jxZ45z3Pll6Wl4CQkPmtA71zdCH8dR6wKn1WR7eOJob3IG73Oo/AwUyhkxaY?=
 =?us-ascii?Q?3CIbR5kH9Aet2vdlzfx7zB6E4X6qzodNRj6poE3iaqcDer1VeG1fwheMox3U?=
 =?us-ascii?Q?RJyFZ32PciAkxWMolnoOIMgyC/cZimTVWVhDz6JqCEkXwARLUXM/clVCel0M?=
 =?us-ascii?Q?WNmtHzaWysmkSi33aH0kC984JiEVBdKKpJOVAxW/K50k7aJibM7GdQOrJ8mt?=
 =?us-ascii?Q?SnXZzU6m2Gs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1jn3lD/PuigSKi5RcrQ3VUNWmPrL0inWaMI5vZXGOfVxw6zk4yn5G/l7CM1L?=
 =?us-ascii?Q?V9Qa57uYGGa6FqgDEJaPfkmtgQid4Hc3UrSHcmniztNBvLCKInIBF5uE1M7c?=
 =?us-ascii?Q?bGcLzdjP9oOLdh6BmwS+4H/RwDOPiYKwgZrOwIeAU4eohJkEQfqYGf20IBhn?=
 =?us-ascii?Q?6lfUoIfX5yd0Et0L1eGKeOmtQlzXKo4RpNgiyj6L2LAplgTT0xXg5WpxOb2N?=
 =?us-ascii?Q?2PMzLIjvmfd0YdhIq/4wSw1NCfVxVfHeUdzO8iDTDk6y4FVL1fNATcQjkku1?=
 =?us-ascii?Q?J+oF2+gpiA/U7Lp5sTkRQWjy8fo1Re62P/TH1IvAVV9lTDnYwIj1WeaX5mcJ?=
 =?us-ascii?Q?TQgtNzFtPEIPXLIubAxj34UNaBJAx4rkljTTvyL9yrldWh0Vy8QQU7JDTb8O?=
 =?us-ascii?Q?hMNpUPDlaRyghEHWPHu7QEm2hMdzfAZMeM6AN61T04Tw1DqHd73dI+VSN+YJ?=
 =?us-ascii?Q?PnWXJo9E+iENbRmY6ujbD0V/sAivChufcOYJeyPt8Ypp1iVp0nianJDSYTwJ?=
 =?us-ascii?Q?ZoUxtVoYJgNqmWU7GM8eCqKzDI8T7Exx6zj/aofcYXrrtrpr6139QaK+zpcT?=
 =?us-ascii?Q?Se2F26ZxqVRGVAa6qOEmqtroUcY9b78GgOUo+3PL97LC1K6ZZ0+uokmv5uIh?=
 =?us-ascii?Q?gcePMASjYZJFIDUvYr0G/P9RtUkyKixzSWCscz5X+wzkfIn2c94ehogzLu5h?=
 =?us-ascii?Q?rJbC/zGefDFXw5NUFmcEkDrUuN2yzXG9cXCO1r5upy2HGu+NRY+0enDFmsh/?=
 =?us-ascii?Q?58/XKB4WV3FVHJvXfXIIzLSUEwQM2iM33sJvlFukWFbBqFtUrXtos0eGHrP+?=
 =?us-ascii?Q?kr7Q4nYzYt1MlVkk3R1Pp1/TqZ5QJ2I2DDybSOkt2YmdfQZ5th1vW82MruaF?=
 =?us-ascii?Q?pPBL7SDM5v04lRkxW3IctsC9Xkqd2dBKSYGqJ8RM9ovPMNINsnMTGo/+LIXi?=
 =?us-ascii?Q?KuMiwD0aYApAR5y7oqg+lFv2UfVAB39pN1CBrvZUVmdmhbxhoCWn/o6g3U3x?=
 =?us-ascii?Q?YnqANUdxRMQayvaH604E2PaJKCsL1bdbde7e5O3W6/hJk01FhzGX/1ckm0qq?=
 =?us-ascii?Q?TCSCtSx2LPwYoowdfuNfEmKlqC+vTrGeFfqadVjOSrEep56duflHsCuuUhgx?=
 =?us-ascii?Q?8nQgAHTo1u0ohg+RqR5HIr4cokXEvONpX+GjOz7mePhkEYN2MUa72BhLP4zP?=
 =?us-ascii?Q?aa5q3zA68zURCJIJA1bNE8bDZvh3pPqsi/kzTs48nRCwggL/NmHc5eKaJN75?=
 =?us-ascii?Q?qb1yPY/oQetJOvdkFuzLZJrOfAcKo8E6QlP67mD+Z+hylf8oMtMMF8sVDBiX?=
 =?us-ascii?Q?MjMEPIQqNX+ooDnvzoW9GxqvjX+fLsCnnp+RPQFZhmEnFXWIP2//mAqRvbxb?=
 =?us-ascii?Q?31J3OtL9d8/vpdZd9J33vY7xi2cgDIkdY/O0uJNnjvTtmSQ8gXyP/XliFZdH?=
 =?us-ascii?Q?wXVmih1quxU04SHOb/5ked1BhAKAJHKeCUs8kg4/hQWTqYrAA6tHWMhbcbte?=
 =?us-ascii?Q?0ffzM82qfoHmPbjwFnl5X0TOxFgd1LjViPMu63W5BI4Nf59qMN/EnvidU5UU?=
 =?us-ascii?Q?yviRR50mvrB46WGcyMoB54Tl6kr2ht0Vgw4cGryCw434tsX2eTAoQFMDtLKV?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71636c9d-4c59-46c9-8870-08dda5529389
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 23:33:43.9885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivRN6RDg7tKVu0ClE4JSDEfBVHgWpRw6vuTLISLLROlG9JbwXFvvQKqyh1hH9e29R1Ss3s2lnJxDJmxgosk9sF9ZwJCvXS3A/QHTe06BjSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9129
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

On Thu, Jun 05, 2025 at 03:22:57PM -0700, Daniele Ceraolo Spurio wrote:
>When the GuC fails to load we declare the device wedged. However, the
>very first GuC load attempt on GT0 (from xe_gt_init_hwconfig) is done
>before the GT1 GuC objects are initialized, so things go bad when the
>wedge code attempts to cleanup GT1. To fix this, check the initialization
>status in the functions called during wedge.
>
>Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Zhanjun Dong <zhanjun.dong@intel.com>
>---
>
>Note that this patch depends on another fix in the same area:
>	1e1981b16bb1 ("drm/xe: Fix taking invalid lock on wedge")
>
>which however was merged without a fixes tag. Not sure if we need to
>propagate that one through fixes manually before this one, or if we can
>just fix it when this one fails to build in the fixes tree.

Since this will then need to go to stable, we can Cc stable in this
patch and then mark that other one as required, so both go back to 6.12.
At the time of merging/writing that patch I didn't think a wedge on
early init would deserve a backport since it doesn't/shouldn't happen
outside of our dev systems. Better safe than sorry though.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
> drivers/gpu/drm/xe/xe_guc_ct.c              | 7 +++++--
> drivers/gpu/drm/xe/xe_guc_ct.h              | 5 +++++
> drivers/gpu/drm/xe/xe_guc_submit.c          | 3 +++
> 4 files changed, 21 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>index 084cbdeba8ea..e1362e608146 100644
>--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>@@ -137,6 +137,14 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
> 	struct xe_gt_tlb_invalidation_fence *fence, *next;
> 	int pending_seqno;
>
>+	/*
>+	 * we can get here before the CTs are even initialized if we're wedging
>+	 * very early, in which case there are not going to be any pending
>+	 * fences so we can bail immediately.
>+	 */
>+	if (!xe_guc_ct_initialized(&gt->uc.guc.ct))
>+		return;
>+
> 	/*
> 	 * CT channel is already disabled at this point. No new TLB requests can
> 	 * appear.
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index 822f4c33f730..e303fec18174 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -517,6 +517,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct)
>  */
> void xe_guc_ct_stop(struct xe_guc_ct *ct)
> {
>+	if (!xe_guc_ct_initialized(ct))
>+		return;
>+
> 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
> 	stop_g2h_handler(ct);
> }
>@@ -788,7 +791,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> 	u16 seqno;
> 	int ret;
>
>-	xe_gt_assert(gt, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
>+	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
> 	xe_gt_assert(gt, !g2h_len || !g2h_fence);
> 	xe_gt_assert(gt, !num_g2h || !g2h_fence);
> 	xe_gt_assert(gt, !g2h_len || num_g2h);
>@@ -1424,7 +1427,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> 	u32 action;
> 	u32 *hxg;
>
>-	xe_gt_assert(gt, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
>+	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
> 	lockdep_assert_held(&ct->fast_lock);
>
> 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>index 5649bda82823..99c5dec446f2 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.h
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>@@ -24,6 +24,11 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>
> void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
>
>+static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
>+{
>+	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
>+}
>+
> static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> {
> 	return ct->state == XE_GUC_CT_STATE_ENABLED;
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 26acc3d91e68..408eeeb78a0b 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1765,6 +1765,9 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> {
> 	int ret;
>
>+	if (!guc->submission_state.initialized)
>+		return 0;
>+
> 	/*
> 	 * Using an atomic here rather than submission_state.lock as this
> 	 * function can be called while holding the CT lock (engine reset
>-- 
>2.43.0
>
