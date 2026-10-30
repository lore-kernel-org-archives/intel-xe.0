Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C052D606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GAY60Vkh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EC410E254;
	Fri, 30 Oct 2026 15:23:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296C610E254
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793373831; x=1824909831;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XIKjQvUgchWJH/9AW84mFnr6gzFsPdG72GmZ7C+uuUU=;
 b=GAY60VkhmHkC2ifuyyUGZ7aDUvzHsPt/Je0iXcuaaxndaZHdMv3FKwar
 nwuvI7Zu72ZNfb4bsvuzSDvDPwZGvTV0ls/OPaMmW88oarGeF43InuLDn
 M6uPv59wRCC3357u8HhHIrL78HJYU3zSTJ4KSteYDZF1W9tf7HFKMaREd
 0KqW2+hCM8DzyGivbEOVk+vlSPUyOBmrUmntoQyNBraC5uiqYBbC+0SuQ
 W2/a/DvrZKNUrFdwYdRekEkZUvfnTN/nqfoSia+vY1PcOqsxkOeead990
 DwG57yMQp/1zsocrpKVw3hGKe1XIavgQolcg+nj3++5qFysonYhwDuXTu w==;
X-CSE-ConnectionGUID: jMBt84xmQRu5RLlg7mAJeg==
X-CSE-MsgGUID: SyWUw3UtREqFEhBAV8vyuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2016748"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2016748"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:23:50 -0700
X-CSE-ConnectionGUID: INkGkaDpRNC9kfg3Ouwq4g==
X-CSE-MsgGUID: HXpip9E8SCmyVp+dDeUVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5997094"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.72])
 ([10.245.244.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:23:48 -0700
Message-ID: <7b439a228832d3f81531d52b92ef99947a08ccec.camel@linux.intel.com>
Subject: Re: [PATCH 3/6] drm/xe/sa: remove unused shadow BO and two-step bb
 helpers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 30 Oct 2026 16:23:46 +0100
In-Reply-To: <20261030-migrate-bb-optimise-v1-3-b8d01649cfe9@intel.com>
References: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
 <20261030-migrate-bb-optimise-v1-3-b8d01649cfe9@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 2026-10-30 at 11:49 +0000, Matthew Auld wrote:
> Since commit 1460eae74fbb ("drm/xe/vf: Use drm mm instead of drm sa
> for
> CCS read/write"), the two-step bb/sa allocation helpers and SA shadow
> BO
> support have no callers. Remove the dead code along with the unused
> flags argument of __xe_sa_bo_manager_init().
>=20
> Assisted-by: LLM
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>


Was there drm suballocator code introduced as well that is now dead?

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 62 -----------------------
> =C2=A0drivers/gpu/drm/xe/xe_bb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 3 --
> =C2=A0drivers/gpu/drm/xe/xe_guc_buf.c=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_sa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10=
3 +----------------------------
> ----------
> =C2=A0drivers/gpu/drm/xe/xe_sa.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 22 +--------
> =C2=A0drivers/gpu/drm/xe/xe_sa_types.h |=C2=A0=C2=A0 3 --
> =C2=A06 files changed, 4 insertions(+), 191 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index b2603902c147..771e50e7c4e3 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -45,68 +45,6 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> dwords, bool usm)
> =C2=A0	return ERR_PTR(err);
> =C2=A0}
> =C2=A0
> -/**
> - * xe_bb_alloc() - Allocate a new batch buffer structure
> - * @gt: the &xe_gt
> - *
> - * Allocates and initializes a new xe_bb structure with an
> associated
> - * uninitialized suballoc object.
> - *
> - * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
> - */
> -struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
> -{
> -	struct xe_bb *bb =3D kmalloc_obj(*bb);
> -	int err;
> -
> -	if (!bb)
> -		return ERR_PTR(-ENOMEM);
> -
> -	bb->bo =3D xe_sa_bo_alloc(GFP_KERNEL);
> -	if (IS_ERR(bb->bo)) {
> -		err =3D PTR_ERR(bb->bo);
> -		goto err;
> -	}
> -
> -	return bb;
> -
> -err:
> -	kfree(bb);
> -	return ERR_PTR(err);
> -}
> -
> -/**
> - * xe_bb_init() - Initialize a batch buffer with memory from a sub-
> allocator pool
> - * @bb: Batch buffer structure to initialize
> - * @bb_pool: Suballoc memory pool to allocate from
> - * @dwords: Number of dwords to be allocated
> - *
> - * Initializes the batch buffer by allocating memory from the
> specified
> - * suballoc pool.
> - *
> - * Return: 0 on success, negative error code on failure.
> - */
> -int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32
> dwords)
> -{
> -	int err;
> -
> -	/*
> -	 * We need to allocate space for the requested number of
> dwords &
> -	 * one additional MI_BATCH_BUFFER_END dword. Since the whole
> SA
> -	 * is submitted to HW, we need to make sure that the last
> instruction
> -	 * is not over written when the last chunk of SA is
> allocated for BB.
> -	 * So, this extra DW acts as a guard here.
> -	 */
> -	err =3D xe_sa_bo_init(bb_pool, bb->bo, 4 * (dwords + 1));
> -	if (err)
> -		return err;
> -
> -	bb->cs =3D xe_sa_bo_cpu_addr(bb->bo);
> -	bb->len =3D 0;
> -
> -	return 0;
> -}
> -
> =C2=A0static struct xe_sched_job *
> =C2=A0__xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64
> *addr)
> =C2=A0{
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 231870b24c2f..b5cc65506696 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -12,12 +12,9 @@ struct dma_fence;
> =C2=A0
> =C2=A0struct xe_gt;
> =C2=A0struct xe_exec_queue;
> -struct xe_sa_manager;
> =C2=A0struct xe_sched_job;
> =C2=A0
> =C2=A0struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
> -struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
> -int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32
> dwords);
> =C2=A0struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bb *bb);
> =C2=A0struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queu=
e
> *q,
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c
> b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 11f77decd8d1..7a8efb62df60 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -29,7 +29,7 @@ static int guc_buf_cache_init(struct
> xe_guc_buf_cache *cache, u32 size)
> =C2=A0	struct xe_gt *gt =3D cache_to_gt(cache);
> =C2=A0	struct xe_sa_manager *sam;
> =C2=A0
> -	sam =3D __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0,
> sizeof(u32), 0);
> +	sam =3D __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0,
> sizeof(u32));
> =C2=A0	if (IS_ERR(sam))
> =C2=A0		return PTR_ERR(sam);
> =C2=A0	cache->sam =3D sam;
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index f32045f40b7a..b356d4327c97 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -29,7 +29,6 @@ static void xe_sa_bo_manager_fini(struct drm_device
> *drm, void *arg)
> =C2=A0		kvfree(sa_manager->cpu_ptr);
> =C2=A0
> =C2=A0	sa_manager->bo =3D NULL;
> -	sa_manager->shadow =3D NULL;
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -38,14 +37,12 @@ static void xe_sa_bo_manager_fini(struct
> drm_device *drm, void *arg)
> =C2=A0 * @size: number of bytes to allocate
> =C2=A0 * @guard: number of bytes to exclude from suballocations
> =C2=A0 * @align: alignment for each suballocated chunk
> - * @flags: flags for suballocator
> =C2=A0 *
> =C2=A0 * Prepares the suballocation manager for suballocations.
> =C2=A0 *
> =C2=A0 * Return: a pointer to the &xe_sa_manager or an ERR_PTR on failure=
.
> =C2=A0 */
> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile,
> u32 size,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 guard, u32 align,
> u32 flags)
> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile,
> u32 size, u32 guard, u32 align)
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D tile_to_xe(tile);
> =C2=A0	struct xe_sa_manager *sa_manager;
> @@ -82,32 +79,6 @@ struct xe_sa_manager
> *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> =C2=A0		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
> =C2=A0	}
> =C2=A0
> -	if (flags & XE_SA_BO_MANAGER_FLAG_SHADOW) {
> -		struct xe_bo *shadow;
> -
> -		ret =3D drmm_mutex_init(&xe->drm, &sa_manager-
> >swap_guard);
> -		if (ret)
> -			return ERR_PTR(ret);
> -
> -		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> -			fs_reclaim_acquire(GFP_KERNEL);
> -			might_lock(&sa_manager->swap_guard);
> -			fs_reclaim_release(GFP_KERNEL);
> -		}
> -
> -		shadow =3D xe_managed_bo_create_pin_map(xe, tile,
> size,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_BO_FLAG_GGTT |
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_BO_FLAG_GGTT_INVALIDATE |
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_BO_FLAG_PINNED_NORESTORE);
> -		if (IS_ERR(shadow)) {
> -			drm_err(&xe->drm, "Failed to prepare %uKiB
> BO for SA manager (%pe)\n",
> -				size / SZ_1K, shadow);
> -			return ERR_CAST(shadow);
> -		}
> -		sa_manager->shadow =3D shadow;
> -	}
> -
> =C2=A0	drm_suballoc_manager_init(&sa_manager->base, managed_size,
> align);
> =C2=A0	ret =3D drmm_add_action_or_reset(&xe->drm,
> xe_sa_bo_manager_fini,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sa_manager);
> @@ -117,48 +88,6 @@ struct xe_sa_manager
> *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> =C2=A0	return sa_manager;
> =C2=A0}
> =C2=A0
> -/**
> - * xe_sa_bo_swap_shadow() - Swap the SA BO with shadow BO.
> - * @sa_manager: the XE sub allocator manager
> - *
> - * Swaps the sub-allocator primary buffer object with shadow buffer
> object.
> - *
> - * Return: None.
> - */
> -void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager)
> -{
> -	struct xe_device *xe =3D tile_to_xe(sa_manager->bo->tile);
> -
> -	xe_assert(xe, sa_manager->shadow);
> -	lockdep_assert_held(&sa_manager->swap_guard);
> -
> -	swap(sa_manager->bo, sa_manager->shadow);
> -	if (!sa_manager->bo->vmap.is_iomem)
> -		sa_manager->cpu_ptr =3D sa_manager->bo->vmap.vaddr;
> -}
> -
> -/**
> - * xe_sa_bo_sync_shadow() - Sync the SA Shadow BO with primary BO.
> - * @sa_bo: the sub-allocator buffer object.
> - *
> - * Synchronize sub-allocator shadow buffer object with primary
> buffer object.
> - *
> - * Return: None.
> - */
> -void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo)
> -{
> -	struct xe_sa_manager *sa_manager =3D to_xe_sa_manager(sa_bo-
> >manager);
> -	struct xe_device *xe =3D tile_to_xe(sa_manager->bo->tile);
> -
> -	xe_assert(xe, sa_manager->shadow);
> -	lockdep_assert_held(&sa_manager->swap_guard);
> -
> -	xe_map_memcpy_to(xe, &sa_manager->shadow->vmap,
> -			 drm_suballoc_soffset(sa_bo),
> -			 xe_sa_bo_cpu_addr(sa_bo),
> -			 drm_suballoc_size(sa_bo));
> -}
> -
> =C2=A0/**
> =C2=A0 * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags=
.
> =C2=A0 * @sa_manager: the &xe_sa_manager
> @@ -181,36 +110,6 @@ struct drm_suballoc *__xe_sa_bo_new(struct
> xe_sa_manager *sa_manager, u32 size,
> =C2=A0	return drm_suballoc_new(&sa_manager->base, size, gfp, true,
> 0);
> =C2=A0}
> =C2=A0
> -/**
> - * xe_sa_bo_alloc() - Allocate uninitialized suballoc object.
> - * @gfp: gfp flags used for memory allocation.
> - *
> - * Allocate memory for an uninitialized suballoc object. Intended
> usage is
> - * allocate memory for suballoc object outside of a reclaim tainted
> context
> - * and then be initialized at a later time in a reclaim tainted
> context.
> - *
> - * Return: a new uninitialized suballoc object, or an ERR_PTR(-
> ENOMEM).
> - */
> -struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
> -{
> -	return drm_suballoc_alloc(gfp);
> -}
> -
> -/**
> - * xe_sa_bo_init() - Initialize a suballocation.
> - * @sa_manager: pointer to the sa_manager
> - * @sa: The struct drm_suballoc.
> - * @size: number of bytes we want to suballocate.
> - *
> - * Try to make a suballocation on a pre-allocated suballoc object of
> size @size.
> - *
> - * Return: zero on success, errno on failure.
> - */
> -int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct
> drm_suballoc *sa, size_t size)
> -{
> -	return drm_suballoc_insert(&sa_manager->base, sa, size,
> true, 0);
> -}
> -
> =C2=A0/**
> =C2=A0 * xe_sa_bo_flush_write() - Copy the data from the sub-allocation t=
o
> the GPU memory.
> =C2=A0 * @sa_bo: the &drm_suballoc to flush
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 50218b0d1404..1be744350836 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -14,14 +14,12 @@
> =C2=A0struct dma_fence;
> =C2=A0struct xe_tile;
> =C2=A0
> -#define XE_SA_BO_MANAGER_FLAG_SHADOW	BIT(0)
> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile,
> u32 size,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 guard, u32 align,
> u32 flags);
> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile,
> u32 size, u32 guard, u32 align);
> =C2=A0struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager
> *sa_manager, u32 size, gfp_t gfp);
> =C2=A0
> =C2=A0static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct
> xe_tile *tile, u32 size, u32 align)
> =C2=A0{
> -	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align, 0);
> +	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -38,8 +36,6 @@ static inline struct drm_suballoc
> *xe_sa_bo_new(struct xe_sa_manager *sa_manager
> =C2=A0	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
> =C2=A0}
> =C2=A0
> -struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
> -int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct
> drm_suballoc *sa, size_t size);
> =C2=A0void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
> =C2=A0void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
> =C2=A0void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence
> *fence);
> @@ -73,18 +69,4 @@ static inline void *xe_sa_bo_cpu_addr(struct
> drm_suballoc *sa)
> =C2=A0		drm_suballoc_soffset(sa);
> =C2=A0}
> =C2=A0
> -void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager);
> -void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo);
> -
> -/**
> - * xe_sa_bo_swap_guard() - Retrieve the SA BO swap guard within sub-
> allocator.
> - * @sa_manager: the &xe_sa_manager
> - *
> - * Return: Sub alloctor swap guard mutex.
> - */
> -static inline struct mutex *xe_sa_bo_swap_guard(struct xe_sa_manager
> *sa_manager)
> -{
> -	return &sa_manager->swap_guard;
> -}
> -
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_sa_types.h
> b/drivers/gpu/drm/xe/xe_sa_types.h
> index 1085c9c37d6b..cb7238799dcb 100644
> --- a/drivers/gpu/drm/xe/xe_sa_types.h
> +++ b/drivers/gpu/drm/xe/xe_sa_types.h
> @@ -12,9 +12,6 @@ struct xe_bo;
> =C2=A0struct xe_sa_manager {
> =C2=A0	struct drm_suballoc_manager base;
> =C2=A0	struct xe_bo *bo;
> -	struct xe_bo *shadow;
> -	/** @swap_guard: Timeline guard updating @bo and @shadow */
> -	struct mutex swap_guard;
> =C2=A0	void *cpu_ptr;
> =C2=A0	bool is_iomem;
> =C2=A0};
