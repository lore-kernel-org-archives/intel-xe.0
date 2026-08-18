Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3912C5DF7E
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 11:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC9210E02B;
	Tue, 18 Aug 2026 11:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C5fxwR7N";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D8910E02B
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 11:01:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B9F68601DE;
 Tue, 18 Aug 2026 11:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEDC1F000E9;
 Tue, 18 Aug 2026 11:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787050895;
 bh=JfA3Vvbr9vzSLxg0HdX4t+HHdgoNmbuH5AUmzLUWQ5U=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=C5fxwR7N9O7K2AzuQ7o122p0KiqcQJc1kQBpmcZvAtwqjg8Xu2SI5dQIF/2YZLkhM
 0P4/nx2UN6wkhPxhhVu5n3BE6LgKTg/+wKnUR0Uzz94VjhAqubb2fXP8eMN9UP4dRU
 xUX+aErk2mhkDEShq86kUMlXeW8stMlv73pjkCy1HuPXBVQxlBBz03OiSp9DuIoJtr
 drpltL7cbCm7zb5PWjqTjoT42ftyLUegl5C7aqTKQlH26o7Nb1hF8vOiDfbB7a3jRH
 eBXZScsM7pNuavkVpn9UHQGbOzIqp8VYLeeXfCM4nYClMRIvusMe0AxtNTawcy3IQZ
 6qFDxBPMRckhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V17 08/12] drm/xe/vram: Add VRAM page offline fault handler
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818104055.3833974-22-tejas.upadhyay@intel.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
 <20260818104055.3833974-22-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 11:01:34 +0000
Message-Id: <20260818110135.4EEDC1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] Asynchronous queue termination during BO page purging causes G=
PU use-after-free for LRC and Page Table BOs.
- [High] Forceful unbalanced unpinning of a BO without ownership corrupts p=
in count tracking.
- [High] GSMBASE check incorrectly matches valid VRAM addresses on multi-ti=
le devices, causing spurious system resets.
- [High] Dropping vram_mgr->lock before reserving the faulty page introduce=
s a race window allowing duplicate tracking entries and memory corruption.
- [High] Racing with BO destruction returns -ENOENT, triggering an unnecess=
ary System Reset (SBR).
- [High] Checking if a user BO is pinned without holding its reservation lo=
ck allows it to be pinned immediately before being purged.
- [High] Missing page alignment for HW-reported faulty addresses causes bud=
dy allocator to fail, preventing page offlining.
- [Medium] The relative VRAM offset is stored in tracking structures and re=
ported in warnings instead of the absolute Device Physical Address (DPA), b=
reaking multi-tile hardware tracking.
- [Medium] The exec_queue and VM ban reasons are not set before killing the=
 queues, leading to incorrect error reporting and telemetry.
--

--- Patch [8]: [PATCH V17 08/12] drm/xe/vram: Add VRAM page offline fault h=
andler ---
commit 5eda8f6c71d41d8599cf1e30faca069cde3189fb
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: drm/xe/vram: Add VRAM page offline fault handler

Add the core VRAM page offlining logic to handle HW-reported faulty
physical addresses.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 5513dc014f3e7..9311aa3728f84 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c

[ ... ]

> @@ -572,3 +578,289 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manag=
er *man)
> +static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> +{
> +	struct ttm_operation_ctx ctx =3D {};
> +	struct xe_exec_queue *q_to_put =3D NULL;
> +	struct xe_exec_queue *q =3D NULL;
> +	struct xe_vm *vm =3D NULL;
> +	u32	flags;
> +	int ret =3D 0;
> +
> +	xe_bo_lock(bo, false);
> +	if (bo->vm)
> +		vm =3D xe_vm_get(bo->vm);
> +	flags =3D bo->flags;
> +	xe_bo_unlock(bo);
> +	/*  Ban VM if BO is PPGTT */
> +	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> +		down_write(&vm->lock);

[Severity: Medium]
Will this lead to incorrect error reporting and telemetry?

When killing the PPGTT VM here, its ban reasons are not updated to include
DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE. This could cause the system logs
and userspace APIs to report a generic context reset rather than a hardware
memory fault mitigation event.

> +		xe_vm_kill(vm, true);
> +		up_write(&vm->lock);
> +	}
> +	if (vm)
> +		xe_vm_put(vm);
> +
> +	xe_bo_lock(bo, false);
> +	q =3D READ_ONCE(bo->q);
> +	/*  Ban exec queue if BO is lrc */
> +	if (q && xe_exec_queue_get_unless_zero(q)) {
> +		/* ban queue */
> +		q_to_put =3D q;
> +	}
> +
> +	if (bo->purgeable.state =3D=3D XE_MADV_PURGEABLE_PURGED) {
> +		/* Already purged by shrinker during unlocked window =E2=80=94 nothing=
 to do */
> +		xe_bo_unlock(bo);
> +		goto out;
> +	}
> +
> +	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> +	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
> +	if (xe_bo_is_pinned(bo))
> +		xe_bo_unpin(bo);

