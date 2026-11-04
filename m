Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4721606A339
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 18:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXeWv8Lx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E7310E6C8;
	Wed,  4 Nov 2026 18:28:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB57210E6C8
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 18:28:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C2BE7609F0;
 Wed,  4 Nov 2026 18:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC641F000C1;
 Wed,  4 Nov 2026 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793816882;
 bh=pSHleb5kKr8Pa0+OX6/9mDhBz1VfVQMas6zGzDWNq1g=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=CXeWv8LxEYBkyk/PxASHw4uDQ/UfyXNPV7HcrMlY6q5TtHGaTRdiuZ1+nFX5HZUzy
 F94QwI5u4SAANPyDOM+iOvCa/DdgTNL4+FsLz6NQQWzn8ve7e8Y/p97r9nG5h4IM7C
 C0MFU8rMsEE4stWACcy6megc2HyDE1rX8bLiTQPYN8aSFtB1Sl3fOn2/yHUxk362S/
 OYH+1ZANR1kbBxPCQpnQImqfMdh8Fa8Z4jFv+OcLjt70hyy4LhLPCSDnYntJ112dmK
 qLkp9r0UCQJfiRH9a6zHP5zCSwmIHSgXfGwBz/bfDl8ETEZoHHXkxu9gveIkQbHYIB
 pEe7tdRNs921w==
Message-ID: <sashiko-outbox-197846@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Exclude imported dma-buf BOs from the TT budget
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261104181733.779688-2-himal.prasad.ghimiray@intel.com>
References: <20261104181733.779688-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 18:28:01 +0000
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] drm/xe: race and unsigned underflow in xe_ttm_sys_mgr_new() budg=
et check
- [Medium] drm/xe: unsubtracted sys_mgr_sg_usage in query_mem_regions()
- [Medium] drm/xe: useless eviction of imported dma-buf BOs from XE_PL_TT o=
n ENOSPC
--

commit a4e17a0c19f77a7394d409e5a5369673795b4c8f
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Exclude imported dma-buf BOs from the TT budget

