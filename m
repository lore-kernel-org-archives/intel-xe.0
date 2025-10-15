Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C0FCCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 21:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467C410E0DA;
	Wed, 15 Oct 2025 21:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgwNeGTk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF5110E0DA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760565195; x=1792101195;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QEzP1XcgtDkkV2aR6rou8+exXu4tF4WaGHUX3dOfVpk=;
 b=NgwNeGTkg3v0H49I0B8LpcvZWVbp+wSUYR7xfVvwE+OOhsnBhrageIVd
 lyoeg2Ua4pvwpje+DbzXD252b/jgCqp76Y9zy/O/EGapbQH3cBzuDalZM
 BWhOWXODu+nCIEPAZWIiu/hNCJLdPczTMwrxfUu8ZofqQJTy3pedErWo0
 ruV7uapyfio5E2XkdxC+hC/kcF5jcSg+KWKL4YZIsHZ/0hjbcBgdY0oRT
 WzaNyq++mg6q2WYNPgUVEV61G8Z7pM553/+Wxwj8Ahrxr1sFkPSmXQp41
 hd6LsjljFqnnCf6IfJ1P/EUUluHZHgIFlOIsvS+mVoWpdLKft4BuZsSRv w==;
X-CSE-ConnectionGUID: TefPGhD4Q36BDstU8dhSjg==
X-CSE-MsgGUID: 2ebpwcy8Rme4+TMMJ0+qpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73029311"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73029311"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 14:53:15 -0700
X-CSE-ConnectionGUID: 70UYGR28QBuzufpMkbs0RQ==
X-CSE-MsgGUID: BlDk6tduR2u1fJcMRi/STw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182074172"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 14:53:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 14:53:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 14:53:14 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 14:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7du0U2e2JCndsp+b7P0ULIjhwMuYKPGEyBwfhNCvDtjWGrw77jKbJdG00Z1vWG8udk8Q9xLXPnZoi4Aw1PUOqr2ZjQYSNl79RJUgB4sgDbalGWyw7fUB9kIzXSwBilRZLz9BBqYAgeEB/3tirJevf7bmhNXxhkj2DvzmCK7MyVRtRe59qwnPZ62JSoqMCqJ85DzxNfLG886UhiqTaFkla9mQJb7OhAZFAoOfVs0c8EBhS5Uf11c5Zn8JIV9gQF1SLKTaMsEPWxRgjcD/qSahImEMRJtNEz4sQn8extfWAK0uLfExg/6DBZYdJiPnwj1iW+OKpV4pFKRhXd+lYZzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Siz/6z7/wyV1rzAti2ihkdtVwNGAtCSdQ3rnSlhEzgI=;
 b=U2wZGbeS67UCiWr2tQAl/4gCNvH8ECoLBcrXbmMVrCcDGhtIFaXL3cA40WfsBwdoCYuaqupYbtfvcpk55J/gTjFk+tGY7++OX984NzObkRAWfD3N6sLxmHD0TaewscBL0u6HntHqbPT385LPin2wm1OWRvvPwSCkJYpKrXkq8+1l6W/88Vq4YcEK7F33Y9og55Fbh/Zul2R8IBVlDIuu1J6NMkMf5tDzMAlHuOiwZbDl/4U+uAmUjW6K0jq5tq0by8AALP9g1x2iueA80h8xQLqgnKQGt4pZZG5YAhQhPJGCqJnDzGIQvq0yRbP3lzUQv9+moEQobgb4MuaKKZ6EqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 21:53:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 21:53:12 +0000
