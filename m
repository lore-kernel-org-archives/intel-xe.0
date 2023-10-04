Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A858CE7C4E5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C89610E3A4;
	Wed,  4 Oct 2023 17:11:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40EB10E3A4
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696439517; x=1727975517;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GiORVtZQLcUYhWLqnkcsjiKFZFJ3UH1IQUKOVnGBI5s=;
 b=KpsyJSOQYpU38h9rfv6mpab5FaHZSvnNVXZzekgB+ebemuf1lj2oa/yE
 E5QXwfbHMVrFpSoFlAvnye4KZIB1VqvGiCHFbfYhemilKl+72p6NTfZch
 rxqvH4h+xK3g+z1IRXkTSlF0V7DpKjzc27WaQF2J+5FyuH5YGIjCbvJPs
 Zi7xB4WmrEKSiEwUuUcd7ueUUhQMIGNuVVv6EkoDdMH/+Ix+FsAXhHETK
 2p7p2AhTdibZD7+tiJ7hXY6Nf8Y1r/o8HUR7Hu/2zXqIOeF3qDm2Dv9tn
 +vP95fSepiqXBDtn8xPErarzkgGUO4ySbLcHFPa5fWe/LzRDRnGX/cjeB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368295451"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368295451"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1082591772"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="1082591772"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 10:11:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:11:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:11:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 10:11:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 10:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UszSYcnWtxTTkex48wu4LqNEvjl2OIzVjYp6RrtjshNhMxVmxhZohOXNNnh8X9jwFjKYEOh276KxLDmE/XeGXw3Foz4c7YnIW/cIrUxH0wCjak8xs1hGncYTnod+rzJ0Kled1akjtOR0ow0FcctvnzwKcFiDjcvKYzNr39+fF2N31vHzMCETPYuTNIxhxCzz2YYiVyCRyIOBM08IpaS7M+OjXyl6U0Oa0TsKBXv3UzuHtEJ7fxt7awFDMgNMFunFxsuMA1i79NBbuI7LiVEpKXeTtUvSmh42TRtkILzJTdHp+zKS2kharTueeBsxFReEbRp/Zs8LwmTRHGVUiXdRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNB5ACCF83HZaXctVYLAf2AcrfvK/o2Z4Nnruhf89ls=;
 b=Itt5Xxbwwc0jh9/dxZO0xyHOCK/Co/MGiRD68JX/VgwgeL8VPRDeI5CBNGZYosgcjIXkwpPmU8BRU1+lCTlFIWpwX+7xbOzufEfEVOz0RcVw0RNL5+de3UwDfT03KmtARNu9DaWDt08Rgb67BdbGNyxsqAEvb1HAQQoYOQFSjbs/zf4hVfP9XQq1dWBVokhfWw6A7qULmla6hbEZIH6RDxx7DjMkC0iX6Ossii+bi6qeN+WFc8X+4+gD240cbQ7iInIvseEJF+o/sYYuB2IFBlDycf0BT+WzvLwZ2dPwv1AmVZCWrdX3whMKv/svXZC+FISBka9Xh8B9g4Vcz4Tb5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Wed, 4 Oct
 2023 17:11:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 17:11:36 +0000
Date: Wed, 4 Oct 2023 13:11:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZR2cxBinwax6xtM4@intel.com>
References: <20231003202728.132545-1-jose.souza@intel.com>
 <20231003202728.132545-3-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231003202728.132545-3-jose.souza@intel.com>
