Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE606D74EC5
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 13:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD3710E27E;
	Fri, 23 Jan 2026 13:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKgh4rKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F6910EAF3
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769173625; x=1800709625;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=w+Qs/7dLqDZrNY67h8MloRVr03xH0dZoCaWcz8TG75c=;
 b=EKgh4rKWvpzcfta6hs3CHUvhafsZJ9m6/8XjhJGluqM+vLekvG8nm5Y+
 qK9hdE7EAffMCnzFwERoCaQuiH+0s6L5qzD4eqQXWK9qmpq3Ogo91Usu2
 6tIznd4HOs0XAbL8U9PRisaI5Gm/+WB7f7P1I1dLoEa4JXBS/+mgh0s13
 vnAXM7IjN7XHLSdhQ9DbeN1on4ghFCeH8gW+i7I4jSlfvte8W3z+J2Fh+
 kgKOTGaZsG6VUg6/L1kU8RVWHZi15z1a7KfkuoE+6DlMRb7kSR+Xoz2M8
 UFcBcWHs66fZH6xGX2wq1z3AdVkRlDB0M5AoN0SpuXTWPotmiU4T0CIaz Q==;
X-CSE-ConnectionGUID: piV3N3bgRzOR7raZqOqJFA==
X-CSE-MsgGUID: Pzu4p90/SYWF/JQadQbR6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70401223"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70401223"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 05:07:05 -0800
X-CSE-ConnectionGUID: UHJAQ7SsR1qrfEnqLfeXgQ==
X-CSE-MsgGUID: FPaUQd9mTqi0sJynbORzrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206283400"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.177])
 ([10.245.244.177])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 05:07:03 -0800
Message-ID: <d5511be1440bb04ccf4f16651a1fb840a3b9b245.camel@linux.intel.com>
Subject: Re: [PATCH v4 6/8] drm/xe/madvise: Implement per-VMA purgeable
 state tracking
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Arvind Yadav
 <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Fri, 23 Jan 2026 14:07:00 +0100
In-Reply-To: <aW++QuG51rGP1Ru4@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-7-arvind.yadav@intel.com>
 <aW++QuG51rGP1Ru4@lstrano-desk.jf.intel.com>
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