[Severity: High]
Does this forceful unpinning without ownership corrupt pin count tracking?

When the offline handler processes a pinned BO, it unconditionally calls
xe_bo_unpin(bo), decreasing the pin count without taking ownership of the p=
in.
When the original legitimate owner later attempts to unpin the BO, the pin
count will underflow, triggering xe_assert(xe, xe_bo_is_pinned(bo)) inside
xe_bo_unpin() and resulting in a kernel crash.

> +	ret =3D xe_ttm_bo_purge(&bo->ttm, &ctx);
> +	xe_bo_unlock(bo);
> +
> +out:
> +	if (q_to_put) {

[Severity: Critical]
Does this sequence cause a GPU use-after-free for LRC BOs?

xe_ttm_bo_purge() synchronously frees the VRAM backing pages into the buddy
allocator before the actively running GPU queue is explicitly halted here.
Since LRC BOs are actively accessed by running engines without per-job
execution fences, the hardware may still be running and writing to the
now-freed pages when they are reallocated.

[Severity: Medium]
Also, similar to the VM kill above, is it intentional that the exec queue is
killed here without having its ban_reason updated to
DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE?

> +		xe_exec_queue_kill(q_to_put);
> +		xe_exec_queue_put(q_to_put);
> +	}
> +
> +	return ret;
> +}

[ ... ]

