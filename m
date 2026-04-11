Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B10DF45A12
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 01:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2496410E03D;
	Sat, 11 Apr 2026 01:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SODBFzFn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B04310E03D
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 01:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775871818; x=1807407818;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n2MRWKMA9RJFiKTicinKBTfv3hCNPb+btFNhR40tFcU=;
 b=SODBFzFnE/0tvhAw+igAxnMexCUf3FJTsxQ2AO5bjz0uA9xQylaHFlM6
 6H7zDQ9c9Ph36bdiSwISQT526GvTk3hfS1X7hprJ/6fWtKyBjM4R7Hwit
 BGhg3A1Y83z/aewaawkiqoTWi/dHrFOIwkH1MfKDvhul+ONt6qV4ovzRK
 VGOg3k9e3eTl82l12RbQYb58Ui43IWAJRxB12HSHNuYvVt6VIG/m3ou0A
 sShPtoZ6KW9FR5OJRZG6FjmymNDYH71XQKyGKt7WQ9PR0HPzsVlMQc+LA
 nK8e+6gdpB5+HLHmfPPaCmz0MhOSHoI6RnPC5pmL6vkUC3tnaoV4ZWf19 g==;
X-CSE-ConnectionGUID: Y0qSGuIPQ1ytMCIY3KU8ZA==
X-CSE-MsgGUID: COQ6ibTWT1WSK0QyzG4RFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76913871"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="76913871"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 18:43:37 -0700
X-CSE-ConnectionGUID: Bd1DSzWWQ8ik5O+ZLdLKUA==
X-CSE-MsgGUID: etMvw4D5TbmEwMnPQIEIkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="234181692"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 18:43:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 18:43:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 18:43:36 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 18:43:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWDIyd92vTFEX8PottW5GcAHp6bEebyyyoY2Jv4KkD5EH2Lhir8ydVac4JlAUjCAoyn7AXfCTipAWELU/Or2OIhjuPRMd0HDwi+DgXwppiafPUjRlTd8ojzPvg4DrD/aGmdkCxy8tAw/tF4MTGLi6jnZn3C8ZfW1ZYVuxG5LdWbRt2eW4LT8xk7TgyySn9AtpXY1F+S2kSjxrrtzQVujQYi5+4WpGvJO4T0JJUTadPuGJCqZef7MK6T3rTGC3NKbN3hM/5673XIBeIHvoFGdV+i0V+7sDOLh4XsDstVfCoSD9yT9b0AU/JLIXS4BoVeRHl22+g3x7T0tlOmuTyOahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+BEMhBVZH7wLbLlVY1LTSQUsHYq52JAEutsQUnwZFs=;
 b=Tn4+B7A1qVOnQQZa22nZ1kpPcg/wIm31hT0uaMTVWwu6W6xVhnNH8PuDSgLYH7qd/DyiEKAAEICPon9V/3PYO8iH7wyFLm+7cZaZBZnRgTnbn954bHZsYxjOBFnplRdT8ceuOqxs41FOyfwFtbJ2FT3RMAbwtInMxqNFX3tUKxQVyoxp2YiSrLOeSCimT2cG9NUkpdt5togrUSs4IoyI48TB0GKWsIaCyjCE7v0S5DPUvEOvUy/FGWa83qbOLti0qAeNhWWa1FLuHFMuQf8jmpHi2mDVpB4yUpGs9qTfLB3VZ9LE/557r4NXcrlWuWNsslSma5UvuRP6XM4kantwtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.35; Sat, 11 Apr
 2026 01:43:27 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Sat, 11 Apr 2026
 01:43:27 +0000
