Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E50EB8FDE
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 14:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FF510E685;
	Wed,  6 Sep 2023 14:38:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31A310E684
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 14:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694011109; x=1725547109;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mbQDdKhh9eKliHmkg+NdeuB9BAfP0L0D4LeucWG+3Fk=;
 b=Adr+u+q3IvCgM8+2garKItcTWIQTMFmHz1ZPeI5SVQaoMNl2uIHnIgz8
 y5oBJUdLmapExluTeODVuqQubMxeg4Z6txF0neifICLotn8O4Ut/3lSst
 6xqhlVWi7/dzIfayDyGmvjkgy9AgYwawj6sIqqdah+4N06BNTx0DvEqr1
 XQ8BTFTciCIFow54ML7e1Rl37ssdNcwRh+vaU9Ck77YqN/D0fNCuUudFs
 D5kH+YYfcVuz/ZMNuslvz8O5GGFIxMRW8Phtpb31JzCZe8dfeuCqaq/s1
 HDMF8gf45Gf+9z+IXtUzRQPcMgUMTBoxSbveNQHAU9Ssl8Yvi2Afwq5AS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356566714"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="356566714"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 07:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="807037388"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="807037388"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 07:38:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 07:38:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 07:38:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 07:38:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUhgxlf1JSNTKG4jw/MQ4rXSk2kicoVQ3gDAPfOS++uv+YWy7uJzP/Hq1d6xa7bh61AUrN9+yiPNntPbToaEwZQh0xq57L9w9CG3z8DXqyhwQUxsCgXhHur2/DbmykaGIw6ZcLKk/GDWKBeOe7gWMg9Q93kJ+QhCwfPUixrIWurFHm3+0GP2OhFvDDsYmZLOHtwaZwzjcnAX3a90WV1COJZ87lEB98pyFNiM7fsdddr02h4dOTqovEb70OHjcBd6v4+6ymmNWzr3f4o2w9PqN7ve5kQ9ZuU5db72WLn+RNvSSpdkFhi2bR6doIFzshY7acQDvt6EF2/ZPTcAHJsPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0mQpxAyCj4bg+qCv75TsC2uDZjdKrFVV90qcV7x8ts=;
 b=k571i2QN8Q4fqtuEKRp/jBhJQBvPgSWAuWhVQl7BP+RiXmIiINKFoaKkdOJ4zqNaWfcSheG7U0uHKrXqXPx+kQ4P0IAJWTcVa8KNgy+Hz+yJ8i1ALgFnN3QIDgxy5XQGjEVuMlC2Du4d/ynm62boSkBmSSKOXjEYBp6H0CgnjuYc+2JnRRIgJxT/KQhxTWeiHs8pg29NCBUbb/912ZVIMbZBEQpF2iDYkk6zJ0lQ/qYucgdKZojTVZVw8dqETwMj61E6qfXLpMaq3AjssiP7agMZ4qoQBYRpqHoWFIB/uEY2zxH4nHYSkpWNSTR9AqXr5mXRk9//2CP69Mb+eo/DvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 14:38:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 14:38:16 +0000
Date: Wed, 6 Sep 2023 10:38:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZPiO1Lqt5bys/VPz@intel.com>
References: <20230830123722.6-1-francois.dugast@intel.com>
 <20230830123722.6-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230830123722.6-4-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:a03:60::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ab5bdf-b12e-4557-1221-08dbaee6e809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16P9UMYa1ro7UhEisZ7Rk/mBe7SkY45TgJXqdvooxaWuT6xpU1QRM7vJh6ifbyge5BaeuQOnhsMy1dYIOhBUPdPvOmii5wkKn8tRjhS5kRM3sICgrP4bcSChRQ1LidMVQI3CdQ6GlhnOed29tJgYew9tJjqvuTTydlIbjAOgmbUkrRv/pjkcM12465Qxhyl+ME58P5M486Z0/8NvSbeCKjqViU0rN3TY1n0UWXFNvt8+B0Iet6zCJWoFZoFJMmt2wZbX4tPo3UVwr4S6xA/5rE5I5aH3UrcK1W/411BPyPgYMf21oCZU1/R7fs6vhvXpvom/kcNMT6F9lLUB7wNxSyweUqybiGC0EaWQlIl+/UfUNTwRcJnr5sFqsLTJo9MWWZN+fr+hCKza/MhhH2J8/7q649gvolnRjmcsF+IKf+DANozxJm86US6TMbYhK7uzicNUze3U6PfA2Pu6pDkNHOLK/tcQ5bmUBGon/NpSfFWAbNOTtTtx4W9M07OWYsGHICR/+QgnJnf1hV90hqdoyCRY7dcd10cK6WVok0VlNI6FaAzlRc5XMJryXNCf0ABw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199024)(186009)(1800799009)(6486002)(6506007)(6666004)(6512007)(478600001)(83380400001)(2906002)(26005)(66476007)(41300700001)(6636002)(44832011)(37006003)(66556008)(30864003)(316002)(66946007)(4326008)(5660300002)(8676002)(6862004)(2616005)(82960400001)(36756003)(86362001)(38100700002)(8936002)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A4b0UDmWXBO5BmCeoGe1n7s230SG7haiQUgqViLdQECmHeMbmlzbo7Xm2Fwe?=
 =?us-ascii?Q?i8SI07TqIYJCPjCVmboNmvESTcW/6fAyM4N0GerxbcxOqbIGljepz13CLta1?=
 =?us-ascii?Q?5yjqsOBIiUHbRhMhjb6Vaj/lhXTTDu/sS6N5jhCuONNXaExPEGwcK12p63pw?=
 =?us-ascii?Q?3utIL//kAoTdU4N8T0GU9uKHtXvbFLjaGhEyjzHrxsXXmy2FJppV321Mo57k?=
 =?us-ascii?Q?2AhOkYCwwzySPQS2i2kEsQIw6cAAcU377boPI21u8ItAdoH8orMv94YYVVMX?=
 =?us-ascii?Q?tLQ28HHSBF/WSNSRmIcMQpBlhrsnJseYi/iKGGOTUEJty172m1H9hTKcf0Rw?=
 =?us-ascii?Q?kU7g/GyJ3I4BMEfguBXu7S/q4mCYTrUv1rz0ysrMQ9J6iqGBqHWo+TFy3poB?=
 =?us-ascii?Q?2L2s03wYEanWNG85lXBwUbkaOKmHDDz/JHC/xko984gkINTb1Jlg+H+qGuIO?=
 =?us-ascii?Q?8c28UznXxJew43HrM8kTSHNuh8FDpyquM7D43DMUeDNgPb5jcQfxl8JtqRKA?=
 =?us-ascii?Q?DyytGKEgu+2XyZUrFrKLmI9XLrjlwbTKQTzyZV+GzsgXIHoAXyesfGr5NIeF?=
 =?us-ascii?Q?59D5ob0SNnN2xMd9icdeHHgKvvMk3eTQLIyq5AxaD3kI7azz3ZEp1NAD3YZW?=
 =?us-ascii?Q?HT/A7B5vILOfOxwZ41oPc82N5ElShRP837rceC3hCvguc43E9SluPUZ6yjvD?=
 =?us-ascii?Q?QIudNQtd+13pF3qniyVu2gKSMRqiisObxj/7O7eEhfO3ej14d7DXBdFYxbDb?=
 =?us-ascii?Q?zLTPlGA1c9ny18t3A/NkpaUSmJaVenpfV6XE1qvxvLcf7TnAa5Q5h5l6wmab?=
 =?us-ascii?Q?CpHfZDHij8HE9tcVsbgxerZn0oXERRiP8UTVYn0+GDl4fs7AK2A5iGGEcw1u?=
 =?us-ascii?Q?p49weXxykR6cvXblhp2DXwOBeP2Qx9vDOo86DRApOZ5nOow6ySiuNRC9FxCT?=
 =?us-ascii?Q?DyxNn9VcjhzgAAs1M/0IY1KTMORK1ohILL2qwgTLWhsQXKAQO34abqbbV60D?=
 =?us-ascii?Q?wMuKxcaL6Eo2IfeXsiFRAZ2f9HzOWpFJXDVu4Z6NUhy10UXEbXoUUYjzvPt1?=
 =?us-ascii?Q?JcPht8Hndv4hrIRmWNx2J7jqW9zx00EIkMZh+kzDYu4iUC/FlzExlN6RjZz/?=
 =?us-ascii?Q?ceZz8/U3IsPsDE0F54Z7AQooAJMY/XTmc3nXwzirzlS4Jw9ixECAtDNshgL1?=
 =?us-ascii?Q?HGe6pFv61ul2lzjMvlJ1ukHeZ/fwPwNZeM93T0/UsoEDCD86fUWede57o2OV?=
 =?us-ascii?Q?t6Z205KvdhdSNscUGP1iW7YouYnMPt4q1tpNnEWC97rf7eZydsjVGd3NwlZ4?=
 =?us-ascii?Q?J32T8iNQr7za34qxYVldoq/wrL+wpjjgbkW/bCg/QYKslJSG5yYL/pYipgc3?=
 =?us-ascii?Q?mX9PC1lyN+6thX7rbhVRfYz6jIJBlMot2nNzV8DXfqDNrsQ5sKEC/Egry3Cf?=
 =?us-ascii?Q?kzu0FN5AkDfmcGe7RegCNHP3I/mAttLs9BuNoeaeRicpfQLnouwCm68ZiSnR?=
 =?us-ascii?Q?B+L4hVNBy+4syOdtGWOVj39xhVuE/NG0KpE00AhHVe6KtKZ5h34cvU9FuPgL?=
 =?us-ascii?Q?rG00xavvLqWHA+sgLgJsH24ibo/Qe2FmrySzmzaeVzz8ikZok3HrxUZc09cF?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ab5bdf-b12e-4557-1221-08dbaee6e809
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 14:38:16.7104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRuUPuDSM7O8GB1RfKtxTg771CvK1BqRDrDJ90f7s05OR2HXi/PNfGXnOOKRe9nxP0EsyamAnoE6z8HiAw2NHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Use Xe assert macros instead
 of XE_WARN_ON macro
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

