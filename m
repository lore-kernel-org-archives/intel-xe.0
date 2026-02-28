Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C93BFEE4C8
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 05:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31F510E1F7;
	Sat, 28 Feb 2026 05:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwTKzyqx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFDA10E1F7
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 05:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772255488; x=1803791488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UUujSSxnXVA5FP7rHSCutRaKBDPKwBojAjvOcaX/V3A=;
 b=gwTKzyqxUuxfsT4nNMW7PGuzCJ6paQe3iVK7QLMFYS2Zxpx9PbqSnl43
 3tV6oTPv0HhGWlDf5eB7j3JT9cW2pgB/kAdR34fOH2M+ETh8FKmbm94VJ
 ewq+yRbSwzjHb20tgplzoWGr/DdR2Ie4F87HJyPFtlFNvAHYspG67sLt3
 pZe2EtHo47YNylYobLodu7vIG4NzZ+Yt6iRnvg2wulmvWzwfQTSTvhSo0
 aVYT0CTqFyi9rj4WPLFXtoEBmpy9sU6Q2ys0uPtWuoSfdUxmXC/bVEaNI
 jCXzcqQPrDHcg2Xd03gxI4+oyfhYWM4BN12JmWv2+5pWfB17wqGYmBVVG g==;
X-CSE-ConnectionGUID: yUMUl3ALSq+57ruLdG9TeQ==
X-CSE-MsgGUID: L7jQkBZ4RSuPzZT6sxI11g==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73447325"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="73447325"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 21:11:27 -0800
X-CSE-ConnectionGUID: cMus213vSzWmWzwHoWEq7g==
X-CSE-MsgGUID: LuHGUiw3QrOw/TZRftP1Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="214448514"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 21:11:25 -0800
Date: Sat, 28 Feb 2026 06:11:22 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se
Subject: Re: [PATCH v2 6/9] drm/xe/lrc: Introduce xe_lrc_reinit()
Message-ID: <aaJ4-gjgZBj0V7BA@black.igk.intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
 <20260227170049.3418863-7-raag.jadav@intel.com>
 <aaHdHSyXmlix/rkl@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaHdHSyXmlix/rkl@lstrano-desk.jf.intel.com>
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

