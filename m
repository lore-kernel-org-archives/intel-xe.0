Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3221C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 20:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9491710E1CF;
	Mon,  4 Dec 2023 20:15:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A1110E1CF
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 20:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701720899; x=1733256899;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2YqDUoyrWBTXOKeFXOLLcEIwoH2JVxD6ZGor7ukDZ/I=;
 b=E+pU7HxjO9mW3e16efIBGNJ+g42JoJ16j2+MC8ettcXGmYTqrgxMYY6e
 h+HZQSzZCKu2aj/a8N+TVnvvI7DC6na78VPoYS1Q6hC/SwPgd7SdQP5iM
 Fk578chs43LpZenAt8wo42/6Wg2dBEcOw7pqIoYmCcQw31E0HSpTXf0jj
 6ocmT+CJFxaGTbgR1AWbsro7eWm7PekIPZjO16EWB3d8AOWKQ261hUEEc
 TwejI0MiLcdbEcISXW89AcTkAk0o4mkca5CTrRb537Md5czoxCKAuMk/A
 6/06ZrNMBfzlA4JJbDXy1gQy3Xku0j+RiYU/5aa8Hzo31+MkEUi2Hvqhu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="638806"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="638806"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 12:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="944001443"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; d="scan'208";a="944001443"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 12:14:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 12:14:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 12:14:57 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 12:14:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+1q4J2ryXRhK3B7+gaFBfpOIskA0H/Ibjt5jZIlOiCOuMhxc8zbO2uBUQNFmYvtWZIp+dI5EdFwuPph/MEQRrpkC1lb6DN3UnEqL25z0xVuCIfc4hPdTGQEc58vghCyEmp+NMV1AGskuHmIZKQc/P1CebT2VlNgCVg0LhbBASetn6Xo15wVL6iaTS51vsrKgpwGjmbJAVkkabRZSXNcMzNQfArCiLJpJxB/HPEnb6K7UPz8xcQxT8oRpp37E2cwR/oqaVDMNE4qUi+tc5YAUFatf+iSBnuCWfDcs33+6duOtTiJUBOIHw0AXnVWW3n1Q0jLi1rIlnB85RbgvsNXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG9p6reJ575E1EoDW3UQKVwcp0if2zWDs56AwTrEiO4=;
 b=IRQYEYnV70H1XRabAUYFi9NM64+VCX66GrwLv7g1n9n9KAhwjCCsgsE1hzcHYxKJjx/pMAQTT73qv2gkPODXxW5k6DZYoHAlVFeFpoTvthTqHKrrUXzu0NKqr3fALuWBaNw6vCCuplHg8LusloIIh40ArKTy7E//LbLXDA0UvQVSR/Ys4XyWOatl2iuKnrOcOu2XcGNBUh3QQtlBYkHfXuEA0YDmu0A6bPu9uAxwXpa/CAMYaHjuN8yK2K2azCe9AFRuRsA/r9J/HAFkz2UPLyYOessdKZcFQvYTo9jXkDKL8M/RNQfmofKoPbNOXCmWzCvyVIPZ4TtlXyXQbHUVSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH0PR11MB5314.namprd11.prod.outlook.com (2603:10b6:610:bd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 20:14:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.034; Mon, 4 Dec 2023
 20:14:54 +0000
