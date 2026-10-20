Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0BF606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CP0RD3P/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440A110F779;
	Tue, 20 Oct 2026 19:36:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE0610F7A3
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 19:36:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 67D8440ABB;
 Tue, 20 Oct 2026 19:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253071F000C9;
 Tue, 20 Oct 2026 19:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792524966;
 bh=Q8y08mRoNISWD+LJxmUNO9vGXAxjRhn5MQQdUFwQfTE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=CP0RD3P/pFxid/cL2QH26DgsVE+FreAGap6wlaDtZaawwng4qF4A4bUe44EUswaTa
 sxBjAyiag1SCPa+WVdjcHOrEhgArfP72UXFfQAuAtKeAO2SsOZqBu3FpOvwUGfpQgz
 GAyBwNpjeirPso2LBiFIC00LnVMfzbR71TdfXwBh5SbjzCe41jxmpMF7RKJaNNtvop
 o7hbHyMEVmfAYf9GBdSrp5D58rOq2dVSAODve2OIeGnhH5w6qgUof53TxyhcAmNAQH
 U943vV3RAxHr6diC7sTnQ1SnunvxBDzxSbWVPBeBeectmg42+JgkJUqXAlJSnclMK2
 o0TgacT1OD/0g==
Message-ID: <sashiko-outbox-179512@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] drm/xe: Add a minimum age gate to the shrinker
To: "Matthew Brost" <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261020190840.854525-4-matthew.brost@intel.com>
References: <20261020190840.854525-1-matthew.brost@intel.com>
 <20261020190840.854525-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 19:36:05 +0000
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] drm/xe: xe_bo_bump_lru_locked() and xe_bo_shrink_too_young() ignor=
e bulk_move
- [High] drm/xe: xe_bo_move() bumps LRU and stamps VM on VRAM-to-TT evictio=
ns
- [Medium] drm/xe: xe_bo_init_locked() bumps LRU before setting bo->vm and =
bulk_move
- [Medium] drm/xe: xe_bo_shrink_backup_candidate() includes deleted and gho=
st BOs
--

commit 7080502f8c1d2ffa8fd84f4e7f1ff61a34a0e8c9
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add a minimum age gate to the shrinker

This commit adds a per-device shrinker_min_age_ms sysfs attribute and Kconf=
ig
default to prevent the shrinker from backing up buffer objects that were
recently moved into TT or bumped on the LRU during exec. It timestamps BOs =
and
VMs on LRU bumps and skips LRU priorities whose first shrinkable backup
candidate is younger than the configured minimum age.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index bc4801c48fce5..fc8fe68ca0373 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1359,9 +1359,114 @@ static int xe_bo_move(struct ttm_buffer_object *t=
tm_bo, bool evict,
>  		xe_tt_unmap_sg(xe, ttm_bo->ttm);
>  	}
> =20
> +	if (!ret && ttm_bo->resource && ttm_bo->resource->mem_type =3D=3D XE_PL=
_TT)
> +		xe_bo_bump_lru(bo);

[Severity: High]
Should xe_bo_move() avoid calling xe_bo_bump_lru() when evict is true or wh=
en
ttm_bo->resource->placement has TTM_PL_FLAG_TEMPORARY set?

Under VRAM pressure on discrete GPUs, ttm_bo_evict() calls xe_evict_flags(),
which selects tt_placement (XE_PL_TT) for BOs in VRAM or stolen memory:

