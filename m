Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13815C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 14:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F24510E328;
	Wed,  3 Jan 2024 14:56:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E9110E328
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704293817; x=1735829817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dfgKXlsQ4im1pypUpOu+nTpfhQjc+DytoyINlple3ok=;
 b=TCF/fW11K6TAGITJ1HUaFa414A2ub7yylpUoJR6Ap4EJ7oQdEfnVFFWp
 UObEhaw4ZDmk2fS65CXA9SR5N31v3fs+VfMMgo8HupqdqN2gJJUIHxShq
 KU4TFfH2hIGaOCoKzb0G0UNLojaEArUXP7rK5hdu+s/mZF3cbm+G0Axij
 h4a1hMeV0BlVLUI6mwugJHciLJPl5iUwnwB+8qKoWE7VjwFBsNzjQEJAp
 VEyyWeswEJ9e1Oh/dw+P7XY9RUYXlTHZsPG5ZdpDnEs8wAFY5hFMI6Wt2
 dmya8gHdWuadNQBzzwV69NtJEm0euHnVnW6gzS7J9IPLJjdo07pqptnxE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="3818245"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3818245"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 06:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="953249015"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="953249015"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 06:56:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 06:56:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 06:56:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 06:56:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIsk+EdbGdunhN5tSnNOWDZuczTGq43nFdEZzhzA97JHVYHsA/N/1zVs9J9i1UO00iNTefpd6Qaew8G0DTMwoSeh0Ojpq5b7ycoPHGGVME4mlReH3VTQPZhB9mrH/c9g777LR2TOdt3fHZA9p/xpL8m9wxzI6lgnVR+0CiWNoj/YV9U1d0reQhNGn3zSeNa2LKICBnkJcoOprLn2l0H4sQc3z9V8skT/MuSu4y/dOsPoy2gehBe6QQsIB4GLNhB3IGfYImdI8QwFtoAcZewAZA+PCFI/hsQcF6jbvohNvtzjajAiHGGfDb0jPJsyMOj2ROer6U5Z16ZruYixTcVQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRF/UF+rblgo6SF+cyNAJ6Igre17b8OYo0QvNrKWsMs=;
 b=i/lTeGE7517AjN7WdGMqaPgRVBDmrX/1h2ktL7i8YDX64WQaa1KUAgB1SAyJWDfuT5pr7Z/hQFy7pNh2FWJ6iHqTQbmw3ijkHQOufRETkO+s5GOn+2k5wp35+MrVU3TuhhgVheboVjzC8FmEA6RDYASqkXcz3SFgoSYskD2in7eoHpJuHPTbuPYK0txqtMB0rHaJJ0FQK/Ljo1J8kWK+j94bJEIlZrMw9lJJ3+21eLdTw/9QtksgmPpa+C5QfCcxj+XIPtvU+yODPAbyfEJDfCl8way8BTX3wtKVTTNT/SaUn7LPa8qlTzatNA34jNpFLRg7I1csl4l6oO9CEsCpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 14:56:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 14:56:53 +0000
