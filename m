Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363FFEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 16:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066EE10E655;
	Fri, 16 Jun 2023 16:06:18 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9A810E655
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 16:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686931576; x=1718467576;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Lxgt6+x1qO5O8pq2hkAdpRvLLSAucG6Ag++L0wL4j0M=;
 b=QIzLln/DcmJo5XwSaPue+2SOmyCXRAU6L1wy8bp+SPJASUPdmYPwkF3h
 aAr4aaOPEPNVcUzMAkUGKaJz1V8IiaUOo/EklVuED0QfFtRo5odJLOqJU
 Ky8j3wbXXaIje+MB3bqPNH++5iZ16IuIknwKU4388b8s7cnBfeEsY2LHx
 Nkr/kvO6hbEt3FXgLSrB949NrR/m7f3eW6w6L2V6fk7llB8r34xWqPgpy
 CroBfGxPxu2oHq/0Xccwmjl0Km2dmnUFMKRl7jBz11e1FKhLBIe3I423d
 hraUwdTnnpbvo5eS0D1vgI9ppH/TFvy21WpWDkawctWwiuUZ3toYWnBr8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="388004539"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="388004539"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 09:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="802886963"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="802886963"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2023 09:03:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 09:03:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 09:03:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 09:03:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPRiSVAa2UGDHvv5sBef3FTdD3/XS7wcV6c9SLgBlfMofRkZexpTsOQyTLsYoVLd9b/81jcCqjgSA6Qonbj1uz6vk/thwuq7aE3PIjxlxa8O9fnj8gaNzwnRE2N75NObdGhRoVPcgl8aWuxW/lP05ngI5VAGxO41RXqas3LnhtbtvT5NlGclVnhH3LgRL2Ze9dlOEHKXJGX9VFVxT7RwV7X1ADa9snft1CvuAP/NPe8fLuUfnnuvnQJ1QHkyqHc/2vv+wflSoqBx73cdUoPPnPcLifMWkydoN9iVogyDPzSq82zUcOOf2DVhYhQytycod2NLtIuPyAZPPquGQihGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rx7Hs3z/RUMIeSxNrsNACA+bFR1aroWkbWJBSRnqvrI=;
 b=AUoBBWGs7ZE8QfVAJFC3CJKPtitoJOj2JEAE9QWd77msm90qStjNnla0FYQ1n1FGPhba+FqCCn6sYvWniNC6ILDVNk3UCjVcIrLhhJrKiv8GP4AfHlaAz+uEa5gRYqOA2R2KafsN2uHBLBg0INUF1ZjB20DbLqYK2TSm8GVfYI8Y9vGWnlQVXp9TDAWSCm7iBCvNsyCa9FNJsDSKQNGb9cmUu6Vauk1sOn7iFiv0kMIreTO/BoDHsj5L70uAwar9FNd5GpGZ5w58vMpfalUnsotllTqKj6vcMHPgYEkZHupvob0mqgo51tWJnLeafosedcp4wRkadIsP5H+7qXxmhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 16:03:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 16:03:18 +0000