On Wed, Aug 30, 2023 at 12:37:22PM +0000, Francois Dugast wrote:
> The XE_WARN_ON macro maps to WARN_ON which is not justified
> in many cases where only a simple debug check is needed.
> Replace the use of the XE_WARN_ON macro with the new xe_assert
> macros which relies on drm_*. This takes a struct drm_device
> argument, which is one of the main changes in this commit. The
> other main change is that the condition is reversed, as with
> XE_WARN_ON a message is displayed if the condition is true,
> whereas with xe_assert it is if the condition is false.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bb.c                  |  8 +--
>  drivers/gpu/drm/xe/xe_bo.c                  | 67 +++++++++++----------
>  drivers/gpu/drm/xe/xe_bo_evict.c            |  4 +-
>  drivers/gpu/drm/xe/xe_device.c              |  6 +-
>  drivers/gpu/drm/xe/xe_exec.c                |  2 +-
>  drivers/gpu/drm/xe/xe_execlist.c            | 12 ++--
>  drivers/gpu/drm/xe/xe_force_wake.c          |  4 +-
>  drivers/gpu/drm/xe/xe_force_wake.h          |  6 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                | 14 ++---
>  drivers/gpu/drm/xe/xe_gt.c                  |  1 +
>  drivers/gpu/drm/xe/xe_gt_clock.c            |  2 +-
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          |  2 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++--
>  drivers/gpu/drm/xe/xe_guc.c                 | 24 ++++----
>  drivers/gpu/drm/xe/xe_guc_ads.c             | 22 ++++---
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 29 ++++-----
>  drivers/gpu/drm/xe/xe_guc_log.c             |  4 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c              |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 65 ++++++++++++--------
>  drivers/gpu/drm/xe/xe_huc.c                 |  3 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c           | 11 ++--
>  drivers/gpu/drm/xe/xe_lrc.c                 |  9 +--
>  drivers/gpu/drm/xe/xe_migrate.c             | 31 +++++-----
>  drivers/gpu/drm/xe/xe_mocs.c                |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c                  | 14 ++---
>  drivers/gpu/drm/xe/xe_ring_ops.c            | 13 ++--
>  drivers/gpu/drm/xe/xe_sched_job.c           |  2 +-
>  drivers/gpu/drm/xe/xe_uc.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c               | 16 ++---
>  drivers/gpu/drm/xe/xe_vm.c                  | 56 ++++++++---------
>  drivers/gpu/drm/xe/xe_vm.h                  |  2 +-
>  drivers/gpu/drm/xe/xe_wopcm.c               | 18 +++---
>  32 files changed, 250 insertions(+), 215 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 1fbc2fcddc96..f871ba82bc9b 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -66,7 +66,7 @@ __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
>  
>  	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  
> -	WARN_ON(bb->len * 4 + bb_prefetch(q->gt) > size);
> +	xe_gt_assert(q->gt, bb->len * 4 + bb_prefetch(q->gt) <= size);
>  
>  	xe_sa_bo_flush_write(bb->bo);
>  
> @@ -84,8 +84,8 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
>  		4 * second_idx,
>  	};
>  
> -	XE_WARN_ON(second_idx > bb->len);
> -	XE_WARN_ON(!(q->vm->flags & XE_VM_FLAG_MIGRATION));
> +	xe_gt_assert(q->gt, second_idx <= bb->len);
> +	xe_gt_assert(q->gt, q->vm->flags & XE_VM_FLAG_MIGRATION);
>  
>  	return __xe_bb_create_job(q, bb, addr);
>  }
> @@ -95,7 +95,7 @@ struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  {
>  	u64 addr = xe_sa_bo_gpu_addr(bb->bo);
>  
> -	XE_WARN_ON(q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION);
> +	xe_gt_assert(q->gt, !(q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION));
>  	return __xe_bb_create_job(q, bb, &addr);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1ab682d61e3c..58cd93a67937 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -103,7 +103,7 @@ static bool xe_bo_is_user(struct xe_bo *bo)
>  static struct xe_tile *
>  mem_type_to_tile(struct xe_device *xe, u32 mem_type)
>  {
> -	XE_WARN_ON(mem_type != XE_PL_STOLEN && !mem_type_is_vram(mem_type));
> +	xe_assert(xe, mem_type == XE_PL_STOLEN || mem_type_is_vram(mem_type));
>  
>  	return &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
>  }
> @@ -142,7 +142,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>  	struct ttm_place place = { .mem_type = mem_type };
>  	u64 io_size = tile->mem.vram.io_size;
>  
> -	XE_WARN_ON(!tile->mem.vram.usable_size);
> +	xe_assert(xe, tile->mem.vram.usable_size);
>  
>  	/*
>  	 * For eviction / restore on suspend / resume objects
> @@ -541,10 +541,11 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
>  	struct dma_buf_attachment *attach = ttm_bo->base.import_attach;
>  	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
>  					       ttm);
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>  	struct sg_table *sg;
>  
> -	XE_WARN_ON(!attach);
> -	XE_WARN_ON(!ttm_bo->ttm);
> +	xe_assert(xe, attach);
> +	xe_assert(xe, ttm_bo->ttm);
>  
>  	if (new_res->mem_type == XE_PL_SYSTEM)
>  		goto out;
> @@ -706,8 +707,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	else if (mem_type_is_vram(old_mem_type))
>  		tile = mem_type_to_tile(xe, old_mem_type);
>  
> -	XE_WARN_ON(!tile);
> -	XE_WARN_ON(!tile->migrate);
> +	xe_assert(xe, tile);
> +	xe_tile_assert(tile, tile->migrate);
>  
>  	trace_xe_bo_move(bo);
>  	xe_device_mem_access_get(xe);
> @@ -737,7 +738,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  					goto out;
>  				}
>  
> -				XE_WARN_ON(new_mem->start !=
> +				xe_assert(xe, new_mem->start ==
>  					  bo->placements->fpfn);
>  
>  				iosys_map_set_vaddr_iomem(&bo->vmap, new_addr);
> @@ -936,9 +937,10 @@ static void __xe_bo_vunmap(struct xe_bo *bo);
>   */
>  static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>  {
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>  	bool locked;
>  
> -	XE_WARN_ON(kref_read(&ttm_bo->kref));
> +	xe_assert(xe, !kref_read(&ttm_bo->kref));
>  
>  	/*
>  	 * We can typically only race with TTM trylocking under the
> @@ -949,7 +951,7 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>  	spin_lock(&ttm_bo->bdev->lru_lock);
>  	locked = dma_resv_trylock(ttm_bo->base.resv);
>  	spin_unlock(&ttm_bo->bdev->lru_lock);
> -	XE_WARN_ON(!locked);
> +	xe_assert(xe, locked);
>  
>  	return locked;
>  }
> @@ -965,7 +967,7 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  		return;
>  
>  	bo = ttm_to_xe_bo(ttm_bo);
> -	XE_WARN_ON(bo->created && kref_read(&ttm_bo->base.refcount));
> +	xe_assert(xe_bo_device(bo), !(bo->created && kref_read(&ttm_bo->base.refcount)));
>  
>  	/*
>  	 * Corner case where TTM fails to allocate memory and this BOs resv
> @@ -1038,12 +1040,13 @@ struct ttm_device_funcs xe_ttm_funcs = {
>  static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  {
>  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>  
>  	if (bo->ttm.base.import_attach)
>  		drm_prime_gem_destroy(&bo->ttm.base, NULL);
>  	drm_gem_object_release(&bo->ttm.base);
>  
> -	WARN_ON(!list_empty(&bo->vmas));
> +	xe_assert(xe, list_empty(&bo->vmas));
>  
>  	if (bo->ggtt_node.size)
>  		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
> @@ -1081,7 +1084,7 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  	if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
>  		struct ww_acquire_ctx ww;
>  
> -		XE_WARN_ON(!xe_bo_is_user(bo));
> +		xe_assert(xe_bo_device(bo), xe_bo_is_user(bo));
>  
>  		xe_bo_lock(bo, &ww, 0, false);
>  		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> @@ -1197,7 +1200,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	int err;
>  
>  	/* Only kernel objects should set GT */
> -	XE_WARN_ON(tile && type != ttm_bo_type_kernel);
> +	xe_assert(xe, !tile || type == ttm_bo_type_kernel);
>  
>  	if (XE_WARN_ON(!size)) {
>  		xe_bo_free(bo);
> @@ -1346,7 +1349,7 @@ xe_bo_create_locked_range(struct xe_device *xe,
>  		if (!tile && flags & XE_BO_CREATE_STOLEN_BIT)
>  			tile = xe_device_get_root_tile(xe);
>  
> -		XE_WARN_ON(!tile);
> +		xe_assert(xe, tile);
>  
>  		if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
>  			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
> @@ -1477,8 +1480,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
>  	struct xe_device *xe = xe_bo_device(bo);
>  	int err;
>  
> -	XE_WARN_ON(bo->vm);
> -	XE_WARN_ON(!xe_bo_is_user(bo));
> +	xe_assert(xe, !bo->vm);
> +	xe_assert(xe, xe_bo_is_user(bo));
>  
>  	if (!xe_bo_is_pinned(bo)) {
>  		err = xe_bo_validate(bo, NULL, false);
> @@ -1510,20 +1513,20 @@ int xe_bo_pin(struct xe_bo *bo)
>  	int err;
>  
>  	/* We currently don't expect user BO to be pinned */
> -	XE_WARN_ON(xe_bo_is_user(bo));
> +	xe_assert(xe, !xe_bo_is_user(bo));
>  
>  	/* Pinned object must be in GGTT or have pinned flag */
> -	XE_WARN_ON(!(bo->flags & (XE_BO_CREATE_PINNED_BIT |
> -				 XE_BO_CREATE_GGTT_BIT)));
> +	xe_assert(xe, bo->flags & (XE_BO_CREATE_PINNED_BIT |
> +				   XE_BO_CREATE_GGTT_BIT));
>  
>  	/*
>  	 * No reason we can't support pinning imported dma-bufs we just don't
>  	 * expect to pin an imported dma-buf.
>  	 */
> -	XE_WARN_ON(bo->ttm.base.import_attach);
> +	xe_assert(xe, !bo->ttm.base.import_attach);
>  
>  	/* We only expect at most 1 pin */
> -	XE_WARN_ON(xe_bo_is_pinned(bo));
> +	xe_assert(xe, !xe_bo_is_pinned(bo));
>  
>  	err = xe_bo_validate(bo, NULL, false);
>  	if (err)
> @@ -1539,7 +1542,7 @@ int xe_bo_pin(struct xe_bo *bo)
>  		struct ttm_place *place = &(bo->placements[0]);
>  
>  		if (mem_type_is_vram(place->mem_type)) {
> -			XE_WARN_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
> +			xe_assert(xe, place->flags & TTM_PL_FLAG_CONTIGUOUS);
>  
>  			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
>  				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
> @@ -1576,9 +1579,9 @@ void xe_bo_unpin_external(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  
> -	XE_WARN_ON(bo->vm);
> -	XE_WARN_ON(!xe_bo_is_pinned(bo));
> -	XE_WARN_ON(!xe_bo_is_user(bo));
> +	xe_assert(xe, !bo->vm);
> +	xe_assert(xe, xe_bo_is_pinned(bo));
> +	xe_assert(xe, xe_bo_is_user(bo));
>  
>  	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link)) {
>  		spin_lock(&xe->pinned.lock);
> @@ -1599,15 +1602,15 @@ void xe_bo_unpin(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  
> -	XE_WARN_ON(bo->ttm.base.import_attach);
> -	XE_WARN_ON(!xe_bo_is_pinned(bo));
> +	xe_assert(xe, !bo->ttm.base.import_attach);
> +	xe_assert(xe, xe_bo_is_pinned(bo));
>  
>  	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
>  	    bo->flags & XE_BO_INTERNAL_TEST)) {
>  		struct ttm_place *place = &(bo->placements[0]);
>  
>  		if (mem_type_is_vram(place->mem_type)) {
> -			XE_WARN_ON(list_empty(&bo->pinned_link));
> +			xe_assert(xe, !list_empty(&bo->pinned_link));
>  
>  			spin_lock(&xe->pinned.lock);
>  			list_del_init(&bo->pinned_link);
> @@ -1668,15 +1671,16 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
>   */
>  dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
>  {
> +	struct xe_device *xe = xe_bo_device(bo);
>  	struct xe_res_cursor cur;
>  	u64 page;
>  
> -	XE_WARN_ON(page_size > PAGE_SIZE);
> +	xe_assert(xe, page_size <= PAGE_SIZE);
>  	page = offset >> PAGE_SHIFT;
>  	offset &= (PAGE_SIZE - 1);
>  
>  	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> -		XE_WARN_ON(!bo->ttm.ttm);
> +		xe_assert(xe, bo->ttm.ttm);
>  
>  		xe_res_first_sg(xe_bo_get_sg(bo), page << PAGE_SHIFT,
>  				page_size, &cur);
> @@ -1866,11 +1870,12 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
>  	       int num_resv, bool intr)
>  {
> +	struct xe_device *xe = xe_bo_device(bo);
>  	struct ttm_validate_buffer tv_bo;
>  	LIST_HEAD(objs);
>  	LIST_HEAD(dups);
>  
> -	XE_WARN_ON(!ww);
> +	xe_assert(xe, ww);
>  
>  	tv_bo.num_shared = num_resv;
>  	tv_bo.bo = &bo->ttm;
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 0d5c3a208ab4..090e18139575 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -160,8 +160,8 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>  		 * We expect validate to trigger a move VRAM and our move code
>  		 * should setup the iosys map.
>  		 */
> -		XE_WARN_ON(iosys_map_is_null(&bo->vmap));
> -		XE_WARN_ON(!xe_bo_is_vram(bo));
> +		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
> +		xe_assert(xe, xe_bo_is_vram(bo));
>  
>  		xe_bo_put(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 766df07de979..2a898473bd75 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -442,7 +442,7 @@ bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
>  	if (active) {
>  		int ref = atomic_inc_return(&xe->mem_access.ref);
>  
> -		XE_WARN_ON(ref == S32_MAX);
> +		xe_assert(xe, ref != S32_MAX);
>  	}
>  
>  	return active;
> @@ -484,7 +484,7 @@ void xe_device_mem_access_get(struct xe_device *xe)
>  	xe_pm_runtime_get(xe);
>  	ref = atomic_inc_return(&xe->mem_access.ref);
>  
> -	XE_WARN_ON(ref == S32_MAX);
> +	xe_assert(xe, ref != S32_MAX);
>  
>  }
>  
> @@ -498,5 +498,5 @@ void xe_device_mem_access_put(struct xe_device *xe)
>  	ref = atomic_dec_return(&xe->mem_access.ref);
>  	xe_pm_runtime_put(xe);
>  
> -	XE_WARN_ON(ref < 0);
> +	xe_assert(xe, ref >= 0);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 8a5b614df090..91c2b9baab07 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -121,7 +121,7 @@ static int xe_exec_begin(struct xe_exec_queue *q, struct ww_acquire_ctx *ww,
>  	 * to a location where the GPU can access it).
>  	 */
>  	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> -		XE_WARN_ON(xe_vma_is_null(vma));
> +		xe_assert(vm->xe, !xe_vma_is_null(vma));
>  
>  		if (xe_vma_is_userptr(vma))
>  			continue;
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index a4757817b1ac..ec33d57c60aa 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -12,6 +12,7 @@
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "regs/xe_regs.h"
> +#include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> @@ -50,10 +51,10 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  	lrc_desc = xe_lrc_descriptor(lrc);
>  
>  	if (GRAPHICS_VERx100(xe) >= 1250) {
> -		XE_WARN_ON(!FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
> +		xe_gt_assert(hwe->gt, FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
>  		lrc_desc |= FIELD_PREP(XEHP_SW_CTX_ID, ctx_id);
>  	} else {
> -		XE_WARN_ON(!FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
> +		xe_gt_assert(hwe->gt, FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
>  		lrc_desc |= FIELD_PREP(GEN11_SW_CTX_ID, ctx_id);
>  	}
>  
> @@ -321,7 +322,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	int err;
>  
> -	XE_WARN_ON(xe_device_guc_submission_enabled(xe));
> +	xe_assert(xe, !xe_device_guc_submission_enabled(xe));
>  
>  	drm_info(&xe->drm, "Enabling execlist submission (GuC submission disabled)\n");
>  
> @@ -369,9 +370,10 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
>  		container_of(w, struct xe_execlist_exec_queue, fini_async);
>  	struct xe_exec_queue *q = ee->q;
>  	struct xe_execlist_exec_queue *exl = q->execlist;
> +	struct xe_device *xe = gt_to_xe(q->gt);
>  	unsigned long flags;
>  
> -	XE_WARN_ON(xe_device_guc_submission_enabled(gt_to_xe(q->gt)));
> +	xe_assert(xe, !xe_device_guc_submission_enabled(xe));
>  
>  	spin_lock_irqsave(&exl->port->lock, flags);
>  	if (WARN_ON(exl->active_priority != DRM_SCHED_PRIORITY_UNSET))
> @@ -379,7 +381,7 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
>  	spin_unlock_irqrestore(&exl->port->lock, flags);
>  
>  	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
> -		xe_device_remove_persistent_exec_queues(gt_to_xe(q->gt), q);
> +		xe_device_remove_persistent_exec_queues(xe, q);
>  	drm_sched_entity_fini(&exl->entity);
>  	drm_sched_fini(&exl->sched);
>  	kfree(exl);
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index ef7279e0b006..ed2ecb20ce8e 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -45,7 +45,7 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  	mutex_init(&fw->lock);
>  
>  	/* Assuming gen11+ so assert this assumption is correct */
> -	XE_WARN_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
> +	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>  
>  	if (xe->info.graphics_verx100 >= 1270) {
>  		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> @@ -67,7 +67,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  	int i, j;
>  
>  	/* Assuming gen11+ so assert this assumption is correct */
> -	XE_WARN_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
> +	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>  
>  	if (!xe_gt_is_media_type(gt))
>  		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 7f304704190e..83cb157da7cc 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -6,8 +6,8 @@
>  #ifndef _XE_FORCE_WAKE_H_
>  #define _XE_FORCE_WAKE_H_
>  
> +#include "xe_assert.h"
>  #include "xe_force_wake_types.h"
> -#include "xe_macros.h"
>  
>  struct xe_gt;
>  
> @@ -24,7 +24,7 @@ static inline int
>  xe_force_wake_ref(struct xe_force_wake *fw,
>  		  enum xe_force_wake_domains domain)
>  {
> -	XE_WARN_ON(!domain);
> +	xe_gt_assert(fw->gt, domain);
>  	return fw->domains[ffs(domain) - 1].ref;
>  }
>  
> @@ -32,7 +32,7 @@ static inline void
>  xe_force_wake_assert_held(struct xe_force_wake *fw,
>  			  enum xe_force_wake_domains domain)
>  {
> -	XE_WARN_ON(!(fw->awake_domains & domain));
> +	xe_gt_assert(fw->gt, fw->awake_domains & domain);
>  }
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 3ce2dce844b9..2f81aede1156 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -58,8 +58,8 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
> -	XE_WARN_ON(addr & XE_PTE_MASK);
> -	XE_WARN_ON(addr >= ggtt->size);
> +	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> +	xe_tile_assert(ggtt->tile, addr < ggtt->size);
>  
>  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>  }
> @@ -69,7 +69,7 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  	u64 end = start + size - 1;
>  	u64 scratch_pte;
>  
> -	XE_WARN_ON(start >= end);
> +	xe_tile_assert(ggtt->tile, start < end);
>  
>  	if (ggtt->scratch)
>  		scratch_pte = xe_ggtt_pte_encode(ggtt->scratch, 0);
> @@ -230,7 +230,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  		int seqno;
>  
>  		seqno = xe_gt_tlb_invalidation_guc(gt);
> -		XE_WARN_ON(seqno <= 0);
> +		xe_gt_assert(gt, seqno > 0);
>  		if (seqno > 0)
>  			xe_gt_tlb_invalidation_wait(gt, seqno);
>  	} else if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
> @@ -266,7 +266,7 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
>  	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
>  		unsigned int i = addr / XE_PAGE_SIZE;
>  
> -		XE_WARN_ON(addr > U32_MAX);
> +		xe_tile_assert(ggtt->tile, addr <= U32_MAX);
>  		if (ggtt->gsm[i] == scratch_pte)
>  			continue;
>  
> @@ -319,7 +319,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  
>  	if (XE_WARN_ON(bo->ggtt_node.size)) {
>  		/* Someone's already inserted this BO in the GGTT */
> -		XE_WARN_ON(bo->ggtt_node.size != bo->size);
> +		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
>  		return 0;
>  	}
>  
> @@ -371,7 +371,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  		return;
>  
>  	/* This BO is not currently in the GGTT */
> -	XE_WARN_ON(bo->ggtt_node.size != bo->size);
> +	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
>  
>  	xe_ggtt_remove_node(ggtt, &bo->ggtt_node);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3d6a7c11bac1..69e6fbb5358d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -11,6 +11,7 @@
>  #include <drm/xe_drm.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "xe_assert.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 2f77b8bbcf53..9136937324f3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -58,7 +58,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  	u32 freq = 0;
>  
>  	/* Assuming gen11+ so assert this assumption is correct */
> -	XE_WARN_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
> +	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>  
>  	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
>  		freq = read_reference_ts_freq(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 9229fd5b01cc..ec1ae00f6bfc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -158,7 +158,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	char name[8];
>  	int i;
>  
> -	XE_WARN_ON(!minor->debugfs_root);
> +	xe_gt_assert(gt, minor->debugfs_root);
>  
>  	sprintf(name, "gt%d", gt->info.id);
>  	root = debugfs_create_dir(name, minor->debugfs_root);
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index bcbeea62d510..bd6005b9d498 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -250,7 +250,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  	u32 action[MAX_TLB_INVALIDATION_LEN];
>  	int len = 0;
>  
> -	XE_WARN_ON(!vma);
> +	xe_gt_assert(gt, vma);
>  
>  	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
>  	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
> @@ -288,10 +288,10 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  			start = ALIGN_DOWN(xe_vma_start(vma), length);
>  		}
>  
> -		XE_WARN_ON(length < SZ_4K);
> -		XE_WARN_ON(!is_power_of_2(length));
> -		XE_WARN_ON(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1));
> -		XE_WARN_ON(!IS_ALIGNED(start, length));
> +		xe_gt_assert(gt, length >= SZ_4K);
> +		xe_gt_assert(gt, is_power_of_2(length));
> +		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1)));
> +		xe_gt_assert(gt, IS_ALIGNED(start, length));
>  
>  		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
>  		action[len++] = xe_vma_vm(vma)->usm.asid;
> @@ -300,7 +300,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  		action[len++] = ilog2(length) - ilog2(SZ_4K);
>  	}
>  
> -	XE_WARN_ON(len > MAX_TLB_INVALIDATION_LEN);
> +	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
>  
>  	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e102637c0695..508da27e5f9a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -41,11 +41,12 @@ guc_to_xe(struct xe_guc *guc)
>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  			    struct xe_bo *bo)
>  {
> +	struct xe_device *xe = guc_to_xe(guc);
>  	u32 addr = xe_bo_ggtt_addr(bo);
>  
> -	XE_WARN_ON(addr < xe_wopcm_size(guc_to_xe(guc)));
> -	XE_WARN_ON(addr >= GUC_GGTT_TOP);
> -	XE_WARN_ON(bo->size > GUC_GGTT_TOP - addr);
> +	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
> +	xe_assert(xe, addr < GUC_GGTT_TOP);
> +	xe_assert(xe, bo->size <= GUC_GGTT_TOP - addr);
>  
>  	return addr;
>  }
> @@ -612,13 +613,13 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>  
> -	XE_WARN_ON(guc->ct.enabled);
> -	XE_WARN_ON(!len);
> -	XE_WARN_ON(len > VF_SW_FLAG_COUNT);
> -	XE_WARN_ON(len > MED_VF_SW_FLAG_COUNT);
> -	XE_WARN_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) !=
> +	xe_assert(xe, !guc->ct.enabled);
> +	xe_assert(xe, len);
> +	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
> +	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> +	xe_assert(xe, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) ==
>  		  GUC_HXG_ORIGIN_HOST);
> -	XE_WARN_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) !=
> +	xe_assert(xe, FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) ==
>  		  GUC_HXG_TYPE_REQUEST);
>  
>  retry:
> @@ -710,6 +711,7 @@ int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
>  
>  static int guc_self_cfg(struct xe_guc *guc, u16 key, u16 len, u64 val)
>  {
> +	struct xe_device *xe = guc_to_xe(guc);
>  	u32 request[HOST2GUC_SELF_CFG_REQUEST_MSG_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> @@ -724,8 +726,8 @@ static int guc_self_cfg(struct xe_guc *guc, u16 key, u16 len, u64 val)
>  	};
>  	int ret;
>  
> -	XE_WARN_ON(len > 2);
> -	XE_WARN_ON(len == 1 && upper_32_bits(val));
> +	xe_assert(xe, len <= 2);
> +	xe_assert(xe, len != 1 || !upper_32_bits(val));
>  
>  	/* Self config must go over MMIO */
>  	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 5edee24b97c9..efa4d25424b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -118,7 +118,9 @@ struct __guc_ads_blob {
>  
>  static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
>  {
> -	XE_WARN_ON(!ads->regset_size);
> +	struct xe_device *xe = ads_to_xe(ads);
> +
> +	xe_assert(xe, ads->regset_size);
>  
>  	return ads->regset_size;
>  }
> @@ -309,14 +311,14 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>  	struct xe_gt *gt = ads_to_gt(ads);
>  	u32 prev_regset_size = ads->regset_size;
>  
> -	XE_WARN_ON(!ads->bo);
> +	xe_gt_assert(gt, ads->bo);
>  
>  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>  	ads->regset_size = calculate_regset_size(gt);
>  
> -	XE_WARN_ON(ads->golden_lrc_size +
> -		   (ads->regset_size - prev_regset_size) >
> -		   MAX_GOLDEN_LRC_SIZE);
> +	xe_gt_assert(gt, ads->golden_lrc_size +
> +		     (ads->regset_size - prev_regset_size) <=
> +		     MAX_GOLDEN_LRC_SIZE);
>  
>  	return 0;
>  }
> @@ -517,7 +519,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
>  		regset_used += count * sizeof(struct guc_mmio_reg);
>  	}
>  
> -	XE_WARN_ON(regset_used > ads->regset_size);
> +	xe_gt_assert(gt, regset_used <= ads->regset_size);
>  }
>  
>  static void guc_um_init_params(struct xe_guc_ads *ads)
> @@ -572,7 +574,7 @@ void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads)
>  			offsetof(struct __guc_ads_blob, system_info));
>  	u32 base = xe_bo_ggtt_addr(ads->bo);
>  
> -	XE_WARN_ON(!ads->bo);
> +	xe_gt_assert(gt, ads->bo);
>  
>  	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
>  	guc_policies_init(ads);
> @@ -596,7 +598,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>  			offsetof(struct __guc_ads_blob, system_info));
>  	u32 base = xe_bo_ggtt_addr(ads->bo);
>  
> -	XE_WARN_ON(!ads->bo);
> +	xe_gt_assert(gt, ads->bo);
>  
>  	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
>  	guc_policies_init(ads);
> @@ -643,7 +645,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>  				   engine_enabled_masks[guc_class]))
>  			continue;
>  
> -		XE_WARN_ON(!gt->default_lrc[class]);
> +		xe_gt_assert(gt, gt->default_lrc[class]);
>  
>  		real_size = xe_lrc_size(xe, class);
>  		alloc_size = PAGE_ALIGN(real_size);
> @@ -672,7 +674,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>  		offset += alloc_size;
>  	}
>  
> -	XE_WARN_ON(total_size != ads->golden_lrc_size);
> +	xe_gt_assert(gt, total_size == ads->golden_lrc_size);
>  }
>  
>  void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 13f2bd586f6a..2046bd269bbd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -135,7 +135,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	struct xe_bo *bo;
>  	int err;
>  
> -	XE_WARN_ON(guc_ct_size() % PAGE_SIZE);
> +	xe_assert(xe, !(guc_ct_size() % PAGE_SIZE));
>  
>  	mutex_init(&ct->lock);
>  	spin_lock_init(&ct->fast_lock);
> @@ -283,7 +283,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	struct xe_device *xe = ct_to_xe(ct);
>  	int err;
>  
> -	XE_WARN_ON(ct->enabled);
> +	xe_assert(xe, !ct->enabled);
>  
>  	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
>  	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> @@ -376,7 +376,7 @@ static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
>  
>  static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>  {
> -	XE_WARN_ON(g2h_len > ct->ctbs.g2h.info.space);
> +	xe_assert(ct_to_xe(ct), g2h_len <= ct->ctbs.g2h.info.space);
>  
>  	if (g2h_len) {
>  		lockdep_assert_held(&ct->fast_lock);
> @@ -389,8 +389,8 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>  static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>  {
>  	lockdep_assert_held(&ct->fast_lock);
> -	XE_WARN_ON(ct->ctbs.g2h.info.space + g2h_len >
> -		   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
> +	xe_assert(ct_to_xe(ct), ct->ctbs.g2h.info.space + g2h_len <=
> +		  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
>  
>  	ct->ctbs.g2h.info.space += g2h_len;
>  	--ct->g2h_outstanding;
> @@ -419,8 +419,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	full_len = len + GUC_CTB_HDR_LEN;
>  
>  	lockdep_assert_held(&ct->lock);
> -	XE_WARN_ON(full_len > (GUC_CTB_MSG_MAX_LEN - GUC_CTB_HDR_LEN));
> -	XE_WARN_ON(tail > h2g->info.size);
> +	xe_assert(xe, full_len <= (GUC_CTB_MSG_MAX_LEN - GUC_CTB_HDR_LEN));
> +	xe_assert(xe, tail <= h2g->info.size);
>  
>  	/* Command will wrap, zero fill (NOPs), return and check credits again */
>  	if (tail + full_len > h2g->info.size) {
> @@ -476,12 +476,13 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				u32 len, u32 g2h_len, u32 num_g2h,
>  				struct g2h_fence *g2h_fence)
>  {
> +	struct xe_device *xe = ct_to_xe(ct);
>  	int ret;
>  
> -	XE_WARN_ON(g2h_len && g2h_fence);
> -	XE_WARN_ON(num_g2h && g2h_fence);
> -	XE_WARN_ON(g2h_len && !num_g2h);
> -	XE_WARN_ON(!g2h_len && num_g2h);
> +	xe_assert(xe, !g2h_len || !g2h_fence);
> +	xe_assert(xe, !num_g2h || !g2h_fence);
> +	xe_assert(xe, !g2h_len || num_g2h);
> +	xe_assert(xe, g2h_len || !num_g2h);
>  	lockdep_assert_held(&ct->lock);
>  
>  	if (unlikely(ct->ctbs.h2g.info.broken)) {
> @@ -552,7 +553,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	unsigned int sleep_period_ms = 1;
>  	int ret;
>  
> -	XE_WARN_ON(g2h_len && g2h_fence);
> +	xe_assert(ct_to_xe(ct), !g2h_len || !g2h_fence);
>  	lockdep_assert_held(&ct->lock);
>  	xe_device_assert_mem_access(ct_to_xe(ct));
>  
> @@ -622,7 +623,7 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  {
>  	int ret;
>  
> -	XE_WARN_ON(g2h_len && g2h_fence);
> +	xe_assert(ct_to_xe(ct), !g2h_len || !g2h_fence);
>  
>  	mutex_lock(&ct->lock);
>  	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> @@ -798,7 +799,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		return 0;
>  	}
>  
> -	XE_WARN_ON(fence != g2h_fence->seqno);
> +	xe_assert(xe, fence == g2h_fence->seqno);
>  
>  	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>  		g2h_fence->fail = true;
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 63904007af0a..45c60a9c631c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -55,12 +55,12 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  	size_t size;
>  	int i, j;
>  
> -	XE_WARN_ON(!log->bo);
> +	xe_assert(xe, log->bo);
>  
>  	size = log->bo->size;
>  
>  #define DW_PER_READ		128
> -	XE_WARN_ON(size % (DW_PER_READ * sizeof(u32)));
> +	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
>  	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
>  		u32 read[DW_PER_READ];
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index c03bb58e7049..ea454e6ac6d8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -816,7 +816,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>  	int ret;
>  
> -	XE_WARN_ON(!xe_device_guc_submission_enabled(xe));
> +	xe_gt_assert(gt, xe_device_guc_submission_enabled(xe));
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0a6c938ad3dc..e928a20ba0cb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_lrc_layout.h"
> +#include "xe_assert.h"
>  #include "xe_devcoredump.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> @@ -353,11 +354,12 @@ static const int drm_sched_prio_to_guc[] = {
>  static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
>  	struct exec_queue_policy policy;
> +	struct xe_device *xe = guc_to_xe(guc);
>  	enum drm_sched_priority prio = q->entity->priority;
>  	u32 timeslice_us = q->sched_props.timeslice_us;
>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>  
> -	XE_WARN_ON(!exec_queue_registered(q));
> +	xe_assert(xe, exec_queue_registered(q));
>  
>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>  	__guc_exec_queue_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
> @@ -391,11 +393,12 @@ static void __register_mlrc_engine(struct xe_guc *guc,
>  				   struct guc_ctxt_registration_info *info)
>  {
>  #define MAX_MLRC_REG_SIZE      (13 + XE_HW_ENGINE_MAX_INSTANCE * 2)
> +	struct xe_device *xe = guc_to_xe(guc);
>  	u32 action[MAX_MLRC_REG_SIZE];
>  	int len = 0;
>  	int i;
>  
> -	XE_WARN_ON(!xe_exec_queue_is_parallel(q));
> +	xe_assert(xe, xe_exec_queue_is_parallel(q));
>  
>  	action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
>  	action[len++] = info->flags;
> @@ -418,7 +421,7 @@ static void __register_mlrc_engine(struct xe_guc *guc,
>  		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
>  	}
>  
> -	XE_WARN_ON(len > MAX_MLRC_REG_SIZE);
> +	xe_assert(xe, len <= MAX_MLRC_REG_SIZE);
>  #undef MAX_MLRC_REG_SIZE
>  
>  	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
> @@ -452,7 +455,7 @@ static void register_engine(struct xe_exec_queue *q)
>  	struct xe_lrc *lrc = q->lrc;
>  	struct guc_ctxt_registration_info info;
>  
> -	XE_WARN_ON(exec_queue_registered(q));
> +	xe_assert(xe, !exec_queue_registered(q));
>  
>  	memset(&info, 0, sizeof(info));
>  	info.context_idx = q->guc->id;
> @@ -542,7 +545,7 @@ static int wq_noop_append(struct xe_exec_queue *q)
>  	if (wq_wait_for_space(q, wq_space_until_wrap(q)))
>  		return -ENODEV;
>  
> -	XE_WARN_ON(!FIELD_FIT(WQ_LEN_MASK, len_dw));
> +	xe_assert(xe, FIELD_FIT(WQ_LEN_MASK, len_dw));
>  
>  	parallel_write(xe, map, wq[q->guc->wqi_tail / sizeof(u32)],
>  		       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
> @@ -582,13 +585,13 @@ static void wq_item_append(struct xe_exec_queue *q)
>  		wqi[i++] = lrc->ring.tail / sizeof(u64);
>  	}
>  
> -	XE_WARN_ON(i != wqi_size / sizeof(u32));
> +	xe_assert(xe, i == wqi_size / sizeof(u32));
>  
>  	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
>  				      wq[q->guc->wqi_tail / sizeof(u32)]));
>  	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
>  	q->guc->wqi_tail += wqi_size;
> -	XE_WARN_ON(q->guc->wqi_tail > WQ_SIZE);
> +	xe_assert(xe, q->guc->wqi_tail <= WQ_SIZE);
>  
>  	xe_device_wmb(xe);
>  
> @@ -600,6 +603,7 @@ static void wq_item_append(struct xe_exec_queue *q)
>  static void submit_exec_queue(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_lrc *lrc = q->lrc;
>  	u32 action[3];
>  	u32 g2h_len = 0;
> @@ -607,7 +611,7 @@ static void submit_exec_queue(struct xe_exec_queue *q)
>  	int len = 0;
>  	bool extra_submit = false;
>  
> -	XE_WARN_ON(!exec_queue_registered(q));
> +	xe_assert(xe, exec_queue_registered(q));
>  
>  	if (xe_exec_queue_is_parallel(q))
>  		wq_item_append(q);
> @@ -653,10 +657,12 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>  	struct xe_exec_queue *q = job->q;
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>  	bool lr = xe_exec_queue_is_lr(q);
>  
> -	XE_WARN_ON((exec_queue_destroyed(q) || exec_queue_pending_disable(q)) &&
> -		   !exec_queue_banned(q) && !exec_queue_suspended(q));
> +	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> +		  exec_queue_banned(q) || exec_queue_suspended(q));
>  
>  	trace_xe_sched_job_run(job);
>  
> @@ -799,7 +805,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct drm_gpu_scheduler *sched = &ge->sched;
>  
> -	XE_WARN_ON(!xe_exec_queue_is_lr(q));
> +	xe_assert(xe, xe_exec_queue_is_lr(q));
>  	trace_xe_exec_queue_lr_cleanup(q);
>  
>  	/* Kill the run_job / process_msg entry points */
> @@ -853,8 +859,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	int i = 0;
>  
>  	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> -		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_KERNEL);
> -		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q));
> +		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
> +		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)));
>  
>  		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			   xe_sched_job_seqno(job), q->guc->id, q->flags);
> @@ -990,8 +996,9 @@ static void __guc_exec_queue_process_msg_cleanup(struct drm_sched_msg *msg)
>  {
>  	struct xe_exec_queue *q = msg->private_data;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>  
> -	XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_PERMANENT);
> +	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
>  	trace_xe_exec_queue_cleanup_entity(q);
>  
>  	if (exec_queue_registered(q))
> @@ -1018,10 +1025,11 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct drm_sched_msg *m
>  static void suspend_fence_signal(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>  
> -	XE_WARN_ON(!exec_queue_suspended(q) && !exec_queue_killed(q) &&
> -		   !guc_read_stopped(guc));
> -	XE_WARN_ON(!q->guc->suspend_pending);
> +	xe_assert(xe, exec_queue_suspended(q) || exec_queue_killed(q) ||
> +		  guc_read_stopped(guc));
> +	xe_assert(xe, q->guc->suspend_pending);
>  
>  	q->guc->suspend_pending = false;
>  	smp_wmb();
> @@ -1122,11 +1130,12 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct drm_gpu_scheduler *sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
>  	int err;
>  
> -	XE_WARN_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
> +	xe_assert(xe, xe_device_guc_submission_enabled(guc_to_xe(guc)));
>  
>  	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
>  	if (!ge)
> @@ -1272,10 +1281,12 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>  static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeout_ms)
>  {
>  	struct drm_gpu_scheduler *sched = &q->guc->sched;
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>  
> -	XE_WARN_ON(exec_queue_registered(q));
> -	XE_WARN_ON(exec_queue_banned(q));
> -	XE_WARN_ON(exec_queue_killed(q));
> +	xe_assert(xe, !exec_queue_registered(q));
> +	xe_assert(xe, !exec_queue_banned(q));
> +	xe_assert(xe, !exec_queue_killed(q));
>  
>  	sched->timeout = job_timeout_ms;
>  
> @@ -1306,8 +1317,10 @@ static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  {
>  	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>  
> -	XE_WARN_ON(q->guc->suspend_pending);
> +	xe_assert(xe, !q->guc->suspend_pending);
>  
>  	guc_exec_queue_add_msg(q, msg, RESUME);
>  }
> @@ -1406,8 +1419,9 @@ int xe_guc_submit_stop(struct xe_guc *guc)
>  {
>  	struct xe_exec_queue *q;
>  	unsigned long index;
> +	struct xe_device *xe = guc_to_xe(guc);
>  
> -	XE_WARN_ON(guc_read_stopped(guc) != 1);
> +	xe_assert(xe, guc_read_stopped(guc) == 1);
>  
>  	mutex_lock(&guc->submission_state.lock);
>  
> @@ -1445,8 +1459,9 @@ int xe_guc_submit_start(struct xe_guc *guc)
>  {
>  	struct xe_exec_queue *q;
>  	unsigned long index;
> +	struct xe_device *xe = guc_to_xe(guc);
>  
> -	XE_WARN_ON(guc_read_stopped(guc) != 1);
> +	xe_assert(xe, guc_read_stopped(guc) == 1);
>  
>  	mutex_lock(&guc->submission_state.lock);
>  	atomic_dec(&guc->submission_state.stopped);
> @@ -1476,7 +1491,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  		return NULL;
>  	}
>  
> -	XE_WARN_ON(q->guc->id != guc_id);
> +	xe_assert(xe, q->guc->id == guc_id);
>  
>  	return q;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 177cda14864e..c856da1e9422 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -6,6 +6,7 @@
>  #include "xe_huc.h"
>  
>  #include "regs/xe_guc_regs.h"
> +#include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -72,7 +73,7 @@ int xe_huc_auth(struct xe_huc *huc)
>  	if (xe_uc_fw_is_disabled(&huc->fw))
>  		return 0;
>  
> -	XE_WARN_ON(xe_uc_fw_is_running(&huc->fw));
> +	xe_assert(xe, !xe_uc_fw_is_running(&huc->fw));
>  
>  	if (!xe_uc_fw_is_loaded(&huc->fw))
>  		return -ENOEXEC;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index dd673a684b70..9c2e212fa4cf 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -10,6 +10,7 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
> +#include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_execlist.h"
> @@ -244,7 +245,7 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
>  static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
>  				   u32 val)
>  {
> -	XE_WARN_ON(reg.addr & hwe->mmio_base);
> +	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
>  
>  	reg.addr += hwe->mmio_base;
> @@ -254,7 +255,7 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
>  
>  static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
>  {
> -	XE_WARN_ON(reg.addr & hwe->mmio_base);
> +	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
>  
>  	reg.addr += hwe->mmio_base;
> @@ -374,7 +375,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  
>  	info = &engine_infos[id];
>  
> -	XE_WARN_ON(hwe->gt);
> +	xe_gt_assert(gt, !hwe->gt);
>  
>  	hwe->gt = gt;
>  	hwe->class = info->class;
> @@ -415,8 +416,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int err;
>  
> -	XE_WARN_ON(id >= ARRAY_SIZE(engine_infos) || !engine_infos[id].name);
> -	XE_WARN_ON(!(gt->info.engine_mask & BIT(id)));
> +	xe_gt_assert(gt, id < ARRAY_SIZE(engine_infos) && engine_infos[id].name);
> +	xe_gt_assert(gt, gt->info.engine_mask & BIT(id));
>  
>  	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>  	xe_reg_sr_apply_whitelist(hwe);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 2b4219c38359..07d84d7f691d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -116,7 +116,7 @@ static void set_offsets(u32 *regs,
>  		*regs |= MI_LRI_LRM_CS_MMIO;
>  		regs++;
>  
> -		XE_WARN_ON(!count);
> +		xe_gt_assert(hwe->gt, count);
>  		do {
>  			u32 offset = 0;
>  			u8 v;
> @@ -608,7 +608,7 @@ static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
>  { \
>  	struct iosys_map map = lrc->bo->vmap; \
>  \
> -	XE_WARN_ON(iosys_map_is_null(&map)); \
> +	xe_assert(lrc_to_xe(lrc), !iosys_map_is_null(&map));  \
>  	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
>  	return map; \
>  } \
> @@ -835,16 +835,17 @@ static void __xe_lrc_write_ring(struct xe_lrc *lrc, struct iosys_map ring,
>  
>  void xe_lrc_write_ring(struct xe_lrc *lrc, const void *data, size_t size)
>  {
> +	struct xe_device *xe = lrc_to_xe(lrc);
>  	struct iosys_map ring;
>  	u32 rhs;
>  	size_t aligned_size;
>  
> -	XE_WARN_ON(!IS_ALIGNED(size, 4));
> +	xe_assert(xe, IS_ALIGNED(size, 4));
>  	aligned_size = ALIGN(size, 8);
>  
>  	ring = __xe_lrc_ring_map(lrc);
>  
> -	XE_WARN_ON(lrc->ring.tail >= lrc->ring.size);
> +	xe_assert(xe, lrc->ring.tail < lrc->ring.size);
>  	rhs = lrc->ring.size - lrc->ring.tail;
>  	if (size > rhs) {
>  		__xe_lrc_write_ring(lrc, ring, data, rhs);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index a782ea282cb6..d0801f98e800 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -15,6 +15,7 @@
>  #include "generated/xe_wa_oob.h"
>  #include "regs/xe_gpu_commands.h"
>  #include "tests/xe_test.h"
> +#include "xe_assert.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_exec_queue.h"
> @@ -173,7 +174,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
>  
>  	/* Need to be sure everything fits in the first PT, or create more */
> -	XE_WARN_ON(m->batch_base_ofs + batch->size >= SZ_2M);
> +	xe_tile_assert(tile, m->batch_base_ofs + batch->size < SZ_2M);
>  
>  	bo = xe_bo_create_pin_map(vm->xe, tile, vm,
>  				  num_entries * XE_PAGE_SIZE,
> @@ -207,7 +208,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	}
>  
>  	if (!IS_DGFX(xe)) {
> -		XE_WARN_ON(xe->info.supports_usm);
> +		xe_tile_assert(tile, !xe->info.supports_usm);
>  
>  		/* Write out batch too */
>  		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
> @@ -489,7 +490,7 @@ static void emit_pte(struct xe_migrate *m,
>  				/* Is this a 64K PTE entry? */
>  				if ((m->q->vm->flags & XE_VM_FLAG_64K) &&
>  				    !(cur_ofs & (16 * 8 - 1))) {
> -					XE_WARN_ON(!IS_ALIGNED(addr, SZ_64K));
> +					xe_tile_assert(m->tile, IS_ALIGNED(addr, SZ_64K));
>  					addr |= XE_PTE_PS64;
>  				}
>  
> @@ -518,7 +519,7 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  
>  	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
>  				    NUM_CCS_BYTES_PER_BLOCK);
> -	XE_WARN_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER);
> +	xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
>  	*cs++ = XY_CTRL_SURF_COPY_BLT |
>  		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>  		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> @@ -538,9 +539,9 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>  		      u64 src_ofs, u64 dst_ofs, unsigned int size,
>  		      unsigned int pitch)
>  {
> -	XE_WARN_ON(size / pitch > S16_MAX);
> -	XE_WARN_ON(pitch / 4 > S16_MAX);
> -	XE_WARN_ON(pitch > U16_MAX);
> +	xe_gt_assert(gt, size / pitch <= S16_MAX);
> +	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
> +	xe_gt_assert(gt, pitch <= U16_MAX);
>  
>  	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
>  	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
> @@ -600,7 +601,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>  		 * At the moment, we don't support copying CCS metadata from
>  		 * system to system.
>  		 */
> -		XE_WARN_ON(!src_is_vram && !dst_is_vram);
> +		xe_gt_assert(gt, src_is_vram || dst_is_vram);
>  
>  		emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
>  			      src_is_vram, dst_size);
> @@ -812,7 +813,7 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
>  	*cs++ = upper_32_bits(src_ofs);
>  	*cs++ = FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
>  
> -	XE_WARN_ON(cs - bb->cs != len + bb->len);
> +	xe_gt_assert(gt, cs - bb->cs == len + bb->len);
>  
>  	bb->len += len;
>  }
> @@ -850,7 +851,7 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>  		*cs++ = 0;
>  	}
>  
> -	XE_WARN_ON(cs - bb->cs != len + bb->len);
> +	xe_gt_assert(gt, cs - bb->cs == len + bb->len);
>  
>  	bb->len += len;
>  }
> @@ -1023,9 +1024,9 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	 * PDE. This requires a BO that is almost vm->size big.
>  	 *
>  	 * This shouldn't be possible in practice.. might change when 16K
> -	 * pages are used. Hence the XE_WARN_ON.
> +	 * pages are used. Hence the assert.
>  	 */
> -	XE_WARN_ON(update->qwords > 0x1ff);
> +	xe_tile_assert(tile, update->qwords <= 0x1ff);
>  	if (!ppgtt_ofs) {
>  		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
>  							   XE_PAGE_SIZE));
> @@ -1215,7 +1216,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
>  	 * Should be reasonably bound..
>  	 */
> -	XE_WARN_ON(batch_size >= SZ_128K);
> +	xe_tile_assert(tile, batch_size < SZ_128K);
>  
>  	bb = xe_bb_new(gt, batch_size, !q && xe->info.supports_usm);
>  	if (IS_ERR(bb))
> @@ -1225,7 +1226,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  	if (!IS_DGFX(xe)) {
>  		ppgtt_ofs = NUM_KERNEL_PDE - 1;
>  		if (q) {
> -			XE_WARN_ON(num_updates > NUM_VMUSA_WRITES_PER_UNIT);
> +			xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
>  
>  			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
>  						 GFP_KERNEL, true, 0);
> @@ -1254,7 +1255,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  		for (i = 0; i < num_updates; i++) {
>  			struct xe_bo *pt_bo = updates[i].pt_bo;
>  
> -			XE_WARN_ON(pt_bo->size != SZ_4K);
> +			xe_tile_assert(tile, pt_bo->size == SZ_4K);
>  
>  			addr = xe_pte_encode(pt_bo, 0, XE_CACHE_WB, 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 75d025c54eb8..ada3114be4fa 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -463,7 +463,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  	 * is still 0 at this point, we'll assume that it was omitted by
>  	 * mistake in the switch statement above.
>  	 */
> -	XE_WARN_ON(info->unused_entries_index == 0);
> +	xe_assert(xe, info->unused_entries_index != 0);
>  
>  	if (XE_WARN_ON(info->size > info->n_entries)) {
>  		info->table = NULL;
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5709518e314b..d1e06c913260 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -196,7 +196,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>  	pt->level = level;
>  	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
>  
> -	XE_WARN_ON(level > XE_VM_MAX_LEVEL);
> +	xe_tile_assert(tile, level <= XE_VM_MAX_LEVEL);
>  
>  	return pt;
>  
> @@ -1004,7 +1004,7 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	*num_entries = 0;
>  	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
>  	if (!err)
> -		XE_WARN_ON(!*num_entries);
> +		xe_tile_assert(tile, *num_entries);
>  	else /* abort! */
>  		xe_pt_abort_bind(vma, entries, *num_entries);
>  
> @@ -1026,7 +1026,7 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
>  		u64 end;
>  		u64 start;
>  
> -		XE_WARN_ON(entry->pt->is_compact);
> +		xe_assert(xe, !entry->pt->is_compact);
>  		start = entry->ofs * page_size;
>  		end = start + page_size * entry->qwords;
>  		vm_dbg(&xe->drm,
> @@ -1276,7 +1276,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
>  		dma_fence_put(&ifence->base.base);	/* Creation ref */
>  	}
>  
> -	XE_WARN_ON(ret && ret != -ENOENT);
> +	xe_gt_assert(gt, !ret || ret == -ENOENT);
>  
>  	return ret && ret != -ENOENT ? ret : 0;
>  }
> @@ -1356,7 +1356,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>  	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
>  	if (err)
>  		goto err;
> -	XE_WARN_ON(num_entries > ARRAY_SIZE(entries));
> +	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>  
>  	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
>  	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
> @@ -1707,7 +1707,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  	       xe_vma_start(vma), xe_vma_end(vma) - 1, q);
>  
>  	num_entries = xe_pt_stage_unbind(tile, vma, entries);
> -	XE_WARN_ON(num_entries > ARRAY_SIZE(entries));
> +	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>  
>  	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
>  	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
> @@ -1773,7 +1773,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  		list_del_init(&vma->combined_links.rebind);
>  
>  	if (unbind_pt_update.locked) {
> -		XE_WARN_ON(!xe_vma_is_userptr(vma));
> +		xe_tile_assert(tile, xe_vma_is_userptr(vma));
>  
>  		if (!vma->tile_present) {
>  			spin_lock(&vm->userptr.invalidated_lock);
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 2238a40b7e8e..6eec7c7e4bc5 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -212,6 +212,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>  	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>  	u32 ppgtt_flag = get_ppgtt_flag(job);
>  	struct xe_vm *vm = job->q->vm;
> +	struct xe_gt *gt = job->q->gt;
>  
>  	if (vm && vm->batch_invalidate_tlb) {
>  		dw[i++] = preparser_disable(true);
> @@ -234,7 +235,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>  
>  	i = emit_user_interrupt(dw, i);
>  
> -	XE_WARN_ON(i > MAX_JOB_SIZE_DW);
> +	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>  }
> @@ -294,7 +295,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  
>  	i = emit_user_interrupt(dw, i);
>  
> -	XE_WARN_ON(i > MAX_JOB_SIZE_DW);
> +	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>  }
> @@ -342,7 +343,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  
>  	i = emit_user_interrupt(dw, i);
>  
> -	XE_WARN_ON(i > MAX_JOB_SIZE_DW);
> +	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>  }
> @@ -372,14 +373,16 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  
>  	i = emit_user_interrupt(dw, i);
>  
> -	XE_WARN_ON(i > MAX_JOB_SIZE_DW);
> +	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
>  
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>  }
>  
>  static void emit_job_gen12_gsc(struct xe_sched_job *job)
>  {
> -	XE_WARN_ON(job->q->width > 1); /* no parallel submission for GSCCS */
> +	struct xe_gt *gt = job->q->gt;
> +
> +	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
>  
>  	__emit_job_gen12_simple(job, job->q->lrc,
>  				job->batch_addr[0],
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 190731d161dc..adbd82f8744e 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -143,7 +143,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  
>  		/* Sanity check */
>  		for (j = 0; j < q->width; ++j)
> -			XE_WARN_ON(cf->base.seqno != fences[j]->seqno);
> +			xe_assert(job_to_xe(job), cf->base.seqno == fences[j]->seqno);
>  
>  		job->fence = &cf->base;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index addd6f2681b9..a7dd494f4742 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -162,7 +162,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  
>  	/* We don't fail the driver load if HuC fails to auth, but let's warn */
>  	ret = xe_huc_auth(&uc->huc);
> -	XE_WARN_ON(ret);
> +	xe_gt_assert(uc_to_gt(uc), !ret);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index e2f42f1bc89a..7e9b56c812e7 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -195,7 +195,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>  	u32 count;
>  	int i;
>  
> -	XE_WARN_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
> +	xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
>  	entries = blobs_all[uc_fw->type].entries;
>  	count = blobs_all[uc_fw->type].count;
>  
> @@ -224,8 +224,8 @@ size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len)
>  	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>  	u32 size = min_t(u32, uc_fw->rsa_size, max_len);
>  
> -	XE_WARN_ON(size % 4);
> -	XE_WARN_ON(!xe_uc_fw_is_available(uc_fw));
> +	xe_assert(xe, !(size % 4));
> +	xe_assert(xe, xe_uc_fw_is_available(uc_fw));
>  
>  	xe_map_memcpy_from(xe, dst, &uc_fw->bo->vmap,
>  			   xe_uc_fw_rsa_offset(uc_fw), size);
> @@ -249,8 +249,8 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>  	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>  	struct xe_guc *guc = &gt->uc.guc;
>  
> -	XE_WARN_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
> -	XE_WARN_ON(uc_fw->major_ver_found < 70);
> +	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
> +	xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
>  
>  	if (uc_fw->minor_ver_found >= 6) {
>  		/* v70.6.0 adds CSS header support */
> @@ -336,8 +336,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  	 * before we're looked at the HW caps to see if we have uc support
>  	 */
>  	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
> -	XE_WARN_ON(uc_fw->status);
> -	XE_WARN_ON(uc_fw->path);
> +	xe_assert(xe, !uc_fw->status);
> +	xe_assert(xe, !uc_fw->path);
>  
>  	uc_fw_auto_select(xe, uc_fw);
>  	xe_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
> @@ -504,7 +504,7 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>  	int err;
>  
>  	/* make sure the status was cleared the last time we reset the uc */
> -	XE_WARN_ON(xe_uc_fw_is_loaded(uc_fw));
> +	xe_assert(xe, !xe_uc_fw_is_loaded(uc_fw));
>  
>  	if (!xe_uc_fw_is_loadable(uc_fw))
>  		return -ENOEXEC;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cc4fd885c264..2c78cbebdd55 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -65,7 +65,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	bool read_only = xe_vma_read_only(vma);
>  
>  	lockdep_assert_held(&vm->lock);
> -	XE_WARN_ON(!xe_vma_is_userptr(vma));
> +	xe_assert(xe, xe_vma_is_userptr(vma));
>  retry:
>  	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>  		return 0;
> @@ -254,7 +254,7 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
>  		struct dma_fence *fence;
>  
>  		link = list->next;
> -		XE_WARN_ON(link == list);
> +		xe_assert(vm->xe, link != list);
>  
>  		fence = xe_preempt_fence_arm(to_preempt_fence_from_link(link),
>  					     q, q->compute.context,
> @@ -331,7 +331,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	int err;
>  	bool wait;
>  
> -	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
> +	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
>  
>  	down_write(&vm->lock);
>  
> @@ -508,7 +508,7 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>  	 * and holding the dma_resv of an object is required for list
>  	 * addition, and we shouldn't add ourselves.
>  	 */
> -	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
> +	xe_assert(vm->xe, list_empty(&vm->notifier.rebind_list));
>  
>  	ttm_eu_backoff_reservation(ww, objs);
>  	if (tv && tv != tv_onstack)
> @@ -551,7 +551,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	long wait;
>  	int __maybe_unused tries = 0;
>  
> -	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
> +	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
>  	trace_xe_vm_rebind_worker_enter(vm);
>  
>  	down_write(&vm->lock);
> @@ -710,7 +710,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	struct dma_fence *fence;
>  	long err;
>  
> -	XE_WARN_ON(!xe_vma_is_userptr(vma));
> +	xe_assert(vm->xe, xe_vma_is_userptr(vma));
>  	trace_xe_vma_userptr_invalidate(vma);
>  
>  	if (!mmu_notifier_range_blockable(range))
> @@ -851,7 +851,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>  	xe_vm_assert_held(vm);
>  	list_for_each_entry_safe(vma, next, &vm->rebind_list,
>  				 combined_links.rebind) {
> -		XE_WARN_ON(!vma->tile_present);
> +		xe_assert(vm->xe, vma->tile_present);
>  
>  		list_del_init(&vma->combined_links.rebind);
>  		dma_fence_put(fence);
> @@ -879,8 +879,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	struct xe_tile *tile;
>  	u8 id;
>  
> -	XE_WARN_ON(start >= end);
> -	XE_WARN_ON(end >= vm->size);
> +	xe_assert(vm->xe, start < end);
> +	xe_assert(vm->xe, end < vm->size);
>  
>  	if (!bo && !is_null)	/* userptr */
>  		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> @@ -1065,10 +1065,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  
>  	lockdep_assert_held_write(&vm->lock);
> -	XE_WARN_ON(!list_empty(&vma->combined_links.destroy));
> +	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
>  
>  	if (xe_vma_is_userptr(vma)) {
> -		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
> +		xe_assert(vm->xe, vma->gpuva.flags & XE_VMA_DESTROYED);
>  
>  		spin_lock(&vm->userptr.invalidated_lock);
>  		list_del(&vma->userptr.invalidate_link);
> @@ -1143,7 +1143,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range)
>  	if (xe_vm_is_closed_or_banned(vm))
>  		return NULL;
>  
> -	XE_WARN_ON(start + range > vm->size);
> +	xe_assert(vm->xe, start + range <= vm->size);
>  
>  	gpuva = drm_gpuva_find_first(&vm->mgr, start, range);
>  
> @@ -1154,18 +1154,18 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
>  {
>  	int err;
>  
> -	XE_WARN_ON(xe_vma_vm(vma) != vm);
> +	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
>  	lockdep_assert_held(&vm->lock);
>  
>  	err = drm_gpuva_insert(&vm->mgr, &vma->gpuva);
> -	XE_WARN_ON(err);	/* Shouldn't be possible */
> +	XE_WARN_ON(err);        /* Shouldn't be possible */
>  
>  	return err;
>  }
>  
>  static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
>  {
> -	XE_WARN_ON(xe_vma_vm(vma) != vm);
> +	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
>  	lockdep_assert_held(&vm->lock);
>  
>  	drm_gpuva_remove(&vma->gpuva);
> @@ -1416,7 +1416,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	struct drm_gpuva *gpuva, *next;
>  	u8 id;
>  
> -	XE_WARN_ON(vm->preempt.num_engines);
> +	xe_assert(xe, !vm->preempt.num_engines);
>  
>  	xe_vm_close(vm);
>  	flush_async_ops(vm);
> @@ -1489,7 +1489,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	if (vm->async_ops.error_capture.addr)
>  		wake_up_all(&vm->async_ops.error_capture.wq);
>  
> -	XE_WARN_ON(!list_empty(&vm->extobj.list));
> +	xe_assert(xe, list_empty(&vm->extobj.list));
>  	up_write(&vm->lock);
>  
>  	drm_gpuva_manager_destroy(&vm->mgr);
> @@ -1518,7 +1518,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  	void *lookup;
>  
>  	/* xe_vm_close_and_put was not called? */
> -	XE_WARN_ON(vm->size);
> +	xe_assert(xe, !vm->size);
>  
>  	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
>  		xe_device_mem_access_put(xe);
> @@ -1526,7 +1526,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  		if (xe->info.has_asid) {
>  			mutex_lock(&xe->usm.lock);
>  			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
> -			XE_WARN_ON(lookup != vm);
> +			xe_assert(xe, lookup == vm);
>  			mutex_unlock(&xe->usm.lock);
>  		}
>  	}
> @@ -1801,7 +1801,7 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence)
>  		struct async_op_fence *afence =
>  			container_of(fence, struct async_op_fence, fence);
>  
> -		XE_WARN_ON(xe_vm_no_dma_fences(afence->vm));
> +		xe_assert(afence->vm->xe, !xe_vm_no_dma_fences(afence->vm));
>  
>  		smp_rmb();
>  		return wait_event_interruptible(afence->wq, afence->started);
> @@ -1827,7 +1827,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
>  	} else {
>  		int i;
>  
> -		XE_WARN_ON(!xe_vm_in_fault_mode(vm));
> +		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
>  
>  		fence = dma_fence_get_stub();
>  		if (last_op) {
> @@ -2109,7 +2109,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>  {
>  	int err;
>  
> -	XE_WARN_ON(region > ARRAY_SIZE(region_to_mem_type));
> +	xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
>  
>  	if (!xe_vma_has_no_bo(vma)) {
>  		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
> @@ -2323,7 +2323,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  		}
>  		break;
>  	case XE_VM_BIND_OP_UNMAP_ALL:
> -		XE_WARN_ON(!bo);
> +		xe_assert(vm->xe, bo);
>  
>  		err = xe_bo_lock(bo, &ww, 0, true);
>  		if (err)
> @@ -2441,7 +2441,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  	int err, i;
>  
>  	lockdep_assert_held_write(&vm->lock);
> -	XE_WARN_ON(num_ops_list > 1 && !async);
> +	xe_assert(vm->xe, num_ops_list <= 1 || async);
>  
>  	if (num_syncs && async) {
>  		u64 seqno;
> @@ -2470,7 +2470,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>  			bool first = !async_list;
>  
> -			XE_WARN_ON(!first && !async);
> +			xe_assert(vm->xe, first || async);
>  
>  			INIT_LIST_HEAD(&op->link);
>  			if (first)
> @@ -3432,7 +3432,7 @@ int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>  	LIST_HEAD(objs);
>  	LIST_HEAD(dups);
>  
> -	XE_WARN_ON(!ww);
> +	xe_assert(vm->xe, ww);
>  
>  	tv_vm.num_shared = num_resv;
>  	tv_vm.bo = xe_vm_ttm_bo(vm);
> @@ -3466,8 +3466,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	u8 id;
>  	int ret;
>  
> -	XE_WARN_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
> -	XE_WARN_ON(xe_vma_is_null(vma));
> +	xe_assert(xe, xe_vm_in_fault_mode(xe_vma_vm(vma)));
> +	xe_assert(xe, !xe_vma_is_null(vma));
>  	trace_xe_vma_usm_invalidate(vma);
>  
>  	/* Check that we don't race with page-table updates */
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6de6e3edb24a..17fd3a5f8d99 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -187,7 +187,7 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
>  
>  static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>  {
> -	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
> +	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
>  	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 9a85bcc18830..0b8a2b5ce197 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -144,10 +144,10 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
>  	u32 mask;
>  	int err;
>  
> -	XE_WARN_ON(!(base & GUC_WOPCM_OFFSET_MASK));
> -	XE_WARN_ON(base & ~GUC_WOPCM_OFFSET_MASK);
> -	XE_WARN_ON(!(size & GUC_WOPCM_SIZE_MASK));
> -	XE_WARN_ON(size & ~GUC_WOPCM_SIZE_MASK);
> +	xe_assert(xe, base & GUC_WOPCM_OFFSET_MASK);
> +	xe_assert(xe, !(base & ~GUC_WOPCM_OFFSET_MASK));
> +	xe_assert(xe, size & GUC_WOPCM_SIZE_MASK);
> +	xe_assert(xe, !(size & ~GUC_WOPCM_SIZE_MASK));
>  
>  	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
>  	err = xe_mmio_write32_and_verify(gt, GUC_WOPCM_SIZE, size, mask,
> @@ -213,9 +213,9 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>  	drm_dbg(&xe->drm, "WOPCM: %uK\n", wopcm->size / SZ_1K);
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> -	XE_WARN_ON(guc_fw_size >= wopcm->size);
> -	XE_WARN_ON(huc_fw_size >= wopcm->size);
> -	XE_WARN_ON(ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size);
> +	xe_assert(xe, guc_fw_size < wopcm->size);
> +	xe_assert(xe, huc_fw_size < wopcm->size);
> +	xe_assert(xe, ctx_rsvd + WOPCM_RESERVED_SIZE < wopcm->size);
>  
>  	locked = __wopcm_regs_locked(gt, &guc_wopcm_base, &guc_wopcm_size);
>  	if (locked) {
> @@ -256,8 +256,8 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>  			   guc_fw_size, huc_fw_size)) {
>  		wopcm->guc.base = guc_wopcm_base;
>  		wopcm->guc.size = guc_wopcm_size;
> -		XE_WARN_ON(!wopcm->guc.base);
> -		XE_WARN_ON(!wopcm->guc.size);
> +		xe_assert(xe, wopcm->guc.base);
> +		xe_assert(xe, wopcm->guc.size);
>  	} else {
>  		drm_notice(&xe->drm, "Unsuccessful WOPCM partitioning\n");
>  		return -E2BIG;
> -- 
> 2.34.1
> 
