Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1931FEE4C8
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 05:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F22B10E1F7;
	Sat, 28 Feb 2026 05:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcGeA9Jh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0EB10E1F7
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 05:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772255567; x=1803791567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nLZOVNIOKH+NDp4rd67h6wgMiOnc/r7us6Y9Q8zGxJk=;
 b=dcGeA9JhzzY6SHvh3jcW2z3NBvrD5L/LMRatzteKzWCzIvEZrCQYWOL0
 +ek5gPgVpef5ntr0UWJGdz1Ug2fbk6AkvFR1u26NrYijPHo5PXnBcjKP9
 5iqYuFDN8GMK84AHDjkCOYrGDF8OjVGNB11GeAktTKodDB2j8nwG66V+g
 YMTRDH2pIsjINvDK9qVzK5qpUZlFmF4WQeeuHVcPdZuDhtZHTlZN9ZO9s
 vg8hLYDwx4t8xJqAopyiBS3vDCvI29utSKZeofgdTC/Jk1x8XuMzgYPls
 p0MM++JS0AoACbrHGkmxD9EP7uXEalmD+1ZQJ2kVVB5ueBqhjcq1ZpaZK w==;
X-CSE-ConnectionGUID: LM5JrWYWShSNtXUKTucNjQ==
X-CSE-MsgGUID: kSPFI/UFS1OuZ0UUouaNNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="60913063"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="60913063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 21:12:46 -0800
X-CSE-ConnectionGUID: asRL+ULbSqeWE9QgYlz5jQ==
X-CSE-MsgGUID: vF0i7t3nTH6BlQFiW4/bow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="220297116"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 21:12:43 -0800
Date: Sat, 28 Feb 2026 06:12:41 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se
Subject: Re: [PATCH v2 8/9] drm/xe/migrate: Introduce xe_migrate_reinit()
Message-ID: <aaJ5SSnzTBvYE514@black.igk.intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
 <20260227170049.3418863-9-raag.jadav@intel.com>
 <aaHjM/uWgWRufcTi@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaHjM/uWgWRufcTi@lstrano-desk.jf.intel.com>
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

