Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1395BC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 21:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B753810E1B8;
	Tue, 28 May 2024 21:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPXc5YrA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5386210E1B8
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 21:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716932131; x=1748468131;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VpVTDBdUJk65PGZ8jvCif0xFKDDdp+LnDVONvot6ZRc=;
 b=TPXc5YrAGK4UGYRhrzCR3M/huUEtX+kR4QazKUxashfqBzYwq6zP6Jq+
 x3lHzkobw8SViWwOUs9lBB6kwCBW8/hwyJsZ1O5l3tIqTQTahi12H0MS+
 GnCfPnBFvtfN/MiaaqK8XECdBZrl9W1U+/c78wdyaHoi/AI8kRf4kskCM
 OJPAvhc+FH/sDmwIFpH4nUvr1NLgUpZGPdg67wrZoKiZOJPa/2vRarxz/
 Tm2dWCMiZ8KtN9PsF5iXG44R/8kONM5dtIUk09Plk1SXDUD4ajVcScLk+
 uXgUg/160IktriBYhM7fLhsyoC3m46kxai4Mm/8RCBbmwSHBpxQRaU/+E A==;
X-CSE-ConnectionGUID: W/H89aNfS1KKLHW2gwDdHA==
X-CSE-MsgGUID: Jsdo/iGFQsGOsuZ3ZCrPgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="35830011"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35830011"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 14:35:25 -0700
X-CSE-ConnectionGUID: zkLMiT8aRK+iXow0JqO2RA==
X-CSE-MsgGUID: ECrEEv8ERuKMa9UrzMpeag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="39725895"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 14:35:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 14:35:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 14:35:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 14:35:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 14:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVq5c6FjUU8y2LusI3iT7PB1SwQnXvQkipNZD+/2E0VNPtbQCUL01WRWuvwT+I4syads45dTzQS3Zps5t6PsvKmAB+/SzxYLJzHi/5npni87ZXCf3Lmu1Y7Xi/TaqeZkCv5SAdHwLNBx8QwGjAwpQ/StUKzBfPVr2hvZ0Mi93T2p2xxHlkthkGTbQv9o5UkkdsWfifABeZKxfOZyuH/f4A2/mZaQkdaeesCsiTSDEJAQ9JETqojhhv2p6oJz5MQ1rfpbR11qzhJO7N5eNbLwI+qB9SGPLpjiExjyeWW/YRySfLqFAfTtrHDeb/SDgVVE7vuX6ZHrczkkSa+YRK50Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ab7zvD9YAx150Y92AKPr0g1j60sFVgd5O2mYVCOBxE4=;
 b=eNq1V5DkIG6gWKAImVvUeqyD9MaoNvTkHuIq3Qcju+z4AYC22CUux4lk4NCJL3Kmv0ZIWVQR3eLOb05oldOiNbtPZQjfRNiarQ2/aH/Rp3zZDNvrvgPAf7/bt8t5pg4f1NmJ3ga79559+F4xRDuVtQMg2uE12k8GNt6ORXPutaB/H6a6qv3IaMVh4Q8jHNeQUq+C1UUaYCmxkGAfw7V2vAJ5vVyoJl+q6+DTuKgrrnUX6dt3jhCJuKr4x2BW50jn2rX1Y8AnbBnLD5gCV5sMxriBVwPN3YSVwx9eXHiH6N5+P+5gwnj7alExE3qTYqUIbYEZBwHDg5hCu2LujNj+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 21:35:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 21:35:18 +0000