Date: Fri, 16 Jun 2023 16:02:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIyHozeFc0BOeiYU@DUT025-TGLU.fm.intel.com>
References: <20230615173014.258703-1-matthew.brost@intel.com>
 <20230615173014.258703-6-matthew.brost@intel.com>
 <394c84ff-0035-732a-268d-5c7577e2e1db@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <394c84ff-0035-732a-268d-5c7577e2e1db@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b13edd-3747-4984-f0cd-08db6e8332f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZDZsyhzWuN1wAQdrNmjEtNc2xdToGLEXl6WRp5Px+tXd5/b+hmoKtaPdm6ib7Z5ZFeYgXWydHoVKPGyyAnwHYfomvRWV/X3LyztjDyfEefU9uUECtWKQxuJDka2vmC2BkTzv6EyLTPS+qkL4IxlZ0/nAlej+faz8aoOe/m9M7aYitCxGyWBJInN3FNAG1TVzMlg5QaYKWAXRV3HG9DokflmeYE3xLKe+dmj1xHLI/AtIpUyT5TrP39pHIJ7Q1IpNyRq4FT9te05x9B85qjt25fSw510TQO82H5qeDG3RAJGhNBFeyXVKoLj1/uUb0bjK8sFex0HOFE7RcPvKt0YS227LoJRwjfgOpFwj5UUDp0cdU4Nv2G10moKjrYrgtoht1rv16aU5QE9T5Bkm841EYHrPdie50x4B4mGbQRNEifYdo+tCBMnf+irWSp/w/5mFeE5niHNOYKpNuJ5QdKHKApBDFC070mUitaY8cD2EIfxKHbQuOkWmbryArvA6s9DMdqlvVNHHaEz/wK+NJyvYGb2qGdrE7P0KedAPUk+bgiwJHzzyudw+Ie7YZPa7eEtpynocClObCYxMAV3VGHaRfYeWAJj51h+bCCCVr09I4bQxz8xUp+oo8m/yT4aXHuZLPjtVlmHuXwFX6JztX0BcJ4P/kbcUXYkSEhCC5B71wn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(66574015)(83380400001)(66476007)(66556008)(6916009)(66946007)(6512007)(26005)(53546011)(6506007)(6486002)(6666004)(478600001)(2906002)(186003)(86362001)(44832011)(4326008)(30864003)(8936002)(8676002)(5660300002)(15650500001)(82960400001)(41300700001)(38100700002)(316002)(66899021)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4+1f9itDtAL+59+H3ZvpvLF7sKGPxVdhdvJUt6T2TJNvFfoYXxmn2nzpwY?=
 =?iso-8859-1?Q?PPZUkk7XvqAQP7Wzh2ap+xPZY2ORJv5MS+JPyHPVpuF7Wgri+1Z/v0V2nA?=
 =?iso-8859-1?Q?1V7PCY4QhKTyyPWvVSAQYKMRvX6ED5EtfoxJN95h+uUWci8XeFfMvQCQiN?=
 =?iso-8859-1?Q?jYAc/ZssH/HyKzDdmsfecZQW2nbNcVTH+av0JoPNYCvst46ZkVgLK34hBy?=
 =?iso-8859-1?Q?XbSi5MuUwuPymFfKYAftGGTDgL8QjjoeCn1em/7kZyn1rJD2a3bOE/s6M+?=
 =?iso-8859-1?Q?MbyW+FV1qJcNQ+xsZ4Jh99z3Q1OhX1vyjz9wv9ohBnsFtDFRxLo+r8lpIa?=
 =?iso-8859-1?Q?v9ZnwhDc4nmfBGacIaxnH2Gpg2YIxIAbcmcaIQDVwHfU7mZso9Rz6iKeE0?=
 =?iso-8859-1?Q?fSNMtzHyDownrV5cdkGNqCDf7Dgncq4ggKjyYYaPsZ86VGQW+ZpLmwlUL2?=
 =?iso-8859-1?Q?M+b7im+K0b5Mh0Crb+v2+WfH/vqgYbA7ZOO2GwzCVRIpBxTjxeBnwcQQu/?=
 =?iso-8859-1?Q?oGuK9axrRivohykGhde53iT2tStP7SYXJD7m7J19T6liU5tppgKVz0485Z?=
 =?iso-8859-1?Q?DO+DlwIhS54/jj8xTILv1W22Qp0IOrMg0zpNrcy2pqriP3Qom0hdJz1dVi?=
 =?iso-8859-1?Q?7hKr20RD+/8BGzHUdGp615maga60j2rHGOXxwVRNxuI/KJ2ZyVX+K2DzL4?=
 =?iso-8859-1?Q?AZ5UO+OfFtxZH8iv6z7ta7988PEUYpkHLuc8W7Ddi/8r1Nst1Wf/lYB66J?=
 =?iso-8859-1?Q?NL2VbbPyVqdMG8nGZmq1MKpiQElEqlxPbCHTkgOB+iyXEFefsUC9CFZ+t9?=
 =?iso-8859-1?Q?h8tr77dlyr/qltjmqAWd4dTUiKAvWkqwd5aWc84Fc5uvcPex1wOAk85320?=
 =?iso-8859-1?Q?r/2AGl4IurTvI/e6anbnm0+ftiXM1bakO8q4q/YQvKCh0sro6zvErOH6hH?=
 =?iso-8859-1?Q?sHxzKmRbNJN+C/ZEhqWdf1MoHMNAXDoqFVG4dwUT5fCvjyWfV9StBQOhoc?=
 =?iso-8859-1?Q?aZLD8N8t3f37esx69Wak38eEwoMgVJZGEkqYw1o7lmJv9KmCq0NJ5b7OUj?=
 =?iso-8859-1?Q?bm92kiK5PFYb1rH56gHjvhFgchBbtPk3Lq2ZLDsL1AAtICbwSnN1qKzrwm?=
 =?iso-8859-1?Q?Q3S8DIn0HlyN99WruCA2vO2ZMnXom2a6IF4Q5g1LxBFQU7vtHP+ZmDBund?=
 =?iso-8859-1?Q?jQe0reZUmJx7B3zsxFGjkod3mJXNmmQeYeWGItUCN8fWxFaRxxLOt40xLI?=
 =?iso-8859-1?Q?5wx/b3IyOI8QJOg/duiT+RNZ4hG6YO+1ipSkpxu6r7dkDuKpQXDoXNm9TB?=
 =?iso-8859-1?Q?o/24UeE5hirMansEaOfx0a4VvtiA5sV4b+JMWD3ZRyJ8bUhgPPSYQCkfXM?=
 =?iso-8859-1?Q?T1ryWLDMB/lCrebmWX0hNuW15Bi59AB/OdSIVMat+UJjf5jZlmLdhR9sed?=
 =?iso-8859-1?Q?emqzBcgGC91rvloJlzaHXIpOdGAcb9680vHqVGY5PMNEwtpn8c0ylZdI1e?=
 =?iso-8859-1?Q?GNV1ZbHaogF1lUr3wOL+Oy9I4WHOskCiufTQ1LhJXWtly44WD2nLmPoSgt?=
 =?iso-8859-1?Q?51dwkDjLqfi6KUkDcHAEm1jSa3IGo3Xzze+F3NRxmfshRzlqLdM+qykvgG?=
 =?iso-8859-1?Q?6Mx4RlGsgSAi0rspQ+jv9UXEBpKiNRRsyCU3wvsfSk2vgcD8/oLdzzzQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b13edd-3747-4984-f0cd-08db6e8332f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 16:03:17.9271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9Caf6mDUywms5kZzNRWeVwGaGX4C0EWYX8ODJyMuSjCPNiS3Q5IkVwN1+QfEXcwRl7L4H9D7Yz8AsvELzIa/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6974
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 5/8] drm/xe: Long running job update
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

