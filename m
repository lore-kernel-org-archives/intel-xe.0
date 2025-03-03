Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FB0C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 22:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0386010E2E8;
	Mon,  3 Mar 2025 22:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+N4kEGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EB510E2E8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 22:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741040246; x=1772576246;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/0wHF3j9Pac9qdONHZ7Vvo62p2ZDe2zIyQeXVPpFwcM=;
 b=O+N4kEGXhTzhFsFNH/O7wYi8a1lHvmoPgPv5E24eWqQzbZE/TrLZMWRO
 LQ/Pz9pw6seBz7/CQ8YBbAzoq8sz3ZN8Lm4jzYNn3UtryDpKTV+H1vkO/
 dzvvMQ/KveiPZbm4gLMLtFQRgLtw4wRnotBUmA55d7dtLOfCENPoUmVvT
 Ltwn5fEp/S8kBcCJTfkl72QBE2nvwEa0QsQsH6ZUoqhKVFauvuPW3le98
 C8FB2v2oJdRaUHtUKrxU/VYNxgNeDT0o88qTnS9n1sDowht0XUvQZopqJ
 BRXjSh9h4UXcDLtw3612tY8rM85egTIbyI0/Sr1ONl1VNz4AIZYbcKG6O A==;
X-CSE-ConnectionGUID: NecidASzQ6ifVKB5Q797eQ==
X-CSE-MsgGUID: CiDLh/8jQOutz3ijqyVC8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52142969"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="52142969"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:17:25 -0800
X-CSE-ConnectionGUID: TzXCNLrvSt2OadiUSZKkoQ==
X-CSE-MsgGUID: 2mR4T0N/RL+gHhf8ezQhuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="118872834"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Mar 2025 14:17:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 14:17:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 14:17:24 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 14:17:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQ7vqZs08+wlbj1UACN9qzJYlP+AhXkSBAkXK1vIGsA3hN/QB4oyxbsQO8z7t9XZ5Duia1xbQwl2tq/+l7cj0zse9nf8a2s53B3rdcNggIiMfs4cVYYTzeaXBZ6/y4NEVn5xOo5e/Z9EnZvh6RMQyycINlidQTS+JsQ6OzMIsylES2Ulxht1n3ob8F69NdkMmIiszflq7C9oi5ruK9YZzFd578S6YyU0jg6M2wwaMQfUguiis28yy3XndhycC74p0CM/0xsl2G29wKl3ZnVFc2ehiSHHErLL8nFiWLePdNlLOe+IuZr9na4QD9uQYygw4Xxy2eAV9st/eW6ZURqBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoPDuXGuuGykuAFZtjB5MY39Mlh4BgMr2ZVuiSNqNG0=;
 b=ea8ukS4dDPUEzor36+rToryWNK4W1aK6YtZYm2wcUimCjuV3FevPqHSAIM0CB08562CZJz/QX9jExp/ijEqkQs9fl3lS/DLoUNrwttWTRDCvom3yXlcF5kFXbDeGCTUzh1vTi6rDkB7qwC7tvy0yrvYug2m/lsgqmyopfZRiSog1JMHV/9AQuNalwyj2Awo452Gpcsir7qmbGyvbfXognUNyzyorS2rWJNYhg87wrXEJsTSA5kEowTFJlgNh4on+E/OoajdmSTg74czJ2QB+q7bbk5bG4TX/FAxmUYG9Y8QhwiMOA4olaRBr40oiELO/Iiklej2E4Z/0nwB5w24I0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.26; Mon, 3 Mar 2025 22:17:22 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 22:17:22 +0000
