Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BAAC64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 00:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EB710E769;
	Thu,  9 Mar 2023 00:15:25 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC1410E769
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 00:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678320923; x=1709856923;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nMIb3LIDzSW5Qq0Qz1EZAKRlaC0c7xdrUrFuBACWjTo=;
 b=k0u7UpxeShNEVwuorA6HHCR1k4SvfUhBuhoWPZ7heFJWQb9o2Y6ZJZVp
 +ZuBoGX59VbPLMfiF5z1QQSK2m2CVkIGNCexp/cS+UBMOhJZoZtCB8Jg0
 bqaDfYNMQJFqT3fZxyuuCTKrkeqFr+JpFbfAmIUHUlJx9/PU6cjzwhPlh
 s7ZQr+Fd/+3p/bbD2fOs5bUiScXwPqWteA3Etf6AVu4hAwydfu6vioNKR
 n8NZqs4zehRQByRVKCLr8nUEMzFZU3+rWUkB60r1ZhZuvE24x8WlTghxZ
 Sz9OgW+jx0Bm1xYA2a3vMESwuUVBqpWHotpOqRrKK8poQYZw2QhwPUss1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337837230"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="337837230"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670536319"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="670536319"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 16:15:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 16:15:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 16:15:22 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 16:14:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URKLdIHD6z+QJmNeZw3W+9FAheBmQt7HaAv3+hNrJUKJ1rlNJzW4M/Ja3zMrYuHp63ENC7A3xsd5ulMN/mhZmp7Z5BI7bFHKwqkZS8hG5cKU7JKGqux718JmRUXzNWqfUgV3OHTi2EUb+3AyEtHPmEPxelPWD6Oc7iDzV1HWPQK4JdGDDOqUxZyBX2M6U/juaRb5MX2N/3rP3esvsrRWH8FAbSWo+tKOUy16c9sT+aBAW1U7kB4IUpC2/to2Kr/ne/mxWn++hE08BhBJraoLdKfXBT9n7Pc2vscHYTiQbdRkTtxkHdJa1K8uAva97ObvI/eYRT49rKgx9lDUzJjQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/H5df/nf2a5WHcru5Vj/w+TuQDwgEtHBjRAslTVzA4=;
 b=esTtaijXC6r2YnEovfj6FxCm6MbDgR8Hk8p59RjCnR4LAXKn2Dn7GPnEgudD3qn9FGxYQNT1TgnvNUQUL8p6HMRRCI7TzbKFcEtBAV9cVc7wgLljal5qobmOi2JGOamAIoaMU+zKPz6mvAQbEyScqpX8r3xdS8n9rEa2yVHwQ0tLYYRk2Yl5eILXBVbhi2c1MLNbCE1CLNMnoxXVTBFW58tGbeqs6EDtmkEF1z9NthJQOUnokJSDHhnePcP492vFcz0Y2yfgyQU+kn8CnD1+Z//PIKM+6nUB/370bnyR+8N9+X/FmADQsRHX4RwlNo+TP0KvqWnUHBJ1ryE7UfRLDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 00:14:56 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 00:14:56 +0000
