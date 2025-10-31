Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B11CCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 13:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D8D10EB41;
	Fri, 31 Oct 2025 13:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpx4A2bU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D7C10EB41
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761918031; x=1793454031;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lfBfDSogTmbVxb3ZBB1Xk1xn0qH5VQHS4//r/gdlRGQ=;
 b=dpx4A2bUNjWztIomxvfyd8tqL+m5p2tR/+9zt/Dx4MJtoyKBVp+NMXox
 ejGw/FwLFoZtB/YIS/WXvAJNIcH7pmG9rTJZOPo13lMExirNpGd9XnOuN
 g9JYAOXrh14zQti7AB+UedrSzw6bxTR0aNzyTHQYpaUxVrExE19307px9
 dqTLhQEq52iTigzvpldF1wz5rDEoZCeDUGGqNc885YDuiLm9zmmYrPe6e
 oU/rNqNMcVhESfsXcP99ZlhAzpZBaZG/4Rb8LrHo21yChjx7eOJydvzNm
 5jkpcXXBBncT/7O+q5ph4ZajidMOfDSoVOKjoaNsQzU5AQ35doZMNm8e9 g==;
X-CSE-ConnectionGUID: xuqdN5STQt2cZzDSZ3f25A==
X-CSE-MsgGUID: /gPmzbllQESRIvStHj3SjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63283555"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="63283555"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 06:40:31 -0700
X-CSE-ConnectionGUID: /GB5dKsVTIqmcZSyiowXJQ==
X-CSE-MsgGUID: Uvm48v0TTeayz5L6rfUZIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186568994"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 06:40:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 06:40:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 06:40:30 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 06:40:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEaz6ukYIUF/x6ljfVtwNBC4God8RihSiDS1U/6r6RA0v/rF9fXOI1RjR/SG/bSl+UEJPhPNMpA6KBuSc/3EDLQAZao+fFBRx7ty5ySX1ujN3cmlGJwKY4SO9ss7t5sk1gA8tovO6JbkGN/RmNqSj/XSKRvK8OpNsvakS5P0TwwIob4viEr30noLEXgIG1V4gigpdNgiXCnyGluyrjD6WLPjLi1YLKH8jD6Lgr0zx7WrQdf/qoJ8ELLjfHYB3oHYSTQhZER0qmLw9dCU5kQcxqWLwqa+RpDyrtVM7WSXl796g2QzitGJGgR5r4K/+tSOYzA7/Kj91tqwn3/ngJiJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCN373obB6IpcPlNlyCfncpE1dVxDLcZso/Zb7RW85c=;
 b=EDfsIasIJXFnYY1OxSXXZsUKcjpean4UW8HdhXvUIZPa2QNv81i830dBlQajH7X84MSr/H7aev98QBaNUU3zFJSvJoKn1AfeZj9uZUArOZuE2KnUu6w1gu8+YTtVmPoTNO2D8Tj8ZiDCV8MMgJQJ/+Fr4BvW1AAfTRvmnIzUC69Ad9a+7D5WtDbufEuSebUzYEgHcj0zdBxS7kRHK2b1UCCyr0480wwO82VDl7R5KUe7dHs5FPydkb8PAWoHvA/mRtUBnrLlKLZ4Ils9KL7unjY2gyHTY6jWmaTfzeiOjPZZ8Vq3OPIPTbYDVwglIFwdDG5Kl3V9MZZwkKPJAOwIaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB7272.namprd11.prod.outlook.com (2603:10b6:208:428::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 13:40:26 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 13:40:26 +0000
Date: Fri, 31 Oct 2025 14:40:21 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH v3 2/7] drm/xe: Implement xe_pagefault_init
Message-ID: <aQS8RTAavQUlBQsl@fdugast-desk>
References: <20251028035843.2488613-1-matthew.brost@intel.com>
 <20251028035843.2488613-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028035843.2488613-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: BE1P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bb4079-72fb-4856-f359-08de18830c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?G8TODzCzqW5D6NTxkIcy/89PbPDOgQwVbYrff92N8CRF3yOUgEYiRYliEY?=
 =?iso-8859-1?Q?Ul0LqvEoRkMMhFzEv4Lltay1fL8bV/d8mjkQu/UKtYq44tASuB9e6sU3VS?=
 =?iso-8859-1?Q?ISWoSAfxJ0Sy0rWtAXOAQ6WryJ/2/uWuuOuAWf5cr6EK3K32MkPUtRn4cT?=
 =?iso-8859-1?Q?IIWzQItqiibDXTQwT9z2HC+1NYsLJknnCspWYoVVHsjNS5cCfMHRJYGIHY?=
 =?iso-8859-1?Q?WVZcIwoyAOrX4UiOR64oAP33MSkq0TPAnQkezpxjUUqnk7FhaGWvR7g7T2?=
 =?iso-8859-1?Q?MHKOOGiD0LFlBXhGV7eThQ9tt2KeNUK3tIZwdCK0mTCjK5ZtiD/KOoNJum?=
 =?iso-8859-1?Q?FnrrrHZ7usAfPxmdP8ZhH21QPU8bqDkHra7Bd4ypJUW1+NqyBsTk+mysxh?=
 =?iso-8859-1?Q?5Of3isNKPTUnZoxnWgzk9fcu1DWNCxAl/qTnNgAzUpi4ajyU92HPCX5NTv?=
 =?iso-8859-1?Q?0mxPZ6TY729k/i25cR+SdcaBfVo+ui3+3Gty2bDDd3eTBpKv3n3EnqIO9t?=
 =?iso-8859-1?Q?uUeln+V/JM+89HK9levIIkdJ42y2U1n+HnFjU6TbXNcl9wSUF60XDx0d3E?=
 =?iso-8859-1?Q?IvaOR8wwaGvIDd9nFWUaLYzKH3dW66r2maPtwxiiCBdoZQkwG3zKin1YNe?=
 =?iso-8859-1?Q?/rCEOE25LiqZhrzAqmaBdOvCk3bSek18BPIBZbSaQZjyEYk2rOOncrGvCR?=
 =?iso-8859-1?Q?9q4pvsFAbYk6k7cEj4NLOJmIi+rJUWJbh7ZrpMNU9qUjgrqlE5kU8O0Msm?=
 =?iso-8859-1?Q?kvy1uxdbV1SZmPD6l0u5s0buRlFZyJZQQKRt8sepkYlC2n3OR2l8H5gBwx?=
 =?iso-8859-1?Q?g+4sKhagc0PIrdVptMwC9L3XRhnWuAoTSzYvZm+Spo/NnU1fSZXUkIIZ9o?=
 =?iso-8859-1?Q?XBhd3BDB8a3CVIdWGNc9BJnKA4o2HqzjKUJhhKueTvzgkC7E6I15h/RfZp?=
 =?iso-8859-1?Q?8/WQuDmUzBMeQ5/PsJ0YOyyy2gDUDBLklE+j0UiwDHLvW5u3zexamMxSv8?=
 =?iso-8859-1?Q?IvV7ePuaaVaksWeVoN9HrG8oG+dBbk4fWzTJIQlM44zQ/iQj2gISHk34xA?=
 =?iso-8859-1?Q?gt4N0fGfQ7Nx8NZybbqubsGQIePGQ3mSLqTiW2/ifo9Rb3iQFTgmIgLetp?=
 =?iso-8859-1?Q?s/EjuUAThi6keS/qfqXFwD+Mf19eTH08+M6lovW2AcEsi9GXY/ZzAaFhb9?=
 =?iso-8859-1?Q?XRl+/E+e8DvBgWhki6eoXC0xrTxV95CIW8qiOeRKQqvqac2ZUXxn1KX9ED?=
 =?iso-8859-1?Q?M9GI0/ehJF7CNQdwuvzJ81pwy3OYoSZtbcAz+y2xLKKj8yDHtCRKmtUF2X?=
 =?iso-8859-1?Q?mbD/VVZ4U/KAE6Ci4y/9Pj9ROTbYzb+GOWGNPK2+IAcCRVuHgTmpOHXiQx?=
 =?iso-8859-1?Q?papoDbjl+Tmw0WzOC4fTk7x4a96zJu7WJQeXNZXreshxqhxkQHuaQVJghg?=
 =?iso-8859-1?Q?QwX4JEu5v1kaM5KPeO+5GkhvMHQz4x08oF4tzucqSZ0wRrXgmTCFIsqC4T?=
 =?iso-8859-1?Q?80jBtCYivpBW56J1RWRlCp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Iyd+whuqkjuIFZ980JxB3CLPNnjvWq+CIp71XvuuFRk9Tbzk7KaxpYLzXw?=
 =?iso-8859-1?Q?St7VtuJ5r3g9CEdoUpXphh8E/JH15ic0joopAGAkD7gF/2PtIMyn90ldfQ?=
 =?iso-8859-1?Q?f48YHUjwMWWuLgCD+QU/oJW+CdQnDHnoYcSUQTwjIyHE76gYMwr3kELKtZ?=
 =?iso-8859-1?Q?ERji3wywjBce59Vb4RYBHxeUN+SsPX0XqjkVYB0G9Oj//p1w5oZpYJ4Aja?=
 =?iso-8859-1?Q?nT4kwZvKQcXwwX4V8lyelroHUBCqyV2IGx9FYg+/7TScl8KY/ExWQRegxz?=
 =?iso-8859-1?Q?Y2YTvgcmOoOdyPcVastWWRv/tyAYy5v5vZ3682LuyD7BjWC3aN+z2baVY0?=
 =?iso-8859-1?Q?+hp5NTFtCdJH9vcxB7patARLThPyqCVv/j99G0pZzc649qdjnwYlSFMUPS?=
 =?iso-8859-1?Q?GNOQ5TGpucFZcfQl7PKEVnxgMIWiA/jtGHjZ1zzFYl3c7BmH5DpT9AZIMY?=
 =?iso-8859-1?Q?ISROwStsK15H6VsGIHP0BCfXeVXNQ1/V8/PRwDIA9NMsL1tKeBgPjB7DYr?=
 =?iso-8859-1?Q?E+kPChbl1iCqmo7GbV8BKebm7fmBB3t1J37PLTl1zXlMQpjmZqB4Owepfb?=
 =?iso-8859-1?Q?xpejNLpvfp+1JL5qObxG0p57LZ+cv7ab3zINaf2EOnbVstcj25rLx2LLfu?=
 =?iso-8859-1?Q?fx+vW2VbZ8FHdrbNWxPct2mLrRtHFg/cCEXFb0NN8kpYt2tk88h4qhigcw?=
 =?iso-8859-1?Q?H/jRcQrGu9DI3FdyGPZ3YrbjcGQ+n7WzkufWWhJisx/XjNKtoiNjtNn4XH?=
 =?iso-8859-1?Q?/i2yJVC/rcoD/6WFXpkGirYpyt52sFSFIuADAqNkp8npCVlK9v9eP6w6Ri?=
 =?iso-8859-1?Q?HAOcQrpZSZT36m0TveaZVZO7fMRxl4z0G8MNPQbwn8vO+N2fQjSGlMoHfz?=
 =?iso-8859-1?Q?0Z5F4MmslLlkzKdemL/XfdaRtRgK5uA3kMwdqR65Gtzweroi3zVo78fDIS?=
 =?iso-8859-1?Q?N6NkQMCUBOzPEvG3VlJmreoWN0s2hJ4YPjIkzb/YKZe0xKvIhdVxkULwLA?=
 =?iso-8859-1?Q?X2Yo7zPiyWfdL2vpkNJFj0WPcoWnX5P81aiupuXE90j2gv65dlZY6glUsm?=
 =?iso-8859-1?Q?o7/KqvI1C7O3sWtapBxZefI/5wjSlhYMis9ZHMpq0F9fwmboufNCeQXMup?=
 =?iso-8859-1?Q?851/bKpVf1l2oA5/T53ukOBPzmRlxUliqLdXPgXn8ApFI2A1evA0lto5xm?=
 =?iso-8859-1?Q?wOP7t5qp4Srag/mh180EbC/9bcpZoHXGkQS7hk9TgcChGCJ3hZmtO8Ynly?=
 =?iso-8859-1?Q?877NVHmmq7w7mBeeAxohGUVVJ8II+IUd6s/MVS0BmD34Vy++/lnV6LjsbH?=
 =?iso-8859-1?Q?O/6w3e+vuFF+MBQeu+imla6lGwSAMPWn3FHrw7+xz2awgQajhBfO1EoViu?=
 =?iso-8859-1?Q?iHd0RESqVxIAF8+BvM561BFXTpI523kHD/e5l4tZcCq6RDRpYwBn7DP3Dc?=
 =?iso-8859-1?Q?7lkXbgLWDo0UCmdP1wONuzkMy0n8BvkckYGV/tQ6bOamglXeFyxyCVjZe7?=
 =?iso-8859-1?Q?h3r6gcPLOBzmOCpXLDbeeGcA3tTWcsOj+RK/nvUpR3dNNjHnSYPiQc25Zb?=
 =?iso-8859-1?Q?cF8cqP/6g2CGpUBgZsD8dercdPlaoPDCB6PczxF88aCudLlOxemKJScTjx?=
 =?iso-8859-1?Q?y8zplJvtkGMs+3QX0biVkxB1SNNM38qyMdHx4+BflekCHwWZxXYhQHWg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bb4079-72fb-4856-f359-08de18830c65
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 13:40:26.2393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jt8LkssHTt8FfxEO2Kezl7dGw4hxP2W/qC9s9KgpUsL58ddzKef4fL5veZjCxcO+EmSjSGLS8aiOSUxLgAa3+u75nFctRDPpPyZSOXAvX70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7272
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

