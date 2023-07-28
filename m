Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C7FC001DC
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 01:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBD410E1E3;
	Fri, 28 Jul 2023 01:32:09 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8744110E1E3
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 01:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690507927; x=1722043927;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bDzy6CHjjEXNHQpGHjgUMKgYAz/iT9lb1aNkMBln2vg=;
 b=TptDLqK7eOj7q5LzvlBZcUHS36hhrUaCt+jyR6642ONpWGE5GwCdGbrY
 7dG9n9sWmLt5tbPnlMgtQ9R3oCvoz42yFkpzZapKJB9sFzUfrJQDlFmJ1
 WMdJlGwE9fdBBBGYsQK+sdQDkrswYJ83GJFrDKaQXEyW2fKSlA8u7Rnrx
 zbV+FSRNCV7PaX6K2+SM0tD+mmFxjG/MPYj/6MHvtDrwq/0d4EzFoi6Ge
 VSTgjhzmOaBbi23/32p407dZIqv9tQgbCQGZHzkQ3GTFLfnr3wtKU9PJu
 oo8ggfNQETS4Ub0qw8HEChS775g4hPW1XoEMVI9zengpPj1e4aXlstEQS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454842904"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="454842904"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 18:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704338818"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="704338818"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 18:31:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 18:31:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 18:31:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 18:31:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 18:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ut5dJ3y/WC+7GfBIFE8/IWP1E3siYTakhUVF0QOEX+l7uyGdO+A/o8vfBvUlFiBjM+K+t1mnOzp0ItGwmmBEnadcx/2EE4NYV4rI6kC9EFpJH+C6KmBRI2Bh1Us9LuHYp/7vbyDjBKDQ7hteesK5tQb3kJDuK5pe7PfRUJNx6s5pNRvK4X+8CTrSNW8ubYflyeoJ8GrJ6fd7R439oXTSMVoLmGW46cubaYo8kCZu8meM3aJSVG3oh+bg3BvgBogYJPogoxQNFQagJLi6YPURtkwkkfxyiv9FJ7XKZx9ajHevaeL4ZKBPl7jlj47htUGuyVUQFGpkdMZOhTnrPC3mdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrPH5z6PUvZiAglzxdOMjaaCPXAVyOMHZLS1967Scfo=;
 b=QXTpFuOmrFvP2SPugWTVPDzjNLBdwVoaejr1T03J3+k6D6b15KUEjRKB4NFn740w78em+zENCEWV+fPqmb//Io8zz9kEVG8wd4akgzFBKPb7zCnqnFgQsBHxps86TpAG3fjGGlfw8jirn6Ee7/KZuIKOcwVIw3mm5AY1Py2GMx1SrcOGSwheIMEeYmC+nsPh4hH5CArMAbgl7jSK8tzW+KzXrISMrbSH6FqOP6tUyKrhlFKvqBZ2qgdmA6w5ddKnOAntk2IFGY44V5wwLlOGTRPVn7X6GYQaVElgsVQP3jgWYb0eJte12Ae0xWSxJ9YqtkdgXX2lvMD/xMJJM4mWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 01:31:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 01:31:50 +0000
