Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CBAC6FA99
	for <intel-xe@archiver.kernel.org>; Sat, 11 Mar 2023 00:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E04210E009;
	Sat, 11 Mar 2023 00:33:56 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A81A10E009
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Mar 2023 00:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678494834; x=1710030834;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=735UYSVwxIauB76rhqGTRRBZayb+QSWPsxVtcmWlcWU=;
 b=NeKKqo2Slu88FcOBPWWufHsaRRCRyMJCnyP64qYOKL5+hmyYB5e4oxeS
 diT013mviaGfJjHimr3uAVqS7CwRw/ANF2nZx/l4u0yF6ERxdFeyErCr9
 654jClRZmhWdISc1m9EYjB+KE0Ae0BUS9XtUZLTgy9G5dhH5WGlfXDoch
 gRkS1WGzelo2ibd6r06tQK7u6aP7g33DlQgnJVDOxD5sLG2Lq+OHCjGi7
 jkMJaXulAnYqhvk8ytOFKfv9Ng7S8loinxkXNtvSImCl9S0Zcwc+eHo1D
 07VG6us92KnNlbfI8p0+7JgtwP9vRyy8WHI/eVs2Uw9FN4X0cqf5C/vyv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325215563"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="325215563"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 16:33:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="746934481"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="746934481"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 10 Mar 2023 16:33:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 16:33:53 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 16:33:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 16:33:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyAkjsnq1bC3fpEnh95ZY83ctSa06WhVKzr2C/SFMtQuOfMZvbEaFQx3nHXrjF7wrj7Bn2n4WBcc4bsAQsglLmidI12UTmwHh2dlGZeMf7MHSp4YhtdtAFsLS+1oa0gmrxxA86fry3kgN4PB8sT7/J4Vo8qtsPjghn+Z92PADupcDd/RN6Vm8VUUk+q1QXaXTifLR2TK9922W7r+1LfbCp0yP9ka+6+0bATrjYqRXGEKH+64o1VPvGVcvOhCAd0MO3zaHP0eg+9bBAjdzarfUTS+pu5aUj+e5PPAjUSrz+UPtL67HL5jl3NeqZp/zrtxlGRF7mv7duW1NJZ2BkAVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iixLhuMI/YjEl4Msqkdi4fQvfC0W8B5+vRv+yBvogMQ=;
 b=dNbhf6Aw1DUovFR2HPAEzTnjTBJsnm6Bfl0rsJ2kswdGbjMle8jzp2e4W+hPw7O+vL79CkLkt+9xkd8ZHXQiR5mS0Jg2DGNDlrFWF8yR/r+lIhBg6++WAuONpJ0qmWv3d8+aDxOsmmQKXfJx57IWgg+QF7k8RBySFxTeNLcJRX8/vs8AM7o6RxlasvcioPZC+DM/yeNLUnqJJlVNNeVAVYo8V/r0YfzwM5gM7YDc5tqIwyf8ICpnZUMwRFCq+/mR8/onE6PEN5yGv+xRz28VqJ3I9RCSNV71Iq8rwnV38piyES981+Y4G7tVGaUEOqJjJmjn1te9Ma07Pt1aAGNPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ1PR11MB6202.namprd11.prod.outlook.com (2603:10b6:a03:45b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Sat, 11 Mar 2023 00:33:50 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Sat, 11 Mar 2023
 00:33:50 +0000
Date: Fri, 10 Mar 2023 16:33:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230311003347.GE1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-13-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ1PR11MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd1fb35-769c-4a1b-79ca-08db21c848ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7OQynIrnop6JvzHUBTRyFH5DvwN9jQpGe4AnLIaXwt9svd/fU9qQuQYFAvzJFYKZs2qRh+wjIeWNoFVKmUAkbAQllbGuURYK5MPijB1MittCnYv1kWnfPcLSf0ZHoVLA7rj/MrM/lUIPlDyH+1MjQo+5XWDpuwfpEKNbrpuXP6Dy4/HtQiOdw1BYFIEoE3tokB1lcfAMdwlz+AnIPJKrjk6qPi67U/hxDJXGd4tz6IM2zp+6Tjwj4bxoOsIqnKJ2psjev8nP0Q1awc9qJYo8hvZgXE0AgIYuCw6RywhS/QVOtWP3YqxP81yYyLFlwYM1oYoPmr2p0jHyukdLvYbktFYVkptJgc6GTilEygzfefSSj9ZGlOEC+nXwa5KHllfavsng9ujYJnlcc0Ng8SPDGVVwOrWS2nNpp5ZOeuQfasbRMFfF7bcIrjUTdciHoeceT+kUBoyX94JNx5L4Y7QYNAyOpJrw5cElyVhzlaLITx0xp8z50VTWprZxPptVop/wkISmWky3na7sKVj0aYsfSoS9T5gqwWUDCN40IP2lt3Gi57kabQ453RrhnEJkSEqoSWfcwuFTTzTIjWYTMvPV3uqn2IN/xZTDjNbORC7uMe/0FMWOrp4a81jTaNv3RFI+UwoC7uh+haSJtzwIimC4Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199018)(33656002)(6636002)(316002)(38100700002)(6862004)(8936002)(6486002)(5660300002)(2906002)(66556008)(66946007)(66476007)(8676002)(4326008)(41300700001)(1076003)(478600001)(6506007)(186003)(86362001)(82960400001)(6666004)(26005)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BWwbg2sS2ouWSXphxbyh4GFa+epEfAm0XsGq0hhOnnE1/z8Q6rOWIXgeyyhT?=
 =?us-ascii?Q?xAv1/3PI7Lm1vS5jHX2rchS+sHZpP59JGNkumsC9uG391qSOZAu6v7LtYI0x?=
 =?us-ascii?Q?lXSgGWFUadWFj3IJB+tVLJxbKWm9CxFEW365McpecbUzCABBL+lMzOnketgJ?=
 =?us-ascii?Q?DvzH0Ynwr9miE1OlmguadyDVSYeYb3zRtAJ1+Cg3SX19Tkgbav3/0FsDf3Kb?=
 =?us-ascii?Q?Q5X8uH0E5/uVpK+gdX2JT467jI/tDons8jENcP+qpyl8c7Xm3DqaExHXwLxk?=
 =?us-ascii?Q?4oRSLI1XnmSxsU4qhkUktYN5qSUd6GPmX2fr4cgzwnPEaIbe3G+yFXb4U/2b?=
 =?us-ascii?Q?DNZhmc2r5Y4ls0jMnNu9tBpn8mcYEtz3w2SLapdA+5ZHlDF8GAH3DAYa/NaR?=
 =?us-ascii?Q?5Neqj+BdbTlfhnixTNgI9rN2b/El1WQBRXyMw0W3orl7WLMOmOinRTcT+lcH?=
 =?us-ascii?Q?ZVkuiP/xvaRWWE1vfGBjU3o7cC4HixGAoN2Zibsob/QjpQslUPLFBYI3SFF0?=
 =?us-ascii?Q?8oy6LyYm3gE6P9kT/VTfilmNDiQDx9bQYQRs7QxzaLv6ZYBqiOKVqLBvzALG?=
 =?us-ascii?Q?RwH3bdicM012g+vhegMnJH/SAuTCYjcpIyCTinEgto2P7G5UPK3tQxllh8G7?=
 =?us-ascii?Q?qfnPgnksfNmBOOIl+EMYs4sBzbc9PRsr2198ET9SsKBtLUo/lusvANARGejy?=
 =?us-ascii?Q?Sx+162ifNb8QHNP2SLTMuVBA3x7dlHSVJ4pq2Q2IjJvyO8zGMcidmJW4TjzS?=
 =?us-ascii?Q?9J6SAs/00U577z03IIypz+ybYgcVeKRIIyT2uBVZPE4HsvQseg/tNUS3VxDM?=
 =?us-ascii?Q?U2l3abHEwpDq2L0BVsyqShF+qcE+NPhUoM0YwWTOZ9/HRJxpyAgxhYaaGDcL?=
 =?us-ascii?Q?8Tdp/b5pvvuvWSuz2h6y/wH7Saw4tATVZbpuD30MQug2ik8G0XMzZo+BbMZi?=
 =?us-ascii?Q?vqHgmaB9845tAZtByAhN5L3KhvQEdS0kEloddEtaBa9jqeYDsJaRHCRgQ3Us?=
 =?us-ascii?Q?KhXp3TioJFnLRTr1RHOuJOBdnERdeh8MoPMhOc8YQATrzXoL5ZNZDmnk+G3Y?=
 =?us-ascii?Q?XUCxyrGvw4wN5yLNBR2xo9kAYESLxzI2ngmoarZyDcHiASKY1xeBjJt36KMf?=
 =?us-ascii?Q?N0+R/B+f+3F0eXwD6T2UMAOe/Mru+c86dNgyBSlTF1OJx+dEfMgevadxCgnC?=
 =?us-ascii?Q?mMzetLu1tKNu+On2SgYCd3bgXeQ/AZ4UzjjvDwpt1jpDlYg/F8PENsV08IcX?=
 =?us-ascii?Q?aR8mhbbTZWEEikmfOv0hS4x2iVUFkiPZOVeejJ/EvTMzyxZ5wuFWCCIZFShs?=
 =?us-ascii?Q?r+ljy82m9fkFDo7rhJ5B2fnO6gf5dnbgNQJB+fS0mGESoDEuz1qkkAF3aUeB?=
 =?us-ascii?Q?u+h1P5CNz4oZQ0QbHWdl1Uks2pHhzKGg/4K/s01GXRVBNvmszhKAAFZa0be9?=
 =?us-ascii?Q?QqBJTFiRFHtC15PBzCfTBEaHrNYe1Eej9oC3dp3jUY1g/jWRQCPvqoLDS0yF?=
 =?us-ascii?Q?MkGl378Ji6gXma1BSdAW8VzI/jLO6nhiofv1VnJufjaJVNQSgkjYZP2KaTJM?=
 =?us-ascii?Q?whwoIg6UkGwiNDczS0fkaItzlx1cNmQvJ/5eyA+WXhhoxBEftM81NPfCA4SF?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd1fb35-769c-4a1b-79ca-08db21c848ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2023 00:33:50.4849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvI1b5bRoZMx86fDDUggrXie/kbERYm9z5JRhgbjeXdy+zT16YW6977kL2DRvIfYen9YgV6dPJXJwqokQFNXewOV8NA39LDaLdS/L034uiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6202
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/12] drm/xe: Add missing DG2 lrc
 workarounds
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

