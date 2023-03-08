Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBBBC678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 23:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC0110E759;
	Wed,  8 Mar 2023 23:11:27 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAB110E759
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 23:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678317086; x=1709853086;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nsXyOxvfQFIW4aRThCvi+mZ9i5Ib46xZ6w/FzOSenz8=;
 b=IFwHzeqL1QzYAh5yKdyaE6tiGOzCkROpNowpHcqWnIB1WjME6hO7N++c
 lbN5EDFuvwji6bXpxW0LyI3Zqn64au7FTJJnJM2VeafbYysDLD8JKc42o
 x/oOP4MMeuCVvVgHZhEgUqHiiacNOXA/nb3mq3JvNbO4J843XrS+zZDYO
 fEthJ7XSeYM29wnHqgHA48P8Q4RvHyO+megcavX0fJT7yuztiapa8x7aY
 iqCyEAbVpa/lLhsDiEREBGhU6yTB4aWs53qXBvDGLA8nG0FiKqPvkEMVk
 QcPHT6OsQA6Y5z1oUBw7O7gF4C3c2izalJ2GpRpfFesGYfUE0tbwOgROK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320127746"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="320127746"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 15:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="800943863"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="800943863"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 08 Mar 2023 15:11:21 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 15:11:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 15:11:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 15:11:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 15:11:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxI4H+1HYfKhRYXpA5IOdK5XE/d/gts+8l6ZU/FjBghmVC0/sM2ZjsnSSwK6KGXUutKj2GrCaHuEZxxY0v1tAA+vXt+V1Y02zFqZUNBWs3T7OFX4UQRtJrFr0ZkpzAxFxUFK5UcZuB2Qe7NxMHDkx2IIY0tnJcLZmxvybuirZ4+rJgCdCJ/If2vY1VWWZYn0HBblZmURC3yH9RHzBZw6KBbwJeU885V9m9jXBsfh7WM2PnHduEd4d6omN4K/RT9WDunfAxtsPL6A24wPcO7uXSvRA9aFwSiTjfWcZbXHtwI564jM6UgK+FUBDLIVMbCU7rzJ97/ry87pkSJQ4hXedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/a0Qa70w3qwI384zQg422vdKcRhFpgeOjarawbKxvw=;
 b=lRx08IaVKnVHW1C1rDOmXAlKhYpH+IBhgtd2hPhc4njSYogwk2KouEWa8JZUdZk/GZYXe5quy6gKCQbXC0bcMNe3Wu2SRd7R0TLINsZtuxdScXDSdyTi4hXNyiMYI4sgRzeifxB1ymAhNqMc42CJd/uO0l3ecTOn/8Exx6aRvX3kisnRPdbj3DtwxBro+rxtjke35/IazarFKFSJQCByPvytLV1mo5FGlcAQ43P6tv1D1fTwUJ0oFNkP5S+54vule/UIs9BNitEIlpOqOerlG4dir9emfHj9HMtg4aa7eKxSLO4zRVOwDJRWb81FR88OQf6EXxvUHoQFfogSIg3+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5282.namprd11.prod.outlook.com (2603:10b6:610:bd::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29; Wed, 8 Mar 2023 23:11:19 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 23:11:18 +0000
Date: Wed, 8 Mar 2023 15:11:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308231115.GK1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-15-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-15-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd9696d-fbde-409a-57bb-08db202a6c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLE6cfZcuYmeXoTKPVqNkMjTmfpbtTDyF/7S0t3Z2H5/TU7tY85sg8GQdjqrD9+JNzreyFRdntWluj+91hn3Y2Ewhg89OsXsAiUkywxJUCDp2Uvj+Ez+etoOjVq7JtwvcMV2UCvp5Zn2puZ4CH30OeC+gfwPZnPKmShGaNIEEseLvS7ePer+mXkXThCvyZ2jFFAdb2UCgtgZ7oLdUT6wZVAZ2dofao3FiLM1GlcaoHVznKYqPgOnDAzxZpZoCqolEqm/2IkU0O3wDmSVg3mI9v9RmLsiAeykhJYgxA+e8zmqIUVArjWEvc/GxM1yzUSCPenKKEHMZYeITmpICCoynJbfejzfLiy5nqasRcLF9Db3KG0GIkX6gS04x7MW2tfFJrLCV4mEtYy+sFo5U+94zTGFFUnED75nwro5WJ0D5xC7F4aijbsWNtb73AU+HgbCWEXCeMYCy1VWesRdmVuzkBKNQ509fyGDbtZtWvlhUOI76G5yIxEUeBkO3CjaKJT81pMtyZknh/d0KKFEVVElbu3jtJujYISxGni/p84+OGwaxAdLpU20KS78DkhaJFfwl5NVtNuWvMsGewuoxXARHzPqzr2QSd9jaGsVekhI5WWYH1q44zNfx1K6/XHk7G4vn825LfmenfwUPF7r+dUzqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199018)(478600001)(6636002)(316002)(82960400001)(2906002)(6506007)(6666004)(38100700002)(186003)(83380400001)(26005)(6512007)(1076003)(6486002)(33656002)(4326008)(8676002)(6862004)(86362001)(8936002)(41300700001)(5660300002)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wsx/ubnwbR6ajJ9SscUgJycXie1EmfbsEZ9O4G4LV0EWKdtwBMV/10JrtE6z?=
 =?us-ascii?Q?pAk/HEqonZj6B/lVY7/cR2SM2VF77W4nih2fhk4I4fR/xGTEb5GRSRcFDg7r?=
 =?us-ascii?Q?XdBVcx5HgjFQyyh7OzyvvQ3wOrT2RKazrJF4q6Ea+UZTOhfswTeTdX1Hmanv?=
 =?us-ascii?Q?nxhZ1o0FGR62Gl18iCWAzUD/9il7uPBIrEtDpfUBQaRimh6MQ4pAMDty2eoz?=
 =?us-ascii?Q?GXPyUGfqNSBVrvVSRgOY+1FdkrwlOU4XV3hl077ysBMZ4B81kUj9tzQglrOt?=
 =?us-ascii?Q?XsRPjSGjB0WZqeytpN2+ZiYPGj2O02irIMAPPqfP8eQScyvcz+0O+CIFeuS7?=
 =?us-ascii?Q?Adafe4WvDpDxdopCiXo+CB/BzyelH0uL1Jq+aDxX0OEqg+h9EYQcIZHjCrfz?=
 =?us-ascii?Q?fYZH6AcRcee39D3uDiRvSgszIIE0bVAEd6TgPWQCQUk/O9SyXoewXNi+th74?=
 =?us-ascii?Q?BKaru6O5fb8DNkz579t9awnSvDnTJPbNMiJvQYHaDlc6y05SCiufr6XL3Wy6?=
 =?us-ascii?Q?26Wlojttj0vMJ/o195u0FfhKOI+9j/uRVNP6XOg53hr0SF/IGRC2SiG4knGW?=
 =?us-ascii?Q?SLl4KPqvxVTy2Ywbs70XAX6KEwxu6MzHcZvmst3bP2vG4pu/K8CZZaDeyr3A?=
 =?us-ascii?Q?SqbgKfYc0EmojXkUbvu1wHwbFmuximT5o22QupD5MvZ9WQ0pbYNPxfOXjcWi?=
 =?us-ascii?Q?XKm/aA3+4WrQsOUIjfugIWKy1hHMpjRaHbSACfFeWwxNuPvLN6fV6GZVuGAZ?=
 =?us-ascii?Q?OA57Kofc5HeP4bFCz5gmlp3UfaRpSXfefdJTwFAhVi0DEOdruD2nCn1Db84u?=
 =?us-ascii?Q?NpPZ7/9zVhwjRAUMh48BiFChPe27KYhRQJVg9+py8voI7pXYxcsY+/Y4tGaB?=
 =?us-ascii?Q?v3Zv8aMtid59aOkJ5ivbmIQNdNgfT/if/j1pm6I7NMG9mx3oLUa/fFI3e8/h?=
 =?us-ascii?Q?aiQTXbcZvlUZSpiZeZnl/iRwnnIzi4BRRD7Hhd4uJJFwz5VKPDi5V4ZLbPD0?=
 =?us-ascii?Q?sV2afE4v8tTWaFOImarTo38UhavMYHWvGq5W3DDrYfK32/Lrk7F25TN5EM2c?=
 =?us-ascii?Q?xY2nLvmOvfIuMGzOlUAnkJrsPpFnqE091wNn/uX6ti0Ytin1nsRi2N/6K3RO?=
 =?us-ascii?Q?qSzkH7EG+tCI5e17XuM8epjXHp8YOOtd4f/SF8IeQRLP2arQohPX9WDkAJfI?=
 =?us-ascii?Q?azGO3zU3EymD+ppIwg6Wuyru5Hdj5OvNsmKSkDnuNoIuUF8dXn09tqpzKWsw?=
 =?us-ascii?Q?r7yQoVn6CAPK/WlKQp2nNlqZS8cDhTLXU3WQR6UNTOCn/wzEX71Eg0wbfZIF?=
 =?us-ascii?Q?XPx4BYQ79/wyh2MI7g3KmxTllh5UBVnZxrGzoKtvq8nHUsTtSMF1vy8nMMIn?=
 =?us-ascii?Q?Ql/vZiV2Vi8KPIDY8mf/obZqmj4hKWQnnEQVPJUPGuaQWGOg6tm9yZDvWHd+?=
 =?us-ascii?Q?vPanVFUmBBynDuOtP5jQa/+/1aHj+IQYFdCJXpjhO6WmtINR+7HpatLTCx3U?=
 =?us-ascii?Q?HXQZPrG7hjQNZZXy2E3WZDukWCNWv4ilJS6xREmS5nnKdzpqmA7iq82qwV2p?=
 =?us-ascii?Q?3CAH4drafXnIKTgXGLhj7f2nzQYZMZ/OAJYQ6ffoiLBuW4hKmb/7HlrgReqt?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd9696d-fbde-409a-57bb-08db202a6c66
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 23:11:18.5544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpWjVwhVvpJdBV3owVft4m9VnP3dwyn8Qzdszexvx8hOlOVawkoGQeI4ZW2EIOavzdN7w8RRx9BKgk8H6UVj+pwcEpMD3gDQljF73VXOsoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5282
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 14/19] drm/xe: Add PVC gt workarounds
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