Date: Mon, 3 Mar 2025 14:17:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs
Message-ID: <20250303221720.GF3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <20250303173522.1822-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250303173522.1822-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0055.namprd07.prod.outlook.com
 (2603:10b6:a03:60::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7d03f8-940d-454f-9918-08dd5aa12ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kXnf4ecNpswOOVlhr4hzwchPNb0HiO/eAAeabKdnKGIxi8uDhncr4kg3FDGN?=
 =?us-ascii?Q?lxMhCBNXNA8+lKXCz2gOJQMrstKSBqxo/YZwMzRSYp6kHkaoyfF1jHVHtiHv?=
 =?us-ascii?Q?h8pUOLpHXcBo9fcBo/EG5I8SRgVc6z65ocio6khCUNK7QYTKR3La1sXq7B5M?=
 =?us-ascii?Q?lJkEv4NSqTrCWpeHgvqswZeSX3TK5/Yk/6tCm/oNV0EUuyfyk9xkGFx6BuZb?=
 =?us-ascii?Q?rTgyJdQAvL/k60nBNvCLz69NAq+pg6pkwKs2VTin27773IGgciMtEnRpPZnR?=
 =?us-ascii?Q?vAZxMrcJFOyZxGNuuI2pHMzZUmkrc980J/ZsnkecG4Ml1qCR6ptYHTY5M8hp?=
 =?us-ascii?Q?HvCuIIShxqVvsZApfCPJ7RPHhySS9lHhdew/gfm9mgsTfxBG7Oe7+BYCS6bc?=
 =?us-ascii?Q?plaCEPq3qkql+qsVCLHtW3euGG8jlNAswY5K696hHTrOg7WNaai2NBppffRx?=
 =?us-ascii?Q?H+Ijz/xwwJ2iE5AjUHUz+3KglMRibj2P66lt1zFu1mBgiqqY23V75INcP8jz?=
 =?us-ascii?Q?L32VpZ4c/4DrSSvOWT+3NzNt0zzpsHLeoeDxDUcF1p1/jI+6lgZu1UVOOWrP?=
 =?us-ascii?Q?F1fW54ADVdlXvdA2Yokr8dbhoR9gKzDx/V7wahdx8CThYFJXK41tuG1CAnER?=
 =?us-ascii?Q?b0n3ZiFAHZqnS9y2Ei3U60QQVdDqi+Sag2Z8lS9xfF/b0T13n/WOuQCQpf27?=
 =?us-ascii?Q?sERqkBE0/+THASc7XvVT2pyBdnIu4n2IeVg4l72zb7YwmcXW24HdK23UD0eB?=
 =?us-ascii?Q?ls4zcnjRyfJM4lxL2ADC4gh0t7NNl5ugX3LASKaNaa/ndraRtJlgKZGEmpSL?=
 =?us-ascii?Q?dMJgODqYMcV3wCPzJ76JDW0YXy6BcUUyZx/QFOb9FKO1Mw2gMO+jl9lR6gvI?=
 =?us-ascii?Q?NFFQyzESen+nq/aS/jWfTnlHmvTV3vcxSooinyVGYxs4SRqXx+QYK5AYOy51?=
 =?us-ascii?Q?jd/b2YpBulpN+syZqpdSsQG+IQYK9k6ff52uBxaZBp30iQuHYKaB8NJcX3Yy?=
 =?us-ascii?Q?xYkXiThTtXfoFOLgZkoRmfnymYeRrV7YFdy2ZpBBjbia2zm2h2hgADzdSyzb?=
 =?us-ascii?Q?rrOccPFmb0EmNYJxmMGT40lKvKNI0RqlQVsWSdzi4dISH7eEeOlugJ/xYjMP?=
 =?us-ascii?Q?JoShF5zX1AtSbMl19WIq7pJq3k1t/cu1He2WcoITAywFBPixxNcMz6Sl6fgR?=
 =?us-ascii?Q?fr/fzfIfVG2WscHANEpKpIOKYuqwprrriS+bP+M0DVkknAAqacDlzM9Vqm9s?=
 =?us-ascii?Q?coyZiPXuWfcQiJfwhTK2wtoT4RQw/IY5ot6x80ginX4y+0eQk6rO4nkrgsBw?=
 =?us-ascii?Q?d9/xPPLancLQtNM4CdnaMCVh72MqIlwJBOZfThHYD/pH4li8wu6LQVO7X1mH?=
 =?us-ascii?Q?xdv/pR50xgByw0VRi94n+Ux60iBQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sq2MREt3DC3U/AGaXxSbDNyolTDx00ZVPvq3dJZMtXzlKO4J9jzBDalDYfhN?=
 =?us-ascii?Q?XdFqixUcv8us5f2nioXgCY8LK6l6Xd58v8D6ky9zvUHL97QAphL3K3VTcCqh?=
 =?us-ascii?Q?ccs7Xe3MSt6PzyG1+DVcHEyfY2iXjsseRJRHbf0uY2DR5LAUGYxQQdhHLYwu?=
 =?us-ascii?Q?HfeS06y0uj6TvhsFo5dbVlWCJOYx67oMHa8WSnEG1p75+R22eX+dDNwrN77U?=
 =?us-ascii?Q?PSIrhZqYYjEQ41A+6gdyLA/H1f73VyL05BsN8hMmrENk+wiOYTTLfz3IgIzB?=
 =?us-ascii?Q?TmDULDqFxpz1e9XS0c65MAlrKdiu+SEpSpxh/lwRPJEl7V50zcSAaECoqZ/t?=
 =?us-ascii?Q?Bzu5I9TpH3PoUxrLZ3UVTir0LsSI0CWlnV6SvIEiEXbyyQbwOP3zrwD4gdxL?=
 =?us-ascii?Q?TKB9cfOLOic2Gk+VMeQNR186qYb3G0jzeZLaTkiqFA6BzUFZWFk0qacdL8lN?=
 =?us-ascii?Q?YKtFtK9MaOUKQb2yaYCL+7bTk4lmcBtTxT4hdDAiWG5JoB1N2LGMFgp5QQBa?=
 =?us-ascii?Q?aK+65YqvAcT3rmtTIPoMnsQHgOd5I5nLFd4ur4YzXkexC2dAaQH+NrLrmSqc?=
 =?us-ascii?Q?ohdUMp6TjFo0enhRfweFoHzV2H6K3Q9EEetjd9xUu0sA/wVZULV7xPuT9cnH?=
 =?us-ascii?Q?rJqyvZGh+ROO9PpX0mXu9cWBmmdt7DVxqElcbMU6YTjGfgpYfeHfwI/hv141?=
 =?us-ascii?Q?3Fz4eMDDGxSfxu0eQW/U+14JOj63K8tDNRd7cEql1Qq5M1y7Nl4QAFXlaiAA?=
 =?us-ascii?Q?pzQyRNbCMC18jLiwPMR4W3myQdE1AOlMidG+sg6f4LguNwXJOR7Y8psNqGMl?=
 =?us-ascii?Q?uYE8Dp5DGWHksXc1PimLgApo0BS4oTtLB0IJPieS5R4ogjKjM1I4imjdQ7mg?=
 =?us-ascii?Q?Xw/LCaLWnCgG2apt/XW48hm7tYdKdFGizi5PaiFvlWozM4CCwOzpn5MjoPXv?=
 =?us-ascii?Q?mib5xA9dLn8EHFgWH1J80wE3ZkHd4wIoMcJjQQZeQRvz7bjyUF+BFiaktmjb?=
 =?us-ascii?Q?DwYoCgm4+pzsAGJfSTAj6YwnWkHkK+wA3RHaemgk93YQaYRJi7Wc7CLXzkMs?=
 =?us-ascii?Q?xb8v/H+NSQsLqdIJa5ehL1QCNjHU9lPzR2ScFXv0nQZx8yI1RwFs5tDkNwFT?=
 =?us-ascii?Q?F6Eyhyc5SmkNlZX5gRiinRAZ7J6kqOK2H+u3a7UOp/aRnIlLZyIxiXxS4T04?=
 =?us-ascii?Q?sRnmX4Jw7lxmSnnBYaaDsSsBVSf+8khV5Qbfxo7G6F0JtE6L7Xw9n4+h+mgI?=
 =?us-ascii?Q?M325M9RODe0VjX19BMFvte6ZDWOHT8PjoVkwZ6y43oOrw+ZkSTJv1WcYjId6?=
 =?us-ascii?Q?qToJ3awI3bXEbn5R/gdZB/Gz+VHNzzNCInVVwZo36piG1dlniWWp+so/PYrj?=
 =?us-ascii?Q?BNUs+YXfemnZ43Zf+2ClqOehnxHa914Jq33IVKuc62Duk4zfcDgLGaaF0bes?=
 =?us-ascii?Q?DFBDTcrFnLzvD3Ov8jAG9COFaBQw1dybt6uKZRkxU2CZJWDhmPQpZfCsBWze?=
 =?us-ascii?Q?QLFuFLKwhDTK5jk7SBkaJBn4/VhDhAoPGICO/lI07iBikl5jZ4XACRWHJdbw?=
 =?us-ascii?Q?KYVMoar3uArJrDCzWcFUA2ssJFZyHhCyvi5PU/M/E9dxAiFBPk9O/H2R8MJM?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7d03f8-940d-454f-9918-08dd5aa12ba1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 22:17:22.6058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: co+O8/cHv7di2Mnp3f5E22z8nw47UGD3MT8z1fN7xH5UQO/mVXT8pfdwDE/POKSnnIdiCf95AzW1yqPnYmSCoEgxTKOsbnL3bTp8adBxEyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Mon, Mar 03, 2025 at 06:35:22PM +0100, Michal Wajdeczko wrote:
> In commit 9632dfb0def4 ("drm/xe/vf: Don't run any save-restore
> RTP actions if VF") we disabled processing of all RTP rules if
> we were running as a VFs, since many of the RTP actions were
> trying to access registers unaccessible for VFs.
> 
> This also included all of LRC WA rules, since some of them were
> implemented in a way that required RMW pattern.
> 
> Now, as we can program LRC WAs without accessing such registers
> from the driver, relying on the MI_MATH instruction instead, we
> can unblock xe_rtp_process_to_sr() for VFs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 7a1c78fdfc92..d2ccf632d07e 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -256,9 +256,6 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>  
>  	rtp_get_context(ctx, &hwe, &gt, &xe);
>  
> -	if (IS_SRIOV_VF(xe))
> -		return;
> -
>  	for (entry = entries; entry && entry->name; entry++) {
>  		bool match = false;
>  
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
