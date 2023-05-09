Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25E9C77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 01:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071B10E06A;
	Tue,  9 May 2023 01:09:46 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83C10E314
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 01:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683594583; x=1715130583;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iiOd6XxsYAKMXjuxVCrf5P3c6G2GFfFPCxVUh+2QiqM=;
 b=VfxrDZkAMcBnnKTyy8+evRGD/zNxI3TOJWwx1UfYFF10Rx4aJ9hxj3g2
 J3+RUy6A78qM/QEPa+UnOQxC5X6zL3C5mnwFuTuXGQzV5/EoUWzjUd7bV
 y7WftnxdtnzA5aQQhDHeWlieiw+yqJ1vIGLXjqlmUKKkkyL0JZEcGU10Z
 hL8IWCSdIyioJu2lur4BOIjjmWGROb+J9HCAVwGyVUkHaCQctQMQxTZTv
 qFOZT+u0k6NW8Qb3ITIsk6RfcTn4ugYhd7tZYwsxCwgpuHZhws4KhFrX9
 V76peVyrpeUAfsM1q+MCRNKdVRBr+s01paXX/QSz5z+zXbPPV52Vl8yrL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="351949775"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="351949775"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 18:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="692783280"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="692783280"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 08 May 2023 18:09:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 18:09:18 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 18:09:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 18:09:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 18:09:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVWLcNiuuw6vzmh8BLa6cPwbtmFl1atp8rn3hdskS2PIEyJH2B/4YCJ85GLjIsyr1nKFp49Opgt+QBoYp/wby9O90FWoOdeYwlYfP6+PmL62J1T1yeSFyLud42Cd0pdjugAuq2YG+5cZB/0F5sY8j26aVX5G/gR4scX+ZzqiyXmzj1gsIuVH3b22RbDd6gde10bQs2C4X0ZLmrfgWWFm17RfwFCnW0vtv/d5P8z2oCnoH188oWKt5g0Os7/egF4WLXReQYdW/Rx7k78kGQoU/AJGmr2NcQ0OCnoDi/1qG9mcXk3vskW3R8aX2I/WYevL2h5lxb3ZbHpsSLKvtqgktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQifLlDVuc2YApyRx9g+bHN/ZNRyBPswzfd301f8DaI=;
 b=gfZZmbodEDxqg6QM6YqvlXmEQdlbOmifV3N3l7Mc0sFX8xdDUrh+TBQFJFGQIdQaKRhkb/2N0nKgBW8L6vFT66Cpm+TD2Ae4uoQIpFpVYf4IQifE5JbpIKODCOpwd2vQe4yfT92BXBaKRv17GXMI4BQRpxZ2Uq62+Cm8CBo8C6v/73n6qPVUxiAldlGWV9U+0lfesE6oT8elqVlpkquXDqU87pc/B7JMmV72XZDCHoCEVw2MEEIxZxPwfV1mdNCHkZId988UM0iHTHKxmnouJgg7b6AS70oNC2LTtJrrZ/v1OVHuR8OfHtuMFTnZ+T+TF0sM4jr1Difg3UMvEUQ9Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5225.namprd11.prod.outlook.com (2603:10b6:408:132::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 01:09:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 01:09:14 +0000
Date: Tue, 9 May 2023 01:08:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZFmdGtrdMmmXIaxb@DUT025-TGLU.fm.intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
 <20230508210825.1405432-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508210825.1405432-10-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5225:EE_
X-MS-Office365-Filtering-Correlation-Id: 92913fe6-479c-4dbb-cfde-08db502a00e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rJd/Q4ucxZptN93JTERkyyS46NgWdZ22pC3Q8T10XQ4FEAyKAqfSNxecCtRGvCvKRo7clswAMQH08xg32jQs3JOF7ia+eZ+ZCLcsbTxt8FawYX072R80co1GsuP/Pd3DPZTh3TMQycY8gskM9r65HPpqq8mlwr+2JzVThZB6d/Jq8zLYM1nYLJ1tjI3s/rEMdYiyi9Oynmi8gZs9Lkt41mKV/pjlE/IZFq80N5yPq60Sj5FHTgOjO/S67fTawNC+TQMRHOQpA6jhiQ0cNRmS4Tv0M+BedDfS6oyRcced+7SKqStnLTmMM2Klpxj9XZcsQHYlNTDb16adKfCX/+SgCQp3RJNF+wan7YDrH0oTD7iGoQm19EgmIFMhq5IeOWdkxFbdQAt4WHi8MHbCYjjptB68KijcVLII1dukUihLe6YyoVzD+UcPJKU8jaL59xNkFmPD/K3+sp6VKJG/I+4OZMovUmwBEDUeC3g9ZbQSe3MQIgqb269UXgVgcMwwXN1gFMuWCjq3OLT1IgfC4z9BpNnMq+2ZBmPYnTvLa0Zs6KQu58pqt1Nco4RypQFf+WmJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(86362001)(66476007)(66946007)(316002)(478600001)(6636002)(66556008)(4326008)(6486002)(5660300002)(2906002)(8676002)(6862004)(41300700001)(8936002)(44832011)(38100700002)(82960400001)(186003)(6506007)(26005)(6512007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xPXSkjkyNBnp9Uzm3Dar3iyWtTZEqG0htOuDE4CAKKRiq08NSN0VxUK6Z7zd?=
 =?us-ascii?Q?Ac3w1AIYV5ncFe1MQb4UNSx3/1rc0azxUefEJ4OH0gWu6CUXnOx8xGjFyPw7?=
 =?us-ascii?Q?zRWvCrwim/gWgvj6O6NimOEqySUb+WVNjGrX4hML545PDxli0js3CbOZN0RX?=
 =?us-ascii?Q?QSHEICS/zEPR3+5ekKxJhpZYMFtr0uU1oS1TGT4+AWbZNsijQKydYFBGg6uP?=
 =?us-ascii?Q?5e3jRtlNgMmyfUOOD7TcsR0ByY49S8tQIDX6UQkZTfpQ1GbsiaYwA5uqDnnv?=
 =?us-ascii?Q?xpdb/Ep32f65XmeV8toZlX9uDu1UhSYim9XDdJSDFeZV9gB9WvIyhMyflbk1?=
 =?us-ascii?Q?fmp/7PYDcMbF9/TjA5qI1sXc4MpE4ohrgHsOxX/7mXnAqU1JsyHmPf3NvMlA?=
 =?us-ascii?Q?5mGGXfIv6ehQtfrEZWq1815Ft6afkSGqm2lGv/PTSzic5gLEskcFYPtSASH6?=
 =?us-ascii?Q?rTPdK9J4O2XW5eLFXgOpWGnN6k7CUMgICS8QSTcH08A9csqvm9I/OvtczWzo?=
 =?us-ascii?Q?L81t2MhB7Aw2mnshwjkvFVA7Y+KukbpfejfizKEmvwWjyO03nnNuznx1aiLx?=
 =?us-ascii?Q?zduVCcWoX16rnGuPx+SAzEOAoYgJSmeIgeoDqK0rCY5iusQQRzaTfC59ZNir?=
 =?us-ascii?Q?5m2gmoi1wq+qpIpJx9XT+G7h0xYL7GQQQPoq95UmlalprZvxQmz6sLYPm6Lw?=
 =?us-ascii?Q?4bdvoZ0QNO+DWBqR87Qk9ESiYFSVjvJj4ttZSo4VlBeQQ2lxPZS67qqJ3JKC?=
 =?us-ascii?Q?WqfLyYfZBijqYxJvfgAD2Kkr63QBauKfDf7Hbj+5UwkzlVV/VdRZ1hXhyv5m?=
 =?us-ascii?Q?Ql0SD7kTbnNkFLWjM39JHcA5WSY9SAxhS3stQ+zcK/7l5jpX3xrswTuB+WPT?=
 =?us-ascii?Q?QVPygAPU+PkEoiJd6eEViCJsf/4eVSsL7xgoovZi6pVY2ojxrbLpC1HHeIgn?=
 =?us-ascii?Q?qUCJruOkziqvyvQWP+206hYqzwxwDGBF9JhCpumc/qdsunE5bhZEWIXOOwsO?=
 =?us-ascii?Q?Kb/XhNVC1lAvSpIxFmlerh7vcHXN9D5YCmK6f0OCRgTFmk+SvIB5/f0PSu2P?=
 =?us-ascii?Q?9BgOSlgcOGsBbY4xSx/SO/JGIp6nBmEm8LbPOQZnbLw2rJwkgZd2nw28mcOm?=
 =?us-ascii?Q?ORaOGhPkPrx7cQ+8zFNfcZH0mEEn+SJ54YLHBvBGJyN0y4HpyKWricMQk2Ck?=
 =?us-ascii?Q?03iucgvuXSOEcu6sy6cq5ucqipquWzVrlDw1zIWirqBU2Y0cXeFJGBIfCyrD?=
 =?us-ascii?Q?9RLRddc911Yux6+vQIVmDxDCtSqD1/rTLhnpZdbWloJJ8Bf/UkgtTf/eMcG8?=
 =?us-ascii?Q?06FsetBBUxkFBwcyh5Y0PhU6KBJZX4ixahgOVGMYS2WETJy1v3WIhBpPR7fR?=
 =?us-ascii?Q?xxZd0wCGozqsGHnLLjC0PySa9U8qHi+bUFLqKi3D6G26MuLJ8/qxxMkrsa3R?=
 =?us-ascii?Q?UXNTWPBn2PHXm2208IW8ktBxHKIW79iCXcEAD6RwK6RcEzb+RtDkXkcdDo0O?=
 =?us-ascii?Q?4a4GwdUk4dbmqVazyoFVyQYZ+CvMgZnfMF6pVx4nahJhtyopr5d2Zw7z6O7D?=
 =?us-ascii?Q?UlL7bYhaWfevp52g/D7Z7pnDKiMNu7eS7Xvp8jmIodQU99V9kNfWCO4y4QMc?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92913fe6-479c-4dbb-cfde-08db502a00e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 01:09:13.8804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MFdSGM8/7x7Bl3fbnhJ9RjhcWhAKDv5sv8Zw2Hz1N5lE/6ykz5ceST/qgFMUwXqzzFZQh14YV5cIGeDqwZIDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5225
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 10/11] drm/xe: Add HW Engine snapshot to
 xe_devcoredump.
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

On Mon, May 08, 2023 at 05:08:24PM -0400, Rodrigo Vivi wrote:
> Let's continue to add our existent simple logs to devcoredump one
> by one. Any format change should come on follow-up work.
> 
> v2: remove unnecessary, and now duplicated, dma_fence annotation. (Matthew)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 43 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index b9f343c74828..2175f1ef0501 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -9,10 +9,13 @@
>  #include <linux/devcoredump.h>
>  #include <generated/utsrelease.h>
>  
> +#include "xe_device.h"
>  #include "xe_engine.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
> +#include "xe_hw_engine.h"
>  
>  /**
>   * DOC: Xe device coredump
> @@ -62,6 +65,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	struct drm_printer p;
>  	struct drm_print_iterator iter;
>  	struct timespec64 ts;
> +	struct xe_engine *e;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
>  
>  	/* Our device is gone already... */
>  	if (!data || !coredump_to_xe(coredump))
> @@ -75,6 +81,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	mutex_lock(&coredump->lock);
>  
>  	ss = &coredump->snapshot;
> +	e = coredump->faulty_engine;
>  	p = drm_coredump_printer(&iter);
>  
>  	drm_printf(&p, "**** Xe Device Coredump ****\n");
> @@ -92,6 +99,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
>  	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
>  
> +	drm_printf(&p, "\n**** HW Engines ****\n");
> +	for_each_hw_engine(hwe, e->gt, id)
> +		xe_hw_engine_snapshot_print(coredump->snapshot.hwe[id], &p);
> +
>  	mutex_unlock(&coredump->lock);
>  
>  	return count - iter.remain;
> @@ -100,6 +111,8 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  static void xe_devcoredump_free(void *data)
>  {
>  	struct xe_devcoredump *coredump = data;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
>  
>  	/* Our device is gone. Nothing to do... */
>  	if (!data || !coredump_to_xe(coredump))
> @@ -109,6 +122,8 @@ static void xe_devcoredump_free(void *data)
>  
>  	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
>  	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
> +	for_each_hw_engine(hwe, coredump->faulty_engine->gt, id)
> +		xe_hw_engine_snapshot_free(coredump->snapshot.hwe[id]);
>  
>  	coredump->faulty_engine = NULL;
>  	drm_info(&coredump_to_xe(coredump)->drm,
> @@ -122,13 +137,41 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump)
>  	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
>  	struct xe_engine *e = coredump->faulty_engine;
>  	struct xe_guc *guc = engine_to_guc(e);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	u32 adj_logical_mask = e->logical_mask;
> +	u32 width_mask = (0x1 << e->width) - 1;
> +	int i;
>  
>  	lockdep_assert_held(&coredump->lock);
>  	ss->snapshot_time = ktime_get_real();
>  	ss->boot_time = ktime_get_boottime();
>  
> +	for (i = 0; e->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> +		if (adj_logical_mask & BIT(i)) {
> +			adj_logical_mask |= width_mask << i;
> +			i += e->width;
> +		} else {
> +			++i;
> +		}
> +	}
> +
> +	xe_force_wake_get(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
> +
>  	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
>  	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e, true);
> +
> +	for_each_hw_engine(hwe, e->gt, id) {
> +		if (hwe->class != e->hwe->class ||
> +		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> +			coredump->snapshot.hwe[id] = NULL;
> +			continue;
> +		}
> +		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe,
> +									   true);
> +	}
> +
> +	xe_force_wake_put(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index e055b266af70..8b17ecf1b6e6 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -9,6 +9,8 @@
>  #include <linux/ktime.h>
>  #include <linux/mutex.h>
>  
> +#include "xe_hw_engine_types.h"
> +
>  struct xe_device;
>  
>  /**
> @@ -29,6 +31,8 @@ struct xe_devcoredump_snapshot {
>  	struct xe_guc_ct_snapshot *ct;
>  	/** @ge: Guc Engine snapshot */
>  	struct xe_guc_submit_engine_snapshot *ge;
> +	/** @hwe: HW Engine snapshot array */
> +	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
>  };
>  
>  /**
> -- 
> 2.39.2
> 