On Fri, Feb 27, 2026 at 10:06:21AM -0800, Matthew Brost wrote:
> On Fri, Feb 27, 2026 at 10:30:46PM +0530, Raag Jadav wrote:
> > In preparation of usecases which require re-initializing LRC after PCIe
> > FLR, introduce xe_lrc_reinit() helper. The LRC bo already exists but
> > since it's contents are on VRAM, they are lost on PCIe FLR. Recreate
> > ring context as part of re-initialization.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v2: Re-initialize migrate context (Matthew Brost)
> > ---
> >  drivers/gpu/drm/xe/xe_lrc.c | 149 +++++++++++++++++++++---------------
> >  drivers/gpu/drm/xe/xe_lrc.h |   2 +
> >  2 files changed, 90 insertions(+), 61 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 84360fcdf743..9fc8720f62ca 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1438,65 +1438,16 @@ void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_pri
> >  	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
> >  }
> >  
> > -static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > -		       struct xe_vm *vm, void *replay_state, u32 ring_size,
> > -		       u16 msix_vec,
> > -		       u32 init_flags)
> > +static int xe_lrc_init_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> > +			   void *replay_state, u16 msix_vec, u32 init_flags)
> >  {
> >  	struct xe_gt *gt = hwe->gt;
> > -	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
> > -	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	struct xe_device *xe = gt_to_xe(gt);
> > -	struct xe_bo *seqno_bo;
> >  	struct iosys_map map;
> >  	u32 arb_enable;
> > -	u32 bo_flags;
> >  	int err;
> >  
> > -	kref_init(&lrc->refcount);
> > -	lrc->gt = gt;
> > -	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
> > -	lrc->size = lrc_size;
> > -	lrc->flags = 0;
> > -	lrc->ring.size = ring_size;
> > -	lrc->ring.tail = 0;
> > -
> > -	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
> > -		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
> > -		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
> > -	}
> > -
> > -	if (xe_gt_has_indirect_ring_state(gt))
> > -		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
> > -
> > -	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
> > -		   XE_BO_FLAG_GGTT_INVALIDATE;
> > -
> > -	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
> > -		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
> > -
> > -	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
> > -					    bo_size,
> > -					    ttm_bo_type_kernel,
> > -					    bo_flags, false);
> > -	if (IS_ERR(lrc->bo))
> > -		return PTR_ERR(lrc->bo);
> > -
> > -	seqno_bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> > -					     ttm_bo_type_kernel,
> > -					     XE_BO_FLAG_GGTT |
> > -					     XE_BO_FLAG_GGTT_INVALIDATE |
> > -					     XE_BO_FLAG_SYSTEM, false);
> > -	if (IS_ERR(seqno_bo)) {
> > -		err = PTR_ERR(seqno_bo);
> > -		goto err_lrc_finish;
> > -	}
> > -	lrc->seqno_bo = seqno_bo;
> > -
> > -	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> > -			     hwe->fence_irq, hwe->name);
> > -
> >  	/*
> >  	 * Init Per-Process of HW status Page, LRC / context state to known
> >  	 * values. If there's already a primed default_lrc, just copy it, otherwise
> > @@ -1508,7 +1459,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> >  		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
> >  		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
> >  				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
> > -				 lrc_size - LRC_PPHWSP_SIZE);
> > +				 lrc->size - LRC_PPHWSP_SIZE);
> >  		if (replay_state)
> >  			xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
> >  					 replay_state, lrc->replay_size);
> > @@ -1516,21 +1467,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> >  		void *init_data = empty_lrc_data(hwe);
> >  
> >  		if (!init_data) {
> > -			err = -ENOMEM;
> > -			goto err_lrc_finish;
> > +			return -ENOMEM;
> >  		}
> >  
> > -		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
> > +		xe_map_memcpy_to(xe, &map, 0, init_data, lrc->size);
> >  		kfree(init_data);
> >  	}
> >  
> > -	if (vm) {
> > +	if (vm)
> >  		xe_lrc_set_ppgtt(lrc, vm);
> >  
> > -		if (vm->xef)
> > -			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
> > -	}
> > -
> >  	if (xe_device_has_msix(xe)) {
> >  		xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
> >  				     xe_memirq_status_ptr(&tile->memirq, hwe));
> > @@ -1602,12 +1548,93 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> >  
> >  	err = setup_wa_bb(lrc, hwe);
> >  	if (err)
> > -		goto err_lrc_finish;
> > +		return err;
> >  
> >  	err = setup_indirect_ctx(lrc, hwe);
> > +
> > +	return err;
> > +}
> > +
> > +/**
> > + * xe_lrc_reinit() - Re-initialize LRC
> > + * @lrc: Pointer to the LRC
> > + * @hwe: Hardware Engine
> > + * @vm: The VM (address space)
> > + * @replay_state: GPU hang replay state
> > + * @msix_vec: MSI-X interrupt vector (for platforms that support it)
> > + * @init_flags: LRC initialization flags
> > + *
> > + * Returns: 0 on success, negative error code otherwise.
> > + */
> > +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> > +		  void *replay_state, u16 msix_vec, u32 init_flags)
> > +{
> 
> I think you likely want to set lrc->ring.tail = 0 here (or in
> xe_lrc_init_ctx), right? Alternatively, you could set both
> INDIRECT_CTX_RING_HEAD and INDIRECT_CTX_RING_TAIL to lrc->ring.tail in
> xe_lrc_init_ctx.
> 
> Consider the case where a bunch of work has run on the migration queue
> and lrc->ring.tail ends up in the middle of the ring, then xe_lrc_reinit
> is called. The next submission on the LRC will execute the instructions
> between 0 (INDIRECT_CTX_RING_HEAD is set zero in xe_lrc_init_ctx) and
> the lrc->ring.tail value at the time xe_lrc_reinit was invoked, which
> will be stale or invalid if VRAM was clobbered.
> 
> I would have expected this to show up in testing if you ran something
> like:
> 
> xe_exec_basic;
> echo 1 > /sys/bus/pci/devices/<BDF>/reset;
> xe_exec_basic;
> 
> Otherwise this is good cleanup adding xe_lrc_init_ctx regardless of Xe
> PCIe FLR so if we work out above, feel free to post this an independent
> which we can merge ahead of Xe PCIe FLR.

Makes sense.

Raag

> > +	return xe_lrc_init_ctx(lrc, hwe, vm, replay_state, msix_vec, init_flags);
> > +}
> > +
> > +static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> > +		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
> > +{
> > +	struct xe_gt *gt = hwe->gt;
> > +	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
> > +	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_bo *bo;
> > +	u32 bo_flags;
> > +	int err;
> > +
> > +	kref_init(&lrc->refcount);
> > +	lrc->gt = gt;
> > +	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
> > +	lrc->size = lrc_size;
> > +	lrc->flags = 0;
> > +	lrc->ring.size = ring_size;
> > +	lrc->ring.tail = 0;
> > +
> > +	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
> > +		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
> > +		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
> > +	}
> > +
> > +	if (xe_gt_has_indirect_ring_state(gt))
> > +		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
> > +
> > +	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
> > +		   XE_BO_FLAG_GGTT_INVALIDATE;
> > +
> > +	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
> > +		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
> > +
> > +	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
> > +				       ttm_bo_type_kernel,
> > +				       bo_flags, false);
> > +	if (IS_ERR(lrc->bo))
> > +		return PTR_ERR(lrc->bo);
> > +
> > +	lrc->bo = bo;
> > +
> > +	bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> > +				       ttm_bo_type_kernel,
> > +				       XE_BO_FLAG_GGTT |
> > +				       XE_BO_FLAG_GGTT_INVALIDATE |
> > +				       XE_BO_FLAG_SYSTEM, false);
> > +	if (IS_ERR(bo)) {
> > +		err = PTR_ERR(bo);
> > +		goto err_lrc_finish;
> > +	}
> > +	lrc->seqno_bo = bo;
> > +
> > +	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> > +			     hwe->fence_irq, hwe->name);
> > +
> > +	err = xe_lrc_init_ctx(lrc, hwe, vm, replay_state, msix_vec, init_flags);
> >  	if (err)
> >  		goto err_lrc_finish;
> >  
> > +	if (vm && vm->xef)
> > +		xe_drm_client_add_bo(vm->xef->client, lrc->bo);
> > +
> >  	return 0;
> >  
> >  err_lrc_finish:
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index 3e500004f1ae..af31de8df408 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -52,6 +52,8 @@ struct xe_lrc_snapshot {
> >  
> >  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> >  			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> > +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> > +		  void *replay_state, u16 msix_vec, u32 init_flags);
> >  void xe_lrc_destroy(struct kref *ref);
> >  
> >  /**
> > -- 
> > 2.43.0
> > 
