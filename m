Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE4BC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 12:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EC710EB92;
	Tue,  8 Sep 2026 12:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FxOAo69K";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F2510EB92
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 12:04:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D3CC860A9D;
 Tue,  8 Sep 2026 12:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D42F1F00A3A;
 Tue,  8 Sep 2026 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788869098;
 bh=xb6C/jQIYdeC8dtzmHUeoYtv6Qle4hjtQ6Uj2e1tMFI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FxOAo69Kqq7DrFtnSUqdIXNpWjyqR1hERp5zcY+MUD2FJsm9y68Ob/YpjpzSCwss6
 dZ6n4CPf5Z1vJ9I/rQ8rvMwwvM2bvagqfI9JPrnVit/Pw487PI8RNFyjJmN60XBc3w
 aXY8zxaKFtSnO9LSCy9VgDnmMdwr2gq7U0K7mnjB7IT/1vVciK/UG+B2pdNDsixgjO
 yzfKOwQQxl83ok9cNxearKAi/akeKisulfWT6B8zmWwCR2Jutw1w1bS3ckDTAItwgs
 CsYYnELlNoitijUWyyaa7UXyodQ5/UKC5R9Pqo4ZnUhiyMIqkYSpYdD09pF2I5LbZj
 YdfZzm8bJRdpg==
From: sashiko-bot@kernel.org
Subject: Re: [V3] drm/xe: Skip clearing purged page-table BOs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908114545.915049-2-tejas.upadhyay@intel.com>
References: <20260908114545.915049-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 12:04:58 +0000
Message-Id: <20260908120458.6D42F1F00A3A@smtp.kernel.org>
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

New issues:
- [Critical] Early release of xe_svm_notifier_lock in xe_vm_close allows MM=
U notifiers to unmap memory while GPU page tables are still valid, leading =
to a physical memory use-after-free.

Pre-existing issues:
- [High] Missing NULL check for pagetable BO `vmap` in `xe_pt_zap_ptes_entr=
y` leads to a crash if the BO is purged.
--

commit 70efaa606c2633943ad2267dfc95c288525971af
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Skip clearing purged page-table BOs

VRAM page offlining can clear a page-table BO's vmap before VM teardown
calls xe_pt_clear(). Check for a purged BO under its dma-resv lock before
writing to the mapping.

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5d990c1c3740a..426e8a29c755a 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -236,9 +236,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, stru=
ct llist_head *deferred)
>   */
>  void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
>  {
> -	struct iosys_map *map =3D &pt->bo->vmap;
> +	struct xe_bo *bo =3D pt->bo;
> =20
> -	xe_map_memset(xe, map, 0, 0, SZ_4K);
> +	xe_bo_assert_held(bo);
> +	if (!iosys_map_is_null(&bo->vmap))
> +		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does xe_pt_zap_ptes_entry()
in drivers/gpu/drm/xe/xe_pt.c have a similar regression with missing NULL
checks for the pagetable BO vmap?

Looking at xe_pt_zap_ptes_entry(), it accesses &xe_child->bo->vmap without
validating it:

	xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child->bo->vmap,
		      offset * sizeof(u64), 0,
		      (end_offset - offset) * sizeof(u64));

This is reachable via xe_vm_invalidate_vma(), which only holds the user BO's
dma_resv lock or the SVM notifier_lock as seen in xe_pt_zap_ptes():

	else if (xe_vma_is_userptr(vma))
		lockdep_assert_held(&xe_vma_vm(vma)->svm.gpusvm.notifier_lock);

Since the page-table BO's dma_resv lock (the VM dma_resv lock) is not held,
could a concurrent VRAM page offlining event purge the page-table BO
and clear its vmap, leading to a NULL pointer dereference when
xe_map_memset() executes?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9e71567b27cc7..e77ff3cf3ca38 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1876,10 +1876,13 @@ static void xe_vm_close(struct xe_vm *vm)
>  	bound =3D drm_dev_enter(&xe->drm, &idx);
> =20
>  	down_write(&vm->lock);
> +	xe_vm_lock(vm, false);
> +
>  	if (xe_vm_in_fault_mode(vm))
>  		xe_svm_notifier_lock(vm);
> -
>  	vm->size =3D 0;
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_notifier_unlock(vm);

[Severity: Critical]
Does moving xe_svm_notifier_unlock() here create a race condition with MMU
notifiers?

If xe_svm_notifier_unlock() is called here before the GPU page tables are
cleared and the TLB is invalidated, a concurrent MMU notifier like
xe_svm_invalidate() could execute.

Since vm->size is 0, xe_svm_invalidate() in drivers/gpu/drm/xe/xe_svm.c
will check:

	if (xe_vm_is_closed(vm))
		goto range_notifier_event_end;

This check evaluates to true, skipping the zapping of GPU page tables and
allowing the physical memory to be freed prematurely. Could the GPU then
still read and write to these freed physical pages (which might be
reallocated to other processes) until xe_vm_close() finally clears the
page tables?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908114545.9150=
49-2-tejas.upadhyay@intel.com?part=3D1
