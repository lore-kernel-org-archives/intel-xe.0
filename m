Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3B4C43638
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 12:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D029210E85D;
	Mon, 29 Jun 2026 12:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuN/fiS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81E210E859
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782735841; x=1814271841;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7YlzxIwgbgckwkdRrHDG/md7RG40pWzhVLASmPWUv1k=;
 b=HuN/fiS+u8i2lGCltTownQGhj+bLwJc12S2gyt55XZWCKJeE+3ISevVb
 t9EgXu/xWFUTlTzFyOyHtxuuTfWDkJG377mVmJXJkAPxXDA7AtKg75/Ks
 KkzdXAAy5xFu745y8HcH0FJyfxYFGnsZwh7TRYNYy0G10TzaJdZwmmnCO
 gMHzVGYDS9rTBRFcKTwBbbmPcgCt6LCNzKOLkaCY7cMYN2o/2tK6AbTrm
 10ndZ2XYMk9dTFOutOYZbMr84gY5yWGEWCyZyZLydnqxnFRfg49zAB+/M
 WOO1YIif7XM3C1aQW4o18oJZ+KECTfZfBgQv10SzJxmjYfvWMPy80MMR7 w==;
X-CSE-ConnectionGUID: Rnt1uftDT1mo1nDiIbqb7A==
X-CSE-MsgGUID: CX8hPI1rSHyMrMKpZANdEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83560505"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="83560505"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 05:24:01 -0700
X-CSE-ConnectionGUID: zcUY2YtMST+6BtIIVZSMhQ==
X-CSE-MsgGUID: jC8GWnNNRFCqKKGqLDSPPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="251549136"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 05:23:58 -0700
Date: Mon, 29 Jun 2026 14:23:55 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, zhanjun.dong@intel.com, lukas@wunner.de,
 badal.nilawar@intel.com
Subject: Re: [PATCH v8 05/10] drm/xe/exec_queue: Introduce
 xe_exec_queue_reinit()
Message-ID: <akJj269We0sm6-Eg@black.igk.intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-6-raag.jadav@intel.com>
 <997fcd13-eb94-4770-a3b2-4d2d633e2985@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <997fcd13-eb94-4770-a3b2-4d2d633e2985@intel.com>
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

On Thu, Jun 25, 2026 at 05:06:12PM -0700, Daniele Ceraolo Spurio wrote:
> On 6/3/2026 3:17 AM, Raag Jadav wrote:
> > In preparation of usecases which require re-initializing exec queue
> > after PCIe FLR, introduce xe_exec_queue_reinit() helper. All the exec
> > queue LCRs already exist but the context is lost on PCIe FLR and needs
> > re-initialization.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > ---
> > v2: Re-initialize migrate context (Matthew Brost)
> > v6: Add IS_DGFX() and EXEC_QUEUE_FLAG_KERNEL asserts (Daniele)
> > ---
> >   drivers/gpu/drm/xe/xe_exec_queue.c | 42 +++++++++++++++++++++++++++---
> >   drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
> >   drivers/gpu/drm/xe/xe_lrc.c        | 17 ++++++++++++
> >   drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
> >   4 files changed, 58 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 1b5ca3ce578a..91b241a7ab24 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -335,9 +335,8 @@ static void __xe_exec_queue_fini(struct xe_exec_queue *q)
> >   		xe_lrc_put(q->lrc[i]);
> >   }
> > -static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> > +static u32 xe_lrc_init_flags(struct xe_exec_queue *q, u32 exec_queue_flags)
> >   {
> > -	int i, err;
> >   	u32 flags = 0;
> >   	/*
> > @@ -360,6 +359,13 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> >   	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
> >   		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
> > +	return flags;
> > +}
> > +
> > +static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> > +{
> > +	int i, err;
> > +
> >   	err = q->ops->init(q);
> >   	if (err)
> >   		return err;
> > @@ -383,8 +389,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> >   			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> > -			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> > -					    xe_lrc_ring_size(), q->msix_vec, flags);
> > +			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, xe_lrc_ring_size(),
> > +					    q->msix_vec, xe_lrc_init_flags(q, exec_queue_flags));
> >   			if (IS_ERR(lrc)) {
> >   				err = PTR_ERR(lrc);
> >   				goto err_lrc;
> > @@ -406,6 +412,34 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> >   	return err;
> >   }
> > +/**
> > + * xe_exec_queue_reinit() - Re-initialize exec queue
> > + * @q: exec queue to re-initialize
> > + *
> > + * Returns: 0 on success, negative error code otherwise.
> > + */
> > +int xe_exec_queue_reinit(struct xe_exec_queue *q)
> > +{
> > +	int i, err;
> > +
> > +	/* TODO: Re-initialize GSC and PXP queues */
> > +	xe_assert(gt_to_xe(q->gt), IS_DGFX(gt_to_xe(q->gt)));
> You can use xe_gt_assert here. Also, note that us not supporting GSC and PXP
> on discrete is a choice, not a generic requirement, so IMO for PXP/GSC
> checking it'd be better to add:
> 
> xe_gt_assert(q->gt, !xe_uc_fw_is_loadable(&gt->uc.gsc.fw));
> 
> xe_gt_assert(q->gt, !xe_pxp_is_enabled(gt_to_xe(q->gt)->pxp));

Sure.

> > +	/* Re-initialization only allowed for kernel queues */
> > +	xe_assert(gt_to_xe(q->gt), q->flags & EXEC_QUEUE_FLAG_KERNEL);
> > +
> > +	/* Re-initialize submission backend */
> > +	q->ops->reinit_kernel(q);
> 
> Thinking about it, the xe_sched_reinit() call from patch 2 could be moved
> here since that's not back-end specific.
> I won't ask you to re-spin just for this, so I'm ok with it being considered
> as a follow-up, but if you need to do a re-spin anyway it might be worth
> doing it now.

We xe_sched_init() inside guc_exec_queue_init() which IIUC is ->init()
backend call, so I thought we should be following the same pattern here?
Or did I miss something?

> > +
> > +	for (i = 0; i < q->width; i++) {
> > +		err = xe_lrc_reinit(q->lrc[i], q->hwe, q->vm, q->replay_state,
> > +				    q->msix_vec, xe_lrc_init_flags(q, q->flags));
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   /**
> >    * xe_exec_queue_create() - Create an exec queue
> >    * @xe: Xe device
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index a82d99bd77bc..445867d4da26 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -34,6 +34,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> >   void xe_exec_queue_fini(struct xe_exec_queue *q);
> >   void xe_exec_queue_destroy(struct kref *ref);
> >   void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
> > +int xe_exec_queue_reinit(struct xe_exec_queue *q);
> >   static inline struct xe_exec_queue *
> >   xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index a4292a11391d..c425269893fe 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1629,6 +1629,23 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
> >   	return err;
> >   }
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
> > +	return xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, init_flags);
> 
> nit: I wonder if it 'd just be easier to just export xe_lrc_ctx_init instead
> of creating xe_lrc_reinit. Not a blocker, so with the asserts fixed:

Coming right up.

> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Awesome :)

Raag

> > +}
> > +
> >   static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> >   		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index 0a3a611391ee..333b11f739ea 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -56,6 +56,8 @@ struct xe_lrc_snapshot {
> >   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> >   			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> > +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> > +		  void *replay_state, u16 msix_vec, u32 init_flags);
> >   void xe_lrc_destroy(struct kref *ref);
> >   /**
> 
