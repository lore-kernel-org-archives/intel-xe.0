Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7137E81E18
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 23:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A716810E14F;
	Mon,  9 Oct 2023 23:23:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF5F10E14F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 23:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696893819; x=1728429819;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l3yaEJ5bgfcCf8RKpcCO+YoIbb8+8bBNs6Hgi25lMQw=;
 b=EZ7/jQ3ppijjXv4B6HbW21aC/DRhZ6zO/Yptd+WviTdOZ/w42KEuunHo
 jf9eEDq1rOjrjR39Pgqk46pNRxhtHUi94lmvpf+9zxAhbQJOKgxvEgKaM
 CrD8nLMA8dus5T4wZM1iPrBLklZIzGOH0x8dFYSmYsTt3AnnFD7lpTQBS
 stdX4hB00FBsZ43gfmA17lo+GcC1/PVsCWKnSccqZYHQwptU7ZUrv8kyM
 Ojhq48v1I8fu9C3gJ/prPwy6Tx/7lAI7fa9w7UcVtv0+xlVmJg6wgJs69
 kwv1i8KwSK4uD6f29kpC2W0wMqj1cs6tOft75uHSmATfPnIadBuLelWEh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369339660"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="369339660"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 16:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="823536228"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="823536228"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 16:23:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 16:23:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 16:23:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 16:23:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZepV16aO/3dXMAsiBcqffg9Y5i4DATjmRCzDoe3SX/hS0ff55zCav+NZfe3ZTB5SUYt47lIu89LdBCX3v3wePjnoOd4tQTljP/Hi6M0vUq7jte9Z+lMK3drgGHcwnhFcbt9uRVtukC/ggbNU2VwyZ1haHsqn989IQAZJq5fi5Esfvfwn151OgpQmqw3HlSqA5ceb+qkV61KPP/B5x9FJ4hSiPZHJfDcwIYtUSTsviL4pPlwDu5OjAAYgG3h3X2JRWhquiiBoL+bxzdmnetZaAPmsaRkzxjfxN7rqgo90dv1j63JWT48wzsY5Zgs/Eka8dlVGilyOHtkEAYTU9BdHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUyTKVt4ZLubQ6ROuN8WmSrqXsnNX6SMEsfAkQe7KMc=;
 b=AqEgDMJHR661SFvkdODVoqVqWb6GYeAKwsZQMCcGhB0Hu+mm92CfSt/hnRayLIrfpm2bakcCzBRpkDW8IGuTV1CYsTRY6H1tyIvzA+lipT8HF/T24jPyx/4ZjIN1jh1eArNfpHqLuxqvk0lpq6fbf4O4WYScgYaXUhZpSN3tfkTEOzyInx+XKm4ScFDkOMtt/ufrr4g8XLo0i+zsUyP0LB3UqR59/FxEBCz49PBeKDQsO0eW5/bVNdWPMU4HOwcs4YfJPmPnN4IxhwovU99M8J83qoUCTCbnhDCHCtA6G+/c2FfsTkkSvPCErc8OfxdIM+9vYW1qSb34ZexiBd/ZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Mon, 9 Oct 2023 23:23:27 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 23:23:27 +0000