Date: Fri, 28 Jul 2023 01:31:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZMMaVyDo7VJO5Syd@DUT025-TGLU.fm.intel.com>
References: <20230727185945.401047-1-daniele.ceraolospurio@intel.com>
 <20230727185945.401047-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727185945.401047-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: d20fc3ea-5f6d-43c4-b228-08db8f0a6a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJk/SK1DhqfTIR/bJGAygNsV2o/lPRh+f58rUkq8eiemPvnl/GcSoPkeRHsVIuFyeAZEZ7J8RarhJecpbFAbUooVMWcquyNWITd9kj0Esu+xE3aYcQ930F65WLFjs/8JGgoGoK8gZeDLx5uprgaoGUdyU/4V+4r7unB4gNGwH/B91mhEwCcYPz1l/kQIIX7qXkIOu1OtK7VNwS6xoksYjEeFk9ixm7EdTWB8WLkTuXwMuAqlU5AlxUiiCWEMzSKUsZrMNk6EmT4qOu9Z7VsnpuVO4oVCcgeTH75PJTdr7YK3MyrjX1oInILWjmUFyeEvEolt+b1PPsH2BhpvfTgah23DH6Z8KPA+tNfGqziEeD+O7S/gieppc84bnzVCsKhVDBIC5wgJzy8ybDFDlQHR1jzFgkyR/q4SZ/vsgbt9Mvg822lFZvSRdl4O6vDjyh1HFgMoLx1u8YU/Nap7lKjD/7b375HTp4lgBdMipr6xiaGEyNb3SFMoPS220ibG94h/rg4F4PbToXY7hYSUOsm13Gfm2BEaQOD4Hy8VfdmoN6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(316002)(8676002)(41300700001)(66476007)(8936002)(6506007)(26005)(6862004)(82960400001)(4326008)(478600001)(66946007)(6636002)(966005)(6512007)(66556008)(6666004)(6486002)(38100700002)(2906002)(83380400001)(86362001)(44832011)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LM7Uw0RI7RGLZVih01vJLQRT2Ng2b1oUhLBsfdW0G5plSJWmdehwAlWKsKRk?=
 =?us-ascii?Q?ITAgpN49dOmT3ioLCckAfvvqDqFKq4V8DbS5qryKBI/3M7mKCnX6uIq8Cj3D?=
 =?us-ascii?Q?tMsDoq5EqycRFPwYw0CLABYJ6N85dNSvZieOsNtmxPE9NS4BiOIr0nuhPs0h?=
 =?us-ascii?Q?b8lb134uKd53nrc7USP0H9/OjJgl/+0E9KIfafEXmlfeOT5mcls26dJaU80O?=
 =?us-ascii?Q?kLyAjne43p+AwVhgTHJqCyjIr6XkkrSXX9rHf4veRMdfp4yK+nTXyCURPHSY?=
 =?us-ascii?Q?dgFcLyiA5jfDrWGHU1/qgqCZ7/TqpFM3h11WUKxc6X2wl+HMgWnNDcOvo/dK?=
 =?us-ascii?Q?iThMmvJF1FlTcbFZxEV80nkwAXJ+8Pz1YZbCPd8K4NFO9v6fkilnTNMx951v?=
 =?us-ascii?Q?QqMwg5rYGZGRukHWDc2LrEIwsclbu1bWcAK37KKDa+gZkBL5ecF678mpOj5Q?=
 =?us-ascii?Q?uaAGLc+gYf14J4Zh1q5Igldzwt5UfIn4hjVLIZAebRshRy6HcVDTDYw7eQFW?=
 =?us-ascii?Q?PUM83BSEvnKMWvGgFDixLKEagYs+tNa+Dhj6qoS7NWp/Wi2Y/YnUa7Ot8Njd?=
 =?us-ascii?Q?MVSg3WIWsGtRYuMl+29Y577iWygcg/yKDkqU2rDTDBbVa8gAPt+8veY8hb8S?=
 =?us-ascii?Q?v1b+nDECoOz+LE6vSXCKURi42n7bYZRpOTX9DBV2EKcZ8gg9WbSjjRERGEL2?=
 =?us-ascii?Q?BNEKH7P1uPlT3U1b3P81Cz+n85TdDp8zRya6ws1GLN2l7sdduQPLWlcqsLLm?=
 =?us-ascii?Q?sIf0TSEEpU9pksDKirnivtH2KfVrAUggtghoXQmvKrU/3IzE/hNhKua1ZUhP?=
 =?us-ascii?Q?zSLnCJhY9zKR4xWtMefmC8MTcZK48lLwrYW3DDFCox0SjDsECJBAWl/IyKcp?=
 =?us-ascii?Q?GK77gD7rP88HxXYboP8qj6yAkFrd2Gg6HCX8boQuOgPym0lccrvtdsoignqi?=
 =?us-ascii?Q?KyUyY+1ez/sPvGhWiT/MpcFJokYYnVCSzCVfAP2Kc2G1pQQTJs0qwUBD9EcV?=
 =?us-ascii?Q?LExVyxMSBCZtUnTaYued+9LnmKOdJ3jD+cT/pMEHNplVkN/rxwb3omtpp5ZQ?=
 =?us-ascii?Q?STt6tn0JEMqcbqEpRyddhA3iD0SSadjLnUDNiEGFG6G660Ec1FeewzjdrpkK?=
 =?us-ascii?Q?LYl/3xbCimXZT1qj4g2jf3n8Kb2A6IJDhcDZDIAhX/zIBDZRJpka5EZlEIl4?=
 =?us-ascii?Q?jUu1Uho0V0rtuHSLqsqppxLxd/dkXIfavP58sGPtx56XFnKuR8qW9sf/3ib9?=
 =?us-ascii?Q?A/LNYfWEZ7M7H51ALxwnYsj6MwpH/Hon1NezVrB0csQVkb0hJjMmrrPwJ3we?=
 =?us-ascii?Q?/y2kM7g9bBZpk8lAp7eX6ELqXVEkXOqNpWK7xnbv1oQp9tEQ9xn3kxYpl9z7?=
 =?us-ascii?Q?1bI1AXCI39mo0kTRRvPv4kfQupOFxMhYlv1Co3Ts7mfODxjZ4FiV84tOeN4J?=
 =?us-ascii?Q?Y6pQkK48sVDcRzYjJfZnduedYVDoQMFJFq0EpZX2W9/KQMYHKf1oFRMKCD+u?=
 =?us-ascii?Q?/r+wbQOBg3ATPwcyIjMPFoWdM4dnAqwWA08pW0bTi5DuQwuB1l515Oa6ftUz?=
 =?us-ascii?Q?aToIMDZPQiHdQ+sQqMkQb2X+EYcU0oKrOXnWyMDMLww359r8jE+LVc/HvBoh?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d20fc3ea-5f6d-43c4-b228-08db8f0a6a5d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 01:31:50.1515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7keDQGETitV66M1eqPHUX1W6vteFbmvy4EVhu3rNGf/zZ0uSzvazK38rcyCPp5Ztn3JLmztMIkHzHJv/pDzXWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: split kernel vs permanent engine
 flags
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

