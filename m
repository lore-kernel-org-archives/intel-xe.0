Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97E1CC6B20
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 04:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A401210FAAB;
	Wed, 14 Oct 2026 04:25:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC2C10FAAB
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 04:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791951919; x=1823487919;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iAbftGKQig6HEc3QcK/SpCbwB6g3zxxmZF7ylpAi14I=;
 b=Mjhct6h97VB+0N8ZRsmFAsbSUc9nmF+eqRsMSHNJCUb9QjjBm2yjK2mi
 wAJXnPFi/vuwPae6srq4WzNi1dm30JkdMv9yb4R0nDjLpbGZ3enmSJjOE
 c7cM31MytybSOadU/eYX0P2M8fkj0X432xKO0dMv3Zo3j+lbHkCDV3MBQ
 A5rIOzJYJIxIiVat1vdVGiKRDf6Z7f4hlKSiZTjNM+ifew1GnZj2EMpUV
 4KlVC90szuJzJr5G4KQ17R68d1x+icsYZpCHFO5gsoEX5QySQuRQgNOb4
 0gXsYQAxhlOw+iXwPx1e9AaX9xgAnuHhjqrtNf2iP+CIKhkbh5LWSDxuy Q==;
X-CSE-ConnectionGUID: baIIxs5TQIy7Mp9sSJq2Ng==
X-CSE-MsgGUID: a2Dm9zkgR76dweCF5H6/Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="585859"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="585859"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 21:25:18 -0700
X-CSE-ConnectionGUID: AUmEtNqqSi68p61mUoq23g==
X-CSE-MsgGUID: +6rDDTLcRcK54ttXTP1dqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1683171"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 21:25:17 -0700
Date: Wed, 14 Oct 2026 06:25:13 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com, matthew.d.roper@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v5 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <as8EKWJBpO_q-qIB@black.igk.intel.com>
References: <20261013110439.181447-1-raag.jadav@intel.com>
 <20261013110439.181447-2-raag.jadav@intel.com>
 <as54eD2FDuQdiT6b@intel.com>
 <as59U8Fmp2fDcYIo@gsse-cloud1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as59U8Fmp2fDcYIo@gsse-cloud1.jf.intel.com>
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

