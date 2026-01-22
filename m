Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E808D3EE74
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 15:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D27410E9DB;
	Thu, 22 Jan 2026 15:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cN/Pro4M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A719B10E9DB
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769095864; x=1800631864;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=daLNwNVk3FyWliH2uKgxVxbLO4nL7ycNhwdVBv9PaG8=;
 b=cN/Pro4M5ByvHuPDL39aE9QoHlTGwYnXN56GVH/ktL4D5opkDZ2snOYE
 Vy30FS5CkhCvWFAc/Xfo64Rcl1SrxlyiNjdpbve6IJFGspX6h9Up39xrH
 jq9HtVzBEMfExLucsTq0Go7dGoRqqjCi6Ek+dPB2z/wm4xdZ3dqbeG03u
 hXsHHXKrwmyQsGo4xGrOwtBsb/mB8PUewkzcYWTV88UpdgngkzF9Y2Jed
 rVqNK/Lg5kvFVCMHX/ZONTl4C+WZba2LWYhHXm0t7OjD+0t2b39C9RnfV
 WDHgdWekhH5jiZWJ5QOyZCSDeLJIg2yjTW0YpaCjyooDPpTlMuxlmKuKs w==;
X-CSE-ConnectionGUID: EkjyurQCRSyhjBoZ5yT3Tg==
X-CSE-MsgGUID: nQaZbPjwS6qWeW/f0ikOow==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87917765"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87917765"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:31:04 -0800
X-CSE-ConnectionGUID: EVU0YHsWTHKhQLuHVJZYCw==
X-CSE-MsgGUID: PBq/JFt3R0GVCw7DYLzd9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="244377921"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.235])
 ([10.245.245.235])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:31:02 -0800
Message-ID: <2ea862f587c233f76865b340c6c1bd01499e36e3.camel@linux.intel.com>
Subject: Re: [PATCH v4 3/8] drm/xe/madvise: Implement purgeable buffer
 object support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Arvind Yadav
 <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Thu, 22 Jan 2026 16:30:59 +0100
In-Reply-To: <aW+0HUCM9UvfTL05@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-4-arvind.yadav@intel.com>
 <aW+0HUCM9UvfTL05@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
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

On Tue, 2026-01-20 at 08:58 -0800, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 11:38:49AM +0530, Arvind Yadav wrote:
> > This allows userspace applications to provide memory usage hints to
> > the kernel for better memory management under pressure:
> >=20
> > Add the core implementation for purgeable buffer objects, enabling
> > memory
> > reclamation of user-designated DONTNEED buffers during eviction.
> >=20
> > This patch implements the purge operation and state machine
> > transitions:
> >=20
> > Purgeable States (from xe_madv_purgeable_state):
> > =C2=A0- WILLNEED (0): BO should be retained, actively used
> > =C2=A0- DONTNEED (1): BO eligible for purging, not currently needed
> > =C2=A0- PURGED (2): BO backing store reclaimed, permanently invalid
> >=20
> > Design Rationale:
> > =C2=A0 - Async TLB invalidation via trigger_rebind (no blocking
> > xe_vm_invalidate_vma)
> > =C2=A0 - i915 compatibility: retained field, "once purged always purged=
"
> > semantics
> > =C2=A0 - Shared BO protection prevents multi-process memory corruption
> > =C2=A0 - Scratch PTE reuse avoids new infrastructure, safe for fault
> > mode
> >=20
> > v2:
> > =C2=A0 - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas
> > Hellstr=C3=B6m)
> > =C2=A0 - Add NULL rebind with scratch PTEs for fault mode (Thomas
> > Hellstr=C3=B6m)
> > =C2=A0 - Implement i915-compatible retained field logic (Thomas
> > Hellstr=C3=B6m)
> > =C2=A0 - Skip BO validation for purged BOs in page fault handler (crash
> > fix)
> > =C2=A0 - Add scratch VM check in page fault path (non-scratch VMs fail
> > fault)
> > =C2=A0 - Force clear_pt for non-scratch VMs to avoid phys addr 0 mappin=
g
> > (review fix)
> > =C2=A0 - Add !is_purged check to resource cursor setup to prevent stale
> > access
> >=20
> > v3:
> > =C2=A0 - Rebase as xe_gt_pagefault.c is gone upstream and replaced
> > =C2=A0=C2=A0=C2=A0 with xe_pagefault.c (Matthew Brost)
> > =C2=A0 - Xe specific warn on (Matthew Brost)
> > =C2=A0 - Call helpers for madv_purgeable access(Matthew Brost)
> > =C2=A0 - Remove bo NULL check(Matthew Brost)
> > =C2=A0 - Use xe_bo_assert_held instead of dma assert(Matthew Brost)
> > =C2=A0 - Move the xe_bo_is_purged check under the dma-resv lock( by
> > Matt)
> > =C2=A0 - Drop is_purged from xe_pt_stage_bind_entry and just set is_nul=
l
> > to true
> > =C2=A0=C2=A0=C2=A0 for purged BO rename s/is_null/is_null_or_purged (by=
 Matt)