On Thu, Jul 27, 2023 at 11:59:44AM -0700, Daniele Ceraolo Spurio wrote:
> If an engine is only destroyed on driver unload, we can skip its
> clean-up steps with the GuC because the GuC is going to be tuned off as
> well, so it doesn't matter if we're in sync with it or not. Currently,
> we apply this optimization to all engines marked as kernel, but this
> stops us to supporting kernel engines that don't stick around until
> unload. To remove this limitation, add a separate flag to indicate if
> the engine is expected to only be destryed on driver unload and use that
> to trigger the optimization.
> 
> While at it, add a small comment to explain what each engine flag
> represents.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c       |  3 +++
>  drivers/gpu/drm/xe/xe_engine_types.h | 20 ++++++++++++++------
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 12 ++++++------
>  drivers/gpu/drm/xe/xe_migrate.c      |  4 ++--
>  4 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index c30810a687b1..a08001f85e39 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -33,6 +33,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>  	int err;
>  	int i;
>  
> +	/* only kernel engines can be permanent */
> +	XE_BUG_ON((flags & ENGINE_FLAG_PERMANENT) && !(flags & ENGINE_FLAG_KERNEL));

Same as last patch, use XE_WARN_ON here.

> +
>  	e = kzalloc(sizeof(*e) + sizeof(struct xe_lrc) * width, GFP_KERNEL);
>  	if (!e)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
> index 7aa5d9ef7896..6802fdc10ec8 100644
> --- a/drivers/gpu/drm/xe/xe_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_engine_types.h
> @@ -52,14 +52,22 @@ struct xe_engine {
>  	/** @fence_irq: fence IRQ used to signal job completion */
>  	struct xe_hw_fence_irq *fence_irq;
>  
> +/* engine no longer allowed to submit */
>  #define ENGINE_FLAG_BANNED		BIT(0)
> +/* engine used for kernel submission only */
>  #define ENGINE_FLAG_KERNEL		BIT(1)
> -#define ENGINE_FLAG_PERSISTENT		BIT(2)
> -#define ENGINE_FLAG_COMPUTE_MODE	BIT(3)
> -/* Caller needs to hold rpm ref when creating engine with ENGINE_FLAG_VM */
> -#define ENGINE_FLAG_VM			BIT(4)
> -#define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(5)
> -#define ENGINE_FLAG_WA			BIT(6)
> +/* kernel engine only destroyed at driver unload */
> +#define ENGINE_FLAG_PERMANENT		BIT(2)
> +/* engine keeps running pending jobs after destroy ioctl */
> +#define ENGINE_FLAG_PERSISTENT		BIT(3)
> +/* engine for use with compute VMs */
> +#define ENGINE_FLAG_COMPUTE_MODE	BIT(4)
> +/* for VM jobs. Caller needs to hold rpm ref when creating engine with this flag */
> +#define ENGINE_FLAG_VM			BIT(5)
> +/* child of VM engine for multi-tile VM jobs */
> +#define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(6)
> +/* engine used for WA setup */
> +#define ENGINE_FLAG_WA			BIT(7)
>  
>  	/**
>  	 * @flags: flags for this engine, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c5b265624344..6893a19e6676 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -943,7 +943,7 @@ static void __guc_engine_fini_async(struct work_struct *w)
>  	drm_sched_entity_fini(&ge->entity);
>  	drm_sched_fini(&ge->sched);
>  
> -	if (!(e->flags & ENGINE_FLAG_KERNEL)) {
> +	if (!(e->flags & ENGINE_FLAG_PERMANENT)) {

This will conflict with one my patches in flight [1] but easy rebase
either way.

[1] https://patchwork.freedesktop.org/patch/549741/?series=121464&rev=1

With the s/BUG/WARN/:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  		kfree(ge);
>  		xe_engine_fini(e);
>  	}
> @@ -951,13 +951,13 @@ static void __guc_engine_fini_async(struct work_struct *w)
>  
>  static void guc_engine_fini_async(struct xe_engine *e)
>  {
> -	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
> +	bool permanent = e->flags & ENGINE_FLAG_PERMANENT;
>  
>  	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
>  	queue_work(system_wq, &e->guc->fini_async);
>  
> -	/* We must block on kernel engines so slabs are empty on driver unload */
> -	if (kernel) {
> +	/* We must block on permanent kernel engines so slabs are empty on driver unload */
> +	if (permanent) {
>  		struct xe_guc_engine *ge = e->guc;
>  
>  		flush_work(&ge->fini_async);
> @@ -983,7 +983,7 @@ static void __guc_engine_process_msg_cleanup(struct drm_sched_msg *msg)
>  	struct xe_engine *e = msg->private_data;
>  	struct xe_guc *guc = engine_to_guc(e);
>  
> -	XE_BUG_ON(e->flags & ENGINE_FLAG_KERNEL);
> +	XE_BUG_ON(e->flags & ENGINE_FLAG_PERMANENT);
>  	trace_xe_engine_cleanup_entity(e);
>  
>  	if (engine_registered(e))
> @@ -1218,7 +1218,7 @@ static void guc_engine_fini(struct xe_engine *e)
>  {
>  	struct drm_sched_msg *msg = e->guc->static_msgs + STATIC_MSG_CLEANUP;
>  
> -	if (!(e->flags & ENGINE_FLAG_KERNEL))
> +	if (!(e->flags & ENGINE_FLAG_PERMANENT))
>  		guc_engine_add_msg(e, msg, CLEANUP);
>  	else
>  		__guc_engine_fini(engine_to_guc(e), e);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index aad76a6a8094..efaf35cd8963 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -343,11 +343,11 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  
>  		m->eng = xe_engine_create(xe, vm,
>  					  BIT(hwe->logical_instance), 1,
> -					  hwe, ENGINE_FLAG_KERNEL);
> +					  hwe, ENGINE_FLAG_KERNEL | ENGINE_FLAG_PERMANENT);
>  	} else {
>  		m->eng = xe_engine_create_class(xe, primary_gt, vm,
>  						XE_ENGINE_CLASS_COPY,
> -						ENGINE_FLAG_KERNEL);
> +						ENGINE_FLAG_KERNEL | ENGINE_FLAG_PERMANENT);
>  	}
>  	if (IS_ERR(m->eng)) {
>  		xe_vm_close_and_put(vm);
> -- 
> 2.41.0
> 