drivers/gpu/drm/xe/xe_bo.c:xe_evict_flags() {
	...
	switch (tbo->resource->mem_type) {
	case XE_PL_VRAM0:
	case XE_PL_VRAM1:
	case XE_PL_STOLEN:
		*placement =3D tt_placement;
		break;
	...
}

A multihop move in xe_bo_move() can also bounce a BO through a temporary
XE_PL_TT resource with TTM_PL_FLAG_TEMPORARY set.

When a single cold VM-private BO is evicted from XE_PL_VRAM0 or XE_PL_VRAM1
into XE_PL_TT, calling xe_bo_bump_lru() -> xe_bo_bump_lru_locked() updates
bo->lru_stamp and vm->lru_stamp to jiffies and calls
ttm_lru_bulk_move_tail(&vm->lru_bulk_move). Because ttm_lru_bulk_move_tail()
moves the VM's bulk-move ranges across all TTM_NUM_MEM_TYPES and advances
active eviction cursors via ttm_bulk_move_adjust_cursors(), evicting one BO
from VRAM moves all remaining cold VRAM BOs of that VM to the tail of the
VRAM LRU so hotter VMs are evicted instead. It also stamps the evicted BO a=
nd
all XE_PL_TT BOs of that idle VM as freshly used, protecting them from the
shrinker for min_age_ms.

> +
>  	return ret;
>  }
> =20
> +/**
> + * xe_bo_bump_lru_locked() - Bump a BO on the LRU and stamp its last use
> + * @bo: The buffer object, reserved by the caller.
> + *
> + * Move @bo to the tail of its LRU and record the time for the shrinker's
> + * minimum age gate. A BO private to a VM is anchored inside that VM's
> + * bulk-move range, so moving it alone would only reorder it within the
> + * range, leaving it wherever the range sits on the LRU. Move the whole
> + * range to the tail and stamp the VM as well, matching xe_vm_bump_lru().
> + * The caller must hold the device LRU lock.
> + */
> +void xe_bo_bump_lru_locked(struct xe_bo *bo)
> +{
> +	struct xe_vm *vm =3D bo->vm;
> +
> +	if (vm) {
> +		WRITE_ONCE(vm->lru_stamp, jiffies);
> +		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> +	}
> +
> +	WRITE_ONCE(bo->lru_stamp, jiffies);
> +	ttm_bo_move_to_lru_tail(&bo->ttm);
> +}

[Severity: Medium]
What happens when a VM-private user BO is initially created in XE_PL_TT via
__xe_bo_create_locked() -> xe_bo_init_locked() -> ttm_bo_init_reserved() ->
ttm_bo_validate() -> xe_bo_move()?

In xe_bo_init_locked(), ttm_bo_init_reserved() runs before
ttm_bo_set_bulk_move():

drivers/gpu/drm/xe/xe_bo.c:xe_bo_init_locked() {
	...
	err =3D ttm_bo_init_reserved(&xe->ttm, &bo->ttm, type,
				   placement, alignment,
				   &ctx, NULL, resv, xe_ttm_bo_destroy);
	...
	bo->created =3D true;
	if (bulk)
		ttm_bo_set_bulk_move(&bo->ttm, bulk);
	else
		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);

	return bo;
}

And __xe_bo_create_locked() only sets bo->vm =3D vm after xe_bo_init_locked=
()
returns.

When xe_bo_move() calls xe_bo_bump_lru() during ttm_bo_init_reserved(), both
bo->vm and bo->ttm.bulk_move are still NULL, so xe_bo_bump_lru_locked() only
stamps bo->lru_stamp and moves the new BO to the LRU tail without updating
vm->lru_stamp or calling ttm_lru_bulk_move_tail(&vm->lru_bulk_move).

Immediately afterward in xe_bo_init_locked(), ttm_bo_set_bulk_move() calls
ttm_lru_bulk_move_add() -> ttm_lru_bulk_move_pos_tail(), which executes
list_move(&res->lru.link, &pos->last->lru.link) if the VM already has BOs in
(XE_PL_TT, XE_BO_PRIORITY_NORMAL). That pulls the newly stamped young BO
backward from the LRU tail to the end of the VM's existing bulk-move range.
If that range sits near the head of the XE_PL_TT LRU ahead of older BOs from
other VMs, the shrinker can encounter the young BO near the head of the list
and call ttm_bo_lru_cursor_skip_priority(), skipping older cold BOs behind
the VM's range.

[ ... ]

