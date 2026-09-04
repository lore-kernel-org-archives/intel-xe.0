Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CFAC624D6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C567910E0FD;
	Fri,  4 Sep 2026 00:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eEHmpze4";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019F310E0FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:29:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2565F60234;
 Fri,  4 Sep 2026 00:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10C41F000E9;
 Fri,  4 Sep 2026 00:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788481793;
 bh=wTPgtISho5Skp3AN3Cx/Fs1VgKtktCZm8kT1HWyPcC8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=eEHmpze4jptunAEzOmXbuCXa/Cw9XxF3FYslpuEUDGt96+K7VZOL0gbJ8g5ROGPYn
 EQ4EVDiPQ5CF1vIfoYH3gsFKGvE11ARnq/HBKl5rF5VGFR1nhOdMDwuW682Ak3tUC0
 z5CXavFLPiwd489zIFIR9b5OpoxxpvtlfaORfd5aq3CKaJElTWIbypTlcjPey+tI0b
 PiF6fmmblLE2DYyC3/MmOsCffDBaBodvQFgVCb2ZwlWvAkTdmaoeooFF1SlQzebVOB
 TbiI9d3QxGaC2rV+r2ukR7+QOMWhp05wa+q6OZ3l1Y6qsMJtUL/laLXEc2nu9ARGqb
 pGRRA3teVdXEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 17/25] drm/xe: Add device flag to enable PT mirroring
 across tiles
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-18-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-18-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:29:53 +0000
Message-Id: <20260904002953.B10C41F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect tile mask generation causes missing TLB invalidations on=
 secondary tiles
- [High] Shallow copy of Page Reclaim List (PRL) leads to Double Free durin=
g TLB invalidation
- [Medium] Unnecessary allocation of unused page table roots and scratch ta=
bles
--

commit 084f96016724c31d7bcd97e7c49979198c29fe71
Author: Matthew Brost <matthew.brost@intel.com>
Subject: drm/xe: Add device flag to enable PT mirroring across tiles

Some multi-tile devices may want to mirror page tables across tiles for
memory-bandwidth reasons, while others may not. Add a device flag that
allows enabling or disabling page-table mirroring across tiles.

Link: https://patch.msgid.link/20260228013501.106680-18-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 821edeaecaed9..deb33e85e6eb7 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
[ ... ]
> @@ -2542,9 +2553,20 @@ int xe_pt_update_ops_prepare(struct xe_device *xe,=
 struct xe_vma_ops *vops)
>  	int id, err;
> =20
>  	for_each_tile(tile, xe, id) {
> +		struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> +			&vops->pt_update_ops[id];
> +
>  		if (!vops->pt_update_ops[id].num_ops)
>  			continue;
> =20
> +		if (pt_mirroring_disabled_for_tile(vops->vm, id)) {
> +			struct xe_page_reclaim_list *prl =3D &pt_update_ops->prl;
> +
> +			/* Transfer root PT update ops PRL to current */
> +			*prl =3D vops->pt_update_ops[0].prl;

[Severity: High]
Does this shallow copy of the Page Reclaim List (PRL) cause a double free?

By copying the structure directly without incrementing a reference count,
multiple tiles now hold a pointer to the same page. Later, when
xe_tlb_inval_job_create() adds this to jobs in xe_pt_update_ops_run(), both
jobs take ownership. When the jobs finish, they will both call
xe_page_reclaim_entries_put(), freeing the same page twice.

> +			continue;
> +		}
> +
>  		err =3D __xe_pt_update_ops_prepare(tile, vops);
>  		if (err)
>  			return err;
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 33ef4ccc3550b..d9a9c0844c5e3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -844,6 +844,14 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worke=
r)
>  	return err;
>  }
> =20
> +static u8 adjust_rebind_tile_mask(struct xe_vm *vm, u8 tile_mask)
> +{
> +	if (vm->xe->info.has_pt_mirror)
> +		return tile_mask;
> +
> +	return (0x1 << vm->xe->info.max_gt_per_tile) - 1;

[Severity: High]
Is max_gt_per_tile being used here incorrectly instead of the total tile co=
unt?

If a device (like PVC) has 1 GT per tile, this evaluates to 1, causing the
generated mask to omit secondary tiles. During xe_vma_rebind(), the num_ops
will only be incremented for tile 0.

Consequently, xe_pt_update_ops_prepare() skips preparation for the secondary
tiles, leaving their start and last variables uninitialized (zeroed). When
TLB invalidation jobs are created later, they use a range of [0, 0] for
these tiles, leaving stale TLB entries that could cause memory corruption.

> +}
> +
>  struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8=
 tile_mask)
>  {
>  	struct dma_fence *fence =3D NULL;
[ ... ]
> @@ -1737,7 +1747,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u3=
2 flags, struct xe_file *xef)
> =20
>  		for_each_tile(tile, xe, id) {
>  			if (flags & XE_VM_FLAG_MIGRATION &&
> -			    tile->id !=3D XE_VM_FLAG_TILE_ID(flags))
> +			    tile->id !=3D XE_VM_FLAG_TILE_ID(flags) &&
> +			    (vm->xe->info.has_pt_mirror || id))
>  				continue;
> =20
>  			vm->pt_root[id] =3D xe_pt_create(vm, tile, xe->info.vm_max_level,
>  						       &exec);

[Severity: Medium]
For standard user VMs, does this unconditionally allocate page table roots
and scratch tables for secondary tiles even when PT mirroring is disabled?

When has_pt_mirror is false, xe_vm_pt_root() is hardcoded to return
vm->pt_root[0]. As a result, the allocations made here for id > 0 (and their
associated scratch tables) are never used, wasting VRAM.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D17
