Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E2ED73E9B
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 22:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C609010E8D3;
	Thu, 29 Jan 2026 22:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZPYSO3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDDA10E8D3
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 22:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769726409; x=1801262409;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eRsYK2JUzhgeXMfP38YDqHWVrciTPDqDN5CLn1+nYRU=;
 b=AZPYSO3Y5yQSJZSiLOPOetY/UyNjBRjlfDXO2BoaqJwxkMahhIPFUCI2
 aV4/6wa/Bqa2KhRjQbHS3EjT+dhVROcChRcbtpXTSKDiQ57WcxdNoINju
 E/SRU6LhtXKiBggvEirits/02o7Trs7GAmw2+pPBTe5Y6yieoGxlCQaGU
 75GwZNK6llsHoVmPQ0HZHq/cKEzWmvkiVH7KU3wh7IvDPjD6ADLUPFhnG
 NzflukdPHjZLAYEM5prdO8vXayuGtI26C8FagREDu/6LueX1ofWZ7sjLt
 q55CVCzhclS9JlgqQW3IMC7tK6rEp1tND9bzQEkJMb7jh7WmzXXBUbfBH g==;
X-CSE-ConnectionGUID: MmI5hBOCSTmFaKNh9X3mcg==
X-CSE-MsgGUID: 3c/ahn8bTfioagx3Pntzsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82087900"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82087900"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:40:08 -0800
X-CSE-ConnectionGUID: NflLeXbLTBOgQ5pUJ4Er7A==
X-CSE-MsgGUID: bae5ZJVrRBGyD8uKIYLRwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="212782796"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:40:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 14:40:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 14:40:07 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 14:40:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyA8YCXp5o7sE5v0Dty4fh+E8vFYjAKbv73qvL6ICxbM8MvcLL7j851PkqDLuiCoyHi/wqKXNdqktEEOYOdjGScla1AgDy0CzWXXQcS01gJf/3yefXQxEd/sRkJub7xrVwh694iI35duLC3dMeo753DC+f9V3n/FmL6ysiYjDb4sesI/zDpZfQ389Ufkr0hIfsvDb1OHLZ7UvOh4dFlBO1wWFGzxP24YP60AxKgAyyBe0HhhIqjXGQFAs89UhuJX4b6sw9RgPP8X+5+5qgWQNxprCPvGJQUKkzpEBNSsO5hYanyiQXwZFZnnFrjmUgaRD2OBBtpkm57JkwKQ7z4qCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tE+oMA21NWuPLhjSN9jDFyxjtWYFSUhZeqwnECsYAME=;
 b=ZYX8sKPgVyvrRkbpwuA/z6aDEc3DMA2nqyqxNIhKzgWygfwP/2XqnMGpIQ8IQaNXFoRbwpz2v82esVAfzshj24r1+SFe/ROs4doazI9zsM+pnuZf+guYKqRaeHP7mIsEkcYa2xlHxNrFGy73aPrWGqqhu/njd06PcHNAnQ0gYsjCwag5Z3X3aKC1jOhI9xeS62+/RbQVVISoMV7awDhoq1sIE+G0RTpxF1LQtV4L8TM1YUt7hT2YIQXS1FiawxmjjnBrpf9z/shzwLymppak3zgKq2CJXcvpdXlaE14c6uxH85iL0ZSB26Cu04OxL2SzV0jUrsTGLoD6qv7RXBQtqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 22:39:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 22:39:59 +0000
