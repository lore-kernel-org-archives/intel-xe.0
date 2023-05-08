Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F68C77B7C
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 01:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8F910E08F;
	Mon,  8 May 2023 01:15:06 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FA910E08F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 01:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683508504; x=1715044504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O4FcBuEgHIoX6KFiKYwewF/tfIUv2hw1lrokPLpBzm0=;
 b=XzeuRo7KtfkkoTs+JXRB9NNsn45jmaqV+KR7u6PYcBOmtnhDjAOQydvR
 BVeA8uTO5BW3K+IgOaKGbE8bFvuZD4eG5id0vqVI8PZi7JO/vvLOECNDW
 wD3MvXMEwvpheDWd0WhIxf2agnqLFcAKLbR7BsORo6QVsVuDJSz7IS+lj
 pd1p0AFWjkxxO9D4XF8pVWtLjJ/eXCIDNgIQU+d0ncFXs6/zFM0129FKy
 5wKtP1/kCksu9RZ6J14E56Hnfn/fGqyvFMulbAn8Z99ucbLGj4FRzlRDr
 Ilc78JrkTQHf2QsxrqGtEYWi1Ksmw3khMP7Oz1IsyOTuoua2V+G9FnwNa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="333964736"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="333964736"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 18:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="787914532"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="787914532"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 07 May 2023 18:15:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:15:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:15:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 7 May 2023 18:15:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 7 May 2023 18:15:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7Fle/c8EIvdoWzLpG8490tnS5MsobuT/w+5tbLtBkOFW/Dy15nQYOOJbFl6VlhCeD/i0MtADJfg2ezw+iruo3UXGqyi2o3GHZBRGl0aW1xQbyR3bi75/rCZGsTChZc6Twpqbnoy+gsii+m56LfyBmTE467iv2mdajh5zozRUf83d7cHgXf+hEX5OLuSnHpUjGIWr17BbQ5CH/ubtg+41NkUZl/EzKULSVA2r4ppNebTHyT3NiYbTQaf8KDGF4B8ogBg2m1fKpezoBoQRtRKB+4iKGi5JTRR1P1JHFLGSb1tYwgn3Rj+Jl7x4lhfUvt2E/1AX4DvLlUDEfkizjmpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuF79qcEPRsg+do+AYJg91C37cLTxUonbqG1EQcSmSc=;
 b=SUWMP50qkkpDzjR56CyV9GXIPvOzhmD+iryPpDAlon8fGz5SGAOSo93+dFqtkbECLaS7Wgs4p2virdyA1hOzYEeXobwcSy57SLXq0OkWq6uFIrRIwPixkL9sKbtmNnVzg+vSEq8FHvVVRPlZMHKdmDCiT6jBoo6BNZKctYaFTk6enjAVbXBxW9sZXYAtrS+aqhXt8fvG6Fwk2Cc9910b7E0yky+waOilnHdfONdL1L0ZajyKB+3JrieanWWqal+rxaHJ+YPz0fYafdmVOWMLovZPzA8kBAkgwykCSRE5NnjxcLYkgb/Xv4VS+hGp6crro9HEvp0NnPMk8DIUuEW9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 01:15:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 01:15:00 +0000
Date: Mon, 8 May 2023 01:14:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <ZFhM+I8vpWdDFHDp@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-6-matthew.brost@intel.com>
 <ZFVMytWsEZrqruUt@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFVMytWsEZrqruUt@rdvivi-mobl4>
