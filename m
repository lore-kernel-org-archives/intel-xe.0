Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A98C64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 00:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0ED10E762;
	Thu,  9 Mar 2023 00:08:19 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FA910E762
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 00:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678320497; x=1709856497;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BzRH+UU622GZtnksyIhziLs6UITpE00FL9FU1cxEAFg=;
 b=nRqKZL50b0Qc1UxDSf94gJzXhtQOPeOAjgUrRoW/AwuGR7vYqokt/fMy
 1bapNY+/g1QVwB9B7u90T7FKYRId44RZY8jQYSxOlrjZ9yYXltjYgFxn0
 ZocaH6/i06oOumgQBKwnXwgwvwF4BfFr8PpQn0pCsiCV0Mhh2Do5/Ew6I
 dHrtzsc4kuRN0+qpfDj/g05eRxHjTPnB6OtRPE2p/0Mdrc0W6POg07gf8
 l4oluVV+ziLHFu+VyNjJFWzFRV7P879/iSoskGHfE/qMLl2k89oAn9Gwa
 MMe4x4ORiRTqE91bg/LKZcEeECI03GT3PkT9g/BurhnbJKfbUDaDjU726 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="336327120"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="336327120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654548870"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="654548870"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 08 Mar 2023 16:08:17 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 16:08:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 16:08:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 16:08:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr+Nd7HQo4mY6y7gBnPx7rW5bpHuFOA16HRxQbRUBPdZ7EtZapypFNwNg2Ovni9lxNxcWE6B2KACkcnH/cjpuszGE+jEPWp8wwGmZIqwKqyf6shuz79mCEKYkDe0b5yWZ/Rcs9Rfy7+Dmmvq14p9KYaJ89ziyx4Dj5sFK5hOtRx2WZQsH8eFoWS6djbmwvfd9fmXRN+kRooizYisNZl8zhRvgqKBAx6ki92ZfVjoAafJFBqNyHtJFf+ToTEajrdbQaQEducFYXLRn0XHYGccX1lNIJbFjuA7c5o02x+T7vhQbcIx89hGPlBiAr75YSGI+vDeohoSyjZbZthrL7GYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v03tZbQyFVUVHXOLWBa9XrwfO2ZfdUreto6SElcfoCI=;
 b=EpyzmgUVbDY0mqV/zk635CbDWyPvsyX9h3EsaCAJtx3ssH87vFPIWJ7IDGdee/zzcQX8x0oirT4P14Mm+WPVegCo47L8aWnL5KLcMjXmCKalngwqbwY9K2Pl3WLnNGLbO4Mdr2jn1mKsc5+lsdLzGHdvbbn9Wq/qOLWOfo6Mg0FF/mQbvwBmz5jp+rZIYfmIYHBwaOmZJVARm35XA/gD2u/0dShzD+so8Pc78kw0kiaM9ss/wF5TnDz1zAYufr8y/qRlxb3mgEQs4LJ09fOzDrr74KN9saNuLCuWdLqf1eMDFvmVjJ2HNh1JWySfQBGydPEVlNHHq/Y60OGQjnNlpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 00:08:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 00:08:14 +0000
