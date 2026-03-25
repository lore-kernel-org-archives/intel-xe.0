Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BC8109C02F
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 15:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFBD10E7F9;
	Wed, 25 Mar 2026 15:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMogjPmR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA9C10E7BC
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774450886; x=1805986886;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H+E0yfcNewOHpkIcLfHbPg+w2rN66fsR3WHynit9LVo=;
 b=VMogjPmRsRnN0Nd3UczGK3YxgfmK8roFJ9odyfxXpR/Sm/hjQgpOcvtQ
 P5jXZcIw2Vb4AV1UpuFnng6Kowk87IPMUDIbKJmX5FUCMvmKkYyo8vJi6
 eSFGFahM9pXnVSTpGcJQ6nipriuAHWra8hlfiwH0OWu+zFqoDw9msg4SG
 4PaJvOLzAU3NCOCZZrKb4t8td4fGQja2B0PNCfoTWBmzkjr3iPokmInYi
 JxFOqjdrVnXFwNgIa1ba9Mzmpz9TSBXciq1oL6CAexU7s4Ke/O0kshWsj
 zHQKV9NyEXKlgSM9RxEwfhPm/DcOFY59kqcnCh3vVoeJVgmFURRpn0JwF g==;
X-CSE-ConnectionGUID: Unk1U8pQT3u8s/FsX2SleA==
X-CSE-MsgGUID: 4m93bckKQfC6KMS0wSjkYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75395647"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75395647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:01:26 -0700
X-CSE-ConnectionGUID: FR94fBiAQmqm1Kzal4BfyA==
X-CSE-MsgGUID: LRVlbk34ShKf0pVhKwlG5A==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.110])
 ([10.245.245.110])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:01:24 -0700
Message-ID: <883c4c33284cde728a7a558890e5501781581e33.camel@linux.intel.com>
Subject: Re: [PATCH v7 03/12] drm/xe/madvise: Implement purgeable buffer
 object support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