X-ClientProxiedBy: SJ0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bfbd7d1-76cf-499c-4fb5-08db4f61a4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QonKbvL0kmv+nyMUNlWiVJrpBSRZma94qsp+BJY3LhoHPY1v3mW5tR02jEYSVwryqVyFHgtWF+mKioCNHS2FtT6ZYo2XsDsxUmRJRaoBdK8lZ6iaA+Y/ZOd4aCiLNTsFybCAqyzjYiUW0EwOntFFaz03lkRTWSn9XbM0n1EMRspFTuZglhGG7iBlIyuoPm4VYCy7gWH0Jx+hGybmidirBdm/wemJ9bP0OCxJn/FdnkJlDNStjgg76V7ha2eLcUdcJUSIBwMUvudHmDu0YdTA6T4XlbQbXeAMbZo6RmoQeydQsd3+uMPHDRtxAm42XKvZzh2g0I5DpjTJ5hrYYXtXq0/cpqOYsATuRKbEKo/pknBld5XgBFJrEEDXNXZM3FOw+3UOlVzaP9Qh+nK5eetm+WfeSPu/4DkBEE+ZbGADkSYGlLVVtT4yXZHR9kV2xq6orfNoFSd7jBY33Aj5bKAPVar/wseOVNH0NI4L3wQWkKV4uBKOh1gXnAusuNmHd2eu1ra6HJvsbzFg98BdsyQ96OkNQazKNDwZB9MZL9+HAQRKjlzC1606RvX1Nx4DFCUyIkYp6FbdSeKamkiQnW12SBKHEqHxWX6RJmK63BDeHl8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199021)(83380400001)(478600001)(6486002)(6666004)(6512007)(6506007)(26005)(186003)(44832011)(2906002)(30864003)(38100700002)(66476007)(66556008)(66946007)(6916009)(82960400001)(4326008)(41300700001)(5660300002)(8676002)(8936002)(86362001)(316002)(66899021)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oDT7pDTSEShcV7RKB6cho+4TQlmCzOEIFObo73NAGBaMxODz6TFNKhXyr5Yz?=
 =?us-ascii?Q?eN2R/y+86GuY6i/KRkzp36cDnaYmKHLdWNelGwrDa4/+8xYT3+GxiNMgsqfk?=
 =?us-ascii?Q?tKJjLeZs7OUvFNnfpLS8VfQXq8iHm4tr+9XTyb+ucbp3jvRASKDt6EfX0zsh?=
 =?us-ascii?Q?qnvyffCku2LRStU5k/6oGMYK/0MvoddpPmQnZlUjnBruHjmf3oZG3MY4F8kT?=
 =?us-ascii?Q?yQdXCq0BzcBHuwVOv79djrtSYb3UR/bahciSKnFoJu6WClikTyRSOkNy9RKG?=
 =?us-ascii?Q?usB3seUlyUtWNqbicb57JxHcTmpYrFSoGPAshQUgF0lrzHmiq576/sSiQFjv?=
 =?us-ascii?Q?sgoF7QRC6Jh6cu37/infRxOsc/rir9Ino1u3RHffm5SVXNe8NFeBzZ69J9mr?=
 =?us-ascii?Q?o4wuuUYF2gYauaZKII2V3qrNqX5cEp4Jt9sDG55B816VyBP/Xcn8dfyFAaJi?=
 =?us-ascii?Q?yKqxp0AnpNUndBZEPJZKoVYHqTwxBzCOLLMGFjUAbgJQ3XS310mf5N7I/y6n?=
 =?us-ascii?Q?l1vq2kQYVdDP74JPgwoWTIqhpa7etYY7YWbzvwzbFtrucBVlqWI9JqZ8ek05?=
 =?us-ascii?Q?sXiYpENQlz5iLyS54L3vLvu1MRcLtFoPNgr7ynGvlYHKdMROzjqNTm9uuCzI?=
 =?us-ascii?Q?Ci8s7nR1X+olXE5V+1YXknXS7oe7xn67SGZe+nkEgOSbPzWeQ0OhFVgkzHwv?=
 =?us-ascii?Q?+V+DFxNScL6oSDRgaP/WZfXmjE1nA+lLqJh8clUoOEv3Cpa052fXggisIgM7?=
 =?us-ascii?Q?t8bay+tzeghEMFMT4Sz3q5C4VWrHMNzVBnR7HDDSSi5t+frH0gfX6UoDncMy?=
 =?us-ascii?Q?6d4ooc3nuIBDo4W9HWJia4j27HEYytLCpNrVri6dDo13/+V57k5IHdObjoF9?=
 =?us-ascii?Q?pMnU8+EV3qKfdUfOIJm/ZwvdjUI52VxlWpkzCykvZC0k+/uHiyKquda68VBc?=
 =?us-ascii?Q?FKXCcAkuX6vYoyAd0emt0X2VaPrX6gmbLXiHwcejs/No33PDCyfIr2sn05jF?=
 =?us-ascii?Q?r92BAdlcUifKB8Iw7ZaanZdlCsj1QO1xKbcGUY4WJK4uZPO6QfzFndFQl7G0?=
 =?us-ascii?Q?TZ/HpKWlH/lvV02pNjTcRiUnTIILzgvRllSZYNk68Xi47axpyJcN6KXPwROw?=
 =?us-ascii?Q?uMiCNxGVDWn/+pJCfkeNze0G/WlbYrQtl644ohhYG7LKj3kleCJv26Ttf48d?=
 =?us-ascii?Q?Yxf/u4DEHEaDY0YwkVVNCRM/aFhM0EPiNjaXdBWtKP8hFjXNDlWbWcjDAszu?=
 =?us-ascii?Q?0nTn9Bt+0N51Ism8ctH7Ywk6uF1ytc4PkgTppBV6g3QNNceIcmgXZqeLcapd?=
 =?us-ascii?Q?cuc92KjacMBJWzy2+UGEMe72JrJik41wLQVc2nUw8ggMb8OLD1eFtdthOrKU?=
 =?us-ascii?Q?CCRHkQUJMVX/Z9cuAJ1edANVFVUHWFOjbTIkltlvsACoZzi8cwOfAlicja3g?=
 =?us-ascii?Q?oZDBnXzlFsznsDGJA4SVodYZOIE7zZYKgICFAusUkx72krhl7Mxueh8XV+op?=
 =?us-ascii?Q?85I8lyYpdcjfBmoEey0DYZL0LDwuefTPw12HLPS4OxPEGlSMVPLTg3Jpkh27?=
 =?us-ascii?Q?ajUKdEFcwFEK3MuLs86llmgM4g6KRZegI0J3bhPlo5+61w+k8IqbSo/iRVzb?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfbd7d1-76cf-499c-4fb5-08db4f61a4cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 01:15:00.1045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcP4L+22fGJymfhger76M1UeXsX29+P1UrSkdQ5Ci6/FA7VYgxItgBhfJ8h8d5EFhQ59cYdMGJysU8B57eBqIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/31] drm/xe: Long running job update
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

