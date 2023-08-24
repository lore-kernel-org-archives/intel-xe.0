Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0173BC3DA6F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 20:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BD510E0BC;
	Thu, 24 Aug 2023 20:36:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10A810E0BC
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 20:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692909362; x=1724445362;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XZ4c1LoHxfjArylBFRoYo+m8f+2GX5fBOYpyPH4PrGk=;
 b=hjbgeG0AMDYCdTxv72n85Ps4Dj1y5fkxUs4sMMomFda9XO5nSMus8xfx
 sa2SMpMNkAcWxgor+UBUHHTNVZKIzevFk29atdH79L6T4k9n63BC34eKM
 xADSiouN53BPAGIn1obK1bO7L+clpeX5w718O0EEtk6nI6TiHPF/rd88M
 6QleS7w8vsAO/iwPkspk5MU3+9d1krHLwbhfQyW1L+TOG7ji8tW7V7JPM
 AwTmvux4G7LHD4wcgNEKHoUKOrvabDfphPEUWaSs6xXYPQ7alK+/vYAk0
 rqHkp9myQpmFg5IGfLyHhD07a5BcJyt4VLZ0EmQgSDoRxsHHImfQW49nK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354082559"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="354082559"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 13:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="714097366"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="714097366"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 24 Aug 2023 13:36:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 13:36:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 13:36:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 13:36:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKR4SoUDoUyyGS7frnfUPjjSfL7NS3d/PB3CpGtCL988VJyWWdj/wgupGBLtMVfekhlFq/bc5OoI10raHh1mPdbd1cma7p0pqz8arr60Yb2wWkRVkn+atBAL4Ok6FoEwbehqVOYmGvjyqknZM069P/10rqkfRtanuVtYx4EXGoAD/EN1sNCJ80NG6Jvu0scqx+60DSCpjWJtG+liFDwowDWCC75KFHhBfD4GJHT8s8bbejZoyF/4R+1pkW628ig7onORQZOd4FdJ1yOkmjhzezi6Qso76pA+3pjoF/xmEjOg8PvFuCC3U2E2D4NSOKdC6aBPfnFClH6B6wOPvDZp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRhzlwZujmxRtbMJdm7vZCF8psRVI0rM2v7GB+kyjLo=;
 b=mezPFRjtrH1ElcUo2u68Eq29lXhB1/8eKHvdvqw7tn+2/Z1MYHEDs1pZ/eW7FOUqE6JhsBr6QiEGy1Jar4EIYPyJPseoXaqDYy5T9WXm6T+zrPeYE7iq+AlTq5NdyTaduUkmHmlOC4XwsJfoddmJHGPzFHt5xdatX/cbAxs1+wMHC5GSB1tzKmHgZ0o293PikyqJQ5iNrxV9xlbOJt36vXITTvpT5DLZeSdnCqcLIlSkzWgfFQ+/DqGpCoJTfK/FxTljb5TC4mx2+Igp6xhc7z9yWWa1ka+O6l7OZGg27+POMACJGS1Y1W9o6lg6XX20rW3SL3VNGSJ+q6xeN0fHXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by PH8PR11MB6829.namprd11.prod.outlook.com (2603:10b6:510:22f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 20:35:58 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 20:35:58 +0000
Date: Thu, 24 Aug 2023 13:35:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Message-ID: <20230824203555.GA1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230823195533.125633-1-matthew.s.atwood@intel.com>
 <20230823195533.125633-2-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230823195533.125633-2-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|PH8PR11MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: c2646fa1-796c-460f-8e01-08dba4e1b93d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URMPZuscsJ5SY7dLso2IoWAvf5jKSZfjmU9zEXsnGsUy7Zp1OYf8wnMAbs0zoMOcw8bgjnEtFJQNdcwASUolRndtEAw5taIynbyoZKdHEE4Ovi+2Jq5MhXteoXSp7JUio8NxPrp5yRMHBs02EUr80qagplGCGZ8KK+uyOjqSHZQHzoCTqK4LkJk792EXkv0DtwtiGPjiowEGGW+3gSvWVD4J1As1ZlPExjYK2reFUWHemrn3Iptnm9bkq1GxbgPYPAQJIjKYzLUlLgIs818BIfk9mDmAtfVzeqg7mcEAOpMa/kw69IPCzCmJTyB6306fRp2xsTsKl+XalkiBLYSbVCON3uUMGYbABZTZIoIrAU6HomLvE9rBk1fo0a1ASHqu78FQYKm4ubt/Ev2k8KgvpdDxLHQNi351QURyjIdy+iySNJGT4zdNCfzp06OB9UCiw1STmCDQ6TuK6LSZu4nnf4rDGNWd7J471yj6AFexVlDFl4efbwqIg4tcqudqNe925/eOReuH+qzL4htVkLnzZjHgseuprdLnvLLZxCm+UDr2NqO3JqDtuixemau3Lrfh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199024)(186009)(1800799009)(66946007)(66556008)(66476007)(6636002)(316002)(82960400001)(478600001)(26005)(6666004)(38100700002)(41300700001)(86362001)(6486002)(6512007)(2906002)(6506007)(6862004)(8936002)(8676002)(4326008)(1076003)(107886003)(5660300002)(83380400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XyvxgzoSlGqVkm17O06pFnaLcIhULNqAJLIWDhekV2ziSxz25FQErBKvck8t?=
 =?us-ascii?Q?13K933pVsLegkPv+HL6JrI+CbBfZJ7C8qnyfRTC5FciNBiQgaKHixsCF769F?=
 =?us-ascii?Q?q4dstXOibctEq8KTJZUDD6aAGusJnhtUOMQeZRzwk759h7DSCDRRxSGQBgEB?=
 =?us-ascii?Q?cmFrw5OJOPyGyMfidixMwLueC8Zs2Vi3ve3icU+YpwKgw8ELB6DVgqPG7ef9?=
 =?us-ascii?Q?/zSF5FogMlyyjBpeOtY7Vgnpro5GQf/URT01uUUY6zz1JuUYfLoytRKOj7io?=
 =?us-ascii?Q?+2LDazuA7ugiHLCB/QDBjT3TQcSOuEBng7rmSV5CCYu9URQPXZbO9lPwosbJ?=
 =?us-ascii?Q?Mx4SWxi8ZfILUO6xPsOlK7/tFlWrimEttoq+saerHfxI+X1CJLpz3dSDWYNB?=
 =?us-ascii?Q?q19ZxzxZNdPukPGqWlh/3KwN5zT68UySQPhlwJ/uwUhhoNi+0Uokjejn4SZ0?=
 =?us-ascii?Q?i/Wvlr4iOkR8wZ6LFUB3tWvLs1Z5VqacCi3FdxM4Xe/xMqockcTk5rFslWJh?=
 =?us-ascii?Q?U15ls1cKk6eYFiwCjqSkTWOjLnrZfG75mGIsne1Z6COWNAaxmf9pB/FkA45K?=
 =?us-ascii?Q?lVpcbMj8AYZwdrhNjQiwD7Iri6c1Vaxk4GKqxVXPN84TQVXGnW+myltaxnEQ?=
 =?us-ascii?Q?IWQccMMFyViikO7xtReQ4ShHB0LHPkDoyOIDe1nu9ctU4NyE2XUGrBFuxif3?=
 =?us-ascii?Q?ri9fmYrRhtyNJGFITP90xpQtJvlaLzj8BvFtD51yMvBKb98FhKvVXoqexKay?=
 =?us-ascii?Q?AEwdBEWflkXbKiNSjHzHF6Xk6XXLJ+a1bts8oDv8QohvaXqALibeRmUhkFpN?=
 =?us-ascii?Q?ec7MOw69AFpTj1QvVWyKAqUotWxOXuq2oK19YkAb5iJyuQ7b0ym8UsTjbE4j?=
 =?us-ascii?Q?OLXYYnkyXYtzgVPKnDrwanpBmSH48PqWNWmhvxPQCVGE9lez/OETuIXTP2Ku?=
 =?us-ascii?Q?UnkEAdP9kuGIbCNMJijl1mUMcnoDzoUP2/y5NqMgf7CHT7OUsSlxLzvsVF67?=
 =?us-ascii?Q?wGFEuF8EJGXQjWCUlDhGKAFmqIg2vl+vN0OSXpsLfEpO3fpM3xMQz6uIFhic?=
 =?us-ascii?Q?dZtNb4pnG+6D5o73uFttb81Je6i0V45FywwS268UWp6bGIr6Q2ArTniPXCAZ?=
 =?us-ascii?Q?TwRh1b3BkZYufHFhWlTbfvy0kY+dQqTw4A0Kry2xT/bvha9IRrE0a5B7klCd?=
 =?us-ascii?Q?ou3tqRHOWIOQjKWZkTnJpa+iblZxzBY5QCuqDxgsFfOX8tOUmrRcSiqBevtu?=
 =?us-ascii?Q?qBuynf6rtcEdPW/qE63kRdr4bPlWWmnR9KozIuHK/uPPFxTUHZuWRiCHUc1j?=
 =?us-ascii?Q?cHjJBCFBHSg63/QUHhBJQIuqtP+J6eWSdxmMZt5Rs/j2IZdOnZh97/cdejWH?=
 =?us-ascii?Q?RrPiIUrtET+iKiftXmUvKwLkZKoUo7wuadGDjnLCYQzBAfaAA6sBWJBatWAN?=
 =?us-ascii?Q?2U3uUSK/qOWmVQkUB/XidG/o5nSU+NgECVufHWaab5YtnclEcK//VTIa0Pb4?=
 =?us-ascii?Q?GSPfiB2HIsD4spfXkyU9Fxf3urWNyGZ5UpkExMKhPk+fMh9yQvm/UVXSOVDo?=
 =?us-ascii?Q?cjBI17701xEHSVfZEcOX9JMthR10c0Vf/+gcbQsc/2NY5qGM65WRUDB35m9g?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2646fa1-796c-460f-8e01-08dba4e1b93d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 20:35:58.7558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMfqnkLLXK3A0V8CD0PYQODRlm8qnkBRqB+UoR25LthvampCr1Zqbs3YYs7FGesrqQC6NM2I4rx/bdpNvEQb6/oNaVv+zWoNR4BLNphsas8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6829
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2 v3] drm/xe: add gt tuning for indirect
 state
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 12:55:33PM -0700, Matt Atwood wrote:
> Force indirect state sampler data to only be in the dynamic state pool,
> which is more convienent for the UMD. Behavior change mirrors similar
> change for i915 in commit 16fc9c08f0ec ("drm/i915: disable sampler
> indirect state in bindless heap")
> 
> v2: split out per engine tuning into separate patch, commit message
> (Lucas)
> v3: rebase
> 
> Bspec: 46052

These days there's no realy need to put bspec references for register
pages on workarounds like this.  Reviewers with bspec access can already
lookup the register directly by name and/or offset, so this isn't
helpful like it used to be in the old days.

> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index aa9d7fad41ee..d039e7afe466 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -298,6 +298,7 @@
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>  #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
> +#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
>  
>  #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
>  #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 702cb41dab53..07ffda39e2e4 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -28,6 +28,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  };
>  
>  static const struct xe_rtp_entry_sr engine_tunings[] = {
> +	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),

This matches every single platform, so this rule isn't really doing any
good as is.

However this setting is already the hardware default on Xe2, so 1271
would be a reasonable end version here.

> +		       FUNC(xe_rtp_match_first_render_or_compute)),

This register doesn't exist on platforms like PVC that don't have 3D
functionality (and doesn't really make sense if there's no render).  So
we should probably apply this rule specifically on the render engine
rather than "first render/compute."


Matt

> +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
> +	},
>  	{}
>  };
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
