Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D2CEE2091
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 12:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF5410E6E7;
	Fri,  6 Feb 2026 12:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUfw+fjY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0DD10E19A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 12:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770382150; x=1801918150;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pBkZeu8LO2Fr9DyfmIxf8MGs7Zfk28trVf3HHMSijFg=;
 b=mUfw+fjYXH+PgUhoILL5FcmnlEQe7qLtwQOr3LFWY1aw0RBolrmaddVo
 zOemvK9q0kdeE4za7mgN/XtHxf5EM+2tGplCNgePf+0mGjIC9etHOQ480
 J/lv3q91466y4TmTb+is2IBnhaWLXEe96SNJYBwR7f5f6rpokiP8DuoP7
 FkvFqWqpl+3OGQozQ8cN0PcSttkbOlz7QsSia0Fz0+bpyXGEEi40p83Z3
 lgBCGpyxxLUxlTGV34btX6kwqSY4X9mJL94GCAnSL9WmsX4eTmWGcjxyk
 ZXlAuyy+gP42n4G3hr9gkFYGXbAsf07p5FaRlJuKmqitzfTM9dbeBTOFQ Q==;
X-CSE-ConnectionGUID: yCI6+bX9QueFX3GuCwXNOg==
X-CSE-MsgGUID: MtCMEZFNTqG75GTWV+D6Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70782685"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="70782685"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:49:09 -0800
X-CSE-ConnectionGUID: rD/YFDlcRvOHBmsS3g6Jlg==
X-CSE-MsgGUID: EcBxoFCvRNyafDiyM8USOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="233806797"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.244])
 ([10.245.244.244])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:49:08 -0800
Message-ID: <dd2e48a45cdcbc284dc4c5228ae47de7c1539d77.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Fri, 06 Feb 2026 13:49:06 +0100
In-Reply-To: <20260204164642.3509298-8-satyanarayana.k.v.p@intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
 <20260204164642.3509298-8-satyanarayana.k.v.p@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 2026-02-04 at 16:46 +0000, Satyanarayana K V P wrote:
> CCS save/restore batch buffers are attached during BO allocation and
> detached during BO teardown. The shrinker triggers xe_bo_move(),
> which is
> used for both allocation and deletion paths.
>=20
> When BO allocation and shrinking occur concurrently, a circular
> locking
> dependency involving fs_reclaim and swap_guard can occur, leading to
> a
> deadlock such as:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> WARNING: possible circular locking dependency detected
> ------------------------------------------------------
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 CPU1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ----
> =C2=A0lock(fs_reclaim);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&sa_manager->swap_guard);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(fs_reclaim);
> =C2=A0lock(&sa_manager->swap_guard);
>=20
> =C2=A0*** DEADLOCK ***
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> To avoid this, the BB pointer allocation is separated from
> xe_bb_ccs_new(),
> used drm_suballoc_alloc() for SA allocation and drm_suballoc_init()
> for BB
> allocation preventing reclaim from being invoked in this context.
>=20
> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands
> with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> ---
> V1 -> V2:
> - Used drm_suballoc_alloc() and drm_suballoc_init() for BB allocation
> (Thomas).
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 +++++=
+++--------------
> =C2=A0drivers/gpu/drm/xe/xe_bb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 =
++--
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++++++++----
> =C2=A0drivers/gpu/drm/xe/xe_sa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 +++++=
+++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_sa.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++=
++++++++++++++
> =C2=A05 files changed, 78 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 8b678297aaa2..9a04d0e814d3 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -59,16 +59,14 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> dwords, bool usm)
> =C2=A0	return ERR_PTR(err);
> =C2=A0}
> =C2=A0
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			=C2=A0=C2=A0=C2=A0 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +int xe_bb_ccs_new(struct xe_gt *gt, struct xe_bb *bb, struct
> drm_suballoc *sa,
> +		=C2=A0 u32 dwords, enum xe_sriov_vf_ccs_rw_ctxs ctx_id)

Should be called xe_bb_ccs_init()?

