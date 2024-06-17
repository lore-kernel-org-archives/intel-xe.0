Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49287C2BA1A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 19:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E739710E4CC;
	Mon, 17 Jun 2024 19:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKb2BCDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5E010E4C9
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 19:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718652226; x=1750188226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gse0elyWmleCUqaOTrOnVnX8yoJaLhIJagWF4wgLQJA=;
 b=YKb2BCDVhttksAKCDFL22lnAgCHb0yiAfcITOnVWi7Fbm0Q5xuPMMC1e
 IGa++ceFr5Cgh/c+KtYY/YkpXsZPB/Ibw5/RPWoOa4XuATNH1n3MvI6c3
 joGdGc6PEXNj7sVEbZbOzI3qoybkPIxFmKS62XNuGFIP9f2hc2+O5/Z//
 KVsgbqyrlYo73Cax1Vl8vCLYGT9LctCHM8HLELgAHY8MHTKwkxNyLRIAx
 7fdyLUgNLRZhCVM/560ZP+/IebdzYomJzlYDUnkGcw4RqMXtjcgXTYKNB
 jOrG9iJiN2i8kAXobJjUpJdr4z9uzg8QLrSp+XmXJRhbFnPMAKsE4cWQ1 Q==;
X-CSE-ConnectionGUID: hTRIBfvgRUyjF6H2ggnpGQ==
X-CSE-MsgGUID: nHQ5ZyHmSimqlDNAjgw6qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26617610"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="26617610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:23:45 -0700
X-CSE-ConnectionGUID: jyorY8ugSGOMWgMK4OOENQ==
X-CSE-MsgGUID: /7g2/3saSuG2CipyKkp9Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="45655525"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 12:23:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:23:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 12:23:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 12:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5u+98ttP+h1RjPewjGnBBgmmtaCKX4ZZKeurflJxqbU9NoibgeMMOIN9Yx5JDMjs8cH5pdhACgyV56RRpHx0Lmrq52lEOAQ/3iqjiVQgaKC4AtG8tkdefdb/jrK7bxQx2fbywbQIMeTWhSsJ4oiMAdyBsJdfQaQT1Wsd/OnmhQvwMVu2IWSbogR+gy0l5YGsZd2UzRFgnK2JblnI2mM+CKK1Bf0hxDr0uwIIUTzxZsTHFc9vJvm0tAvGv7C3Cz5GO+KVu7iJ962reCHu+jFouN5Jn0JU2iwL73Gipk3w+glgr5k0ysu++Ksm/MzuKzRRTAhsrmCkoyA9Kkv036NUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdLNS/X6cI+2LMC+J1HdMT7WlUgRuEBxPls86C4RX0Q=;
 b=fJ4HpGuMQ140GUcCTNRcKdwwFQGxkNJVWo18zGgq/XTy08zXgB24Q5BEHS+7zQSf1klDFLZ9VR2L9uE1ZloAmNxnsV6Fy6AflmmlIIVHjzXgq0Du4pEjINmrJKVflC+jMXL758/WVHqY1ND2qyVjrxYRj6LZbVRHWqPl0jZyFpPtHMlhlfEPe2z5oO+hDhuO0jrsR8qyJbSfQ0aldyG8j7+Nhga+kwx1Bb+M/7J2LrB30Hjz6Dy0rS+IvXYZ3U8lb1v5D4zyNsTmlwOP/Ze+vb5tX8YudpGdGftIBlfa1CSuL30lRA61ePo5xn3n5nmgCZ2F+RoribBHvLcUi0eGIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB8115.namprd11.prod.outlook.com (2603:10b6:8:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Mon, 17 Jun
 2024 19:23:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 19:23:38 +0000
Date: Mon, 17 Jun 2024 12:23:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 5/5] drm/xe/xe2: Add proper check for media in
 Wa_14020756599
