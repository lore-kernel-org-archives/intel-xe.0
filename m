Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6324EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 22:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E87710E406;
	Tue, 25 Jul 2023 22:47:27 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C597410E1B4
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690325244; x=1721861244;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PHMo3k9TW3f9bsgXKVX1FghvTce/rPr8FdWznc4ewcE=;
 b=FBJyv6ehl898bZn7sIB0eg4oScAs7Na7S1jKz/tWSkikI8G2deW2R420
 KVq8HpwR++DLa2CDxdd6JiNhdg5iD8OOTIf6Yg7TUT6Oilue+QDEG4yPH
 ZO2+0rn7F8TKxXE+Xsev8WvJcUTE9KrSuNrleDwNc2IaoG3W9H6l/DDew
 defsh2gaGI7/BwYGuWQz2rnDf7I4ba/utPzxBtzSLzmz6dxsy7f1pMRHv
 FIfuzBwO7EsjOJM0DI+yi6lmqlhucyfIgk7XO1qt/CB5Ya58KzEG14JDw
 ElbMPgB3OgN0uFmrZW6Uke+QDw1azyELhrn9L1HI8tmk4AAwAokcMG8aF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370535159"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="370535159"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720212814"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="720212814"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 15:47:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:47:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:47:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:47:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6MTE85l1aRHlJDuRMzTAT1Jj9ZD8D2PwqExFhNvAOwCWAWrA/hWKrQc/soYdnqdo4BYI8kMjOUpQV298xywRF/xyVIB2AL38xoarBwvjpaTV4XX4vywNUXeiWLmli4/Jya98ipnSOXwdWDC37r99nsU0Qbci6cJRvo6+inrck7UNWAeYvgz67Mue4lUlzkB94kNEInkK3ke5JYDDQhXp9elEFo0DN3AVrr/Z7aEvn4gz5AtA14Wq15Y7xcUL3i+EPjOKsFPLpS4bQgXWMnJKCCWq9c9wqLNKZKNFj4ksjVq5ti6tFZ4dpz+aCXDBa6tOYugKE13Kr5Ascp/NF4XRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygWlshAZVhslzQCjplfZv8EcYa/vmbLtTq4fxQcfEMg=;
 b=gdxY/HdAuIUDxX/kiVeoB8Ak5h9GlAInhnbikF6c/dJeH1D6NJ7PCjWmUUQhM1MZDCHgnN3higsG6mML0FtZsePjnr5XmIQZ3Tgx7XUeTK7YXMabixCbE2jud4A9GtVpWrjlbsYdwkaW+CoQqLTfWphJQgjKXG85KgO9vZFQ3rz1Tnj6Lp/G0CGk+kC1TyMT+e39XfwIOZfWYczBRuUW3/44xvlslWfQIboaNLmAavEZW1EoOYgQWjBWkcmjcDwMNQE/1/zNMB58eav0IdIVNjz2GtYvnznga1L44BrktLaiHPU0b/Da1sDq3pChO0BebMjhRA99+zNEYxThhs5uBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.31; Tue, 25 Jul 2023 22:47:20 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:47:20 +0000