> +/**
> + * xe_bo_shrink_backup_candidate() - Whether the shrinker may back up a =
BO
> + * @bo: The TTM buffer object, reserved by the caller.
> + *
> + * A BO is a backup candidate if backing it up is the only way to reclai=
m it.
> + * BOs advised DONTNEED, which sit at XE_BO_PRIORITY_LOW, and purgeable =
ones
> + * are not: their pages are simply dropped, which is cheap, and they are
> + * accounted to the purgeable shrinker. Neither are BOs whose tt isn't
> + * TTM_TT_FLAG_EXTERNAL_MAPPABLE, which xe_bo_shrink() rejects outright.
> + *
> + * Return: true if @bo would be backed up by a non-purge shrink pass.
> + */
> +bool xe_bo_shrink_backup_candidate(struct ttm_buffer_object *bo)
> +{
> +	struct xe_ttm_tt *xe_tt;
> +
> +	if (!bo->ttm || !(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) =
||
> +	    bo->priority <=3D XE_BO_PRIORITY_LOW)
> +		return false;
> +
> +	xe_tt =3D container_of(bo->ttm, struct xe_ttm_tt, ttm);
> +
> +	return !xe_tt->purgeable;
> +}

[Severity: Medium]
Could xe_bo_shrink_backup_candidate() misclassify non-xe ghost BOs or delet=
ed
BOs awaiting delayed_delete that xe_bo_shrink() purges rather than backs up?

In xe_bo_shrink(), both non-xe BOs and xe_bo objects whose GEM refcount has
reached zero are purged via xe_bo_shrink_purge():

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
	...
	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
		return xe_bo_shrink_purge(ctx, bo, scanned);
	...
}

When a recently stamped user BO is freed while busy (or with
want_init_on_free() enabled) via xe_gem_object_free() -> ttm_bo_fini() ->
ttm_bo_release(), its GEM refcount is zero and bo->deleted is true while it
remains on man->lru[XE_BO_PRIORITY_NORMAL] awaiting delayed_delete. Once its
fences signal before the delayed_delete worker runs, ttm_bo_shrink_suitable=
()
returns true. Because neither xe_bo_shrink_backup_candidate() nor
xe_bo_shrink_too_young() checks bo->deleted or kref_read(&bo->base.refcount=
),
xe_bo_shrink_too_young() treats the freed BO as a young backup candidate,
preventing __xe_shrinker_walk() from purging it and causing both
__xe_shrinker_walk() and xe_shrinker_lru_young() to skip the rest of the
priority via ttm_bo_lru_cursor_skip_priority().

Additionally, because xe_bo_shrink_backup_candidate() does not check
xe_bo_is_xe_bo(bo), if xe_shrinker_lru_young() encounters a non-xe TTM ghost
BO at the head of a priority list, it treats the ghost BO as that priority's
first backup candidate and immediately returns false (since
xe_bo_shrink_too_young() returns false for !xe_bo_is_xe_bo(bo)) without
inspecting the first real backup candidate in that priority.

> +
> +/**
> + * xe_bo_shrink_too_young() - Whether a BO was used too recently to shri=
nk
> + * @bo: The TTM buffer object, reserved by the caller.
> + * @min_age: Minimum age in jiffies. 0 disables the check.
> + *
> + * The age is taken from the later of the BO's own &xe_bo.lru_stamp and,=
 for
> + * user BOs private to a VM, the VM's &xe_vm.lru_stamp.
> + *
> + * BOs that the shrink walk would not back up anyway are never considered
> + * young: non-xe BOs and everything rejected by
> + * xe_bo_shrink_backup_candidate(). Neither are BOs in XE_PL_SYSTEM: the=
y are
> + * not GPU mapped, hence not part of a working set, and must be moved ba=
ck to
> + * TT, refreshing the stamp, before use.
> + *
> + * Return: true if @bo was touched less than @min_age jiffies ago.
> + */
> +bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned long =
min_age)
> +{
> +	struct xe_bo *xe_bo;
> +	unsigned long stamp;
> +
> +	if (!min_age || !xe_bo_is_xe_bo(bo) ||
> +	    bo->resource->mem_type =3D=3D XE_PL_SYSTEM ||
> +	    !xe_bo_shrink_backup_candidate(bo))
> +		return false;
> +
> +	xe_bo =3D ttm_to_xe_bo(bo);
> +	stamp =3D READ_ONCE(xe_bo->lru_stamp);
> +	if (xe_bo->vm && xe_bo_is_user(xe_bo)) {
> +		unsigned long vm_stamp =3D READ_ONCE(xe_bo->vm->lru_stamp);
> +
> +		if (vm_stamp && (!stamp || time_after(vm_stamp, stamp)))
> +			stamp =3D vm_stamp;
> +	}
> +
> +	return stamp && time_before(jiffies, stamp + min_age);
> +}

