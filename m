Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD30C61DC6
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 14:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C1010ED15;
	Wed, 26 Aug 2026 14:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C35M2aa1";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2A310ED15
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 14:05:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BFE0B601E9;
 Wed, 26 Aug 2026 14:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DFF1F000E9;
 Wed, 26 Aug 2026 14:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787753148;
 bh=l3+oBL6De0Pjtke133tPs1g8qRV2WyBuwSlNY1zlMM0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=C35M2aa1Cu9jInUStpa78qI0hvTkox7HtmY4V62DV0By979D8xu+TOtAKyhOm2o4T
 6Bx2YzdWulvg6qGd+sOKSQfuJYGP5YxZ+2yNxEyj5dcidNjBm7sV/ZDtfc+45JFaBp
 m/X1+mrbqKjYMszBCcb3QJsuY6Ehi7QDUDV0XJEv/yneWKOXdAsACFYWQ6YBW9s8TM
 ng5jrCSXqCiSCGIBnqnT0V/vpZatndqASVpBOQWwbhYa0jjyP/PI5DoqtaEeXP91r/
 8BMemJzH/Wuouycx1CKqO+P71dQ3LXwW2w98wOMWPs8JEYB4Ssrcz5ZCX+aI0gutwx
 Jccrr5s4MKHrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V18 08/14] drm/xe/vram: Add VRAM page offline fault handler
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260826135136.204044-24-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-24-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 14:05:47 +0000
Message-Id: <20260826140548.53DFF1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Forceful unpin of BO without owning the pin reference causes pin a=
ccounting underflow and crashes.
- [High] Lockless window allows a faulty free page to be allocated before i=
t can be reserved for offlining.
- [High] Potential Use-After-Free when accessing `bo->q` via `READ_ONCE()` =
without lifetime guarantees.
- [High] Hardware fault report is discarded if the associated BO is being d=
estroyed.
- [High] GFP_KERNEL allocation under vram_mgr->lock can cause an AB-BA dead=
lock with the memory shrinker.
- [Medium] Failed page reservations are kept in `queued_pages`, permanently=
 preventing future offlining of the faulty page.
- [Medium] Missing list tracking before dropping the mutex in the free page=
 path allows concurrent fault processing of the same address.
- [Medium] Discrepancy between commit message claims and implementation reg=
arding GSM address detection.
--

commit 6222f1c8e506f747820c42eb0ee76c350791988a
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/vram: Add VRAM page offline fault handler

Add the core VRAM page offlining logic to handle HW-reported faulty
physical addresses:

>     - xe_ttm_vram_addr_to_region(): Maps a DPA to its VRAM region.
>       Uses GSMBASE MMIO register to detect GSM addresses (returns NULL
>       for reset path). Returns ERR_PTR(-EOPNOTSUPP) for addresses

[Severity: Medium]
The commit message states that the GSMBASE MMIO register is used to detect =
GSM
addresses, but the implementation in `xe_ttm_vram_addr_to_region()` uses a
size heuristic instead.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 1253989a8d06a..b2b6c1bd2c555 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -572,3 +578,293 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manag=
er *man)
> =20
>  	return avail;
>  }
> +
> +static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> +{
[ ... ]
> +	xe_bo_lock(bo, false);
> +	q =3D READ_ONCE(bo->q);
> +	/*  Ban exec queue if BO is lrc */
> +	if (q && xe_exec_queue_get_unless_zero(q)) {

[Severity: High]
Could this lead to a use-after-free? Because there is no rcu_read_lock() or
other lifetime guarantee held here, the memory backing `q` could be freed
concurrently before xe_exec_queue_get_unless_zero() is called.

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
Does forcefully unpinning a BO here without owning the pin reference break =
pin
accounting? When the legitimate owner eventually unpins the BO, it seems th=
is
could cause an underflow in `pin_count` or trigger assertion panics like
`xe_assert(xe, !list_empty(&bo->pinned_link))`.

> +	ret =3D xe_ttm_bo_purge(&bo->ttm, &ctx);
> +	xe_bo_unlock(bo);
[ ... ]
> +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 ad=
dr,
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> +{
[ ... ]
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

[Severity: High]
Can allocating with GFP_KERNEL while holding `vram_mgr->lock` cause an AB-BA
deadlock? Under memory pressure, this could trigger the TTM shrinker to run=
 in
direct reclaim, which would then attempt to acquire `vram_mgr->lock` to evi=
ct
BOs.

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

[Severity: High]
Are we discarding the hardware fault report if the associated BO happens to=
 be
undergoing destruction? Returning -ENOENT here means the bad page will be
returned to the free pool once the BO finishes destruction, and future
allocations will claim this defective page.

> +			/*
> +			 * Critical kernel BO? Best-effort check without resv lock;
> +			 * worst case a concurrent pin causes reset path unnecessarily.
> +			 */
> +			if ((pbo->ttm.type =3D=3D ttm_bo_type_kernel &&
> +			     !(pbo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
> +			    (xe_bo_is_user(pbo) && xe_bo_is_pinned(pbo))) {

[Severity: High]
Does this lockless check allow concurrently pinned user BOs or LATE_RESTORE
kernel BOs to slip through to the destructive purge path? This leads direct=
ly
to the forceful `xe_bo_unpin(bo)` mentioned earlier, breaking pin accountin=
g.

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

[Severity: Medium]
If `block` was NULL (indicating a free page), `nentry` was not added to
`queued_pages` inside the `scoped_guard` above. Since the lock is dropped h=
ere,
doesn't this leave a window where a concurrent fault for the exact same add=
ress
could bypass the `xe_ttm_vram_page_already_processed()` check?

[Severity: High]
Additionally, dropping the lock here before handling the `else` path for fr=
ee
blocks creates a race window. Can a concurrent thread allocate the free blo=
ck in
this window before the fault handler re-acquires the lock and calls
`xe_ttm_vram_buddy_alloc()`?

> +	if (pbo_to_put) {
> +		xe_bo_put(pbo_to_put);
> +		/* Hint System controller driver for reset with -EIO  */
> +		return -EIO;
> +	}
> +
> +	if (block) {
[ ... ]
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

[Severity: Medium]
If the reservation fails, this error path leaves `nentry` in `queued_pages`
with a failure status. Will this permanently mask all future faults for thi=
s bad
page, preventing it from ever being offlined?

> +
> +			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link=
) {
[ ... ]
> +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_devic=
e *xe, u64 addr)
> +{
[ ... ]
> +		if (addr >=3D vr->dpa_base && addr < (vr->dpa_base + vr->usable_size))
> +			return vr;
> +
> +		/* CCS, GSM, or DSM =E2=80=94 infrastructure zone, needs reset */
> +		if (addr >=3D (vr->dpa_base + vr->usable_size) &&
> +		    addr < (vr->dpa_base + vr->actual_physical_size))
> +			return NULL;

[Severity: Medium]
As mentioned above, the commit message says this checks the GSMBASE MMIO
register, but this uses a size heuristic based on `actual_physical_size` and
`usable_size`. Is the implementation missing the MMIO register check?

> +	}
> +
> +	/*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826135136.2040=
44-16-tejas.upadhyay@intel.com?part=3D8