Date: Wed, 8 Mar 2023 16:08:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230309000811.GO1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-19-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-19-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0071.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::48) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 61361f27-84c0-41d6-5520-08db2032606f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g7d0k0RIcpGZ215i641mDYAPRzz6BKC17ATBeCq/iMOBUiTp+lOV1zu3+QR2SD2OYZzmC65P/bMzlA4fc/Z80omJrH1nU78EQm1r8aw8Y+7GVUMi72j/hAdfwC/MD1OVvM/k8ZS+ylsG1pbnmRq90DeSwpyGSyq7qbmm9uli4h5L42BbL8UtExopfWwq/kgeTHTfcgGSeoULKSkIgcUyK5urTBcXDQzBggeEOSesHNB5BA+WxJBHnQ5bqkmiH4hcbPDP7ZItGt3kehrsseoKu+FCF36c3qIWjLp4X3eWByGnZ25l18y34WPocsNuANcroN5JsdIzW3IjbXtXHEhnKzOJEtFvHKkUF8EIKIC5boXuj9IkOU3T+FBkKmcdztOe13pVbuwP7DrMLgrLm9bZ1pSdLq+xekozNYZtbQrq4rL8rMnYHVoiHxL06pb1IcugRdx23AuBfTFhVdpuMsGQbT0Va/ruW2yi8+ZBb7IAxxBKewWIBtAjyd9IiFRq+D+TsZXTX/lHjzhOkidB7nHJ8pIbU0iQd9Yp0Y78lcbJNChRlMRrWt0YZFDbibc95GJKGxIzpzYRSFe3A0i/PoJJRhiyJplTI7PTlvl96p1CpzXHj0u0BUj79DYPi/A2Bd10WDeHujrG/4uRzZjTl0PAlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199018)(86362001)(66556008)(66476007)(6862004)(5660300002)(66946007)(41300700001)(2906002)(8676002)(8936002)(38100700002)(33656002)(82960400001)(4326008)(6486002)(478600001)(316002)(6666004)(6636002)(1076003)(26005)(83380400001)(6512007)(186003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?26wUO5u9OnoAjP188rk9IHSgFxw69N9CzUwenthx8SwCOeKidk+9jpXYMSiQ?=
 =?us-ascii?Q?HIMM6hh+MGfzdECS7dqy0m/hgDjiDxL6QgFqtp3L56SBSskXB7g70wzxeoig?=
 =?us-ascii?Q?R9GO7J8ls1gQU1LZm34TYqKHWAdpdpCzZHigB87r8VircwuAwiduKnOykaOq?=
 =?us-ascii?Q?X4x80C1f0ZdfIgQHdasw0Pld+TXgQ2RbjFH4lGGBQ/PbbcuIba8MOkngXowM?=
 =?us-ascii?Q?m9fU9067IHEEvO3f56YDRXw1mKmA3pW/hUCNSDhBHahRIphgHa71+dIGIuel?=
 =?us-ascii?Q?ZFLsnooldJO1t4uKkh5t0rSOX8vdOLrZr9DnGVRdDhzOsLBIdFYKChNORkEj?=
 =?us-ascii?Q?LkrJdA8XC6kE+LcquhDryKjBCPpl7Uk6TSiJumW3JjiIacJ45OYVTKoCRCzK?=
 =?us-ascii?Q?PYy7pSJMRl15xnZkI2fQ4K4DFil3x3wlkhUa34xv832tncSLlcTG8A9YSrZI?=
 =?us-ascii?Q?4OeOLsj7uIiM/XO4TGXE5f09Ix9Uphk/hLUuB9ggUyGJ0zkjE60RBlVkH6ur?=
 =?us-ascii?Q?gWy+r1V/Eh87CVouotr2lSuWxZUa6bkNqvK5GdGkqhrwW8tJ3iRCqfstdfwt?=
 =?us-ascii?Q?YSXwVV+1ExEEk8FCbsZ4tQkTPC3PZcYhGARa3AkHHPuRfVERyXVXQbU3AC7z?=
 =?us-ascii?Q?9g4t1ZJTOdElqlMhE9gw98UdmzroMXQw1RQ/100WXlm3QAXTQG6I2BUDN8YW?=
 =?us-ascii?Q?jQYMGuNf1yADCFcdPDSOpVlA9LUHjf1ONufyWlkeU25HeUX2utmdx0HidtDx?=
 =?us-ascii?Q?msGa9ilBBpZCQwDcTYuIrQ/1R4ZOhaPrFYPgeK7ezDdC3ZEYYuv6RJhfjVPI?=
 =?us-ascii?Q?dkj4MYQRq5qbjrHlRBmg9XVlWySQwtEjau2dQx0NgCv4BOd3uBFNE2CQQSOY?=
 =?us-ascii?Q?PBCyNIt5VqbXwz4HQNnmqViuNHoiAEgP6FYUrutGg4Tfso1GO66B7KRwtdA9?=
 =?us-ascii?Q?QJ0wF2PeuGmGaChcYR6KVDYoOVpFRUTqSRnBScVPVMFtbpYIniURW13oSm3d?=
 =?us-ascii?Q?Q4W4xhYrLOe7M6ZhI8LV49FqU0bYSLM1VilTzOgV+ZrdMLzahcrFlKI2MMPR?=
 =?us-ascii?Q?lbi0SJkPRcHlh0uPYC3kFWEhrzdwwBX68a5A9U/7nDa94HvfK8lF6wGc9H4Z?=
 =?us-ascii?Q?4sMRZ9RIcw8kQZkL1+Q96dyC9FJq8g3/RMeILAMnLzr68DuBLZqqINoxRyw6?=
 =?us-ascii?Q?L7gZWLVv6rKGsdL6D9OIzfE47+FNsqahTl8WN+8j1xClQ+GcgqcHMGBIne9r?=
 =?us-ascii?Q?HauMIzKPi67cVupm71y46nBPRhwVCgqzCqimrV11gg8eOEE75fbmt+NPYgX9?=
 =?us-ascii?Q?oAvEN2SADe/vuqeZkr1wAm8gVsMoXQhvl88ZY4wXSphcr939vh0nPljxINpg?=
 =?us-ascii?Q?BPV+TwE+pYLbCmkaQnxRddppucciqobDQiVb7Y0D5V+y6xW0VeFv3qq4YrMM?=
 =?us-ascii?Q?2R5LbtSX7nrwZT0CuIrbtpMoTb0xCJMZRL0n3JjxlUfxzXNgL4GQwrpEkvrh?=
 =?us-ascii?Q?Y2sRiqMPXdWutwSyh7ubmAfgkqHZCme9XL2hHC0j+uhcSgLIWX+PG9M9A/bL?=
 =?us-ascii?Q?yOcLnu3puapZs75K3cZX1i3sWgu8jVD+0bNVShenWl2aXhGrIcdy15i4ky6z?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61361f27-84c0-41d6-5520-08db2032606f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 00:08:14.3294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnszYU27pfFcd6ORsX6d2IMKXVm3yI4Cq2jp8OCMCVKRRFmRzofz+8Wl7eQokokgcbeMC/HYxHqSAs/iaNlCVQksTEtp8wtwd/SGGxGKTlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 18/19] drm/xe: Add missing DG2 lrc tunings
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