Date: Thu, 29 Jan 2026 14:39:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/mmio: Avoid double-adjust in 64-bit reads
Message-ID: <20260129223956.GF2174980@mdroper-desk1.amr.corp.intel.com>
References: <20260128211250.3643131-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260128211250.3643131-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY5PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:180::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf0848e-db81-4d55-1c85-08de5f87554f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zlZ4yHjljr+9aXW9eADyqKrWklQEZ/x2HujEFx1gc6ppZKm3AL4UJATHCimu?=
 =?us-ascii?Q?rdh6Fy3f8cAEUDfBQzUDaeVWf0Q45KA3dqLxHUduO1tPc5XhJOzSFyaN94dD?=
 =?us-ascii?Q?95EcRti8yN5a4PvA/dZX5vEetV9sEtbnDI4dEak4gOLjMTevmUYzZMaIl2B1?=
 =?us-ascii?Q?yPL+8eSI8M74f7P/XYk6f5cco9zEmlx7o4nouwucmaxn9G+PoCJ+44xS61s6?=
 =?us-ascii?Q?vg9ci1c3cFRy8JDVCw1jto6UxljpbzKAQ82T5s1Y84cD1ngN50BEF5VXBO9q?=
 =?us-ascii?Q?rDv5B5DtMzLSfbq6pYHTKHpwkyHN98UOwwleUYDcrCKrboYcq0PjoyBHJ8uh?=
 =?us-ascii?Q?ZzySvrQ225DUS4zA00I+75HmjG4edqyE2N1JOPXPlaXootPxpF3U6oGXIBll?=
 =?us-ascii?Q?Fa1WHfCZ+9tJoTmf2zD245LtdiBiLJ+OwYqBJXR7UH7zyD4GS1Jn4DVKUcYZ?=
 =?us-ascii?Q?skVWeH7TnNctb1Ws24nMVA0tD6WtzRwSpKegeKzDn4C0pXs1ewBVIjjGiQ85?=
 =?us-ascii?Q?u0s8/tkMaCi/6TYiJhbvtebZwGRc4ozd2VI/eo0zl16tPrLhnXunxbaswRmQ?=
 =?us-ascii?Q?kAU64vnvrhWlc5pBsA81I/P6axID9Cqg9q+R8k3CVnA7vYAY1psNEoQFVx6Y?=
 =?us-ascii?Q?CnFNxFFm72p8bGDrO84uIgUiCOl/yFlLMuFPpTzpA3KR4a2UL8K4qpC7Dj+w?=
 =?us-ascii?Q?Veg4xWZ6FjzJwEN0Le7iPUdXsq3EuuRjLEfYDBB7mECZ6EghSD1+CSnio3yM?=
 =?us-ascii?Q?pZLlaaAYUT6ep4rF8rIzw19vFPGmUc6QZryS1KOV09N30a3gQu4++6Xs6Jvm?=
 =?us-ascii?Q?a6WNcakdbGUmFgtTJBie3kbexSu1Lij5LyY8NgcFZ34kX/6POwsOqeoHKk9Z?=
 =?us-ascii?Q?El0/FLeCvDh1PExI3R5Ny4k09Kq3ICECE6e3gWGKDntfoplm7EZ9QNi6TsSd?=
 =?us-ascii?Q?//1CEfiuOaG/THG1qoh7gnFXr0uM5zceeW3RTKvl0KLBuUQEGf6qLqq7WchF?=
 =?us-ascii?Q?9Fk1//Ykg7Hp+TstdzBx8SRedbuZTLUSgUin9tlJx9iUBYQUsTPO+w9AT/Wa?=
 =?us-ascii?Q?KoM+Qm7YbfJrcvxMQ+THBgoodqudNBeQ1BtJCD8UY77wl25GwLtI/NF4uUQa?=
 =?us-ascii?Q?Dy2wxXj5T6256eF1vqG0iuskyv6lYPwC88b4UMZpnq3wPYFaJh99zEuKPpcz?=
 =?us-ascii?Q?rDlrjkUXIIaMqXEbMTYFtrVnzEMUBQYvAjtE/W7KDnMS4C7DbBnHc8QTmv3R?=
 =?us-ascii?Q?FGk50xiPxs48NXSKIxEglIZo9Ac4GedRQsoV8iQ4h/G56YW1Z2m8qnF3Bl6N?=
 =?us-ascii?Q?XPhf7pq6ddtJ87bnEz/l67WD3O+8vgkvxZGC4Dr2iBNwEwJCkbRczdf9Rvs1?=
 =?us-ascii?Q?hUQRKAX7RY9apiPeIvGjxU9MjmTMQf5hRWY9O5D9wv0QXSu6jDmuDhOY4JUp?=
 =?us-ascii?Q?9uIMlXe4jrYYWKqrEsKzG0sbncsC9PmUHMJ+PloyTAU6XwVXo1BZs5oHGHLc?=
 =?us-ascii?Q?KIXkAlFOPe/QBvSTBQDONJCZwx3Lmj/XmYSAscTgERc3FVW4TqBPM4UJ6bl0?=
 =?us-ascii?Q?R9CfBR9f4P/n1sVaKIw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1e3HPJNJTDommeW3DHz7vCuRs/E+wlj3fdNhBGX38JCbabiM3Iuun0uAWtZA?=
 =?us-ascii?Q?rgYiqKeTx/bVRYGipdwLlNQTLr02SVnALTg/liXscMZSS6CbuWld2KLdamrU?=
 =?us-ascii?Q?hnocoyp+XKWF1z+HjtYyMVy7mbV6NFgWQ75QpvoS3Zr6uVIEzKmOPOO2pT08?=
 =?us-ascii?Q?v2hGlHKa06dIuQ6khsBI4RfbDww93SbA0VPFc8rVGqUx/ijvaM1XjDexSwr0?=
 =?us-ascii?Q?5G+grLT0mBki1Nqq+gCJwVigh7BqY12qLvBZxE2LjxDSNi+sy2c3LmLpnH9P?=
 =?us-ascii?Q?bCq6dp8JBZGfT3/GmFZNc8UcrP6IOdMsCULTABkAe6AbFCbJTvpzGGgBa+cw?=
 =?us-ascii?Q?jj7wQyN28Dh8fnOBUIZCFtK8jCjr+DjQ6s7sfOKZCuXw/oomaV6VggLfnuEe?=
 =?us-ascii?Q?jB5ikdRWFvvPZNTFfyGVwDBcOq64XD0hfBjMgRMm5Qa2+kuRx7slcWdMO2v9?=
 =?us-ascii?Q?TYmuwj4LAFtGo2VNJODP2ohPkXD8Fk7umNSV8qY5Tx108lHSY+eETbVp+Grq?=
 =?us-ascii?Q?0kn1f0HKPB1BDoB8F167FVur5tBlw/IBA5wLGswYVCNAI6dICKliL8aS0khd?=
 =?us-ascii?Q?GM8Mgpwvghc5RtCwnwTP1ZLeecIbeGAZQaftz9RQq8SxHZF0/rizwP2//N7c?=
 =?us-ascii?Q?qvssGNOexskYuEtpBajrEcqVn/snbEELcXLGL+ueLXMxU9FwRoKCrZBtI+zZ?=
 =?us-ascii?Q?dNUwQ3gd7Yn/yfnG3kx++aT6KKbiDgJ+jZwo/JNuvQPlacC1E2QAx35gjk/O?=
 =?us-ascii?Q?wzOMGRnYTMqyjp+GZBffzPZXDsCYUUzN1pJu8iyow94Gdg77Fw05gSfQhPhw?=
 =?us-ascii?Q?rr5Vc1yVmVAOHL3K/YLw49b2bIvhCiX6DQbrg6GN91PrQZMqW1g8HqL3gKbB?=
 =?us-ascii?Q?6eBZmbPWavQlZwvJ9RA/0fNElpFKiJI9K84L/BsnnErHM7NWxZaqWWEOohi+?=
 =?us-ascii?Q?YUS4lYvgraBvKlh3yspIrGV0KTYDyXIR6AJspVhPfH1nSr1VH+e4odNwRPl2?=
 =?us-ascii?Q?3PokUDitbWjLm3QEcm/sIS6WxsR61a0BfeF3C9C284pfsZN3G7cNVAVB3XGz?=
 =?us-ascii?Q?MeMx2w9J+BDjW9cMq9c2CyAQRfBvRerpQQAsY4J7qusbZiY1PnbNgEvAnZfk?=
 =?us-ascii?Q?8f1SA7ktMnF3PCistFyiQDk8RQqI5NrZgym+/18yApxIwjoc/QNf7lIeouBk?=
 =?us-ascii?Q?/AH8a2ynlMbJtu8uJd7dE6WD5ifL7uaTjYNObLfJtktL3jUYR4yxBj9xxyk2?=
 =?us-ascii?Q?1NNby1M3RQjf6HFtFsXKMPaEsGoBO3nPHTqimFCdBJmeqULtvlNKzpK/9h5Z?=
 =?us-ascii?Q?q0dRJglBLykzSI+uyEdRhskLSef6m9ypYdlm5evrvfj2LQMfTPpLil5zqtu7?=
 =?us-ascii?Q?vsZHDnEx0uZxVFVp9TJxCclTtAknXjs2AfDohpIQh5Go/ph4ItndagAlXvBc?=
 =?us-ascii?Q?K56QJH1e/L4ylwXV2P7HRWrlc0Ke3hVDFB9aqBP1YshofxfYLXpqftLCrW0m?=
 =?us-ascii?Q?a8mJivM9D4z4ma8c7sza/Rx2gtpmTTauLvjkIJZHjoBHOiRilyhI0idYz/sl?=
 =?us-ascii?Q?hhEf+KnDLf6x/4++sTi/SKijJIE/e585CxTFkaSnM7JpIfAiPa5FfYp3EFy6?=
 =?us-ascii?Q?uNNZe1dQnDnAaKwEmr5pRO6mBUVaYy1WY3SXvFbGHHRdsNg1v1znOOilUHYv?=
 =?us-ascii?Q?xQrnsXu4Xo09awIuyqBt3ZOjBnrh2Dg5ydlMW/10+2MawW6srq87Pvf7Beem?=
 =?us-ascii?Q?MUA45X2wtpF/WWP91fJJyc9MJeJvu5I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf0848e-db81-4d55-1c85-08de5f87554f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:39:59.3410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3JWS4On2mR1/ef0JgPJjw0Mh+c7YSC9H7w6aCLQSXqBhzIrQTMLn5BR3SK8e+zCRP6h2CWUSGBtYzPBVvEHY1fit0PctIQDKdUja/cXPTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
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