Date: Tue, 28 May 2024 14:35:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe: Rename internal vram helper function
Message-ID: <20240528213515.GI4990@mdroper-desk1.amr.corp.intel.com>
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240527173554.1108-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0087.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BN9PR11MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: e15e3c6a-e569-403e-025e-08dc7f5e11a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bbPkp/U8YR2Kykrup+xaROJUZ8ciFlvqwVLuq0EGWHj2XImhdJjksJ2Y8w7H?=
 =?us-ascii?Q?ZnwU11gRuq1gDoRxIpySuGbl76ms02ks6O76OmS/EDt8aAR9YO1i0ULYAPx7?=
 =?us-ascii?Q?hxANI2Fwj+bbJ17+tp6U8LGePFy8yZU+bokuDF9mQR0JMLUg8wo+pj63Bxnu?=
 =?us-ascii?Q?uXi/8g6AlF/wRhnc6qknpzjBlL+owytZbmsQpOX3iA9TN0L6y3OicJoRm0HI?=
 =?us-ascii?Q?1JnTd/MbEtUFU1MyNHVaeIBqd8+BIz2uNQ1kMTqca8mEDzRXjq5qrbBOFAuk?=
 =?us-ascii?Q?iO9NyGhCwPFCsHrOT+DhEbMUoHgQPBPI8x6W78QTj1pojaoWdvUQYSmCLxmP?=
 =?us-ascii?Q?kocd3ghQZk+hYKN0JhwoYshOKacmku4vAjbQl8TiGdLoRr+5xxnYBqUGFZ9N?=
 =?us-ascii?Q?0NFaIiCORpObJMNT4M9DSR5124tfXzGFh9gtUOpthX470C8IRRUM/55HCXwg?=
 =?us-ascii?Q?BAUB4WozVE2ulT0omPR1vB37X9sFvtbrTT6hIhs6WV57ynsiV2K3zwBviGwQ?=
 =?us-ascii?Q?tN9YLSnucGwcn4wLqN9Ym5axtSd0WctLpVQmMoIfrfXHu+uHwJr5gGv+0BUI?=
 =?us-ascii?Q?nYN4GGKooird94G0Iq6SCoMPd3vQvoPvqQfApDP7xdpu7rjf5oK6jrIKvGWw?=
 =?us-ascii?Q?CYWAX4BcYeNP51/WXXsJADmKTgr4dOkxePnbMbGs4QVn4XhUfUCkArG5lUwK?=
 =?us-ascii?Q?O0B/Oa6N0Wjf4jKqJVRmDq7cvbIdzVY5OhMLdaZcOGY3yfywMQ9OsX1d1Wrv?=
 =?us-ascii?Q?BVdTKEH/zCrwzYuGXXjbDwXdF4EQ9R2Fd0aug1iYaiZZRMajGrpwdesNTwPM?=
 =?us-ascii?Q?+4ZH1gFMlwBqOgkePEtDTdTRZ9/D9R3rHlQ9jfL3BuDwuWKA9aJCbPQ5YM0l?=
 =?us-ascii?Q?8EUc4vDHs0xLOWBp+bG694JkqiS07I0r/tqghi8m+hb5uXph/pQK9BwiIQIv?=
 =?us-ascii?Q?hjPUusf3RiPDZyWnvUrDP6LixVAEZyllzMmsdFtg+w6KHnELX2R4n/oSUPpA?=
 =?us-ascii?Q?K6Wi7Jt73P7rqK7y7qirJbl/XW9jqi4RksKNbPHBNlr44JbcFKiMRRil6fPS?=
 =?us-ascii?Q?kv3t9tTSRccTRLq+E1KA+SJfw0jGyuBe6Al251SXYPrBJnXqGl5II1EkQMIO?=
 =?us-ascii?Q?94AXvqiDUskn9BC95936r3V5zkdcy55RHXyGKdtsW2jCQCEbFN293AnUB9Pz?=
 =?us-ascii?Q?TP4tAdRfQmSUsBD57C2zOiU/5f6e1KXVtKhTLx8oJphlfng3iDvl8BnPdVqC?=
 =?us-ascii?Q?MyOC07SnBWQCGBUpKDSYSJNiwx3bJER61JJUnCYpFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cRhuA8IJUgeARM2Wxsg9svekUOaIh/ZraPtsLUnqKCJ+GEiD4eYnbQ83aURA?=
 =?us-ascii?Q?Vf/BoFKeVlL+//dxkQCC20WfM5+Rg1Ry9Cpn1+/IiJgtEx7dah7KAj+s+eR/?=
 =?us-ascii?Q?X1xpxACmcO+V2OI36Gq76dQhTq4dlFjWvUdzZy+YX3Xompf3z5CvIRGUKiU6?=
 =?us-ascii?Q?mCnILSb38KWbdgZGUHB0mbFCOtct4XOYQdrJdaRjP0moDgo79aENYo0y7onp?=
 =?us-ascii?Q?8y4WhX1YvUlznUlgsHE0K4qhKDAzcgRVwsDTZFoMfbTphg0zQUavdF7vUxDX?=
 =?us-ascii?Q?WikuUmkp0oGhGou8JrKjtB6UaujTuNBmb9CoHIMReLhUkkeGkx46jq1ZQNbA?=
 =?us-ascii?Q?eDzLR9vGzi/+YqfJ95ttksBBwnPRzm5K56u/FuCRqof+bGJZ6byU76RqDMU0?=
 =?us-ascii?Q?/bohgsVmi3er2DEHiTmDctLUZyZdyjUdb/sfjAPIMxwMb+PwoP+s0An5uXjO?=
 =?us-ascii?Q?Qup0h3vwKki499g6Aqxqb7156Xz+ToVRdQG8K6zsTkZwg3IwkwyNjJR9yZeB?=
 =?us-ascii?Q?mE2NRDp4GGl3UDTxovvyLyBN97UmP9d6BJbtG0IG5sHndmHfTrlhWbH0vcvH?=
 =?us-ascii?Q?PXZkZe+npypmuLM/2w+XkkYVBHyVM5Hj12gG92m0m/2sGQeGqg1q0DcLpQ6W?=
 =?us-ascii?Q?pThCA/TJf0nllVkmDtW7MzAIj9DhItibFOGL43Qap9wRhpOCnD3PJrgospEd?=
 =?us-ascii?Q?I14fhVX+Y1u56Dkay+QSzhBZEFtTTkeR6RqIcwid6RGlyf3sgSHDADJLQPIf?=
 =?us-ascii?Q?iBWqDjqE2hLfKUsXVOfck7mVb3TSczjvam5h3OMk5lL3j95co/7lrVtHLVUK?=
 =?us-ascii?Q?l7Gdule3t99yxnAC0pelTfwDeXu5nz8XDdBwlJqm2waF/eJMzmutZva1a55D?=
 =?us-ascii?Q?lyQa+ai4MYixr0L6S9KRz7R0PPyEFS2FB2Z/Af4RLekzBb649gJsryoP7npK?=
 =?us-ascii?Q?4OhMYVK1jbNEHgHQkpwvx8DD5pIeMSghrRUfi2eTBxcgsZP9JUHnRkqMLYZD?=
 =?us-ascii?Q?nXmLPkOMu6S8WV8zrmhwL45PNPymMIKB5PwteNoiJ4FlLLzWwFeaZFk1qXhZ?=
 =?us-ascii?Q?1OG3/hUVmbh4PHyo33GPrwVQLhXfnw4fOc5ssdbQJG2WtGLzvKvliD6eGZkP?=
 =?us-ascii?Q?9n/SRbB9TFMRnjb4zE3z2h/K5hylJ3yfC4gE79LSiL4MegVnxpV22wUN3k+3?=
 =?us-ascii?Q?lwaxHvn+cZuOoBe/OjfYPOf13YJcwmfFPVjU4ReuHBT4qYhUWfur0swXZHkG?=
 =?us-ascii?Q?o8gw660WuUpJaygHNpvO30ltls/lDMG+sNcdHRSw92FgcMLDmuVyleds38AV?=
 =?us-ascii?Q?g0mIyvcRakSz4WAC369bJNhrAxRy2oInYKIjWhw6oTUyzsKtTix0vNddMQwR?=
 =?us-ascii?Q?Te0rCvBosBW9+n3mdq5fK0W+q9Nwl7ocf/xCOvMcwzj4bL3m2D164wHO/k2O?=
 =?us-ascii?Q?9+xUrXjNV0aWimmh1HeugCcJCnZZe4Zkf9cgXU5LUlHfTYfn3pwWvVmo5kH0?=
 =?us-ascii?Q?ubNkln4Wj8zvGqFEWpO0KH7R7ts3aTRZeMUJG/h1uQM4JvoBhMVD8O412//G?=
 =?us-ascii?Q?Es3xqtbHOywU0DcE0FfW7u/vIdUf9rjMDL8bhRR9V5c7rQzGi6nefPaBb6lS?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e15e3c6a-e569-403e-025e-08dc7f5e11a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 21:35:18.4706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +S01FIxNG6770yj7+pZ/CPfKekNdE5k84YLTADsARyImnK7xPSl4eoWyWbfSvGoQMRS4xNsJDoCshnKLTZ7zYh+lXqWHhR3yHLZMDusqx+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
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

