Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C52C001DC
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 01:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45AF10E640;
	Fri, 28 Jul 2023 01:51:15 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED1810E1E7
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 01:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690509072; x=1722045072;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kWwujl76dxUaAFW+1y6sHEAX9hP6jHEKvyTvR8Wg71Y=;
 b=hSQLkawUMyN3Pw0sp+QJqZoF8ZEQfUZjtRVoo0ESTbYNThOTEiz6ICjm
 JCXbvvJK7Sv4NQA/RMnCOPdvEFOBkTb+rwn9lFJwImfIl27AVtm0fmsDg
 8wTZ7fYZ+xPjUqAP9gqlFRhJjCKY3qYNMdBs7SpwwzpFG9godn110xJob
 Du8T8q9oKM/uOlzujgQSs6anRWydTkwCxpRma8yp8njypLWyhRIYqYGvL
 nLOML9Y4L808JI17ACKNkkY8kSWQJ8s/1+9ZOYakXzjpbFrOxD4zF1Dr7
 xNCE8qTvg+uAsP+E5gWN5YWVLVa8yYMdMzfnphcg+gxF4tHoybTR2QDbG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365942331"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="365942331"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 18:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="721079315"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="721079315"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 27 Jul 2023 18:51:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 18:50:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 18:50:59 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 18:50:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gq/IatxSl/dOXkTszOC9r46WlUo+/WePkXjuLYYvwPSqpCD5chwBDkzkCeCkqNck4vVesb/QLKpehb5zfAZeGCMoPVNo/lYz3eZbHQtscdJ4+ELjCHPpPhSdfn0vVT6V5Z96D3uyuTiovBfunTvk3vtSO2qew/btdlrqbgtUlwP6E8p6p91WovCzoKuNdaNldgHAdoM3zE8l7rcOdgfbBaZ7vnWdpoHz8v0KIMyppgAl3FP0JRtOBo2aaxkdRUJkqOQVkivm6ewyGJ2h5yLsaCMrHsCfo6J8vOy3kRi003nGYuz+k6rJUo4TO9vGpZ7RjaCdThu+cMZRPSv6pqpf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2lmdXaztaacOuIW/VCPoisIMQGgtTQODNToIgf2F+Q=;
 b=gOlbO8nmaSR1WVmxr+5Sns5N067QaBL+AEeST4u+hOjG/lUVh+3MuYyZRlIj97D7zc5tLCm5pJBaJQKp/H6jc6Ntmidw5EbXsTa0ZGA7Z6t0ekkYrz33FiN6EnUOtzm/IrCoAF2vOYkGmmIXF2Tp310toG6Z+M+vY4v7UOBpzX/nGYAnANOkTCuPzkPG6ZBt0ug3Hx0PCzLhkQn1oi8aivTylJfsZkljq1kJeYSOsa/iVoHX9ZRhc9F6pyReL4OYpT7k3Df1P/m9lcjWgJ+WfakyeDHebSsASF/2cLo4macyyzeR1DW05SnzM8LHEPVL1ALSYkksYZ9XUyMV6ChC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 01:50:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 01:50:47 +0000