On Fri, Feb 27, 2026 at 10:32:19AM -0800, Matthew Brost wrote:
> On Fri, Feb 27, 2026 at 10:30:48PM +0530, Raag Jadav wrote:
> > In preparation of usecases which require re-initializing migrate context
> > after PCIe FLR, introduce xe_migrate_reinit() helper. Migrate exec queue
> > and pt_bo already exist in migrate structure but since their contents live
> > on VRAM, they are lost on PCIe FLR and need re-initialization.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v2: Re-initialize migrate context (Matthew Brost)
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c      | 10 +++++
> >  drivers/gpu/drm/xe/xe_migrate.c | 65 +++++++++++++++++++++++++--------
> >  drivers/gpu/drm/xe/xe_migrate.h |  1 +
> >  3 files changed, 61 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index ff4a4e769fb1..ab34312830e3 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -966,6 +966,16 @@ void xe_gt_flr_prepare(struct xe_gt *gt)
> >   */
> >  int xe_gt_flr_done(struct xe_gt *gt)
> >  {
> > +	int err;
> > +
> > +	if (xe_gt_is_main_type(gt)) {
> > +		struct xe_tile *tile = gt_to_tile(gt);
> > +
> > +		err = xe_migrate_reinit(tile->migrate);
> 
> I think there is work ahead for future platforms where multiple tiles
> point to the same migrate object, so we’ll need to keep an eye on that.
> Perhaps calling xe_migrate_reinit twice is harmless too.
> 
> Anyways the patch looks correct.
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thank you.

Raag

> > +		if (err)
> > +			return err;
> > +	}
> > +
> >  	return xe_uc_flr_done(&gt->uc);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 333af7b57ae9..f4a2ad3ce601 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -184,19 +184,11 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
> >  	xe_assert(xe, pos == vram_limit);
> >  }
> >  
> > -static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > -				 struct xe_vm *vm, struct drm_exec *exec)
> > +static int xe_migrate_pt_bo_alloc(struct xe_tile *tile, struct xe_migrate *m,
> > +				  struct xe_vm *vm, struct drm_exec *exec)
> >  {
> > -	struct xe_device *xe = tile_to_xe(tile);
> > -	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> > -	u8 id = tile->id;
> > -	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> > -#define VRAM_IDENTITY_MAP_COUNT	2
> > -	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
> > -#undef VRAM_IDENTITY_MAP_COUNT
> > -	u32 map_ofs, level, i;
> >  	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
> > -	u64 entry, pt29_ofs;
> > +	u32 num_entries = NUM_PT_SLOTS;
> >  
> >  	/* Can't bump NUM_PT_SLOTS too high */
> >  	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
> > @@ -216,6 +208,24 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> > +	m->pt_bo = bo;
> > +	return 0;
> > +}
> > +
> > +static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > +				  struct xe_vm *vm, u32 *ofs)
> > +{
> > +	struct xe_device *xe = tile_to_xe(tile);
> > +	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> > +	u8 id = tile->id;
> > +	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> > +#define VRAM_IDENTITY_MAP_COUNT	2
> > +	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
> > +#undef VRAM_IDENTITY_MAP_COUNT
> > +	u32 map_ofs, level, i;
> > +	struct xe_bo *bo = m->pt_bo, *batch = tile->mem.kernel_bb_pool->bo;
> > +	u64 entry, pt29_ofs;
> > +
> >  	/* PT30 & PT31 reserved for 2M identity map */
> >  	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
> >  	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
> > @@ -338,6 +348,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >  		}
> >  	}
> >  
> > +	if (ofs)
> > +		*ofs = map_ofs;
> > +}
> > +
> > +static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
> > +{
> >  	/*
> >  	 * Example layout created above, with root level = 3:
> >  	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
> > @@ -363,9 +379,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >  	drm_suballoc_manager_init(&m->vm_update_sa,
> >  				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
> >  				  NUM_VMUSA_UNIT_PER_PAGE, 0);
> > -
> > -	m->pt_bo = bo;
> > -	return 0;
> >  }
> >  
> >  /*
> > @@ -416,12 +429,22 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
> >  	struct xe_device *xe = tile_to_xe(tile);
> >  	struct xe_validation_ctx ctx;
> >  	struct drm_exec exec;
> > +	u32 map_ofs;
> >  	int err = 0;
> >  
> >  	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
> >  		err = xe_vm_drm_exec_lock(vm, &exec);
> > +		if (err)
> > +			return err;
> > +
> >  		drm_exec_retry_on_contention(&exec);
> > -		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
> > +
> > +		err = xe_migrate_pt_bo_alloc(tile, m, vm, &exec);
> > +		if (err)
> > +			return err;
> > +
> > +		xe_migrate_prepare_vm(tile, m, vm, &map_ofs);
> > +		xe_migrate_suballoc_manager_init(m, map_ofs);
> >  		drm_exec_retry_on_contention(&exec);
> >  		xe_validation_retry_on_oom(&ctx, &err);
> >  	}
> > @@ -429,6 +452,18 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_migrate_reinit() - Re-initialize a migrate context
> > + * @m: The migration context
> > + *
> > + * Returns: 0 on success, negative error code otherwise.
> > + */
> > +int xe_migrate_reinit(struct xe_migrate *m)
> > +{
> > +	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
> > +	return xe_exec_queue_reinit(m->q);
> > +}
> > +
> >  /**
> >   * xe_migrate_init() - Initialize a migrate context
> >   * @m: The migration context
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > index 1522afb37dcf..fffbcab8b2e3 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -112,6 +112,7 @@ struct xe_migrate_pt_update {
> >  
> >  struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
> >  int xe_migrate_init(struct xe_migrate *m);
> > +int xe_migrate_reinit(struct xe_migrate *m);
> >  
> >  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> >  				     unsigned long npages,
> > -- 
> > 2.43.0
> > 