Date: Wed, 3 Jan 2024 06:56:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support
Message-ID: <20240103145650.GC3529480@mdroper-desk1.amr.corp.intel.com>
References: <20240103130517.25903-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240103130517.25903-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a03:505::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d29003-f95e-400f-c8cf-08dc0c6c38c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V4+SqqbNU+TYol4jGUewThAj+QykwuwUgRR2oU9KheWJIA2el1GJ/4tjSi/38LaIRWu/ihMWKaBwET+lm1dQ6v/Dl/YZYDa+X3bTkuHbk5M1ALkFHX2j9mkHNXxxmPTNn/mLMlUljXvKH9JWLLLaPnbMGwts/+KICI44pH/gWt89Bo+wgmXODWheFLLc6LJ3i1k3SGEz8XRcf6Hmsxq7FXi6Kleftn0+5sfDidq+PIext6ANVezgJsDc6oSOUH6J3QW9Zk5CGANsB6E7Pf7eE0dE/u0cqI4xGqVRZfsd1h7dza/2S05zmpnUnJlufyDiA8vShjW6KmeIh1LhTIe7SCn5g1Fe8GRh6MoOjBhuu+rbab7MtzumxKq5iMPL4WRsVePG0dTbKFLQV42GaOf6tl+6GyFY1P7/GkDCEgvF5DgMHlY0Iwml1oxMheOJAvuJ9IIgDy8XoDgJxz7ePphbPScx3FkQaDBS0C4aq6Y2BfePEcV1zn7KRFq5eBR5KwypZ8fjqV2Ay/iEhcFot9XTEItUNVnudQsDxf2Na30zuoduietOj6z2P0kLFnsP9puO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82960400001)(38100700002)(86362001)(6506007)(6512007)(478600001)(83380400001)(6862004)(4326008)(6486002)(66946007)(66556008)(66476007)(6636002)(107886003)(26005)(1076003)(8676002)(8936002)(316002)(33656002)(41300700001)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NgFFSeyrSKNXKcppOBAqtFz1ns/2cFmMQ+nwC2fclAQqKsEQ4k6/w0rjc9c7?=
 =?us-ascii?Q?PszgOQn6eNaDvhkMeOvZbSgxSL+lhQEa8gPCfSB9rzmN2EyFbyMshe6ftAbS?=
 =?us-ascii?Q?N3sjI68WpQpzJ/FDFYBfsVsnsaZJZh49OVVob3Ev7DU7TJP6Okpby6DbKOnE?=
 =?us-ascii?Q?/WJmxQHcFF08zIDCA5t+9r221ccF75UXP4t/UKml2t3BBhp3eI+nAz9Ii6jv?=
 =?us-ascii?Q?Y0fkGFQg2Qb1kSFPTGrUSmrL7QtmIuKVM6udMgiq7fI29kvhTv68vpT0v4u2?=
 =?us-ascii?Q?U7c3iIqGYdWwlDxwG15MoNUhQw1G3pFP2CVaj7/pxI1NjVcOfpg0iiAJqwYo?=
 =?us-ascii?Q?L3SWxgw+1DD7QBJwvIKqctEiT9snhyCnJhY/vlfud8/J2l9LloA5a9d/4fgE?=
 =?us-ascii?Q?vTjbeVrcCib8zpfdmdVLGzSJK7l98+KNaYg3IxbXeUOn3tFDVxV8M5miowzc?=
 =?us-ascii?Q?cpkthK5ZPTrfmOiHi7+6kFfBTAOK+acPp+MMBRNny23dKwBjMZBRmYX9Ia3n?=
 =?us-ascii?Q?klGaaNUXSTWsZQcA4k3alWd7dFjsemP/aek/XBjJyF/JC7TcfQe5CRu3+yx3?=
 =?us-ascii?Q?enz6DHZZXHBNgcdpsHZb/KGn31ODXsGVOmRZhsQ8/rzCRbm7BhulmQkQnpL4?=
 =?us-ascii?Q?0z334ZIMQjXNXsksh0hkHfpAgosjo+xy67iq2TyW3kRalWnLow9106NIXsSd?=
 =?us-ascii?Q?jxGqqsxrP9kOds+diNVLq6SNsZpW4z15qdyScMT8pJ04gGzLJdKr5X/STLGn?=
 =?us-ascii?Q?Q3pqgpiMMFGj27t/3FdJfAr9qXI7tQH531JapelsLBZ2NST3ubxZgWVnaHbO?=
 =?us-ascii?Q?a496O3Y80KkfcF/TWmJTW8LvSaugeA0VkNNiBs1QlBP/1T/0TFofindvVuWW?=
 =?us-ascii?Q?DXNyKyyKPbe8qBU2zTjhGciQSJxVvsPsNYY2DxywT8t4YkxKW7VScl8v/Gc4?=
 =?us-ascii?Q?U18WOKFF2/0Ymuav3wKkde3Z8ybg8P0hskY3EzJnDZob/heVisoYNhPIKvTP?=
 =?us-ascii?Q?g7t8mJeybWrntZ5Q/uDRO2Q8+m8+Urn4qJbztAQlyt93vUFVKcy9/timuVWX?=
 =?us-ascii?Q?/nRoJ1hybz3qaE6ro8xWFx/F5HraX29wlDeatl2zTN0+oyiZXLETTZunzK/u?=
 =?us-ascii?Q?tNVOGAaLVGYTUlUjXnNlXDux05wuc1ZUCCPaQNKQidNIynzTlNThHWJItHmc?=
 =?us-ascii?Q?op9zLNAJ8ObRLnjsZy8NyzWh/dSt13r/riqgE8YqGt7wRKBgu18HGzGjDzBj?=
 =?us-ascii?Q?/0p8YudfKsik8LgfJAZYON1j3jvYY05llbyE6EYLT3lydORBgPgvmvFikIzK?=
 =?us-ascii?Q?oChUq7fNzVtZd728KFRMTdq0kCxvWqniDQtTOn0zlrlERJ+6LGGRuVG2EgCE?=
 =?us-ascii?Q?YcxcLoMCkR9SSOTohZs3W+SykSTRbLr+GNsPUS0S+l4L+ynPZW9PkbBhz7lx?=
 =?us-ascii?Q?JQ97oQTOIwMLTiZmTSbJdLDaUfU479UYtYL94icQgJpbXhs+S4cQG4pB0I9+?=
 =?us-ascii?Q?WXAGEleSwGF6FGl3m9pTliLUlQ2titabhCnR24T8Wu4j69D8Scow+/leYx4x?=
 =?us-ascii?Q?gSLzFB7AZB2VMhExinhQv9dxhxvDL/xcoyPBeBk/BSOFbZrkMcL5HaOKpk7C?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d29003-f95e-400f-c8cf-08dc0c6c38c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 14:56:52.9948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrrfroEGNPmWbbf/ZcrMFadRkN85cxlfHf0L9939TejK6ZlNISiiuYucXUUXJ97gvmLJwOk1RD6/1bzYpZNhqlcyA8IGK5SrelVbKxMl0LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 03, 2024 at 02:05:17PM +0100, Nirmoy Das wrote:
