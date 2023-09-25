Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E2ACE7AB4
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 18:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E91D10E2DF;
	Mon, 25 Sep 2023 18:01:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF5010E2D0
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 18:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695664902; x=1727200902;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wp6aDwv6152XJn189diVpjyOPOt4G4yaJlHJElHURdo=;
 b=LEi8aVLi935IRbO+lb3FzLPOY6mLAzh/KeIlkPH+FQT3CwC3GBCrzkcW
 OKVpr8AmPLss1S6rKF1Y8EBhq0jmGs+ZlpSEABy9b2/YEaJLAbOqraevV
 8R7mtD9C0DKMgl9KsJUe6LlEaYrEeiNKUzR7xzHCyei1EaeJocEpuNFLw
 457E7Yqw+0yWMbeO8heLpvAa0ba8T5pHWAdZ83kOP8cGa0TQF63sUmrPN
 nJdoaZE76zQCsRnQNwAzG1HyXN+qgL1fu501J1jWRdCIHzFh42+kJB33y
 zYzIQEpAr4Oz/V/lThn27x2jeh+ERdlFYJ7kPHT5rPf8SJkcz8tF5BIXS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371644871"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="371644871"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 11:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995490518"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="995490518"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 11:01:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 11:01:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 11:01:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 11:01:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 11:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbkEQvnHPpP6Tg84fGjopCxh43bnr0iaLFR0CQGLHGn5VSo+q4U8vtQ99WLhDLnHmcNHqBagQ2YbhKv8bUBhdPDdvCjv98CbCAxcA7Rl5NDUBw10fqWVZmlQ6T9VL+Kq5QeKSTQAARmzz0qsahYYxhS2EMD/vlymUPveF77QCdC/rOZGLAWH4rwEdgF+6k7ai6UgM7Vmt38W0qDGkFkNaONGF9LAGf5ji2Z78eJTDcmxYfwl2q/FqYOYf2+1HtHjtN43B0Py+8r9oo5cXQuTK1Zd3jSKvj4M8dELzn0SsgBGzak9NMZB7f0gJ3yMNJFqC0FOMQalIzffE+zt9D6WkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2ht3SIx0A6+oZlUVnLPTt22cs61VNpDkBWY+y7jmuQ=;
 b=bpZ+ng9XJZlXZujaoy6gKoPcHBrVTVhjnhbrUU+z+LqCBYrz0U0ilZqV0LPeSXKX4ZZv6EjGMwj5AXLhcpR19puCUXhLAXGXg9X8F0r9Dzctz4/K/RTyzJIPxoSBIrZR/i8SYhyuKHN3GXd/IpiMDr5d3yLVT+V2kUDQVXO27GtdswGxOl4Ew9ML7R8aA07f3G7ROOMu2YWeVWF92sKEalRJrkilJiTN53uSiQOQYS2enEhkgTGajwfmPevEzgeJE1E7gnzxfIJSwNWNjFTGUpWwHnXccreqsMzASRH+1Epmt0R13drFXpgiXh022KmZ+zwxqbeHkvlhv9Oakb/CpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Mon, 25 Sep 2023 18:01:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 18:01:29 +0000