Message-ID: <20240617192336.GJ2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
 <20240617182518.280975-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617182518.280975-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0220.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: c6930915-61ba-4475-650a-08dc8f02fda9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7EP76NYhsj1Gcf77enbUioZeoq1fTrUE4VnhZQa0u2+FPGTwPQ7zYx5ArtEd?=
 =?us-ascii?Q?7H735et2EC/R5Ggj1b+81mYglItncbj11IrHDi9GS591jMkBdwDPAD+yNyKt?=
 =?us-ascii?Q?49Ih0yDrXirm6b3whwxptR1i9jGFYd9gB5pmPq3owJ5rCzPt2R87RVVKDAM3?=
 =?us-ascii?Q?stLreJMAFdvaF386sKjXWdMpAOi7j56rtJ2d1aNgY70C7Ep+vcnQzAW9me/6?=
 =?us-ascii?Q?iwLjc00/CkjDqLupcQlPh8XYARuG4xdeCLE9GgxPQI5dtUTfAZzAzhFYTD6e?=
 =?us-ascii?Q?AtQDbIkaa5etLnYRVgUvMm1PWedcNSKma9OsYCBjY5bJnBZTjFY44+cImfys?=
 =?us-ascii?Q?1koRtYl0jFVUQtuEYkUf3xB20aZRtrPBfck2rSSgaby6zmUcLQDWqM3AH+QA?=
 =?us-ascii?Q?SUHyZ5S7Q/0mLEATsFJttBT22K0FOKPgSpUnn5KsZhRFXaTR8mSAn2Ziv5ef?=
 =?us-ascii?Q?B0Lwx/zWXAHJXMzaB7PoDU45/Ld01rzsfDU8zG9z64pmUaf1scvfKV5LzEDg?=
 =?us-ascii?Q?jJqERhcKvMm5lR32vjuqYEj9fDdu/NaEyei4gjn9V1xfn6iXiXj1T2EUqRg+?=
 =?us-ascii?Q?w7AfOdwF7+iXhfQs8p6604BiiRDlvs20X5cObALoQflrUQaLQ5IQ50IVm1uv?=
 =?us-ascii?Q?BvZdQtjVygbBobXNhY+dlC61QLHih+789PAA7baLgknk2yotS+RDb0Dv3i+v?=
 =?us-ascii?Q?f65BdXqSp4XArXXi+UVLkMTQV8p4GiHgUpqSM7UFX62ffi1bnO9wUfRF8O03?=
 =?us-ascii?Q?WRh8bz0cO9g2+6fsTBPAbZUOCporKzhhegv7W+ynMsJr8E90d7S+d+NUJQkv?=
 =?us-ascii?Q?d/ihB2BhnOafT6UobLUf8V56F+MSveczInmaQqRrK6jLCmK8RDjERnrAjGWd?=
 =?us-ascii?Q?A4ZATPo95pg9Gj2h0DMAamN/QUOf8OxxMaY5IMZ4a2rZBYjY8/Jo72wfTQtF?=
 =?us-ascii?Q?UWovRb3iDazPNT7vtTZRevslNH8WSPgOjAxAqW5Gz2wNslNzwE7w+de0n3/5?=
 =?us-ascii?Q?yQPirYcYfPn3gUCEWhsY2PWnXHnBMrY+S6ZexWAOUrWoNs98WRZfX/030xOB?=
 =?us-ascii?Q?gUPMuioxB1jiJXlvLfO911y7hpBkt+P0TevvxY4s14aa7gsIZUyYMfxjifHc?=
 =?us-ascii?Q?3tipck1SQjCJXdIfVyrTnuQLFZerS/ZbWS9qrmvEd/QUNtbKl1gkPfZaI2ub?=
 =?us-ascii?Q?SbOJMXDUxGhG7jwVmpoCAmUzCL7f9O+Jh5DDMj+iLUrSJGzxEeSQV555etXA?=
 =?us-ascii?Q?bk43dbwrioSiTvbho+1oZvz0zutIj9egrlQFg1ck5LGjWtRUd1SIVyN8cafN?=
 =?us-ascii?Q?Lkg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IMDSgkEptD+2aJwIktC9FW1BdSj6K7LjHl3f47KKcDD3HHc/BuuINCSAcIwE?=
 =?us-ascii?Q?nlG6JGZdkfDPwroDUYtR1eTQfP1T0PuqDGno7M2KGP+HwoHATJFjc1GTzR2z?=
 =?us-ascii?Q?uj9Jh+iCAfTRNZocmnWaLX6N/eMHf85rR/SwLjMYH4Yqey1fg40PORWvQJcj?=
 =?us-ascii?Q?o+7RdkvC1Hto02tAXhvXPCPF1uY9CpcErDst/7idv5c4nz6GHVZZlMq+//fB?=
 =?us-ascii?Q?bdyaNnASKWdFIJUJhY16m1ZaQB5Hi0tDjDe0ESmNYSMtbils1dESDNym6gq9?=
 =?us-ascii?Q?XvdbqI+PD+ez1WptvuVZqMsRrpJgnS/eZ2jCp7mBYMB1QM68I2tdhU4ZHy4b?=
 =?us-ascii?Q?m3WWdKwZEc/FavSH1Z7m1kU8VJaAr/ntjwO0HYDx92sHZNNws94edqvVY65B?=
 =?us-ascii?Q?mNbRInlLli9suxPmgmzYdqwcgNXbGl3bQ9nS2k//j+x7FLBxSs5/LbgzXm8n?=
 =?us-ascii?Q?RowjPdI7xyX0pcz0IWYn3YSJ8Vo+fO1UCXuiv3z+1R3JlYGf+VoLLeuqSDri?=
 =?us-ascii?Q?vY4raTDNnEvNDu/SPxTE7yTxvDmc+9zmCH9rm+CLVxJEdhBTns0W3OkZwb5G?=
 =?us-ascii?Q?scSjQAO/pgUAU3aQjvxCY9715YuzyVVIYk4IKBt7UoPZc5epa+piYLkvmsey?=
 =?us-ascii?Q?PSHXBUCw3yUFvJxLGE3hUgVWXJyjoMbncIYwWxQMatNepTjia+6tgrAr20nX?=
 =?us-ascii?Q?uym1ZQINPmDTil3XLr5v7un31bLUoaru6X4xfVeZAaNJEe90xotR6N+1jGGh?=
 =?us-ascii?Q?5UklZRLY3aV+JHajNrN8ORisg8i3lcPlwMqOeqTZdyAZLnusut47h250cUkD?=
 =?us-ascii?Q?GmuOv38USV7UThi2LfyGox1ecVsOaICj32TkEXt4dOVf317IR0vVHNCi29nt?=
 =?us-ascii?Q?85TnEl+8qzEG5Xz3iXmiJjNFXcY+CvYrRj5hjlZ3AlxOFy8kNdY3Y3b4eS9r?=
 =?us-ascii?Q?nluTb9auiNiYms5BPqvnDQeY41fjf4Lq6mSGdPMFtNKolAZjyU1IHiYTP3QQ?=
 =?us-ascii?Q?rK1+2crmqq2g5ep7W7+Lw9PHDH9ETKzeY+kgHxzMVcmsHNqxNn6fms4ICLKD?=
 =?us-ascii?Q?HVfyNjKYni6fmrr6Ns1fNCOFAig49covHB1vNUTeMx1pZiq2TbQMjrQMwSfz?=
 =?us-ascii?Q?tEAgOB/FIzCAOEJ2bnYDkVO6HOUTq3/lYHWIy6Ba9R8FCA0umlZRBJmrt5Iq?=
 =?us-ascii?Q?ZQbjefPQzVllZXpIuGxA6a41HXlC6QKOcLbidPRj3YCVzpkDbuw9pP6d1L0Y?=
 =?us-ascii?Q?BfYwvc8p/wACJgJ4mAHuQlwMXFLFW98o3IpH6VWnTn5f7QaNb6HuailR9mgQ?=
 =?us-ascii?Q?ivBUGVOYS4ZoHMtMUXgaoJoT/j/ASgRpYMwq6v+l3BgryE8odLx5miHwFTFr?=
 =?us-ascii?Q?7jgynYy0EMPLcdyLTURk0BJ45fuUvqLO0DddiBmcxEFLycWHWchAxHvURpVK?=
 =?us-ascii?Q?qrf5Shd/BhpdFXUEVIHbXcQi36Ky7GpitICjU07agL0uirmlKT1eqBRmEDCk?=
 =?us-ascii?Q?Exdtg5UuRyoyT3S1MU6/Yj+J9zrOcQsSiFGV9f1GlWLZsUVeilYP9EEJolGK?=
 =?us-ascii?Q?0lR8kedlFMVmVN5XU3jtV0T/qU5as8Aefsfh4l3cCPnQWCc8aLUX7GzWtAko?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6930915-61ba-4475-650a-08dc8f02fda9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 19:23:38.9077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iu0pZjpfPOcqK7x1DRcwEkkTKopuJxVKwbqE5JV/q/fs5+a/UtSSNH9cM4dXumqxbYgENwZhekLcbKTw2Vxr3bRw6Q9oRFg28aEVx+tkwTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8115
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

On Mon, Jun 17, 2024 at 11:25:18AM -0700, Lucas De Marchi wrote:
> A temporary fixup was made in commit 24d0d98af1c3 ("drm/xe/xe2lpm: Fixup
> Wa_14020756599") due to limitations in the RTP infra. Now that RTP has
> support for OR condition that change can be removed. RTP now also
> supports checking any GT, so use that instead of the more specific
> xe_rtp_match_when_media2000() used in that commit.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a2725a150441..0b6fbbebc41e 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -677,15 +677,9 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
>  	},
> -	/*
> -	 * This WA is also needed on primary GT when the media version is 2000.
> -	 * Currently, media version 2000 is always paired with graphics version
> -	 * 2004, so just checking the latter is sufficient. In the future, media
> -	 * version 2000 can be used with some other graphics version where WA
> -	 * still needs to be implemented
> -	 */
>  	{ XE_RTP_NAME("14020756599"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER), OR,
> +		       MEDIA_VERSION_ANY_GT(2000), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>  	},
>  	{ XE_RTP_NAME("14021490052"),
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