On Tue, Oct 13, 2026 at 11:49:55AM -0700, Matthew Brost wrote:
> On Tue, Oct 13, 2026 at 02:29:12PM -0400, Rodrigo Vivi wrote:
> > On Tue, Oct 13, 2026 at 04:33:53PM +0530, Raag Jadav wrote:
> > > Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
> > > teardown synchronously. This can result in tdr timeout in cases where
> > > the device is declared wedged while jobs are still in-flight.
> > > 
> > > Introduce a worker for GT specific wedge handling and queue the teardown
> > > on GT ordered workqueue, so we don't disrupt the scheduler while jobs
> > > are still in-flight.
> > > 
> > > While at it, introduce for_each_initialized_gt() macro and use it for
> > > wedging GT. This helps avoid races in case the device is declared wedged
> > > in probe sequence before GT is initialized.
> > > 
> > > Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > v2: Split fixes into separate patches (Rodrigo, Michal)
> > > v4: Introduce for_each_initialized_gt() (Michal)
> > > v5: Flush GT wedge worker to avoid races (Sashiko)
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c   |  2 +-
> > >  drivers/gpu/drm/xe/xe_device.h   |  4 ++++
> > >  drivers/gpu/drm/xe/xe_gt.c       | 18 ++++++++++++++++--
> > >  drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
> > >  4 files changed, 30 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 8392c9fad3c4..22ae10958d7f 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -1432,7 +1432,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > >  			    WEDGED_URL, XE_BUG_URL);
> > >  	}
> > >  
> > > -	for_each_gt(gt, xe, id)
> > > +	for_each_initialized_gt(gt, xe, id)
> > >  		xe_gt_declare_wedged(gt);
> > >  
> > >  	if (xe_device_wedged(xe)) {
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index 83d6dafab53c..80bda9b548d5 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -139,6 +139,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
> > >  	for_each_gt((gt__), (tile__)->xe, (id__)) \
> > >  		for_each_if((gt__)->tile == (tile__))
> > >  
> > > +#define for_each_initialized_gt(gt__, xe__, id__) \
> > > +	for_each_gt((gt__), (xe__), (id__)) \
> > > +		for_each_if(READ_ONCE((gt__)->initialized))
> > > +
> > >  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
> > >  {
> > >  	return &gt->pm.fw;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 775c826b68b4..4e047cfaf603 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -175,6 +175,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
> > >  }
> > >  
> > >  static void gt_reset_worker(struct work_struct *w);
> > > +static void gt_wedge_worker(struct work_struct *w);
> > >  
> > >  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
> > >  			 long timeout_jiffies, bool force_reset)
> > > @@ -706,6 +707,8 @@ static void xe_gt_fini(void *arg)
> > >  	struct xe_gt *gt = arg;
> > >  	int i;
> > >  
> > > +	disable_work_sync(&gt->wedge.worker);
> > > +
> > >  	if (disable_work_sync(&gt->reset.worker))
> > >  		/*
> > >  		 * If gt_reset_worker was halted from executing, take care of
> > > @@ -725,6 +728,7 @@ int xe_gt_init(struct xe_gt *gt)
> > >  	int i;
> > >  
> > >  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
> > > +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
> > 
> > perhaps this should be in the gt_alloc or some init early?
> > 
> > >  
> > >  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
> > >  		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
> > > @@ -769,6 +773,8 @@ int xe_gt_init(struct xe_gt *gt)
> > >  			return err;
> > >  	}
> > >  
> > > +	/* Must be last */
> > > +	WRITE_ONCE(gt->initialized, true);
> > >  	return 0;
> > >  }
> > >  
> > > @@ -1010,6 +1016,14 @@ void xe_gt_reset_async(struct xe_gt *gt)
> > >  		xe_pm_runtime_put(xe);
> > >  }
> > >  
> > > +static void gt_wedge_worker(struct work_struct *w)
> > > +{
> > > +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
> > > +
> > > +	xe_uc_declare_wedged(&gt->uc);
> > > +	xe_tlb_inval_reset(&gt->tlb_inval);
> > > +}
> > > +
> > >  void xe_gt_suspend_prepare(struct xe_gt *gt)
> > >  {
> > >  	xe_uc_suspend_prepare(&gt->uc);
> > > @@ -1200,6 +1214,6 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
> > >  {
> > >  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> > >  
> > > -	xe_uc_declare_wedged(&gt->uc);
> > > -	xe_tlb_inval_reset(&gt->tlb_inval);
> > > +	queue_work(gt->ordered_wq, &gt->wedge.worker);
> > > +	flush_work(&gt->wedge.worker);
> > 
> > This flush serialize things, but apparently it deadlock somewhere else now.
> > Perhaps we should avoid this one here and instead flush for each gt in
> > pci disable case.
> > 
> 
> Good catch - I misssed this.
> 
> Yeah, flushes are always dangerous. I'm guessing the deadlock is because
> some locks can be held here that are also taken on `gt->ordered_wq`.
> This code can be called from IRQ context, from the ordered workqueue
> itself, or from the DRM scheduler submit worker. All of those
> possibilities are problematic, and even if we somehow got this right
> today, we'd probably break it again later.
> 
> In any case, I agree that we should drop the flush here. If we need to
> serialize against this work being in flight, let's add a serialization
> point elsewhere and, in teardown paths, disable the wedge work item
> (although I haven't fully thought that part through).
> 
> I suspect that any path requiring wedge serialization also needs to
> serialize against an in-flight GT reset, VF migration, etc., and we may
> be missing code to handle those cases today.

Yes, there's dedicated effort[1] in progress for this.

[1] https://patchwork.freedesktop.org/series/172860/

Raag

> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index 628911346455..c00a7c171f80 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -233,6 +233,12 @@ struct xe_gt {
> > >  		struct work_struct worker;
> > >  	} reset;
> > >  
> > > +	/** @wedge: state for GT wedge */
> > > +	struct {
> > > +		/** @wedge.worker: worker for GT wedge to be done async */
> > > +		struct work_struct worker;
> > > +	} wedge;
> > > +
> > >  	/** @tlb_inval: TLB invalidation state */
> > >  	struct xe_tlb_inval tlb_inval;
> > >  
> > > @@ -419,6 +425,9 @@ struct xe_gt {
> > >  
> > >  	/** @eu_stall: EU stall counters subsystem per gt info */
> > >  	struct xe_eu_stall_gt *eu_stall;
> > > +
> > > +	/** @initialized: GT is initialized */
> > > +	bool initialized;
> > >  };
> > >  
> > >  #endif
> > > -- 
> > > 2.43.0
> > > 
