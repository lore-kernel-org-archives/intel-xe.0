Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65F7C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D4D10E24E;
	Fri, 25 Sep 2026 20:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d/xbnKRo";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E7E10E24E
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:46:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BBB7660136;
 Fri, 25 Sep 2026 20:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519811F000FF;
 Fri, 25 Sep 2026 20:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790369206;
 bh=P7FxyxvD5xuYZ4jjkv/JNBukl3ycF+e3qek4L+iQy1o=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=d/xbnKRoFvigbBoP5I7TsMEx+JcxfviScO0izdl9cWNld4laZo4l55qUCnnesVUkF
 j5r2OMVf/gRti0N/4JACcTgvYu5IHSTPYWZQoIf3wZgWvBthGm/hz5uCXhkiO+e7xO
 KrljH7WB1zAylyNVoN1AKjThFSKAu1p40w7BcYPrpH90yRxdQX+HDBeuPwMGK+RniH
 C5B5+FMjVt+fblXuRoD54SB5drKxl1QYEIcLv64wqBq+FpNPrfKLC+zfaPqpABBNLl
 gQlUcVmcuPHNovY+KHSu+mO3a61Mdr4Yipr/UNSOsTjgJ37EhJ9ceA9weBCW91aRL4
 OHk2qsjIsmCPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 17/24] drm/xe: Add device flag to enable PT mirroring
 across tiles
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925201526.1355279-18-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
 <20260925201526.1355279-18-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 20:46:45 +0000
Message-Id: <20260925204646.519811F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] drm/xe: Silent drop of PT updates and zaps causing UAF when mi=
rroring is disabled
- [Medium] drm/xe: Resource leak allocating unreachable PT roots when mirro=
ring is disabled
--

commit e6be828aa99db4551a34cd6134379dab648693b1
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add device flag to enable PT mirroring across tiles

This commit introduces a device flag has_pt_mirror to enable or disable
page-table mirroring across tiles for multi-tile devices. It updates VM
creation, page table operations, and rebind logic to accommodate disabled
mirroring.

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index fbefcfc52dcac..dcef29b56d636 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
[ ... ]
> @@ -1046,6 +1051,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe=
_vma *vma)
>  	if (!(pt_mask & BIT(tile->id)))
>  		return false;
> =20
> +	if (pt_mirroring_disabled_for_tile(xe_vma_vm(vma), tile->id))
> +		return true;
> +
>  	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
>  				xe_vma_end(vma), &xe_walk.base);

[Severity: Critical]
If vma->tile_present excludes tile 0 (e.g., mask is 0x2), calls for tile 0
will return false early, and calls for tile 1 will return true here because
mirroring is disabled.

Could this prevent the PTEs from being zapped in the shared root, potential=
ly
causing a use-after-free if pt_root[0] points to freed memory?

[ ... ]
> @@ -2539,9 +2550,21 @@ int xe_pt_update_ops_prepare(struct xe_device *xe,=
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
> +			xe_page_reclaim_entries_get(prl->entries);
> +			continue;
> +		}
> +

[Severity: Critical]
Similarly, if a PT update operation processes a VMA whose mask excludes til=
e 0,
tile 0 is skipped because its num_ops is 0, and tile 1 is skipped here
because mirroring is disabled.

This appears to happen in xe_vm_rebind() in drivers/gpu/drm/xe/xe_vm.c, whi=
ch
was not updated to use adjust_rebind_tile_mask() and still passes
vma->tile_present directly:

drivers/gpu/drm/xe/xe_vm.c:xe_vm_rebind() {
    ...
		err =3D xe_vm_ops_add_rebind(&vops, vma,
					   vma->tile_present);
    ...
}

Could this cause PT updates and invalidations to be silently dropped entire=
ly,
leaving stale page tables?

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0f542f47b9a84..f450e1c6f7500 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
[ ... ]
> @@ -1739,7 +1749,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u3=
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
For normal (non-migration) VMs, this loop seems to allocate pt_root[id] and
associated scratch buffers for all tiles, even when PT mirroring is disable=
d.

Since xe_vm_pt_root(vm, id) will always return pt_root[0] when
!has_pt_mirror, does this leak VRAM and system memory by allocating orphaned
PT roots and scratch buffers for id > 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925201526.1355=
279-1-matthew.brost@intel.com?part=3D17