Date: Wed, 8 Mar 2023 16:14:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230309001453.GP1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-20-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-20-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 53525529-5d84-4025-e7fb-08db20334fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L88ceHsdowhYt/uFNhnsS59uWNp8PzHaPw2wB/MFy+PPWjQWtGFaJRuBSx2GYXEmW8eeiTCR3TkKMMjAD1vhxOLwYAjbWTwG8xIr7P0y3cJTGiAvN4IEMTPCwlc40mFcClRsvnGs64Sk2Mow2EaOGmTAlst5FUx7o7pkfnkFU/BeetT0amNI0vcJfk+kQ1G0TCOUp+gr+9Mnc1WYZtgHOzWy4A2u8pFbDXG5ZFtLzKKZ12GACMyBMgzbpPZD3jJp79Ek3OFAkWwDH+oi854mF1tXPX8/Soo67rMvSM/QGdJuqMAXSyEyQjII+Bsr/IU7sQOzqoXkOtlHZ7N96Qy8bZJsJeQQWdsbKfsFy69rWlckQ1FJDE2z29H6/D6pDOYtfiB6iFKu/HdGZEMM+zpK4K5CigBiftvtDwDPfjPRsdqFGKacZqj1jpTiudcPHUU/s0LTpfHiMla25Ut7uYu9Y3g43W6MBEQCE3FWV8wCF/sY5Ew9RlREJlvuBBhLqT/HYxqyuD1B2bN9YekFeqBMxNTFTGVAlD80QyvgB8KFxNFwxjCdvQwJ+JM+YpfTjHbe6yBZh90LZtJ0kCNZ7MH7iyR4sLJX9jV30NZv7MUv3MwJHG7hgBB79abs7YPnJGFP01kkzj3cmWEQaVXpgBDPig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199018)(82960400001)(6636002)(5660300002)(186003)(478600001)(2906002)(33656002)(6486002)(26005)(6506007)(6512007)(1076003)(6666004)(86362001)(8936002)(38100700002)(6862004)(66476007)(66556008)(66946007)(4326008)(8676002)(83380400001)(41300700001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bdBF/tPSkARodHrUGgSXOvU+G33K5QP1FgzIMRUG57aGvrAV93vOQyMBDkT7?=
 =?us-ascii?Q?XtiOcs4r4/KhYzvJgfvm1cIRLegyiT9rnz9nN19o5IUCT/UiefSYEQ5KMA/M?=
 =?us-ascii?Q?/7bycAlR+AS9HWCn003DgU5PasZrGgTtcflRxCyaQV5EE7qkXgtt68KqSJ9p?=
 =?us-ascii?Q?KnStCAQPuFVSmrO+VmIr8vnPAvWmdjM5SohcVPI2Vxsdx6N7RF+q0PxczVH7?=
 =?us-ascii?Q?7Cw1BHrCx3voUC5Iktaf+S8KM8xFpN7eba5QeurppQ0+JNnvZ3Kq4TkYgs4j?=
 =?us-ascii?Q?9fBCGZQZk+F8RvWkger/jmVBVgo2y3LF/cz/VKHT2rnnSkm+XwJNRsMYKuEO?=
 =?us-ascii?Q?/6o02ik6JgFkZqRLBU7a3CxpMsOnCvq2XPI5LJ8xvaP5YAEZT+Fm0/Zuwz4S?=
 =?us-ascii?Q?1C6L/AP1H2TuqTW7JTrEOtR7NKttym9vcJJ5quoQI3SotBKveLM5KuSfpGvd?=
 =?us-ascii?Q?zX00RBpMvF6Reu7YPSweamrBJxn1JiE8pobQO3x3mrrNClzUpEr5UT12sf3W?=
 =?us-ascii?Q?rGCiG6zsqUq04jE6/rN7pjChGaY/ZSLhg2rSqBHxtWnPy6EKhr9UsdCnwN8/?=
 =?us-ascii?Q?kkP2QnCeRC8uO+NKZ/rVxVksO6wh/0hrIdt8uYvqtxg5g91QN/dSPyt4IMHJ?=
 =?us-ascii?Q?34jimDnZK4zsDxxpdhxSCw+3JC0QNSoGSXZwRuyHFH1STfkabi0QC7eGDaar?=
 =?us-ascii?Q?/d6gt8Kdx1N3ANgluez3o3gC6BHwz0o7yIaFuvj0JbzFRGGKyXj5L8WUM9ys?=
 =?us-ascii?Q?Pd/i1lPxr6KylxK1/pyILknY2fPaz4xGk3DNIu+Zws0QXmIFMZktdl2JwEks?=
 =?us-ascii?Q?jQre+Wjb3UCpsC9yUVK9+ApzUOt485a/7f4rVOk5sCZyk/OXN0O4gsvntg7/?=
 =?us-ascii?Q?wnryP4tWx3cb72hIO87oevpe5RNhP8lFVx8C6MqjebeUbSQFfMp+cZOrpenS?=
 =?us-ascii?Q?/ywWkIMGF5k2Elsx4H/6jgjkKxj99qCrnCyS7hikVtS/CytrpT6ww69OrvgM?=
 =?us-ascii?Q?fdWO7s9fuohZB4KPVOyDAwZol4FR6xx3kx2yrwKB0SJvwXyzgj9GJBJwRj0u?=
 =?us-ascii?Q?hXgnyV+kAwlk2Xs2OU1q3B4+OFeVWifsoQzpHWTu4iceTllH8yIr2KDnnFVo?=
 =?us-ascii?Q?lXkDIMxcTYy9bwdXQgCFPog6/331xLPAqugsM5NnHOyrOLnIo/oT2IAv4Qmv?=
 =?us-ascii?Q?TbaqlJ3BLM19XuXM/IsOpbGJZ+yQ9N7WMmlP1FSWjqCMSFMC7vm7jU1oy+9L?=
 =?us-ascii?Q?haYzfOeMClQsSkJh432ms14yw6DfgMlVQ0kX2XRXgpPx2XpOgO4V/HHey7cS?=
 =?us-ascii?Q?xTfMmuWBvluByKgX5PGM98EtQwm4B/7mqN6i5zyeH6iMPochcBlYEZaB83Bg?=
 =?us-ascii?Q?lj2mvYi/0i5D5CPuY34Znr5136dcclTJtT+Q+jk+ORz8L9GYE2MKM0qN2Gau?=
 =?us-ascii?Q?SYgBovGjabt3pdLdc66SzTIJsVPN7x+nv8NpfvQw12OBl2MuL2aVC+3ggnMv?=
 =?us-ascii?Q?lUHJ7X5+CCVOGXZQOxQfhHwTzq78N2Szg48cgu5hCQPq/G+To1e/UZm3MO1s?=
 =?us-ascii?Q?pBh+ezKsehYpuB0m5L8sFrpkm3WM1aewOkI5qKGIlK9GzUIVoC7XBM7sRmVb?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53525529-5d84-4025-e7fb-08db20334fd4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 00:14:55.9081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvZRu1MeZ+DMBqzn3N1/H7u9hVxOU+tp4gW5Z3Bmm9LqJRQY8Tm0CFaXNOjy4ihDYJhjZv53ZPjEq+RYvl4ocMMKJrXto70Xr6gQLgwe6zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6952
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 19/19] drm/xe: Add missing DG2 lrc workarounds
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

On Tue, Mar 07, 2023 at 01:24:46AM -0800, Lucas De Marchi wrote:
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
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 19 +++++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 50 ++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4d66f8f1119c..e3cc1c43f2f0 100644
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
> index 50e16f18ece7..b67cc3f0b7f3 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -543,6 +543,56 @@ static const struct xe_rtp_entry lrc_was[] = {
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
> +	  XE_RTP_ACTIONS(SET(VF_PREEMPTION,
> +			     PREEMPTION_VERTEX_COUNT,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))

I think we want FIELD_SET here, otherwise we may not successfully clear
some of the pre-existing bits in the field.


Matt

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