> +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 ad=
dr,
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> +{
> +	struct xe_ttm_vram_offline_resource *nentry;
> +	struct ttm_buffer_object *tbo =3D NULL;
> +	struct xe_bo *pbo_to_put =3D NULL;
> +	struct gpu_buddy_block *block;
> +	u64 size =3D SZ_4K;
> +	int ret =3D 0;
> +
> +	scoped_guard(mutex, &vram_mgr->lock) {
> +		if (xe_ttm_vram_page_already_processed(vram_mgr, addr))
> +			return -EEXIST;
> +		block =3D gpu_buddy_allocated_addr_to_block(mm, addr);
> +		if (WARN_ON(IS_ERR(block)))
> +			return PTR_ERR(block);
> +
> +		nentry =3D kzalloc_obj(*nentry);
> +		if (!nentry)
> +			return -ENOMEM;
> +		INIT_LIST_HEAD(&nentry->blocks);
> +		nentry->status =3D XE_PAGE_RESERVE_PENDING;
> +		nentry->addr =3D addr;

[Severity: Medium]
Will this store the relative offset instead of the absolute Device Physical
Address?

The entry point xe_ttm_vram_handle_addr_fault() translates the absolute DPA
to a relative offset (addr - vr->dpa_base) before passing it to this functi=
on.
Storing the relative offset here means debug messages and FW offlining
mechanisms reading this struct will consume the wrong physical address.

> +
> +		if (block) {
> +			struct xe_bo *pbo;
> +
> +			if (!block->private) {
> +				/* Race: another thread just reserved this block */
> +				kfree(nentry);
> +				return -EEXIST;
> +			}
> +			tbo =3D block->private;
> +			pbo =3D ttm_to_xe_bo(tbo);
> +
> +			/* Get reference safely - BO may have zero refcount */
> +			if (!xe_bo_get_unless_zero(pbo)) {
> +				kfree(nentry);
> +				return -ENOENT;
> +			}

[Severity: High]
Does returning -ENOENT here trigger an unnecessary System Reset?

If a hardware memory fault lands on a BO that is concurrently being freed or
destroyed, xe_bo_get_unless_zero() fails and the function returns -ENOENT.
The caller xe_ttm_vram_handle_addr_fault() treats any negative error code
other than -EEXIST or -EOPNOTSUPP as a signal to reset the system. Triggeri=
ng
a system reset because a BO was freed seems inappropriate, since the physic=
al
page will soon become free and can be safely offlined anyway.

> +			/*
> +			 * Critical kernel BO? Best-effort check without resv lock;
> +			 * worst case a concurrent pin causes reset path unnecessarily.
> +			 */
> +			if ((pbo->ttm.type =3D=3D ttm_bo_type_kernel &&
> +			     !(pbo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
> +			    (xe_bo_is_user(pbo) && xe_bo_is_pinned(pbo))) {

[Severity: High]
Could this lockless check lead to purging an actively pinned user BO?

Checking xe_bo_is_pinned(pbo) without holding the BO's reservation lock mea=
ns
a user BO might not be pinned at the time of the check, but could be pinned
by another thread right before xe_ttm_vram_purge_page() locks the BO.
The purge logic will then forcefully unpin and destroy the BO, leaving the
concurrent thread with an invalid, unbacked BO.

> +				kfree(nentry);
> +				pbo_to_put =3D pbo;
> +				drm_err(&xe->drm,
> +					"%s: addr: 0x%llx is critical kernel bo, requesting SBR\n",
> +					__func__, addr);
> +				break;
> +			}
> +			++vram_mgr->n_queued_pages;
> +			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
> +		}
> +	}
> +
> +	/* Deferred put outside lock to avoid recursive deadlock */
> +	if (pbo_to_put) {
> +		xe_bo_put(pbo_to_put);
> +		/* Hint System controller driver for reset with -EIO  */
> +		return -EIO;
> +	}
> +
> +	if (block) {
> +		struct xe_ttm_vram_offline_resource *pos, *n;
> +		struct xe_bo *pbo =3D ttm_to_xe_bo(tbo);
> +
> +		/*
> +		 * Purge BO containing address - reference held from above.
> +		 * Note: brief window between purge (freeing blocks) and re-reserve
> +		 * below. If another allocation claims the block, buddy_alloc fails
> +		 * and the status will be shown as failed reservation.
> +		 */
> +		ret =3D xe_ttm_vram_purge_page(xe, pbo);
> +		xe_bo_put(pbo);
> +		if (ret)
> +			drm_warn(&xe->drm, "Purge failed at addr:0x%llx, ret:%d\n", addr, ret=
);
> +
> +		/* Reserve page at address addr*/
> +		scoped_guard(mutex, &vram_mgr->lock) {
> +			ret =3D xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
> +						      size, size, &nentry->blocks,
> +						      GPU_BUDDY_RANGE_ALLOCATION,
> +						      NULL, &nentry->used_visible_size);
> +			if (ret) {
> +				drm_warn(&xe->drm,
> +					 "Could not reserve page at addr:0x%llx, ret:%d\n",
> +					 addr, ret);
> +				nentry->status =3D XE_PAGE_RESERVE_FAIL;
> +				return ret;
> +			}
> +
> +			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link=
) {
> +				if (pos->addr =3D=3D nentry->addr) {
> +					--vram_mgr->n_queued_pages;
> +					list_del_rcu(&pos->queued_link);
> +					break;
> +				}
> +			}
> +			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +			/* RAS will send command to FW for offlining page based on ret value =
*/
> +			++vram_mgr->n_offlined_pages;
> +			return ret;
> +		}
> +	} else {
> +		struct xe_ttm_vram_offline_resource *pos, *n;
> +
> +		scoped_guard(mutex, &vram_mgr->lock) {
> +			++vram_mgr->n_queued_pages;

[Severity: High]
Does dropping vram_mgr->lock before this point introduce a race window?

When the fault occurs on a free page, the function drops vram_mgr->lock aft=
er
the initial xe_ttm_vram_page_already_processed() check, without adding the =
new
entry to any tracking lists.
Reacquiring the lock here to perform the buddy allocation allows a race whe=
re
another fault for the same address arrives during the lockless window,
resulting in two concurrent buddy allocations for the same physical page and
duplicate list insertions. Normal GPU memory allocation could also claim the
buddy block before it is safely reserved.

> +			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
> +			ret =3D xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
> +						      size, size, &nentry->blocks,
> +						      GPU_BUDDY_RANGE_ALLOCATION,
> +						      NULL, &nentry->used_visible_size);
> +			if (ret) {
> +				drm_warn(&xe->drm,
> +					 "Could not reserve page at addr:0x%llx, ret:%d\n",
> +					 addr, ret);
> +				nentry->status =3D XE_PAGE_RESERVE_FAIL;
> +				return ret;
> +			}

[ ... ]

> +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_devic=
e *xe, u64 addr)
> +{
> +	u64 raw_offset =3D xe_mmio_read64_2x32(&xe_device_get_root_tile(xe)->mm=
io, GSMBASE);
> +	/* force a 4K (4096 bytes) page alignment */
> +	u64 gsmbase_dpa =3D raw_offset & ~(u64)(PAGE_SIZE - 1);
> +	struct xe_vram_region *vr;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	/* Addr from GSM? */
> +	if (addr >=3D gsmbase_dpa)
> +		/* Return NULL so the caller can request reset (SBR) */
> +		return NULL;

[Severity: High]
Can this GSMBASE check incorrectly match valid VRAM addresses on multi-tile
devices?

In a multi-tile configuration, the VRAM device physical address (DPA) of
secondary tiles (e.g., Tile 1) is typically mapped higher than the root til=
e's
VRAM and GSM base. A valid hardware memory fault on a secondary tile will h=
ave
addr >=3D gsmbase_dpa evaluate to true. The function then falsely identifie=
s the
fault as occurring in Graphics Stolen Memory and returns NULL, triggering an
unnecessary System Reset instead of offlining the faulty page.

> +
> +	for_each_tile(tile, xe, id) {
> +		vr =3D tile->mem.vram;
> +		if (addr >=3D vr->dpa_base &&
> +		    addr < vr->dpa_base + vr->usable_size)
> +			return vr;
> +	}
> +
> +	/*
> +	 * Return an explicit error pointer so the caller knows the addr
> +	 * is invalid and should be ignored, NOT SBR.
> +	 */
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +
> +/**
> + * xe_ttm_vram_handle_addr_fault - Handle vram physical address error fl=
aged
> + * @xe: pointer to parent device
> + * @addr: physical faulty address
> + *
> + * Handle the physcial faulty address error on specific tile.
> + *
> + * Returns 0 for success, negative error code otherwise as follow:
> + * * %-EIO - critical BO or address outside any VRAM region; next action=
 is reset.
> + * * %-EOPNOTSUPP - log-only policy or unknown address; no further actio=
n.
> + * * %-ENOMEM - allocation failure; next action is reset.
> + * * %-ENXIO - address not found in buddy; next action is reset.
> + * * %-EEXIST - address already processed; no further action.
> + * * % Any other negative error - next action is reset.
> + */
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
> +{
> +	struct xe_ttm_vram_mgr *vram_mgr;
> +	struct xe_vram_region *vr;
> +	struct gpu_buddy *mm;
> +
> +	vr =3D xe_ttm_vram_addr_to_region(xe, addr);
> +	if (IS_ERR(vr)) {
> +		/*
> +		 * The addr is outside VRAM and GSM.
> +		 * Log a debug message if needed, and safely exit/ignore.
> +		 */
> +		drm_dbg(&xe->drm, "Address %llx is out of bounds, ignoring fault.\n", =
addr);
> +		return PTR_ERR(vr);
> +	}
> +	if (!vr) {
> +		drm_err(&xe->drm, "%s:%d GSM addr:%llx error requesting SBR\n",
> +			__func__, __LINE__, addr);
> +		/* Hint System controller driver for reset with -EIO  */
> +		return -EIO;
> +	}
> +	vram_mgr =3D &vr->ttm;
> +	mm =3D &vram_mgr->mm;
> +
> +	/* Reserve page at address */
> +	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_m=
gr, mm);
> +}

[Severity: High]
Does the missing page alignment for HW-reported faulty addresses cause the
buddy allocator to fail?

Hardware RAS components report faults using exact, unaligned byte addresses.
Since the unaligned address is passed directly as 'start' for a 4K buddy
allocation in xe_ttm_vram_buddy_alloc(), the unaligned range [start, start+=
4096)
spans two actual physical pages. The buddy allocator will fail to find a fu=
lly
contained 4K block and return -ENOSPC, preventing page offlining.
Should ALIGN_DOWN(addr, PAGE_SIZE) be applied before passing it down?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818104055.3833=
974-14-tejas.upadhyay@intel.com?part=3D8