Date: Wed, 25 Mar 2026 16:01:22 +0100
In-Reply-To: <20260323093106.2986900-4-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-4-arvind.yadav@intel.com>
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
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
>=20
> Add the core implementation for purgeable buffer objects, enabling
> memory
> reclamation of user-designated DONTNEED buffers during eviction.
>=20
> This patch implements the purge operation and state machine
> transitions:
>=20
> Purgeable States (from xe_madv_purgeable_state):
> =C2=A0- WILLNEED (0): BO should be retained, actively used
> =C2=A0- DONTNEED (1): BO eligible for purging, not currently needed
> =C2=A0- PURGED (2): BO backing store reclaimed, permanently invalid
>=20
> Design Rationale:
> =C2=A0 - Async TLB invalidation via trigger_rebind (no blocking
> xe_vm_invalidate_vma)
> =C2=A0 - i915 compatibility: retained field, "once purged always purged"
> semantics
> =C2=A0 - Shared BO protection prevents multi-process memory corruption
> =C2=A0 - Scratch PTE reuse avoids new infrastructure, safe for fault mode
>=20
> Note: The madvise_purgeable() function is implemented but not hooked
> into
> the IOCTL handler (madvise_funcs[] entry is NULL) to maintain
> bisectability.
> The feature will be enabled in the final patch when all supporting
> infrastructure (shrinker, per-VMA tracking) is complete.
>=20
> v2:
> =C2=A0 - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas
> Hellstr=C3=B6m)
> =C2=A0 - Add NULL rebind with scratch PTEs for fault mode (Thomas
> Hellstr=C3=B6m)
> =C2=A0 - Implement i915-compatible retained field logic (Thomas Hellstr=
=C3=B6m)
> =C2=A0 - Skip BO validation for purged BOs in page fault handler (crash
> fix)
> =C2=A0 - Add scratch VM check in page fault path (non-scratch VMs fail
> fault)
> =C2=A0 - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping
> (review fix)
> =C2=A0 - Add !is_purged check to resource cursor setup to prevent stale
> access
>=20
> v3:
> =C2=A0 - Rebase as xe_gt_pagefault.c is gone upstream and replaced
> =C2=A0=C2=A0=C2=A0 with xe_pagefault.c (Matthew Brost)
> =C2=A0 - Xe specific warn on (Matthew Brost)
> =C2=A0 - Call helpers for madv_purgeable access(Matthew Brost)
> =C2=A0 - Remove bo NULL check(Matthew Brost)
> =C2=A0 - Use xe_bo_assert_held instead of dma assert(Matthew Brost)
> =C2=A0 - Move the xe_bo_is_purged check under the dma-resv lock( by Matt)
> =C2=A0 - Drop is_purged from xe_pt_stage_bind_entry and just set is_null
> to true
> =C2=A0=C2=A0=C2=A0 for purged BO rename s/is_null/is_null_or_purged (by M=
att)
> =C2=A0 - UAPI rule should not be changed.(Matthew Brost)
> =C2=A0 - Make 'retained' a userptr (Matthew Brost)
>=20
> v4:
> =C2=A0 - @madv_purgeable atomic_t =E2=86=92 u32 change across all relevan=
t patches
> (Matt)
>=20
> v5:
> =C2=A0 - Introduce xe_bo_set_purgeable_state() helper (void return) to
> centralize
> =C2=A0=C2=A0=C2=A0 madv_purgeable updates with xe_bo_assert_held() and st=
ate
> transition
> =C2=A0=C2=A0=C2=A0 validation using explicit enum checks (no transition o=
ut of
> PURGED) (Matt)
> =C2=A0 - Make xe_ttm_bo_purge() return int and propagate failures from
> =C2=A0=C2=A0=C2=A0 xe_bo_move(); handle xe_bo_trigger_rebind() failures (=
e.g.
> no_wait_gpu
> =C2=A0=C2=A0=C2=A0 paths) rather than silently ignoring (Matt)
> =C2=A0 - Replace drm_WARN_ON with xe_assert for better Xe-specific
> assertions (Matt)
> =C2=A0 - Hook purgeable handling into
> madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE]
> =C2=A0=C2=A0=C2=A0 instead of special-case path in xe_vm_madvise_ioctl() =
(Matt)
> =C2=A0 - Track purgeable retained return via xe_madvise_details and
> perform
> =C2=A0=C2=A0=C2=A0 copy_to_user() from xe_madvise_details_fini() after lo=
cks are
> dropped (Matt)
> =C2=A0 - Set madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE] to NULL with
> =C2=A0=C2=A0=C2=A0 __maybe_unused on madvise_purgeable() to maintain bise=
ctability
> until
> =C2=A0=C2=A0=C2=A0 shrinker integration is complete in final patch (Matt)
> =C2=A0 - Use put_user() instead of copy_to_user() for single u32 retained
> value (Thomas)
> =C2=A0 - Return -EFAULT from ioctl if put_user() fails (Thomas)
> =C2=A0 - Validate userspace initialized retained to 0 before ioctl,
> ensuring safe
> =C2=A0=C2=A0=C2=A0 default (0 =3D "assume purged") if put_user() fails (T=
homas)
> =C2=A0 - Refactor error handling: separate fallible put_user from
> infallible cleanup
> =C2=A0 - xe_madvise_purgeable_retained_to_user(): separate helper for
> fallible put_user
> =C2=A0 - Call put_user() after releasing all locks to avoid circular
> dependencies
> =C2=A0 - Use xe_bo_move_notify() instead of xe_bo_trigger_rebind() in
> xe_ttm_bo_purge()
> =C2=A0=C2=A0=C2=A0 for proper abstraction - handles vunmap, dma-buf notif=
ications,
> and VRAM
> =C2=A0=C2=A0=C2=A0 userfault cleanup (Thomas)
> =C2=A0 - Fix LRU crash while running shrink test
> =C2=A0 - Skip xe_bo_validate() for purged BOs in xe_gpuvm_validate()
>=20
> v6:
> =C2=A0 - xe_bo_move_notify() must be called *before* ttm_bo_validate().
> (Thomas)
> =C2=A0 - Block GPU page faults (fault-mode VMs) for DONTNEED bo's (Thomas=
,
> Matt)
> =C2=A0 - Rename retained to retained_ptr. (Jose)
>=20
> v7 Changes:
> =C2=A0 - Fix engine reset from EU overfetch in scratch VMs:
> xe_pagefault_begin()
> =C2=A0=C2=A0=C2=A0 and xe_pagefault_service() now return 0 instead of -EA=
CCES/-
> EINVAL for
> =C2=A0=C2=A0=C2=A0 DONTNEED/purged BOs and missing VMAs so stale accesses=
 hit
