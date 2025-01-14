Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21130E77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 21:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAE110E084;
	Tue, 14 Jan 2025 21:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huV5WeGp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F410A10E084
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 21:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736890201; x=1768426201;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RytuiPcH8rMUiteM0JImVhJ7hZMucefckOTBcQi6JuE=;
 b=huV5WeGpRM14+q3xKTND5TSums2z445XphuyWF72L0Rj+/ZA6+4haU+w
 8Eiz8VJuUkokRHc+VhY/NFNSNEZNfNKYRlPsxfMo/CdPt4Hne3d5Xx2od
 KdxCtlzdU8IPttpTDMzyv50rTxdIxeAeR0KAksvNofi27w3MoXhmyefgu
 vUrXZexNzomz52SS5trysSwbegax235IBiKVYJSKkAPODWMUtsaG+y/w5
 YfPAUuYM1H/vq4Rn7XskfwSJR0bhjTShOWqctXSZk45tTZDqc3UvI8r0C
 4Th2gJbgWrRglfrgNo2S0Rc4AziT/WBpnJj6YYC5Z+uTvFDdLKDyUBMw2 g==;
X-CSE-ConnectionGUID: IJ4ImF6aS86GjXET1xmGnw==
X-CSE-MsgGUID: ceVgWjwqQviQATd29BXinw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47788760"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="47788760"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 13:30:00 -0800
X-CSE-ConnectionGUID: 6kTi/5r8RLyhMlkcUA1rzA==
X-CSE-MsgGUID: WcVfVoxERnmjJBbnYsfKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105795081"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 13:30:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 13:29:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 13:29:59 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 13:29:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9PsaQvAOdDY8QkIS6T1OZ7W086k77Ppo91v4z/9RPPQWwFDanJ3jBgQVIxJjl0NAjkNGgR9X8kfIab8st4IRFc4+ywMz6BzSnidqpWypNnft670rEMUpt9G0saoPgd52erQfLrBDSKv4qXIKvGkrjms96w7oOrUSwRyu4wqPk6tWRfprAosHeAPdw6IlMUcFlOvrAsAt4PSBeM0/u3TsKaWcXSsGuUvIYotzfktO8+p9A3ROVrZ344XFSxxTrx1JL0La308YtdFN/xrYNzJo5nZYSW5jPnPfptMsTsBV7VGbQrFe8N4kk5G9ZcMer22pLn7ksMYS+HSXalnu0Xn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzQTikYsGYTv4gKQ5IYE8lQnRETjZqML1bs2cdv/i60=;
 b=mV6k4VEIWjbr3vYqhpN55Qcmz02CY/un7CbwKvPf/HCTq1zVbUhpapiKDxfCc61N3Jc5bz+erdLIJEkGXqAHrZ6k74cZPy1bERoOazqUFU0zrtPjBR/hynhc+SxaP0TnoeL6AbU8ZCso9trPpv9DgQSOV5tVHh+UImINRe1xoxaF9Q5zDKfadCQEJ0e2RzVT5k3oVa7jKTmODYqbWqSAvGYkwNuJhyJvve04dUhoERZT9/EGI/cZj5zWX1DY01dEmUNJe3KGo7GtZDwhNPpSvNdoxW5OWrkCAmqXiuZ3fk2glB91gWqDRwwrmbzwE1mrcjW7DjiJ1dg+GBZQrGqmbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL3PR11MB6412.namprd11.prod.outlook.com (2603:10b6:208:3bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Tue, 14 Jan
 2025 21:29:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 21:29:57 +0000
Date: Tue, 14 Jan 2025 13:29:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Generate and store the L3 bank mask
Message-ID: <20250114212954.GC5109@mdroper-desk1.amr.corp.intel.com>
References: <20250114203853.35055-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250114203853.35055-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL3PR11MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8c93f2-17c4-49d5-fe69-08dd34e297b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9wnSDM5WYZbiontm7Nb847IMY9Vc80/XPYjnLhOaPyQGdtHNUsiEzeiUTETQ?=
 =?us-ascii?Q?9neUM686QqgujF1esFHeiGoDwB7HsBuTQEZey3ijLS+Z/ctCQmudZaiKhVwe?=
 =?us-ascii?Q?kHuNKt318CP4YcIKWDRQwlbR1J0OgJuB6PCmghlGFITrUnSn8Bvlb/suXGOq?=
 =?us-ascii?Q?acEsql4NmMlZeDfiC0z4W2fBBbv9kOE+dpAZvF+MAVSClfNHRz/ZdWmmqX32?=
 =?us-ascii?Q?oFP8nXWCJ0swrvO9GbMgEZvebui0/VD8bh2v8ltPqAy9KaksbaN4u4x/7F2c?=
 =?us-ascii?Q?4N93/cM3uXui+ZMwXC0o8tCJhU+BZefFFtx1PnUrB+9Xih8aUVmau1TAHwTd?=
 =?us-ascii?Q?caItfqxO+efa5ORloXgW7lWqDCCwbwT+AGYoiNwm22Np00X4RfE7zVqOPH4Z?=
 =?us-ascii?Q?Eqr0UKbGoFPqDNf9oaaOzY/y0orf50qTy0uXJKxIbr8oWHUx8U56JZZGI2oL?=
 =?us-ascii?Q?vu3mJgLGYSXnhxgd8M6/ioa6iQkvt6K8lmlJBzRyGSJWCIhzYKoR9+VUMIhJ?=
 =?us-ascii?Q?TEHLVkNLg1vvWHwnlBBLC4wgJy1omjr2H8Er3Q+0mbetxMPbcOfJiq3gzRN7?=
 =?us-ascii?Q?sAuBHAcw2f/YoMzQA/ubyy6ygHrgSqUg/tHVcePJBgvAK/r10+QwNv8Gg8Ra?=
 =?us-ascii?Q?rzejTadVndjkWc+TEirY1AmvzKN0veWTlFLkbDgXqi3Zf+B6WOWi5pHz9qAX?=
 =?us-ascii?Q?lViv9hPoTKnm+511KzmCIj4ZFgQ0WPbD/WEv8pw7u9FZ/bEruIW+GlB3bMfG?=
 =?us-ascii?Q?TIKDoJrAFbl/6Z7iNSTJiw14FDvEhShE0O3IvjV3Q+GQlvtahFeaeyUjlwKR?=
 =?us-ascii?Q?jpKlAHDDFwnF+9rtSRhaKIX9AA4dIyt+bh9m1bXB6c21vtDyhyCfS566EhFv?=
 =?us-ascii?Q?SS/bT5xermnDocBmcj5sgWkLYBayDba9f37wyO/wQSj+7z6X8QyNtFM7OtCB?=
 =?us-ascii?Q?DGICsL2MsQa0Gp86A5Cd9mvH587qIzJrsO8yIGers5sY0FnmXnLNiOEI3kFk?=
 =?us-ascii?Q?JXc80C5cvX8K6UvWWWv4dTxAGNW6mMhlsOCBzXb7WToHzHHqfej3U9UW4G+f?=
 =?us-ascii?Q?hbWjgC9r2GNAacPpQOhtFTxMlhXCVsLkqAnL4DrXssrlZDV76CJ6w78CdnrW?=
 =?us-ascii?Q?yxHyx/0HhtDcmure5DaBPXIl0uDw9AjcghqlXADcT5pIDt9jLF55BnWNMasR?=
 =?us-ascii?Q?ztm8eeEL6iRw4WVyahcJvCcrJw3p7PMruXTF6YQGIYiuhsZV2RxGYb/0W9OZ?=
 =?us-ascii?Q?TkWfmooucsDpDkNgTjPS8MelxeiB22xmnI4uih6StWo+b9UXLIA1FbhnddZ+?=
 =?us-ascii?Q?XVNF6wWaNoj/j+EZL3hM2rT2FMH6q8pF0igJUlYKv6Eewf3jLBlBtNZKMj5o?=
 =?us-ascii?Q?ynW0t/hsLmY3nH0tN4J6RucGuR8o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?45Yde8tKLAlnJM3HJv8zyAMGjeQC08uhjzkWRlh1LBEOI7ljm2rfZYPzowXt?=
 =?us-ascii?Q?9eQaU7j0KgFgT7sTIoU/UuPP8no3NPMmjpNpqYjG9pbTUisAeIEvZyz57j+v?=
 =?us-ascii?Q?M/4fJNVWculSmMQrUX3o1nFHH+10CPVS2hdt9ednSOz6YHVTFh1EEX/ymDRk?=
 =?us-ascii?Q?tL7VGDkzaEjrMCyr/ywbZB+T71wr7DM1HtpornjTl7nkLzSY45/HMEOPzgd1?=
 =?us-ascii?Q?glur8pQcX1kBYsxowtNSo1xKMOUSBYnauhkJXKICQcL1P1C5fAl7ifynWArs?=
 =?us-ascii?Q?0qazK5kh9BRi5czH8ClSCXlr0aigwax84JUZTWJ1gpMqd+7DHdRZ8lpNwMYA?=
 =?us-ascii?Q?2IMHdFdWuoYGAhKBCgDWF8iG3mxi76nhhO3avRaWTB68N/GMtGZ78hib9c9B?=
 =?us-ascii?Q?90tcdhn3uyghcaT0/ZrBl1oEhd8f/aqjI47tlbqCyGspZ221kYiN025wxhWh?=
 =?us-ascii?Q?U4p4gn0cQ9Doe/GltJpI4txS4k+RHPxhyaKT/HOnpCAP5qKUc0SzvBpJnA9o?=
 =?us-ascii?Q?aUAoTaXeeJd++wpq9Mzk50UjLKSkpmdSSH2FyufcFSd+NaF85WDycSNBF7vu?=
 =?us-ascii?Q?IAG0vk6yG5DyvdovQhi7XtRD2nVowH4Wdo7yObio8tarKmgReWNtTKKkWxha?=
 =?us-ascii?Q?gVl6oumd8KYv44yaeeVVNipqLoQdB8g0chv4Kw1XBWnQXaSqBvhI+Pjmlr79?=
 =?us-ascii?Q?iF+H1JENUBh+if/BcskFOAxKvXqii6+sapkpDpBlkpfg3jwRc73Y0A8BsF0I?=
 =?us-ascii?Q?4qy1Ytd1bbK4KmPqZoNC/pUd8RSFLnDK9FluNdafyMOOLrOp/Rs8qb4p9WmZ?=
 =?us-ascii?Q?uIt6vpvFMLl63MbrnmZQTwOVFXFWtRypMhEKDGl1OyiBFaEKyPrIBmMcDi4p?=
 =?us-ascii?Q?z5+8G3HwRj3dFxHSoYeim+WLToeg43g+4zT7Ux3t2fnoVb7W7GIfubQZ1/Iq?=
 =?us-ascii?Q?zw2Q2dGZFHVgcsrhxmwmJyAGdbe1j5gJFW3m1BhJP/3Ti0Jj9nchBzLftaEP?=
 =?us-ascii?Q?3w5pzKOwhs4iyQhqdntcLoVe6krN4nGOMhyyb8/l8jMfHsoLocgJ0C+cXEk1?=
 =?us-ascii?Q?2+YtFOZcYtRlkfrZU/ApLyqapzH3S9DuSDxvSAUMRLFpaVC3+6W7VMWVIqGg?=
 =?us-ascii?Q?XVLhNXKCZFa1O7TDt+qM0VC9+qMWG8a6SecAk+jdu/SlGf7KFYs1ksaN1AJf?=
 =?us-ascii?Q?qfc5yPohUZ4rYh9496LQU8zG7dCiYaP6kF5CHMB328tuaBw2qEbEEAo0pRhr?=
 =?us-ascii?Q?hrmnfqXSC9U9T4gpUeoyu10wIG3fvA69rV+HV/AsCjuBau3L4SH/NDhg3W4r?=
 =?us-ascii?Q?vjhOLY8y77puKsh7B5aOQgvZ428lSMHNFBO7UCabZNQkOdytTk18AFGMjIrd?=
 =?us-ascii?Q?MoPkFkldplfj+xNP/r0aiPv7dJR5MQSHYqN4Uh1lyushnmJLdf9MxVwcYmmi?=
 =?us-ascii?Q?eZMaYkHB+p3xwsM+5lhOxvB7cS3dAXpbdLV0BPbXfDTeWjTbhNssyofnnDSI?=
 =?us-ascii?Q?uNpWhSA4r4bNcg/dP5PlIglNrBOCUhEgTr4Yh6Jo/991jAyMhmWgrNkWY6lo?=
 =?us-ascii?Q?rdK9rkLKGFkX+g939avcB7/F4uUcvJlMuBAKU+FmL2JAoibnRUM7RLD1fXd4?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8c93f2-17c4-49d5-fe69-08dd34e297b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 21:29:56.9915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0QZ6iGF0Gxf+baJHzqaJPwaDLIbPOMQu8JNQPnTEGBuhX+dUXryXoUqc0idxR7QNyHIXLQz1DTggzAj2gCCnzLXMaleMfsSd0C7AQfV52s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6412
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2025 at 12:38:53PM -0800, Matt Atwood wrote:
> From: Francois Dugast <francois.dugast@intel.com>
> 
> On Xe3, the register used to indicate which L3 banks are enabled on
> the system is a new one called MIRROR_L3BANK_ENABLE. Each bit
> represents one bank enabled in each node.
> Extend the existing topology code for Xe3 to read this register and
> generate the correct L3 bank mask, which can be read by user space
> throug the topology query.
> 
> Bspec: 72573, 73439
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 16 +++++++++++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index b4283ac030f4..096859072396 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -221,6 +221,9 @@
>  
>  #define MIRROR_FUSE1				XE_REG(0x911c)
>  
> +#define MIRROR_L3BANK_ENABLE			XE_REG(0x9130)
> +#define   XE3_L3BANK_ENABLE			REG_GENMASK(31, 0)
> +
>  #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
>  #define   XELP_EU_MASK				REG_GENMASK(7, 0)
>  #define XELP_GT_SLICE_ENABLE			XE_REG(0x9138)
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index df2042db7ee6..516c81e3b8dd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -129,7 +129,8 @@ static void
>  load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	u32 fuse3 = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
> +	struct xe_mmio *mmio = &gt->mmio;
> +	u32 fuse3 = xe_mmio_read32(mmio, MIRROR_FUSE3);
>  
>  	/*
>  	 * PTL platforms with media version 30.00 do not provide proper values
> @@ -143,7 +144,16 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  	if (XE_WA(gt, no_media_l3))
>  		return;
>  
> -	if (GRAPHICS_VER(xe) >= 20) {
> +	if (GRAPHICS_VER(xe) >= 30) {
> +		xe_l3_bank_mask_t per_node = {};
> +		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> +		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
> +		u32 bank_val = REG_FIELD_GET(XE3_L3BANK_ENABLE, mirror_l3bank_enable);
> +
> +		bitmap_from_arr32(per_node, &bank_val, 32);

Doesn't each bit in L3BANK_ENABLE represent a pair of banks rather than
a single bank?  It doesn't look like that's accounted for here.


Matt

> +		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 32,
> +					 meml3_en);
> +	} else if (GRAPHICS_VER(xe) >= 20) {
>  		xe_l3_bank_mask_t per_node = {};
>  		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
>  		u32 bank_val = REG_FIELD_GET(XE2_GT_L3_MODE_MASK, fuse3);
> @@ -155,7 +165,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  		xe_l3_bank_mask_t per_node = {};
>  		xe_l3_bank_mask_t per_mask_bit = {};
>  		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> -		u32 fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
> +		u32 fuse4 = xe_mmio_read32(mmio, XEHP_FUSE4);
>  		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
>  
>  		bitmap_set_value8(per_mask_bit, 0x3, 0);
> -- 
> 2.45.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