This commit tracks the byte size of imported dma-buf BOs (ttm_bo_type_sg)
placed in the TT resource manager in a per-device atomic64_t counter,
mem.sys_mgr_sg_usage. It subtracts this counter from the resource manager
usage in xe_ttm_sys_mgr_new() so externally backed BOs do not count against
the host-RAM-sized TT budget.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_=
ttm_sys_mgr.c
> index 9d77ba605aecf..926c4372e45aa 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -30,6 +30,7 @@ static int xe_ttm_sys_mgr_new(struct ttm_resource_manag=
er *man,
>  			      const struct ttm_place *place,
>  			      struct ttm_resource **res)
>  {
> +	struct xe_device *xe =3D container_of(man, struct xe_device, mem.sys_mg=
r);
>  	struct xe_ttm_sys_node *node;
>  	int r;
> =20
> @@ -40,8 +41,18 @@ static int xe_ttm_sys_mgr_new(struct ttm_resource_mana=
ger *man,
>  	node->tbo =3D tbo;
>  	ttm_resource_init(tbo, place, &node->base.base);
> =20
> -	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
> -	    ttm_resource_manager_usage(man) > (man->size << PAGE_SHIFT)) {
> +	/*
> +	 * Imported dma-buf BOs (e.g. peer-GPU VRAM mapped for P2P) are backed
> +	 * by external pages and never allocate from this device's TTM pool, so
> +	 * they consume no host RAM and must not be charged against the
> +	 * host-RAM-sized TT budget.
> +	 */
> +	if (tbo->type =3D=3D ttm_bo_type_sg) {
> +		atomic64_add(node->base.base.size, &xe->mem.sys_mgr_sg_usage);
> +	} else if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
> +		   ttm_resource_manager_usage(man) -
> +		   atomic64_read(&xe->mem.sys_mgr_sg_usage) >
> +		   (man->size << PAGE_SHIFT)) {
>  		r =3D -ENOSPC;
>  		goto err_fini;
>  	}

[Severity: Medium]
Can this subtraction underflow and cause a spurious -ENOSPC when racing
with a concurrent ttm_bo_type_sg allocation or deallocation?

In xe_ttm_sys_mgr_new(), ttm_resource_manager_usage(man) reads man->usage
under man->bdev->lru_lock and returns uint64_t, while
atomic64_read(&xe->mem.sys_mgr_sg_usage) is read without lru_lock and
returns s64. Because of C usual arithmetic conversions, the subtraction
evaluates in unsigned 64-bit arithmetic.

Since ttm_resource_alloc() and ttm_resource_free() only hold the per-BO
dma_resv lock, two threads operating on different BOs can run concurrently:

1. Thread A (allocating a small normal BO of size X) calls
   ttm_resource_manager_usage(man) and observes X.
2. Before Thread A calls atomic64_read(&xe->mem.sys_mgr_sg_usage), Thread B
   (allocating a ttm_bo_type_sg BO of size Y > X) completes
   ttm_resource_init() and atomic64_add(Y, &xe->mem.sys_mgr_sg_usage).
3. Thread A now reads sys_mgr_sg_usage >=3D Y. The unsigned subtraction X -=
 Y
   wraps around near U64_MAX, which is greater than (man->size << PAGE_SHIF=
T),
   failing Thread A's allocation with -ENOSPC.

A similar race occurs if the compiler evaluates atomic64_read() before
ttm_resource_manager_usage(man) while another thread is freeing a
ttm_bo_type_sg resource in xe_ttm_sys_mgr_del().

In addition, because ttm_resource_init() adds to man->usage before
atomic64_add() updates sys_mgr_sg_usage here (and xe_ttm_sys_mgr_del()
subtracts from sys_mgr_sg_usage before ttm_resource_fini() subtracts from
man->usage), a concurrent normal allocation can transiently observe the SG
BO in man->usage without seeing it in sys_mgr_sg_usage.

[Severity: Medium]
Should query_mem_regions() in drivers/gpu/drm/xe/xe_query.c also subtract
xe->mem.sys_mgr_sg_usage when reporting system memory usage to userspace?

Currently, query_mem_regions() populates DRM_XE_MEM_REGION_CLASS_SYSMEM as
follows:

drivers/gpu/drm/xe/xe_query.c:query_mem_regions() {
	...
	man =3D ttm_manager_type(&xe->ttm, XE_PL_TT);
	mem_regions->mem_regions[0].mem_class =3D DRM_XE_MEM_REGION_CLASS_SYSMEM;
	...
	mem_regions->mem_regions[0].total_size =3D man->size << PAGE_SHIFT;
	mem_regions->mem_regions[0].used =3D ttm_resource_manager_usage(man);
	...
}

Because ttm_resource_init() still adds ttm_bo_type_sg BOs to man->usage
while xe_ttm_sys_mgr_new() excludes them from the (man->size << PAGE_SHIFT)
limit, imported peer-GPU P2P dma-buf mappings are still reported as used
host RAM in mem_regions[0].used, and mem_regions[0].used can now exceed
mem_regions[0].total_size.

> @@ -63,8 +74,12 @@ static int xe_ttm_sys_mgr_new(struct ttm_resource_mana=
ger *man,
>  static void xe_ttm_sys_mgr_del(struct ttm_resource_manager *man,
>  			       struct ttm_resource *res)
>  {
> +	struct xe_device *xe =3D container_of(man, struct xe_device, mem.sys_mg=
r);
>  	struct xe_ttm_sys_node *node =3D to_xe_ttm_sys_node(res);
> =20
> +	if (node->tbo->type =3D=3D ttm_bo_type_sg)
> +		atomic64_sub(res->size, &xe->mem.sys_mgr_sg_usage);
> +
>  	ttm_resource_fini(man, res);

[Severity: Medium]
When a normal BO allocation hits the TT budget limit and returns -ENOSPC,
will TTM uselessly evict unpinned imported dma-buf BOs (ttm_bo_type_sg)
from XE_PL_TT?

Imported dma-buf BOs created via xe_gem_prime_import() ->
xe_dma_buf_create_obj() are unpinned ttm_bo_type_sg BOs placed in XE_PL_TT,
so ttm_resource_init() places them on man->lru.

When a normal XE_PL_TT allocation fails with -ENOSPC in
xe_ttm_sys_mgr_new(), ttm_bo_alloc_resource() -> ttm_bo_evict_alloc() walks
sys_mgr's LRU list and calls xe_bo_eviction_valuable(), which returns true
for unpinned ttm_bo_type_sg BOs. TTM then evicts those BOs to XE_PL_SYSTEM
via xe_bo_move() -> xe_bo_move_notify() -> xe_bo_trigger_rebind(), waiting
on their fences and invalidating their VMAs.

However, when xe_ttm_sys_mgr_del() frees the evicted SG BO's resource, it
subtracts res->size from xe->mem.sys_mgr_sg_usage while ttm_resource_fini()
subtracts res->size from man->usage. The net budgeted usage
(man->usage - sys_mgr_sg_usage) remains unchanged, so evicting
ttm_bo_type_sg BOs frees zero bytes of TT budget and the retried allocation
in ttm_bo_evict_cb() immediately fails with -ENOSPC again.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104181733.7796=
88-2-himal.prasad.ghimiray@intel.com?part=3D1
