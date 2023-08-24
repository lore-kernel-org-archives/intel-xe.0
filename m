Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15040C6FA8F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 20:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E1710E08A;
	Thu, 24 Aug 2023 20:06:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DC210E08A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 20:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692907561; x=1724443561;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dv09qz3FsqGae+IQE7fJkuDhpXx5cREcH0lzL5yWANg=;
 b=LkAusKSeP4JRjDJsGvrVOL4bq+X1SUJOhK4RygV2x9H4TpuQ8QrM3Bbs
 Yjl40NQMthR8zow1/4jtlKQyNr0uH4Me9CUYx1KiABw/0yy/Da3z6dBO/
 YUXcRNPpFdNK+zX51tJnc8tC3EHRmRIG9N7r8anOYLHyhK6zDZ084PtA8
 CLxaZkmmMGDdjsQUy7a5PWSeFbizLKhDat9rvdXM0RvHmEjIEA0rqGIt9
 p6gyL7v4PL7wlvQEH0t9bFdge6WF1TrxjqsjD47cMN/iyn2zBshttb/Kk
 5V22FacxcEIBUbBnQQg65Pn/Kak/bdSOZ1J57xglxed3gBsge5rrZZ7os g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364735515"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="364735515"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 13:06:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687020573"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687020573"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 24 Aug 2023 13:05:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 13:05:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 13:05:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 13:05:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 13:05:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGeBZucmxx/c878uo2E0G4tQA5DVNxSa03hmC8jTUc4hYhUhrnlW21o0kbsu52WpKusOF5A/XVU5Qb6ToRksSZNu7BfdcPK1SUZGpi0aU9MDa5SQhmIAOqSgyFiC5ioooAxdlMZOp2zVmKPFZ9uG/da6y0DmlfoVkR4iPkqdOnHfjfKp4q9/dDQqp3L1ZK0zXHD9u5eSv56/ASZnElGYVJIfzwgAu8KFalob7aJYTGmblLMCNVVEyV70/lJpW6oMY2RglmXU7AdLxVOrNxFWQzPZ3qOnHntDKxeOaM45GbpiPEyYtC/YgM0s/IUUhEl1t0hzmayLRRTDaU0xISkUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw4InJu/Is447wknbkGs6J8Ay9fV0w7ogbVyrnIeCfk=;
 b=lVTnp+lgMYgE8eGQSccGjFKARpypfmNkN2e+9rswZw3NUixHHuFCntHzOmVsJ2VvbF8qlVUHg1o1a9sI7efaCDLvb+Sk4ZeYPCp2ayJN3gZSIUAGeqn1e4GOsF7ApmvRQaQMw0xrPbPT4/rIN7avNPy2KYpND6bQesIuYPRz/PRJ6lhhrTjOlVDw9HD0wp+gWm1YxQGjGQsfVbVn3tjPRZ7ftwlgN6mvv/KJJer+Rcgyk6cYs/eYHalrpN/rS9ElkXMXubzlezPaeGofiXdFdXhNys7U0fPan4FN56kPMUt39yXf41DNKoMiMkLV+vjwHC6HnZjWgQyHT006ciCk9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by MW4PR11MB6692.namprd11.prod.outlook.com (2603:10b6:303:20e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 20:05:55 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 20:05:55 +0000
Date: Thu, 24 Aug 2023 13:05:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Message-ID: <20230824200538.GZ1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230823195533.125633-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230823195533.125633-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|MW4PR11MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: d273c308-ff22-489e-7a29-08dba4dd8671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NaX9PnCAVdz/IWIhf4VrDQwZwe5zkMiHQAfQBMzBcIsLcrv+9ZKNn7zXqyDPBgHrNriqnEZ6UX1EaLn2IIKnIt8fnbunH90Kz4B8J7p93CMXo6hbdt5WfibgppJRdPAUhMX6RZPExi7wUaEjrawum7wzKEhF0gL7nC+dwhgCj/2AW+IYr8HGwO2KcVdbuHn2bKsfxR797kOXH7vj3lfHvv6JvmDkC52XFD544Kw+pdXvU/OY9XAiZPnpFhBkx02/A/vgMjcefKb7xHSFqUfSK/mwAbNv1ZmPnVfyBOhGPQZaZF2l9ngac6EcwnCxc9VMzdoln5IS60NULuDt0CnWyCCOSyqz1QgtgQTcMjPH0TSdZd8wYq2NmvFNY4p0HZuDI65+xiJ3YGK6WIp00aFHojYwkcaAyH5sOgrt/BQEyYqHj/7xdEnQ3/icGSxYqJq63xdVdG1hierIfvfsrHDCS6+GHHCs4gttDJsyk0zwyPQzp9Wl2DwkmX0j/9FG3FPaGnGu4lT+DnN77BXnojHUEga/mbK+oKCo135QnlwPrS4P/yDqXVC0fGEVpvgNi7fq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(396003)(136003)(346002)(186009)(1800799009)(451199024)(1076003)(5660300002)(107886003)(4326008)(8676002)(6862004)(8936002)(83380400001)(33656002)(26005)(6666004)(38100700002)(82960400001)(66556008)(66946007)(66476007)(6636002)(316002)(478600001)(41300700001)(6512007)(6506007)(2906002)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bdZYzBQghAqZZeqwzwOIwOWnrVmfPjwMDz+Itwuqx6Sg7LCdW+hcVQsBI3BO?=
 =?us-ascii?Q?ClmOwKhN89BK8zXbRl6KipGoGmo7toOrpRxXfD+rYNIGTgum9Siga/Q4Y9lz?=
 =?us-ascii?Q?kj7CKvVc6W2llnhVYoYsCDADFDw9oElsqvHRbd6q32R3XI4GSiVNATOzh/1E?=
 =?us-ascii?Q?SZTjEdPCop8zf/zWGxVQojvRz97L+YkN1AnrsJyVmGfEODr3tHbrWsqvrLve?=
 =?us-ascii?Q?jUlj/VOB1IjX0fPku5H0Dt7tRYIWUWmblC5lyUCCpGk89yP7Vue4+z4CyTu6?=
 =?us-ascii?Q?IVn5QaAjCaULwcmNe+GSV3JKnXJhWuixL2EGcTQ/t8/UA+sqrCUsOmCM+AxP?=
 =?us-ascii?Q?ecFWzXmwWcdm1QW2Kbqioss1VnW/og0j9mBeizo/H/l56LbJXmSXmAbMEX01?=
 =?us-ascii?Q?8FeNoaGP6CjV43Gxq/92iavAZ+wY1tT+wEbfDSl4ix3GMQc7lOoXJSthsznG?=
 =?us-ascii?Q?p68pcL5z0oWfmpawYuO5rsLvtIAxL/45hNr2OcgTdG+caywdg2zNVqWnSQTv?=
 =?us-ascii?Q?aC/4wQiDEKzntTI33LBH0RrboebEUHqmFkqtQdJV8ixLkc1Bz7fGXQymflux?=
 =?us-ascii?Q?crNamCU6xZ83K/mB1oCYvnq1SZlTuOhaMmQIGaL98bZdYOqGEip6N6bfwFi7?=
 =?us-ascii?Q?43BSLnhayAqJ/l4aDgscn/qw4h5K/sEeoQkx84pVdDHoVxtKNHXZHXVoZzdV?=
 =?us-ascii?Q?WLGfr/QXfuZgsNDj0Jf3JvI13rcitOkjNAr1mBKFnU0LJEi4JK0ht2wECGJL?=
 =?us-ascii?Q?hYfSPp9VVcCa/01yHlelM4ZILfJHifyeNWUrGfrEFbO5jFGf9rdsBFMdzZoj?=
 =?us-ascii?Q?NB7P8Y/WblwlFRlQt1+G/jZMXj8avTy6DV0oSlF7yaqiVVXwZ1bEuu4mZclU?=
 =?us-ascii?Q?NkhqAahS3uMBV5lQmkTuPubbaqzGLT3dbMN81GZj2NcQoTYyioRzP4WVfcze?=
 =?us-ascii?Q?UKFTTOAS9ytS4fFjMEkHBn960G667mcojlnwOoNhh2CtJ+z25HdhQH8sfbJt?=
 =?us-ascii?Q?w9hrjCzzKQxNjRYoKsjW1o8GPTvPK3T26+s0fttTs3L3w5PIPgXjvVfDXzxm?=
 =?us-ascii?Q?QOZD5NyaZXFNM4pUgC7A+DsBw7O/HLi+Z+jLwZrnJIyfuMfOCUxRDRevE35K?=
 =?us-ascii?Q?XoX7LQpUyovkd1ZkCtTj/MREGLvV15ZT7GhqmVtjmNDmff77+DpZqbaTW/hM?=
 =?us-ascii?Q?fPgy6fZHRBHVa6bGCHdSdukvAFvXGQySIcTyR0+1WzVTJNuWHY5fLYi3Fw/7?=
 =?us-ascii?Q?uY43xxbh+nsPAhOCTmU9ZGb6wda/X74z7wi82r/WP/xSeqMGqFCo+KHCIBOm?=
 =?us-ascii?Q?zHVf+h1Xe31645O2snqSaZ2ggrNMW545LHeXZy4Pxw5nPLKVPxjJ3BXy/fow?=
 =?us-ascii?Q?fU0tuLYkhHvNMbGjPOReWhyXWeT+BnM+zng85WdRJafo7Lh6AaBlmPOhkLYW?=
 =?us-ascii?Q?+iOdpBBXzHF++zMKFvqOusCe5Vz9iSSytIQTgvyDv0xeGLPEOUZRXIqtAR90?=
 =?us-ascii?Q?3+3bjOavhglVbDD1slS1Wi0bq/TE8HOCzhPngx56+IMrqE3FLvDKzy2LXA+Q?=
 =?us-ascii?Q?LKMZja467Nn56qAeAKloBDAE9fR+lBAHJXkwpEkPhPV1xVFvAtv8DX/Fk5lB?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d273c308-ff22-489e-7a29-08dba4dd8671
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 20:05:55.5703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wW3C25171cZy1DUZDTyiClL7nZJgjOCFdHwql0w8B/vSzUzjBOZjXcNgh/gnaNiwf4LpVkijMAbLumvR/vNw1hWmXYk8c1d2xKhEz3xTI6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6692
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2 v3] drm/xe: Add infrastructure for per
 engine tuning
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 12:55:32PM -0700, Matt Atwood wrote:
> Add the infrastructure that allows for per engine tuning preparation for
> disable indirect state.

