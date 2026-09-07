Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFC0C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2FF10E4E8;
	Mon,  7 Sep 2026 13:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cdsc3bUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A1C10E4E8
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788786383; x=1820322383;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XBH62/ECSJosJVVt7/TxcrS3xppYi8eQyG5gp/k8yU8=;
 b=Cdsc3bUiLHxQ15rnGKfHjVqnADUNxaWG40rufattJckTxOi5daH/uZ5S
 OOet2k7H3AUq/sLl3oDargeqSneBQ8siTjZVrDqzzM8zsbn07R0/A+SfK
 8ZI3xyr6ywh3OOF7zaA1vTku2E/By0/CSaVPbvAsFWItn/xjJltmES8Lx
 2Gj+b/KKSieTvjdippK5JtyuCOXp4JAmjHstfY8H5R2F2/Vdc5cFfsDev
 5eWmqglUC6p9PPSBbPemOmjX/JvW02hvkvZ601Npbt95f7t8MZU2KR/DY
 nYrwkGXlukXGDeqIkUlkUlc1+rdKyr7ci4C6PS33U9g94ZNcYO3POZ/0f A==;
X-CSE-ConnectionGUID: 4Zb/StCYQqK//cg9foioog==
X-CSE-MsgGUID: 6dORVeoAQr6Yvs6WHyQ2TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88123092"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88123092"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:06:22 -0700
X-CSE-ConnectionGUID: 9j7RsxQNSnyYXkWJvLpETA==
X-CSE-MsgGUID: 7TtBXI6dSmygg5APkkabIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274221510"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:06:20 -0700
Date: Mon, 7 Sep 2026 15:06:17 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 lukasz.laguna@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v3 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <ap62ydY-_7AYdxPs@black.igk.intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
 <20260907083541.2194747-2-raag.jadav@intel.com>
 <c3eb2bd0-119d-4c72-8332-721efb763c19@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3eb2bd0-119d-4c72-8332-721efb763c19@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2026 at 02:02:59PM +0200, Michal Wajdeczko wrote:
> On 9/7/2026 10:34 AM, Raag Jadav wrote:
> > Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
> > teardown synchronously. This can result in tdr timeout in cases where
> > the device is declared wedged while jobs are still in-flight.
> > 
> > Introduce a worker for GT specific wedge handling and queue the teardown
> > on GT ordered workqueue, so we don't disrupt the scheduler while jobs
> > are still in-flight.
> > 
> > Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v2: Split fixes into separate patches (Rodrigo, Michal)
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
> >  drivers/gpu/drm/xe/xe_gt_types.h |  6 ++++++
> >  2 files changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 478e047031f4..200e34331c19 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -173,6 +173,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
> >  }
> >  
> >  static void gt_reset_worker(struct work_struct *w);
> > +static void gt_wedge_worker(struct work_struct *w);
> >  
> >  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
> >  			 long timeout_jiffies, bool force_reset)
> > @@ -704,6 +705,8 @@ static void xe_gt_fini(void *arg)
> >  	struct xe_gt *gt = arg;
> >  	int i;
> >  
> > +	disable_work_sync(&gt->wedge.worker);
> > +
> >  	if (disable_work_sync(&gt->reset.worker))
> >  		/*
> >  		 * If gt_reset_worker was halted from executing, take care of
> > @@ -723,6 +726,7 @@ int xe_gt_init(struct xe_gt *gt)
> >  	int i;
> >  
> >  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
> > +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
> 
> hmm, shouldn't this be done in xe_gt_alloc() ?

The worker is touching hardware, which I'm assuming shouldn't be done
before xe_device_probe()?

Raag

> as xe_gt_init_early() seems to be doing something else and much later
> 
> >  
> >  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
> >  		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
> > @@ -1005,6 +1009,14 @@ void xe_gt_reset_async(struct xe_gt *gt)
> >  		xe_pm_runtime_put(xe);
> >  }
> >  
> > +static void gt_wedge_worker(struct work_struct *w)
> > +{
> > +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
> > +
> > +	xe_uc_declare_wedged(&gt->uc);
> > +	xe_tlb_inval_reset(&gt->tlb_inval);
> > +}
> > +
> >  void xe_gt_suspend_prepare(struct xe_gt *gt)
> >  {
> >  	xe_uc_suspend_prepare(&gt->uc);
> > @@ -1195,6 +1207,7 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
> >  {
> >  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> >  
> > -	xe_uc_declare_wedged(&gt->uc);
> > -	xe_tlb_inval_reset(&gt->tlb_inval);
> > +	/* Prevent queueing uninitialized worker if hit during probe */
> > +	if (gt->wedge.worker.func)
> > +		queue_work(gt->ordered_wq, &gt->wedge.worker);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 628911346455..b11ac52b0ab7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -233,6 +233,12 @@ struct xe_gt {
> >  		struct work_struct worker;
> >  	} reset;
> >  
> > +	/** @wedge: state for GT wedge */
> > +	struct {
> > +		/** @wedge.worker: worker for GT wedge to be done async */
> > +		struct work_struct worker;
> > +	} wedge;
> > +
> >  	/** @tlb_inval: TLB invalidation state */
> >  	struct xe_tlb_inval tlb_inval;
> >  
> 