On Mon, Oct 27, 2025 at 08:58:38PM -0700, Matthew Brost wrote:
> Create pagefault queues and initialize them.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  5 ++
>  drivers/gpu/drm/xe/xe_device_types.h | 11 ++++
>  drivers/gpu/drm/xe/xe_pagefault.c    | 93 +++++++++++++++++++++++++++-
>  3 files changed, 107 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 47f5391ad8e9..c17813c469fd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -52,6 +52,7 @@
>  #include "xe_nvm.h"
>  #include "xe_oa.h"
>  #include "xe_observation.h"
> +#include "xe_pagefault.h"
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> @@ -890,6 +891,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_pagefault_init(xe);
> +	if (err)
> +		return err;
> +

It seems these lines ^...

>  	for_each_gt(gt, xe, id) {
>  		err = xe_gt_init(gt);
>  		if (err)


... should come after those ^ otherwise the number of EUs in
xe_pagefault_queue_init is incorrect.

> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index af0ce275b032..7baf15f51575 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
>  #include "xe_oa_types.h"
> +#include "xe_pagefault_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
> @@ -418,6 +419,16 @@ struct xe_device {
>  		u32 next_asid;
>  		/** @usm.lock: protects UM state */
>  		struct rw_semaphore lock;
> +		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> +		struct workqueue_struct *pf_wq;
> +		/*
> +		 * We pick 4 here because, in the current implementation, it
> +		 * yields the best bandwidth utilization of the kernel paging
> +		 * engine.
> +		 */
> +#define XE_PAGEFAULT_QUEUE_COUNT	4
> +		/** @usm.pf_queue: Page fault queues */
> +		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
>  	} usm;
>  
>  	/** @pinned: pinned BO state */
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index d509a80cb1f3..43b26e7d090a 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -3,6 +3,10 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt_types.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
>  
> @@ -21,6 +25,71 @@
>   * xe_pagefault.c implements the consumer layer.
>   */
>  
> +static int xe_pagefault_entry_size(void)
> +{
> +	return roundup_pow_of_two(sizeof(struct xe_pagefault));
> +}
> +
> +static void xe_pagefault_queue_work(struct work_struct *w)
> +{
> +	/* TODO: Implement */
> +}
> +
> +static int xe_pagefault_queue_init(struct xe_device *xe,
> +				   struct xe_pagefault_queue *pf_queue)
> +{
> +	struct xe_gt *gt;
> +	int total_num_eus = 0;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id) {
> +		xe_dss_mask_t all_dss;
> +		int num_dss, num_eus;
> +
> +		bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
> +			  gt->fuse_topo.c_dss_mask, XE_MAX_DSS_FUSE_BITS);
> +
> +		num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> +		num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> +					XE_MAX_EU_FUSE_BITS) * num_dss;
> +
> +		total_num_eus += num_eus;
> +	}
> +
> +	xe_assert(xe, total_num_eus);
> +
> +	/*
> +	 * user can issue separate page faults per EU and per CS
> +	 *
> +	 * XXX: Multiplier required as compute UMD are getting PF queue errors
> +	 * without it. Follow on why this multiplier is required.
> +	 */
> +#define PF_MULTIPLIER	8
> +	pf_queue->size = (total_num_eus + XE_NUM_HW_ENGINES) *
> +		xe_pagefault_entry_size() * PF_MULTIPLIER;
> +	pf_queue->size = roundup_pow_of_two(pf_queue->size);
> +#undef PF_MULTIPLIER
> +
> +	drm_dbg(&xe->drm, "xe_pagefault_entry_size=%d, total_num_eus=%d, pf_queue->size=%u",
> +		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
> +
> +	spin_lock_init(&pf_queue->lock);
> +	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);

