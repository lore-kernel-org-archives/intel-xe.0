Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A634AE6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 23:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351DA10EAA2;
	Fri,  6 Sep 2024 23:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZytKXktv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F52E10EAA2
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 23:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725666931; x=1757202931;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e+l1p1mWPDODU0hO+pWHpwQoPwKVBMxiJluLoMsMraE=;
 b=ZytKXktvTBCnJVlqDYRnP2tLfqhDaXLj3XejFlDi2GYItTis5pMhvcRS
 hZOlW+CImtq8hNZsYLRW3XevLEa0I4IVg947u7vXT89NjWJqJOsMW5lSe
 GZ88L7FBgusETWrXl3pTkMbx6wOMIh2s9kBea5JI3BvyucncKf+qRbL87
 w8H6mvVejdPrbhg3mz41Q/s7BUWURYrqQrwao1dTUYuOZcYk0zL9MltfU
 cYEKHQkWD1DFKc9rLgmDqxXe4B9twblUTBrOC3gCiAOHur5vgyD2VNE+7
 qjraoX5Ti5jsDr0d3jcwPhJ027C7r4tqKX/Uqx2DcLG6KmCKf5WTfCpXR g==;
X-CSE-ConnectionGUID: 4rHvLZ4nS9auQQ5YtheMow==
X-CSE-MsgGUID: 5B8+IVcaQnucBH9fAiyQZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35035597"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="35035597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 16:55:30 -0700
X-CSE-ConnectionGUID: mpyrjk4HTde0aw/O0pzFuQ==
X-CSE-MsgGUID: lPFO5vNBQrOhN6OPB2ot7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="103567783"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 16:55:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:55:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 16:55:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 16:55:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ev0LhXeCCUU6AUG/sb2LX9GOKz4KR3/YkWDxGlyL+prLvclv7mcCTiUMFYBxYGK8q7rBNOla+3+Z6AEzm+2cYEkkxv0TdGJQqGVStYEUP2oZClaEnERGQZBfAoLEHrY+XUN5kHIVAq3kSU/YsCSDCP73H//Lt7Iaky1oyLnkNg/ZhG2wO59J8UhRFjz8SYN140laf50NMHqmqit0FDHRi0rQW0Uu+966SNK95YbuBAOVbgk+PO+Lxt9oO+PKkxDZTc+YJzM3skRQKWRI2cvJKgHrPsg2SkwtZhp5p4XJ4FuaEExfE9KjXPpI9s7ey3Hworxo0Aqvzxwle/l7RcwrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9mtj5aScnX+hGHRguH52Hbs98dnaO8ZJd8UdJRb950=;
 b=txITNGnO7VUOyG7aQpQpAQdsttjV7LvJw33heK+ZPJw1LHEofpI9uHEx70br4XD6foyIDLKif1eGCoVcQhpebjokP5Y1ZtwPm23SFM3JFXFlVnCDg+Hvf5RiJjkZA1m7UKsPxcqQ52OVVF2S1ookZ7BrlltmqTUw5tTDQsK3SzTdV+8wWUazWsCoUhCDk/NDPiT5fKo4kURQhls87bZPj4Bi3obP1guk6Xub8kyiS99qQSPxipnoqO5T7jt5ISjkO/8S6qN3VO73SaoNTW0Z87RFMsmGjMiKVKP/nKj/JdXgBlqzgM+OoBfFu8M420KZfCHtmqSCm+/UmQSB8j8Ijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.18; Fri, 6 Sep
 2024 23:55:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 23:55:26 +0000