Date: Mon, 4 Dec 2023 12:14:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231204201451.GH1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231204054051.775719-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231204054051.775719-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:a03:100::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH0PR11MB5314:EE_
X-MS-Office365-Filtering-Correlation-Id: d9506877-b713-4a2a-b17f-08dbf505adb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TeOjwW+ZNX9wzRLai3n9FC6xXiWSdzgg/29coZkrumiYEWSD9n+WPhVVQXY3MF3JTLGGta7wM1YWpRKIF3pOwSgB2zWCTptPRQ4vItUgfLax03Jg54E0bVOPMYFIbgEABtWVrUxcpE8BYSqnr6Q7URCFMCOoX9vPEAas4obmmD2TaJeKGaieHOasCY1u/F9A6YNstmKli/ml3N41JWkHZTr9VClHqkmTD27ymjO1EcKSkWCbnld4gjMOFsRSvDNDuq4wYFEnSafkd12vndrcVgjU7zSkjmXGJv8GKmTQwsRP6ciqIVRI3CcPsqgU0Bp3lmkJXnshWf43NhANhYMee/BBx4GBiw5gsZ0hUtsLokJyseMVSRLf3sdgIOuOWiLAiJPxLeoghNyGCRVk3OrwQcTW+/zy6WQlgX9McvpYGD4/0jMtkKnxXA0jYIkpZf0VV7r2Ml0WPt1E5bCk4Xy+S2dw/wIca6w/B6juTZ5F8LMI7fZ8c8TSBkSmKvRXpUpJ6JztL5ct/xKQ5fu+ffYUIj7ouylh1nWreN40gUv070vp94I/Xd/eUUTqj7/1EeSP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66476007)(8936002)(86362001)(316002)(8676002)(4326008)(6636002)(6862004)(66556008)(66946007)(478600001)(6486002)(41300700001)(2906002)(5660300002)(33656002)(26005)(1076003)(6506007)(6512007)(82960400001)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AnLuzREASI4+gbv4RgZKC+Ebo1apper7qAEkjtJ71M47g6u/aadwm3Li/caQ?=
 =?us-ascii?Q?X2FPHJLR892aP9InRZ7/UKL+SR9ZHktVIwQtsUaVcl6eKU/dKvFnMTrzrRmU?=
 =?us-ascii?Q?CmPg4eIy0HdFSlHFfxhUr5VSHrBTkMQfE4oITtAkLsOi6ZApcCaueDDmNR02?=
 =?us-ascii?Q?rLoMI1qxnGGk3vUwL/omMduP42LKOQgusyl39GF65p69cbTYSJe3btfl7Of7?=
 =?us-ascii?Q?ExO+RqFdyR1aqKzgy8MoWedbDCWycZsICYAC0y9cbKAOSCyzZtZbFHJa6Yxo?=
 =?us-ascii?Q?co3s0nGG0Fhrbok0mce7YovofKIuRM+D4N4SKjc8LI6Ynsm10tGujCvh8cEu?=
 =?us-ascii?Q?KtPWHadiQ/vT6MtV+UmsfRbOPycIrB+Y0EGTKCdBPsGJsx8otA1XcUR8pCLd?=
 =?us-ascii?Q?CjyNCZik3mClGzGrqn1FkPbGGZslX6vDClTe6oWF2rUSEjTPk+luIAe8amiE?=
 =?us-ascii?Q?xLH5NmlGdN8XadyYgeEAqFlgKOwkbn3LXbpU/SVnqA7O3Xj6hAnTdl5lxrrv?=
 =?us-ascii?Q?dXt5GjZ3j1wOzKY5kI51nGf0R8UM4PRrcZU3K6Hd0zdjxWCpXZcj6D2gXNLF?=
 =?us-ascii?Q?JxsNrG+fSK7ZKCKrxmM+1QecIncOqnHXYTCtEsdBbFkxRKNRY76aVQbMGYYf?=
 =?us-ascii?Q?s5CMiT5N7SqrKDjjokepDrHr69YaNBDEsDz/xBcFFl4livimKycWGH2xPL+o?=
 =?us-ascii?Q?Io5hIVoUc4oTiUum1tu/KzToPiCavIUH80p4JMbyZzKp4xNXPKaLctoM9FTD?=
 =?us-ascii?Q?kYi/sGZDBbKcTerFeNyZFK3L3haduGp+VFWfb/qYRJ+sbTwJuwlqsk7aJdSW?=
 =?us-ascii?Q?yTNYZGQ/FrrabwJufGlF05QSDwRAaqsmBIq5eaVqVoIfqoUkEqLvk85qOJrm?=
 =?us-ascii?Q?uDvwDz7pNzk+RldiN7lmCbVXxMHxvEuzKs20BoC6aVg76rASDgqSRKkM66N0?=
 =?us-ascii?Q?nTHQjmNBWtlPWQr6NYujB5qM9iHzZnQTbVMb8LzGk2/tBFkS+BCapkAkuQJW?=
 =?us-ascii?Q?yFEXL2+WPoEaY0UoSWSUBBDSXO95qdVJ6ecODzJ2I9s9tkwxoYswrV1IakW1?=
 =?us-ascii?Q?LPKvom81s+YaZ+2gAUlwatXnTbXbw8XKe9gS8D9/1gyjVn1bDqO+/v684OYG?=
 =?us-ascii?Q?fuDotgDdGySJXm14hJz/zo8K7254kyrbQTi2e8VQwr9pcJib2bFUZt+axvOG?=
 =?us-ascii?Q?HUdwYPHX1cEP3jZMHNBL1734afqMOVLsNCDNeOLWXMS2DccgOVLz7vwqfH/c?=
 =?us-ascii?Q?VPfnuSKmqosllK306zsxOttgrFJYFAU2qzP+i5AkJucKTvrsVyrwsOVBngU9?=
 =?us-ascii?Q?KCTw1x2y0zp+8XqAmBuZ6AfKWHQWZgEyKDb/m+RuLfKckwLOZJSbvbcVFfyA?=
 =?us-ascii?Q?v/hE3gRvtKjE8ggxnplNjLaKt2T06aF7PYCXppo53GOFcZb7xhAzeg/Leos+?=
 =?us-ascii?Q?YjAyC8WtrLcinMZol3py0+v489n1XDEK9qQWqU8BKa/FQroB4TNIg4aOlt1c?=
 =?us-ascii?Q?RwAOoeHeV1xEowULaUi8JQMkuD40M76OQLKQCy0on69oTwDywmsj8uFAxuWL?=
 =?us-ascii?Q?rEvNUNjogUF+al+kPekm6+YGmD+p6c+8XoBd7QPYbd873jOo3Do0eafBxtmw?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9506877-b713-4a2a-b17f-08dbf505adb9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 20:14:54.3566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9M6UJzX6c6zX3QJnhuiQmJw+Co9ACJNobMMCUJTQL7jlZuN86ypDkTINxYd5JQqNRkk7Bq+4uuqVY07JGjAHx2n/QD1HSL0CoDJxQn1sXHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5314
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 14019988906
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

On Mon, Dec 04, 2023 at 11:10:51AM +0530, Tejas Upadhyay wrote:
> This workaround applies to Graphics 20.04 as engine
> workaround
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d318ec0efd7d..91c09ce04861 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -125,6 +125,7 @@
>  
>  #define XEHP_PSS_CHICKEN			XE_REG_MCR(0x7044, XE_REG_OPTION_MASKED)
>  #define   FD_END_COLLECT			REG_BIT(5)
> +#define   FLSH_IGNORES_PSD			REG_BIT(10)

Minor nitpick:  we usually put the higher bit numbers first in these
register definitions; we should probably do the same here for
consistency.

>  
>  #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 63bd4bb1af03..a23efede5fc5 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -719,6 +719,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>  	},
> +	{ XE_RTP_NAME("14019988906"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),

Since this register is specifically part of the RCS engine's context
image, we want ENGINE_CLASS(RENDER) rather than
FUNC(xe_rtp_match_first_render_or_compute).


Matt

> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> +	},
>  
>  	{}
>  };
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