Date: Fri, 10 Apr 2026 18:43:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Add memory pool with shadow support
Message-ID: <admnO7kFxB73laQk@gsse-cloud1.jf.intel.com>
References: <20260408110145.1639937-4-satyanarayana.k.v.p@intel.com>
 <20260408110145.1639937-5-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408110145.1639937-5-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:303:b5::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY5PR11MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: dc05361d-5ee2-48d0-f350-08de976bb9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: I4ipcAc5Nz5jJSVf+JqpdizEsBMbzr/LFJy19jZCoXLcGssmZPH5Y+FSH6T+lZf4io12zVIVR8aMJc2Sp48quSeoE+v/bty9O4rlb1NTfcO4kdkqbX667c2eP0T7ybZdWMfVROLwqZqFvhMv7xvR/mTuIZtNLpcy/yDbEjk1f6I0TFMH3kOG7Y5W2aF/3prWGdF4Fb4j5PzaULBuS6jpm1kF80nlDo5GhNQtRuSNN/romIrZFNaqCyH3b6e8QuLJf0sJuj6YrYViIrfkN5V00KblC8CBpmKXKNhvrtJIkCuGjxpf3S4ikZeJqrh7uHi3Pp9dlR264TSsEd0nDQ1rvDYtA78bvGWxAqababAQ/bzQS4C0KT20RsyoVLJZTQIWMSPAfbBh0wcc6h0uBL9YhgzaWJO7mv6h6IUPe1xRoh1upJHBZdL3oVu/AYYoFBFTd41IQO8msZyOXuToX2F+dq2W+kJ7KW1AuM/mk//J3xyoqh6agmTGa4xWfQb6bq6frk9oRIR0D53U+XfGKVCF2dq0sdhAeTHKJToOrBEWVQyirgi4jAbXMG2fSpVajFT2Zxrfxt6vwubbRkvOSLIxIcwOMIp7fOE9LnMAxuaCXA20gasZpZPuYreCDKDE9S+tQ9oGDdBGp5F5pF4Gre1Ul5oWsx7F/jiqxPAYHijbD3mFixzB58DYLpclBg95SxVCt4bHEPxK7d2OYsDMnm3xWw+x2h8LoegBVmjdjny2/fM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6FN030HQWWEGqGe1cf52NTWv4uROyZ9wyd7aCTa4AbJiQCGlImflt3jGol?=
 =?iso-8859-1?Q?y1G6unfNsNrzNRIZNbDMIIt4zUHaSrQJ6X76oj+c6FtsfMgkieVLeyVB6P?=
 =?iso-8859-1?Q?Fhj+0MGRvEvLxEHe4E3Wdc0/3bk8+7UurdPRtdN4Xqq5MFX9xdyJCXtfMc?=
 =?iso-8859-1?Q?YIAzicybrGmXXxo1jCguBxtedco50rAmQkcHnmrIWn/qs44Cj+F0CHToEA?=
 =?iso-8859-1?Q?5L2o4oxuJipNxAWkzMk32uIABqufrqjwd98Sc18fC9UzF3LfrFwaxxw6sB?=
 =?iso-8859-1?Q?tBDLkUuRxNcCjryn7CdEm60w/haATFLWCPqDVGWGTNd2Mtq7fvBkP3opLl?=
 =?iso-8859-1?Q?I66ztci25MgYqEEZQLUm7uoDjharZpymc90cGXrvduW6Qe5rAw0dkBcDiK?=
 =?iso-8859-1?Q?bJNsDkT/MW+vLrhb0VD9kTUvgq97xaupXullSi6VsHDHZo7obbU8e/fHxk?=
 =?iso-8859-1?Q?x/oP8/6Rfu6aOi4HFonfnU2n07l+DKBuCDNVK75HT5yDJ2DDVbEpKniVrh?=
 =?iso-8859-1?Q?6dlFZMxK6kl0i6yqgz0/z2JuGWq7RtMzS99wmj6BsviZuswtYS+MZPdJLI?=
 =?iso-8859-1?Q?0WpZ95KlyXUTwq112ZkNZS/DkbvqXXeZhPM2lLFxScU3UhDTLrob3EBHXb?=
 =?iso-8859-1?Q?kxh1zur5xbZkgzAkk/G8rhdbIef6bbhCpsy/t0zPBPW//p30V1PolkyoMh?=
 =?iso-8859-1?Q?urdbNEuBZFeAtPVDDJ0v580i5lT4733cMQlzgOAGanTAUvbuXwVAQ0h8ca?=
 =?iso-8859-1?Q?ffLdhZL98ugZvaAGiK/FxcVAcrTRMt++dh0BYsCDsG51OEsfjiElybqh2d?=
 =?iso-8859-1?Q?ZXjVT353N1nFQ2PSlmrNs3p+G/2vVlzbM7wUqm1/pHqt7kplrCvZxZki/u?=
 =?iso-8859-1?Q?GlUAwFRyEwRopI/cUhxDrNv8jhFgZXZUqshJWe8HNzX78i+MZuleKap2Il?=
 =?iso-8859-1?Q?/USzom417sECdExthmihlrl/l11X9xizEnCdu2pibr92xYz7RSUoiieOto?=
 =?iso-8859-1?Q?fT0+QQjd3xNsVpRqVT+EhWq5DW8G3lwKAUAhQoKB3IVMVY1+yBVeCJsslX?=
 =?iso-8859-1?Q?cb2SPD6ZMlU6iZ7jWg9OWANTTBCJMzTv8NCNvuIsY3J6icZv6UHkKZOG+j?=
 =?iso-8859-1?Q?CE3cijt3JPAxcsoS6mc40PZgIz0dxJmTVwNHOHKu08lDPgkJZpkKnxOXyg?=
 =?iso-8859-1?Q?BvkCjvBmlBZh7oKSSqIxZrXC1JzbGYQxqwEdkvLfb6x8r96ZpirjsOjVNN?=
 =?iso-8859-1?Q?ZFFbDTt/gYreNsANA89JH4ClaP39xQ/S88JmPxrqxYBV28FNc4FAAP9Z6u?=
 =?iso-8859-1?Q?nFM7Ncft9MrYg7bkLs+7THXBUT7LEFyovcLeYXYcCBXIsCUBigJHdNiUnT?=
 =?iso-8859-1?Q?QauBo0EoPPCDw/VL92xA/Ki4naOpBqW/zq5j12efSDZyZAGmm4Umn1zMl5?=
 =?iso-8859-1?Q?3rUDuZNIOwUy2cudtoPb+nhVXGshTNMhC7MGzRtjJcTHUuoMEuMaFwEr8H?=
 =?iso-8859-1?Q?0Yr2firbABRWhoOF5crBA0awmNO9GNCGA3Or6auDOog2e3/z7THn+qR1PS?=
 =?iso-8859-1?Q?l7e89AWyl1NHHy0w49otUlFbgBgjMM0lcbh7f7E1isP7IMeyl6WMVd/VZG?=
 =?iso-8859-1?Q?tdmaymBIX1mIje4c6RYCELbLcAtZtAIWTmdJLf6k7lNQkCyB9evoFNQRxf?=
 =?iso-8859-1?Q?P+Jlq8ZDJWiD5Yqajlt0J+FFlFQ/0rdK4iaNfdB06348c7MAvlftxS5E5M?=
 =?iso-8859-1?Q?CPd/dFv28E/RYvnCCogGjcFc1swBaPrUaBarpDt7EHM2iCMte4cw/6Ac2G?=
 =?iso-8859-1?Q?7BeYzDKVaoAax0+v4ExE0bPf1b5J+QI=3D?=
