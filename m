Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E816C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBC989233;
	Wed,  2 Sep 2026 16:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gwBSe/Ul";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B95F10F2E7
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 16:25:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C12DA40268;
 Wed,  2 Sep 2026 16:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841011F000E9;
 Wed,  2 Sep 2026 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788366340;
 bh=6rGiNWM4t/+HOtbQYgsqrZmimz+SlGKR3aKaXH8ao6Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gwBSe/Ulhles0yFRCEOtctS51BR4UIUENt/WPoehCuZy9G5Rw2qsVFN6yk4Z30i1S
 747HojuQoOJSLlXCVSPPDS6zBN6cDXhngdWPDSWl4iYRPDoC6noLW0jk46A2P0A3z6
 qdI7laxBSaedb/PTipJpmUOXf8Np1lRCrelNt0wkiosdurF4z52YRpDFs3xCCSf+se
 /xqjaW18dxCJKrsAOVps3LblrA+BX8dSpnjQAgnfhnqgmLPPbbXvLC+eT/myM4d4cz
 66SLcfUlxS/1QU1kvKYA4+Ci29p6DqYOkU8KL8OETgsv6aHJ5inT+TDUoLKDxaalaT
 8BTYrxnQMptxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V20 09/15] drm/xe/vram: Add VRAM page offline fault handler
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902145343.465686-26-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-26-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 16:25:40 +0000
Message-Id: <20260902162540.841011F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Lockless read of `res->bo` in `xe_ttm_vram_block_owner_get` leads =
to a Use-After-Free when racing with a TTM ghost object transfer.
- [High] Race condition when offlining a free VRAM page allows the faulty p=
age to be allocated and never purged.
- [High] Forcefully unpinning BOs in `xe_ttm_vram_purge_page` violates pin =
counting semantics and creates TOCTOU vulnerabilities.
- [High] `xe_ttm_vram_addr_to_region` ignores the `kernel_vram` region, cau=
sing hardware faults in critical kernel memory to be silently ignored.
- [Medium] A race condition between two-phase page reservation and synchron=
ous BO eviction falsely marks successfully offlined pages as failed.
--

commit 23a2bf9a5461265765230ffd0e7a9d24c27ca918
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: drm/xe/vram: Add VRAM page offline fault handler

This commit introduces a hardware VRAM page offline fault handler for the xe
driver. It adds functionality to purge the buffer object containing the fau=
lty
address, ban the associated VM or exec queue, and reserve the hardware page=
 in