[Severity: High]
Should xe_bo_bump_lru_locked() and xe_bo_shrink_too_young() check
bo->ttm.bulk_move instead of bo->vm?

There are two cases where a user BO has xe_bo->vm !=3D NULL and
XE_BO_FLAG_USER set, but bo->ttm.bulk_move is NULL:

1. In __xe_bo_create_locked(), private user BOs in a fault-mode VM
(xe_vm_in_fault_mode(vm)) are created with bulk =3D NULL while bo->vm =3D v=
m is
still assigned:

drivers/gpu/drm/xe/xe_bo.c:__xe_bo_create_locked() {
	...
	bo =3D xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
			       vm && !xe_vm_in_fault_mode(vm) &&
			       flags & XE_BO_FLAG_USER ?
			       &vm->lru_bulk_move : NULL, size,
			       cpu_caching, type, flags, NULL, exec);
	...
	bo->vm =3D vm;
}

2. In xe_gem_object_close(), closing the GEM handle of a private user BO th=
at
remains mapped in a non-fault-mode VM clears bo->ttm.bulk_move while leaving
bo->vm set:

drivers/gpu/drm/xe/xe_bo.c:xe_gem_object_close() {
	struct xe_bo *bo =3D gem_to_xe_bo(obj);

	if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
		xe_assert(xe_bo_device(bo), xe_bo_is_user(bo));

		xe_bo_lock(bo, false);
		ttm_bo_set_bulk_move(&bo->ttm, NULL);
		xe_bo_unlock(bo);
	}
}

Non-user VM BOs such as XE_BO_FLAG_PAGETABLE BOs also have bo->vm =3D=3D vm=
 and
bo->ttm.bulk_move =3D=3D NULL.

Whenever any BO of that VM moves into XE_PL_TT (calling xe_bo_move() ->
xe_bo_bump_lru() -> xe_bo_bump_lru_locked()) or when xe_vm_bump_lru() runs =
on
exec, vm->lru_stamp is updated to jiffies. However,
ttm_lru_bulk_move_tail(&vm->lru_bulk_move) only moves BOs attached to
vm->lru_bulk_move, and the loop in xe_vm_bump_lru() skips private BOs becau=
se
drm_gpuvm_is_extobj() is false when obj->resv =3D=3D drm_gpuvm_resv(&vm->gp=
uvm).

As a result, detached or fault-mode user BOs with bo->ttm.bulk_move =3D=3D =
NULL
are never moved to the LRU tail and stay at the oldest head of
man->lru[XE_BO_PRIORITY_NORMAL], yet xe_bo_shrink_too_young() gives them the
fresh vm->lru_stamp. When xe_shrinker_lru_young() or __xe_shrinker_walk() in
drivers/gpu/drm/xe/xe_shrinker.c inspects the head of
man->lru[XE_BO_PRIORITY_NORMAL], it sees the un-moved cold BO at the head as
young and calls ttm_bo_lru_cursor_skip_priority(&curs), skipping the entire
XE_BO_PRIORITY_NORMAL list across all VMs on the device.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020190840.8545=
25-1-matthew.brost@intel.com?part=3D3
