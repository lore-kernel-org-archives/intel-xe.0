Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5CFC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6041410E72D;
	Mon, 31 Aug 2026 08:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gas7UpO3";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2278F10E72D
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:37:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8202760200;
 Mon, 31 Aug 2026 08:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148581F000E9;
 Mon, 31 Aug 2026 08:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788165438;
 bh=DpnE4hVtw9ZOYlFSQnfHUYVYt+BKhdK7otYaW2ZIGDg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Gas7UpO3rsBasvc8uQXjuUWJ2cPfuNE5iIjt734frLWwZHiEt1FHeVn2FLn+WKxdG
 j6sco8cJ6aO8b21NrS6tDf9nwuUIqkIeEUBXmgQGnbNjjkBkQqK2mrlZZS/NQ03W3x
 1HwGD+EfMOnuReZIxB1/GEqa7uCl8PN7tUhv+W3tx5G+Ck6qckzz6bEs3AqRxY2Frm
 f4Nl4RlR9MPj9IP0DSR679ZMFocvXuq7mUc2sd05L9k0PYrfhmhY1TGQ0mnhrjM+jn
 dTIA9tkCiTStl4GFF8GGcVX3lrFOU0ZNNeyhQJpWL8cWBhLSwR+wzyv5mO7nVPKkA/
 LVTUhAAeXiW8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 09/15] drm/xe/vram: Add VRAM page offline fault handler
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831064942.315720-26-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-26-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:37:17 +0000
Message-Id: <20260831083718.148581F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] TOCTOU race allows eviction of the BO and destruction of innoc=
ent data
- [High] Deadlock via shrinker when allocating with GFP_KERNEL under vram_m=
gr->lock
- [High] Unconditional BO unpin and lack of state rollback causes reference=
 count corruption
- [High] Use-After-Free via lockless access to exec_queue pointer
- [Medium] Failed page reservations are permanently silenced, allowing cont=
inued hardware faults
- [Medium] Faulty physical pages escape offlining when their owning BO is b=
eing freed
--

commit e00d08042f6e028303a11bd3305d790b12e07011
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: drm/xe/vram: Add VRAM page offline fault handler

This commit adds core VRAM page offlining logic to handle hardware-reported
faulty physical addresses. It introduces functions to purge BOs, verify
previously processed pages, reserve faulty buddy blocks, and map addresses =
to
VRAM regions.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 1253989a8d06a..e5994c14487d3 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c

[ ... ]

> @@ -572,3 +578,263 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manag=
er *man)

[ ... ]

> +static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> +{

[ ... ]

> +	xe_bo_lock(bo, false);
> +	q =3D READ_ONCE(bo->q);
> +	/*  Ban exec queue if BO is lrc */
> +	if (q && xe_exec_queue_get_unless_zero(q)) {

[Severity: High]
Is this lockless access to the exec queue susceptible to a use-after-free?

When xe_ttm_vram_purge_page() reads the queue pointer locklessly, it appears
possible for a concurrent destruction path like xe_lrc_finish() to clear the
pointer and synchronously free the queue via xe_exec_queue_destroy().

If this thread resumes after the free but before the RCU grace period, it
might try to read the refcount of a freed object in
xe_exec_queue_get_unless_zero().

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
> +	ret =3D xe_ttm_bo_purge(&bo->ttm, &ctx);
> +	xe_bo_unlock(bo);

[Severity: High]
Could this unconditional unpin corrupt the reference count if the purge
operation fails?

In xe_ttm_vram_purge_page(), if the BO was concurrently pinned multiple tim=
es
(for instance, by the display subsystem), dropping a single pin leaves the
count above zero.

Consequently, xe_ttm_bo_purge() will fail during validation and return an
error. Since the state and pin count are not rolled back on this failure
path, the legitimate owner might later unpin the BO, causing an underflow
panic.

[ ... ]

> +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 ad=
dr,
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> +{
> +	struct xe_ttm_vram_offline_resource *pos, *n;
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

[Severity: High]
Will this allocation risk a direct reclaim deadlock under memory pressure?

The xe_ttm_vram_reserve_page_at_addr() function acquires vram_mgr->lock and
then performs an implicit GFP_KERNEL allocation via kzalloc_obj().

If this allocation blocks and triggers direct reclaim, the GEM shrinker cou=
ld
attempt to evict a VRAM BO. That eviction path will call
xe_ttm_vram_mgr_del(), which tries to acquire the same vram_mgr->lock,
resulting in an AB-BA deadlock.

> +		if (!nentry)
> +			return -ENOMEM;
> +		INIT_LIST_HEAD(&nentry->blocks);
> +		nentry->status =3D XE_PAGE_RESERVE_PENDING;
> +		nentry->addr =3D addr;
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

[Severity: Medium]
Does returning early here allow the corrupted physical page to escape back =
to
the global free pool?

If xe_bo_get_unless_zero() fails in xe_ttm_vram_reserve_page_at_addr(), the
owning BO is already being destroyed.

By freeing the tracking entry and returning without recording the faulty
address in the offlined or queued lists, the memory manager might
subsequently reallocate these corrupted buddy blocks to a new, innocent BO.

[ ... ]

> +	if (block) {
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

[Severity: Critical]
Is there a race condition during the unlocked window that could lead to data
destruction?

Since vram_mgr->lock is dropped before xe_ttm_vram_purge_page() is called in
xe_ttm_vram_reserve_page_at_addr(), the memory manager might concurrently
evict this BO to system memory and reuse its VRAM blocks for a completely
different BO.

When execution resumes, xe_ttm_vram_purge_page() would blindly destroy the
original BO that now safely resides in system memory. Furthermore, the new =
BO
occupying the faulty VRAM wouldn't be purged, and the subsequent buddy
allocation would fail.

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
> +			drm_warn(&xe->drm,
> +				 "Could not reserve page at addr:0x%llx, ret:%d\n",
> +				 addr, ret);
> +			nentry->status =3D XE_PAGE_RESERVE_FAIL;
> +			return ret;
> +		}

[Severity: Medium]
What happens to the faulty address if xe_ttm_vram_buddy_alloc() fails?

In this error path in xe_ttm_vram_reserve_page_at_addr(), the code returns
early without removing the tracking entry from the queued_pages list.

If the hardware later faults on this exact same physical address,
xe_ttm_vram_page_already_processed() will incorrectly report it as already
handled. This permanently blacklists the faulty page from future offlining
attempts.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831064942.3157=
20-17-tejas.upadhyay@intel.com?part=3D9