On Tue, Mar 07, 2023 at 01:24:45AM -0800, Lucas De Marchi wrote:
> Synchronize with i915 the DG2 tunings as of
> commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w access
> order").
> 
> Contrary to the tuning "gang timer" for TGL, there is no quick
> justification for why the read back is disabled in i915. Keep it
> with that flag for now. That can be tentatively removed later when the
> read values are checked.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 21 +++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index b1ef6ce72269..4d66f8f1119c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -73,7 +73,11 @@
>  #define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
>  #define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
>  
> +#define CHICKEN_RASTER_2			MCR_REG(0x6208)
> +#define   TBIMR_FAST_CLIP			REG_BIT(5)
> +
>  #define GEN12_FF_MODE2				_MMIO(0x6604)
> +#define XEHP_FF_MODE2				MCR_REG(0x6604)
>  #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
>  #define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> @@ -228,6 +232,9 @@
>  #define XEHP_L3NODEARBCFG			MCR_REG(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>  
> +#define XEHP_L3SQCREG5				MCR_REG(0xb158)
> +#define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
> +
>  #define XEHP_L3SCQREG7				MCR_REG(0xb188)
>  #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 47b27dccb385..7e7cb834ace6 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -35,6 +35,27 @@ static const struct xe_rtp_entry lrc_tunings[] = {
>  						FF_MODE2_GS_TIMER_MASK,
>  						FF_MODE2_GS_TIMER_224))
>  	},
> +
> +	/* DG2 */
> +
> +	{ XE_RTP_NAME("Tuning: L3 cache"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> +				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> +	},
> +	{ XE_RTP_NAME("Tuning: TDS gang timer"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  /* read verification is ignored as in i915 - need to check enabling */
> +	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(GEN12_FF_MODE2,

Should this be XEHP_FF_MODE2?


Matt

> +						FF_MODE2_TDS_TIMER_MASK,
> +						FF_MODE2_TDS_TIMER_128))
> +	},
> +	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +
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
