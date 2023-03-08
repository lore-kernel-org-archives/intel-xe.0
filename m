Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED410C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 23:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C664510E753;
	Wed,  8 Mar 2023 23:20:24 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCED10E753
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 23:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678317622; x=1709853622;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2U0OhDy0FQrWHz/UWEIK/vo7pcdn93uBAYV4CUyTUEk=;
 b=UApftdDmItLtyP+VuUB4z1qbH3i4G+vgYceFJMkvSKMWL1Zyma6H/gdd
 qT9w2byYmXSzmvY1kBMQCOhWVSCEHS4tiDqtcmRGRvYuTPNCeEWtFrH14
 /TrlrA3bjuYyDTTnLJTfxyr/gf21iVx2QALMiI3GTBxUysgWmer99xCOo
 flaPus6WegQXaNaHFgziDI4tLHIwbqNRkRW46Ft1yoeo4A7Ji07kn38sg
 mS0TfCWsgy6DWKd7YzgkCJOdAYPRZyJJvUC4gnZb3kKX2g8sLaHt886nC
 lK9t0aG4ECWwPtkSBQ4M+/2LJXPyoL75Gl/C93jiD9FH77XRNp0bmEUXC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="401132892"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="401132892"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 15:20:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670512588"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="670512588"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 15:20:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 15:20:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 15:20:21 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 15:20:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J16FuJZRLwyiZKaZ/ZNXXm7Dgg+2h3eWfd7S+7+jeD0vf6IJdI1BqBJmeJQEKNsQrRpJuU0j/QSGM5ekSOKdATjM0eMPJvFAJx5zHjE86HpuW8B6xCHbsvgMlA27xSUjN/WExuBxkA4k2ZLm5i+YVYjvdMrmFnaKK54bZVGG2Gw5BYFkBFxMXRdJGt0KrsTIkMMAhpHwG/drZ7/iGgP1GbYkp1D7rmhpHMKCjbEcpQ1Aq7sPglzgT4HZ+oHWurpXCV7Va0dKgfMkkiwj4ETy2kKnDJiLiMYpNfwL+D8LSyrfk8saADB/8FRhDiEH6P9wxnjiv3pD63btcyl305vEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcsTDdKARNWDhqKqkuu1e4oA3xhLlEjeSlcB9oB9CNM=;
 b=Ym0nB9Ekur/G7ZPENnZUtvi9ujbhpqmqMGLwckyB2nRfvYC3l8lD38+pKTv+LpQ4eZvjr6LGbabbqjSOoEAkBA0mjXEqHrPfTR30/4T20J0VyYmS7WRj0AW6pS3CwgNYWbOqE/As8I/bvsRy22GF8OC3ZiWJhCFMrFSd9VPwZSxPBXfTqODt9D8HfdJj1ghfJs7gBOgRWaqEGLQ15vzhMS2N6jVspYXHNcNm+G6IIV8B48EbI3eGlYsHgrpDDkUZ5npbbV96fvRDDgrUy4fTJshBAFQssVFu2dO7KzEtp+a3rry/Jg6q/Fl6UQIBwbYrOdqaTeiERF2SNBVDyf1u3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Wed, 8 Mar 2023 23:20:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 23:20:13 +0000