> > =C2=A0 - UAPI rule should not be changed.(Matthew Brost)
> > =C2=A0 - Make 'retained' a userptr (Matthew Brost)
> >=20
> > v4:
> > =C2=A0 - @madv_purgeable atomic_t =E2=86=92 u32 change across all relev=
ant
> > patches. (Matt)
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 61 +++++++++++++++++----
> > =C2=A0drivers/gpu/drm/xe/xe_pagefault.c=C2=A0 | 12 ++++
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 38 +++++++++++--
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 11 +++-
> > =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 88
> > ++++++++++++++++++++++++++++++
> > =C2=A05 files changed, 191 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 408c74216fdf..d0a6d340b255 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -836,6 +836,43 @@ static int xe_bo_move_notify(struct xe_bo *bo,
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_ttm_bo_purge() - Purge buffer object backing store
> > + * @ttm_bo: The TTM buffer object to purge
> > + * @ctx: TTM operation context
> > + *
> > + * This function purges the backing store of a BO marked as
> > DONTNEED and
> > + * triggers rebind to invalidate stale GPU mappings. For fault-
> > mode VMs,
> > + * this zaps the PTEs. The next GPU access will trigger a page
> > fault and
> > + * perform NULL rebind (scratch pages or clear PTEs based on VM
> > config).
> > + */
> > +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
> > struct ttm_operation_ctx *ctx)
> > +{
> > +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > +	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
> > +
>=20
> xe_bo_assert_held(bo);
>=20
> > +	if (ttm_bo->ttm) {
> > +		struct ttm_placement place =3D {};
> > +		int ret =3D ttm_bo_validate(ttm_bo, &place, ctx);
> > +
> > +		drm_WARN_ON(&xe->drm, ret);
>=20
> I think since 'xe' in available here, you should use xe_assert in
> place
> of drm_WARN_ON.
>=20
> > +		if (!ret) {
> > +			if (xe_bo_madv_is_dontneed(bo)) {
> > +				bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_PURGED;
>=20
> Helper to set madv_purgeable state /w lockdep assert?
>=20
> Also perhaps assert valid state transitions in the helper (e.g., you
> cannot tranistion out of XE_MADV_PURGEABLE_PURGED.
>=20
> > +
> > +				/*
> > +				 * Trigger rebind to invalidate
> > stale GPU mappings.
> > +				 * - Non-fault mode: Marks VMAs
> > for rebind
> > +				 * - Fault mode: Zaps PTEs (sets
> > to 0), next access triggers fault
> > +				 *=C2=A0=C2=A0 and NULL rebind with
> > scratch/clear PTEs per VM config
> > +				 */
> > +				ret =3D xe_bo_trigger_rebind(xe, bo,
> > ctx);
> > +				XE_WARN_ON(ret);
>=20
> I think xe_bo_trigger_rebind is allowed to fail if ctx->no_wait_gpu
> is
> set. In both the faulting fast path and certain parts of the shrinker
> we
> set this. So I think any error returned from xe_bo_trigger_rebind
> needs
> to propagte up the call stack.

If possible, I think we should call xe_bo_move_notify(), which will in
turn call xe_bo_trigger_rebind() rather than call
xe_bo_trigger_rebind(), since xe_bo_move_notify() is intended to unbind
/ unmap everything needed before a bo move / purge. In this case
xe_bo_trigger_rebind() may be sufficient, but perhaps not in the
future.

>=20
> > +			}
> > +		}
> > +	}
> > +}
> > +
> > =C2=A0static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool
> > evict,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *new_mem,
> > @@ -855,6 +892,15 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> > =C2=A0				=C2=A0 ttm && ttm_tt_is_populated(ttm))
> > ? true : false;
> > =C2=A0	int ret =3D 0;
> > =C2=A0
> > +	/*
> > +	 * Purge only non-shared BOs explicitly marked DONTNEED by
> > userspace.
> > +	 * The move_notify callback will handle invalidation
> > asynchronously.
> > +	 */
> > +	if (evict && xe_bo_madv_is_dontneed(bo)) {
> > +		xe_ttm_bo_purge(ttm_bo, ctx);
>=20
> With above, we need to send errors from xe_ttm_bo_purge up the call
> stack.
>=20
> > +		return 0;
> > +	}
> > +
> > =C2=A0	/* Bo creation path, moving to system or TT. */
> > =C2=A0	if ((!old_mem && ttm) && !handle_system_ccs) {
> > =C2=A0		if (new_mem->mem_type =3D=3D XE_PL_TT)
> > @@ -1604,18 +1650,6 @@ static void
> > xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
> > struct ttm_operation_ctx *ctx)
> > -{
> > -	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > -
> > -	if (ttm_bo->ttm) {
> > -		struct ttm_placement place =3D {};
> > -		int ret =3D ttm_bo_validate(ttm_bo, &place, ctx);
> > -
> > -		drm_WARN_ON(&xe->drm, ret);
> > -	}
> > -}
> > -
> > =C2=A0static void xe_ttm_bo_swap_notify(struct ttm_buffer_object
> > *ttm_bo)
> > =C2=A0{
> > =C2=A0	struct ttm_operation_ctx ctx =3D {
> > @@ -2196,6 +2230,9 @@ struct xe_bo *xe_bo_init_locked(struct
> > xe_device *xe, struct xe_bo *bo,
> > =C2=A0#endif
> > =C2=A0	INIT_LIST_HEAD(&bo->vram_userfault_link);
> > =C2=A0
> > +	/* Initialize purge advisory state */
> > +	bo->madv_purgeable =3D XE_MADV_PURGEABLE_WILLNEED;
> > +
> > =C2=A0	drm_gem_private_object_init(&xe->drm, &bo->ttm.base,
> > size);
> > =C2=A0
> > =C2=A0	if (resv) {
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 6bee53d6ffc3..e3ace179e9cf 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -59,6 +59,18 @@ static int xe_pagefault_begin(struct drm_exec
> > *exec, struct xe_vma *vma,
> > =C2=A0	if (!bo)
> > =C2=A0		return 0;
> > =C2=A0
> > +	/*
> > +	 * Check if BO is purged (under dma-resv lock).
> > +	 * For purged BOs:
> > +	 * - Scratch VMs: Skip validation, rebind will use scratch
> > PTEs
> > +	 * - Non-scratch VMs: FAIL the page fault (no scratch page
> > available)
> > +	 */
> > +	if (unlikely(xe_bo_is_purged(bo))) {
> > +		if (!xe_vm_has_scratch(vm))
> > +			return -EACCES;
> > +		return 0;
> > +	}
> > +
> > =C2=A0	return need_vram_move ? xe_bo_migrate(bo, vram->placement,
> > NULL, exec) :
> > =C2=A0		xe_bo_validate(bo, vm, true, exec);
> > =C2=A0}
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > index 6703a7049227..c8c66300e25b 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > pgoff_t offset,
> > =C2=A0	/* Is this a leaf entry ?*/
> > =C2=A0	if (level =3D=3D 0 || xe_pt_hugepte_possible(addr, next,
> > level, xe_walk)) {
> > =C2=A0		struct xe_res_cursor *curs =3D xe_walk->curs;
> > -		bool is_null =3D xe_vma_is_null(xe_walk->vma);
> > -		bool is_vram =3D is_null ? false :
> > xe_res_is_vram(curs);
> > +		struct xe_bo *bo =3D xe_vma_bo(xe_walk->vma);
> > +		bool is_null_or_purged =3D xe_vma_is_null(xe_walk-
> > >vma) ||
> > +					 (bo &&
> > xe_bo_is_purged(bo));
> > +		bool is_vram =3D is_null_or_purged ? false :
> > xe_res_is_vram(curs);
> > =C2=A0
> > =C2=A0		XE_WARN_ON(xe_walk->va_curs_start !=3D addr);
> > =C2=A0
> > =C2=A0		if (xe_walk->clear_pt) {
> > =C2=A0			pte =3D 0;
> > =C2=A0		} else {
> > -			pte =3D vm->pt_ops->pte_encode_vma(is_null ?
> > 0 :
> > +			/*
> > +			 * For purged BOs, treat like null VMAs -
> > pass address 0.
> > +			 * The pte_encode_vma will set XE_PTE_NULL
> > flag for scratch mapping.
> > +			 */
> > +			pte =3D vm->pt_ops-
> > >pte_encode_vma(is_null_or_purged ? 0 :
> > =C2=A0						=09
> > xe_res_dma(curs) +
> > =C2=A0							 xe_walk-
> > >dma_offset,
> > =C2=A0							 xe_walk-
> > >vma,
> > =C2=A0						=09
> > pat_index, level);
> > -			if (!is_null)
> > +			if (!is_null_or_purged)
> > =C2=A0				pte |=3D is_vram ? xe_walk-
> > >default_vram_pte :
> > =C2=A0					xe_walk-
> > >default_system_pte;
> > =C2=A0
> > @@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > pgoff_t offset,
> > =C2=A0		if (unlikely(ret))
> > =C2=A0			return ret;
> > =C2=A0
> > -		if (!is_null && !xe_walk->clear_pt)
> > +		if (!is_null_or_purged && !xe_walk->clear_pt)
> > =C2=A0			xe_res_next(curs, next - addr);
> > =C2=A0		xe_walk->va_curs_start =3D next;
> > =C2=A0		xe_walk->vma->gpuva.flags |=3D (XE_VMA_PTE_4K <<
> > level);
> > @@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > xe_vma *vma,
> > =C2=A0	};
> > =C2=A0	struct xe_pt *pt =3D vm->pt_root[tile->id];
> > =C2=A0	int ret;
> > +	bool is_purged =3D false;
> > +
> > +	/*
> > +	 * Check if BO is purged:
> > +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe
> > zero reads
> > +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to
> > avoid mapping to phys addr 0
> > +	 *
> > +	 * For non-scratch VMs, we force clear_pt=3Dtrue so leaf
> > PTEs become completely
> > +	 * zero instead of creating a PRESENT mapping to physical
> > address 0.
> > +	 */
> > +	if (bo && xe_bo_is_purged(bo)) {
> > +		is_purged =3D true;
> > +
> > +		/*
> > +		 * For non-scratch VMs, a NULL rebind should use
> > zero PTEs
> > +		 * (non-present), not a present PTE to phys 0.
> > +		 */
> > +		if (!xe_vm_has_scratch(vm))
> > +			xe_walk.clear_pt =3D true;
> > +	}
> > =C2=A0
> > =C2=A0	if (range) {
> > =C2=A0		/* Move this entire thing to xe_svm.c? */
> > @@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > xe_vma *vma,
> > =C2=A0	if (!range)
> > =C2=A0		xe_bo_assert_held(bo);
> > =C2=A0
> > -	if (!xe_vma_is_null(vma) && !range) {
> > +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
> > =C2=A0		if (xe_vma_is_userptr(vma))
> > =C2=A0			xe_res_first_dma(to_userptr_vma(vma)-
> > >userptr.pages.dma_addr, 0,
> > =C2=A0					 xe_vma_size(vma), &curs);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 694f592a0f01..c3a5fe76ff96 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1359,6 +1359,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo
> > *bo, u64 bo_offset,
> > =C2=A0static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 pat_index, u32 pt_lev=
el)
> > =C2=A0{
> > +	struct xe_bo *bo =3D xe_vma_bo(vma);
> > +	struct xe_vm *vm =3D xe_vma_vm(vma);
> > +
> > =C2=A0	pte |=3D XE_PAGE_PRESENT;
> > =C2=A0
> > =C2=A0	if (likely(!xe_vma_read_only(vma)))
> > @@ -1367,7 +1370,13 @@ static u64 xelp_pte_encode_vma(u64 pte,
> > struct xe_vma *vma,
> > =C2=A0	pte |=3D pte_encode_pat_index(pat_index, pt_level);
> > =C2=A0	pte |=3D pte_encode_ps(pt_level);
> > =C2=A0
> > -	if (unlikely(xe_vma_is_null(vma)))
> > +	/*
> > +	 * NULL PTEs redirect to scratch page (return zeros on
> > read).
> > +	 * Set for: 1) explicit null VMAs, 2) purged BOs on
> > scratch VMs.
> > +	 * Never set NULL flag without scratch page - causes
> > undefined behavior.
> > +	 */
> > +	if (unlikely(xe_vma_is_null(vma) ||
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 (bo && xe_bo_is_purged(bo) &&
> > xe_vm_has_scratch(vm))))
> > =C2=A0		pte |=3D XE_PTE_NULL;
> > =C2=A0
> > =C2=A0	return pte;
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index add9a6ca2390..dfeab9e24a09 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -179,6 +179,56 @@ static void madvise_pat_index(struct xe_device
> > *xe, struct xe_vm *vm,
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > +/*:
> > + * Handle purgeable buffer object advice for
> > DONTNEED/WILLNEED/PURGED.
> > + * Returns true if any BO was purged, false otherwise.
> > + * Caller must copy retained value to userspace after releasing
> > locks.
> > + */
> > +static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe,
> > struct xe_vm *vm,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma **vmas, int
> > num_vmas,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_madvise *op)
>=20
> Shouldn't this check be a vfunc in madvise_funcs?
>=20
> Also I think you can hook into xe_madvise_details for the return
> value /
> final copy to user.
>=20
> > +{
> > +	bool has_purged_bo =3D false;
> > +	int i;
> > +
> > +	xe_assert(vm->xe, op->type =3D=3D
> > DRM_XE_VMA_ATTR_PURGEABLE_STATE);
> > +
> > +	for (i =3D 0; i < num_vmas; i++) {
> > +		struct xe_bo *bo =3D xe_vma_bo(vmas[i]);
> > +
> > +		if (!bo)
> > +			continue;
> > +
> > +		/* BO must be locked before modifying madv state
> > */
> > +		xe_bo_assert_held(bo);
> > +
> > +		/*
> > +		 * Once purged, always purged. Cannot transition
> > back to WILLNEED.
> > +		 * This matches i915 semantics where purged BOs
> > are permanently invalid.
> > +		 */
> > +		if (xe_bo_is_purged(bo)) {
> > +			has_purged_bo =3D true;
> > +			continue;
> > +		}
> > +
> > +		switch (op->purge_state_val.val) {
> > +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> > +			bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_WILLNEED;
> > +			break;
> > +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> > +			bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_DONTNEED;
>=20
> Use above suggested helper to set this state?
>=20
> > +			break;
> > +		default:
> > +			drm_warn(&vm->xe->drm, "Invalid madvice
> > value =3D %d\n",
> > +				 op->purge_state_val.val);
> > +			return false;
> > +		}
> > +	}
> > +
> > +	/* Return whether any BO was purged; caller will copy to
> > user after unlocking */
> > +	return has_purged_bo;
> > +}
> > +
> > =C2=A0typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm
> > *vm,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma **vmas, int num_vmas,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_madvise *op,
> > @@ -306,6 +356,16 @@ static bool madvise_args_are_sane(struct
> > xe_device *xe, const struct drm_xe_madv
> > =C2=A0			return false;
> > =C2=A0		break;
> > =C2=A0	}
> > +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> > +	{
> > +		u32 val =3D args->purge_state_val.val;
> > +
> > +		if (XE_IOCTL_DBG(xe, !(val =3D=3D
> > DRM_XE_VMA_PURGEABLE_STATE_WILLNEED ||
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D=3D
> > DRM_XE_VMA_PURGEABLE_STATE_DONTNEED)))
> > +			return false;
> > +
> > +		break;
> > +	}
> > =C2=A0	default:
> > =C2=A0		if (XE_IOCTL_DBG(xe, 1))
> > =C2=A0			return false;
> > @@ -465,6 +525,34 @@ int xe_vm_madvise_ioctl(struct drm_device
> > *dev, void *data, struct drm_file *fil
> > =C2=A0					goto err_fini;
> > =C2=A0			}
> > =C2=A0		}
> > +		if (args->type =3D=3D DRM_XE_VMA_ATTR_PURGEABLE_STATE)
> > {
> > +			bool has_purged_bo;
> > +
> > +			has_purged_bo =3D
> > xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
> > +								=C2=A0=C2=A0
> > madvise_range.num_vmas, args);
> > +
>=20
> Again use the existing vfuncs here.
>=20
> > +			/* Release BO locks */
> > +			drm_exec_fini(&exec);
> > +			kfree(madvise_range.vmas);
> > +			up_write(&vm->lock);
> > +
> > +			/*
> > +			 * Set retained flag to indicate if
> > backing store still exists.
> > +			 * Matches i915: retained =3D 1 if not
> > purged, 0 if purged.
> > +			 * Must copy_to_user AFTER releasing ALL
> > locks to avoid circular dependency.
> > +			 */
> > +			if (args->purge_state_val.retained) {
> > +				u32 retained =3D !has_purged_bo;
> > +
> > +				if
> > (copy_to_user(u64_to_user_ptr(args->purge_state_val.retained),
> > +						 &retained,
> > sizeof(retained)))
>=20
> I don't think remained needs to be a u64 - maybe a u16? Will comment
> on
> uAPI too.
>=20
> > +					drm_warn(&vm->xe->drm,
> > "Failed to copy retained value to user\n");
>=20
> See above, use xe_madvise_details_fini for the final copy to user.

Can we use put_user() rather than copy_to_user() ?

Also, should the IOCTL return a failure in this case?

Another option is ofc to assert that retained is set to false on IOCTL
call, so that if put_user() fails, UMD will not try to reuse a bo whose
retained state is unclear.


Thanks,
Thomas


>=20
> Matt
>=20
> > +			}
> > +
> > +			/* Final cleanup for early return */
> > +			xe_vm_put(vm);
> > +			return 0;
> > +		}
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (madvise_range.has_svm_userptr_vmas) {
> > --=20
> > 2.43.0
> >=20
