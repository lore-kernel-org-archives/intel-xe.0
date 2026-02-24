Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A55CE9B25B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 12:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5991610E56C;
	Tue, 24 Feb 2026 12:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZeGHYg2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F4510E56C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771935667; x=1803471667;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5J6ASYOncZXPuvPbcaqwUF84l4K5CD63Z+9fKnJveIM=;
 b=ZeGHYg2uUZFdxRnXddRrEZxXLBJs0VxHFDTVze47mPXmb+/+VasOd3L7
 z+JL2mpmR+kSCg4tp12tQY/az91MaMI9lixp89c1eF5yLgDhEYkC0gvj3
 wFqclxaFDP0edj66JkC+jVc40gTHAyD4vdlUn1ykxGzDe3fXW5hfoJChC
 DgXmzrrmmVsUZ9l+7+FHGnCMBEC2MyUirg5ZEbMI2W0NjDn0v/SyzsFt2
 nCMtuJdxAS0hbyFzYQpUpC0Vpjx/tOxFuu0d2yLe7YaUibey+zfjeVCeR
 DPAqhlhor5R1sclPZLI6pFZOmylR4MB6/FA4zU244JkY1lDNGI7lZe1/+ w==;
X-CSE-ConnectionGUID: hVps8rlwQPCcAEq+zy1MNA==
X-CSE-MsgGUID: +Agj7kAhQR6J8q4mzQw+ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83271100"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83271100"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:21:07 -0800
X-CSE-ConnectionGUID: LPGwOQdXTTKIpfHN3V6UPg==
X-CSE-MsgGUID: BHIKFkRfQVmCbbX9a3p0Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="214980110"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.148])
 ([10.245.244.148])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 04:21:04 -0800
Message-ID: <932bd347295960286b9a30db776ac3e2e24cdd2d.camel@linux.intel.com>
Subject: Re: [PATCH v5 3/9] drm/xe/madvise: Implement purgeable buffer
 object support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Tue, 24 Feb 2026 13:21:03 +0100
In-Reply-To: <20260211152644.1661165-4-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-4-arvind.yadav@intel.com>
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
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 106 ++++++++++++++++++++---
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_pagefault.c=C2=A0 |=C2=A0 12 +++
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 40 +++++++--
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 20 ++++-
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 133
> +++++++++++++++++++++++++++++
> =C2=A06 files changed, 292 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8bf16d60b9a5..87cde4b2fe59 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -835,6 +835,83 @@ static int xe_bo_move_notify(struct xe_bo *bo,
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
> +	ret =3D ttm_bo_validate(ttm_bo, &place, ctx);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Use the standard pre-move hook so we share the same
> cleanup/invalidate
> +	 * path as migrations: drop any CPU vmap and schedule the
> necessary GPU
> +	 * unbind/rebind work.
> +	 *
> +	 * This may fail in no-wait contexts (fault/shrinker) or if
> the BO is
> +	 * pinned. Keep state unchanged on failure so we don't end
> up "PURGED"
> +	 * with stale mappings.
> +	 */
> +	ret =3D xe_bo_move_notify(bo, ctx);
> +	if (ret)
> +		return ret;

move_notify() must be called *before* pages are actually freed, that is
before ttm_bo_validate().

Other than that LGTM.

