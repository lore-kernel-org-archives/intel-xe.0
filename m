Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B82EE9A77B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 12:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1AE10E5DC;
	Tue, 24 Mar 2026 12:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i11aptSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E4910E5DC
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774355120; x=1805891120;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YOJRWLAKl23ctOf713RoDCJsLFFhxDkes0bGp60RINw=;
 b=i11aptStWWv+mFRCktQtacm3vwDjoVz2WW3tRE1/gVXMkJ7f7zBWXTET
 +1+GxprY4rjH93NIEGhtMR9RSul4tUuY4/Tb4Ay8XBg7z69/aa6jAjMm3
 O4EOoWSqbUikkEnvSieexqWNBS1Cma+65eM16pbBBpgsPwCu/4i1d6knv
 IxX1XZC2D+iCFHbD1ugbO0RA8Rh4YfB9RJr/nVyWu9Ch+JP2BLDHnLTm7
 JBO8rhqfmDvvR8xTG3ipznPFsq0ErxcUKP4o9xiHYRHPCpAe4gNYEPHR1
 4vBCyFyQ24gYgvBpFs8Bx64pJ3P5pc74lnWDeVpEyqCE6toLm28k/hot5 A==;
X-CSE-ConnectionGUID: AaB2UBu4QMmGO9KRAiqqSA==
X-CSE-MsgGUID: /sG+QRiSQSuZq2ia2by3pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86442902"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86442902"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 05:25:19 -0700
X-CSE-ConnectionGUID: /vxpwvXcQdGIoK97Wu/sWQ==
X-CSE-MsgGUID: t/+wlENGTAWG0ACWFkcgYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="224338648"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.208])
 ([10.245.244.208])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 05:25:19 -0700
Message-ID: <4bdc81beca35e7d70f61ff0212220d30f7dbafc5.camel@linux.intel.com>
Subject: Re: [PATCH v7 06/12] drm/xe/madvise: Implement per-VMA purgeable
 state tracking
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
Date: Tue, 24 Mar 2026 13:25:16 +0100
In-Reply-To: <20260323093106.2986900-7-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-7-arvind.yadav@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Mon, 2026-03-23 at 15:00 +0530, Arvind Yadav wrote:
> Track purgeable state per-VMA instead of using a coarse shared
> BO check. This prevents purging shared BOs until all VMAs across
> all VMs are marked DONTNEED.
>=20
> Add xe_bo_all_vmas_dontneed() to check all VMAs before marking
> a BO purgeable. Add xe_bo_recheck_purgeable_on_vma_unbind() to
> handle state transitions when VMAs are destroyed - if all
> remaining VMAs are DONTNEED the BO can become purgeable, or if
> no VMAs remain it transitions to WILLNEED.
>=20
> The per-VMA purgeable_state field stores the madvise hint for
> each mapping. Shared BOs can only be purged when all VMAs
> unanimously indicate DONTNEED.
>=20
> This prevents the bug where unmapping the last VMA would incorrectly
> flip
> a DONTNEED BO back to WILLNEED. The enum-based state check preserves
> BO
> state when no VMAs remain, only updating when VMAs provide explicit
> hints.
>=20
> v3:
> =C2=A0 - This addresses Thomas Hellstr=C3=B6m's feedback: "loop over all =
vmas
> =C2=A0=C2=A0=C2=A0 attached to the bo and check that they all say WONTNEE=
D. This
> will
> =C2=A0=C2=A0=C2=A0 also need a check at VMA unbinding"
>=20
> v4:
> =C2=A0 - @madv_purgeable atomic_t =E2=86=92 u32 change across all relevan=
t
> =C2=A0=C2=A0=C2=A0 patches (Matt)
>=20
> v5:
> =C2=A0 - Call xe_bo_recheck_purgeable_on_vma_unbind() from
> xe_vma_destroy()
> =C2=A0=C2=A0=C2=A0 right after drm_gpuva_unlink() where we already hold t=
he BO lock,
> =C2=A0=C2=A0=C2=A0 drop the trylock-based late destroy path (Matt)
> =C2=A0 - Move purgeable_state into xe_vma_mem_attr with the other madvise
> =C2=A0=C2=A0=C2=A0 attributes (Matt)
> =C2=A0 - Drop READ_ONCE since the BO lock already protects us (Matt)
> =C2=A0 - Keep returning false when there are no VMAs - otherwise we'd mar=
k
> =C2=A0=C2=A0=C2=A0 BOs purgeable without any user hint (Matt)
> =C2=A0 - Use xe_bo_set_purgeable_state() instead of direct
> initialization(Matt)
> =C2=A0 - use xe_assert instead of drm_warn (Thomas)
>=20
> v6:
> =C2=A0 - Fix state transition bug: don't flip DONTNEED =E2=86=92 WILLNEED=
 when