On Fri, Mar 10, 2023 at 02:15:49PM -0800, Lucas De Marchi wrote:
> Synchronize with i915 the DG2 lrc workarounds as of
> commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w access
> order").
> 
> A few simplifications were done when the WA should be applied to some
> steps of a subplatform and all the steppings of the other subplatforms.
> In this case, it was simply applied to all the steppings, which only
> means applying it to a few more A* steppings.
> 
> The implementation of the workaround 16011186671 triggers a bug in the
> RTP infra: it's not possible to set the flag the usual way when having
> multiple actions in the entry. This may be fixed later, but for now it's
> sufficient to just set the flag directly without the helper macro.
> 
> v2: Fix 14014947963 to use FIELD_SET (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 19 +++++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 51 ++++++++++++++++++++++++++++
>  2 files changed, 70 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 7a578672a818..4a7ce09d6b60 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -73,9 +73,16 @@
>  #define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
>  #define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
>  
> +#define CHICKEN_RASTER_1			MCR_REG(0x6204)
> +#define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
> +
>  #define CHICKEN_RASTER_2			MCR_REG(0x6208)
>  #define   TBIMR_FAST_CLIP			REG_BIT(5)
>  
> +#define VFLSKPD					MCR_REG(0x62a8)
> +#define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
> +#define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
> +
>  #define GEN12_FF_MODE2				_MMIO(0x6604)
>  #define XEHP_FF_MODE2				MCR_REG(0x6604)
>  #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
> @@ -83,6 +90,12 @@
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>  
> +#define CACHE_MODE_1				_MMIO(0x7004)
> +#define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
> +
> +#define XEHP_PSS_MODE2				MCR_REG(0x703c)
> +#define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
> +
>  #define HIZ_CHICKEN				_MMIO(0x7018)
>  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
>  
> @@ -96,6 +109,12 @@
>  #define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
>  #define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE	REG_BIT(9)
>  
> +#define XEHP_SLICE_COMMON_ECO_CHICKEN1		MCR_REG(0x731c)
> +#define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
> +
> +#define VF_PREEMPTION				_MMIO(0x83a4)
> +#define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
> +
>  #define VFG_PREEMPTION_CHICKEN			_MMIO(0x83b4)
>  #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index cc7a6552f17c..f97350184057 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -540,6 +540,57 @@ static const struct xe_rtp_entry lrc_was[] = {
>  			     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +
> +	/* DG2 */
> +
> +	{ XE_RTP_NAME("16011186671"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH,
> +			     .flags = XE_RTP_ACTION_FLAG_MASKED_REG),
> +			 SET(VFLSKPD, DIS_OVER_FETCH_CACHE,
> +			     .flags = XE_RTP_ACTION_FLAG_MASKED_REG))
> +	},
> +	{ XE_RTP_NAME("14010469329"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
> +			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14010698770, 22010613112, 22010465075"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
> +			     GEN12_DISABLE_CPS_AWARE_COLOR_PIPE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("16013271637"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1,
> +			     MSC_MSAA_REODER_BUF_BYPASS_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14014947963"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(FIELD_SET(VF_PREEMPTION,
> +				   PREEMPTION_VERTEX_COUNT,
> +				   0x4000,
> +				   XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("18018764978"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_MODE2,
> +			     SCOREBOARD_STALL_FLUSH_CONTROL,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("15010599737"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("18019271663"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE,
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
