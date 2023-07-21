Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC37EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 20:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFE610E704;
	Fri, 21 Jul 2023 20:54:20 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD76210E704
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 20:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689972858; x=1721508858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vYtxHT4gPHfzZBjqxvmDGcZkg5GFgliOE/Py9/bw+6U=;
 b=NtNzCObo42b1zQS5fUnCuFkgDONhUFVf1PLLjTR60savZRKwkq75BSFS
 xyBQoRFFzjq+JbKjpRfswSfzj9xnhEv9SB3tBkJGlI5oWqiwP0GFr/KuS
 4pGlbLJc9bx1B6apj/Xpot6TE1QS3hgVtaWVW3EPXrYXDK21XFvXEzddV
 Gv7CVlp/GTBypmlfgx9jqR/aopdLXzebo65TUHx0MfOMoyKk4Q6heD6et
 L/SzGCiK94CdfZgvDJfNrV4BQeVc1w1WLczrpRpD01h2KPxa+PJEM5YkY
 iNlOOEiWeHRUaJ3AsmhuUk/fx/8wFicT4IjxvcVqVi/sfxOCCK1qtX35Z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433349063"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="433349063"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 13:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718972113"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="718972113"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 13:54:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:54:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:54:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 13:54:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 13:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YG5DoZ93j3ifA6mbID4/qaO6XO/A4Fiyl5AXOLoZ35KsAGofT0526h421F9k32yimt0kOa+dQfx+cDclrPlx7Mg4RENzrVuxXklsoy+pdTQMZySNXA6jlmt2IEIkWX9zMM6gC03QH66uIfbWnweDO45KW/6eyhemdSmBmbh/O9fMAHuWg24hcAaBCWiEkxUFF/pPKJOAS4WyZ0IVm/Zpb2+Fi1MAI4TOA6dElqcwvAHpycjOjPPynN8a3AiDJd20Rx/TBPmSbwFgQibYxbADMJtN0UHZCozhL3UyUaM+yEimiEJg4cmu3FgmQ+YfkPvYkArCilanG8E/JogbWXwkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8fyQaQw9tmU+9Xkg0Pz+EpsivHPPabnmd9Q2WG2uEE=;
 b=mN1GtqY8sapsfZSt/bV5L68MH5WWbbqSg8rmF6Ldi7bbCfeGU+K3NZS0yfgSPMNtG9LPsR93yL7qOe6enUAQgf2CdeEX2hgGx9VrvFTD8IFf1NwLxDuPbPi7F6MKObHAqNeHMNefMyF9SFI55ZKYAPzZfMI+CH4j6fbtK/DOwgFdkcmIO8ETxbV3PQF/St2f2PxBcEXLH3+DvZ7Lm3JjYHDPpE2X7uU2QK8+xZ0zZA9gdDd5VaQM5EJiXjbCrIJrPt0xWX+glYeNRz9KnnuOwtlEi+i+y+auGE/sZUygXZG82pgctH8RQALdjGsH+vOLCxZPeY4hpVluMB79zPHsFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 20:54:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 20:54:11 +0000