> Recommendation is to read FUSE4 register to check if WMTP has been
> enabled/disabled by HW. If enabled we don't need to do anything special,
> however if disabled recommendation is to also disable the WMTP mode in
> the FF_SLICE_CS_CHICKEN2 register, falling back to thread-group and
> mid-batch preemption only. However on Linux, the per-context CS_CHICKEN1
> is how userspace controls pre-emption, so instead use the default lrc to
> disable WMPT using CS_CHICKEN1, if disabled by HW. Userspace is still

s/WMPT/WMTP/

> free to set CS_CHICKEN1 to whatever they want later.
> 
> v2: remove redundant version check and also add descriptive name(Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Co-developed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c    | 28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 6aaaf1f63c72..6dfad86aaea6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -146,6 +146,7 @@
>  
>  /* Fuse readout registers for GT */
>  #define XEHP_FUSE4				XE_REG(0x9114)
> +#define   CFEG_WMTP_DISABLE			REG_BIT(20)
>  #define   CCS_EN_MASK				REG_GENMASK(19, 16)
>  #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 832989c83a25..88dcb8cc8beb 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -316,6 +316,26 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>  	       xe_rtp_match_first_render_or_compute(gt, hwe);
>  }
>  
> +static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
> +				      const struct xe_hw_engine *hwe)
> +{
> +
> +	bool mtp_disabled;
> +
> +	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
> +		return false;
> +
> +	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
> +	    hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return false;
> +
> +	mtp_disabled = REG_FIELD_GET(CFEG_WMTP_DISABLE,
> +				     xe_mmio_read32(hwe->gt,
> +						    XEHP_FUSE4));

Since this is just a single bit rather than a field, it's probably
simpler to just do 

        return xe_mmio_read32(hwe->gt, XEHP_FUSE4) & CFEG_WMTP_DISABLE;

instead of the REG_FIELD_GET.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +	return mtp_disabled;
> +
> +}
> +
>  void
>  xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  {
> @@ -346,6 +366,14 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
>  					   RCU_MODE_FIXED_SLICE_CCS_MODE))
>  		},
> +		/* Disable WMTP if HW doesn't support it */
> +		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
> +		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
> +		  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
> +					   PREEMPT_GPGPU_LEVEL_MASK,
> +					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
> +		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
> +		},
>  		{}
>  	};
>  
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