> scratch PTEs.
> =C2=A0 - Fix Engine memory CAT errors when Mesa uses
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE:
> =C2=A0=C2=A0=C2=A0 accept scratch VMs in xe_pagefault_asid_to_vm() via '|=
|
> xe_vm_has_scratch(vm).
> =C2=A0 - Skip validate/migrate/rebind for DONTNEED/purged BOs in
> xe_pagefault_begin()
> =C2=A0=C2=A0=C2=A0 using a bool *skip_rebind out-parameter. Scratch VMs A=
CK the
> fault and fall back
> =C2=A0=C2=A0=C2=A0 to scratch PTEs; non-scratch VMs return -EACCES.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 107 ++++++++++++++++++++---
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_pagefault.c=C2=A0 |=C2=A0 25 +++++-
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 40 +++++++--
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 20 ++++-
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 136
> +++++++++++++++++++++++++++++
> =C2=A06 files changed, 305 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 22179b2df85c..b6055bb4c578 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -835,6 +835,84 @@ static int xe_bo_move_notify(struct xe_bo *bo,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_bo_set_purgeable_state() - Set BO purgeable state with
> validation
> + * @bo: Buffer object
> + * @new_state: New purgeable state
> + *
> + * Sets the purgeable state with lockdep assertions and validates
> state
> + * transitions. Once a BO is PURGED, it cannot transition to any
> other state.
> + * Invalid transitions are caught with xe_assert().
> + */
> +void xe_bo_set_purgeable_state(struct xe_bo *bo,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum xe_madv_purgeable_state
> new_state)
> +{
> +	struct xe_device *xe =3D xe_bo_device(bo);
> +
> +	xe_bo_assert_held(bo);
> +
> +	/* Validate state is one of the known values */
> +	xe_assert(xe, new_state =3D=3D XE_MADV_PURGEABLE_WILLNEED ||
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_state =3D=3D XE_MADV_PURGEABLE_DONT=
NEED ||
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_state =3D=3D XE_MADV_PURGEABLE_PURG=
ED);
> +
> +	/* Once purged, always purged - cannot transition out */
> +	xe_assert(xe, !(bo->madv_purgeable =3D=3D
> XE_MADV_PURGEABLE_PURGED &&
> +			new_state !=3D XE_MADV_PURGEABLE_PURGED));
> +
> +	bo->madv_purgeable =3D new_state;
> +}
> +
> +/**
> + * xe_ttm_bo_purge() - Purge buffer object backing store
> + * @ttm_bo: The TTM buffer object to purge
> + * @ctx: TTM operation context
> + *
> + * This function purges the backing store of a BO marked as DONTNEED
> and
> + * triggers rebind to invalidate stale GPU mappings. For fault-mode
> VMs,
> + * this zaps the PTEs. The next GPU access will trigger a page fault
> and
> + * perform NULL rebind (scratch pages or clear PTEs based on VM
> config).
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct
> ttm_operation_ctx *ctx)
> +{
> +	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
> +	struct ttm_placement place =3D {};
> +	int ret;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (!ttm_bo->ttm)
> +		return 0;
> +
> +	if (!xe_bo_madv_is_dontneed(bo))
> +		return 0;
> +
> +	/*
> +	 * Use the standard pre-move hook so we share the same
> cleanup/invalidate
> +	 * path as migrations: drop any CPU vmap and schedule the
> necessary GPU
> +	 * unbind/rebind work.
> +	 *
> +	 * This must be called before ttm_bo_validate() frees the
> pages.
> +	 * May fail in no-wait contexts (fault/shrinker) or if the
> BO is
> +	 * pinned. Keep state unchanged on failure so we don't end
> up "PURGED"
> +	 * with stale mappings.
> +	 */
> +	ret =3D xe_bo_move_notify(bo, ctx);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ttm_bo_validate(ttm_bo, &place, ctx);
> +	if (ret)
> +		return ret;
> +
> +	/* Commit the state transition only once invalidation was
> queued */
> +	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_PURGED);
> +
> +	return 0;
> +}
> +
> =C2=A0static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *new_mem,
> @@ -854,6 +932,20 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0				=C2=A0 ttm && ttm_tt_is_populated(ttm)) ?
> true : false;
> =C2=A0	int ret =3D 0;
> =C2=A0
> +	/*
> +	 * Purge only non-shared BOs explicitly marked DONTNEED by
> userspace.
> +	 * The move_notify callback will handle invalidation
> asynchronously.
> +	 */
> +	if (evict && xe_bo_madv_is_dontneed(bo)) {
> +		ret =3D xe_ttm_bo_purge(ttm_bo, ctx);
> +		if (ret)
> +			return ret;
> +
> +		/* Free the unused eviction destination resource */
> +		ttm_resource_free(ttm_bo, &new_mem);
> +		return 0;
> +	}
> +
> =C2=A0	/* Bo creation path, moving to system or TT. */
> =C2=A0	if ((!old_mem && ttm) && !handle_system_ccs) {
> =C2=A0		if (new_mem->mem_type =3D=3D XE_PL_TT)
> @@ -1603,18 +1695,6 @@ static void xe_ttm_bo_delete_mem_notify(struct
> ttm_buffer_object *ttm_bo)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct
> ttm_operation_ctx *ctx)
> -{
> -	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> -
> -	if (ttm_bo->ttm) {
> -		struct ttm_placement place =3D {};
> -		int ret =3D ttm_bo_validate(ttm_bo, &place, ctx);
> -
> -		drm_WARN_ON(&xe->drm, ret);
> -	}
> -}
> -
> =C2=A0static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
> =C2=A0{
> =C2=A0	struct ttm_operation_ctx ctx =3D {
> @@ -2195,6 +2275,9 @@ struct xe_bo *xe_bo_init_locked(struct
> xe_device *xe, struct xe_bo *bo,
> =C2=A0#endif
> =C2=A0	INIT_LIST_HEAD(&bo->vram_userfault_link);
> =C2=A0
> +	/* Initialize purge advisory state */
> +	bo->madv_purgeable =3D XE_MADV_PURGEABLE_WILLNEED;
> +
> =C2=A0	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
> =C2=A0
> =C2=A0	if (resv) {
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index fb5541bdf602..653851d47aa6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -271,6 +271,8 @@ static inline bool xe_bo_madv_is_dontneed(struct
> xe_bo *bo)
> =C2=A0	return bo->madv_purgeable =3D=3D XE_MADV_PURGEABLE_DONTNEED;
> =C2=A0}
> =C2=A0
> +void xe_bo_set_purgeable_state(struct xe_bo *bo, enum
> xe_madv_purgeable_state new_state);
> +
> =C2=A0static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
> =C2=A0{
> =C2=A0	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> b/drivers/gpu/drm/xe/xe_pagefault.c
> index ea4857acf28d..415253631e6f 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -46,7 +46,8 @@ static int xe_pagefault_entry_size(void)
> =C2=A0}
> =C2=A0
> =C2=A0static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma
> *vma,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vram_region *vram, bool
> need_vram_move)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vram_region *vram, bool
> need_vram_move,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool *skip_rebind)
> =C2=A0{
> =C2=A0	struct xe_bo *bo =3D xe_vma_bo(vma);
> =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> @@ -59,6 +60,20 @@ static int xe_pagefault_begin(struct drm_exec
> *exec, struct xe_vma *vma,
> =C2=A0	if (!bo)
> =C2=A0		return 0;
> =C2=A0
> +	/*
> +	 * Under dma-resv lock: reject rebind for DONTNEED/purged
> BOs.
> +	 * Validating or migrating would repopulate pages we want
> the shrinker
> +	 * to reclaim, and rebinding would undo the GPU PTE zap.
> +	 * Scratch VMs absorb the access via scratch PTEs
> (skip_rebind=3Dtrue);
> +	 * non-scratch VMs have no fallback so fail the fault.
> +	 */
> +	if (unlikely(xe_bo_madv_is_dontneed(bo) ||
> xe_bo_is_purged(bo))) {
> +		if (!xe_vm_has_scratch(vm))
> +			return -EACCES;
> +		*skip_rebind =3D true;

So what happens here if we have a scratch VM, then do a lazy VM_BIND,
then madvise(DONTNEED) and then hit a page-fault. If we then
skip_rebind, aren't we going to hit the same pagefault again and again?



> +		return 0;
> +	}
> +
> =C2=A0	return need_vram_move ? xe_bo_migrate(bo, vram->placement,
> NULL, exec) :
> =C2=A0		xe_bo_validate(bo, vm, true, exec);
> =C2=A0}
> @@ -103,11 +118,13 @@ static int xe_pagefault_handle_vma(struct xe_gt
> *gt, struct xe_vma *vma,
> =C2=A0	/* Lock VM and BOs dma-resv */
> =C2=A0	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct
> xe_val_flags) {});
> =C2=A0	drm_exec_until_all_locked(&exec) {
> +		bool skip_rebind =3D false;
> +
> =C2=A0		err =3D xe_pagefault_begin(&exec, vma, tile->mem.vram,
> -					 needs_vram =3D=3D 1);
> +					 needs_vram =3D=3D 1,
> &skip_rebind);
> =C2=A0		drm_exec_retry_on_contention(&exec);
> =C2=A0		xe_validation_retry_on_oom(&ctx, &err);
> -		if (err)
> +		if (err || skip_rebind)
> =C2=A0			goto unlock_dma_resv;
> =C2=A0
> =C2=A0		/* Bind VMA only to the GT that has faulted */
> @@ -145,7 +162,7 @@ static struct xe_vm
> *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
> =C2=A0
> =C2=A0	down_read(&xe->usm.lock);
> =C2=A0	vm =3D xa_load(&xe->usm.asid_to_vm, asid);
> -	if (vm && xe_vm_in_fault_mode(vm))
> +	if (vm && (xe_vm_in_fault_mode(vm) ||
> xe_vm_has_scratch(vm)))
> =C2=A0		xe_vm_get(vm);
> =C2=A0	else
> =C2=A0		vm =3D ERR_PTR(-EINVAL);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 2d9ce2c4cb4f..08f40701f654 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -531,20 +531,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> pgoff_t offset,
> =C2=A0	/* Is this a leaf entry ?*/
> =C2=A0	if (level =3D=3D 0 || xe_pt_hugepte_possible(addr, next, level,
> xe_walk)) {
> =C2=A0		struct xe_res_cursor *curs =3D xe_walk->curs;
> -		bool is_null =3D xe_vma_is_null(xe_walk->vma);
> -		bool is_vram =3D is_null ? false :
> xe_res_is_vram(curs);
> +		struct xe_bo *bo =3D xe_vma_bo(xe_walk->vma);
> +		bool is_null_or_purged =3D xe_vma_is_null(xe_walk-
> >vma) ||
> +					 (bo &&
> xe_bo_is_purged(bo));
> +		bool is_vram =3D is_null_or_purged ? false :
> xe_res_is_vram(curs);
> =C2=A0
> =C2=A0		XE_WARN_ON(xe_walk->va_curs_start !=3D addr);
> =C2=A0
> =C2=A0		if (xe_walk->clear_pt) {
> =C2=A0			pte =3D 0;
> =C2=A0		} else {
> -			pte =3D vm->pt_ops->pte_encode_vma(is_null ? 0
> :
> +			/*
> +			 * For purged BOs, treat like null VMAs -
> pass address 0.
> +			 * The pte_encode_vma will set XE_PTE_NULL
> flag for scratch mapping.
> +			 */
> +			pte =3D vm->pt_ops-
> >pte_encode_vma(is_null_or_purged ? 0 :
> =C2=A0						=09
> xe_res_dma(curs) +
> =C2=A0							 xe_walk-
> >dma_offset,
> =C2=A0							 xe_walk-
> >vma,
> =C2=A0							 pat_index,
> level);
> -			if (!is_null)
> +			if (!is_null_or_purged)
> =C2=A0				pte |=3D is_vram ? xe_walk-
> >default_vram_pte :
> =C2=A0					xe_walk->default_system_pte;
> =C2=A0
> @@ -568,7 +574,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> pgoff_t offset,
> =C2=A0		if (unlikely(ret))
> =C2=A0			return ret;
> =C2=A0
> -		if (!is_null && !xe_walk->clear_pt)
> +		if (!is_null_or_purged && !xe_walk->clear_pt)
> =C2=A0			xe_res_next(curs, next - addr);
> =C2=A0		xe_walk->va_curs_start =3D next;
> =C2=A0		xe_walk->vma->gpuva.flags |=3D (XE_VMA_PTE_4K <<
> level);
> @@ -721,6 +727,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0	};
> =C2=A0	struct xe_pt *pt =3D vm->pt_root[tile->id];
> =C2=A0	int ret;
> +	bool is_purged =3D false;
> +
> +	/*
> +	 * Check if BO is purged:
> +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe
> zero reads
> +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to
> avoid mapping to phys addr 0
> +	 *
> +	 * For non-scratch VMs, we force clear_pt=3Dtrue so leaf PTEs
> become completely
> +	 * zero instead of creating a PRESENT mapping to physical
> address 0.
> +	 */
> +	if (bo && xe_bo_is_purged(bo)) {
> +		is_purged =3D true;
> +
> +		/*
> +		 * For non-scratch VMs, a NULL rebind should use
> zero PTEs
> +		 * (non-present), not a present PTE to phys 0.
> +		 */
> +		if (!xe_vm_has_scratch(vm))
> +			xe_walk.clear_pt =3D true;
> +	}
> =C2=A0
> =C2=A0	if (range) {
> =C2=A0		/* Move this entire thing to xe_svm.c? */
> @@ -756,11 +782,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0	}
> =C2=A0
> =C2=A0	xe_walk.default_vram_pte |=3D XE_PPGTT_PTE_DM;
> -	xe_walk.dma_offset =3D bo ? vram_region_gpu_offset(bo-
> >ttm.resource) : 0;
> +	xe_walk.dma_offset =3D (bo && !is_purged) ?
> vram_region_gpu_offset(bo->ttm.resource) : 0;
> =C2=A0	if (!range)
> =C2=A0		xe_bo_assert_held(bo);
> =C2=A0
> -	if (!xe_vma_is_null(vma) && !range) {
> +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
> =C2=A0		if (xe_vma_is_userptr(vma))
> =C2=A0			xe_res_first_dma(to_userptr_vma(vma)-
> >userptr.pages.dma_addr, 0,
> =C2=A0					 xe_vma_size(vma), &curs);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5572e12c2a7e..a0ade67d616e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -326,6 +326,7 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> =C2=A0static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct
> drm_exec *exec)
> =C2=A0{
> =C2=A0	struct xe_vm *vm =3D gpuvm_to_vm(vm_bo->vm);
> +	struct xe_bo *bo =3D gem_to_xe_bo(vm_bo->obj);
> =C2=A0	struct drm_gpuva *gpuva;
> =C2=A0	int ret;
> =C2=A0
> @@ -334,10 +335,16 @@ static int xe_gpuvm_validate(struct
> drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
> =C2=A0		list_move_tail(&gpuva_to_vma(gpuva)-
> >combined_links.rebind,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->rebind_list);
> =C2=A0
> +	/* Skip re-populating purged BOs, rebind maps scratch pages.
> */
> +	if (xe_bo_is_purged(bo)) {
> +		vm_bo->evicted =3D false;
> +		return 0;
> +	}
> +
> =C2=A0	if (!try_wait_for_completion(&vm->xe->pm_block))
> =C2=A0		return -EAGAIN;
> =C2=A0
> -	ret =3D xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false,
> exec);
> +	ret =3D xe_bo_validate(bo, vm, false, exec);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> @@ -1358,6 +1365,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo,
> u64 bo_offset,
> =C2=A0static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 pat_index, u32 pt_level=
)
> =C2=A0{
> +	struct xe_bo *bo =3D xe_vma_bo(vma);
> +	struct xe_vm *vm =3D xe_vma_vm(vma);
> +
> =C2=A0	pte |=3D XE_PAGE_PRESENT;
> =C2=A0
> =C2=A0	if (likely(!xe_vma_read_only(vma)))
> @@ -1366,7 +1376,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct
> xe_vma *vma,
> =C2=A0	pte |=3D pte_encode_pat_index(pat_index, pt_level);
> =C2=A0	pte |=3D pte_encode_ps(pt_level);
> =C2=A0
> -	if (unlikely(xe_vma_is_null(vma)))
> +	/*
> +	 * NULL PTEs redirect to scratch page (return zeros on
> read).
> +	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch
> VMs.
> +	 * Never set NULL flag without scratch page - causes
> undefined behavior.
> +	 */
> +	if (unlikely(xe_vma_is_null(vma) ||
> +		=C2=A0=C2=A0=C2=A0=C2=A0 (bo && xe_bo_is_purged(bo) &&
> xe_vm_has_scratch(vm))))
> =C2=A0		pte |=3D XE_PTE_NULL;
> =C2=A0
> =C2=A0	return pte;
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 869db304d96d..ffba2e41c539 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -26,6 +26,8 @@ struct xe_vmas_in_madvise_range {
> =C2=A0/**
> =C2=A0 * struct xe_madvise_details - Argument to madvise_funcs
> =C2=A0 * @dpagemap: Reference-counted pointer to a struct drm_pagemap.
> + * @has_purged_bo: Track if any BO was purged (for purgeable state)
> + * @retained_ptr: User pointer for retained value (for purgeable
> state)
> =C2=A0 *
> =C2=A0 * The madvise IOCTL handler may, in addition to the user-space
> =C2=A0 * args, have additional info to pass into the madvise_func that
> @@ -34,6 +36,8 @@ struct xe_vmas_in_madvise_range {
> =C2=A0 */
> =C2=A0struct xe_madvise_details {
> =C2=A0	struct drm_pagemap *dpagemap;
> +	bool has_purged_bo;
> +	u64 retained_ptr;
> =C2=A0};
> =C2=A0
> =C2=A0static int get_vmas(struct xe_vm *vm, struct
> xe_vmas_in_madvise_range *madvise_range)
> @@ -180,6 +184,67 @@ static void madvise_pat_index(struct xe_device
> *xe, struct xe_vm *vm,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +/**
> + * madvise_purgeable - Handle purgeable buffer object advice
> + * @xe: XE device
> + * @vm: VM
> + * @vmas: Array of VMAs
> + * @num_vmas: Number of VMAs
> + * @op: Madvise operation
> + * @details: Madvise details for return values
> + *
> + * Handles DONTNEED/WILLNEED/PURGED states. Tracks if any BO was
> purged
> + * in details->has_purged_bo for later copy to userspace.
> + *
> + * Note: Marked __maybe_unused until hooked into madvise_funcs[] in
> the
> + * final patch to maintain bisectability. The NULL placeholder in
> the
> + * array ensures proper -EINVAL return for userspace until all
> supporting
> + * infrastructure (shrinker, per-VMA tracking) is complete.
> + */
> +static void __maybe_unused madvise_purgeable(struct xe_device *xe,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma **vmas,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 int num_vmas,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_madvise
> *op,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 struct
> xe_madvise_details *details)
> +{
> +	int i;
> +
> +	xe_assert(vm->xe, op->type =3D=3D
> DRM_XE_VMA_ATTR_PURGEABLE_STATE);
> +
> +	for (i =3D 0; i < num_vmas; i++) {
> +		struct xe_bo *bo =3D xe_vma_bo(vmas[i]);
> +
> +		if (!bo)
> +			continue;
> +
> +		/* BO must be locked before modifying madv state */
> +		xe_bo_assert_held(bo);
> +
> +		/*
> +		 * Once purged, always purged. Cannot transition
> back to WILLNEED.
> +		 * This matches i915 semantics where purged BOs are
> permanently invalid.
> +		 */
> +		if (xe_bo_is_purged(bo)) {
> +			details->has_purged_bo =3D true;
> +			continue;
> +		}
> +
> +		switch (op->purge_state_val.val) {
> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> +			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_WILLNEED);
> +			break;
> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> +			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_DONTNEED);
> +			break;
> +		default:
> +			drm_warn(&vm->xe->drm, "Invalid madvice
> value =3D %d\n",

Please use either "madvise" with an 's' or "advice".

Thanks,
Thomas



> +				 op->purge_state_val.val);
> +			return;
> +		}
> +	}
> +}
> +
> =C2=A0typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm=
,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma **vmas, int num_vmas,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_xe_madvise *op,
> @@ -189,6 +254,12 @@ static const madvise_func madvise_funcs[] =3D {
> =C2=A0	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] =3D
> madvise_preferred_mem_loc,
> =C2=A0	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] =3D madvise_atomic,
> =C2=A0	[DRM_XE_MEM_RANGE_ATTR_PAT] =3D madvise_pat_index,
> +	/*
> +	 * Purgeable support implemented but not enabled yet to
> maintain
> +	 * bisectability. Will be set to madvise_purgeable() in
> final patch
> +	 * when all infrastructure (shrinker, VMA tracking) is
> complete.
> +	 */
> +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] =3D NULL,
> =C2=A0};
> =C2=A0
> =C2=A0static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start,
> u64 end)
> @@ -319,6 +390,19 @@ static bool madvise_args_are_sane(struct
> xe_device *xe, const struct drm_xe_madv
> =C2=A0			return false;
> =C2=A0		break;
> =C2=A0	}
> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> +	{
> +		u32 val =3D args->purge_state_val.val;
> +
> +		if (XE_IOCTL_DBG(xe, !(val =3D=3D
> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED ||
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D=3D
> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED)))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, args->purge_state_val.pad))
> +			return false;
> +
> +		break;
> +	}
> =C2=A0	default:
> =C2=A0		if (XE_IOCTL_DBG(xe, 1))
> =C2=A0			return false;
> @@ -337,6 +421,12 @@ static int xe_madvise_details_init(struct xe_vm
> *vm, const struct drm_xe_madvise
> =C2=A0
> =C2=A0	memset(details, 0, sizeof(*details));
> =C2=A0
> +	/* Store retained pointer for purgeable state */
> +	if (args->type =3D=3D DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
> +		details->retained_ptr =3D args-
> >purge_state_val.retained_ptr;
> +		return 0;
> +	}
> +
> =C2=A0	if (args->type =3D=3D DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
> =C2=A0		int fd =3D args->preferred_mem_loc.devmem_fd;
> =C2=A0		struct drm_pagemap *dpagemap;
> @@ -365,6 +455,21 @@ static void xe_madvise_details_fini(struct
> xe_madvise_details *details)
> =C2=A0	drm_pagemap_put(details->dpagemap);
> =C2=A0}
> =C2=A0
> +static int xe_madvise_purgeable_retained_to_user(const struct
> xe_madvise_details *details)
> +{
> +	u32 retained;
> +
> +	if (!details->retained_ptr)
> +		return 0;
> +
> +	retained =3D !details->has_purged_bo;
> +
> +	if (put_user(retained, (u32 __user
> *)u64_to_user_ptr(details->retained_ptr)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> =C2=A0static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma
> **vmas,
> =C2=A0				=C2=A0=C2=A0 int num_vmas, u32 atomic_val)
> =C2=A0{
> @@ -422,6 +527,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0	struct xe_vm *vm;
> =C2=A0	struct drm_exec exec;
> =C2=A0	int err, attr_type;
> +	bool do_retained;
> =C2=A0
> =C2=A0	vm =3D xe_vm_lookup(xef, args->vm_id);
> =C2=A0	if (XE_IOCTL_DBG(xe, !vm))
> @@ -432,6 +538,25 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0		goto put_vm;
> =C2=A0	}
> =C2=A0
> +	/* Cache whether we need to write retained, and validate
> it's initialized to 0 */
> +	do_retained =3D args->type =3D=3D DRM_XE_VMA_ATTR_PURGEABLE_STATE
> &&
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args->purge_state_val.retained_ptr;
> +	if (do_retained) {
> +		u32 retained;
> +		u32 __user *retained_ptr;
> +
> +		retained_ptr =3D u64_to_user_ptr(args-
> >purge_state_val.retained_ptr);
> +		if (get_user(retained, retained_ptr)) {
> +			err =3D -EFAULT;
> +			goto put_vm;
> +		}
> +
> +		if (XE_IOCTL_DBG(xe, retained !=3D 0)) {
> +			err =3D -EINVAL;
> +			goto put_vm;
> +		}
> +	}
> +
> =C2=A0	xe_svm_flush(vm);
> =C2=A0
> =C2=A0	err =3D down_write_killable(&vm->lock);
> @@ -487,6 +612,13 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0	}
> =C2=A0
> =C2=A0	attr_type =3D array_index_nospec(args->type,
> ARRAY_SIZE(madvise_funcs));
> +
> +	/* Ensure the madvise function exists for this type */
> +	if (!madvise_funcs[attr_type]) {
> +		err =3D -EINVAL;
> +		goto err_fini;
> +	}
> +
> =C2=A0	madvise_funcs[attr_type](xe, vm, madvise_range.vmas,
> madvise_range.num_vmas, args,
> =C2=A0				 &details);
> =C2=A0
> @@ -505,6 +637,10 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0	xe_madvise_details_fini(&details);
> =C2=A0unlock_vm:
> =C2=A0	up_write(&vm->lock);
> +
> +	/* Write retained value to user after releasing all locks */
> +	if (!err && do_retained)
> +		err =3D
> xe_madvise_purgeable_retained_to_user(&details);
> =C2=A0put_vm:
> =C2=A0	xe_vm_put(vm);
> =C2=A0	return err;