Date: Mon, 9 Oct 2023 16:23:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20231009232323.GE5757@mdroper-desk1.amr.corp.intel.com>
References: <20231009202149.245718-1-jose.souza@intel.com>
 <20231009202149.245718-3-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231009202149.245718-3-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR06CA0049.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ee356a-a6a4-4ea7-af72-08dbc91ebd66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PC06O7a2JUEEPG/eLob8sn8iKZI68K1fhKa6gjMShbCESRaDw/7Ty8/mQSgUtMlkgDU/EjeVPaaj1hOhayRhXyt9Qo2oVNvoE9r0Oik17d5tFB30rhKkbIy2RfjsbgVXaYRBbU26SHxNLczihqiMLZSsUA2jgksB6gnq6HD7ceRQ578rDNIsuuQblT/yNkuoU7BamMurSDyEgF+uIKvAdDoe5Cv2LLv4NiYFBvofIUjkB018F7HiVCoUj05JSeogOJPdJ3VwevEG+0a40EcADQPEzmnQn2TNYPMORkz6wIFouEPpxchrGCO+dqtr7HforS4nVm6+ZsgL41yAP4cyaG74EKijWtDCl2Ozc7pz0RRALczgVGsX33PWISBT42q4PAsdjEDAPsWSOlbsDqDoomfLRbNW2JoqKTGOjQkIgxs3gRjwnU/T858Goio1EowLu52EHtDJj9ZXljaKdmH3Y1yP5qDvXy+z3HkkyLpSSXprCP1rNll9BxNa63zOYKDFTnp52ygkMK+YOYdQhdVjB8JkGRlEeqnLHqsVIV+YpIF+euWyznLDgT7zKliasc+M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6636002)(2906002)(1076003)(107886003)(83380400001)(26005)(66556008)(66476007)(316002)(66946007)(8936002)(6862004)(8676002)(5660300002)(4326008)(41300700001)(6666004)(6512007)(6506007)(30864003)(6486002)(478600001)(33656002)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?I3Puw/SwMIIrUVsef8cpl51pZeiGiwm756b4EnjN0COGiYogJ/eyKZBfO2?=
 =?iso-8859-1?Q?/8Pg89RMiGvwVpiLfoL/0ZYTAB9zSX/mpxXoKcYt06rhchCQSkqlE/yK5J?=
 =?iso-8859-1?Q?G66hu37qh0CXi95KGD3sDF+HrzsqQuyIlHjsgPU72mYhHXGkn98F+EoJ4k?=
 =?iso-8859-1?Q?nKny8hfLDPh8O7+LIBJUUaXdUi16mxAa4IxsKT21yDrfbzZ5pW9wIn2NLi?=
 =?iso-8859-1?Q?ATbbI4dtmycYLa/pRbpftZ1liFaxcTtAaV2dRd+QV6AytbdUfuO+9MZlh/?=
 =?iso-8859-1?Q?hx3tKxJqQwi16CjXBj5aZ9jFR7pu/fPgI8j6LeLAdIH4IhjOW3NWkDJCU8?=
 =?iso-8859-1?Q?36ySf3ErwSzXYescYLlVd5hRtlRnu52Kg1f/zoVeyDzZLxN0KgF5UQxbW3?=
 =?iso-8859-1?Q?fZDnZSimaF56VP7zCZwDy/HvIWiMeNCRflEOqcWcw+8ZLclul34KwhsA2u?=
 =?iso-8859-1?Q?/72g+oX9PZ4Mat7MxCWah/kZOmmO6l41UyVgmex8g95TjTKED9s38W9Syd?=
 =?iso-8859-1?Q?3RNv6wS4gUCA9CZNgkm3JC0kUlXHulTEmNluXOZTiOWBODsC5XAyvWUOUG?=
 =?iso-8859-1?Q?Gtl7qkaJhEgDKYI+z5C7kb/UNPpIivdq0Kp6D7L1jj0CIl+FZvf0Io0P6I?=
 =?iso-8859-1?Q?6vthzf9Jr+OVDS4o3ak72Ln9SSdvKbz7XOuTfJ7BtWMqizra/cApNV0wW3?=
 =?iso-8859-1?Q?ng2uldMiNo53LR98FBvEk87kzEoVrQY34zmBowL09HU/5ZoYskC/WPnUM1?=
 =?iso-8859-1?Q?JNpdRg3oGDHQA0w7fR5wwwDA8ElnqXZAPXrN+W7LUd6HvNJ7diIXsDOkJr?=
 =?iso-8859-1?Q?cJ5qRC3G9d9ijQ6aR4HtyXqdp3V3lQw5vOhw67Qg1/dW2XesSinv00nYVR?=
 =?iso-8859-1?Q?Dl9BK6dr8AtuvrykKklzRqeuMhmfUZ6O7Ko7OCAhD0RI+uD3BeJzZf5NC2?=
 =?iso-8859-1?Q?jE9zEwCZpMDa/cpgoOdfnk+tgMNc9daMvHop/BNh5myncPRmaphUIZR7WT?=
 =?iso-8859-1?Q?WRn2WM1ljBaGeNdhFYLVN/gkRWi0g/IC8JXLj+xIsrfEpx0QPjElpaYKiL?=
 =?iso-8859-1?Q?T6H/RVUoojlKWWCHWrt8Wuv1FtiIBmD8u+Lph8zzoSaYKElOF0W/KziKvh?=
 =?iso-8859-1?Q?ekIZcOmvMzF6nh9NKupocNPJp+EEYyPCSjR73a/oMxPEetJzqeIWRU6u3B?=
 =?iso-8859-1?Q?NFyXIrD0zYDc48kJIxIFwFGGJqVX52v1xEh/Xkw4W27hY/cCwLANs5ZSGU?=
 =?iso-8859-1?Q?Mc36p53KPKdJUFyoM7mvwChjnpeDRcNjABsGixSGyu9+dQpwevAH7M6j9J?=
 =?iso-8859-1?Q?lqW135nLnE950qmwtqShqAtNC8l1k0kenaOnD/3NHNIFtrY18COccUl0fr?=
 =?iso-8859-1?Q?p5+LY9ngy/2AMcsYoKHhoaWEgEw9BOs1L1ccChUjhqyMDbXOnvvla8PhWy?=
 =?iso-8859-1?Q?ritI9+QOIHBR77bpDW5rLCRABzOB038WFI22P2PvKODW7N/dsyNC7ICh2b?=
 =?iso-8859-1?Q?xS71cJqPsGpPm/6tPsnJ4rI28z1FTiNUOOyhQZkhvSamQal4ubYiU2zwDi?=
 =?iso-8859-1?Q?l1vnrZ3MVEsRJOPxE2dzSN/sU2KeZTYYR8cwCRVP+ZJMpECWW/0TMsUj9A?=
 =?iso-8859-1?Q?FcqKUuh9vqYcFTL1GzEaoSgC4oLuy59tq33zUaR+AGPzR8OMygWAqplQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ee356a-a6a4-4ea7-af72-08dbc91ebd66
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 23:23:26.8792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsuwzRj/YAsqE58UN91An9belkvHxEttQxp6eO8b4XZu+E7HVAjNC9GMDdnXj2//QqlD5DbuIkQPuJ1E17B49HTCf4o55spobFKUjkxgIaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add INSTDONE registers to
 devcoredump
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 09, 2023 at 01:21:49PM -0700, José Roberto de Souza wrote:
> This registers contains important information that can help with debug
> of GPU hangs.
> 
> While at it also fixing the double line jump at the end of engine
> registers for CCS engines.
> 
> v2:
> - print other INSTDONE registers
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   9 ++
>  drivers/gpu/drm/xe/xe_gt_types.h         |   3 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 107 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h  |  10 +++
>  5 files changed, 126 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 35dd4837dd75f..32465e384fc24 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -32,6 +32,7 @@
>  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
>  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cd1821d96a5d8..c6650124ae6a6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -105,6 +105,8 @@
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>  
> +#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
> +
>  #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
> @@ -117,6 +119,10 @@
>  
>  #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
>  
> +#define SLICE_COMMON_INSTDONE			XE_REG(0x7100)
> +#define SLICE_COMMON_INSTDONE_EXTRA		XE_REG(0x7104)
> +#define SLICE_COMMON_INSTDONE_EXTRA2		XE_REG(0x7108)
> +
>  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
>  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>  
> @@ -299,6 +305,9 @@
>  #define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
>  #define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
>  
> +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
> +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
> +
>  #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d4310be3e1e7c..d566df56fb8ea 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -25,9 +25,10 @@ enum xe_gt_type {
>  };
>  
>  #define XE_MAX_DSS_FUSE_REGS	3
> +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS	1
>  
> -typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> +typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>  
>  struct xe_mmio_range {
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 37b3ee1268090..6433016fa10f8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -16,6 +16,7 @@
>  #include "xe_execlist.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_fence.h"
>  #include "xe_irq.h"
> @@ -655,6 +656,45 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>  		xe_hw_fence_irq_run(hwe->fence_irq);
>  }
>  
> +static void
> +xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
> +				       struct xe_hw_engine_snapshot *snapshot)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int dss;
> +
> +	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
> +
> +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	snapshot->reg.instdone.slice_common =
> +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE);
> +	snapshot->reg.instdone.slice_common_extra =
> +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA);
> +	snapshot->reg.instdone.slice_common_extra2 =
> +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA2);
> +
> +	for (dss = 0; dss < XE_MAX_DSS_FUSE_BITS; dss++) {

Drive-by comment:  Looping over all DSS is probably going to be needed
in other parts of the driver as well in the future (probably perf, eu
stall sampling, etc.).  It would be best if we could avoid open-coded
loops like this that require the calling code to know about
XE_MAX_DSS_FUSE_BITS (which is tied to our internal bitmap
representation of fusing).  I think it would be better if xe_gt_mcr.h
could provide a general DSS-looping iterator that hides those details
and can be more easily re-used elsewhere in the driver, similar to what
i915 does with the for_each_ss_steering() iterator.  Then if we change
the underlying bitmap representation, we only need to update the one
iterator instead of tracking down all the various loops that need to be
updated.


Matt

> +		int group, instance;
> +
> +		if (!xe_gt_has_geometry_dss(gt, dss))
> +			continue;
> +
> +		xe_gt_mcr_get_dss_steering(gt, dss, &group, &instance);
> +		snapshot->reg.instdone.sampler[dss] =
> +			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
> +		snapshot->reg.instdone.row[dss] =
> +			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
> +
> +		if (GRAPHICS_VERx100(xe) >= 1255)
> +			snapshot->reg.instdone.geom_svg[dss] =
> +				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVG,
> +						       group, instance);
> +	}
> +}
> +
>  /**
>   * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>   * @hwe: Xe HW Engine.
> @@ -679,10 +719,30 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	if (!snapshot)
>  		return NULL;
>  
> +	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
> +	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
> +	 * set in struct xe_hw_engine_snapshot, so here doing additional
> +	 * allocations.
> +	 */
> +	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
> +	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
> +	if (!snapshot->reg.instdone.sampler ||
> +	    !snapshot->reg.instdone.row ||
> +	    !snapshot->reg.instdone.geom_svg) {
> +		xe_hw_engine_snapshot_free(snapshot);
> +		return NULL;
> +	}
> +
>  	len = strlen(hwe->name) + 1;
>  	snapshot->name = kzalloc(len, GFP_ATOMIC);
> -	if (snapshot->name)
> -		strscpy(snapshot->name, hwe->name, len);
> +	if (!snapshot->name) {
> +		xe_hw_engine_snapshot_free(snapshot);
> +		return NULL;
> +	}
> +
> +	strscpy(snapshot->name, hwe->name, len);
>  
>  	snapshot->hwe = hwe;
>  	snapshot->logical_instance = hwe->logical_instance;
> @@ -730,6 +790,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->reg.ring_dma_fadd =
>  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
>  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> +	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
>  
>  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> @@ -737,6 +798,40 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	return snapshot;
>  }
>  
> +static void
> +xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +{
> +	struct xe_gt *gt = snapshot->hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int dss;
> +
> +	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
> +
> +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	drm_printf(p, "\tSC_INSTDONE: 0x%08x\n",
> +		   snapshot->reg.instdone.slice_common);
> +	drm_printf(p, "\tSC_EXTRA_INSTDONE: 0x%08x\n",
> +		   snapshot->reg.instdone.slice_common_extra);
> +	drm_printf(p, "\tSC_EXTRA2_INSTDONE: 0x%08x\n",
> +		   snapshot->reg.instdone.slice_common_extra2);
> +
> +	for (dss = 0; dss < XE_MAX_DSS_FUSE_BITS; dss++) {
> +		if (!xe_gt_has_geometry_dss(gt, dss))
> +			continue;
> +
> +		drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
> +			   snapshot->reg.instdone.sampler[dss]);
> +		drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
> +			   snapshot->reg.instdone.row[dss]);
> +
> +		if (GRAPHICS_VERx100(xe) >= 1255)
> +			drm_printf(p, "\tGEOM_SVGUNIT_INSTDONE[%u]: 0x%08x\n",
> +				   dss, snapshot->reg.instdone.geom_svg[dss]);
> +	}
> +}
> +
>  /**
>   * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
>   * @snapshot: Xe HW Engine snapshot object.
> @@ -785,10 +880,13 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
>  		   snapshot->reg.ring_dma_fadd_udw,
>  		   snapshot->reg.ring_dma_fadd);
> -	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> +	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> +	xe_hw_engine_snapshot_instdone_print(snapshot, p);
> +
>  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>  			   snapshot->reg.rcu_mode);
> +	drm_puts(p, "\n");
>  }
>  
>  /**
> @@ -803,6 +901,9 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>  	if (!snapshot)
>  		return;
>  
> +	kfree(snapshot->reg.instdone.sampler);
> +	kfree(snapshot->reg.instdone.row);
> +	kfree(snapshot->reg.instdone.geom_svg);
>  	kfree(snapshot->name);
>  	kfree(snapshot);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 71c0a0169e62a..0a10a79962c97 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -221,6 +221,16 @@ struct xe_hw_engine_snapshot {
>  		u32 ipehr;
>  		/** @rcu_mode: RCU_MODE */
>  		u32 rcu_mode;
> +		/** @ring_instdone: RING_INSTDONE */
> +		struct {
> +			u32 ring;
> +			u32 slice_common;
> +			u32 slice_common_extra;
> +			u32 slice_common_extra2;
> +			u32 *sampler;
> +			u32 *row;
> +			u32 *geom_svg;
> +		} instdone;
>  	} reg;
>  };
>  
> -- 
> 2.42.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