On Fri, May 05, 2023 at 02:36:58PM -0400, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:01PM -0700, Matthew Brost wrote:
> > Flow control + write ring in exec, return NULL in run_job, siganl
> 
> typo: s/siganl/signal
> 

Yep.

> > xe_hw_fence immediately, and override TDR for LR jobs.
> 
> So, this would likely be the recommendation on how to deal with
> the lack of completion fence right?! Could you please put a more
> descriptive text that we could convert to a documentation later?
>

Sure, let write something a bit longer here. In my next drm scheduler
series upstream I'll likely need a bit of DOC in drm scheduler anyways.

Matt

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_engine.c           | 32 ++++++++
> >  drivers/gpu/drm/xe/xe_engine.h           |  4 +
> >  drivers/gpu/drm/xe/xe_exec.c             |  8 ++
> >  drivers/gpu/drm/xe/xe_guc_engine_types.h |  2 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 95 +++++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_trace.h            |  5 ++
> >  6 files changed, 137 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index 094ec17d3004..d1e84d7adbd4 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -18,6 +18,7 @@
> >  #include "xe_macros.h"
> >  #include "xe_migrate.h"
> >  #include "xe_pm.h"
> > +#include "xe_ring_ops_types.h"
> >  #include "xe_trace.h"
> >  #include "xe_vm.h"
> >  
> > @@ -673,6 +674,37 @@ static void engine_kill_compute(struct xe_engine *e)
> >  	up_write(&e->vm->lock);
> >  }
> >  
> > +/**
> > + * xe_engine_is_lr() - Whether an engine is long-running
> > + * @e: The engine
> > + *
> > + * Return: True if the engine is long-running, false otherwise.
> > + */
> > +bool xe_engine_is_lr(struct xe_engine *e)
> > +{
> > +	return e->vm && xe_vm_no_dma_fences(e->vm) &&
> > +		!(e->flags & ENGINE_FLAG_VM);
> 
> Why do we have this ENGINE_FLAG_VM here?
> 
> > +}
> > +
> > +static s32 xe_engine_num_job_inflight(struct xe_engine *e)
> > +{
> > +	return e->lrc->fence_ctx.next_seqno - xe_lrc_seqno(e->lrc) - 1;
> > +}
> > +
> > +/**
> > + * xe_engine_ring_full() - Whether an engine's ring is full
> > + * @e: The engine
> > + *
> > + * Return: True if the engine's ring is full, false otherwise.
> > + */
> > +bool xe_engine_ring_full(struct xe_engine *e)
> > +{
> > +	struct xe_lrc *lrc = e->lrc;
> > +	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
> > +
> > +	return xe_engine_num_job_inflight(e) >= max_job;
> > +}
> > +
> >  /**
> >   * xe_engine_is_idle() - Whether an engine is idle.
> >   * @engine: The engine
> > diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> > index a49cf2ab405e..2e60f6d90226 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > @@ -42,6 +42,10 @@ static inline bool xe_engine_is_parallel(struct xe_engine *engine)
> >  	return engine->width > 1;
> >  }
> >  
> > +bool xe_engine_is_lr(struct xe_engine *e);
> > +
> > +bool xe_engine_ring_full(struct xe_engine *e);
> > +
> >  bool xe_engine_is_idle(struct xe_engine *engine);
> >  
> >  void xe_engine_kill(struct xe_engine *e);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index ea869f2452ef..44ea9bcd0066 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -13,6 +13,7 @@
> >  #include "xe_device.h"
> >  #include "xe_engine.h"
> >  #include "xe_macros.h"
> > +#include "xe_ring_ops_types.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_sync.h"
> >  #include "xe_vm.h"
> > @@ -277,6 +278,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		goto err_engine_end;
> >  	}
> >  
> > +	if (xe_engine_is_lr(engine) && xe_engine_ring_full(engine)) {
> > +		err = -EWOULDBLOCK;
> > +		goto err_engine_end;
> > +	}
> > +
> >  	job = xe_sched_job_create(engine, xe_engine_is_parallel(engine) ?
> >  				  addresses : &args->address);
> >  	if (IS_ERR(job)) {
> > @@ -363,6 +369,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		xe_sync_entry_signal(&syncs[i], job,
> >  				     &job->drm.s_fence->finished);
> >  
> > +	if (xe_engine_is_lr(engine))
> > +		engine->ring_ops->emit_job(job);
> >  	xe_sched_job_push(job);
> >  	xe_vm_reactivate_rebind(vm);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > index cbfb13026ec1..5d83132034a6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > @@ -31,6 +31,8 @@ struct xe_guc_engine {
> >  	 */
> >  #define MAX_STATIC_MSG_TYPE	3
> >  	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> > +	/** @lr_tdr: long running TDR worker */
> > +	struct work_struct lr_tdr;
> >  	/** @fini_async: do final fini async from this worker */
> >  	struct work_struct fini_async;
> >  	/** @resume_time: time of last resume */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 68d09e7a4cc0..0a41f5d04f6d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -500,6 +500,14 @@ static void register_engine(struct xe_engine *e)
> >  		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
> >  	}
> >  
> > +	/*
> > +	 * We must keep a reference for LR engines if engine is registered with
> > +	 * the GuC as jobs signal immediately and can't destroy an engine if the
> > +	 * GuC has a reference to it.
> > +	 */
> > +	if (xe_engine_is_lr(e))
> > +		xe_engine_get(e);
> > +
> >  	set_engine_registered(e);
> >  	trace_xe_engine_register(e);
> >  	if (xe_engine_is_parallel(e))
> > @@ -662,6 +670,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >  {
> >  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> >  	struct xe_engine *e = job->engine;
> > +	bool lr = xe_engine_is_lr(e);
> >  
> >  	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
> >  		  !engine_banned(e) && !engine_suspended(e));
> > @@ -671,14 +680,19 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >  	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
> >  		if (!engine_registered(e))
> >  			register_engine(e);
> > -		e->ring_ops->emit_job(job);
> > +		if (!lr)	/* Written in IOCTL */
> > +			e->ring_ops->emit_job(job);
> >  		submit_engine(e);
> >  	}
> >  
> > -	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
> > +	if (lr) {
> > +		xe_sched_job_set_error(job, -ENOTSUPP);
> > +		return NULL;
> > +	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> >  		return job->fence;
> > -	else
> > +	} else {
> >  		return dma_fence_get(job->fence);
> > +	}
> >  }
> >  
> >  static void guc_engine_free_job(struct drm_sched_job *drm_job)
> > @@ -782,6 +796,57 @@ static void simple_error_capture(struct xe_engine *e)
> >  }
> >  #endif
> >  
> > +static void xe_guc_engine_trigger_cleanup(struct xe_engine *e)
> > +{
> > +	struct xe_guc *guc = engine_to_guc(e);
> > +
> > +	if (xe_engine_is_lr(e))
> > +		queue_work(guc_to_gt(guc)->ordered_wq, &e->guc->lr_tdr);
> > +	else
> > +		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +}
> > +
> > +static void xe_guc_engine_lr_cleanup(struct work_struct *w)
> > +{
> > +	struct xe_guc_engine *ge =
> > +		container_of(w, struct xe_guc_engine, lr_tdr);
> > +	struct xe_engine *e = ge->engine;
> > +	struct drm_gpu_scheduler *sched = &ge->sched;
> > +
> > +	XE_BUG_ON(!xe_engine_is_lr(e));
> > +	trace_xe_engine_lr_cleanup(e);
> > +
> > +	/* Kill the run_job / process_msg entry points */
> > +	drm_sched_run_wq_stop(sched);
> > +
> > +	/* Engine state now stable, disable scheduling / deregister if needed */
> > +	if (engine_registered(e)) {
> > +		struct xe_guc *guc = engine_to_guc(e);
> > +		int ret;
> > +
> > +		set_engine_banned(e);
> > +		xe_engine_get(e);
> > +		disable_scheduling_deregister(guc, e);
> > +
> > +		/*
> > +		 * Must wait for scheduling to be disabled before signalling
> > +		 * any fences, if GT broken the GT reset code should signal us.
> > +		 */
> > +		smp_rmb();
> > +		ret = wait_event_timeout(guc->ct.wq,
> > +					 !engine_pending_disable(e) ||
> > +					 guc_read_stopped(guc), HZ * 5);
> > +		if (!ret) {
> > +			XE_WARN_ON("Schedule disable failed to respond");
> > +			drm_sched_run_wq_start(sched);
> > +			xe_gt_reset_async(e->gt);
> > +			return;
> > +		}
> > +	}
> > +
> > +	drm_sched_run_wq_start(sched);
> > +}
> > +
> >  static enum drm_gpu_sched_stat
> >  guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >  {
> > @@ -832,7 +897,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >  			err = -EIO;
> >  		set_engine_banned(e);
> >  		xe_engine_get(e);
> > -		disable_scheduling_deregister(engine_to_guc(e), e);
> > +		disable_scheduling_deregister(guc, e);
> >  
> >  		/*
> >  		 * Must wait for scheduling to be disabled before signalling
> > @@ -865,7 +930,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >  	 */
> >  	list_add(&drm_job->list, &sched->pending_list);
> >  	drm_sched_run_wq_start(sched);
> > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +	xe_guc_engine_trigger_cleanup(e);
> >  
> >  	/* Mark all outstanding jobs as bad, thus completing them */
> >  	spin_lock(&sched->job_list_lock);
> > @@ -889,6 +954,8 @@ static void __guc_engine_fini_async(struct work_struct *w)
> >  
> >  	trace_xe_engine_destroy(e);
> >  
> > +	if (xe_engine_is_lr(e))
> > +		cancel_work_sync(&ge->lr_tdr);
> >  	if (e->flags & ENGINE_FLAG_PERSISTENT)
> >  		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> >  	release_guc_id(guc, e);
> > @@ -906,7 +973,7 @@ static void guc_engine_fini_async(struct xe_engine *e)
> >  	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
> >  
> >  	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
> > -	queue_work(system_unbound_wq, &e->guc->fini_async);
> > +	queue_work(system_wq, &e->guc->fini_async);
> >  
> >  	/* We must block on kernel engines so slabs are empty on driver unload */
> >  	if (kernel) {
> > @@ -1089,12 +1156,16 @@ static int guc_engine_init(struct xe_engine *e)
> >  	if (err)
> >  		goto err_free;
> >  
> > +
> >  	sched = &ge->sched;
> >  	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
> >  				    &sched, 1, NULL);
> >  	if (err)
> >  		goto err_sched;
> >  
> > +	if (xe_engine_is_lr(e))
> > +		INIT_WORK(&e->guc->lr_tdr, xe_guc_engine_lr_cleanup);
> > +
> >  	mutex_lock(&guc->submission_state.lock);
> >  
> >  	err = alloc_guc_id(guc, e);
> > @@ -1146,7 +1217,7 @@ static void guc_engine_kill(struct xe_engine *e)
> >  {
> >  	trace_xe_engine_kill(e);
> >  	set_engine_killed(e);
> > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +	xe_guc_engine_trigger_cleanup(e);
> >  }
> >  
> >  static void guc_engine_add_msg(struct xe_engine *e, struct drm_sched_msg *msg,
> > @@ -1296,6 +1367,9 @@ static void guc_engine_stop(struct xe_guc *guc, struct xe_engine *e)
> >  	/* Stop scheduling + flush any DRM scheduler operations */
> >  	drm_sched_run_wq_stop(sched);
> >  
> > +	if (engine_registered(e) && xe_engine_is_lr(e))
> > +		xe_engine_put(e);
> > +
> >  	/* Clean up lost G2H + reset engine state */
> >  	if (engine_destroyed(e) && engine_registered(e)) {
> >  		if (engine_banned(e))
> > @@ -1520,6 +1594,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  	trace_xe_engine_deregister_done(e);
> >  
> >  	clear_engine_registered(e);
> > +	if (xe_engine_is_lr(e))
> > +		xe_engine_put(e);
> > +
> >  	if (engine_banned(e))
> >  		xe_engine_put(e);
> >  	else
> > @@ -1557,7 +1634,7 @@ int xe_guc_engine_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  	 */
> >  	set_engine_reset(e);
> >  	if (!engine_banned(e))
> > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +		xe_guc_engine_trigger_cleanup(e);
> >  
> >  	return 0;
> >  }
> > @@ -1584,7 +1661,7 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >  	/* Treat the same as engine reset */
> >  	set_engine_reset(e);
> >  	if (!engine_banned(e))
> > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +		xe_guc_engine_trigger_cleanup(e);
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 2f8eb7ebe9a7..02861c26e145 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -219,6 +219,11 @@ DEFINE_EVENT(xe_engine, xe_engine_resubmit,
> >  	     TP_ARGS(e)
> >  );
> >  
> > +DEFINE_EVENT(xe_engine, xe_engine_lr_cleanup,
> > +	     TP_PROTO(struct xe_engine *e),
> > +	     TP_ARGS(e)
> > +);
> > +
> >  DECLARE_EVENT_CLASS(xe_sched_job,
> >  		    TP_PROTO(struct xe_sched_job *job),
> >  		    TP_ARGS(job),
> > -- 
> > 2.34.1
> > 
