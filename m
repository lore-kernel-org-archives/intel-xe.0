Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B5606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEdY9p3q
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB69210E494;
	Tue, 27 Oct 2026 19:00:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D6610F7A6
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 19:00:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B819E60142;
 Tue, 27 Oct 2026 19:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4556D1F01825;
 Tue, 27 Oct 2026 19:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793127607;
 bh=0IRtt+stidi2nkZPLJJ8twWbwS8976KKwnqTQLKyvCk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=kEdY9p3qKLj4em56gEkBP7V4r3ImIpfJKahg9y9tlN3M9CkKew/3leI/Rlf02U1dB
 y7BeVBN71fk+csEhyx78MXUQNPdBpGpsJv38xSl4WQVRB2SuUyOEJQo2eXkujOmaI6
 6rKVKFs6nqIisuXQTNlDKDsA8lXI3m4MyAm0csUjJGbV2j39T5tCJdwwHeOD2Sh0n9
 ifUpiNEDqrYNSvCV9JhGfaweKEVszaRVd0DdWrzKRk3a6vQy5tJLkAgyDHWPSXntGy
 QWC4+iWUdbKVOOSLZ26HV4SF5SIR76itIYuEV0Eakvu+WqMukRq0FUmDCSeX8lUS/v
 w+v1nS4lL1Ccg==
Message-ID: <sashiko-outbox-187045@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] drm/xe: Add a minimum age gate to the shrinker
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261027183638.1031299-6-matthew.brost@intel.com>
References: <20261027183638.1031299-1-matthew.brost@intel.com>
 <20261027183638.1031299-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 19:00:06 +0000
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
- [Medium] drm/xe: fault-mode VM-private BOs are not stamped or aged in xe_=
vm_bump_lru()
--

commit 169ae3636dd7a7f18b87dc4d22d9738909855961
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add a minimum age gate to the shrinker

This commit adds a per-device shrinker_min_age_ms sysfs attribute and
timestamps buffer objects on LRU updates so the shrinker avoids backing up
recently used objects. Buffer objects in a VM's bulk move use the VM-wide
timestamp updated in xe_vm_bump_lru(), while other buffer objects use their
own timestamp updated in xe_bo_move() and xe_bo_bump_lru_locked().

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index ba16b260dbcb7..59874f9a1ed7a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1357,9 +1357,92 @@ static int xe_bo_move(struct ttm_buffer_object *tt=
m_bo, bool evict,

[ ... ]

> +bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned long =
min_age)
> +{
> +	struct xe_bo *xe_bo;
> +	unsigned long stamp;
> +
> +	if (!min_age || bo->resource->mem_type =3D=3D XE_PL_SYSTEM ||
> +	    !xe_bo_shrink_backup_candidate(bo))
> +		return false;
> +
> +	xe_bo =3D ttm_to_xe_bo(bo);
> +	if (bo->bulk_move && xe_bo->vm)
> +		stamp =3D READ_ONCE(xe_bo->vm->lru_stamp);
> +	else
> +		stamp =3D READ_ONCE(xe_bo->lru_stamp);
> +
> +	return stamp && time_before(jiffies, stamp + min_age);
> +}

[Severity: Medium]
Does this leave VM-private buffer objects in fault-mode VMs with a stale
lru_stamp when they are faulted and rebound through xe_vm_bump_lru()?

In drivers/gpu/drm/xe/xe_bo.c, __xe_bo_create_locked() initializes
VM-private user buffer objects in fault-mode VMs with bo->vm set, resv set
to xe_vm_resv(vm), and bulk_move set to NULL:

drivers/gpu/drm/xe/xe_bo.c:__xe_bo_create_locked() {
	...
	bo =3D xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
			       vm && !xe_vm_in_fault_mode(vm) &&
			       flags & XE_BO_FLAG_USER ?
			       &vm->lru_bulk_move : NULL, size,
			       cpu_caching, type, flags, NULL, exec);
	...
}

When a GPU page fault is handled via
xe_pagefault_handle_vma()->xe_pagefault_begin()->xe_vm_lock_vma(),
drivers/gpu/drm/xe/xe_vm.c only adds the buffer object to drm_exec when
bo->vm is NULL, since VM-private objects share xe_vm_obj(vm)'s reservation:

drivers/gpu/drm/xe/xe_vm.c:xe_vm_lock_vma() {
	...
	err =3D drm_exec_lock_obj(exec, xe_vm_obj(vm));
	if (!err && bo && !bo->vm)
		err =3D drm_exec_lock_obj(exec, &bo->ttm.base);
	...
}

When xe_pagefault_handle_vma() then calls xe_vm_bump_lru(vm, &exec),
vm->lru_stamp is updated, but drm_exec_for_each_locked_object(exec, obj)
only sees xe_vm_obj(vm) (which is skipped) and any external objects, so
xe_bo_bump_lru_locked(bo) is never called for VM-private objects.

When the shrinker later calls xe_bo_shrink_too_young(), bo->bulk_move is
NULL for fault-mode VM-private objects, so it reads xe_bo->lru_stamp
rather than xe_bo->vm->lru_stamp. If the object was already resident in
XE_PL_TT when faulted (for example, on another tile or after VMA
invalidation), won't its age remain stuck at the initial xe_bo_move()
timestamp rather than reflecting the fault activity?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027183638.1031=
299-1-matthew.brost@intel.com?part=3D5