I don't think we need this patch; there's nothing terribly complicated
here so we might as well just squash it directly into the next patch
that starts adding some entries.

> 
> v3: rebase
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c |  2 ++
>  drivers/gpu/drm/xe/xe_tuning.c    | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_tuning.h    |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index dd673a684b70..9dafc56d5fe8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -24,6 +24,7 @@
>  #include "xe_reg_sr.h"
>  #include "xe_rtp.h"
>  #include "xe_sched_job.h"
> +#include "xe_tuning.h"
>  #include "xe_wa.h"
>  
>  #define MAX_MMIO_BASES 3
> @@ -401,6 +402,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	}
>  
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> +	xe_tuning_process_engine(gt);
>  	xe_wa_process_engine(hwe);
>  	hw_engine_setup_default_state(hwe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 412e59de9842..702cb41dab53 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -27,6 +27,10 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	{}
>  };
>  
> +static const struct xe_rtp_entry_sr engine_tunings[] = {
> +	{}
> +};
> +
>  static const struct xe_rtp_entry_sr lrc_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> @@ -65,6 +69,14 @@ void xe_tuning_process_gt(struct xe_gt *gt)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
>  
> +void xe_tuning_process_engine(struct xe_gt *gt)
> +{
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
> +
> +	xe_rtp_process_to_sr(&ctx, engine_tunings, &gt->reg_sr);
> +}

It looks like you may have copied the GT function but forgot to update
it for engine usage?


Matt

> +EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
> +
>  /**
>   * xe_tuning_process_lrc - process lrc tunings
>   * @hwe: engine instance to process tunings for
> diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
> index 2b95b0c8effc..740cb1bd2f0a 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.h
> +++ b/drivers/gpu/drm/xe/xe_tuning.h
> @@ -10,6 +10,7 @@ struct xe_gt;
>  struct xe_hw_engine;
>  
>  void xe_tuning_process_gt(struct xe_gt *gt);
> +void xe_tuning_process_engine(struct xe_gt *gt);
>  void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
>  
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