On Fri, Jun 16, 2023 at 05:26:06PM +0200, Thomas Hellström wrote:
> 
> On 6/15/23 19:30, Matthew Brost wrote:
> > For long running (LR) jobs with the DRM scheduler we must return NULL in
> > run_job which results in signaling the job's finished fence immediately.
> > This prevents LR jobs from creating infinite dma-fences.
> > 
> > Signaling job's finished fence immediately breaks flow controlling ring
> > with the DRM scheduler. To work around this, the ring is flow controlled
> > and written in the exec IOCTL. Signaling job's finished fence
> > immediately also breaks the TDR which is used in reset / cleanup entity
> > paths so write a new path for LR entities.
> > 
> > v2: Better commit, white space, remove rmb(), better comment next to
> > emit_job()
> > v3 (Thomas): Change LR reference counting, fix working in commit
> 
> Ideally someone with more familiarity with the GuC code should take a second
> look on this,
> small nit below, but regardless
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_engine.c           | 32 ++++++++
> >   drivers/gpu/drm/xe/xe_engine.h           |  4 +
> >   drivers/gpu/drm/xe/xe_exec.c             |  8 ++
> >   drivers/gpu/drm/xe/xe_guc_engine_types.h |  2 +
> >   drivers/gpu/drm/xe/xe_guc_submit.c       | 96 ++++++++++++++++++++----
> >   drivers/gpu/drm/xe/xe_trace.h            |  5 ++
> >   6 files changed, 134 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index b3036c4a8ec3..eb5f66f07da8 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -18,6 +18,7 @@
> >   #include "xe_macros.h"
> >   #include "xe_migrate.h"
> >   #include "xe_pm.h"
> > +#include "xe_ring_ops_types.h"
> >   #include "xe_trace.h"
> >   #include "xe_vm.h"
> > @@ -679,6 +680,37 @@ static void engine_kill_compute(struct xe_engine *e)
> >   	up_write(&e->vm->lock);
> >   }
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
> >   /**
> >    * xe_engine_is_idle() - Whether an engine is idle.
> >    * @engine: The engine
> > diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> > index a49cf2ab405e..2e60f6d90226 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > @@ -42,6 +42,10 @@ static inline bool xe_engine_is_parallel(struct xe_engine *engine)
> >   	return engine->width > 1;
> >   }
> > +bool xe_engine_is_lr(struct xe_engine *e);
> > +
> > +bool xe_engine_ring_full(struct xe_engine *e);
> > +
> >   bool xe_engine_is_idle(struct xe_engine *engine);
> >   void xe_engine_kill(struct xe_engine *e);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index e44076ee2e11..9e9523939de8 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -14,6 +14,7 @@
> >   #include "xe_device.h"
> >   #include "xe_engine.h"
> >   #include "xe_macros.h"
> > +#include "xe_ring_ops_types.h"
> >   #include "xe_sched_job.h"
> >   #include "xe_sync.h"
> >   #include "xe_vm.h"
> > @@ -300,6 +301,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto err_engine_end;
> >   	}
> > +	if (xe_engine_is_lr(engine) && xe_engine_ring_full(engine)) {
> > +		err = -EWOULDBLOCK;
> > +		goto err_engine_end;
> > +	}
> > +
> >   	job = xe_sched_job_create(engine, xe_engine_is_parallel(engine) ?
> >   				  addresses : &args->address);
> >   	if (IS_ERR(job)) {
> > @@ -386,6 +392,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		xe_sync_entry_signal(&syncs[i], job,
> >   				     &job->drm.s_fence->finished);
> > +	if (xe_engine_is_lr(engine))
> > +		engine->ring_ops->emit_job(job);
> 
> Would it make sense to teach xe_sched_job_xxx() about the LR jobs, so that
> the above is done in
> xe_sched_job_push()?
> 

I prefer to keep it as is because it keeps all the special LR casing
code in the exec IOCTL (kick flow control to user + write ring) rather
than hiding this in functions. Also xe_sched_job_push is called by
kernel code which shouldn't be operating on LR engines. LR engines are a
user concept only.

Matt

> >   	xe_sched_job_push(job);
> >   	xe_vm_reactivate_rebind(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > index cbfb13026ec1..5d83132034a6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > @@ -31,6 +31,8 @@ struct xe_guc_engine {
> >   	 */
> >   #define MAX_STATIC_MSG_TYPE	3
> >   	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> > +	/** @lr_tdr: long running TDR worker */
> > +	struct work_struct lr_tdr;
> >   	/** @fini_async: do final fini async from this worker */
> >   	struct work_struct fini_async;
> >   	/** @resume_time: time of last resume */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index a7a0d9f806bd..86c445903560 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -482,6 +482,14 @@ static void register_engine(struct xe_engine *e)
> >   		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
> >   	}
> > +	/*
> > +	 * We must keep a reference for LR engines if engine is registered with
> > +	 * the GuC as jobs signal immediately and can't destroy an engine if the
> > +	 * GuC has a reference to it.
> > +	 */
> > +	if (xe_engine_is_lr(e))
> > +		xe_engine_get(e);
> > +
> >   	set_engine_registered(e);
> >   	trace_xe_engine_register(e);
> >   	if (xe_engine_is_parallel(e))
> > @@ -644,6 +652,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >   {
> >   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> >   	struct xe_engine *e = job->engine;
> > +	bool lr = xe_engine_is_lr(e);
> >   	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
> >   		  !engine_banned(e) && !engine_suspended(e));
> > @@ -653,14 +662,19 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >   	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
> >   		if (!engine_registered(e))
> >   			register_engine(e);
> > -		e->ring_ops->emit_job(job);
> > +		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> > +			e->ring_ops->emit_job(job);
> >   		submit_engine(e);
> >   	}
> > -	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
> > +	if (lr) {
> > +		xe_sched_job_set_error(job, -EOPNOTSUPP);
> > +		return NULL;
> > +	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> >   		return job->fence;
> > -	else
> > +	} else {
> >   		return dma_fence_get(job->fence);
> > +	}
> >   }
> >   static void guc_engine_free_job(struct drm_sched_job *drm_job)
> > @@ -764,6 +778,55 @@ static void simple_error_capture(struct xe_engine *e)
> >   }
> >   #endif
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
> > +	XE_WARN_ON(!xe_engine_is_lr(e));
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
> > +		disable_scheduling_deregister(guc, e);
> > +
> > +		/*
> > +		 * Must wait for scheduling to be disabled before signalling
> > +		 * any fences, if GT broken the GT reset code should signal us.
> > +		 */
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
> >   static enum drm_gpu_sched_stat
> >   guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   {
> > @@ -815,7 +878,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   			err = -EIO;
> >   		set_engine_banned(e);
> >   		xe_engine_get(e);
> > -		disable_scheduling_deregister(engine_to_guc(e), e);
> > +		disable_scheduling_deregister(guc, e);
> >   		/*
> >   		 * Must wait for scheduling to be disabled before signalling
> > @@ -848,7 +911,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   	 */
> >   	list_add(&drm_job->list, &sched->pending_list);
> >   	drm_sched_run_wq_start(sched);
> > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +	xe_guc_engine_trigger_cleanup(e);
> >   	/* Mark all outstanding jobs as bad, thus completing them */
> >   	spin_lock(&sched->job_list_lock);
> > @@ -872,6 +935,8 @@ static void __guc_engine_fini_async(struct work_struct *w)
> >   	trace_xe_engine_destroy(e);
> > +	if (xe_engine_is_lr(e))
> > +		cancel_work_sync(&ge->lr_tdr);
> >   	if (e->flags & ENGINE_FLAG_PERSISTENT)
> >   		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> >   	release_guc_id(guc, e);
> > @@ -889,7 +954,7 @@ static void guc_engine_fini_async(struct xe_engine *e)
> >   	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
> >   	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
> > -	queue_work(system_unbound_wq, &e->guc->fini_async);
> > +	queue_work(system_wq, &e->guc->fini_async);
> >   	/* We must block on kernel engines so slabs are empty on driver unload */
> >   	if (kernel) {
> > @@ -1078,6 +1143,9 @@ static int guc_engine_init(struct xe_engine *e)
> >   	if (err)
> >   		goto err_sched;
> > +	if (xe_engine_is_lr(e))
> > +		INIT_WORK(&e->guc->lr_tdr, xe_guc_engine_lr_cleanup);
> > +
> >   	mutex_lock(&guc->submission_state.lock);
> >   	err = alloc_guc_id(guc, e);
> > @@ -1129,7 +1197,7 @@ static void guc_engine_kill(struct xe_engine *e)
> >   {
> >   	trace_xe_engine_kill(e);
> >   	set_engine_killed(e);
> > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +	xe_guc_engine_trigger_cleanup(e);
> >   }
> >   static void guc_engine_add_msg(struct xe_engine *e, struct drm_sched_msg *msg,
> > @@ -1280,10 +1348,11 @@ static void guc_engine_stop(struct xe_guc *guc, struct xe_engine *e)
> >   	drm_sched_run_wq_stop(sched);
> >   	/* Clean up lost G2H + reset engine state */
> > -	if (engine_destroyed(e) && engine_registered(e)) {
> > -		if (engine_banned(e))
> > +	if (engine_registered(e)) {
> > +		if ((engine_banned(e) && engine_destroyed(e)) ||
> > +		    xe_engine_is_lr(e))
> >   			xe_engine_put(e);
> > -		else
> > +		else if (engine_destroyed(e))
> >   			__guc_engine_fini(guc, e);
> >   	}
> >   	if (e->guc->suspend_pending) {
> > @@ -1503,7 +1572,8 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	trace_xe_engine_deregister_done(e);
> >   	clear_engine_registered(e);
> > -	if (engine_banned(e))
> > +
> > +	if (engine_banned(e) || xe_engine_is_lr(e))
> >   		xe_engine_put(e);
> >   	else
> >   		__guc_engine_fini(guc, e);
> > @@ -1540,7 +1610,7 @@ int xe_guc_engine_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	 */
> >   	set_engine_reset(e);
> >   	if (!engine_banned(e))
> > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +		xe_guc_engine_trigger_cleanup(e);
> >   	return 0;
> >   }
> > @@ -1567,7 +1637,7 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >   	/* Treat the same as engine reset */
> >   	set_engine_reset(e);
> >   	if (!engine_banned(e))
> > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +		xe_guc_engine_trigger_cleanup(e);
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 2f8eb7ebe9a7..02861c26e145 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -219,6 +219,11 @@ DEFINE_EVENT(xe_engine, xe_engine_resubmit,
> >   	     TP_ARGS(e)
> >   );
> > +DEFINE_EVENT(xe_engine, xe_engine_lr_cleanup,
> > +	     TP_PROTO(struct xe_engine *e),
> > +	     TP_ARGS(e)
> > +);
> > +
> >   DECLARE_EVENT_CLASS(xe_sched_job,
> >   		    TP_PROTO(struct xe_sched_job *job),
> >   		    TP_ARGS(job),
