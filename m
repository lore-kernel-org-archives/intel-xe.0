Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3322AC61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47C810E07F;
	Fri,  4 Sep 2026 02:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nblGbjh6";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C3F10E07F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:43:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 24D3B40A38;
 Fri,  4 Sep 2026 02:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DC81F000E9;
 Fri,  4 Sep 2026 02:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788489828;
 bh=9fZMUMt1Q5X6vAMdCS4SotfOgI9JH9XPDcpVmIIvqaw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nblGbjh6LOVnb5bqWTQyEVRRJR3bOHJJgsSO5T+gFgVoPKX6ka4kqwpj4TncYZnz/
 RZ1F1663zyzLzLV8Nm30ppU4jGYf0tfUIvi17C269Euj6LZ8BOkokwIJLvru3WAE3W
 eWyhUSZ0je2JGMdQiE7CtORd7jITQ/3GT139aXQLb7ODtqIhK8Tx7NXLGVHI+Rq8OW
 wuEmk5N++gP2Gauj8Cahcvj48h+IaFy9SPsy6EX6PpI7Y1/Z7viZ+M8EAQUPLeL+Wo
 y5yYu4iVtfht8CZI0u0lVHGtwiTbh19XwuvdiCHK2keWZX2pcFVRednN//l9pkyc8w
 gE1gh1ht0rjww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 17/25] drm/xe: Add device flag to enable PT mirroring
 across tiles
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904022207.3490018-18-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-18-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:43:47 +0000
Message-Id: <20260904024347.D0DC81F000E9@smtp.kernel.org>
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
- [High] Unused page tables and scratch buffers are incorrectly allocated f=
or secondary tiles when PT mirroring is disabled, wasting VRAM, and migrati=
on VMs are forced to use remote page tables.
- [Medium] Memory leak of page reclaim entries (`prl->entries`) on error pa=
ths or when TLB invalidation is bypassed for tiles with disabled page table=
 mirroring.
--

commit 38fe6ff118093de1244d8bbcc84d59616c09c17c
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add device flag to enable PT mirroring across tiles

This commit introduces a device flag to enable or disable page-table
mirroring across tiles for memory-bandwidth reasons. The flag defaults
to the existing behavior on PVC but allows flexibility for other devices.

Link: https://patch.msgid.link/20260228013501.106680-18-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 05bbac6c2632e..bf2cdef44179d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
[ ... ]
> @@ -2541,9 +2552,21 @@ int xe_pt_update_ops_prepare(struct xe_device *xe,=
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
>  		err =3D __xe_pt_update_ops_prepare(tile, vops);
>  		if (err)
>  			return err;
[ ... ]
> @@ -2924,6 +2953,9 @@ void xe_pt_update_ops_fini(struct xe_device *xe, st=
ruct xe_vma_ops *vops)
>  		if (!pt_update_ops->num_ops)
>  			continue;
> =20
> +		if (pt_mirroring_disabled_for_tile(vops->vm, id))
> +			continue;
> +
>  		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);

[Severity: Medium]
Does this skip releasing the page reclaim entries for secondary tiles?

When PT mirroring is disabled, xe_pt_update_ops_prepare() takes an extra
reference to prl->entries for secondary tiles. If the operation succeeds but
TLB invalidation is bypassed (or if called on cleanup),
xe_pt_update_ops_fini() is executed. By checking
pt_mirroring_disabled_for_tile() and continuing, it skips the needed
xe_page_reclaim_entries_put() call, which can lead to a memory leak.

>  	}
>  }
> @@ -2948,6 +2980,9 @@ void xe_pt_update_ops_abort(struct xe_device *xe, s=
truct xe_vma_ops *vops)
>  			&vops->pt_update_ops[id];
>  		int i;
> =20
> +		if (pt_mirroring_disabled_for_tile(vops->vm, id))
> +			continue;
> +
>  		for (i =3D pt_update_ops->num_ops - 1; i >=3D 0; --i) {

[Severity: Medium]
Similar to the issue above in xe_pt_update_ops_fini(), does this leak the
page reclaim entries when an operation is aborted?

By skipping secondary tiles when mirroring is disabled,
xe_pt_update_ops_abort() also bypasses xe_pt_update_ops_fini() for those
tiles, meaning the reference acquired in xe_pt_update_ops_prepare() is
never put on error paths.

>  			struct xe_vm_pgtable_update_op *pt_op =3D
>  				to_pt_op(pt_update_ops, i);
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index fbfc42afef8b1..795d0ebb10047 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
[ ... ]
> @@ -1738,7 +1748,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u3=
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

[Severity: High]
Does this allocate unused page tables and scratch buffers for secondary til=
es
when PT mirroring is disabled?

When has_pt_mirror is false, the loop does not skip secondary tiles for
normal VMs, causing it to unconditionally allocate pt_root structures and
scratch pages for all of them.=20

Additionally, for migration VMs on secondary tiles, this allocates both
pt_root[0] and pt_root[tile_id]. Since xe_vm_pt_root() unconditionally
returns pt_root[0] when mirroring is disabled, this abandons the memory
allocated for secondary tiles and forces the migration engine to use
pt_root[0] over the cross-tile interconnect, defeating the locality benefit=
s.

[ ... ]
> @@ -5072,3 +5083,21 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, str=
uct xe_exec_queue *q)
>  	}
>  	up_write(&vm->exec_queues.lock);
>  }
> +
> +/**
> + * xe_vm_pt_root() - Retrieve VM page-table root
> + * @vm: The VM.
> + * @tile_id: Tile ID
> + *
> + * Retrieve VM page-table root for a tile ID, used to abstract if PT mir=
roring is
> + * enabled across tiles.
> + *
> + * Return: VM page-table root for a tile ID
> + */
> +struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id)
> +{
> +	if (vm->xe->info.has_pt_mirror)
> +		return vm->pt_root[tile_id];
> +
> +	return vm->pt_root[0];
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904022207.3490=
018-1-matthew.brost@intel.com?part=3D17