On Wed, Jan 28, 2026 at 09:12:51PM +0000, Shuicheng Lin wrote:
> xe_mmio_read64_2x32() was adjusting register addresses and then
> calling xe_mmio_read32(), which applies the adjustment again.
> This may shift accesses twice if adj_offset < adj_limit. There is
> no issue currently, as for media gt, adj_offset > adj_limit, so
> the 2nd adjust will be a no-op. But it may not work in future.
> 
> To fix it, keep the adjustment only for a sanity check and let
> xe_mmio_read32() handle address translation.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index bcb6674b7dac..76f8458c8ee1 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -255,12 +255,17 @@ u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
>  {
>  	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
>  	u32 ldw, udw, oldudw, retries;
> +	u32 addr, addr_udw;
>  
> -	reg.addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> -	reg_udw.addr = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
> +	/*
> +	 * use adjusted addresses only for a sanity check;
> +	 * xe_mmio_read32() also applies adjustment.
> +	 */
> +	addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> +	addr_udw = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
>  
>  	/* we shouldn't adjust just one register address */
> -	xe_tile_assert(mmio->tile, reg_udw.addr == reg.addr + 0x4);
> +	xe_tile_assert(mmio->tile, addr_udw == addr + 0x4);

We might want to rewrite this sanity check in a more natural way:  make
sure the adjustment cutoff doesn't fall anywhere within the register.
E.g., something like

        /*
         * The two dwords of a 64-bit register can never straddle the offset
         * adjustment cutoff.
         */
        xe_tile_assert(!in_range(mmio->adj_offset, reg.addr + 1, 7));


Matt

>  
>  	oldudw = xe_mmio_read32(mmio, reg_udw);
>  	for (retries = 5; retries; --retries) {
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
