Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC67606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6LTqm0u
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8297D10E466;
	Tue, 27 Oct 2026 18:49:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FDA10E466
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 18:49:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4D60160232;
 Tue, 27 Oct 2026 18:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CFD1F01825;
 Tue, 27 Oct 2026 18:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793126944;
 bh=d35IqGwcztY2rBIXNDmUuESQhr6SXpGkVzV7BbxWinI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=j6LTqm0u+Wtvg71wsjBH+Cet2d6oHsLT4f+A5zJBRo9fveRb1dr1B0nxXXvi9x2XN
 5L3ZUODngcep4yYnqP9KCtG0+1G78jzFUllHVB1OKPjFA1llqOb+58pFspCIVnoGNQ
 yGdRSPiZmgGIU4z2s/MxLCeFZyAsoqzwtTSwyrJfYbU/gxdO20SL7c7we0DXJlTCqO
 SKAUXGPWvA3TSsOEVocZ50wN/+u/TMLGrRUQaBAIAWRWzi3PJsuEZia1XO0lZu6nrP
 Ak8uhjZnPVLqJP3i30sCnGxJnNUjLPBjl3hzBk2K5j4/HKUYR5SbXrRdHkgBZ7Ft8w
 4coka4UQTJQlg==
Message-ID: <sashiko-outbox-187040@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] drm/xe: Bump the LRU on a successful page fault
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261027183638.1031299-3-matthew.brost@intel.com>
References: <20261027183638.1031299-1-matthew.brost@intel.com>
 <20261027183638.1031299-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 18:49:03 +0000
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
- [Medium] drm/xe: xe_vm_bump_lru() in xe_pagefault_handle_vma() misses pri=
vate BOs
--

commit a6d00986d9f12583f84415e17fe0f940a218b2e7
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Bump the LRU on a successful page fault

This commit calls xe_vm_bump_lru() in xe_pagefault_handle_vma() after a
successful VMA rebind so that faulted BOs are moved to the tail of the TTM
LRU.

> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pa=
gefault.c
> index 5247321c805ec..3719258aa6f09 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -221,6 +221,8 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, =
struct xe_vma *vma,
>  				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_REBIND);
>  				break;
>  			}
> +
> +			xe_vm_bump_lru(vm, &exec);

[Severity: Medium]
Does xe_vm_bump_lru() actually move VM-private BOs to the LRU tail when
handling a page fault?

When a VM-private BO is created for a fault-mode VM in
__xe_bo_create_locked(), it is not added to vm->lru_bulk_move:

drivers/gpu/drm/xe/xe_bo.c:__xe_bo_create_locked() {
	...
	bo =3D xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
			       vm && !xe_vm_in_fault_mode(vm) &&
			       flags & XE_BO_FLAG_USER ?
			       &vm->lru_bulk_move : NULL, size,
			       cpu_caching, type, flags, NULL, exec);
	...
}

Because page faults only occur on fault-mode VMs, vm->lru_bulk_move is empty
and ttm_lru_bulk_move_tail(&vm->lru_bulk_move) in xe_vm_bump_lru() is a
no-op.

Furthermore, during xe_pagefault_begin() -> xe_vm_lock_vma(), only external
BOs (!bo->vm) are locked individually in exec, whereas VM-private BOs share
the VM's reservation object and only lock xe_vm_obj(vm):

drivers/gpu/drm/xe/xe_vm.c:xe_vm_lock_vma() {
	...
	err =3D drm_exec_lock_obj(exec, xe_vm_obj(vm));
	if (!err && bo && !bo->vm)
		err =3D drm_exec_lock_obj(exec, &bo->ttm.base);
	...
}

When xe_vm_bump_lru() then iterates over the locked objects in exec, it ski=
ps
xe_vm_obj(vm):

drivers/gpu/drm/xe/xe_vm.c:xe_vm_bump_lru() {
	...
	drm_exec_for_each_locked_object(exec, obj) {
		struct xe_bo *bo;

		/* The VM's dummy resv object, not a BO. */
		if (obj =3D=3D xe_vm_obj(vm))
			continue;
	...
}

If a faulted VM-private BO's backing store is already in a compatible
placement so that ttm_bo_validate() returns early without moving the resour=
ce,
will the BO's TTM LRU position remain completely unchanged here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027183638.1031=
299-1-matthew.brost@intel.com?part=3D2