Date: Fri, 28 Jul 2023 01:50:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZMMeyIq+fd+ge4gM@DUT025-TGLU.fm.intel.com>
References: <20230727185945.401047-1-daniele.ceraolospurio@intel.com>
 <20230727185945.401047-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727185945.401047-4-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a03:505::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: 41cffbcf-7ea0-44a6-d38a-08db8f0d102a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LX63nztJf2UoVPo+jEfcTYM0X5+vDSLkYAoh0r+GbFxI6bxcK4xWxH53lE9K9HeoW+c85WLhQTqZRsEIoinrxIJaaFDkTYrVhJvc47GCfcw9oCnkLq6pE47tyD2J4ctIlIF9yWlnxmGi2e/nxHJeraB0NcQVa2a98iIrcpSJZfljmCv8nhiW2SvSg4s6PY6/N3MvYQqx/rPl6i/wYD1nHT52XaKKlE2xTATZc2v51wyJjb87uRoBKLC6qhu0oij/LF94bMmkbKwYSusHlY7DjoXdvtzcsCXOeMJFDQvwhiQGXuHINCS+ZRfzLaZ0S7vBVsrfbNEV+xKLlpU+3291ms9yb0TCLazpuHWOmwHnFMzzHo56SGxD7Mnbb6yUMMzveSye+AeZyv5T0i3Jp9+v824PFQr7sIsnIvozHhuFNWVIYoV6aUpL8qLxSBaHTa4qxdu5YE64c3fc2lW1f3JFhhNWtxDxrQgBT5GwvNgJTqh0uReYNk7vPb3CgE5+HDk9KeMHbO2WXig1D3vQp8CL1oDSCMS+rXN6SEVFKzjAq9SlDff3KXNJLzvupqnrNOyi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(478600001)(6512007)(6486002)(6666004)(6506007)(66476007)(26005)(2906002)(6862004)(66556008)(316002)(8936002)(8676002)(5660300002)(41300700001)(44832011)(66946007)(82960400001)(6636002)(38100700002)(4326008)(86362001)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WrHAzgrrV/85p3N81cfn67H9c6XMosMr0y5BpMPJyXzedQAU0R23K+gPgMo3?=
 =?us-ascii?Q?ofr0KUpv54R8pnoJZzyerJv//LBDLXl6qexWlrg85g7FINYtFx1tCjekI2yg?=
 =?us-ascii?Q?Sb1wnWRKQRvHIwZpRM05UY8qOtw+E17rm55UgnNtN2uWyZWzaJz6X884dHaS?=
 =?us-ascii?Q?c2MJJm3yeR8xjbeME3tZy5MdqmaLTsYvaVrZC3yZvWTpswSd7Xhfge4hRfYs?=
 =?us-ascii?Q?Qhn9IMO55mVn6rwVubpr8BQUPMr/ewhlbCGDTcrhRFZEBaUXSM4LrrmnDozU?=
 =?us-ascii?Q?G5JF1ECWLwL08SM5uDx7GJQSy/9NcbIvNXh5l330HuSrM0kSSQmGHjlB3VrB?=
 =?us-ascii?Q?vE0RuZTrdHaaPHmnHTmklZNA6rWJd7u6dfamr4u9Ikruxxydn0fQnjhCqID+?=
 =?us-ascii?Q?DgniMP38ZVpW8XFTb8WBFcTkvXRLebAb1r5fNI+3UmK9QT85F8y/yDm7OP5l?=
 =?us-ascii?Q?s/k3Lmf16wl0ba00n4PcgN8yNTnzvxBsfF0ud6QFfn1Aj9Y59ozQKbKwc6xF?=
 =?us-ascii?Q?81csoLPo9OD7bsTza1JCxBsf87/rvOiro/RDbu/IAzaGGNUnV0NqNGH3gPWF?=
 =?us-ascii?Q?kQ8HN+SqBQzklIzCrg8gs3qVF369lg3h2L5F2InCQFfG513fEYZf9j/LRuLi?=
 =?us-ascii?Q?0QUcsfjC6oZoGQCQ0kT4GOCuxgf7M7Ykey0qDzeEfgbltT3+3Wweh+l9CUNr?=
 =?us-ascii?Q?THoTHB80gKyZwSZRQu3eh/YFaRiSLuYHefYfYkJ/PtILJ8tt5mzyYNBaQ2u3?=
 =?us-ascii?Q?j4GgA1EDzmgtP7wuEriqZa1cJuZtQgLAri6AX2xY1SRcRMVjwQ0jo/qyGf1t?=
 =?us-ascii?Q?DEKp99e8YxTb2yxfqghbtP1HYfZzlwRySFaq4H/4J+bFLXIHx9viVEYON1CW?=
 =?us-ascii?Q?wuPJzA4RBOdvhuo4QmTpy/3gRx8XVhJf3yMTnUvCQCVqHZAIR53VnHySO+zl?=
 =?us-ascii?Q?Hj/rB2t9R5pw/IWIiz/fTRUXiTQosF/wQjZ7wm6ZIO1XAU6wJh3IPudmhjdc?=
 =?us-ascii?Q?JORNDQln6yEEhsWpCttAcqQd2IVlfb4Yd//QYFF56q0AzA6yHiC7mNMzM3pK?=
 =?us-ascii?Q?GEJ2wVVxsweeipU+Txt+1ynqmRmkpjJdGtth3LWyiMF1jSeFN3Rfv4DMFzg0?=
 =?us-ascii?Q?o9UiZKpp+0u0JOGIB0SyYI6R4jlL/hAxBGoyDloPSP9hNFWEWUUX1OM4325L?=
 =?us-ascii?Q?c52k/wKCU3eLDMLnOE+CNo+h8HIqV9jsbNr04yjzMN05TVW8tafoFodCp0GP?=
 =?us-ascii?Q?7K+KvfZLDiSCrBadAgdSXeBjy6/+VUsxs1EoIg5gKgvUrUBGEE/RQTYmgVu3?=
 =?us-ascii?Q?Dj+vQ8JAkoI4giibANtw4AUUZtNTuXLRoLl9sKScqZKDKnhUVyBGwMEol8BX?=
 =?us-ascii?Q?3OKS4IuDN3s7Z9wRTQM8wI0iQjVNSbU+hm0pUouWW2YY6Gu9GS8VWhZQASFC?=
 =?us-ascii?Q?sWdxgxtT8LEoFVXiVhX7nZ8T7yOUe7aq+zkVo7Rzz67fGV9gkW3jhUYfeJ2d?=
 =?us-ascii?Q?hAJxhUILC006nR3RkcpiWgL1GZmaXzvaMNkgR0Pgvgxp62FAU+jcxu8mUsex?=
 =?us-ascii?Q?N4bIYvozSa9J+Vy/GYhPtugNc0WVvOsHxHsMPQjnosO8pGMc9sxi172b5tOk?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cffbcf-7ea0-44a6-d38a-08db8f0d102a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 01:50:47.3138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+9wKAxBW9/+qtnY+msFV1ThSsPK8ucFa0b/nFlrAgH/F0OJ5i/gqaxnpd9Np+lqxEkIbT3NckUxaYadxwXVtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: standardize vm-less kernel
 submissions
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

