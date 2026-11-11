Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A6606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 03:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJ/QlJFN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A86B10E061;
	Wed, 11 Nov 2026 03:53:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF9010E061
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 03:53:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B3D9F4565B;
 Wed, 11 Nov 2026 03:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890091F0089F;
 Wed, 11 Nov 2026 03:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794369198;
 bh=J5rPZ2vb62AKtBMHDh/FYf78O3cDaSZ+SHn739uq0ZE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JJ/QlJFNXcPyCr7Zmt98XDaUUZ2SoTIbw3dJMxkdalhA1Xe5vUJrNyleqvT8bg0vN
 fgdPGyCJmZinh/T6aUODWXSgLKRJeK6yTAYQgpefdON1darstJdY3OTz00j3V1D8OM
 Ax4mE1DRr+tl6Sff0YhdMDD9CttQYG1CRFrqluCcd890LH+X61rHygCR9KFoLVsikX
 7QUQlzeWgQYoWyg4p5zL44Fydl8FWB9zjm0ZLamEyJ4NS4Pg7LO7hbD0kC+rvtMTvZ
 6W8t/lonSEqcw5uagTgWAxwbfk8H6z2ykXMxfs6oPOKDETVEk2eAnCApUoT26W1gve
 8vlvPNf61/UQw==
Message-ID: <sashiko-outbox-208243@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/11] drm/xe: Run page table updates on the media GT
 when there is no primary
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261110231442.218721-20-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
 <20261110231442.218721-20-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:53:16 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe: uninitialized usm.bb_pool and NULL paging_hwe0 on media
  GT
- [Medium] drm/xe: silent no-op blit jobs on video engine in xe_migrate
  when no primary GT
It also noticed 2 related pre-existing issues this patch does not
introduce:
- [Medium] drm/xe: memory leak in xe_migrate_init() [1]
- [High] drm/xe/migrate: missing fence sync and leak in
  xe_migrate_vram_copy_chunk() [2]
--

commit 1ce7e5d250d71a445cdd76886f86f447f08f9a48
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Run page table updates on the media GT when there is no primary