These 2 lines ^...

> +
> +	pf_queue->data = drmm_kzalloc(&xe->drm, pf_queue->size, GFP_KERNEL);
> +	if (!pf_queue->data)
> +		return -ENOMEM;

... and those 3 lines were swapped since last revision. It is probably
too early for pf_queue to be used here anyway but was there a reason for
changing the order?

Francois

> +
> +	return 0;
> +}
> +
> +static void xe_pagefault_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	destroy_workqueue(xe->usm.pf_wq);
> +}
> +
>  /**
>   * xe_pagefault_init() - Page fault init
>   * @xe: xe device instance
> @@ -31,8 +100,28 @@
>   */
>  int xe_pagefault_init(struct xe_device *xe)
>  {
> -	/* TODO - implement */
> -	return 0;
> +	int err, i;
> +
> +	if (!xe->info.has_usm)
> +		return 0;
> +
> +	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> +					WQ_UNBOUND | WQ_HIGHPRI,
> +					XE_PAGEFAULT_QUEUE_COUNT);
> +	if (!xe->usm.pf_wq)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> +		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
> +		if (err)
> +			goto err_out;
> +	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
> +
> +err_out:
> +	destroy_workqueue(xe->usm.pf_wq);
> +	return err;
>  }
>  
>  /**
> -- 
> 2.34.1
> 