Date: Fri, 21 Jul 2023 13:54:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <t4z4llhy4g2kqz45utcucexv6hzh2gc6ktrndxjsgevi7fgmhz@e2euksrkr7i2>
References: <20230721175557.1513250-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230721175557.1513250-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0204.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: b8027174-a58f-4595-3488-08db8a2ca27c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gxsdk9s6XVKn0QuIO3UoAlJYIaXq42n1vTZ86QVGQVUjigGFp/6t3335NkEoISFBymnAaAagAUG5A6GQTPfpz/TEP0dfMnjcSoPJ4Qn3AFyx0/QZsYRUGzDLhV5dMlRP3H8SHWDUx1PGRFZYiA1Jio8a3AdJm85DURsmKvAtUbhRUO0iyKCn15/5jejshH8KChe/sJ+8dUXV6TppPGfzN+6yXZkG7w0gx5ZgbyoSJLvJxqpSrp7tB9VnMU+Sl7TUcHWHm7pNmUe4aVyDK93MCsdYX+u/6435yN2Ov5tH6SWQOIY9lgSpSjK9YvTRW3Af1a4dM9YKz6ncR85rC+Y6r6lOku960U9osHi5g3/ZG5TWCWceIISjAa6CwyuLeejRVBlXOiT0U5UtJOoLyOw3XgqltzRTp4G9SWJzDiE8pdN02kCDiaHnwECAqZLKGsSRZpuwMdIR4t8sKF1IXRZjxhqo9bR7xodv87NS51bSjm+itKM1UrmdNhySIf9zQ6mDcov315aSUMqgZ6M8TwB3Ww2yZc8oJz56G59cZoliXVqmwcllGnvGL5TsDxcRGx0c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199021)(107886003)(6666004)(6486002)(41300700001)(6512007)(6506007)(9686003)(26005)(186003)(316002)(6636002)(5660300002)(66946007)(66476007)(66556008)(4326008)(478600001)(33716001)(86362001)(6862004)(8676002)(8936002)(2906002)(83380400001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XKpE3VN8hhQpS5SIiIC9gpZiu4QpGFA2HOtJp7fZXDBJ53fVb/QIsG4KpEwP?=
 =?us-ascii?Q?+4xb7aRtHi6vA8qQCQRe4PI5Ehz9a1nnNKxZmwkd6LuH3TR9+Y2TtHEoCXvw?=
 =?us-ascii?Q?3uHTSlNn5gAoAQCn/jHK8MMBGgm8ig4sORSFw8BlRkJUklxlgrA3tMeulnXA?=
 =?us-ascii?Q?m/hXf90eVwZi7sM47J6tFvrOP0Md7sidk4awpuxtPwfeH5VUM5Fu+piOBKlb?=
 =?us-ascii?Q?5svyxT2BH9+iaMZnXX4b0Jb8V3KgJqN3JDOW2ZcchB21UCtAg123rWIRBCuO?=
 =?us-ascii?Q?sJIvf8eX/CaSLtXV2WF+/HvgsRLPPcomejRlOnH6norv9h5KA5os4hkfEAXJ?=
 =?us-ascii?Q?aEI3TTkPcMBA3jZnBKXJlhNhjVtxsZGL98xnRQGc+67d8ryvMoFE7I1ikUrJ?=
 =?us-ascii?Q?eiI5/j6XiVf9KhMuCC9zE3BwEnDBOjpLgbQZJJMeALPThL59g470mAhEY//b?=
 =?us-ascii?Q?lkdWh5cuSQ3/T7da6i28UVQocdD6CHOcIlxFx3jbjMbKw2cH44YDWM5MFcos?=
 =?us-ascii?Q?520uD+SgvxpRqLbNizCDKwO8J7Sh4DmETvWtuFudzr4RNiggZrbVCkjG/dTy?=
 =?us-ascii?Q?oUYZk6T2Y3RzoojhGtMK/u6892XretLxaeZ2g7fdu2VMVv7W+XK0oRxUZl1m?=
 =?us-ascii?Q?pYqWfet6AbFE9sF5OOy7tEDZvUY9af56Ufx6YkC2srYybYdpq6syqmFBrW0n?=
 =?us-ascii?Q?3avDqX/UOtbrdFVndT0aXr/hMUZC6QylPs668lp+fWlztR2iHw0CAQ7FnNej?=
 =?us-ascii?Q?QykF36eyVlda9PCMa9VGSXC97Lp2fotuow7j4N2KdPYhhNfUsgrAMeixeVys?=
 =?us-ascii?Q?Owy8SBoRklxqv1/eSIQhqojS9DZ/BWmCHhOOliZ1adih5wgEgVtbiLw3V8vG?=
 =?us-ascii?Q?E4HCt8eSE2nJa6MDkvzq5X3GXSgLfq4Ywd6Z19jNKi2hjA8XBHA2I2dEkQfL?=
 =?us-ascii?Q?EPLUvRBhbJjwFD+EAUuaknWRSDFDkQGpzyDOqu+b4iixygUzsranng9yvp+6?=
 =?us-ascii?Q?O6QqitFsqSu8QeswbVdjlDvAWLueo67GGVWk26KUxxUS0QzTzIp1IMhB6gdt?=
 =?us-ascii?Q?/Hjp6B13CRe1K5+8nQaqpxu8yW4cr4bZHEMA31HzH36ryCv6d3I7rQfxJuF5?=
 =?us-ascii?Q?Ye7vOHhR/Izehqse1YhRrH9xJNRrOr8sGQ3I5/Ht+QxUEt9DmRKCz16PJqlz?=
 =?us-ascii?Q?C9rADkFX5ivMB/CTGWvSIu4rCcRs1tZAG8XAcb/lt2Vpj6cb3K+lvANyGWnE?=
 =?us-ascii?Q?BpMTJpWUNCHNiCzHdsA2RnkhXcdoErLE3ZAAs2eXfmDHs9tTDFcmX4aPrk9A?=
 =?us-ascii?Q?ioDNW4W5cyf9l4eHlJqXW0/5HFzZHfwnNfw3VvX/61ihnokd0e7ajr2Hu6Gk?=
 =?us-ascii?Q?zbm5jeuY1U4stiFRZeottgmwXOh330C6SzLBXiReZUIjfRiNVFQYykr7KCYi?=
 =?us-ascii?Q?abqKtDJybpwB9tTqf1dQu7u/4lubYJk9UtIU824ellX0SsSV/vaqrfJNIixd?=
 =?us-ascii?Q?ii33w52PDvxD1gRnnDRDqwF1/zBcegT4sXL6lNZPqCIUoRyRuRdk5q+Y3ovL?=
 =?us-ascii?Q?YrgO2eHjHMb9U2wsRqbP2lf22WahAPEOQcH1Ld6ZN3sLSGY+CSw59V5Lks4f?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8027174-a58f-4595-3488-08db8a2ca27c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 20:54:11.7301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aw9jpWVY73HuUh1MWRhfXjU1TxLJAmEpkijq999F2iX15H25M5TpSSphA00c404+Wz14P7Cizk05EnX3BjNDlHhIhEf/00IZT+Njbmy+lRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/mtl: Map PPGTT as CPU:WC
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 10:55:58AM -0700, Matt Roper wrote:
>On MTL and beyond, the GPU performs non-coherent accesses to the PPGTT
>page tables.  These page tables should be mapped as CPU:WC.
>
>Removes CAT errors triggered by xe_exec_basic@once-basic on MTL:
>
>   xe 0000:00:02.0: [drm:__xe_pt_bind_vma [xe]] Preparing bind, with range [1a0000...1a0fff) engine 0000000000000000.
>   xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]] 1 entries to update
>   xe 0000:00:02.0: [drm:xe_vm_dbg_print_entries [xe]]  0: Update level 3 at (0 + 1) [0...8000000000) f:0
>   xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
>   xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
>   xe 0000:00:02.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x4
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c | 17 +++++++++++++----
> drivers/gpu/drm/xe/xe_bo.h |  1 +
> drivers/gpu/drm/xe/xe_pt.c |  3 ++-
> 3 files changed, 16 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 828a9fea420b..d04538e65f11 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -301,6 +301,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> 	struct xe_device *xe = xe_bo_device(bo);
> 	struct xe_ttm_tt *tt;
> 	unsigned long extra_pages;
>+	enum ttm_caching caching = ttm_cached;
> 	int err;
>
> 	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
>@@ -314,10 +315,18 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> 		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
> 					   PAGE_SIZE);
>
>-	/* TODO: Select caching mode */
>-	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
>-			  bo->flags & XE_BO_SCANOUT_BIT ? ttm_write_combined : ttm_cached,
>-			  extra_pages);
>+	/*
>+	 * Display scanout is always non-coherent with the CPU cache.
>+	 *
>+	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
>+	 * require a CPU:WC mapping.
>+	 *
>+	 */
>+	if (bo->flags & XE_BO_SCANOUT_BIT ||
>+	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PPGTT_BIT))
>+		caching = ttm_write_combined;
>+
>+	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
> 	if (err) {
> 		kfree(tt);
> 		return NULL;
>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>index 72c68facd481..fd103b64f446 100644
>--- a/drivers/gpu/drm/xe/xe_bo.h
>+++ b/drivers/gpu/drm/xe/xe_bo.h
>@@ -31,6 +31,7 @@
> #define XE_BO_DEFER_BACKING		BIT(9)
> #define XE_BO_SCANOUT_BIT		BIT(10)
> #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
>+#define XE_BO_PPGTT_BIT			BIT(12)

we have XE_BO_CREATE_GGTT_BIT. To make name consistent and close to a
similar flag, this should probably be

#define XE_BO_CREATE_PPGTT_BIT		BIT(6)

While at it, let's remove the _BIT that is agains our naming
convention.

Although here I think what we actually need is the XE_BO_NEEDS_CPU_ACCESS
from Matt Auld's  series. Cc'ing him.

Lucas De Marchi

> /* this one is trigger internally only */
> #define XE_BO_INTERNAL_TEST		BIT(30)
> #define XE_BO_INTERNAL_64K		BIT(31)
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index a458224a88ca..fe91b10f951e 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -221,7 +221,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> 				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> 				  XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
> 				  XE_BO_CREATE_PINNED_BIT |
>-				  XE_BO_CREATE_NO_RESV_EVICT);
>+				  XE_BO_CREATE_NO_RESV_EVICT |
>+				  XE_BO_PPGTT_BIT);
> 	if (IS_ERR(bo)) {
> 		err = PTR_ERR(bo);
> 		goto err_kfree;
>-- 
>2.41.0
>