Date: Tue, 25 Jul 2023 15:47:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230725224718.GX209733@mdroper-desk1.amr.corp.intel.com>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
 <20230725202836.3854908-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230725202836.3854908-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: dd69c509-cfac-4668-8d73-08db8d611ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9UaYm9lr4ohCGikOa/pEKm0yfnDjpyuY/fR2Q40JEb52H3gqHqLI+lVRbTEGOOpotEmORF9lZt1cvfyvyRibhZ5tvgitvQEsw68yahrjAZPyegGHC18gvj6UQK6fE/Gu6w/Aru9KPWg6bE0pRgXR54ECWks5sZDSine/8o8J9eYiC08TMIrW4CXy5P6A5rH7an8srTBvS99KkwqzrErbiowsGOYwBkBHYsdu9AdT5ZHMhrfU0qLx0wfp7aWLk81/7KJB5hkpI1lgbXVFr5DXrePAipsY3+lOvYtofkEEErcgCIXV520S+qt8bFYiR01j0DC19+6VATW0DCxlh6fEKPoFIiRPZrc17TMPmwRslc1tfcaWnrImyF1YLZoCKWr7N7+zvsdj4t+QP5hhw44CZF/w27slbQ3nnwTWUNeuNGBRoKOzhT3SV6RJQ78dni0ERE4W4taVMkxfrMt8tZsxvWe0h1S2GCC/u/qoLEgp6V9KDWEMhAbZvxzT4NX5qr2lgyld3K+anLcrG5W3Co+7kWOzjKWzJcXhqXpVlJVdazHhaJMXASXSqxkqEZZZv7Nv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199021)(4326008)(38100700002)(66556008)(66476007)(83380400001)(107886003)(6486002)(8936002)(8676002)(5660300002)(6636002)(478600001)(316002)(66946007)(41300700001)(6862004)(26005)(186003)(2906002)(6506007)(1076003)(6512007)(33656002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Txf4vZUnCOLx3WB+My1A1sLvISzTpfrF0qeYsv0mD7jYnD57m+IHNMQLwF65?=
 =?us-ascii?Q?k95o2WRXMy5qQpTdsM1Y2HgbcTm4ywhoFYmVV/urojgbuSWmDy+YwEzA5hQU?=
 =?us-ascii?Q?92qqs3A18cqnIzQoMWKG94OxlwXnfDfU+K4yFW1fFNR9PH57sD2Hx95lRdI+?=
 =?us-ascii?Q?gOXXiVZ/rswX4qKq6Ib6iQZ02FWvGfMb5d7IaxbkI7AFN7yHOkMhwoI0vKWO?=
 =?us-ascii?Q?mYaDwdBZ1HT65pFCghLDavQJfP/gRDJEgFthv99Agt9kZwLiY4hb7yGrWKlZ?=
 =?us-ascii?Q?bDzDQ79NhZ4wblnD2otyFtj+Jeu8rPCpwocQtrtiPq58SQ4xAmCDWxhpALrj?=
 =?us-ascii?Q?4nII0HWJG7d+RyHupI+85y0MPgfiP6JJ4iNvCPP5AJBsBP6Oq56OVbLSrP8I?=
 =?us-ascii?Q?98M0/kJIx8qW9SLXPu5I01g9jPvp1H14vtUDiPlKj2rgHSsrVlhNEqWnEtMT?=
 =?us-ascii?Q?4wVddNR40vBgxYsZKLa5kiIDi3ofY04XXLhrn2K5pOpNTTCts9Zpj9DDXCFQ?=
 =?us-ascii?Q?qMrUp80ot94i6EeeVcMjJAE26dlkm9QRy7QyYDkY/tF72i1pzEolgUUkOKHy?=
 =?us-ascii?Q?ZbdWU0kJG19M8PFS3ogoh46qRr1gZkWR9T2WmNUazjP91oifQpf2NALtkwmg?=
 =?us-ascii?Q?ebYSa6Z5hGMfzqCSeqGAHkja4z6vJKVMUQSAZHVxa+mXvZWXpY/YZ/haWrMQ?=
 =?us-ascii?Q?OJwdGhbCCC2VnWn/PXPJgaHbh9bBHvvY+zsEQXhDQ9dOSrjHVoCsl0tEPG33?=
 =?us-ascii?Q?rpDMXVyj/n1yGYYYnMTl5TtPNGPI5k+WlKA0ig3SU6xPCDFkVDDekhy0JoFX?=
 =?us-ascii?Q?9SIqm9yM8kds8Sf75YtRx/6U04PJO5+HRFMAEMS37G+voBm3kWgpqBNCKScP?=
 =?us-ascii?Q?9r+er8p78QRtux+L0wyuAJKy6PHgiMNbE8RVWgW3BL9ObCNCjRpPk2fewVTu?=
 =?us-ascii?Q?5+JkGRaskgJic2BZh6dR64btEn3FeHhuuMP2qJE8xovcWX5avgs9jOOKYK4B?=
 =?us-ascii?Q?8etp3OhbmNmH9ca+FtbXhlkn1tZ7/uybWRjq1WDJProC0NY1URo4ePyLYhXE?=
 =?us-ascii?Q?IeqvMD7sCmJQvQcnHgUtUS41JKy1u36CZg9H4jIRa3mao9CXNfy13Wk38P6x?=
 =?us-ascii?Q?aYT1TLJjO4Rkk3dZlAhaBYOkEYao5mjI/Hvcp2B/ZTvjuykFevgt4WXLcPNj?=
 =?us-ascii?Q?pwbxsCt/mQbxL9IEmemcgUNFrt0RSmxP2QpqEwnYaoHiqUg9qbNuqftG2OC6?=
 =?us-ascii?Q?LOqgI4mwD9r3/JTrSwl2o4C6Z0X8g/stXUvanXD9CnIsOQvMDXeHcpyXPtQ8?=
 =?us-ascii?Q?QNmUPiYZjSly51G3qdbcS2LV+n0HJv55afo/z4OCOYzHrSHCbKSzCi52k0xc?=
 =?us-ascii?Q?vwddtI0MkMv4Le+kzZAHJfdmyjXKuff+3ADJQJuiZ8Qq3NwjbfFtUz5US3C2?=
 =?us-ascii?Q?ofCXjQ8XYlcRDW3Fv/n50hhBdLkdixXccdGVo4L1HG3xQqofUZ/oqUVuTwYw?=
 =?us-ascii?Q?ziEQ0MXXPR4lFRPNfazY495+QApFxtsDaD1Q1XU5C5fYUMrF9j5VWFgurze4?=
 =?us-ascii?Q?/v3A7aIaCDpAXA59jW5cDpg77kE7pGCmI5za3WdRZTTBlEwqwhHQmG5zdl6N?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd69c509-cfac-4668-8d73-08db8d611ad3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 22:47:20.6125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNJJ7/wXuBFb9WorI8lSMICknR/G7yKiKqT46L/6n5G8xnwi1uMLeZESKBjdeHRxN6PFpjek7fx2GU5qFNvA8kFgpeyHndnUTGoumjy9WAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Fix MTL+ stolen memory mapping
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

On Tue, Jul 25, 2023 at 01:28:33PM -0700, Lucas De Marchi wrote:
> Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
> mapping"). For stolen on MTL and beyond, the address in the PTE is the
> offset from DSM base. While at it, update the comments explaining each
> part of the calculation.
> 
> v2: Also change resource_is_stolen_vram() so the right PTE bit is set

With a bit more testing locally I noticed that I'm seeing some warnings
and crashes on driver unload when display is enabled.  I'm not 100% sure
they're tied to this, but it seems like they could be.

The first warning is

    WARNING: CPU: 10 PID: 4710 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:324 ttm_vram_mgr_fini+0x15e/0x170 [xe]

which is

        WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);

From there things go downhill --- circular locking detected, slab cache
problems, and KASAN use-after-free reports.

Without digging through the code in depth, my worry is that by just
marking this stolen memory as vram everywhere in the driver, we try to
return the framebuffer to the otherwise empty/uninitialized VRAM pool,
even though it isn't truly VRAM.

Maybe it would be better to make a change with less side effects
elsewhere in the code.  E.g., add a "resource_is_stolen_devmem" that
only gets called from the pagetable encoding functions to set the DM=1
bit and not anywhere else?

Or maybe these warnings are unrelated; I haven't tried unloading with
display on any other platforms recently, so maybe it's a pre-existing
problem.


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c             |  3 ++-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 15 +++++++++++++--
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 10858fcf4f62..5379d8e5affb 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -61,7 +61,8 @@ bool mem_type_is_vram(u32 mem_type)
>  
>  static bool resource_is_stolen_vram(struct xe_device *xe, struct ttm_resource *res)
>  {
> -	return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
> +	return res->mem_type == XE_PL_STOLEN &&
> +		(IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1270);
>  }
>  
>  static bool resource_is_vram(struct ttm_resource *res)
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