On Thu, Jul 27, 2023 at 11:59:45AM -0700, Daniele Ceraolo Spurio wrote:
> The current only submission in the driver that doesn't use a vm is the
> WA setup. We still pass a vm structure (the migration one), but we don't
> actually use it at submission time and we instead have an hack to use
> GGTT for this particular engine.
> Instead of special-casing the WA engine, we can skip providing a VM and
> use that as selector for whether to use GGTT or PPGTT. As part of this
> change, we can drop the special engine flag for the WA engine and switch
> the WA submission to use the standard job functions instead of dedicated
> ones.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bb.c           | 10 ----------
>  drivers/gpu/drm/xe/xe_bb.h           |  2 --
>  drivers/gpu/drm/xe/xe_engine_types.h |  2 --
>  drivers/gpu/drm/xe/xe_gt.c           | 23 +++++++----------------
>  drivers/gpu/drm/xe/xe_ring_ops.c     |  2 +-
>  drivers/gpu/drm/xe/xe_sched_job.c    |  6 ++----
>  6 files changed, 10 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index f9b6b7adf99f..8d4e645d43c5 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -73,16 +73,6 @@ __xe_bb_create_job(struct xe_engine *kernel_eng, struct xe_bb *bb, u64 *addr)
>  	return xe_sched_job_create(kernel_eng, addr);
>  }
>  
> -struct xe_sched_job *xe_bb_create_wa_job(struct xe_engine *wa_eng,
> -					 struct xe_bb *bb, u64 batch_base_ofs)
> -{
> -	u64 addr = batch_base_ofs + drm_suballoc_soffset(bb->bo);
> -
> -	XE_BUG_ON(!(wa_eng->vm->flags & XE_VM_FLAG_MIGRATION));
> -
> -	return __xe_bb_create_job(wa_eng, bb, &addr);
> -}
> -
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_engine *kernel_eng,
>  						struct xe_bb *bb,
>  						u64 batch_base_ofs,
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 0cc9260c9634..d1d55bccbf45 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -20,8 +20,6 @@ struct xe_sched_job *xe_bb_create_job(struct xe_engine *kernel_eng,
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_engine *kernel_eng,
>  						struct xe_bb *bb, u64 batch_ofs,
>  						u32 second_idx);
> -struct xe_sched_job *xe_bb_create_wa_job(struct xe_engine *wa_eng,
> -					 struct xe_bb *bb, u64 batch_ofs);
>  void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
> index 6802fdc10ec8..6ddc92b57c51 100644
> --- a/drivers/gpu/drm/xe/xe_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_engine_types.h
> @@ -66,8 +66,6 @@ struct xe_engine {
>  #define ENGINE_FLAG_VM			BIT(5)
>  /* child of VM engine for multi-tile VM jobs */
>  #define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(6)
> -/* engine used for WA setup */
> -#define ENGINE_FLAG_WA			BIT(7)
>  
>  	/**
>  	 * @flags: flags for this engine, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3e32d38aeeea..de0a9683ad68 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -85,15 +85,13 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
>  	struct xe_sched_job *job;
>  	struct xe_bb *bb;
>  	struct dma_fence *fence;
> -	u64 batch_ofs;
>  	long timeout;
>  
>  	bb = xe_bb_new(gt, 4, false);
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
> -	batch_ofs = xe_bo_ggtt_addr(gt_to_tile(gt)->mem.kernel_bb_pool->bo);
> -	job = xe_bb_create_wa_job(e, bb, batch_ofs);
> +	job = xe_bb_create_job(e, bb);
>  	if (IS_ERR(job)) {
>  		xe_bb_free(bb, NULL);
>  		return PTR_ERR(job);
> @@ -122,7 +120,6 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
>  	struct xe_sched_job *job;
>  	struct xe_bb *bb;
>  	struct dma_fence *fence;
> -	u64 batch_ofs;
>  	long timeout;
>  	int count = 0;
>  
> @@ -141,8 +138,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
>  		}
>  	}
>  
> -	batch_ofs = xe_bo_ggtt_addr(gt_to_tile(gt)->mem.kernel_bb_pool->bo);
> -	job = xe_bb_create_wa_job(e, bb, batch_ofs);
> +	job = xe_bb_create_job(e, bb);
>  	if (IS_ERR(job)) {
>  		xe_bb_free(bb, NULL);
>  		return PTR_ERR(job);
> @@ -166,14 +162,12 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
>  int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
>  	int err = 0;
>  
>  	for_each_hw_engine(hwe, gt, id) {
>  		struct xe_engine *e, *nop_e;
> -		struct xe_vm *vm;
>  		void *default_lrc;
>  
>  		if (gt->default_lrc[hwe->class])
> @@ -190,14 +184,13 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		if (!default_lrc)
>  			return -ENOMEM;
>  
> -		vm = xe_migrate_get_vm(tile->migrate);
> -		e = xe_engine_create(xe, vm, BIT(hwe->logical_instance), 1,
> -				     hwe, ENGINE_FLAG_WA);
> +		e = xe_engine_create(xe, NULL, BIT(hwe->logical_instance), 1,
> +				     hwe, ENGINE_FLAG_KERNEL);
>  		if (IS_ERR(e)) {
>  			err = PTR_ERR(e);
>  			xe_gt_err(gt, "hwe %s: xe_engine_create failed (%pe)\n",
>  				  hwe->name, e);
> -			goto put_vm;
> +			return err;
>  		}
>  
>  		/* Prime golden LRC with known good state */
> @@ -208,8 +201,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  			goto put_engine;
>  		}
>  
> -		nop_e = xe_engine_create(xe, vm, BIT(hwe->logical_instance),
> -					 1, hwe, ENGINE_FLAG_WA);
> +		nop_e = xe_engine_create(xe, NULL, BIT(hwe->logical_instance),
> +					 1, hwe, ENGINE_FLAG_KERNEL);
>  		if (IS_ERR(nop_e)) {
>  			err = PTR_ERR(nop_e);
>  			xe_gt_err(gt, "hwe %s: nop xe_engine_create failed (%pe)\n",
> @@ -243,8 +236,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		xe_engine_put(nop_e);
>  put_engine:
>  		xe_engine_put(e);
> -put_vm:
> -		xe_vm_put(vm);
>  		if (err)
>  			break;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 8e21c19cb041..bc0fdd4ef188 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -202,7 +202,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
>  
>  static u32 get_ppgtt_flag(struct xe_sched_job *job)
>  {
> -	return !(job->engine->flags & ENGINE_FLAG_WA) ? BIT(8) : 0;
> +	return job->engine->vm ? BIT(8) : 0;
>  }
>  
>  static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index e1af1f2a44c2..68f446e8c081 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -59,8 +59,7 @@ static struct xe_sched_job *job_alloc(bool parallel)
>  
>  bool xe_sched_job_is_migration(struct xe_engine *e)
>  {
> -	return e->vm && (e->vm->flags & XE_VM_FLAG_MIGRATION) &&
> -		!(e->flags & ENGINE_FLAG_WA);
> +	return e->vm && (e->vm->flags & XE_VM_FLAG_MIGRATION);
>  }
>  
>  static void job_free(struct xe_sched_job *job)
> @@ -91,8 +90,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_engine *e,
>  	XE_BUG_ON(!e->vm && !(e->flags & ENGINE_FLAG_KERNEL));
>  
>  	/* Migration and kernel engines have their own locking */
> -	if (!(e->flags & (ENGINE_FLAG_KERNEL | ENGINE_FLAG_VM |
> -			  ENGINE_FLAG_WA))) {
> +	if (!(e->flags & (ENGINE_FLAG_KERNEL | ENGINE_FLAG_VM))) {
>  		lockdep_assert_held(&e->vm->lock);
>  		if (!xe_vm_no_dma_fences(e->vm))
>  			xe_vm_assert_held(e->vm);
> -- 
> 2.41.0
> 