the buddy allocator to prevent future use.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index d97739a84a2d1..0ab92bc3c6998 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -580,3 +618,295 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manag=
er *man)
[ ... ]
> +static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> +{
[ ... ]
> +	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> +	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
> +	if (xe_bo_is_pinned(bo))
> +		xe_bo_unpin(bo);

[Severity: High]
Does this forcefully break the pin counting contract by unpinning a BO on
behalf of an unknown owner?

In xe_ttm_vram_purge_page(), this unconditionally unpins the BO if it is
pinned, stealing a pin reference belonging to another subsystem (such as the
display controller). When the true owner later unpins the BO, could this
trigger an underflow crash?

> +	ret =3D xe_ttm_bo_purge(&bo->ttm, &ctx);
> +	xe_bo_unlock(bo);
> +
> +out:
[ ... ]
> +static struct xe_bo *xe_ttm_vram_block_owner_get(struct gpu_buddy_block =
*block)
> +{
> +	struct ttm_resource *res =3D block->private;
> +	struct ttm_buffer_object *tbo;
> +	struct xe_bo *bo;
> +
> +	if (!res)
> +		return NULL;
> +
> +	/*
> +	 * res->bo is updated under bdev->lru_lock by ttm_resource_set_bo().
> +	 * Racing with a ghost transfer here is benign: we either see the old
> +	 * owner (whose purge is a no-op and the retry path recovers) or the
> +	 * ghost (rejected below).
> +	 *
> +	 * A ghost is a bare ttm_transfer_obj, not an xe_bo, so ttm_to_xe_bo()
> +	 * on one would be out of bounds. xe_bo_is_xe_bo() rejects it since
> +	 * only our own BOs carry xe_ttm_bo_destroy().
> +	 */
> +	tbo =3D READ_ONCE(res->bo);
> +	if (!tbo || !xe_bo_is_xe_bo(tbo))
> +		return NULL;
> +
> +	bo =3D ttm_to_xe_bo(tbo);

[Severity: High]
Is it safe to read res->bo locklessly and pass it to xe_bo_is_xe_bo()?

In xe_ttm_vram_block_owner_get(), tbo is read locklessly. A concurrent
accelerated move or pipelined gutting can transfer the resource to a TTM
ghost object under bdev->lru_lock. This drops the last reference to the
original BO, freeing it via kfree().=20

If the thread is preempted and resumes after the original BO is freed,
passing the stale tbo pointer to xe_bo_is_xe_bo(tbo) will dereference
tbo->destroy on freed memory, causing a use-after-free regression.

> +
> +	/* The BO may already be in teardown with a zero refcount */
> +	return xe_bo_get_unless_zero(bo) ? bo : NULL;
> +}
> +
> +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 ad=
dr,
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> +{
[ ... ]
> +		if (block) {
> +			pbo =3D xe_ttm_vram_block_owner_get(block);
> +
> +			/*
> +			 * Critical kernel BO? Best-effort check without resv lock;
> +			 * worst case a concurrent pin causes reset path unnecessarily.
> +			 */
> +			if (pbo && ((pbo->ttm.type =3D=3D ttm_bo_type_kernel &&
> +				     !(pbo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
> +				    (xe_bo_is_user(pbo) && xe_bo_is_pinned(pbo)))) {

[Severity: High]
Does this lockless pin check create a time-of-check to time-of-use race con=
dition?

In xe_ttm_vram_reserve_page_at_addr(), xe_bo_is_pinned(pbo) is checked
without holding the appropriate locks. A user BO could be pinned right after
this check (e.g., for display scanout), and then forcefully unpinned and
purged.=20

The display hardware could then continue scanning out the old physical
address, potentially leaking data of whatever new BO is allocated there.

> +				kfree(nentry);
> +				pbo_to_put =3D pbo;
> +				drm_err(&xe->drm,
> +					"%s: addr: 0x%llx is critical kernel bo, requesting SBR\n",
> +					__func__, addr);
> +				break;
> +			}
> +		}
> +		/* Queue both free and occupied (to-be-purged) pages */
> +		++vram_mgr->n_queued_pages;
> +		list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
> +	}
> +
> +	/* Deferred put outside lock to avoid recursive deadlock */

[Severity: High]
Can a concurrent allocation claim a faulty free page when the lock is dropp=
ed?

In xe_ttm_vram_reserve_page_at_addr(), when a hardware fault occurs at a fr=
ee
address, gpu_buddy_allocated_addr_to_block() returns NULL, meaning pbo is
NULL. The page is queued and vram_mgr->lock is dropped to prevent deadlocks.

During this lockless window, a concurrent TTM allocation can claim this
exact free buddy block. When the fault handler later re-acquires the lock
and attempts xe_ttm_vram_buddy_alloc(), it will fail, returning 0 without
purging (since pbo was NULL). This leaves the newly allocated BO using a
faulty hardware page, which will cause persistent hardware errors.

> +	if (pbo_to_put) {
> +		xe_bo_put(pbo_to_put);
> +		/* Hint System controller driver for reset with -EIO  */
> +		return -EIO;
> +	}
> +
> +	if (pbo) {
> +		/*
> +		 * Purge BO containing address - reference held from above.
> +		 * This does not necessarily free the blocks synchronously: if
> +		 * the BO is not idle, ttm_bo_pipeline_gutting() hands the
> +		 * resource to a ghost object and it is released only once the
> +		 * move fences signal. The reservation below then fails and is
> +		 * retried from xe_ttm_vram_mgr_del().
> +		 */
> +		ret =3D xe_ttm_vram_purge_page(xe, pbo);
> +		xe_bo_put(pbo);
> +		if (ret)
> +			drm_warn(&xe->drm, "Purge failed at addr:0x%llx, ret:%d\n", addr, ret=
);
> +	}
> +
> +	scoped_guard(mutex, &vram_mgr->lock) {
> +		ret =3D xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
> +					      size, size, &nentry->blocks,
> +					      GPU_BUDDY_RANGE_ALLOCATION,
> +					      NULL, &nentry->used_visible_size);
> +		if (ret) {
> +			nentry->status =3D XE_PAGE_RESERVE_FAIL;
> +			drm_dbg(&xe->drm,
> +				"Page at addr:0x%llx still busy (%d), deferring reservation\n",
> +				addr, ret);
> +			return 0;
> +		}

[Severity: Medium]
Does this unconditionally attempt buddy allocation without checking if the
retry path already succeeded?

In xe_ttm_vram_reserve_page_at_addr(), if xe_ttm_vram_purge_page() frees the
BO's VRAM resource synchronously, it invokes xe_ttm_vram_mgr_del() which
triggers xe_ttm_vram_retry_queued_pages(). The retry logic will successfully
allocate the buddy block.

When the original thread re-acquires the lock here and blindly calls
xe_ttm_vram_buddy_alloc(), it will fail with -ENOSPC because the block is
already reserved. The page's status is then falsely marked as
XE_PAGE_RESERVE_FAIL, leading to misleading internal state.

> +
> +		list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link)=
 {
[ ... ]
> +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_devic=
e *xe, u64 addr)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_vram_region *vr =3D tile->mem.vram;
> +
> +		if (!vr)
> +			continue;

[Severity: High]
Does this skip checking the kernel-dedicated VRAM region?

In xe_ttm_vram_addr_to_region(), the address lookup loop only checks
tile->mem.vram and neglects tile->mem.kernel_vram. If a hardware fault occu=
rs
within kernel_vram, the address mapping fails and returns
ERR_PTR(-EOPNOTSUPP). This causes faults in kernel memory to be silently
ignored instead of triggering a system reset.

> +
> +		if (addr >=3D vr->dpa_base && addr < (vr->dpa_base + vr->usable_size))
> +			return vr;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902145343.4656=
86-17-tejas.upadhyay@intel.com?part=3D9
