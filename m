Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE78C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 17:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778DA10E16B;
	Tue, 25 Jul 2023 17:20:47 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076F410E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 17:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690305646; x=1721841646;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PJixiNGK9fpfMM4OyjcL5AwXRVT07hQVQinRwQ/qe14=;
 b=UtthhrS7fA2pgMxLVRahbWWOFepeLoXRklODxK/GKMdi6MXsnrG9YVfn
 CwmdkhCvAYtccZ0xh0Hh97L6vcDnr1y5NhqyUVXCHKrp1I1s2YpSqZcQ9
 uAM24Y0t0+ceQetLbZsia/Xw2wtvAMxylUtikA29b5xUtEQETA3ASw9jt
 Uq11YOk14U+hfxHkuwvHAX23fuvBMeYxCydeqWeKNwLbeUcZ3CTOMSOFw
 osn7v/9uY33EBKqEeR6hWGY7AE5PSIf3T3wqWLhhaRc74VQGXlbqXrU3j
 CvK46hvMeSX48BUMXnZNc4GmKkPi3fdK8BjAbJM9Jg3vKDSnlo1Z49oYI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366677129"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="366677129"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 10:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="755848472"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="755848472"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 25 Jul 2023 10:20:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 10:20:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 10:20:44 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 10:20:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVet/DKMVxnslrRLmmSLdfpkERCONxoZmzG7JKdnRQLtnTix9hy3OP4OtEa0oAiIkRP9wfNuBjrOT5JxI0Qvn7lrFjulULemEaqnGUP3BogtuSB3gipU66pMoORO7byaoZJ4oLwjbQTOgTsDAYeLclkw7bY02ta3s6KmtUxb3dab3tkf/URR6YGDtDldMuOpt0MFUTUFKmqNu/aNQzJefkbFAfKBQswXbpha7TMbuAiz4epsOG3p6/XtV7MS7+66hLRMWBiYRZDj17Hsolb/pfNA3ksCMRV3AO7x9sp48hj7lGxu2k2euX9TQozQQA61r67GzTdau1KG9CKPgvCwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqWTlr5dcy4TwZvSMrV/xUvBZhjo8aqWs99scbThCbM=;
 b=KtOPkoxLH7CBtUF/HCrVnwa9pxxFUGX1yXVm5kFMFFmHUYOFetYLmz65T46Mo2PYfgVRFezz7S8LPN/YQ5pIFRXW4ZNurSjpzjTgN4PBPriam04v+6VhHGA/BUaw/A5hn+7kZvkxWokctx0gcFvuQ1MOcwJWTbDIc16D/W2JHwGDMSLK79BnidEne93iCcY0B7e6G2vPJBICh8wUm7AXdLL9wsfph3XfP3/RbsdFeFMTvkXgKUHrmLCWnkzdzEl9B4t3uue0GY73CDCDbF4nKPnN6WsH/c7lIvaTrJaGl0Iawfh5BQU/tCgz4KcwrFoobZqGj09VVDuqFtF1dgDTBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL3PR11MB6337.namprd11.prod.outlook.com (2603:10b6:208:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 17:20:42 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 17:20:42 +0000
Date: Tue, 25 Jul 2023 10:20:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230725172039.GL138014@mdroper-desk1.amr.corp.intel.com>
References: <20230725164344.3797085-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230725164344.3797085-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL3PR11MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f22c106-a58b-45bd-732b-08db8d337956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w8k13/Yos/ym3tLXDxXi2sWNQUcrmBJcnKyW0Ek83dPadC56JsMAe1Nt1DyNqufgZM47/gC4thRyh4OLHtuqWGq8l+mvpzCn2XxtG1i0a1vOXfsSuxHzZ58lSJY492Mxayp5N6UfjduKWKce04SOrSfMM6W35SpRXJMrx6CLO3/ccUOX9ShmXkzw2v1CEPEUKTpGkYF/BHanOGYPftPkFF169XYJ873XVZepXgEYgYoZRgUQiwuWe6Jx+lVS6t1fTFY9VfddbVS1rkhitx+lg3Sjm/UIdGUH2873T2OmeiaTazt9F8cw6VQRKOF/3GwdhwbjXefqet7FoR5H4nGZHaICQ8L4QWu9k9jpmgHn/4Kr0A+xkxEcVjRo5z1CJgJfghTsvC1XJ78krMuGidVirI7aHWuXEKBTwvZwjUYUfbdvQrLo22njIFtB+lT/sGkyfJ/DyylOYppV8Amky+c8aI/mefkY2tyhMBbH3FybTvVgNf3RQT7+D/ZnBKWkHoJPOlsRUmd1V/L8ZsBberGLiZsp3kgd3YNqn17a0wxjFsxoKs2G8Dw7YQBQ0dzbdPyJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(5660300002)(86362001)(38100700002)(26005)(6506007)(1076003)(41300700001)(83380400001)(6862004)(8676002)(2906002)(8936002)(316002)(66946007)(66476007)(4326008)(66556008)(6636002)(82960400001)(6486002)(6666004)(186003)(6512007)(478600001)(33656002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?20W1wSPJB16YDW4AgeM7Us13lfwpZ26giXcIklBI1uPgxD8Lz8on9JNCWlqZ?=
 =?us-ascii?Q?Y2VJO5Jn0tPNXAdSs3FLNIZ+D/rW8k5BeUxGRId0KPAPXnp0tC463mOFbquV?=
 =?us-ascii?Q?JzFPePTMCQEpg1j3tpSpho/ipnVie/AyKorBPZqzxcS7k5rjT9LnPilkl8OL?=
 =?us-ascii?Q?yWwV1IF/81yVxMJPxyNv2USSL9wocMuLaAgRIe5V7BsxexvLnMQFkFtzKcn9?=
 =?us-ascii?Q?3oOt/uH5QH0yX9ChGezcgTd20DEBGT9CNiteUQcxQyimgdxRPZmchRaWJvjr?=
 =?us-ascii?Q?Fcxf8UqgBggIILC5zHujmytzdMkuWgIzXyMWzYOns2yz8tp+bJFKtDICIJyL?=
 =?us-ascii?Q?QcTWDuzePZHw24ST7Hmd1u7D662ARKtTeFTFuOW73YRHRk4eRAdDl7rRBLly?=
 =?us-ascii?Q?Tn33I/QUBbQautMgVqFtiPHS0zo0x/0wKqasfBHMZ9S3Qf/ygFB81exTnN95?=
 =?us-ascii?Q?t4+Ih/NY8JsQToypk3yr3SDct00U3IGfC51Z6v4ReNKTzQYqWbTYqVD+BJi7?=
 =?us-ascii?Q?PFDjTxPgfDUL7ffiZOGnNIDeqsv385V36eVQkrxcbxjKQxOxNZY1md5j/M5E?=
 =?us-ascii?Q?iZHEB0tzWVLIIwbAXhMU+DqGPyfG6PE2FgWxqSTLldV+32yYC8OeIoXN+q6x?=
 =?us-ascii?Q?Ohu+/C9VoUXWd+heY2bBaUn1Kr+cKiqPKyByca+o+XTt9XMeAt+rF1wIz4Xs?=
 =?us-ascii?Q?LOzXFMNN6qhJxmKTB7nGNUgn1fTNhpKHM6pWJsHwnYS+EI6QaQOE0RWA+GJv?=
 =?us-ascii?Q?6DXtQPC0th1UNQBwHx9yIhY124h738q+R1IvzJZWNTvfhiRANjtUYZ/tZHXC?=
 =?us-ascii?Q?MMBm3NQNAw+02FNxOA5CuLnuOPl8Rh0sBRiHxW/l+9JpcSF4PG8xHgLZd5Do?=
 =?us-ascii?Q?PvqJhr7dxBqcMvKB4v++/sRuoSsSIF1MySqocxe6qyAp6VW+MVyF2oYKwHCF?=
 =?us-ascii?Q?a2MG/Nh2F4p7lxTY21S132PQTsmTCWr7CtpuwlLVU/hiKIeyg7xyxzhbOC1C?=
 =?us-ascii?Q?PS2uYkWX27/CjGLBTbMHcQdmKmck1O0PX38Jv9lrpx0xODIxJZCaWCqbUdq9?=
 =?us-ascii?Q?rL5zIwGTciyD3f0UCuNmX0LjGU1UKNazEUfh/F2Ofs3IhkIEcuH9yZs8oOOb?=
 =?us-ascii?Q?c1+teJi/AOrKUkxCqSrW24friXQ5+7H3AE8cUAVSfTD/G9HZc1zWHuAmAfwL?=
 =?us-ascii?Q?rFF23teicHam2fsyobL3Ufj0h0+176kMRha7l0E+MaqnQymrXTG3+t/ZyaQ6?=
 =?us-ascii?Q?M/o8Gy3be/u+xuRDsEfWtjvlatX6vTdgnuEdt/P4FAXIAoaFf+t0/akzu3NH?=
 =?us-ascii?Q?8UUJDqClpOXFy2TZaP6PrtyHFqZYDdjDERjXF3J0G+68fFIjk4MK2pDpJ/tI?=
 =?us-ascii?Q?pYPt1k4X8OhfSUmmDSZgAXG6qTuNpG5mIZQ+MnxvOUlnnZTHx9uUDP3D2oJJ?=
 =?us-ascii?Q?bhExv8YODyKA8ozhFRd+R7HLUFZqEZBrC2NbrxwWP4w55GJ8f7OspStRyfJQ?=
 =?us-ascii?Q?ijJLQG262iUqVbzn1rEfKL+xBmI3Rtma863p1HcsmiyRzwrax7lG+ppNF1+T?=
 =?us-ascii?Q?MxUHN1G7ElySkBsNtjBBGz7OuypHFalX6Fqk+HYrwhcqgwLDa0s9eS0nY2+g?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f22c106-a58b-45bd-732b-08db8d337956
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 17:20:42.3506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUWWo7c0VMrIwQBoyJVKUqD+DVSHdEixwHFISw+29ttD8cX2o4dBCQFyorr/bX9Oc9wUeyREXCVyzccU+fovqA4QepUAhhyisgtZZ0SCiKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6337
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix MTL+ stolen memory mapping
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

On Tue, Jul 25, 2023 at 09:43:44AM -0700, Lucas De Marchi wrote:
> Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
> mapping"). For stolen on MTL and beyond, the address in the PTE is the
> offset from DSM base. While at it, update the comments explaining each
> part of the calculation.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> Untested as stolen in MTL is supposedly to be disabled. Need to find a
> proper way to test it.

It isn't actually disabled on Xe right now, so we can still test.

This patch by itself isn't quite enough, we also need:

	diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
	index b5bc9233c280..30e43663850c 100644
	--- a/drivers/gpu/drm/xe/xe_bo.c
	+++ b/drivers/gpu/drm/xe/xe_bo.c
	@@ -61,7 +61,8 @@ bool mem_type_is_vram(u32 mem_type)
	 
	 static bool resource_is_stolen_vram(struct xe_device *xe, struct ttm_resource *res)
	 {
	-       return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
	+       return res->mem_type == XE_PL_STOLEN &&
	+               (IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1270);
	 }
	 
	 static bool resource_is_vram(struct ttm_resource *res)

With that the framebuffer console starts working properly.

At some point we're also going to need to chop off the top of the stolen region
since the WOPCM area is reserved.  But that can be a future patch.


Matt

> 
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 21ecc734f10a..271b3fba4129 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -94,11 +94,22 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>  
>  	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>  
> -	/* check GGMS, should be fixed 0x3 (8MB) */
> +	/*
> +	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
> +	 * GTT size
> +	 */
>  	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
>  		return 0;
>  
> -	mgr->stolen_base = mgr->io_base = pci_resource_start(pdev, 2) + SZ_8M;
> +	/*
> +	 * Graphics >= 1270 uses the offset to the GSMBASE as address in the
> +	 * PTEs, together with the DM flag being set. Previously there was no
> +	 * such flag so the address was the io_base.
> +	 *
> +	 * DSMBASE = GSMBASE + 8MB
> +	 */
> +	mgr->stolen_base = SZ_8M;
> +	mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
>  
>  	/* return valid GMS value, -EIO if invalid */
>  	gms = REG_FIELD_GET(GMS_MASK, ggc);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