Date: Wed, 15 Oct 2025 14:53:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 04/12] drm/xe/display: Avoid dereferencing xe_ggtt_node
Message-ID: <aPAXxYOKf7d32SvG@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-18-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015074708.1654014-18-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0086.namprd04.prod.outlook.com
 (2603:10b6:303:6b::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4998:EE_
X-MS-Office365-Filtering-Correlation-Id: 603c6764-975d-4e8d-2129-08de0c353c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7jHXlvmh3FKhGDomKAYgWKA8VwDUYkW98Kdfbo4iDgk/OXqEtXHGueyJDvU/?=
 =?us-ascii?Q?WerTczh8e+2gNlHsxXdLDR907GkPh9IfR3IJknlVAfuDJnwhGkA+ZCYGFJoQ?=
 =?us-ascii?Q?rrnuwScnhdUMdzoYSJr7nPZ09YeqLOhW8VPLRGakfUgUci+ZGhABS4Y9P9Ea?=
 =?us-ascii?Q?uPdYWhSOgkV994DS2Q7o/ZvEWikEX8A8eq1qS5LCv/EkWZisjKsD0tNHN/cy?=
 =?us-ascii?Q?mp80Yk1MCIPjHteu5IufxHjB/k+2dUX9m5yCZi/cLC2gVdXoDEGC8JPgG2QY?=
 =?us-ascii?Q?N819cBBBA2IlwKVIoDFOebtIUGxPoaVu5+s/TGq7iyp0H8nISRGqwmvqx8Nr?=
 =?us-ascii?Q?VGg56DWq3kecG1keOmZNrub/Y/3ZHqa2VFdoDCdDnTOX9qqyPwJ7SrQIpapT?=
 =?us-ascii?Q?BTbBtx4CwZAKRO8L5tOymNV628GUnid6MeeDck0czGobGABMs5hMfwoO+4xp?=
 =?us-ascii?Q?guF6009lelJ51FbubXjqTCOnhqeXwRmEmdfu898VjEL7jR1dUnYLaxVy+7Tr?=
 =?us-ascii?Q?ey+aD/Kd9Zu3SOEZugT069E/fGU4L2ilxVFqYrA5euEhYPzrSzZpww99Upi2?=
 =?us-ascii?Q?6/knruc+vbiCjyJv2Q7VTN5Ev0+qkBrI5ZSQUlVfeAwtEg789KZlw39yWCQN?=
 =?us-ascii?Q?xcKIcnNIci9z+aiY2EtxYP0nGJPTvYKSL6md+nWenRPetVkDnIQV54Xxw/XS?=
 =?us-ascii?Q?3WSEfuiezSGEJspgSLGkG6ao8JMcvrDSAEoiTkTzqtuYTyymQnkIc7Mu5SYt?=
 =?us-ascii?Q?ahzk5ENq9KtYr9X+9U+N+BrFrwzwhCUDnS7j5/aTiKVQFsEGaJDVOs2Dh5yJ?=
 =?us-ascii?Q?UQ3zxrdgTpA0EailJVYDe3jqdXZHMQLU7MVvSxPJ5hFvC00DG24wvVmZSWA+?=
 =?us-ascii?Q?fub/SJFU1EFezrq1YzbWTpXen5rO28V94IHCpnhGdaoCWNUIXddeLxI+TY2C?=
 =?us-ascii?Q?6hNnNEWjmtkZlqsitd+vdEbiRmepXTguAaK0ocQCmHKY46WtsQkCP/R/vCoM?=
 =?us-ascii?Q?jFBWhifceRe5vqDuquy1w6N+5D5QJ9h52TEAkj3GcUq2hbcmxB9vfPt474WG?=
 =?us-ascii?Q?hkAlPoJg3ZtxyyJdZcm5ocON86Seo05v42QKWhrfHgCWTh27DcyIhNoCjILU?=
 =?us-ascii?Q?C7XozPenkFrOL9etSlX4Q0Xu/ZEy7Q378TenIO8vqeMuRSsl8CdoZUk1JCDP?=
 =?us-ascii?Q?1FJWYsqY7XQSwTPL5uaJnVjlEIlbhv6mFcRs3mGYr20957zAvf3DumdvgXRG?=
 =?us-ascii?Q?gJT8dmLr/2mpbu+PUNVuqEjxml4npYMF/LL9LVLbkfCH63GOsSy5/6Ei9E1E?=
 =?us-ascii?Q?vnnaI6kNfoPXeWppu7EGA7d2tL+/vfydE+6HYSw9mRsuMbobLvnNGhS+dru9?=
 =?us-ascii?Q?6WvGrAwMo0XkyNieTgs3zHKOM39zcyyUBzIAEFpG5NkEgxamiQUAwwrxb6m1?=
 =?us-ascii?Q?oogNBTK/kqW0mQRHQ6iN4yZ0wtc4ma36?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?epL/2gy6z9mQPPq+GIltz7FgCWNp4GKv8JXjZS0geEX//4az+JhoIthZYBCO?=
 =?us-ascii?Q?XgJQY0u3QU65nzZwD2C3H3U3VZoFM92f9ACFi98ULcMI8QoeCi3j1JWJ83Ts?=
 =?us-ascii?Q?+xoyH+ifnVp7Oiwm14SKM7eoYiR6HoadMMwAFehTZTAqwA1UZp7/AJrt8eai?=
 =?us-ascii?Q?4gF0++WcXVxtRd4m9dXhso5zYZSNGTk558n6q4W5fc5SCygA/cjxyTHaTsqR?=
 =?us-ascii?Q?AoEl3SAJrqB9uRgOI7lNQOhv+F/WdC+wWaKqfGIOVtWIiHUZJIU053MUeFfn?=
 =?us-ascii?Q?wou0unhMbmD8hXTAd6aH3Rg8sUro+hRHidrBUHVUUg6MhrSG5TvER0MzzgMT?=
 =?us-ascii?Q?CV5KeJKofg4Whxq1yMZCjtV1TqoMSqB4Q4nvaUCT5fxlhF3c35crCCgDoaJH?=
 =?us-ascii?Q?0agO0onHFUQd8qpRPYhBB6uNKO+me59+4zC/OGJcR3GomPNHwQ4OSlvVPVjJ?=
 =?us-ascii?Q?mfmz/TRAlW4vI7Sl2xnsYCmz9jPYw7Mcp4/xvBmP61Vjpd61J2bxbG1MzGur?=
 =?us-ascii?Q?UNAea2wlNpGEm+OqnUrGbgdwE18gDwd7wAGkMhDltocRBRAPeWL2t74u0yj5?=
 =?us-ascii?Q?AS0cdAiWF6ykLuX2dH4sJpVCMhPlz46J6QEROXrLaWoGLZISgFJbc0zJ6clA?=
 =?us-ascii?Q?gOw67L4X2ylh4kLbn8B9AelWFWeWUKfiqnXQgD/OidHTdLSUoEQ0tglc10G4?=
 =?us-ascii?Q?jUtb1FYyQyhtQn8b9SDhky9JSg+OTi7ky4PdHV3gJ3F/66SRw1Enh0QND4ZS?=
 =?us-ascii?Q?knXn0GI4qRXaGBmbUbBm3Aj8I0llBNKCtij1Wt8XDC6WRQf+aFzSLDfbOthy?=
 =?us-ascii?Q?39EKEsPovBPb3UjPXQZzotnFgTR0i72IvfJhq+EsfGl0eyCbArb9T/+j86Ff?=
 =?us-ascii?Q?Qbig0dVwU1Pgc+AT+j6olEv88TNuNcXCRwy9igksDvnJf7G7rzy6W/wRDYki?=
 =?us-ascii?Q?b9TyT/PDIkNhC9JXWIAnANwYMGEtE8m2TUfvi5Vo8LXbLAAb2tvQ6gHRxTtv?=
 =?us-ascii?Q?0uF8+NzHRGbohGh2m+IXnEULawMuICkj6zGWy6sYPaGhQSmZawe50sxW9cTs?=
 =?us-ascii?Q?yOuzH1zcER7jsqoAS2lqBa0dQVWQ40V/jKtCAkcgIgNaB3wxIbF70dNLEfLw?=
 =?us-ascii?Q?9sT9LCaayGj0Tts9B2jdKvBiz0Oyy6BdUU0xgSlJkHwGR0xpMDwODfnGo47j?=
 =?us-ascii?Q?yVwG0mRZFevgQK57pGzJ67WOkaSR5Bu999a8gaH42Rse4G6xuqI1R6yGpHHZ?=
 =?us-ascii?Q?s13qcXqLFJ6EanwXIbL/zyFC69lsJz8W6Hn9/5dJ7wfueVWpxKlqdOGSNM8w?=
 =?us-ascii?Q?OV+s+D8CNzt16wpm/qF1pulqB24Nv4p3FM0MZ3aMKzh4B9aOw0L8QBnwFilL?=
 =?us-ascii?Q?Nw0BEXmhpl5HeXwby/d2v2QDPbB+IFueUR8VbKLWHQNqu8Dm3/sirAifikOh?=
 =?us-ascii?Q?JfcL4xmI3Ka1JsE22yOMxsNenLaljGyuuNonVObnAipZi500lZlIZlm7d+jF?=
 =?us-ascii?Q?Xkj87CUPaN5DsLXZAxvq8JOYItZMZ1pLz+/Yz0x/37f05w/ex+Q4dFtJChy3?=
 =?us-ascii?Q?btC4qJ8mH+VLPcpC3axFfZFfHAQiYT5DESK47+PmXtQxvK/89xIPLeCL0ENd?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 603c6764-975d-4e8d-2129-08de0c353c7a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 21:53:12.2400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYzPsOY0gPW/jeXnJ3OzqC95Kn4PlFVFn40Z98rNFgyVgtDIytdfokECxuYoZI+raImXT94ljUeZG3uNv84koA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
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

On Wed, Oct 15, 2025 at 09:47:13AM +0200, Maarten Lankhorst wrote:
> Start using xe_ggtt_node_addr, and avoid comparing the base offset
> as vma->node is dynamically allocated.
> 
> Also sneak in a xe_bo_size() for stolen, too small to put as separate commit.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 4 ++--
>  drivers/gpu/drm/xe/display/xe_fb_pin.c            | 4 ++--
>  drivers/gpu/drm/xe/display/xe_stolen.c            | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> index 4465c40f81341..1c599963169a0 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/drm/i915_drm.h>
>  
> -#include "xe_ggtt_types.h"
> +#include "xe_ggtt.h"
>  
>  #include <linux/refcount.h>
>  
> @@ -32,7 +32,7 @@ struct i915_vma {
>  
>  static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
>  {
> -	return vma->node->base.start;
> +	return xe_ggtt_node_addr(vma->node);
>  }
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index d2e4903de0977..784d2db5fd0db 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -206,7 +206,7 @@ static void write_ggtt_rotated_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *n
>  	struct fb_rotate_args *args = data;
>  	struct xe_bo *bo = args->bo;
>  	const struct intel_rotation_info *rot_info = &args->view->rotated;
> -	u32 ggtt_ofs = node->base.start;
> +	u32 ggtt_ofs = xe_ggtt_node_addr(node);
>  
>  	for (u32 i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
>  		write_ggtt_rotated(ggtt, &ggtt_ofs, pte_flags, write_pte,
> @@ -351,7 +351,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  	if (vma->dpt)
>  		xe_bo_unpin_map_no_vm(vma->dpt);
>  	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node[tile_id]) ||
> -		 vma->bo->ggtt_node[tile_id]->base.start != vma->node->base.start)
> +		 vma->bo->ggtt_node[tile_id] != vma->node)
>  		xe_ggtt_node_remove(vma->node, false);
>  
>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
> diff --git a/drivers/gpu/drm/xe/display/xe_stolen.c b/drivers/gpu/drm/xe/display/xe_stolen.c
> index 9f04ba36e930b..ef5ef5aa8d847 100644
> --- a/drivers/gpu/drm/xe/display/xe_stolen.c
> +++ b/drivers/gpu/drm/xe/display/xe_stolen.c
> @@ -100,7 +100,7 @@ u64 i915_gem_stolen_node_address(struct intel_stolen_node *node)
>  
>  u64 i915_gem_stolen_node_size(const struct intel_stolen_node *node)
>  {
> -	return node->bo->ttm.base.size;
> +	return xe_bo_size(node->bo);
>  }
>  
>  struct intel_stolen_node *i915_gem_stolen_node_alloc(struct drm_device *drm)
> -- 
> 2.51.0
> 