On Mon, May 27, 2024 at 07:35:53PM +0200, Michal Wajdeczko wrote:
> Drop no longer applicable "xe_mmio_" prefix and downgrade the
> existing kernel-doc for internal function to normal comment.

As noted on the previous patch, there are several other functions with
"xe_" prefixes even though they're static (xe_resize_vram_bar,
xe_pci_resource_valid, xe_determine_lmem_bar_size, and the
xe_mmio_tile_vram_size you're updating here).  Maybe we should drop the
"xe_" prefix from all of them (and "xe_mmio" from this one) before the
movement of VRAM code to a new file?


Matt
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vram.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index d8b81e4e050c..411e8d23fd4d 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -192,8 +192,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
>  	return offset;
>  }
>  
> -/**
> - * xe_mmio_tile_vram_size() - Collect vram size and offset information
> +/*
> + * tile_vram_size() - Collect vram size and offset information
>   * @tile: tile to get info for
>   * @vram_size: available vram (size - device reserved portions)
>   * @tile_size: actual vram size
> @@ -211,8 +211,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
>   * NOTE: multi-tile bases will include the tile offset.
>   *
>   */
> -static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> -				  u64 *tile_size, u64 *tile_offset)
> +static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> +			  u64 *tile_size, u64 *tile_offset)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_gt *gt = tile->primary_gt;
> @@ -287,7 +287,7 @@ int xe_vram_probe(struct xe_device *xe)
>  
>  	/* Get the size of the root tile's vram for later accessibility comparison */
>  	tile = xe_device_get_root_tile(xe);
> -	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> +	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
>  	if (err)
>  		return err;
>  
> @@ -302,7 +302,7 @@ int xe_vram_probe(struct xe_device *xe)
>  
>  	/* tile specific ranges */
>  	for_each_tile(tile, xe, id) {
> -		err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> +		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
>  		if (err)
>  			return err;
>  
> -- 
> 2.43.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
