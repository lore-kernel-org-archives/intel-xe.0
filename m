Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0AC5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 08:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2204610E1D1;
	Mon,  2 Jun 2025 08:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMijw0LQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9055510E1D1
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748854672; x=1780390672;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FRREWyYdenIfw/dSqpYQCSXyi5kaZ75kbKvoRXcSLg0=;
 b=LMijw0LQeTLrzJUk4upVVDbjKseccIs/hy+8uqgO3naiW7KPFa8KRkQy
 WfffkH9coWqdQOVFaoe1m/Nzrz/809uX+rb8TYnHopKDfz3z1XvnATYBt
 8rwm33S/rXxy1xi1bAW4f4+p61xsUUzYHaDw3jH3XEhCo3DO7kZTk7YE5
 LESQ17m8ou94ZqGw+x5tnZSfOHEGl42t1yy0HeRrXc1M0+6nndO/SPzIx
 UYdwQZ8BzbMrmRAr9zSzewcAYYCz619h+JotFaRtJtcN7OF8A2R2EsUV/
 RR9UIN5gxXIJ2jj0NYOgJJ7MJe5vPM2vGoYH6qGUgpUJ8MDVTwmHQKXi+ w==;
X-CSE-ConnectionGUID: CPNAmbISR2mhjSlcXTh15w==
X-CSE-MsgGUID: VqNPXpsuR5eZFnqZiKdjUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="73390572"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="73390572"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 01:57:49 -0700
X-CSE-ConnectionGUID: RXtwWpanRRWVVTD8by340A==
X-CSE-MsgGUID: FDF9WD7+Shm6ywkJcM9Beg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="149332903"
Received: from zzombora-mobl1 (HELO [10.245.245.183]) ([10.245.245.183])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 01:57:48 -0700
Message-ID: <0022fafa6c45e055d20d0a826759b2b2f778b27f.camel@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe: Make VMA tile_present, tile_invalidated
 access rules clear
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
Date: Mon, 02 Jun 2025 10:57:36 +0200
In-Reply-To: <20250530061433.1819041-1-matthew.brost@intel.com>
References: <20250530061433.1819041-1-matthew.brost@intel.com>
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

On Thu, 2025-05-29 at 23:14 -0700, Matthew Brost wrote:
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
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++----
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 16 +++++++++++++---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++=
++++--
> =C2=A04 files changed, 30 insertions(+), 9 deletions(-)
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

There's a write also in xe_vm_invalidate_vma() that might need a
WRITE_ONCE.

Otherwise LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>




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
> index 7140d8856bad..e781e8138f34 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3871,6 +3871,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0	/* Check that we don't race with page-table updates */
> =C2=A0	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> =C2=A0		if (xe_vma_is_userptr(vma)) {
> +			lockdep_assert_held_write(&xe_vma_vm(vma)-
> >userptr.notifier_lock);
> =C2=A0			WARN_ON_ONCE(!mmu_interval_check_retry
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 (&to_userptr_vma(vma)-
> >userptr.notifier,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to_userptr_vma(vma)-
> >userptr.notifier_seq));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index bfc145baad49..f3fb29b4d525 100644
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
> +	 * vm->userptr.notifier_lock in read mode is required. Can
> be
> +	 * opportunisticly read with READ_ONCE outside of locks.
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