X-ClientProxiedBy: MW4P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cfefa1-a351-41b9-0c05-08dbc4fcf74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EPqFowXmi6ZabSahroQsK3c/w/LKw1CUoTI9xBjY4y/gA+fqjPwigza5fEM1wkbXkVaek7PyNjY0kPimCste0CU6Ihf7XBHzfTL/rSOc2wFxvL7B0I+5r5m8DAM3/QjS2lgyUAjLVMZqA8tiqsPvoeSbw9x5CUcbVxvYttNxvat9Pnkd+HEnRA2fSTlwHCrMk2WHdrhB1c9j/gvnUADdAQljqSuE9xuU+fBu9m1hav1rf5ODsWsZktLSmFs+64jgYB+iqCpQEwwQ2xQu3S+CZEs+REnmM4JnSJUl4iD9OjfZ987fp/c90QNFla72FNdSYGS8eudXpg3oweXm4gyO0AyH87jjvycjr2Yi/zMT3kxRJ1ypBJc/MLqAqmME9BukPiVdMZKDd5E1Y8fvSjIYMrfNVQLHpUNKEjXK0bPtYp7hpAhkjER8qysAG872vXDV/R7R7HnqrVUfWra+ylin6S9yVtIipZD8e863rX7P1aYAXAZlHXuDnRyVMMHvKQz0eemd1qbSCVrbTiqcw9nk1QfwERJQGqV5vzw3o0VANgE84t/kmilhL7+8libQv/dq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(2906002)(83380400001)(38100700002)(86362001)(82960400001)(36756003)(44832011)(316002)(66476007)(37006003)(6636002)(66556008)(6506007)(6512007)(66946007)(41300700001)(6486002)(2616005)(6666004)(478600001)(4326008)(6862004)(8676002)(5660300002)(26005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3MAI4lVDN7BLm+PStjMTGoONdEA5ufSdx4fSq5JYdAA9pgq4pWBaEaMLW8?=
 =?iso-8859-1?Q?1tYl7R07NTdxeTO27RmG6EYFejPCZdMlaOEqBx4I6pL2bZ7xSEIngMX0/+?=
 =?iso-8859-1?Q?RFz744UhjytDU4weq3YpEa5SynT2CtI57kJ1+jj76rUVY2okkOoQ3R9HdP?=
 =?iso-8859-1?Q?l44X7BzofH4gRIpTG+ra3tTFZ3MbHWZnWxQQIhFe2rtpyocSgB3TnJ4a75?=
 =?iso-8859-1?Q?DYaTaOHt/WKRLUJzrBR+Mh0s3226r46x703HiABR8wuzLvnLVlJ2fEx1pm?=
 =?iso-8859-1?Q?H+wPh3xphG9hnq/opLHeyUyJiYT8FtisEvEIsVvpi3qtPJndQklaOsfyZ4?=
 =?iso-8859-1?Q?aqyJ+h32vF0K3jCjjptJWRIXefKfVH/k6gB+7rKgJ28Bj2ckEc3RXvqKwa?=
 =?iso-8859-1?Q?T5R3nNReSR/0T/b07W9b3YkUlk6rCbLvnM2sKSdlAk9QsG6ahvwpmamGCX?=
 =?iso-8859-1?Q?O4KgoY6491782ejNd9VKT3+76N3dAV9WfbVRTRFn//e32C7DriY7Lk8Ijy?=
 =?iso-8859-1?Q?vbbYQkJAJtBb60zKoVfM1gcxzP90F6hAVApS8CWh4++DuF9LliLXJ6fkkr?=
 =?iso-8859-1?Q?PD6sIvcIxTiZsrFEcR8mrcA7IOpFUcTnUCbOyCkdbq4T1PmlHSyy5y/4rk?=
 =?iso-8859-1?Q?qMI7McdtDU9Maebpy5mHg///pUYLnncZ9MSOJ4tz5eZsEHd+4oGtH46k8r?=
 =?iso-8859-1?Q?2VbrQPNIethWla8barxl0MU3hR4OxxS4sSPbTilKjuvtOfVtwQxpQ1qkgF?=
 =?iso-8859-1?Q?LD5P4GaKd1rL2g1dwWNafe9s5GtebYkmXYSGMi32+j3k4HxIZ33BdPxAK9?=
 =?iso-8859-1?Q?unGvK7RVMk5lWCQyrFAxrYAJniVvITUxIkzNhS7S6FKnMOyB0uvND0ZJ4J?=
 =?iso-8859-1?Q?DCsBoKfG7WQQyImH9vRIXh4bchOiKzHCPNI3IORMsyQeiH9wfQs8loY1hp?=
 =?iso-8859-1?Q?syF+51R0rvhW1bqmGTiQEMm1pgpvtYRWU3YpGpvl/DWuEOxZWNjWGTDQnd?=
 =?iso-8859-1?Q?F7mIKOYu0HW1t/aT6NB7qnoy8OxqKn2i2YPsuJODkgFgBF7rEwQ9FH0y1T?=
 =?iso-8859-1?Q?WyY1kYNgMFy1xhf3cY/UbS7sd4c0Vquoiie/Z+TTrXMO/ygyz6PjS2vWi3?=
 =?iso-8859-1?Q?vnLgo+CAdbqsWkuw/eC6HLTJ1kSYWAred0oXXnyKOLb8IDWOChagmCtvOx?=
 =?iso-8859-1?Q?Y4OoASLYv/npq+og7/UNb7gr92ABADBzHIpCMlaknWeEOKu4dlQu/d5qTM?=
 =?iso-8859-1?Q?0bCc/KJquWwyEfyNVnCX/IkCSF6ANUkjCVKU/kQk+o/N7wzq5Nzg0UXxyf?=
 =?iso-8859-1?Q?g3O7UZoOCLvafM0l2TohEBVgCYLM381CP6hKquRBhwim/HkmAQxA0RYC/N?=
 =?iso-8859-1?Q?HWw9ws/TyEroLcZPHXeCLaepLhKGevenq7wqGprCV7DxLpxdzDYtMVh9LI?=
 =?iso-8859-1?Q?g7xoY4Jb6Zji/SwPst2DFi+pISH7RyE9frcUwElL7yuQ602/E/HrKWPari?=
 =?iso-8859-1?Q?pWi8FghhLQtjNExFoCbawjL6S+g/k2QjtcUJ43Y9XT3a63Qy5h0SQpqdXN?=
 =?iso-8859-1?Q?pWtoWklALVMiiReK1cYgsLmlH9oL4pTWJHnusyNmoHSCO/rjOReyJbgdfv?=
 =?iso-8859-1?Q?EUvofHgHlmPFuBMaVgmcv9K+XzjzzCTn56l5P5qp4npDDGHKDKoLYBfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cfefa1-a351-41b9-0c05-08dbc4fcf74e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 17:11:36.6740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkWn1pGi+yWmj8tv0Uws05JH0oAsk7K0FuEiGKAk7prgdgwoEXm6gw3k8j/z2L988YbiLl8HMcS+1RTId/5bcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Remove devcoredump readout of
 IPEIR
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

On Tue, Oct 03, 2023 at 01:27:28PM -0700, José Roberto de Souza wrote:
> This register don't exist in gfx12+, so here dropping the readout
> and print in devcoredump.

What about the RING_IPEIR ? also doesn't exist in newer platforms?


> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 --
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 2 --
>  drivers/gpu/drm/xe/xe_hw_engine_types.h  | 2 --
>  3 files changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 792d431161c68..35dd4837dd75f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -31,12 +31,10 @@
>  
>  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
> -#define RING_IPEIR(base)			XE_REG((base) + 0x64)
>  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
>  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> -#define IPEIR(base)				XE_REG((base) + 0x88)
>  #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
>  #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
>  #define RING_NOPID(base)			XE_REG((base) + 0x94)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c2db391cf2674..f63c821baeb77 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -727,7 +727,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
>  	snapshot->reg.ring_dma_fadd =
>  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> -	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0));
>  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
>  
>  	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> @@ -784,7 +783,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
>  		   snapshot->reg.ring_dma_fadd_udw,
>  		   snapshot->reg.ring_dma_fadd);
> -	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
>  	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
>  	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index cd4bc1412a3ff..5d4ee29042407 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -217,8 +217,6 @@ struct xe_hw_engine_snapshot {
>  		u32 ring_dma_fadd_udw;
>  		/** @ring_dma_fadd: RING_DMA_FADD */
>  		u32 ring_dma_fadd;
> -		/** @ipeir: IPEIR */
> -		u32 ipeir;
>  		/** @ipehr: IPEHR */
>  		u32 ipehr;
>  		/** @rcu_mode: RCU_MODE */
> -- 
> 2.42.0
> 