> last
> =C2=A0=C2=A0=C2=A0 VMA unmapped (Matt)
> =C2=A0 - Change xe_bo_all_vmas_dontneed() from bool to enum to distinguis=
h
> =C2=A0=C2=A0=C2=A0 "no VMAs" from "has WILLNEED VMA" (Matt)
> =C2=A0 - Preserve BO state on NO_VMAS instead of forcing WILLNEED.
> =C2=A0 - Set skip_invalidation explicitly in madvise_purgeable() to ensur=
e
> =C2=A0=C2=A0=C2=A0 DONTNEED always zaps GPU PTEs regardless of prior madv=
ise state.
>=20
> v7:
> =C2=A0 - Don't zap PTEs at DONTNEED time -- pages are still alive.
> =C2=A0=C2=A0=C2=A0 The zap happens in xe_bo_move_notify() right before th=
e shrinker
> =C2=A0=C2=A0=C2=A0 frees them.
> =C2=A0 - Simplify xe_bo_recompute_purgeable_state() by relying on the
> =C2=A0=C2=A0=C2=A0 intentional value alignment between xe_bo_vmas_purge_s=
tate and
> =C2=A0=C2=A0=C2=A0 xe_madv_purgeable_state enums. Add static_assert to en=
force the
> =C2=A0=C2=A0=C2=A0 alignment. (Thomas)
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 136
> +++++++++++++++++++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.h |=C2=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0 |=C2=A0 11 +++
> =C2=A05 files changed, 153 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index a91c84487a67..062ef77e283f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -322,6 +322,7 @@ static void xe_vma_set_default_attributes(struct
> xe_vma *vma)
> =C2=A0		.preferred_loc.migration_policy =3D
> DRM_XE_MIGRATE_ALL_PAGES,
> =C2=A0		.pat_index =3D vma->attr.default_pat_index,
> =C2=A0		.atomic_access =3D DRM_XE_ATOMIC_UNDEFINED,
> +		.purgeable_state =3D XE_MADV_PURGEABLE_WILLNEED,
> =C2=A0	};
> =C2=A0
> =C2=A0	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9c1a82b64a43..07393540f34c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -39,6 +39,7 @@
> =C2=A0#include "xe_tile.h"
> =C2=A0#include "xe_tlb_inval.h"
> =C2=A0#include "xe_trace_bo.h"
> +#include "xe_vm_madvise.h"
> =C2=A0#include "xe_wa.h"
> =C2=A0
> =C2=A0static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> @@ -1085,6 +1086,7 @@ static struct xe_vma *xe_vma_create(struct
> xe_vm *vm,
> =C2=A0static void xe_vma_destroy_late(struct xe_vma *vma)
> =C2=A0{
> =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> +	struct xe_bo *bo =3D xe_vma_bo(vma);
> =C2=A0
> =C2=A0	if (vma->ufence) {
> =C2=A0		xe_sync_ufence_put(vma->ufence);
> @@ -1099,7 +1101,7 @@ static void xe_vma_destroy_late(struct xe_vma
> *vma)
> =C2=A0	} else if (xe_vma_is_null(vma) ||
> xe_vma_is_cpu_addr_mirror(vma)) {
> =C2=A0		xe_vm_put(vm);
> =C2=A0	} else {
> -		xe_bo_put(xe_vma_bo(vma));
> +		xe_bo_put(bo);
> =C2=A0	}
> =C2=A0
> =C2=A0	xe_vma_free(vma);
> @@ -1125,6 +1127,7 @@ static void vma_destroy_cb(struct dma_fence
> *fence,
> =C2=A0static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence
> *fence)
> =C2=A0{
> =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> +	struct xe_bo *bo =3D xe_vma_bo(vma);
> =C2=A0
> =C2=A0	lockdep_assert_held_write(&vm->lock);
> =C2=A0	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
> @@ -1133,9 +1136,10 @@ static void xe_vma_destroy(struct xe_vma *vma,
> struct dma_fence *fence)
> =C2=A0		xe_assert(vm->xe, vma->gpuva.flags &
> XE_VMA_DESTROYED);
> =C2=A0		xe_userptr_destroy(to_userptr_vma(vma));
> =C2=A0	} else if (!xe_vma_is_null(vma) &&
> !xe_vma_is_cpu_addr_mirror(vma)) {
> -		xe_bo_assert_held(xe_vma_bo(vma));
> +		xe_bo_assert_held(bo);
> =C2=A0
> =C2=A0		drm_gpuva_unlink(&vma->gpuva);
> +		xe_bo_recompute_purgeable_state(bo);
> =C2=A0	}
> =C2=A0
> =C2=A0	xe_vm_assert_held(vm);
> @@ -2692,6 +2696,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct drm_gpuva_ops *ops,
> =C2=A0				.atomic_access =3D
> DRM_XE_ATOMIC_UNDEFINED,
> =C2=A0				.default_pat_index =3D op-
> >map.pat_index,
> =C2=A0				.pat_index =3D op->map.pat_index,
> +				.purgeable_state =3D
> XE_MADV_PURGEABLE_WILLNEED,
> =C2=A0			};
> =C2=A0
> =C2=A0			flags |=3D op->map.vma_flags &
> XE_VMA_CREATE_MASK;
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index ffba2e41c539..ed1940da7739 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -13,6 +13,7 @@
> =C2=A0#include "xe_pt.h"
> =C2=A0#include "xe_svm.h"
> =C2=A0#include "xe_tlb_inval.h"
> +#include "xe_vm.h"
> =C2=A0
> =C2=A0struct xe_vmas_in_madvise_range {
> =C2=A0	u64 addr;
> @@ -184,6 +185,116 @@ static void madvise_pat_index(struct xe_device
> *xe, struct xe_vm *vm,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/**
> + * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
> + *
> + * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
> + * one WILLNEED, or have no VMAs at all.
> + *
> + * Enum values align with XE_MADV_PURGEABLE_* states for
> consistency.
> + */
> +enum xe_bo_vmas_purge_state {
> +	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED
> */
> +	XE_BO_VMAS_STATE_WILLNEED =3D 0,
> +	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
> +	XE_BO_VMAS_STATE_DONTNEED =3D 1,
> +	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
> +	XE_BO_VMAS_STATE_NO_VMAS =3D 2,
> +};
> +
> +/*
> + * xe_bo_recompute_purgeable_state() casts between
> xe_bo_vmas_purge_state and
> + * xe_madv_purgeable_state. Enforce that WILLNEED=3D0 and DONTNEED=3D1
> match across
> + * both enums so the single-line cast is always valid.
> + */
> +static_assert(XE_BO_VMAS_STATE_WILLNEED =3D=3D
> (int)XE_MADV_PURGEABLE_WILLNEED,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "VMA purge state WILLNEED must equal mad=
v purgeable
> WILLNEED");
> +static_assert(XE_BO_VMAS_STATE_DONTNEED =3D=3D
> (int)XE_MADV_PURGEABLE_DONTNEED,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "VMA purge state DONTNEED must equal mad=
v purgeable
> DONTNEED");
> +
> +/**
> + * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
> + * @bo: Buffer object
> + *
> + * Check all VMAs across all VMs to determine aggregate purgeable
> state.
> + * Shared BOs require unanimous DONTNEED state from all mappings.
> + *
> + * Caller must hold BO dma-resv lock.
> + *
> + * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_VMAS_STATE_WILL=
NEED if at least one VMA is not
> DONTNEED,
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_VMAS_STATE_NO_V=
MAS if BO has no VMAs
> + */
> +static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct
> xe_bo *bo)
> +{
> +	struct drm_gpuvm_bo *vm_bo;
> +	struct drm_gpuva *gpuva;
> +	struct drm_gem_object *obj =3D &bo->ttm.base;
> +	bool has_vmas =3D false;
> +
> +	xe_bo_assert_held(bo);
> +
> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> +			struct xe_vma *vma =3D gpuva_to_vma(gpuva);
> +
> +			has_vmas =3D true;
> +
> +			/* Any non-DONTNEED VMA prevents purging */
> +			if (vma->attr.purgeable_state !=3D
> XE_MADV_PURGEABLE_DONTNEED)
> +				return XE_BO_VMAS_STATE_WILLNEED;
> +		}
> +	}
> +
> +	/*
> +	 * No VMAs =3D> preserve existing BO purgeable state.
> +	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when
> last VMA unmapped.
> +	 */
> +	if (!has_vmas)
> +		return XE_BO_VMAS_STATE_NO_VMAS;
> +
> +	return XE_BO_VMAS_STATE_DONTNEED;
> +}
> +
> +/**
> + * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state
> from VMAs
> + * @bo: Buffer object
> + *
> + * Walk all VMAs to determine if BO should be purgeable or not.
> + * Shared BOs require unanimous DONTNEED state from all mappings.
> + * If the BO has no VMAs the existing state is preserved.
> + *
> + * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM
> lists,
> + * VM lock must also be held (write) to prevent concurrent VMA
> modifications.
> + * This is satisfied at both call sites:
> + * - xe_vma_destroy(): holds vm->lock write
> + * - madvise_purgeable(): holds vm->lock write (from madvise ioctl
> path)
> + *
> + * Return: nothing
> + */
> +void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> +{
> +	enum xe_bo_vmas_purge_state vma_state;
> +
> +	if (!bo)
> +		return;
> +
> +	xe_bo_assert_held(bo);
> +
> +	/*
> +	 * Once purged, always purged. Cannot transition back to
> WILLNEED.
> +	 * This matches i915 semantics where purged BOs are
> permanently invalid.
> +	 */
> +	if (bo->madv_purgeable =3D=3D XE_MADV_PURGEABLE_PURGED)
> +		return;
> +
> +	vma_state =3D xe_bo_all_vmas_dontneed(bo);
> +
> +	if (vma_state !=3D (enum xe_bo_vmas_purge_state)bo-
> >madv_purgeable &&
> +	=C2=A0=C2=A0=C2=A0 vma_state !=3D XE_BO_VMAS_STATE_NO_VMAS)
> +		xe_bo_set_purgeable_state(bo, (enum
> xe_madv_purgeable_state)vma_state);
> +}
> +
> =C2=A0/**
> =C2=A0 * madvise_purgeable - Handle purgeable buffer object advice
> =C2=A0 * @xe: XE device
> @@ -215,8 +326,11 @@ static void __maybe_unused
> madvise_purgeable(struct xe_device *xe,
> =C2=A0	for (i =3D 0; i < num_vmas; i++) {
> =C2=A0		struct xe_bo *bo =3D xe_vma_bo(vmas[i]);
> =C2=A0
> -		if (!bo)
> +		if (!bo) {
> +			/* Purgeable state applies to BOs only, skip
> non-BO VMAs */
> +			vmas[i]->skip_invalidation =3D true;
> =C2=A0			continue;
> +		}
> =C2=A0
> =C2=A0		/* BO must be locked before modifying madv state */
> =C2=A0		xe_bo_assert_held(bo);
> @@ -227,19 +341,31 @@ static void __maybe_unused
> madvise_purgeable(struct xe_device *xe,
> =C2=A0		 */
> =C2=A0		if (xe_bo_is_purged(bo)) {
> =C2=A0			details->has_purged_bo =3D true;
> +			vmas[i]->skip_invalidation =3D true;
> =C2=A0			continue;
> =C2=A0		}
> =C2=A0
> =C2=A0		switch (op->purge_state_val.val) {
> =C2=A0		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> -			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_WILLNEED);
> +			vmas[i]->attr.purgeable_state =3D
> XE_MADV_PURGEABLE_WILLNEED;
> +			vmas[i]->skip_invalidation =3D true;
> +
> +			xe_bo_recompute_purgeable_state(bo);
> =C2=A0			break;
> =C2=A0		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> -			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_DONTNEED);
> +			vmas[i]->attr.purgeable_state =3D
> XE_MADV_PURGEABLE_DONTNEED;
> +			/*
> +			 * Don't zap PTEs at DONTNEED time -- pages
> are still
> +			 * alive. The zap happens in
> xe_bo_move_notify() right
> +			 * before the shrinker frees them.
> +			 */
> +			vmas[i]->skip_invalidation =3D true;
> +
> +			xe_bo_recompute_purgeable_state(bo);
> =C2=A0			break;
> =C2=A0		default:
> -			drm_warn(&vm->xe->drm, "Invalid madvice
> value =3D %d\n",
> -				 op->purge_state_val.val);
> +			/* Should never hit - values validated in
> madvise_args_are_sane() */
> +			xe_assert(vm->xe, 0);
> =C2=A0			return;
> =C2=A0		}
> =C2=A0	}
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
> b/drivers/gpu/drm/xe/xe_vm_madvise.h
> index b0e1fc445f23..39acd2689ca0 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -8,8 +8,11 @@
> =C2=A0
> =C2=A0struct drm_device;
> =C2=A0struct drm_file;
> +struct xe_bo;
> =C2=A0
> =C2=A0int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> =C2=A0			struct drm_file *file);
> =C2=A0
> +void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 69e80c94138a..033cfdd56c95 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -95,6 +95,17 @@ struct xe_vma_mem_attr {
> =C2=A0	 * same as default_pat_index unless overwritten by madvise.
> =C2=A0	 */
> =C2=A0	u16 pat_index;
> +
> +	/**
> +	 * @purgeable_state: Purgeable hint for this VMA mapping
> +	 *
> +	 * Per-VMA purgeable state from madvise. Valid states are
> WILLNEED (0)
> +	 * or DONTNEED (1). Shared BOs require all VMAs to be
> DONTNEED before
> +	 * the BO can be purged. PURGED state exists only at BO
> level.
> +	 *
> +	 * Protected by BO dma-resv lock. Set via
> DRM_IOCTL_XE_MADVISE.
> +	 */
> +	u32 purgeable_state;
> =C2=A0};
> =C2=A0
> =C2=A0struct xe_vma {
