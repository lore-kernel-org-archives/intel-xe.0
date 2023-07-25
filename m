Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCD7C41513
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 11:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A688210E083;
	Tue, 25 Jul 2023 11:46:02 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7710E083
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690285560; x=1721821560;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dYabXQrtiq1wL/244z3l5xDAsyJVznJPX+XB2wWRQQk=;
 b=PQ8qGczh3Zfry70H2mPxiVzJFeYs736KPc9+SkRaZvyfRNr7HRSkvfZ4
 +qMsBoV77IEfaIeHDajLsCorOvSFEHqZnYP0aDhcUhLCpIvH/uh7I4A9H
 z2sENXP8HUmQ1gQjkVcIShXMQ+nbn7zuicQXQZdHvrMgXPuxbapia7srd
 zmg4/O67Jfjj6Vm9K1ANgZW+jJPaK83SMdgMXM+b+sqIMSI4zEm7j0wab
 40m9O5EDOlKP4v0pki6uc1mKxrBIqEEFyYtuvzQpdcbdYd5tZKfHxWxwY
 mwPb449BiD1Ilgb1xWDwyEWQmEtumai7NAp5X1Hvm96Mrb3hk1zDXLnIT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398609812"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="398609812"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="726089111"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726089111"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 25 Jul 2023 04:45:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 04:45:59 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 04:45:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 04:45:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 04:45:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lb895/taz9RSAdRCD2svON1q2K2YcIH/5eQjnRHgqOI0WYcLcJndJz2zzqGKb7Np+hrxmmOPLJA42/XfV8SIF7uWmGA2vlMU7D8iAVqt+cqePx52H1nCVT0S50fqu595mygMq1d5B/s3FTulQvG8rAYbBPOjpzkgJEwZqWH1bb+6gViXpHm9gaw/eqWZwuFc8YUTUlWYWkTH8/w3zyCTToTqaXVKfEwJFbWpZGWwPB6REURDipFKtM0EiCCYPPsrNAddoXblVeBzcA8BNvrJ8bBSv+Qe1vi3V+NZOJmiKGp6rynvBirtrgNyJ4WiR3T0UlAMBbpFHaF/nxPvcA8KZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVAQZFmiebJBxwW2WOfC/uOGKenSw7xBKk70usmenEg=;
 b=CXPU3IJNAqusCgPS2UC1Tn/Y2o+WDHzF/vobQblrq8m/s01olZchY4A5E+9GBL2xK3l8l2ovjSWpFQ5Ws7KmScdTkpZwZaX2FTwl5RBkXsEI0FnvxLeyfVb7yUb0u2FgRrhF6wFBT2zW37Xkyg0OnjUFMpuOsHaLNFiEtG/EQhEc8rpGC1KcwaHyrQh2NkR0y0kDxrBSw2LW7YY4FTqMbgmWrisjeJPzTnpnFOL1CLV0JIVvZt4Y7pcSadoSynmsVAP3wzCp0BnEKIiph1VGyuFQXB23mHRtqNotLV+jTfvOyUOBxKBL4uvFiH+faGQKK/sFW5GjTkroTViCbA6vtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7360.namprd11.prod.outlook.com (2603:10b6:8:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 11:45:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 11:45:51 +0000
Date: Tue, 25 Jul 2023 08:45:45 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <gh7yem5zmssd2nrn3b44sbzoznlpevcpah5p4lpg7x57wgeueh@yhhgirqcjrtx>
References: <20230725003433.1992137-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230725003433.1992137-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2e6d43-dd1b-44aa-c72d-08db8d04b1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYoiG/enO1HKox/8GUmny/MAwl0IDCLT8p54ZqPEmnIRfqkCuz/ViDfxThGMOqVqfBhU6nvGWx9mn84PnIkijByOPT1kNnUCYQMvlKaIH6jwcKzxPuXCgE1e4LfmKa4m27OSEiJlvzIhqXmiEeKClxywbTnY5w71LWzXOnlfegCRLFYPpclRcDa5X6A3jUC0iBJ09juvd+9GwdDpIFtJI0410hS+pFKmRKF3jw4IqhibdgXuoby79LL6KJvUx3yfduxlwwyTiJ1vr4jJob5ETS+/pBDGXmQWkM8BoruMLjkfLoCVFeo7MbpfyESPyjYECGTTIUt3lNg6IRT0H+qzLvBt957XzzCu2RflLEi/2VJDSQgRg3+E4udOoj99dLXmwkgpB0FAJgqXUi7z9X/6/7wCZzn6eKevczjU6Gwot1Hn1MxNV2XuUSVC3DfcumZmZcpa70bKxlWfCYpJ085usoHfw/U+VYZl6Mo8KMzwUpAzLeT2iXBSVoWB6KBumwIOnFZ//EtrGEdpUERS6Hd/z0B8grFqY4CodboBHzYb8WBopmaZFH7mRe0OIA0QoRm0RMPfzM0tDJhEmxbSI8V7X3IFIOPrBZCr+gLOMLw5100+ZwUeLqQSltrkfUaa5Rsv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199021)(186003)(26005)(6506007)(83380400001)(4326008)(66556008)(66946007)(8936002)(6636002)(316002)(66476007)(6862004)(41300700001)(5660300002)(8676002)(6512007)(6486002)(6666004)(9686003)(2906002)(478600001)(33716001)(38100700002)(82960400001)(86362001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UAa3EtL3FDCJMUsPwyDUPlKoQ1+846jLGKAeRQzqsf3b4tEf5lHwQy3ZEDgE?=
 =?us-ascii?Q?4Bxo31ffef8r+hAgasqnWLpZ5oyfGC7PoIsLGHNJ+ySZrsEwR/RfsXlGHXMV?=
 =?us-ascii?Q?o6biAeM5D1IAKLPILCulSnZZssiwPr4zC7ko+ecf1BZxjmtapt4tzep6CXRv?=
 =?us-ascii?Q?hrtlWIeNIgOsvLVXljNkbqVF7ycE5Hs9ebkqD5wYnhF5Op0RYjI2Mh6Vnbbd?=
 =?us-ascii?Q?ac2cwT3w3LMiwzTm0I6anQYp98TuPVMBC/RmM5usV42FQrY/RRuRY7Ni0SeL?=
 =?us-ascii?Q?LqoHPKWyb5YI5+EnVBFBjdDAA/OGHX/i+dKXLp3kgCHPkxu1ykYeMyYqKgYe?=
 =?us-ascii?Q?0++9nMmuOO3FSXxYIFpfuMoUz51XFZAEF3NZ7JsmBLsft534nAPv0rCpF/ZG?=
 =?us-ascii?Q?TQ5OadIvcgoxRdMnqNZgM2XKs5Crg08uY1j51MSCf1KcLaqfhdLb4HtOQNLI?=
 =?us-ascii?Q?bGOyRYmUoUainqrxQnidk0EpK85atvGt49ypK1SKtJCTdluw8zgGTBenSi7U?=
 =?us-ascii?Q?vaAAfxa0WN4nY7oDbsXh7hT3rlxyvc5W3qI9+dN8MRBsaNdge2nY2aWtEUxL?=
 =?us-ascii?Q?WSU+CUeivy4Go3/8PSnqHTT8sK2DMBpmXng6Zptqc2hko6slB7Tygz/uAOdx?=
 =?us-ascii?Q?LkOIC8+rqOUihpS1H9AnRxEJEAd6ORQOr9kHbiWBS2JXypaSmCXlrpQFG59F?=
 =?us-ascii?Q?SEJ4Q1+iioj90ViGI3hywQDDCbyW/wcIT83pYagLwKs5njfsVzdqfFhgwm/Z?=
 =?us-ascii?Q?WHyJSh4VBr7hD6C3d2uTuXy/HHP24z4Rc3NdGZVOwBF4cum7WpxGjFjhAQ4Z?=
 =?us-ascii?Q?gUl9Bw6et0JvZV9d7SrDkZ6r2QyHb7u4a9+Y5gpWaBExn0F8J/BkQSIympEr?=
 =?us-ascii?Q?xyzOtOhMXHHaBPvYFWsctLQ5/AX0CCviCI8EjQpWgbP69h0jBwq8PKXlm2MU?=
 =?us-ascii?Q?ct12pT+4JYIOm7mQ5FNobDrjsPNU3YYtUY5vHGQO7gVe2szFdZ4kEIDMLJIL?=
 =?us-ascii?Q?CNCHGrGKhR6wNvPktQNswDurpdpX6c7awBDzXXz9Nyod67Si5taKwmx7BDEw?=
 =?us-ascii?Q?QIH8WOhiiy03hEsiEQaeYTaP1OHKqQl4zBURea3uP1hHPSLTK8OgeRQzKOef?=
 =?us-ascii?Q?YGfFWpvN9w9Hv7kaQyzG38D04Z3Vb5pRWStWF0EhkPBEVgngOtC3veaoVVMS?=
 =?us-ascii?Q?v7ofF5T0ctFkkcraVrHnT9F7N0PxV8dj5bAF7jQlJtrqefQH3P4za9JNtQ+G?=
 =?us-ascii?Q?53R+YX0p5fx+USgmZ4BqWRmynFGAZgWkpDgetD0Oxv/2BtOt0WMV1WanC80d?=
 =?us-ascii?Q?fkDimcQ0m6o6WLu37ZeOnu7+29aa9dNTXfX1Ro0wsj7dwkmC8sKRUoDuxB3g?=
 =?us-ascii?Q?Gc9kI3+znldX5igoxRQq13MR3rdBCpO4gbm+u5qkL+qjjVf3MHqQ16sfVvY7?=
 =?us-ascii?Q?AmipDrGjpxyLstvYUMOJCduROtGTIt0ksIcLRlX8uS9nq9bJ1CpH+UIshqno?=
 =?us-ascii?Q?AVjEsy/6H3aqVrl8ah5+S5Smk3VzDuuEHwSb9L4mqklq56FMqb4FSS11zABE?=
 =?us-ascii?Q?YMGuQkmbMg55d3cEI/cc3mhafg64DDV11ulNP9ZyzbQnAxnVjcRVu2wxbIhf?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2e6d43-dd1b-44aa-c72d-08db8d04b1f6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 11:45:51.1672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8irmGEXABnKVPqxZbz7FKy7vAKsCnuft5tRyumH52r2G4vWH+PQDY2N8lPjXfTjkGD7WQYSwkpT7x4lgVBlqFflUC+NXgEO/Y7VpP1dXsHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7360
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/mtl: Map PPGTT as CPU:WC
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

On Mon, Jul 24, 2023 at 05:34:34PM -0700, Matt Roper wrote:
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
>v2:
> - Rename to XE_BO_PAGETABLE to make it more clear that this BO is the
>   pagetable itself, rather than just being bound in the PPGTT.  (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c | 17 +++++++++++++----
> drivers/gpu/drm/xe/xe_bo.h |  1 +
> drivers/gpu/drm/xe/xe_pt.c |  3 ++-
> 3 files changed, 16 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 538501c46b8b..10858fcf4f62 100644
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

trailing newline here

>+	 */
>+	if (bo->flags & XE_BO_SCANOUT_BIT ||
>+	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PAGETABLE))
>+		caching = ttm_write_combined;
>+
>+	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
> 	if (err) {
> 		kfree(tt);
> 		return NULL;
>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>index 72c68facd481..43ddfa998141 100644
>--- a/drivers/gpu/drm/xe/xe_bo.h
>+++ b/drivers/gpu/drm/xe/xe_bo.h
>@@ -31,6 +31,7 @@
> #define XE_BO_DEFER_BACKING		BIT(9)
> #define XE_BO_SCANOUT_BIT		BIT(10)
> #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
>+#define XE_BO_PAGETABLE			BIT(12)

What do you think about a followup patch to bring the names back to
consistency?

Remove _BIT suffix and use XE_BO_CREATE as namespace.

#define XE_BO_CREATE_USER			BIT(0)
/* The bits below need to be contiguous, or things break */
#define XE_BO_CREATE_SYSTEM			BIT(1)
#define XE_BO_CREATE_VRAM0			BIT(2)
#define XE_BO_CREATE_VRAM1			BIT(3)
#define XE_BO_CREATE_VRAM_MASK          	(XE_BO_CREATE_VRAM0 | \
                                         	 XE_BO_CREATE_VRAM1)

#define XE_BO_CREATE_STOLEN			BIT(4)
#define XE_BO_CREATE_VRAM_IF_DGFX(tile) \
         (IS_DGFX(tile_to_xe(tile)) ? XE_BO_CREATE_VRAM0 << (tile)->id : \
          XE_BO_CREATE_SYSTEM)
#define XE_BO_CREATE_GGTT			BIT(5)
#define XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE	BIT(6)
#define XE_BO_CREATE_PINNED			BIT(7)
#define XE_BO_CREATE_NO_RESV_EVICT		BIT(8)
#define XE_BO_CREATE_DEFER_BACKING		BIT(9)
#define XE_BO_CREATE_SCANOUT			BIT(10)
#define XE_BO_CREATE_FIXED_PLACEMENT		BIT(11)
#define XE_BO_CREATE_PAGETABLE			BIT(12)
/* this one is trigger internally only */
#define XE_BO_CREATE_INTERNAL_TEST		BIT(30)
#define XE_BO_CREATE_INTERNAL_64K		BIT(31)

Up to you if XE_BO_CREATE_PAGETABLE would already be named so in this
patch.

with the newline fix,

	
	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

> /* this one is trigger internally only */
> #define XE_BO_INTERNAL_TEST		BIT(30)
> #define XE_BO_INTERNAL_64K		BIT(31)
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index bbc319fba9e8..d4660520ac2c 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -221,7 +221,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> 				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> 				  XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
> 				  XE_BO_CREATE_PINNED_BIT |
>-				  XE_BO_CREATE_NO_RESV_EVICT);
>+				  XE_BO_CREATE_NO_RESV_EVICT |
>+				  XE_BO_PAGETABLE);
> 	if (IS_ERR(bo)) {
> 		err = PTR_ERR(bo);
> 		goto err_kfree;
>-- 
>2.41.0
>
