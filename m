Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B59C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 20:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F5A10EAC1;
	Wed, 26 Aug 2026 20:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Md76VqxB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F7B10EAC1
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 20:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787775042; x=1819311042;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GgHJpBB0ypE0DYw2v2rHy2cJKQJnXJdlpXOU1AVU3HY=;
 b=Md76VqxBsPZuRPm0oxc9mm1JoxAy1ZFl1nhOeNMsQllC3d2QYWc8TbjU
 a+JKEqPE254G7roAxLXFpd8gDtI9q9maA0khEYAF7zCTgxXwwq4t2t5+S
 mNaSuN7Gu3dragRgjf6rHLIhE0hKXbJQBM2Jfmj7l9x5y4naTkyFUWETx
 ZuMDdY3X+mmWWJ1tkS5Xjgk4jaamAIz9/PcPxnpFXMsXbiILN+7klE72k
 jysW+sz7d8pzNO67YxJPq+tAbXLRLd4AAJXENOTgIJTy5xXO2ck4Ex0M4
 kDuNiFsFMOHOOBP5oWsAcmLBWtWxA+RT0D+ZQgQgeCMicHr7pozouB0CF A==;
X-CSE-ConnectionGUID: Dur9BBs4SAS8SU3GWxldRw==
X-CSE-MsgGUID: MswYIoRjRp2HD5okgZGWXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88124003"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88124003"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:10:41 -0700
X-CSE-ConnectionGUID: fyMTukF0Q2uECt4XzEi4Cw==
X-CSE-MsgGUID: 3TtWuFtRRHe4nNTkSGc+xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="297560113"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:10:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 13:10:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 13:10:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 13:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDg8ywqrJIhW7Hhb1qEapI0QYSscCAm/z9KmzObyLR8n9kNZ3mhdmSPMTuekt8n94ff+6vQjmHL286kFVREP9hZK6zawNghVUQrBeDFulzcBvHK+1dyURCVs/fB+/CSB9nTtvNof9SZWQU+7gkD82SktFc3+B82yp9rkNosoFTlokN0+BDVxo5YKlkh651+P1fxqg/z2PifsaaAHGy0zFLZybmIQOlikqVdW7RO72kbjDav6VHqJupxyKREi5Kn0OjxrlHpooOX+yQT77oSvFVXuubXewa+MLB5FAUHXhPl0MeK+butIfUg64DKHtcEn2LawxxzvkJmVsudYOyzy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHKl8XEslxT6NwCBO9xFigSUEJRhKpJKTr6izKvAX3c=;
 b=GjQfsjHMtc+TvlmUKvaSG++Q/XAlC4DxV51fFt8iqzsXcjkF/OVDwQJGA5F2In2gnNjQlj4FN+D9MgzkUfh83x67xcM0/E/DRhgiqJJiGplTzeSlcuhVmx+AwwH/3N4g5mZ2NWyTC+8Guszo0QYvpDFX+d32kDOMVDuUS7MtUmDjIq2JsfAH21w7H8N4zcik5qM+9thXeW8GnmHxb04FbCpNtAYKF2anD1BEw6heiaY4FZmnsPWAkYP4cvBheawPCqkNnj3/JhDayuLMErz9ln4htvyfVY1c4z0qhYKPklZU0rn6SFLP7GQ1BCG59Cr8mBC2kwQgZ5V+kQuFCOPzjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7542.namprd11.prod.outlook.com (2603:10b6:510:28b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 20:10:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 20:10:36 +0000
Date: Wed, 26 Aug 2026 13:10:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <niranjana.vishwanathapura@intel.com>, <matthew.brost@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/ggtt: fault on unmapped GGTT for multi-queue
 platforms
Message-ID: <20260826201034.GL681121@mdroper-desk1.amr.corp.intel.com>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826112533.3289978-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260826112533.3289978-2-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 134c26a7-749e-4001-bdfa-08df03ae1788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|3023799007|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bsgDbsHRynMXCzjrKpd41GfgP8/e+YBu+gOgm9zfPDr5jKWG0IH50xczM157QGcypTbGCSUFEZrr2D6wh6pbXjgbLag2Y3YwGuBxQZGxzLDnYTuN12Biroo5feLq3841uSpwL4ZUzze2IXcXPSPnJnrJ63WvuCvMb/JCov04bSxr9f3xZmX2TpSx3Tw+FTvzKjBgK+kv2zTNGLfdkJvnvV8NN9nPOuk12T1FzuPQyx3wbU2AjRkIhH4yWjPZSW0xpy2SxjvdjJJjghfNUA8Gv7Vs0+TK04+vlcCqywJtaGIqim20IRXTF+OTxUPMHeuJKQORrekq9W/qM4aMq3K4D04w7WcC7HLsAcdcn23yDeQ3Vz/AjQVmW2Ge7BtieGPt7OjEFxsIYDQNcF1UX4ywWnR9MdlhRSQH7u4B/vXm6pv21TuP8igWo+1X8KqSn/Wf4P97xoqKzZDrliNE7hAH03cEyz6uREnZF1fGvoVioVW11ricreoTvZeUIZBB8BAG0nxzJEVW4irD3Y/ML01C3GJ5U3ouxXyrqFmXlVbfj5PnR2si6iO/5SZQPqbhWoT7pXKByztnoux9gFOtmkrmPKbwkuypDgi4CCBvquhIOTRHRKsavkRYl8ImAD6YpU5WxNRmy1L9Bww56HFIsZJsARve3pb+xci2W67VlRNRuZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YWsRSoMslsbsihiGyTjnShR91IVKzjCW0IROWWnOE6Cn0dLskqD0grmncudU?=
 =?us-ascii?Q?FCPmmwNuGxIluJaa0pmSvxfmNWCtNMwbrYrFItos1RfwEehB1PTyO3EkwftQ?=
 =?us-ascii?Q?oNV6U2sAk7TjRHuaEjRe/Nijk8QIssgII/fumQYYP3fTSNUtUwOa2SN9yGTK?=
 =?us-ascii?Q?fnXWGXfDHbyzIHwUjLLyuKJ+biN82z6vDkaHYqNeQO95SB2Zq2vx/M3nV3ZA?=
 =?us-ascii?Q?APIBHyUUqKrbrMGEJtI2UQHuePJYDJziuKcO3dicY/Rcsdzb3hjMapHtPxVD?=
 =?us-ascii?Q?e4mY0D0VboGqD6J2+jYECEXgip1GsgIFoEXN0e1+oY/RGkx4aDNs6mlSkGkb?=
 =?us-ascii?Q?4JbJwYQtMNrUigXa9Xuu3c2PSmjbkXXiH005jqkWIiD99wF38myOEdMjAIBF?=
 =?us-ascii?Q?ErGWNDTvZ7Z/I1rqHI8mqPr45NFfda4kgRmmmj8zA+SXy0ro0OcioGKmsLFN?=
 =?us-ascii?Q?8b2PbsgK7vJwgNiOhret/GsF007I8m23BiZeR5onf0cB73UUdqApwBbQED/+?=
 =?us-ascii?Q?Yq1icpHpQBLxf72mmolxUUnZZrkgv4kH7LNWKz6hsKn00KfXIqFEyzXeZ2Cv?=
 =?us-ascii?Q?n4mtF1IFRrU8HuFpWME7jS7KW1FcMlt0q48vXvUwKNPKqnwW2VujFWTc95H7?=
 =?us-ascii?Q?HX7KSOadabYH6FwXI7qtrbIpowMLd1fijb4oMBT5cnDnZSEVPUU6CGnJxcow?=
 =?us-ascii?Q?AbMBwGRlnzgUM1G+g9Zf4vvMoUXYd0RPhOJVgZQBhcSnd5I4QU+7wEQ7CpWp?=
 =?us-ascii?Q?aJmhGAqFHlPasbib4MKZ8bsaXAzVYq9K9khwPSJVZdfl6MxkyT3iKWtTVWZI?=
 =?us-ascii?Q?gVyimSRKp1tFCik4wXTN0e39kp/vH1dNqeZRAiLK7tlbvjqzkW5tH2AlF+FT?=
 =?us-ascii?Q?WPr6GuH6Zq99KFRkkiylmnUPKGJ10NOoLm7WLHsawDkj/52g8O8H/Zlh+8Lx?=
 =?us-ascii?Q?2pnIcJZTipxZa84GY9YcbJhdTLONBvhKg38rTxXeD4BvEr9FwFhWvAacAqJg?=
 =?us-ascii?Q?Tu5OA+GeVSaEf3K9rou5ZxXaR8Ms3Pxn1gD++f2Li/ykDwX9mVpqNkidstFD?=
 =?us-ascii?Q?/Zr+bIOzQnaXn5zEh7x5iy45tne0ZwsXvmN55Xrk7k7Dpb0KoGTLXZtDwujd?=
 =?us-ascii?Q?eafU0C+JvqJEXG36dYZenDCGcSL7vJ9wj5pf4lVHnSBuusO6kduMWjPYe7rh?=
 =?us-ascii?Q?kauANdkXJX6LtbTcRWbGCOTlDhKB72PXJ61D2g/5Ec7mtj6mc3joINZfT0lo?=
 =?us-ascii?Q?7yRIAXh+vVhMLBOqUCeWBG+d2BXw8jZPvPBAqTskjyf6Rg86YUrYjFTln65U?=
 =?us-ascii?Q?4LZD+bRZHUaxXs8pnSIio8ijAsP3b81ve5qawck48oJt0r3JRfFR/gdvZ3ve?=
 =?us-ascii?Q?fL6C8rXlFk3yomV/Zzc0zbH2K0C3C1NImbVPSpOwi2ALCPqsup6SbUkdBXMX?=
 =?us-ascii?Q?Kpa7b/6dx1q2JZHaNITfcm15jtKDEoH+mL7Bxkmq+XVjlcgJKut8+wtIPF1D?=
 =?us-ascii?Q?mBhrO26Gl4tA4dwpvmgJWyDbPsm7sDThyF2PSEYZkzgFkglu9/d8p1qV7x1o?=
 =?us-ascii?Q?HhiZazBm/u7VhjGNEBQADXvkr3ws2IVBmExNHSQZrchOrktH0YYrqbs7zE85?=
 =?us-ascii?Q?capYNUs6g3X1ch97DTunlx2FWKfmQVIK34JKvDVLyW8YPochDHt/dNbAXp/4?=
 =?us-ascii?Q?X7zUyorMzJTyvYk3Je8hLVVnQraXxruWZK/MVfXzqQjikutsgTvXuQAEGyOw?=
 =?us-ascii?Q?em2WgQ4bS9j99VOU5lUK9LE3NTg5/H8=3D?=
X-Exchange-RoutingPolicyChecked: 5iaA/TAKsAo5yc+CmeqvvKnSWGcbQjJe5PJimr0A33nD/BvyeKlG+BUNFIjNh4DhVk3qKsdinvCar+EKvjOw/QWiXRNBSV/EUukE7v09dgow6W0M2KEv212BKEFAPCXskelV8yK5mF9GtH/UEEsyZaESrP/DSwuMoD6BCHvqSAmj1xpJ15q3NhwgbVUlXD9Xacity2yZjht/Twzi5o5sNu/miyqH0PMlLBT4TrM0d4vfeolzE6DaMgdIMe7h7U7PpOkrnRc56ArXkh3pZXNmb8oiRD5i5nrOxDn6uCUpV9w5yVJZGIl4CttsIzEv9/nUZ3e4MPnG0AaebVgUYL13AA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 134c26a7-749e-4001-bdfa-08df03ae1788
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 20:10:36.5753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuDEVPkwbNXPB9TbsSz4WIlC4lc5BYB9aN5Ef3z+lZbSHoiT+kIgEIsc0ZXY45dqypRITD0EWB24LAki+Y+Zd0ue9mCujMOTsoFkSY/85P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7542
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

On Wed, Aug 26, 2026 at 04:55:31PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> 
> On multi-queue platforms an engine can retain a stale GGTT TLB entry
> for a range that has since been unmapped and recycled. When unmapped
> GGTT entries resolve to the scratch page, such a stale access lands on
> scratch silently instead of faulting, masking the error.

Drive-by question; I haven't reviewed the changes in depth.  How does
multi-queue relate to GGTT here?  Multi-queue submission is something
userspace can do, but those userspace submissions can't access the GGTT,
only the PPGTT.  GGTT accesses would only come from privileged
instructions that the KMD inserts into the ring and I don't think those
are ever multi-queue.  Am I overlooking something?  It seems like GGTT
and multi-queue should be orthogonal.


Matt

> 
> On multi-queue platforms, skip allocating the GGTT scratch page so
> cleared and unmapped ranges hold PTE=0. The whole GGTT then
> consistently faults on unmapped access for the entire boot; other
> platforms keep the scratch page and are unaffected.
> 
> v2:
> - Add xe_gt_has_multi_queue() helper and address nits (Niranjana)
> v3:
> - Drop scratch entirely instead of toggling per-unmap (Matt Brost)
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 39 ++++++++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_gt.h   | 13 ++++++++++++
>  2 files changed, 37 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ec23862477f..bd65100283e3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -20,6 +20,7 @@
>  #include "regs/xe_regs.h"
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> +#include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_map.h"
> @@ -533,27 +534,35 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
>  int xe_ggtt_init(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	unsigned int flags;
>  	int err;
>  
>  	/*
> -	 * So we don't need to worry about 64K GGTT layout when dealing with
> -	 * scratch entries, rather keep the scratch page in system memory on
> -	 * platforms where 64K pages are needed for VRAM.
> +	 * Multi-queue platforms leave unmapped GGTT faulting (no scratch) so a
> +	 * stale engine TLB entry can't silently resolve to the scratch page.
>  	 */
> -	flags = 0;
> -	if (ggtt->flags & XE_GGTT_FLAGS_64K)
> -		flags |= XE_BO_FLAG_SYSTEM;
> -	else
> -		flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
> +	if (!xe_gt_has_multi_queue(ggtt->tile->primary_gt)) {
> +		unsigned int flags = 0;
> +
> +		/*
> +		 * So we don't need to worry about 64K GGTT layout when dealing
> +		 * with scratch entries, rather keep the scratch page in system
> +		 * memory on platforms where 64K pages are needed for VRAM.
> +		 */
> +		if (ggtt->flags & XE_GGTT_FLAGS_64K)
> +			flags |= XE_BO_FLAG_SYSTEM;
> +		else
> +			flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
>  
> -	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
> -	if (IS_ERR(ggtt->scratch)) {
> -		err = PTR_ERR(ggtt->scratch);
> -		goto err;
> -	}
> +		ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile,
> +							     XE_PAGE_SIZE, flags);
> +		if (IS_ERR(ggtt->scratch)) {
> +			err = PTR_ERR(ggtt->scratch);
> +			goto err;
> +		}
>  
> -	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, xe_bo_size(ggtt->scratch));
> +		xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0,
> +			      xe_bo_size(ggtt->scratch));
> +	}
>  
>  	xe_ggtt_initial_clear(ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 65a4655b0994..92d934d50244 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -160,4 +160,17 @@ static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
>  	return gt->info.multi_queue_engine_class_mask & BIT(class);
>  }
>  
> +/**
> + * xe_gt_has_multi_queue() - Check if gt supports multi-queue on
> + * any engine class.
> + *
> + * @gt: the GT object (may be NULL)
> + *
> + * Return: true if any engine class on @gt supports multi queue, else false
> + */
> +static inline bool xe_gt_has_multi_queue(const struct xe_gt *gt)
> +{
> +	return gt && gt->info.multi_queue_engine_class_mask;
> +}
> +
>  #endif
> -- 
> 2.46.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