> =C2=A0{
> -	struct xe_bb *bb =3D kmalloc(sizeof(*bb), GFP_KERNEL);
> =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> =C2=A0	struct xe_sa_manager *bb_pool;
> +	int timeout =3D HZ;
> =C2=A0	int err;
> =C2=A0
> -	if (!bb)
> -		return ERR_PTR(-ENOMEM);
> =C2=A0	/*
> =C2=A0	 * We need to allocate space for the requested number of
> dwords &
> =C2=A0	 * one additional MI_BATCH_BUFFER_END dword. Since the whole
> SA
> @@ -78,20 +76,16 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32
> dwords,
> =C2=A0	 */
> =C2=A0
> =C2=A0	bb_pool =3D xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> -	bb->bo =3D xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> +	err =3D xe_sa_bo_new_init(bb_pool, sa, 4 * (dwords + 1),
> timeout);
> =C2=A0
> -	if (IS_ERR(bb->bo)) {
> -		err =3D PTR_ERR(bb->bo);
> -		goto err;
> -	}
> +	if (err)
> +		return err;
> =C2=A0
> +	bb->bo =3D sa;
> =C2=A0	bb->cs =3D xe_sa_bo_cpu_addr(bb->bo);
> =C2=A0	bb->len =3D 0;
> =C2=A0
> -	return bb;
> -err:
> -	kfree(bb);
> -	return ERR_PTR(err);
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static struct xe_sched_job *
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 2a8adc9a6dee..3da4652cf0b0 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -16,8 +16,8 @@ struct xe_sched_job;
> =C2=A0enum xe_sriov_vf_ccs_rw_ctxs;
> =C2=A0
> =C2=A0struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			=C2=A0=C2=A0=C2=A0 enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> +int xe_bb_ccs_new(struct xe_gt *gt, struct xe_bb *bb, struct
> drm_suballoc *sa,
> +		=C2=A0 u32 dwords, enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> =C2=A0struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bb *bb);
> =C2=A0struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queu=
e
> *q,
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 078a9bc2821d..15d73814a08a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1109,6 +1109,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile
> *tile, struct xe_exec_queue *q,
> =C2=A0	struct xe_sriov_vf_ccs_ctx *ctx;
> =C2=A0	struct xe_sa_manager *bb_pool;
> =C2=A0	u64 size =3D xe_bo_size(src_bo);
> +	struct drm_suballoc *sa;
> =C2=A0	struct xe_bb *bb =3D NULL;
> =C2=A0	u64 src_L0, src_L0_ofs;
> =C2=A0	u32 src_L0_pt;
> @@ -1148,15 +1149,28 @@ int xe_migrate_ccs_rw_copy(struct xe_tile
> *tile, struct xe_exec_queue *q,
> =C2=A0		size -=3D src_L0;
> =C2=A0	}
> =C2=A0
> +	bb =3D kmalloc(sizeof(*bb), GFP_KERNEL);
> +	if (!bb) {
> +		err =3D -ENOMEM;
> +		goto err_bb;
> +	}
> +
> +	sa =3D drm_suballoc_alloc(GFP_KERNEL);
> +	if (IS_ERR(sa)) {
> +		drm_err(&xe->drm, "Sub-allocator memory allocation
> failed with %ld\n",
> +			PTR_ERR(sa));
> +		err =3D PTR_ERR(sa);
> +		goto err_sa;
> +	}
> +

The above should be replaced by a new function xe_bb_alloc().

> =C2=A0	bb_pool =3D ctx->mem.ccs_bb_pool;
> =C2=A0	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> =C2=A0	xe_sa_bo_swap_shadow(bb_pool);
> =C2=A0
> -	bb =3D xe_bb_ccs_new(gt, batch_size, read_write);
> -	if (IS_ERR(bb)) {
> +	err =3D xe_bb_ccs_new(gt, bb, sa, batch_size, read_write);

And this should be xe_bb_ccs_init().

> +	if (err) {
> =C2=A0		drm_err(&xe->drm, "BB allocation failed.\n");
> -		err =3D PTR_ERR(bb);
> -		return err;
> +		goto err_bb_ccs;
> =C2=A0	}
> =C2=A0
> =C2=A0	batch_size_allocated =3D batch_size;
> @@ -1208,6 +1222,13 @@ int xe_migrate_ccs_rw_copy(struct xe_tile
> *tile, struct xe_exec_queue *q,
> =C2=A0	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> =C2=A0	xe_sa_bo_sync_shadow(bb->bo);
> =C2=A0	return 0;
> +
> +err_bb_ccs:
> +	drm_suballoc_release(sa);
> +err_sa:
> +	kfree(bb);
> +err_bb:
> +	return err;

And corresponding error path.

> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 5efbb5a09f77..2cfe6a353299 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -181,6 +181,30 @@ struct drm_suballoc *__xe_sa_bo_new(struct
> xe_sa_manager *sa_manager, u32 size,
> =C2=A0	return drm_suballoc_new(&sa_manager->base, size, gfp, true,
> 0);
> =C2=A0}
> =C2=A0
> +/**
> + * __xe_sa_bo_new_init() - Make a suballocation with given SA.

Avoid external functions starting with __

> + * @sa_manager: the &xe_sa_manager
> + * @sa : Uninitalized sub allocator
> + * @size: number of bytes we want to suballocate
> + * @timeout: Timeout in jiffies waiting for allocation.
> + *
> + * Try to make a suballocation of size @size.
> + *
> + * Return: zero on success, errno on failure.
> + */
> +int __xe_sa_bo_new_init(struct xe_sa_manager *sa_manager, struct
> drm_suballoc *sa,
> +			u32 size, int timeout)
> +{
> +	/*
> +	 * BB to large, return -ENOBUFS indicating user should split
> +	 * array of binds into smaller chunks.
> +	 */

This is a double layer violation. Upper layers should not be aware that
xe_sa_manager is using drm_suballoc internally. And the xe_sa_manager
should not adapt error codes to what upper layers return to their
callers. The code should be self-contained and reusable for other
purposes. I'm not sure this function is needed.


> +	if (size > sa_manager->base.size)
> +		return -ENOBUFS;
> +
> +	return drm_suballoc_init(&sa_manager->base, sa, size, true,
> 0, timeout);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_sa_bo_flush_write() - Copy the data from the sub-allocation t=
o
> the GPU memory.
> =C2=A0 * @sa_bo: the &drm_suballoc to flush
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 05e9a4e00e78..9cb8722779a4 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -18,6 +18,8 @@ struct xe_tile;
> =C2=A0struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile,
> u32 size,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 guard, u32 align,
> u32 flags);
> =C2=A0struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager
> *sa_manager, u32 size, gfp_t gfp);
> +int __xe_sa_bo_new_init(struct xe_sa_manager *sa_manager, struct
> drm_suballoc *sa,
> +			u32 size, int timeout);
> =C2=A0
> =C2=A0static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct
> xe_tile *tile, u32 size, u32 align)
> =C2=A0{
> @@ -38,6 +40,23 @@ static inline struct drm_suballoc
> *xe_sa_bo_new(struct xe_sa_manager *sa_manager
> =C2=A0	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_sa_bo_new_init() - Make a suballocation.
> + * @sa_manager: the &xe_sa_manager
> + * @sa : Uninitialized sub-allocator
> + * @size: number of bytes we want to suballocate
> + * @timeout: Time to a wait suballocation to become available.
> + *
> + * Try to make a suballocation of size @size.
> + *
> + * Return: zero on success, errno on failure.
> + */
> +static inline int xe_sa_bo_new_init(struct xe_sa_manager
> *sa_manager,
> +				=C2=A0=C2=A0=C2=A0 struct drm_suballoc *sa, u32
> size, int timeout)
> +{
> +	return __xe_sa_bo_new_init(sa_manager, sa, size, timeout);
> +}

I think this should be split into xe_sa_bo_alloc() and xe_sa_bo_init()=20

> +
> =C2=A0void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
> =C2=A0void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
> =C2=A0void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence
> *fence);

Thanks,
Thomas


