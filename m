Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16CBCA6017
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 06:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FF710E0FB;
	Sat, 10 Oct 2026 06:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fu+xxVTb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD9710E0FB
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 06:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791615249; x=1823151249;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dT6xMeLBj0Mfd3WKGG9LSIU4IPpUJKcWZ5xVBQNO4Lc=;
 b=Fu+xxVTb2hOdB9vj9FkoNlvZP6/uK38PFtTsql5ryyOmTf9DiPDEyXT1
 a8mhUSPYY6po6h9E0t/ybibgfWLrVdscmXEEN4yPAzmFiyj13BpumXeKp
 AnNvgrjooSZxCgfp9aEHv/nHmrAOyfAWq03m4TD5OC4BbkTxzbCmavswt
 vOOqFmus5DsGmJDjTxI+Y7hMFyXJCazUSgRVwhMMjQeWx7udm1Jl52hbc
 bWmJVEJpxAo67rwS+3AvfmDvKcCA1LvZseUdBTXaK8Bp9shu5cBUAU2BI
 Nkv+AmkRrqhYxsl5CB/exkn5sEOGb/RiQwU25uY5FFLRPrysW1qnpCE8a Q==;
X-CSE-ConnectionGUID: S6fbtJc8TxWQCmhADPCfww==
X-CSE-MsgGUID: OiK/G1FdQtOkcpSRyZ1rbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="402182"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="402182"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 23:54:08 -0700
X-CSE-ConnectionGUID: MuMFX6h9RhO7V6odlfGvaQ==
X-CSE-MsgGUID: jfI3K3/AQz6Tc22JDxhntQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="486659"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 23:54:06 -0700
Date: Sat, 10 Oct 2026 08:54:04 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 lukasz.laguna@intel.com, matthew.d.roper@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v3 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <asnhDDtvZpBhxV7j@black.igk.intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
 <20260907083541.2194747-2-raag.jadav@intel.com>
 <c3eb2bd0-119d-4c72-8332-721efb763c19@intel.com>
 <ap62ydY-_7AYdxPs@black.igk.intel.com> <asmQ7RRHQ8GtK2E4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asmQ7RRHQ8GtK2E4@intel.com>
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

On Fri, Oct 09, 2026 at 09:12:13PM -0400, Rodrigo Vivi wrote:
> On Mon, Sep 07, 2026 at 03:06:17PM +0200, Raag Jadav wrote:
> > On Mon, Sep 07, 2026 at 02:02:59PM +0200, Michal Wajdeczko wrote:
> > > On 9/7/2026 10:34 AM, Raag Jadav wrote:
> > > > Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
> > > > teardown synchronously. This can result in tdr timeout in cases where
> > > > the device is declared wedged while jobs are still in-flight.
> > > > 
> > > > Introduce a worker for GT specific wedge handling and queue the teardown
> > > > on GT ordered workqueue, so we don't disrupt the scheduler while jobs
> > > > are still in-flight.
> > > > 
> > > > Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > > v2: Split fixes into separate patches (Rodrigo, Michal)
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
> > > >  drivers/gpu/drm/xe/xe_gt_types.h |  6 ++++++
> > > >  2 files changed, 21 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index 478e047031f4..200e34331c19 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -173,6 +173,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
> > > >  }
> > > >  
> > > >  static void gt_reset_worker(struct work_struct *w);
> > > > +static void gt_wedge_worker(struct work_struct *w);
> > > >  
> > > >  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
> > > >  			 long timeout_jiffies, bool force_reset)
> > > > @@ -704,6 +705,8 @@ static void xe_gt_fini(void *arg)
> > > >  	struct xe_gt *gt = arg;
> > > >  	int i;
> > > >  
> > > > +	disable_work_sync(&gt->wedge.worker);
> > > > +
> > > >  	if (disable_work_sync(&gt->reset.worker))
> > > >  		/*
> > > >  		 * If gt_reset_worker was halted from executing, take care of
> > > > @@ -723,6 +726,7 @@ int xe_gt_init(struct xe_gt *gt)
> > > >  	int i;
> > > >  
> > > >  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
> > > > +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
> > > 
> > > hmm, shouldn't this be done in xe_gt_alloc() ?
> > 
> > The worker is touching hardware, which I'm assuming shouldn't be done
> > before xe_device_probe()?
> > 
> > Raag
> > 
> > > as xe_gt_init_early() seems to be doing something else and much later
> > > 
> > > >  
> > > >  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
> > > >  		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
> > > > @@ -1005,6 +1009,14 @@ void xe_gt_reset_async(struct xe_gt *gt)
> > > >  		xe_pm_runtime_put(xe);
> > > >  }
> > > >  
> > > > +static void gt_wedge_worker(struct work_struct *w)
> > > > +{
> > > > +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
> > > > +
> > > > +	xe_uc_declare_wedged(&gt->uc);
> > > > +	xe_tlb_inval_reset(&gt->tlb_inval);
> > > > +}
> > > > +
> > > >  void xe_gt_suspend_prepare(struct xe_gt *gt)
> > > >  {
> > > >  	xe_uc_suspend_prepare(&gt->uc);
> > > > @@ -1195,6 +1207,7 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
> > > >  {
> > > >  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> > > >  
> > > > -	xe_uc_declare_wedged(&gt->uc);
> > > > -	xe_tlb_inval_reset(&gt->tlb_inval);
> > > > +	/* Prevent queueing uninitialized worker if hit during probe */
> 
> Perhaps this comment itself proves Michal's point?!
> 
> I believe it would be cleaner if this would be per device and not per_gt
> and already INIT worker inside device_early_probe...
> 
> > > > +	if (gt->wedge.worker.func)
> > > > +		queue_work(gt->ordered_wq, &gt->wedge.worker);
> 
> This can race with other wedge places now, like:
> prepare_device_for_reset()
> 
> we should perhaps flush all workers there or whenever
> we are in the sync path?! or perhaps move all to the
> queue?

Michal proposed something better off-list, let me send out a v4.

Raag

> > > >  }
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > index 628911346455..b11ac52b0ab7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > @@ -233,6 +233,12 @@ struct xe_gt {
> > > >  		struct work_struct worker;
> > > >  	} reset;
> > > >  
> > > > +	/** @wedge: state for GT wedge */
> > > > +	struct {
> > > > +		/** @wedge.worker: worker for GT wedge to be done async */
> > > > +		struct work_struct worker;
> > > > +	} wedge;
> > > > +
> > > >  	/** @tlb_inval: TLB invalidation state */
> > > >  	struct xe_tlb_inval tlb_inval;
> > > >  
> > > 