On Tue, Mar 07, 2023 at 01:24:41AM -0800, Lucas De Marchi wrote:
> Synchronize with i915 the PVC gt workarounds as of committ
> commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w
> access order").
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 18 ++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 70457c0ff4a6..1b39a209898b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -216,6 +216,15 @@
>  #define FORCEWAKE_MEDIA_VDBOX_GEN11(n)		_MMIO(0xa540 + (n) * 4)
>  #define FORCEWAKE_MEDIA_VEBOX_GEN11(n)		_MMIO(0xa560 + (n) * 4)
>  
> +#define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
> +#define   XEHPC_OVRLSCCC			REG_BIT(0)
> +
> +#define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
> +#define COMP_MOD_CTRL				MCR_REG(0xcf30)
> +#define XEHP_VDBX_MOD_CTRL			MCR_REG(0xcf34)
> +#define XEHP_VEBX_MOD_CTRL			MCR_REG(0xcf38)
> +#define   FORCE_MISS_FTLB			REG_BIT(3)
> +
>  #define GEN10_SAMPLER_MODE			MCR_REG(0xe18c)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 155cabe16e2e..6498f187591d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -180,6 +180,24 @@ static const struct xe_rtp_entry gt_was[] = {
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
>  	},
> +
> +	/* PVC */
> +
> +	{ XE_RTP_NAME("14015795083"),
> +	  XE_RTP_RULES(PLATFORM(PVC)),
> +	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
> +	},
> +	{ XE_RTP_NAME("18018781329"),
> +	  XE_RTP_RULES(PLATFORM(PVC)),
> +	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
> +			 SET(COMP_MOD_CTRL, FORCE_MISS_FTLB),
> +			 SET(XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB),
> +			 SET(XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB))
> +	},
> +	{ XE_RTP_NAME("16016694945"),
> +	  XE_RTP_RULES(PLATFORM(PVC)),
> +	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC))

I think we need XE_RTP_ACTION_FLAG(MASKED_REG) on this one.


Matt

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
