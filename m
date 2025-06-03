Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0837C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 10:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3B710E141;
	Tue,  3 Jun 2025 10:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VS7pGfD1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E510E10E141
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 10:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748945222; x=1780481222;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GQWfBt/y7Jd1QN+YlUjs+ZM6GBzkOWKTYYI8dGnoSxk=;
 b=VS7pGfD1FBCeS3x6Yjjpd58YLT0HIxHlgVBvwxTtznA+y2aKiUQGs0PZ
 YSbBboLWvZnt1dKDZA59ht4HHlbR9GtzR5ocPK4ClF4MjmJsKLYYpfl2+
 2rihYe4Nt+Qh6E4GDK9VzzLiLkoay8DDwbD8la02P3Sf+VAnQY2fPlJUe
 VVQYl4egJKZapbFjBzD/X7B4SlZiT/eyuTIk7KrGjVGIj4aGrm3b3HqHL
 ZspEbv9N/VSDJ8nJpTy/hzvMzXF1inHbhSA9dMtRHBsxfoVfMyCvT5KXY
 MkUjSbgXT3XlAGqNBfaroUVxhkdcBEstEr8wbn/ZMuWwTpk2r6dHAIePH g==;
X-CSE-ConnectionGUID: +c3UtCalT16tjB4CJtYqpw==
X-CSE-MsgGUID: lVYVfD/cRX20TzQfarw1ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61597962"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="61597962"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 03:07:02 -0700
X-CSE-ConnectionGUID: TNF99XnMQzqIWIDFX9M97A==
X-CSE-MsgGUID: rsjlSRi9QFeWEbrkB3RE7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144847902"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.199])
 ([10.245.244.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 03:07:01 -0700
Message-ID: <ca525dc1e2be1e69e06b22fd446996e43b2d7f38.camel@linux.intel.com>
Subject: Re: [PATCH v4] drm/xe: Make VMA tile_present, tile_invalidated
 access rules clear
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
Date: Tue, 03 Jun 2025 12:06:46 +0200
In-Reply-To: <20250602164412.1912293-1-matthew.brost@intel.com>
References: <20250602164412.1912293-1-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Mon, 2025-06-02 at 09:44 -0700, Matthew Brost wrote:
> Document VMA tile_invalidated access rules, use READ_ONCE /
> WRITE_ONCE
> for opportunistic checks of tile_present and tile_invalidated, move
> tile_invalidated state change from page fault handler to PT code
> under
> the correct locks, and add lockdep asserts to TLB invalidation paths.
>=20
> v2:
> =C2=A0- Assert VM dma-resv lock rather than BO in zap PTEs
> v3:
> =C2=A0- Back to BO's dma-resv lock, adjust documentation
> v4:
> =C2=A0- Add WRITE_ONCE in xe_vm_invalidate_vma (Thomas)
> =C2=A0- Change lockdep assert for userptr in xe_vm_invalidate_vma (CI)
> =C2=A0- Take userptr notifier lock in read mode in xe_vm_userptr_pin
> before
> =C2=A0=C2=A0 calling xe_vm_invalidate_vma (CI)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++----
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 16 +++++++++++++---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++++----
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++=
++++--
> =C2=A04 files changed, 44 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 7a8f87709e39..05fbc83c64b7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -68,8 +68,12 @@ static bool access_is_atomic(enum access_type
> access_type)
> =C2=A0
> =C2=A0static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> =C2=A0{
> -	return BIT(tile->id) & vma->tile_present &&
> -		!(BIT(tile->id) & vma->tile_invalidated);
> +	/*
> +	 * Advisory only check whether the VMA currently has a valid
> mapping,
> +	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
> +	 */
> +	return BIT(tile->id) & READ_ONCE(vma->tile_present) &&
> +		!(BIT(tile->id) & READ_ONCE(vma->tile_invalidated));
> =C2=A0}
> =C2=A0
> =C2=A0
> @@ -121,7 +125,7 @@ static int handle_vma_pagefault(struct xe_gt *gt,
> struct xe_vma *vma,
> =C2=A0
> =C2=A0	trace_xe_vma_pagefault(vma);
> =C2=A0
> -	/* Check if VMA is valid */
> +	/* Check if VMA is valid, opportunistic check only */
> =C2=A0	if (vma_is_valid(tile, vma) && !atomic)
> =C2=A0		return 0;
> =C2=A0
> @@ -158,7 +162,6 @@ static int handle_vma_pagefault(struct xe_gt *gt,
> struct xe_vma *vma,
> =C2=A0
> =C2=A0	dma_fence_wait(fence, false);
> =C2=A0	dma_fence_put(fence);
> -	vma->tile_invalidated &=3D ~BIT(tile->id);
> =C2=A0
> =C2=A0unlock_dma_resv:
> =C2=A0	drm_exec_fini(&exec);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index c9c41fbe125c..f39d5cc9f411 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -907,6 +907,11 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct
> xe_vma *vma)
> =C2=A0	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> =C2=A0	u8 pt_mask =3D (vma->tile_present & ~vma->tile_invalidated);
> =C2=A0
> +	if (xe_vma_bo(vma))
> +		xe_bo_assert_held(xe_vma_bo(vma));
> +	else if (xe_vma_is_userptr(vma))
> +		lockdep_assert_held(&xe_vma_vm(vma)-
> >userptr.notifier_lock);
> +
> =C2=A0	if (!(pt_mask & BIT(tile->id)))
> =C2=A0		return false;
> =C2=A0
> @@ -2191,10 +2196,15 @@ static void bind_op_commit(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0					=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL :
> =C2=A0					=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP);
> =C2=A0	}
> -	vma->tile_present |=3D BIT(tile->id);
> -	vma->tile_staged &=3D ~BIT(tile->id);
> +	/* All WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c
> */
> +	WRITE_ONCE(vma->tile_present, vma->tile_present | BIT(tile-
> >id));
> =C2=A0	if (invalidate_on_bind)
> -		vma->tile_invalidated |=3D BIT(tile->id);
> +		WRITE_ONCE(vma->tile_invalidated,
> +			=C2=A0=C2=A0 vma->tile_invalidated | BIT(tile->id));
> +	else
> +		WRITE_ONCE(vma->tile_invalidated,
> +			=C2=A0=C2=A0 vma->tile_invalidated & ~BIT(tile->id));
> +	vma->tile_staged &=3D ~BIT(tile->id);
> =C2=A0	if (xe_vma_is_userptr(vma)) {
> =C2=A0		lockdep_assert_held_read(&vm-
> >userptr.notifier_lock);
> =C2=A0		to_userptr_vma(vma)->userptr.initial_bind =3D true;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7140d8856bad..18f967ce1f1a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -732,7 +732,9 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false,
> MAX_SCHEDULE_TIMEOUT);
> =C2=A0
> +			down_read(&vm->userptr.notifier_lock);
> =C2=A0			err =3D xe_vm_invalidate_vma(&uvma->vma);
> +			up_read(&vm->userptr.notifier_lock);

Hm. Why are we calling xe_vm_invalidate_vma() here to begin with? Isn't
the reason we end up here that the userptr was already invalidated?


> =C2=A0			xe_vm_unlock(vm);
> =C2=A0			if (err)
> =C2=A0				break;
> @@ -3853,6 +3855,7 @@ void xe_vm_unlock(struct xe_vm *vm)
> =C2=A0int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D xe_vma_vm(vma)->xe;
> +	struct xe_vm *vm =3D xe_vma_vm(vma);
> =C2=A0	struct xe_tile *tile;
> =C2=A0	struct xe_gt_tlb_invalidation_fence
> =C2=A0		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> @@ -3864,17 +3867,24 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
> =C2=A0	trace_xe_vma_invalidate(vma);
> =C2=A0
> -	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> +	vm_dbg(&vm->xe->drm,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "INVALIDATE: addr=3D0x%016llx=
, range=3D0x%016llx",
> =C2=A0		xe_vma_start(vma), xe_vma_size(vma));
> =C2=A0
> -	/* Check that we don't race with page-table updates */
> +	/*
> +	 * Check that we don't race with page-table updates,
> tile_invalidated
> +	 * update is safe
> +	 */
> =C2=A0	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> =C2=A0		if (xe_vma_is_userptr(vma)) {
> +			lockdep_assert(lockdep_is_held_type(&vm-
> >userptr.notifier_lock, 0) ||
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (lockdep_is_held_type(&vm-
> >userptr.notifier_lock, 1) &&
> +					lockdep_is_held(&xe_vm_resv(
> vm)->lock.base)));
> +
> =C2=A0			WARN_ON_ONCE(!mmu_interval_check_retry
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 (&to_userptr_vma(vma)-
> >userptr.notifier,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to_userptr_vma(vma)-
> >userptr.notifier_seq));
> -
> 			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
> +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_r
> esv(vm),
> =C2=A0							=C2=A0=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP));
> =C2=A0
> =C2=A0		} else {
> @@ -3914,7 +3924,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0	for (id =3D 0; id < fence_id; ++id)
> =C2=A0		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> =C2=A0
> -	vma->tile_invalidated =3D vma->tile_mask;
> +	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> +	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 0e1318a15c9e..4275f71a74dd 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -100,14 +100,21 @@ struct xe_vma {
> =C2=A0		struct work_struct destroy_work;
> =C2=A0	};
> =C2=A0
> -	/** @tile_invalidated: VMA has been invalidated */
> +	/**
> +	 * @tile_invalidated: Tile mask of binding are invalidated
> for this VMA.
> +	 * protected by BO's resv and for userptrs, vm-
> >userptr.notifier_lock in
> +	 * write mode for writing or vm->userptr.notifier_lock in
> read mode and
> +	 * the vm->resv. For stable reading, BO's resv or useptr
s/userptr/useptr/

> +	 * vm->userptr.notifier_lock in read mode is required. Can
> be
> +	 * opportunisticly read with READ_ONCE outside of locks.

opportunistically

> +	 */
> =C2=A0	u8 tile_invalidated;
> =C2=A0
> =C2=A0	/** @tile_mask: Tile mask of where to create binding for
> this VMA */
> =C2=A0	u8 tile_mask;
> =C2=A0
> =C2=A0	/**
> -	 * @tile_present: GT mask of binding are present for this
> VMA.
> +	 * @tile_present: Tile mask of binding are present for this
> VMA.
> =C2=A0	 * protected by vm->lock, vm->resv and for userptrs,
> =C2=A0	 * vm->userptr.notifier_lock for writing. Needs either for
> reading,
> =C2=A0	 * but if reading is done under the vm->lock only, it needs
> to be held

Otherwise RB holds.
/Thomas