On Tue, 2026-01-20 at 09:41 -0800, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 11:38:52AM +0530, Arvind Yadav wrote:
> > Track purgeable state per-VMA instead of using a coarse shared
> > BO check. This prevents purging shared BOs until all VMAs across
> > all VMs are marked DONTNEED.
> >=20
> > Add xe_bo_all_vmas_dontneed() to check all VMAs before marking
> > a BO purgeable. Add xe_bo_recheck_purgeable_on_vma_unbind() to
> > handle state transitions when VMAs are destroyed - if all
> > remaining VMAs are DONTNEED the BO can become purgeable, or if
> > no VMAs remain it transitions to WILLNEED.
> >=20
> > The per-VMA purgeable_state field stores the madvise hint for
> > each mapping. Shared BOs can only be purged when all VMAs
> > unanimously indicate DONTNEED.
> >=20
> > v3:
> > =C2=A0 - This addresses Thomas Hellstr=C3=B6m's feedback: "loop over al=
l vmas
> > =C2=A0=C2=A0=C2=A0 attached to the bo and check that they all say WONTN=
EED. This
> > will
> > =C2=A0=C2=A0=C2=A0 also need a check at VMA unbinding"
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
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 15 +++++-
> > =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 84
> > +++++++++++++++++++++++++++++-
> > =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.h |=C2=A0 3 ++
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0 | 11 ++++
> > =C2=A04 files changed, 111 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index f250daae3012..9543960b5613 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -40,6 +40,7 @@
> > =C2=A0#include "xe_tile.h"
> > =C2=A0#include "xe_tlb_inval.h"
> > =C2=A0#include "xe_trace_bo.h"
> > +#include "xe_vm_madvise.h"
> > =C2=A0#include "xe_wa.h"
> > =C2=A0
> > =C2=A0static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> > @@ -1079,12 +1080,18 @@ static struct xe_vma *xe_vma_create(struct
> > xe_vm *vm,
> > =C2=A0static void xe_vma_destroy_late(struct xe_vma *vma)
> > =C2=A0{
> > =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> > +	struct xe_bo *bo =3D NULL;
> > =C2=A0
> > =C2=A0	if (vma->ufence) {
> > =C2=A0		xe_sync_ufence_put(vma->ufence);
> > =C2=A0		vma->ufence =3D NULL;
> > =C2=A0	}
> > =C2=A0
> > +	/* Get BO reference for purgeable state re-check */
> > +	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma) &&
> > +	=C2=A0=C2=A0=C2=A0 !xe_vma_is_cpu_addr_mirror(vma))
> > +		bo =3D xe_vma_bo(vma);
>=20
> I think xe_vma_bo just returns NULL if any of the above conditions
> are
> met, so I believe is ok to just blindly call xe_vma_bo as you have a
> NULL check on the BO below.
>=20
> > +
> > =C2=A0	if (xe_vma_is_userptr(vma)) {
> > =C2=A0		struct xe_userptr_vma *uvma =3D to_userptr_vma(vma);
> > =C2=A0
> > @@ -1093,7 +1100,13 @@ static void xe_vma_destroy_late(struct
> > xe_vma *vma)
> > =C2=A0	} else if (xe_vma_is_null(vma) ||
> > xe_vma_is_cpu_addr_mirror(vma)) {
> > =C2=A0		xe_vm_put(vm);
> > =C2=A0	} else {
> > -		xe_bo_put(xe_vma_bo(vma));
> > +		/* Trylock safe for async context; madvise
> > corrects failures */
> > +		if (bo && dma_resv_trylock(bo->ttm.base.resv)) {
> > +			xe_bo_recheck_purgeable_on_vma_unbind(bo);
>=20
> Also I don't think the correct place to call this.
>=20
> I believe you can call this function in xe_vma_destroy after
> drm_gpuva_unlink. You also have BO lock there too so no need from
> this
> trylock path.
>=20
> > +			dma_resv_unlock(bo->ttm.base.resv);
> > +		}
> > +
> > +		xe_bo_put(bo);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	xe_vma_free(vma);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index dfeab9e24a09..27b6ad65b314 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -12,6 +12,7 @@
> > =C2=A0#include "xe_pat.h"
> > =C2=A0#include "xe_pt.h"
> > =C2=A0#include "xe_svm.h"
> > +#include "xe_vm.h"
> > =C2=A0
> > =C2=A0struct xe_vmas_in_madvise_range {
> > =C2=A0	u64 addr;
> > @@ -179,6 +180,80 @@ static void madvise_pat_index(struct xe_device
> > *xe, struct xe_vm *vm,
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are
> > marked DONTNEED
> > + * @bo: Buffer object
> > + *
> > + * Check all VMAs across all VMs to determine if BO can be purged.
> > + * Shared BOs require unanimous DONTNEED state from all mappings.
> > + *
> > + * Caller must hold BO dma-resv lock.
> > + *
> > + * Return: true if all VMAs are DONTNEED, false otherwise
> > + */
> > +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> > +{
> > +	struct drm_gpuvm_bo *vm_bo;
> > +	struct drm_gpuva *gpuva;
> > +	struct drm_gem_object *obj =3D &bo->ttm.base;
> > +	bool has_vmas =3D false;
> > +
> > +	dma_resv_assert_held(bo->ttm.base.resv);
> > +
> > +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > +			struct xe_vma *vma =3D gpuva_to_vma(gpuva);
> > +
> > +			has_vmas =3D true;
> > +
> > +			/* Any non-DONTNEED VMA prevents purging
> > */
> > +			if (READ_ONCE(vma->purgeable_state) !=3D
> > XE_MADV_PURGEABLE_DONTNEED)
>=20
> You don't need the READ_ONCE as purgeable_state is only accessed
> under
> the dma-resv lock, also there isn't a WRITE_ONCE anywhere.
>=20
> > +				return false;
> > +		}
> > +	}
> > +
> > +	/* No VMAs means not purgeable */
>=20
> No VMAs means it is purgeable, right?

Then it would be purgeable just after creation, even if CPU is
accessing. However I think we should consider the case where a bo is
purgeable and it's single VMA goes away. Then I'd say it's still
purgeable.

I guess this is our last chance to, after discussing for years,
revert to a bo madvise UAPI before the UAPI is set in stone, given the
above corner-cases. I must admit I'm not 100% sure myself, given CPU
madvises are always based on the virtual address map, and we try to
mimic that as much as possible.=20

>=20
> > +	if (!has_vmas)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +/**
> > + * xe_bo_recheck_purgeable_on_vma_unbind() - Re-evaluate BO
> > purgeable state after VMA unbind
> > + * @bo: Buffer object
> > + *
> > + * When a VMA is unbound, re-check if the BO's purgeable state
> > should change.
> > + * Destroyed VMAs may allow the BO to become purgeable if all
> > remaining VMAs
> > + * are DONTNEED, or require transition to WILLNEED if no VMAs
> > remain.
> > + *
> > + * Called from VMA destruction path with BO dma-resv lock held.
> > + */
> > +void xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo)
> > +{
> > +	if (!bo)
> > +		return;
> > +
> > +	dma_resv_assert_held(bo->ttm.base.resv);
> > +
> > +	/*
> > +	 * Once purged, always purged. Cannot transition back to
> > WILLNEED.
> > +	 * This matches i915 semantics where purged BOs are
> > permanently invalid.
> > +	 */
> > +	if (bo->madv_purgeable =3D=3D XE_MADV_PURGEABLE_PURGED)
> > +		return;

	Perhaps replace the below with

	bo->madv_purgeable =3D xe_bo_all_vmas_dontneed(bo) ?
		XE_MADV_PURGEABLE_DONTNEED : 		XE_MADV_PURGEABLE_WILLNEED;=20
> > +
> > +	if (xe_bo_all_vmas_dontneed(bo)) {
> > +		/* All VMAs are DONTNEED - mark BO purgeable */
> > +		if (bo->madv_purgeable !=3D
> > XE_MADV_PURGEABLE_DONTNEED)
> > +			bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_DONTNEED;
> > +	} else {
> > +		/* At least one VMA is WILLNEED - BO must not be
> > purgeable */
> > +		if (bo->madv_purgeable !=3D
> > XE_MADV_PURGEABLE_WILLNEED)
> > +			bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_WILLNEED;
> > +	}
> > +}
> > +
> > =C2=A0/*
> > =C2=A0 * Handle purgeable buffer object advice for
> > DONTNEED/WILLNEED/PURGED.
> > =C2=A0 * Returns true if any BO was purged, false otherwise.
> > @@ -213,10 +288,17 @@ static bool xe_vm_madvise_purgeable_bo(struct
> > xe_device *xe, struct xe_vm *vm,
> > =C2=A0
> > =C2=A0		switch (op->purge_state_val.val) {
> > =C2=A0		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> > +			vmas[i]->purgeable_state =3D
> > XE_MADV_PURGEABLE_WILLNEED;
> > +
> > +			/* Mark VMA WILLNEED - BO becomes non-
> > purgeable immediately */
> > =C2=A0			bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_WILLNEED;
> > =C2=A0			break;
> > =C2=A0		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> > -			bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_DONTNEED;
> > +			vmas[i]->purgeable_state =3D
> > XE_MADV_PURGEABLE_DONTNEED;
> > +
> > +			/* Mark BO purgeable only if all VMAs are
> > DONTNEED */
> > +			if (xe_bo_all_vmas_dontneed(bo))
> > +				bo->madv_purgeable =3D
> > XE_MADV_PURGEABLE_DONTNEED;
> > =C2=A0			break;
> > =C2=A0		default:
> > =C2=A0			drm_warn(&vm->xe->drm, "Invalid madvice
> > value =3D %d\n",

This is part of the IOCTL processing, right? Then we should use
XE_IOCTL_DBG() on invalid values, or xe_assert() if input values are
already checked elsewhere.


> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > index b0e1fc445f23..61868f851949 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > @@ -8,8 +8,11 @@
> > =C2=A0
> > =C2=A0struct drm_device;
> > =C2=A0struct drm_file;
> > +struct xe_bo;
> > =C2=A0
> > =C2=A0int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> > =C2=A0			struct drm_file *file);
> > =C2=A0
> > +void xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo);
> > +
> > =C2=A0#endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 437f64202f3b..94ca9d033b06 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -150,6 +150,17 @@ struct xe_vma {
> > =C2=A0	 */
> > =C2=A0	bool skip_invalidation;
> > =C2=A0
> > +	/**
> > +	 * @purgeable_state: Purgeable hint for this VMA mapping
> > +	 *
> > +	 * Per-VMA purgeable state from madvise. Valid states are
> > WILLNEED (0)
> > +	 * or DONTNEED (1). Shared BOs require all VMAs to be
> > DONTNEED before
> > +	 * the BO can be purged. PURGED state exists only at BO
> > level.
> > +	 *
> > +	 * Protected by BO dma-resv lock. Set via
> > DRM_IOCTL_XE_MADVISE.
> > +	 */
> > +	u32 purgeable_state;
> > +
>=20
> I think xe_vma_mem_attr is a better place for this field.

+1.

/Thomas


>=20
> Matt
>=20
> > =C2=A0	/**
> > =C2=A0	 * @ufence: The user fence that was provided with MAP.
> > =C2=A0	 * Needs to be signalled before UNMAP can be processed.
> > --=20
> > 2.43.0
> >=20