X-Exchange-RoutingPolicyChecked: a8H3mKXI33nvuxaMVJ75GvjAqrdd8yFwrWd6zeLDrb6LIF2TbnJacBecyWGZ/RACUtvxw3w3CASWJpknClCQzYKiEe0JfWE4VvIBUiRBvc2f1ai7uSRMwfYssRi78gr2HlaXHfKoI9cYJI9YnUk75NZ88RiPOgmt8vSEXPkvoPHIM0gY/Cg7g3BnaGr+mEs4RZkPvAl9kRPFVAmljt6twuAYm4QRO+GOiqlIHXh9UucRqxqTKzRbZ/48ieQTmDdKs3fUhDSV2Zo7Ilt/Xd9OLzEHdRgtrUtgT5lvfhxdw64ZUSxz57iIqSjegjnEOft6Bhk0I105Um5QlDr9vUCh8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc05361d-5ee2-48d0-f350-08de976bb9f2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 01:43:27.2747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGH7O/tzthdM3acP/wpo80iFssXhCzzRLNA2kAvAiBtAz3KZozNJkyg64mb0zdnCz5GbkD9I71asXLt5p0poTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
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

On Wed, Apr 08, 2026 at 11:01:47AM +0000, Satyanarayana K V P wrote:
> Add a memory pool to allocate sub-ranges from a BO-backed pool
> using drm_mm.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> V3 -> V4:
> - Cleaned documentation.
> - Squashed chnages from xe_bb.c to xe_mem_pool.c
> - Made xe_mem_pool_shadow_init() local.
> - Renamed the xe_mem_pool_manager to xe_mem_pool.
> - Fixed some other review comments.
> - Cached iomem status in mem_pool, as the pool->cpu_addr need to be freed
> in xe_mem_pool_fini() which is part of drm cleanup, but the BO is part of
> devm cleanup.
> 
> V2 -> V3:
> - Renamed xe_mm_suballoc to xe_mem_pool_manager.
> - Splitted xe_mm_suballoc_manager_init() into xe_mem_pool_init() and
> xe_mem_pool_shadow_init() (Michal)
> - Made xe_mm_sa_manager structure private. (Matt)
> - Introduced init flags to initialize allocated pools.
> 
> V1 -> V2:
> - Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
> - Removed memset during manager init and insert (Matt)
> ---
>  drivers/gpu/drm/xe/Makefile            |   1 +
>  drivers/gpu/drm/xe/xe_mem_pool.c       | 403 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mem_pool.h       |  35 +++
>  drivers/gpu/drm/xe/xe_mem_pool_types.h |  21 ++
>  4 files changed, 460 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.c
>  create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.h
>  create mode 100644 drivers/gpu/drm/xe/xe_mem_pool_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 110fef511fe2..e42e582aca5c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -88,6 +88,7 @@ xe-y += xe_bb.o \
>  	xe_irq.o \
>  	xe_late_bind_fw.o \
>  	xe_lrc.o \
> +	xe_mem_pool.o \
>  	xe_migrate.o \
>  	xe_mmio.o \
>  	xe_mmio_gem.o \
> diff --git a/drivers/gpu/drm/xe/xe_mem_pool.c b/drivers/gpu/drm/xe/xe_mem_pool.c
> new file mode 100644
> index 000000000000..d5e24d6aa88d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mem_pool.c
> @@ -0,0 +1,403 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device_types.h"
> +#include "xe_map.h"
> +#include "xe_mem_pool.h"
> +#include "xe_mem_pool_types.h"
> +#include "xe_tile_printk.h"
> +
> +/**
> + * struct xe_mem_pool - DRM MM pool for sub-allocating memory from a BO on an
> + * XE tile.
> + *
> + * The XE memory pool is a DRM MM manager that provides sub-allocation of memory
> + * from a backing buffer object (BO) on a specific XE tile. It is designed to
> + * manage memory for GPU workloads, allowing for efficient allocation and
> + * deallocation of memory regions within the BO.
> + *
> + * The memory pool maintains a primary BO that is pinned in the GGTT and mapped
> + * into the CPU address space for direct access. Optionally, it can also maintain
> + * a shadow BO that can be used for atomic updates to the primary BO's contents.
> + *
> + * The API provided by the memory pool allows clients to allocate and free memory
> + * regions, retrieve GPU and CPU addresses, and synchronize data between the
> + * primary and shadow BOs as needed.
> + */
> +struct xe_mem_pool {
> +	/** @base: Range allocator over [0, @size) in bytes */
> +	struct drm_mm base;
> +	/** @bo: Active pool BO (GGTT-pinned, CPU-mapped). */
> +	struct xe_bo *bo;
> +	/** @shadow: Shadow BO for atomic command updates. */
> +	struct xe_bo *shadow;
> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
> +	struct mutex swap_guard;
> +	/** @cpu_addr: CPU virtual address of the active BO. */
> +	void *cpu_addr;
> +	/** @is_iomem: Indicates if the BO mapping is I/O memory. */
> +	bool is_iomem;
> +};
> +
> +static struct xe_mem_pool *node_to_pool(struct xe_mem_pool_node *node)
> +{
> +	return container_of(node->sa_node.mm, struct xe_mem_pool, base);
> +}
> +
> +static struct xe_tile *pool_to_tile(struct xe_mem_pool *pool)
> +{
> +	return pool->bo->tile;
> +}
> +
> +static void fini_pool_action(struct drm_device *drm, void *arg)
> +{
> +	struct xe_mem_pool *pool = arg;
> +
> +	if (pool->is_iomem)
> +		kvfree(pool->cpu_addr);
> +
> +	drm_mm_takedown(&pool->base);
> +}
> +
> +static int pool_shadow_init(struct xe_mem_pool *pool)
> +{
> +	struct xe_tile *tile = pool->bo->tile;
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_bo *shadow;
> +	int ret;
> +
> +	xe_assert(xe, !pool->shadow);
> +
> +	ret = drmm_mutex_init(&xe->drm, &pool->swap_guard);
> +	if (ret)
> +		return ret;
> +
> +	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> +		fs_reclaim_acquire(GFP_KERNEL);
> +		might_lock(&pool->swap_guard);
> +		fs_reclaim_release(GFP_KERNEL);
> +	}
> +	shadow = xe_managed_bo_create_pin_map(xe, tile,
> +					      xe_bo_size(pool->bo),
> +					      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					      XE_BO_FLAG_GGTT |
> +					      XE_BO_FLAG_GGTT_INVALIDATE |
> +					      XE_BO_FLAG_PINNED_NORESTORE);
> +	if (IS_ERR(shadow))
> +		return PTR_ERR(shadow);
> +
> +	pool->shadow = shadow;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_mem_pool_init() - Initialize memory pool.
> + * @tile: the &xe_tile where allocate.
> + * @size: number of bytes to allocate.
> + * @guard: the size of the guard region at the end of the BO that is not
> + * sub-allocated, in bytes.
> + * @flags: flags to use to create shadow pool.
> + *
> + * Initializes a memory pool for sub-allocating memory from a backing BO on the
> + * specified XE tile. The backing BO is pinned in the GGTT and mapped into
> + * the CPU address space for direct access. Optionally, a shadow BO can also be
> + * initialized for atomic updates to the primary BO's contents.
> + *
> + * Returns: a pointer to the &xe_mem_pool, or an error pointer on failure.
> + */
> +struct xe_mem_pool *xe_mem_pool_init(struct xe_tile *tile, u32 size,
> +				     u32 guard, int flags)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_mem_pool *pool;
> +	struct xe_bo *bo;
> +	u32 managed_size;
> +	int ret;
> +
> +	xe_tile_assert(tile, size > guard);
> +	managed_size = size - guard;
> +
> +	pool = drmm_kzalloc(&xe->drm, sizeof(*pool), GFP_KERNEL);
> +	if (!pool)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
> +	if (IS_ERR(bo)) {
> +		xe_tile_err(tile, "Failed to prepare %uKiB BO for mem pool (%pe)\n",
> +			    size / SZ_1K, bo);
> +		return ERR_CAST(bo);
> +	}
> +	pool->bo = bo;
> +	pool->is_iomem = bo->vmap.is_iomem;
> +
> +	if (pool->is_iomem) {
> +		pool->cpu_addr = kvzalloc(size, GFP_KERNEL);
> +		if (!pool->cpu_addr)
> +			return ERR_PTR(-ENOMEM);
> +	} else {
> +		pool->cpu_addr = bo->vmap.vaddr;
> +	}
> +
> +	if (flags & XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY) {
> +		ret = pool_shadow_init(pool);
> +
> +		if (ret)
> +			goto out_err;
> +	}
> +
> +	drm_mm_init(&pool->base, 0, managed_size);
> +	ret = drmm_add_action_or_reset(&xe->drm, fini_pool_action, pool);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return pool;
> +
> +out_err:
> +	if (flags & XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY)
> +		xe_tile_err(tile,
> +			    "Failed to initialize shadow BO for mem pool (%d)\n", ret);
> +	if (bo->vmap.is_iomem)
> +		kvfree(pool->cpu_addr);
> +	return ERR_PTR(ret);
> +}
> +
> +/**
> + * xe_mem_pool_sync() - Copy the entire contents of the main pool to shadow pool.
> + * @pool: the memory pool containing the primary and shadow BOs.
> + *
> + * Copies the entire contents of the primary pool to the shadow pool. This must
> + * be done after xe_mem_pool_init() with the XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY
> + * flag to ensure that the shadow pool has the same initial contents as the primary
> + * pool. After this initial synchronization, clients can choose to synchronize the
> + * shadow pool with the primary pool on a node  basis using
> + * xe_mem_pool_sync_shadow_locked() as needed.
> + *
> + * Return: None.
> + */
> +void xe_mem_pool_sync(struct xe_mem_pool *pool)
> +{
> +	struct xe_tile *tile = pool_to_tile(pool);
> +	struct xe_device *xe = tile_to_xe(tile);
> +
> +	xe_tile_assert(tile, pool->shadow);
> +
> +	xe_map_memcpy_to(xe, &pool->shadow->vmap, 0,
> +			 pool->cpu_addr, xe_bo_size(pool->bo));
> +}
> +
> +/**
> + * xe_mem_pool_swap_shadow_locked() - Swap the primary BO with the shadow BO.
> + * @pool: the memory pool containing the primary and shadow BOs.
> + *
> + * Swaps the primary buffer object with the shadow buffer object in the mem
> + * pool. This allows for atomic updates to the contents of the primary BO
> + * by first writing to the shadow BO and then swapping it with the primary BO.
> + * Swap_guard must be held to ensure synchronization with any concurrent swap
> + * operations.
> + *
> + * Return: None.
> + */
> +void xe_mem_pool_swap_shadow_locked(struct xe_mem_pool *pool)
> +{
> +	struct xe_tile *tile = pool_to_tile(pool);
> +
> +	xe_tile_assert(tile, pool->shadow);
> +	lockdep_assert_held(&pool->swap_guard);
> +
> +	swap(pool->bo, pool->shadow);
> +	if (!pool->bo->vmap.is_iomem)
> +		pool->cpu_addr = pool->bo->vmap.vaddr;
> +}
> +
> +/**
> + * xe_mem_pool_sync_shadow_locked() - Copy node from primary pool to shadow pool.
> + * @node: the node allocated in the memory pool.
> + *
> + * Copies the specified batch buffer from the primary pool to the shadow pool.
> + * Swap_guard must be held to ensure synchronization with any concurrent swap
> + * operations.
> + *
> + * Return: None.
> + */
> +void xe_mem_pool_sync_shadow_locked(struct xe_mem_pool_node *node)
> +{
> +	struct xe_mem_pool *pool = node_to_pool(node);
> +	struct xe_tile *tile = pool_to_tile(pool);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct drm_mm_node *sa_node = &node->sa_node;
> +
> +	xe_tile_assert(tile, pool->shadow);
> +	lockdep_assert_held(&pool->swap_guard);
> +
> +	xe_map_memcpy_to(xe, &pool->shadow->vmap,
> +			 sa_node->start,
> +			 pool->cpu_addr + sa_node->start,
> +			 sa_node->size);
> +}
> +
> +/**
> + * xe_mem_pool_gpu_addr() - Retrieve GPU address of memory pool.
> + * @pool: the memory pool
> + *
> + * Returns: GGTT address of the memory pool.
> + */
> +u64 xe_mem_pool_gpu_addr(struct xe_mem_pool *pool)
> +{
> +	return xe_bo_ggtt_addr(pool->bo);
> +}
> +
> +/**
> + * xe_mem_pool_cpu_addr() - Retrieve CPU address of manager pool.
> + * @pool: the memory pool
> + *
> + * Returns: CPU virtual address of memory pool.
> + */
> +void *xe_mem_pool_cpu_addr(struct xe_mem_pool *pool)
> +{
> +	return pool->cpu_addr;
> +}
> +
> +/**
> + * xe_mem_pool_bo_swap_guard() - Retrieve the mutex used to guard swap
> + * operations on a memory pool.
> + * @pool: the memory pool
> + *
> + * Returns: Swap guard mutex or NULL if shadow pool is not created.
> + */
> +struct mutex *xe_mem_pool_bo_swap_guard(struct xe_mem_pool *pool)
> +{
> +	if (!pool->shadow)
> +		return NULL;
> +
> +	return &pool->swap_guard;
> +}
> +
> +/**
> + * xe_mem_pool_bo_flush_write() - Copy the data from the sub-allocation
> + * to the GPU memory.
> + * @node: the node allocated in the memory pool to flush.
> + */
> +void xe_mem_pool_bo_flush_write(struct xe_mem_pool_node *node)
> +{
> +	struct xe_mem_pool *pool = node_to_pool(node);
> +	struct xe_tile *tile = pool_to_tile(pool);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct drm_mm_node *sa_node = &node->sa_node;
> +
> +	if (!pool->bo->vmap.is_iomem)
> +		return;
> +
> +	xe_map_memcpy_to(xe, &pool->bo->vmap, sa_node->start,
> +			 pool->cpu_addr + sa_node->start,
> +			 sa_node->size);
> +}
> +
> +/**
> + * xe_mem_pool_bo_sync_read() - Copy the data from GPU memory to the
> + * sub-allocation.
> + * @node: the node allocated in the memory pool to read back.
> + */
> +void xe_mem_pool_bo_sync_read(struct xe_mem_pool_node *node)
> +{
> +	struct xe_mem_pool *pool = node_to_pool(node);
> +	struct xe_tile *tile = pool_to_tile(pool);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct drm_mm_node *sa_node = &node->sa_node;
> +
> +	if (!pool->bo->vmap.is_iomem)
> +		return;
> +
> +	xe_map_memcpy_from(xe, pool->cpu_addr + sa_node->start,
> +			   &pool->bo->vmap, sa_node->start, sa_node->size);
> +}
> +
> +/**
> + * xe_mem_pool_alloc_node() - Allocate a new node for use with xe_mem_pool.
> + *
> + * Returns: node structure or an ERR_PTR(-ENOMEM).
> + */
> +struct xe_mem_pool_node *xe_mem_pool_alloc_node(void)
> +{
> +	struct xe_mem_pool_node *node = kzalloc_obj(*node);
> +
> +	if (!node)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return node;
> +}
> +
> +/**
> + * xe_mem_pool_insert_node() - Insert a node into the memory pool.
> + * @pool: the memory pool to insert into
> + * @node: the node to insert
> + * @size: the size of the node to be allocated in bytes.
> + *
> + * Inserts a node into the specified memory pool using drm_mm for
> + * allocation.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int xe_mem_pool_insert_node(struct xe_mem_pool *pool,
> +			    struct xe_mem_pool_node *node, u32 size)
> +{
> +	if (!pool)
> +		return -EINVAL;
> +
> +	return drm_mm_insert_node(&pool->base, &node->sa_node, size);
> +}
> +
> +/**
> + * xe_mem_pool_free_node() - Free a node allocated from the memory pool.
> + * @node: the node to free
> + *
> + * Returns: None.
> + */
> +void xe_mem_pool_free_node(struct xe_mem_pool_node *node)
> +{
> +	if (!node)
> +		return;
> +
> +	drm_mm_remove_node(&node->sa_node);
> +	kfree(node);
> +}
> +
> +/**
> + * xe_mem_pool_node_cpu_addr() - Retrieve CPU address of the node.
> + * @node: the node allocated in the memory pool
> + *
> + * Returns: CPU virtual address of the node.
> + */
> +void *xe_mem_pool_node_cpu_addr(struct xe_mem_pool_node *node)
> +{
> +	struct xe_mem_pool *pool = node_to_pool(node);
> +
> +	return xe_mem_pool_cpu_addr(pool) + node->sa_node.start;
> +}
> +
> +/**
> + * xe_mem_pool_dump() - Dump the state of the DRM MM manager for debugging.
> + * @pool: the memory pool info be dumped.
> + * @p: The DRM printer to use for output.
> + *
> + * Only the drm managed region is dumped, not the state of the BOs or any other
> + * pool information.
> + *
> + * Returns: None.
> + */
> +void xe_mem_pool_dump(struct xe_mem_pool *pool, struct drm_printer *p)
> +{
> +	drm_mm_print(&pool->base, p);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_mem_pool.h b/drivers/gpu/drm/xe/xe_mem_pool.h
> new file mode 100644
> index 000000000000..89cd2555fe91
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mem_pool.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#ifndef _XE_MEM_POOL_H_
> +#define _XE_MEM_POOL_H_
> +
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_mm.h>
> +#include "xe_mem_pool_types.h"
> +
> +struct drm_printer;
> +struct xe_mem_pool;
> +struct xe_tile;
> +
> +struct xe_mem_pool *xe_mem_pool_init(struct xe_tile *tile, u32 size,
> +				     u32 guard, int flags);
> +void xe_mem_pool_sync(struct xe_mem_pool *pool);
> +void xe_mem_pool_swap_shadow_locked(struct xe_mem_pool *pool);
> +void xe_mem_pool_sync_shadow_locked(struct xe_mem_pool_node *node);
> +u64 xe_mem_pool_gpu_addr(struct xe_mem_pool *pool);
> +void *xe_mem_pool_cpu_addr(struct xe_mem_pool *pool);
> +struct mutex *xe_mem_pool_bo_swap_guard(struct xe_mem_pool *pool);
> +void xe_mem_pool_bo_flush_write(struct xe_mem_pool_node *node);
> +void xe_mem_pool_bo_sync_read(struct xe_mem_pool_node *node);
> +struct xe_mem_pool_node *xe_mem_pool_alloc_node(void);
> +int xe_mem_pool_insert_node(struct xe_mem_pool *pool,
> +			    struct xe_mem_pool_node *node, u32 size);
> +void xe_mem_pool_free_node(struct xe_mem_pool_node *node);
> +void *xe_mem_pool_node_cpu_addr(struct xe_mem_pool_node *node);
> +void xe_mem_pool_dump(struct xe_mem_pool *pool, struct drm_printer *p);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_mem_pool_types.h b/drivers/gpu/drm/xe/xe_mem_pool_types.h
> new file mode 100644
> index 000000000000..d5e926c93351
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_mem_pool_types.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_MEM_POOL_TYPES_H_
> +#define _XE_MEM_POOL_TYPES_H_
> +
> +#include <drm/drm_mm.h>
> +
> +#define XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY			BIT(0)
> +
> +/**
> + * struct xe_mem_pool_node - Sub-range allocations from mem pool.
> + */
> +struct xe_mem_pool_node {
> +	/** @sa_node: drm_mm_node for this allocation. */
> +	struct drm_mm_node sa_node;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