Date: Mon, 25 Sep 2023 11:01:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20230925180125.GQ233750@mdroper-desk1.amr.corp.intel.com>
References: <20230925160543.915217-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925160543.915217-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 87641872-b176-4205-a2d9-08dbbdf1714a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tp3oL4BdHoj4p7VJ7/vfseTFn3rl+oihU11DJpZy72mV1Jsax6yMDsrJVm55pJ2MbWVoPdPwA5eFG0MQirXFXVRewcLK/aZ+OK+d+lOLAnwXI9MMS4SkU4h+6Ivo2ufZv5Pu1TbModT1T7MNPqN6eh46wcNZvlrekJFzly+TW2ZFOpTV0z4f6bnQhQrPGk5sc5YR/HZheWKgOMXjL02Mqb5VxX66WMQ+MSXLpANfJkJdaa5WgSXOo6Mx6pYDCWILYmas4lWRXYD0PDVC3LeziBvJzovL42Iu7KSNEXJxh42xH2Fc71rVsNmFBj2pCEeUk7YzB//Ejpsjn/DVezseUs0DkDGfl624CIgHbuqZJ6IVXIfp0z/SpcybSkJ7prGbQSHFAvuHNuZPqJUW2B/EsNVzpPr2crvuEEmwCqFwxTpGlCXTiR4LFn2YhycQDlLto1ASGCq5FLMn7IC5WPOOV+5A9mGGljcjiQ2TJJti1CRPOvGvzU8z0Wim9P8Ackjbba0HA9olpcfoOEBsN2q6zSxIucWrVrPahG8khsFKg2+pDFKj2v3W8bZ9qV/Pdtiz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(6666004)(26005)(82960400001)(107886003)(33656002)(1076003)(66556008)(66476007)(86362001)(66946007)(6486002)(478600001)(38100700002)(83380400001)(2906002)(5660300002)(8936002)(8676002)(6862004)(4326008)(316002)(6636002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2IvYQjRvaAMkh7YSaNGJ0dCYIpult7C/OT9s7ocY2+j7maakUqMAfhnHJ8cQ?=
 =?us-ascii?Q?H4j9NbsYcFOaCJbkyeG475PfSSeW52i8udz+qHmfao6fLTvBexEt0Ax6O/as?=
 =?us-ascii?Q?NS3CqbKEmMxRhkm3HLeJXTicaqe83gqtDfz6cM25Lf31uLB7ktzYxUpFgcyc?=
 =?us-ascii?Q?CG6a+xuNaqJwNLtlxYLDpGBY0AZ7Dy2PDVGqxz5KQh2n2Aw6gSlGyXTJuDOQ?=
 =?us-ascii?Q?1lSVpiepNkl3RhKNYmtJcn6UNF/NWRSBWjjizVghp8wN1nY46qvq7LosopCI?=
 =?us-ascii?Q?CMye/LJo3NDjOm2H99xyB6oR5LczDDuHyZ6IY8Wb3rFMYNtAOiNcplQj4ejF?=
 =?us-ascii?Q?Qr0ZBugGTgYxs2p2V8yaXUMylm5lZfHScp+kzYtA4Det5rAo4+Ds3lDoMNhv?=
 =?us-ascii?Q?RO7GrKEpRIRYsso3q81a7Fg4Vr2SXSbQ8EbIv2Rl+GF7XqKLbDNvqPrDI0hB?=
 =?us-ascii?Q?YW3n7g689MnMg/bvauNJvr4jo8A7L4+AKMrzo1h/vVmSGCKeHYSFs35hsfnL?=
 =?us-ascii?Q?vWH+1oNE+bGUJM5h69fp3b96pa0951Ec7WrI9Q0KK1dYEicxiNNpWeiZQlUG?=
 =?us-ascii?Q?dCOEf6hkc1QotmC5B9a3qPB0RWlp18D/Mh39tmFlsk7QlUlZkMUDEjk4mLVZ?=
 =?us-ascii?Q?5H+cAQtiXVDENWpj2dt+v0Mwnyy2DShJuJTNHWyWyGgC9NhW6eZrf3F2cQve?=
 =?us-ascii?Q?YUBjZNVznuvMzJ482o+ir+1l71BBgSf/98WLNsOywUdxUK9u7cgHP9J9em4X?=
 =?us-ascii?Q?r4KtxqpLKuwjSHW5lhjnTwJ3wsAbLCiaAp4GVBBXakjMO0B6yIKw9avoUbr1?=
 =?us-ascii?Q?xhi7/BKb4pXXKcx2dg9bUzUiwjSJypA5bumLBHMxoeqZ1+uZj+0pAwr8bGsr?=
 =?us-ascii?Q?lRdC1RWyDokPzU3Vks21/zCgMq7EMMrAZ6zAVwKJo8GOnMmddSTqh2c/np8J?=
 =?us-ascii?Q?9OvlP/GWOTy8oATxBy7JwXra1p53vr3Ci9PvwyZwbNB9He2XqV3rTfQq2/N9?=
 =?us-ascii?Q?7ySSl6Af7e9KxgkaJmmNhoQQWSiPXL199fFomfkDUB5XP3xKL7gmFDiCK7cb?=
 =?us-ascii?Q?wQCu3jy6X7IKpNE4eXr6HA99pcPYE8gN95dA+HOKx/0fouyrD4AMWCNeYbRu?=
 =?us-ascii?Q?6JVA/dB8acvuoC7esKwdS5R0FoQIYPDQkp211ravGucN6N3Yu9TWhvznqVp+?=
 =?us-ascii?Q?FVteA336i7drGb5Ncd7aBt1MLZvb2epKaKuNhdPsN6CcrWT489MmrYNI1T7R?=
 =?us-ascii?Q?aYHdffcdmqEx7x78p/Wl67B5WaIFfYs43r3X4+BfEdJWuO5ZDO1KMdZwqX0I?=
 =?us-ascii?Q?1OSTvyDKnoh/sCkrbZ5MdL3N7c02OiY2sQBUO9Uq2FZUnyIYk1/Z4rxOuLjI?=
 =?us-ascii?Q?iDm8mclG05j2d/H899KklXVjnp2tfi7wSWstEOh825NY1imdQ3X2xcWhS+X+?=
 =?us-ascii?Q?/9Xa5JxG3QftQpPkPB/89JIcyunYttO3ySPds5RCvl1PID5au7lUoYo/Q8+D?=
 =?us-ascii?Q?JMJkMmwLeMCMJLuDt44AZ05/7Elgv2L9eOP+q9zC+c0Ui2jNp1Ugi6FOMjjk?=
 =?us-ascii?Q?jz8xJy2fR1cCwl+gv1Sppa7gi5znMWr95CZRV07N1ujfMixKm8C3YYAm6itA?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87641872-b176-4205-a2d9-08dbbdf1714a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 18:01:28.9917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3L/SruRezZGYqUwvFeefS8TnKDQz4ardgmu+08BQ/CyU7RoSEO5JV406NvhZP33XTe9sX4t1WzwELMFo3sc3oBUQitApOv69e3OJWdVVNwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Wa_18028616096
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

On Mon, Sep 25, 2023 at 09:35:43PM +0530, Shekhar Chauhan wrote:
> Drop UGM per set fragment threshold to 3
> 
> BSpec: 54833
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index e13fbbdf6929..3a4c9bcf793f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -347,6 +347,7 @@
>  #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
>  
>  #define LSC_CHICKEN_BIT_0_UDW			XE_REG_MCR(0xe7c8 + 4)
> +#define   UGM_FRAGMENT_THRESHOLD_TO_3		REG_BIT(58 - 32)
>  #define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
>  #define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
>  #define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index d84e67a9af07..1450af6cab34 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -374,6 +374,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2,
>  			     PERF_FIX_BALANCING_CFE_DISABLE))
>  	},
> +	{ XE_RTP_NAME("18028616096"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3))
> +	},
> +	{ XE_RTP_NAME("18028616096"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G12),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3))
> +	},
>  	{ XE_RTP_NAME("16011620976, 22015475538"),
>  	  XE_RTP_RULES(PLATFORM(DG2),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