Date: Fri, 6 Sep 2024 16:55:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/9] drm/xe/ptl: Add performance tuning settings for PTL
Message-ID: <20240906235524.GA5774@mdroper-desk1.amr.corp.intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-9-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906215153.31210-9-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 4143f729-414f-4793-a178-08dccecf612c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VOAT+VEib8vIHcE9aHABXfDxwBUBIMWeF3FbfFjK4UXKbCpl3hsCD/yq30x6?=
 =?us-ascii?Q?GYWO+B1G3aijKw8ZRERR22Dm51DXhIp5dvGbXgYFAL4I6cpfVDdeWKf6ZMOy?=
 =?us-ascii?Q?bt38aYDjwD2PPRsThiSVhLC4AvuMo2FXBoWEdDmYlLQHZIxoIwtu+Rx3kgM8?=
 =?us-ascii?Q?fsPT5LLxGQZBYU2kilLEAs6t12z4fLXg45IfvGd0ApapqsCc8fjtwvJgovAD?=
 =?us-ascii?Q?keqoas1RFkiMUrCpI6A7jbP4ImX3pgRgZbcm+o4a5jZ/ha8/0iiJj2E7ZTUq?=
 =?us-ascii?Q?RWOC4thoDWJB+7e/6I0LOm+5W6WuG85KLjOLsD7wxL185t2FLa3FBmausBJn?=
 =?us-ascii?Q?lOuuiTUoFZML4vBwByLINibQtHXt89FE0+KziskZSM8Hlp6YPyqcBHlf2PMP?=
 =?us-ascii?Q?/i98kn4KcrvDM6hlLLxDAeRgbond2GbgZLzFzXLizZfbfVuWh+Fp9yJjtR7S?=
 =?us-ascii?Q?6rjyeVHE9K0C6kUYComJhq/MZUALSSteJ7Ilh3+7g7KWyaJQCiZshhjMk/k/?=
 =?us-ascii?Q?UgtVYT8rynkxp1Ufdu7kTkXjT+0E4Hk9uo0jrChxo0V0y958No8sIvFJ4QCP?=
 =?us-ascii?Q?ZPKdfFcGRy2NmCOLU86gf15TWrxhNe2QEdsJDGR37Mz8IHOZDpgcvdBECl8F?=
 =?us-ascii?Q?I4KSXYPThMKeH3wdDK7NiZadQdtB+tUzKP3ODpv5uJjQaZerZWJYM4PBf7cS?=
 =?us-ascii?Q?c6u48HujroFGawck2sGiWci5Z+m9TN2JO3WuPM1Amfo+A4dJ5Ah/zfiwzw8P?=
 =?us-ascii?Q?QDUpFrKgYCitnnEMMkKNEqd7T4nqkWeOQ0QahFcvcZ8bPo7CffEbokgNFUXq?=
 =?us-ascii?Q?HfkNod4netlXAlmqQoqLeTljw70NxU2au7mB1t8yedZhpBrtd6WZN0aDd/wF?=
 =?us-ascii?Q?PdqyxC1pLAkdpnpjX+FaoSOv0X9tjIh5d4/9HoAUZFToHueLn1iDDqVhdISv?=
 =?us-ascii?Q?iyOcS4ZxSOxPJZvTq6eonCz6kjXEg8wggkmYQPANx3S6gaZlRqpDNu+YjTH1?=
 =?us-ascii?Q?sT0IaFUEV5gKc2CBN7atjdma4LvYzwyPQrwhpBp9UPc8ZSRf6sfDKv2/FrFo?=
 =?us-ascii?Q?Qq2jDcFsSg5NKw0dyu4zqnyYVq939Oq03nt3Zbu7JMAl9tVhrEPHYEIKhIWm?=
 =?us-ascii?Q?E6eh33iokl5hASJoAvMUd6h7XXmGEH6XVbj+2eT4BPWTFC/Bhf1+NNWcCc5l?=
 =?us-ascii?Q?DeCIWa9Pg1kkFWO6fFFZnj5oTzp3PgSfnnVgQk/pvVBvo3P8DGnE0q8cDUep?=
 =?us-ascii?Q?0RQy1V4p/GHYRsnRNhisNBb3YkQbDSB4qf3jIB2q9H/YIfHDjRyvGQHzcXy7?=
 =?us-ascii?Q?KtJSHQf3nZ6GZiIQ81EeKEdup9YmTky8SdknIM4lt037EA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RbBCLUx+Mo07/R4w0eVAmA8HiPJB8NMKxkQgZyS4sQS2fIhttxxoy9kKZ2PU?=
 =?us-ascii?Q?Gv2KjpzWbKbl3NhWLsUG3mpHdHdnifdWT3Cqr3C28rIgs+OY7Uza+hMP0krA?=
 =?us-ascii?Q?kYzDWLHwtIRtb/G8Klvka6fbx7HJ9K5bye+B03BaHk0jdBhLt3A3WcaE1/xX?=
 =?us-ascii?Q?FUzSZD/H6e2dS2OBBZOBpyWsU5jKoTaAOndcPa+ZOa3huHJWJrDNQSXqyc3s?=
 =?us-ascii?Q?u3WE5aec+JTaejp46d8Vyvr7cS5FeLYP3UhfBXq1ae+ylCeO/E5kacF1P/zG?=
 =?us-ascii?Q?5mfX5B6h8v04si7218UrFhCTkuZwVAeSEs76cY2oe5Sj1sVHFOsxtgZ1xbdb?=
 =?us-ascii?Q?wfMeCErRcYWah5QQWofEI8HyXcwOrxeT9NaSjCyZm0lDdmbDdWwcJcUG5DWf?=
 =?us-ascii?Q?g0qjWYeJc6OqQZ5s9Ydv39kFOy7rlxUiuR3BDOYByMFmQxIG2K2/qW/QPPqR?=
 =?us-ascii?Q?JGHDJUd4xDjnKJcHqO0ssGQ9+U0DRPSigGoPkFFI3M6fepvV5qQbAA1OZ52m?=
 =?us-ascii?Q?tz3vh+YRwnrxJ++lu96XNdj5Thp9QR6Ug4S7MjMLf5ebeB2cR4N3TQx2JJ8t?=
 =?us-ascii?Q?L+LJLJJpZX6Cc1uszhTbD4LjoEacFIcZurVGBznHLejB7aYVLg5/nnkycRiF?=
 =?us-ascii?Q?yuKmY2uR099l9iGSOIhz4bvA+0OmEzWsExxTxDYjuPwD/fEdWtM5xVt5ruwX?=
 =?us-ascii?Q?/bCgCNzJblat78OTnHzpEo8Wr5utTT3PnU99+6aKtMfpE68ELmnY1O3IjCqG?=
 =?us-ascii?Q?WGG/yrpZQ/vQVDrcRZtf3rJYW998g4HvWFWncKn8YENVNeO41dw4OB6eNFKs?=
 =?us-ascii?Q?UaqYWy+X3t+vKYxHw0lNPVlYyAz6NRRHrI5TXHCGtCHFZhk6x0lwuX/wkwl3?=
 =?us-ascii?Q?7eifOvlBmuS2jr684KBatpLOl7S6LirqDe5d71py0iMdF+MmAqpNk546y1R/?=
 =?us-ascii?Q?cPJ64FfkX7GxsR/VtcAO9q/rFb/YDDRwazrigmcR0+uglZXAFJI3DQUG1W0j?=
 =?us-ascii?Q?rQzsyQuLtd/dYx1EZJQOpIe21P3uQI2hiOxYBT2z9VQ12jNQLEexNNQW3+md?=
 =?us-ascii?Q?Jjycx03TYf/18YIOnMDKkfb40JoSwdqNZgxWrvBPY2G/gk4qFJLDmOERt7L5?=
 =?us-ascii?Q?wGhzCpvnW6QyGjR/LZs3zcagoArjO6fK4m7u62cXytLgGORrF+YqEDYlG/RM?=
 =?us-ascii?Q?NeWJsKsSpOBF3OX+7JRn05hweu84cYplPHiJU4d9q2C+F4J9/mKv/g+1SMqT?=
 =?us-ascii?Q?exRIrAgR0GRGAQY7bxDvyEhWFfnwXEyFRRZ0EqoVwi182FZbmc1puGCS/onx?=
 =?us-ascii?Q?Oz8KKEpnS8rzWGu95lGuGGv+uXjpZLK2ESeO3br3vM43+o0tYEyCA5Rv/Csf?=
 =?us-ascii?Q?ufo608sWqxy+cOSDr7z7POudRySKal4rlz1hzZq6SEEaYG0FwP3XHyzSvwC0?=
 =?us-ascii?Q?uzey63CEuDpr5vwRd1WPQbx38mjBGDJkYz6d/rstGrHTaB8oNFN/WDKnXWPU?=
 =?us-ascii?Q?1XUJTnTH2g7W7E383j4AJfFXFNlPoh0KQbVrIWDWQTZJzmNfFw23kNOZpg5K?=
 =?us-ascii?Q?BF9BzT2wsnk3o5MAOX2LUXhXJuS+phG1lyyGp9A/+h4X/+hThrTmkkhQlhw2?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4143f729-414f-4793-a178-08dccecf612c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 23:55:26.4564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clAOtTZro0OHBq2xpyyvCi8HSW7ksdw2UlhdV9d4oyfWM0QAf4ypNGRITWSr5bsp2NABiDZmgxk/5wSPdvXWNjr40q4B2UKD3bpus/QKO/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
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

On Fri, Sep 06, 2024 at 02:51:52PM -0700, Matt Atwood wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> The L3SQCREG5 tuning suggestion remains the same on Xe3 as on Xe2.
> 
> Bspec: 72161
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tuning.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index faa1bf42e50e..9bb6afaa560a 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -25,15 +25,15 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
>  	},
>  
> -	/* Xe2 */
> +	/* Xe2 / Xe3 */
>  
>  	{ XE_RTP_NAME("Tuning: L3 cache"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3000)),

We should just leave this one as upper bound undefined (i.e., applies to
Xe2 and all future platforms until we come back here to change it).

>  	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>  				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
>  	{ XE_RTP_NAME("Tuning: L3 cache - media"),
> -	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3000)),

And we should probably use an unbound upper range on this one as well.
In general we should probably assume that tuning settings will continue
to hold true to future platforms unless/until we know otherwise, since
that also matches how these things are now being documented in the
bspec.


Matt

>  	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>  				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
> -- 
> 2.44.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