This commit adds xe_tile_pt_gt() and xe_tile_pt_class() so page table
updates and migration queue initialization fall back to the media GT and a
video decode engine when a tile has no primary GT.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 19c37eb315893..754592c5cf881 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
[ ... ]
> @@ -478,7 +479,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *til=
e, struct xe_migrate *m,
>  		if (xe->info.has_usm) {
>  			xe_tile_assert(tile, xe_bo_size(batch) =3D=3D SZ_1M);
> =20
> -			batch =3D tile->primary_gt->usm.bb_pool->bo;
> +			batch =3D xe_tile_pt_gt(tile)->usm.bb_pool->bo;
>  			m->usm_batch_base_ofs =3D m->batch_base_ofs + SZ_1M;
>  			xe_tile_assert(tile, xe_bo_size(batch) =3D=3D SZ_512K);
> =20
> @@ -499,7 +500,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *til=
e, struct xe_migrate *m,
>  		m->batch_base_ofs =3D xe_migrate_vram_ofs(xe, batch_addr, false);
> =20
>  		if (xe->info.has_usm) {
> -			batch =3D tile->primary_gt->usm.bb_pool->bo;
> +			batch =3D xe_tile_pt_gt(tile)->usm.bb_pool->bo;
>  			batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>  			m->usm_batch_base_ofs =3D xe_migrate_vram_ofs(xe, batch_addr, false);
>  		}

[Severity: High]
Can this dereference a NULL usm.bb_pool when xe_tile_pt_gt(tile) falls back
to the media GT?

On Xe2+ platforms with the primary GT disabled via gt_types_allowed=3Dmedia=
 in
configfs, xe->info.has_usm is still true from the hardware graphics
descriptor, but gt_init_with_all_forcewake() only initializes
gt->usm.bb_pool when xe_gt_is_main_type(gt) is true:

drivers/gpu/drm/xe/xe_gt.c:gt_init_with_all_forcewake() {
	if (xe_gt_is_main_type(gt)) {
		if (gt_to_xe(gt)->info.has_usm) {
			...
			gt->usm.bb_pool =3D xe_sa_bo_manager_init(...);
		}
	}

	if (gt =3D=3D xe_tile_pt_gt(gt_to_tile(gt))) {
		err =3D xe_migrate_init(gt_to_tile(gt)->migrate);
}

In addition, when xe->info.has_usm is true, xe_migrate_init() and
xe_exec_queue_create_bind() require gt->usm.paging_hwe0 and
gt->usm.paging_logical_mask and return -EINVAL if they are unset, but those
fields are only populated from XE_ENGINE_CLASS_COPY engines and remain zero
on a media GT.

> @@ -787,7 +788,7 @@ static void xe_migrate_ulls_exit(struct work_struct *=
work)
>  int xe_migrate_init(struct xe_migrate *m)
>  {
>  	struct xe_tile *tile =3D m->tile;
> -	struct xe_gt *primary_gt =3D tile->primary_gt;
> +	struct xe_gt *gt =3D xe_tile_pt_gt(tile);
>  	struct xe_device *xe =3D tile_to_xe(tile);
>  	struct xe_vm *vm;
>  	int err;
> @@ -803,8 +804,8 @@ int xe_migrate_init(struct xe_migrate *m)
>  		goto err_out;
> =20
>  	if (xe->info.has_usm) {
> -		struct xe_hw_engine *hwe0 =3D primary_gt->usm.paging_hwe0;
> -		u32 logical_mask =3D primary_gt->usm.paging_logical_mask;
> +		struct xe_hw_engine *hwe0 =3D gt->usm.paging_hwe0;
> +		u32 logical_mask =3D gt->usm.paging_logical_mask;
> =20
>  		if (!hwe0 || !logical_mask) {
>  			err =3D -EINVAL;
> @@ -821,8 +822,8 @@ int xe_migrate_init(struct xe_migrate *m)
>  					    EXEC_QUEUE_FLAG_MIGRATE |
>  					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
>  	} else {
> -		m->q =3D xe_exec_queue_create_class(xe, primary_gt, vm,
> -						  XE_ENGINE_CLASS_COPY,
> +		m->q =3D xe_exec_queue_create_class(xe, gt, vm,
> +						  xe_tile_pt_class(tile),
>  						  EXEC_QUEUE_FLAG_KERNEL |
>  						  EXEC_QUEUE_FLAG_MIGRATE, 0);
>  	}

[Severity: Medium]
This problem wasn't introduced by this patch, but if exec queue creation
fails in xe_migrate_init() [1], does jumping to err_out leak m->pt_bo?

xe_migrate_lock_prepare_vm() allocates m->pt_bo before the queue is created,
while the xe_migrate_fini() devm action that unpins m->pt_bo is only
registered after queue creation succeeds, and err_out only calls
xe_vm_close_and_put(vm).

[ ... ]

> @@ -1714,7 +1715,7 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct=
 xe_bo *vram_bo, u64 vram_off
>  {
>  	struct xe_device *xe =3D xe_bo_device(vram_bo);
>  	struct xe_tile *tile =3D vram_bo->tile;
> -	struct xe_gt *gt =3D tile->primary_gt;
> +	struct xe_gt *gt =3D xe_tile_pt_gt(tile);
>  	struct xe_migrate *m =3D tile->migrate;
>  	struct dma_fence *fence =3D NULL;
>  	struct ttm_resource *vram =3D vram_bo->ttm.resource;

[Severity: High]
This problem wasn't introduced by this patch, but if xe_bb_new() or
xe_bb_create_migration_job() fails on a second or later pass of the copy
loop in xe_migrate_vram_copy_chunk() [2], does returning ERR_PTR(err)
directly leak the previous pass's fence and leave its DMA in flight?

Each completed pass stores a reference to the submitted job's fence in
local variable fence, but the error returns inside the while (size) loop do
not wait on or put fence before returning:

drivers/gpu/drm/xe/xe_migrate.c:xe_migrate_vram_copy_chunk() {
	while (size) {
		...
		bb =3D xe_bb_new(gt, batch_size, usm);
		if (IS_ERR(bb)) {
			err =3D PTR_ERR(bb);
			return ERR_PTR(err);
		}
		...
		scoped_guard(mutex, &m->job_mutex) {
			dma_fence_put(fence);
			fence =3D xe_migrate_job_push(m, job);
}

> @@ -1930,7 +1931,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrat=
e *m,
>  	bool clear_vram =3D mem_type_is_vram(dst->mem_type);
>  	bool clear_bo_data =3D XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
>  	bool clear_ccs =3D XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
> -	struct xe_gt *gt =3D m->tile->primary_gt;
> +	struct xe_gt *gt =3D xe_tile_pt_gt(m->tile);
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	bool clear_only_system_ccs =3D false;
>  	struct dma_fence *fence =3D NULL;
> @@ -2295,7 +2296,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_=
migrate *m,
>  					 struct dma_fence *deps,
>  					 const enum xe_migrate_copy_dir dir)
>  {
> -	struct xe_gt *gt =3D m->tile->primary_gt;
> +	struct xe_gt *gt =3D xe_tile_pt_gt(m->tile);
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	bool use_usm_batch =3D xe->info.has_usm;
>  	struct dma_fence *fence =3D NULL;

[Severity: Medium]
When m->q is created on XE_ENGINE_CLASS_VIDEO_DECODE, won't migration blit
jobs submitted through xe_migrate_vram(), xe_migrate_clear(), and
__xe_migrate_copy() complete and signal their fence without executing the
copy or clear batch?

xe_bb_create_migration_job() places the PTE updates in
job->ptrs[0].batch_addr and the copy or clear instructions in
job->ptrs[1].batch_addr, but emit_job_gen12_video() only emits
job->ptrs[0].batch_addr for a width-1 queue:

drivers/gpu/drm/xe/xe_ring_ops.c:emit_job_gen12_video() {
	for (i =3D 0; i < job->q->width; ++i)
		__emit_job_gen12_video(job, job->q->lrc[i],
				       job->ptrs[i].batch_addr,
				       &job->ptrs[i].head,
				       xe_sched_job_lrc_seqno(job));
}

Even after commit "drm/xe: Fall back to CPU copies when the tile cannot
blit" later in this series, callers such as xe_ttm_access_memory() (for
VRAM accesses >=3D SZ_16K via xe_migrate_access_memory() -> xe_migrate_vram=
())
and xe_vram_memtest() (via xe_migrate_clear()) do not check
xe_migrate_can_blit(), silently dropping VRAM reads/writes or failing the
boot memory test with -EIO.

[1] https://sashiko.dev/#/bug/linux-21e51c6b-d9bc-4f0f-9122-4598c0472959
[2] https://sashiko.dev/#/bug/linux-2b53019e-7f14-4ba6-80c3-68e86fcb7785

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110231442.2187=
21-13-stuart.summers@intel.com?part=3D7
