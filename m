Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D42E9B261
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 12:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E049810E571;
	Tue, 24 Feb 2026 12:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqZsjIPv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B3D10E571
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771937324; x=1803473324;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NgJc/6cQPaoF/2WYwhlH4gwdkrYONVHLeTLOLJyWv6s=;
 b=XqZsjIPvOnpacyaGzoyw+UCZ8H9KXOIPgCmjufICnn8NFK9JyfxgLB8n
 A0OEeo7nOnUgA+5/DoPpfYVfPAssyNFaUvOM3OUOHaqEusYH2LaDIjOej
 qPRiMnL94jttbtCXmILhj4ockMsabBf52NpviXA31MwEjI4IiEhChCpA+
 SLxVrV/SVWbGd9SS1xmf41LGQc8KBD9dmir4BgCB4F0JQsmbcXUXOcVcq
 2LXIE8yzokN5H7z09y7+8/jAOdDyvfVCuXnKa112TE0RZujtPPYqRKJwa
 VgYuYdz/e4WlSKVs346gJsfXtetSc4laWMWQDzgO6pcIAjfwoCGFoIJng Q==;
X-CSE-ConnectionGUID: TvfS73x6Tz+FmLbBI3JPPA==
X-CSE-MsgGUID: e31H5DPbSlq39WI59nMQMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72652892"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72652892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:48:44 -0800
X-CSE-ConnectionGUID: RayMhe/VT6S3vHqRcyyLNw==
X-CSE-MsgGUID: WPqBpE2+R8WSfTHO/4LUmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220411402"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.148])
 ([10.245.244.148])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:48:42 -0800
Message-ID: <823a16af4733d5b82470b6ed6da203de09644caa.camel@linux.intel.com>
Subject: Re: [PATCH v5 6/9] drm/xe/madvise: Implement per-VMA purgeable
 state tracking
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Tue, 24 Feb 2026 13:48:40 +0100
In-Reply-To: <20260211152644.1661165-7-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-7-arvind.yadav@intel.com>
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

On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
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
> One thing to note: when the last VMA goes away, we default back to
> WILLNEED. DONTNEED is a per-mapping hint, and without any mappings
> there is no remaining madvise state to justify purging. This prevents
> BOs from becoming purgeable solely due to being temporarily unmapped.
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
> =C2=A0 - use xe_assert instead of drm_war (Thomas)

Typo.=20

There were also a couple of review issues in my reply here:

https://patchwork.freedesktop.org/patch/699451/?series=3D156651&rev=3D5

that were never addressed or at least commented upon.

The comment there on retaining purgeable state after the last vma is
unmapped could be discussed, though.

Let's say we unmap a vma marking a bo purgeable. It then becomes either
purged or non-purgeable.=C2=A0

Then an app tries to access it either using a new vma or CPU map. Then
it will typically succeed, or might occasionally fail if the bo
happened to be purged in between.

How do we handle new vma map requests and cpu-faults to a bo in
purgeable state? Do we block those?

Thanks,
Thomas



>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 9 ++-
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 98
> ++++++++++++++++++++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.h |=C2=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0 | 11 ++++
> =C2=A05 files changed, 116 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index cda3bf7e2418..329c77aa5c20 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -318,6 +318,7 @@ static void xe_vma_set_default_attributes(struct
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
> index 71cf3ce6c62b..e84b9e7cb5eb 100644
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
> @@ -2681,6 +2685,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
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
> index d9cfba7bfe0b..c184426546a2 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -12,6 +12,7 @@
> =C2=A0#include "xe_pat.h"
> =C2=A0#include "xe_pt.h"
> =C2=A0#include "xe_svm.h"
> +#include "xe_vm.h"
> =C2=A0
> =C2=A0struct xe_vmas_in_madvise_range {
> =C2=A0	u64 addr;
> @@ -183,6 +184,89 @@ static void madvise_pat_index(struct xe_device
> *xe, struct xe_vm *vm,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/**
> + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked
> DONTNEED
> + * @bo: Buffer object
> + *
> + * Check all VMAs across all VMs to determine if BO can be purged.
> + * Shared BOs require unanimous DONTNEED state from all mappings.
> + *
> + * Caller must hold BO dma-resv lock.
> + *
> + * Return: true if all VMAs are DONTNEED, false otherwise
> + */
> +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
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
> +				return false;
> +		}
> +	}
> +
> +	/*
> +	 * No VMAs =3D> no mapping-level DONTNEED hint.
> +	 * Default to WILLNEED to avoid making BOs purgeable without
> +	 * explicit user intent.
> +	 */
> +	if (!has_vmas)
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state
> from VMAs
> + * @bo: Buffer object
> + *
> + * Walk all VMAs to determine if BO should be purgeable or not.
> + * Shared BOs require unanimous DONTNEED state from all mappings.
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
> +	if (xe_bo_all_vmas_dontneed(bo)) {
> +		/* All VMAs are DONTNEED - mark BO purgeable */
> +		if (bo->madv_purgeable !=3D
> XE_MADV_PURGEABLE_DONTNEED)
> +			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_DONTNEED);
> +	} else {
> +		/* At least one VMA is WILLNEED - BO must not be
> purgeable */
> +		if (bo->madv_purgeable !=3D
> XE_MADV_PURGEABLE_WILLNEED)
> +			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_WILLNEED);
> +	}
> +}
> +
> =C2=A0/**
> =C2=A0 * madvise_purgeable - Handle purgeable buffer object advice
> =C2=A0 * @xe: XE device
> @@ -231,14 +315,20 @@ static void __maybe_unused
> madvise_purgeable(struct xe_device *xe,
> =C2=A0
> =C2=A0		switch (op->purge_state_val.val) {
> =C2=A0		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> -			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_WILLNEED);
> +			vmas[i]->attr.purgeable_state =3D
> XE_MADV_PURGEABLE_WILLNEED;
> +
> +			/* Update BO purgeable state */
> +			xe_bo_recompute_purgeable_state(bo);
> =C2=A0			break;
> =C2=A0		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> -			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_DONTNEED);
> +			vmas[i]->attr.purgeable_state =3D
> XE_MADV_PURGEABLE_DONTNEED;
> +
> +			/* Update BO purgeable state */
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
> index 43203e90ee3e..fd563039e8f4 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -94,6 +94,17 @@ struct xe_vma_mem_attr {
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