Date: Wed, 8 Mar 2023 15:20:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308232010.GL1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-16-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-16-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce5d2a9-2865-4cd8-fe7d-08db202bab29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: idUEUVVblz1fktTGbaDUnWYIbTLtJVMVIfsmsctONUgeVKoPruw3IYt5ZsgOcrYOzeuq/ShVaZ0ZnODr2A1dUuG54FPQywM6mO1totlvwfFowPYfiBAsMD5aSz44a0WCFbwtAA1FVkxqU2claUBHABKYgbt6KzAZw7eHTBKXvBvQWY4xbFNCZxA5osB6cNoXd9kaRR2EN1Ft5lE+bZ3sbXi+GeL6qSVv6SgdAfHw39HUcTPu8TyNzqp7yvdRSBNUio1wOrjIU9M6xh/NEzyyTSKb27t315RMDEG74M8tK7g+rOj8JfM32edWt+cjHC1djRTAxyMtBKDnIAPMZEqje9VtfnnlZtZR6BG4o/EioT3IUgyZvxZl3Czp+qpLKhWeq6ay6fmpjTmQd7WTjhg4FnrNuh5DEUh8fub0MROeyoWI2SwCupykYg0JDS+QjapKWRZj3lp1zlpJ3qQDJnYPUicGHtbdzM2ae4qUA8qlIV9n2YmQkJ3flyzhvezNHwW8nB4E8D4t+AIim5NUVsk3JHZqeeNCLI34K1VKYQKXuILUNKbDjcSsc8V/reb/Inv++rJfxLgT7xJbxavGXPnwF0kFzuYRNUkdq73e8IDuXrBFf0uLvwooRHIxb+jBqQFVG0qCBdynKdg1s4ijzOYtig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(26005)(6862004)(8936002)(5660300002)(6506007)(38100700002)(82960400001)(6512007)(83380400001)(186003)(316002)(6636002)(86362001)(1076003)(66946007)(4326008)(66476007)(41300700001)(33656002)(66556008)(8676002)(6486002)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9u0J7tlH+R2Kx8Le9pvwjYkRgLyycBEqXH7sZzNRLx87j8D5kDfJhJta55vU?=
 =?us-ascii?Q?Sfzf1x1qXk7yBXQKtwbRtjjxMK+zq8C5LWpBvQoR66hWPYM3uhok67gW/LCj?=
 =?us-ascii?Q?3NqEd1mY5EilOXkmb/7PJzZ0tYHthhPzyzd9Cqvr8FGOYwOQhhPqlTtlZn4M?=
 =?us-ascii?Q?UJd+JwsaL+TQ6ZJE3DKqBJn7u4GeQFkncSepmY5nCRcqGGVu7Ikpxf6FFojW?=
 =?us-ascii?Q?p4Ndsyw2YP0bJiMdy+edoYNxK2e58BoKzko6kUwdJobojEmRrpHHeDzMbjlg?=
 =?us-ascii?Q?aGvXBKnCoSEiMX5WJfg2waQYifqcPEW/TUzskMXIdrL6cNdZRAQSAU9k53Gh?=
 =?us-ascii?Q?MEe9eMxoFC69wecSgWrCzKei4ofqk7zj6sBePt1W2jquMaWMCdXxDRcazPvI?=
 =?us-ascii?Q?UW2Ckko27pN/iQnxyuRTw//mYM9rme4O97WFdJP1867g4dOG4OOgrU/HYFla?=
 =?us-ascii?Q?zh+3Kev3geufGlfFTKrN4O5bx/i2YoeaYFlTanQ/trkZrWJX1MoHEvsggC86?=
 =?us-ascii?Q?iqOW/8LyI8U4hn3R4ShpV4Mwg0NSOsXownUO4JIVbn+lzdqD15WHkI2MS9u/?=
 =?us-ascii?Q?e5paGAwlxwKPo5NRZAzGRq7W25v1gE/dMpn3imMYqtWF7mlIeSPn4DT4iLv0?=
 =?us-ascii?Q?y1U5uuLI0XmDJ6BFLM+O6Q4zgpSeILDTfOE/IzRkHgxSNEZtZBoaxOTr0bW4?=
 =?us-ascii?Q?vqMxZEjzESoJs+McwZO+EPrlRPJlC0VsrGej1a6v3IGd+58vOUi1irpEaaUY?=
 =?us-ascii?Q?9dU5o0soklwmdhCxeyOncRryGJpLXvvt4HTaL5ibUIWF/8j2AfSzA+rB/avK?=
 =?us-ascii?Q?7gc8dcgrrpdtY6eT/ipVjPNURvYOw88CzqTOtqxtEPPfMBIjXYe/tJgSEkLt?=
 =?us-ascii?Q?ln1TQ5N4TucGmK9AWJM20q3ktS8i1My+otuMjzIEjeoNyXJsyBSWeesPOfHs?=
 =?us-ascii?Q?eVsGQaahps7VAHBVh+uDMhLq3Z8EivmZt5Ppc4naO5HlrHTUKr6Kx0LdO20D?=
 =?us-ascii?Q?09viZV+UKggdbC9A3kwRWms8lL5DOcdqbVFH89wBJOMsZ+tO1JgRUIAfm4y+?=
 =?us-ascii?Q?az8lRYM2MSI1U7ZfPW4lGP9CTlpzAlbkCPDReUT7FJADxymjUqLiqV0HY4dr?=
 =?us-ascii?Q?xusbpaOQGW6/tXPRw2nWw79wql8e9RfojS76JeLjPJDbwCx4tODtm0NcLyJt?=
 =?us-ascii?Q?fxPiFf1tsujGLOPPkmTnnsIRZ77EjUKkJXyZ7CH28O7wEMsttyIym2lKWe9T?=
 =?us-ascii?Q?ywzWGwes+S6UobIZQmyuVUzJ74OS9gVmn8lScKXyBLvPGcmwRZRXYEpzsQLG?=
 =?us-ascii?Q?IXc9Ed/G+Ipe4yfygU4b1hVgZZOcz6/tGCmK234aXqpchrvQrdmX6laHldPY?=
 =?us-ascii?Q?vjR2b9jG6s4fD5xhmvswf+faAGjGxmroq7zZHNmXAdj5iDUrKWFvLyLHeBRq?=
 =?us-ascii?Q?CKxuyig8KN2EDNAAj4nKk8oIOgUtF5C5ZnJvtMAqCGLjKqUXOggHQvTtoxCR?=
 =?us-ascii?Q?CHzGtf8QWicpKVCtp3b6c1LuT5TE1INWy7xCrFkUc9nBmePflFk1dgPUbzaD?=
 =?us-ascii?Q?Ief7je7Ih1GgsK77CQjxEeGGYwKePWxP0R00Pr9T9c0hQacbg7gMt7BanxFY?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce5d2a9-2865-4cd8-fe7d-08db202bab29
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 23:20:13.2114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xSNCNqBfKIVrw8Pdru4zAbqyAN6HeIuWiIgKGFO4JLgRxaPGsDYyvuOSwwarOHSty9wskKFljWMwxg/6B+Gi0ck92NY5KBgAkPwoRuN59s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 15/19] drm/xe: Add PVC engine workarounds
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 01:24:42AM -0800, Lucas De Marchi wrote:
> Sync PVC engine workarounds with i915.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 27 +++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 1b39a209898b..ab9dd70c0534 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -43,6 +43,9 @@
>  #define GEN7_FF_SLICE_CS_CHICKEN1		_MMIO(0x20e0)
>  #define   GEN9_FFSC_PERCTX_PREEMPT_CTRL		(1 << 14)
>  
> +#define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
> +#define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
> +
>  #define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>  
> @@ -230,6 +233,9 @@
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>  #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
>  
> +#define CACHE_MODE_SS				MCR_REG(0xe420)
> +#define   DISABLE_ECC				REG_BIT(5)
> +
>  #define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
>  #define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
>  #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
> @@ -246,6 +252,9 @@
>  #define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
>  #define   GEN12_DISABLE_DOP_GATING              REG_BIT(0)
>  
> +#define LSC_CHICKEN_BIT_0			MCR_REG(0xe7c8)
> +#define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> +
>  #define SARB_CHICKEN1				MCR_REG(0xe90c)
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 6498f187591d..6931efb3b7bf 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -275,6 +275,33 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +
> +	/* PVC */
> +
> +	{ XE_RTP_NAME("22014226127"),
> +	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE))
> +	},
> +	{ XE_RTP_NAME("16016694945"),
> +	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},

This workaround shouldn't be here.  It's a GT workaround (and was already
included in the previous patch).


Matt

> +	{ XE_RTP_NAME("14015227452"),
> +	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("16015675438"),
> +	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2, PERF_FIX_BALANCING_CFE_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14014999345"),
> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE), STEP(B0, C0)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
>  	{}
>  };
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
