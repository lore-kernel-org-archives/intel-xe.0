Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3750606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqg4LTmQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A8D10E494;
	Tue, 27 Oct 2026 18:59:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E052C10E469
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 18:59:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0565E60211;
 Tue, 27 Oct 2026 18:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932FF1F01825;
 Tue, 27 Oct 2026 18:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793127556;
 bh=NCp3vQLKFXfEuq6tNhtn8DFURzw1qUemFxIdPbbzW/8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=eqg4LTmQCTef/zHF2JpUPPDpkaL99E2KSWmmvHNli1oaox0Gkehea6s4CSgq00Xyn
 3RM6qGj+RWqyUDDR2ok5DUqltxCeOurfWm1YhzmSYISS6iM9YlDUnLzQzp84Qc8Q1Y
 yGkpQJNiF4teO5vzLd0WZGkc5ZlpmZpO09XLYj59DFSCRCUA7iWlfLEt6n0xaygipy
 Kh46ClOVACKMM/0X9uHSsvZmCr+yhPkeS1AxU72J3Cv4lQVSnKZH1CaGj8SRclynou
 Bvb6S6ygNQn7U6/lVwnxtdLmKmaLrroUO4PebekRKKQG92QMWr4bkxERQQfMRkTGjZ
 n2zzRQnoa5ZAA==
Message-ID: <sashiko-outbox-187044@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] drm/xe: Bump the LRU of every BO an exec touches
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261027183638.1031299-2-matthew.brost@intel.com>
References: <20261027183638.1031299-1-matthew.brost@intel.com>
 <20261027183638.1031299-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 18:59:16 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: xe_vm_bump_lru() never visits private BOs in drm_exec lo=
op
--

commit 035844b594106f3b21b07d586a5574fd0b1e0af5
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Bump the LRU of every BO an exec touches

This commit updates xe_vm_bump_lru() to replace the drm_gpuvm_is_extobj()
check in its drm_exec_for_each_locked_object() loop with explicit checks
skipping xe_vm_obj(vm) and BOs whose bulk_move matches vm->lru_bulk_move,
intending to bump non-bulk-moved private BOs such as those in fault-mode VM=
s.

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1ee72721b2ce3..2b84721804a77 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -426,10 +426,8 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct d=
rm_exec *exec,
>   * @vm: The vm for which we are bumping LRUs.
>   * @exec: The struct drm_exec with the locked GEM objects.
>   *
> - * Move the VM's private BOs, and all external objects locked by @exec,
> - * to the LRU tail. Private BOs are moved in bulk using @vm's
> - * &xe_vm.lru_bulk_move. External objects, which may be shared with other
> - * VMs, are not part of that bulk move and are bumped individually.
> + * Move all BOs locked by @exec to the LRU tail. Those covered by @vm's
> + * &xe_vm.lru_bulk_move are moved in bulk, the rest individually.
>   */
>  void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
>  {
> @@ -439,10 +437,17 @@ void xe_vm_bump_lru(struct xe_vm *vm, struct drm_ex=
ec *exec)
>  	spin_lock(lru_lock);
>  	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>  	drm_exec_for_each_locked_object(exec, obj) {
> -		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
> +		struct xe_bo *bo;
> +
> +		/* The VM's dummy resv object, not a BO. */
> +		if (obj =3D=3D xe_vm_obj(vm))
> +			continue;
> +
> +		bo =3D gem_to_xe_bo(obj);
> +		if (bo->ttm.bulk_move =3D=3D &vm->lru_bulk_move)
>  			continue;
> =20
> -		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)->ttm);
> +		ttm_bo_move_to_lru_tail(&bo->ttm);

[Severity: Medium]
Can drm_exec_for_each_locked_object() in xe_vm_bump_lru() ever visit a
private BO of the VM?

In drivers/gpu/drm/xe/xe_bo.c:__xe_bo_create_locked(), private BOs (where
vm is non-null) are initialized with xe_vm_resv(vm) as their reservation
object:

	bo =3D xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
			       vm && !xe_vm_in_fault_mode(vm) &&
			       flags & XE_BO_FLAG_USER ?
			       &vm->lru_bulk_move : NULL, size,
			       cpu_caching, type, flags, NULL, exec);

Because private BOs share the VM's dma_resv, drm_gpuvm_is_extobj() is false
and they are never added to gpuvm->extobj.list.

When callers prepare the drm_exec context before calling xe_vm_bump_lru()
(via xe_validation_exec_lock() -> drm_gpuvm_exec_lock() in xe_exec_ioctl()
or xe_preempt_work_begin() in preempt_rebind_work_func()),
drm_gpuvm_prepare_vm() only locks xe_vm_obj(vm) and
drm_gpuvm_prepare_objects_locked() only locks external objects from
gpuvm->extobj.list:

	drm_gpuvm_resv_assert_held(gpuvm);
	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
		if (drm_gpuvm_bo_is_zombie(vm_bo))
			continue;

		ret =3D exec_prepare_obj(exec, vm_bo->obj, num_fences);

In addition, even when the follow-up commit a6d00986d9f1 ("drm/xe: Bump the
LRU on a successful page fault") calls xe_vm_bump_lru() from
xe_pagefault_handle_vma(), xe_pagefault_begin() -> xe_vm_lock_vma() only
locks xe_vm_obj(vm) and external BOs:

	err =3D drm_exec_lock_obj(exec, xe_vm_obj(vm));
	if (!err && bo && !bo->vm)
		err =3D drm_exec_lock_obj(exec, &bo->ttm.base);

Since private BOs are never recorded in exec->objects, the loop in
xe_vm_bump_lru() only ever visits xe_vm_obj(vm) and external BOs (where
bo->vm and bo->ttm.bulk_move are always null). Does this mean the
bo->ttm.bulk_move =3D=3D &vm->lru_bulk_move check is unreachable and privat=
e BOs
without a bulk_move (such as fault-mode private BOs or private BOs detached
from bulk_move in xe_gem_object_close()) still never get their LRU bumped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027183638.1031=
299-1-matthew.brost@intel.com?part=3D1
