Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A534606A516
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 06:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3d+5BGz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDA711253F;
	Fri, 20 Nov 2026 06:10:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C39A112545
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 06:10:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DC6D144212;
 Fri, 20 Nov 2026 06:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34351F000CA;
 Fri, 20 Nov 2026 06:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795155003;
 bh=fkUMOrky/2QCkWRhibUvnfMwsLtWHlHnzfbW3hdTsp8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=F3d+5BGzIZvGUZABNJO1orKEuK9I4LV6hV4jsqf0DYYmK5dauw6q4sh5lpLa+PM6H
 bVlV0BDpgM9/J3c6lR+PFG8rT8znfSSi03+nCXgStQSw7TdnNjWFJEcoqe3hFU12Of
 R1PoUUecXG/GT5XuRLKdVqAqhzKdAPmqzM9nFkvycEvFUXFWMK/s6rPolCHUnx3pLH
 WjOAuwq6GjGiRXof/OUZf5fHhcIVUNbIwCWfa7Bm3no7MTUVkAu5z+7ZVx3D2UNc+P
 mCo7lktbCBu3MmIv7+S1NduafxAIcSxIGY152iZwYkuzphApoocBo12pu+ASo+Tx1q
 qXUm+PHp4iq7A==
Message-ID: <sashiko-outbox-224538@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/16] drm/xe: Run page table updates on the media GT
 when there is no primary
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261120054712.377573-29-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
 <20261120054712.377573-29-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 06:10:03 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] drm/xe: xe_gt_flr_prepare() and xe_gt_reinit() skip
  media-only tile migration
- [Medium] drm/xe: NULL dereference of usm.bb_pool in
  xe_migrate_prepare_vm()
- [Medium] drm/xe: silent no-op blit copy and clear on media-only tiles
  in xe_migrate
--

commit e4d0026f61d092e34250b892e47f82036445a7f5
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Run page table updates on the media GT when there is no primary

This commit introduces xe_tile_pt_gt() and xe_tile_pt_class() so that tile
migration and bind exec queues fall back to the media GT and a video
decode engine when a tile has no primary GT.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index fe71cb011d3a0..327e4985d8586 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c

[ ... ]

> @@ -657,10 +658,12 @@ static int gt_init_with_all_forcewake(struct xe_gt =
*gt)
>  		}
>  	}
> =20
> -	if (xe_gt_is_main_type(gt)) {
> -		struct xe_tile *tile =3D gt_to_tile(gt);
> -
> -		err =3D xe_migrate_init(tile->migrate);
> +	/*
> +	 * Normally the migration context runs on the primary GT, but a tile
> +	 * with no graphics IP has only its media GT to run it on.
> +	 */
> +	if (gt =3D=3D xe_tile_pt_gt(gt_to_tile(gt))) {
> +		err =3D xe_migrate_init(gt_to_tile(gt)->migrate);
>  		if (err)
>  			return err;
>  	}

[Severity: Medium]
Should xe_gt_flr_prepare() and xe_gt_reinit() also check
gt =3D=3D xe_tile_pt_gt(gt_to_tile(gt)) instead of xe_gt_is_main_type(gt)?

On a tile with no primary GT, xe_migrate_init() now sets up tile->migrate
on the media GT, where xe_gt_is_main_type(gt) is false.  Across a PCIe
FLR, xe_uc_flr_prepare() tears down the media GT's GuC queues (including
tile->migrate->q), while xe_gt_flr_prepare() and xe_gt_reinit() skip
xe_migrate_flr_prepare() and xe_migrate_reinit(), leaving the migration VM
page tables and queue uninitialized after resume.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index d7a8d8ecffe63..8fc3e5d500a2b 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c

[ ... ]

> @@ -485,7 +486,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *til=
e, struct xe_migrate *m,
>  		if (xe->info.has_usm) {
>  			xe_tile_assert(tile, xe_bo_size(batch) =3D=3D SZ_1M);
> =20
> -			batch =3D tile->primary_gt->usm.bb_pool->bo;
> +			batch =3D xe_tile_pt_gt(tile)->usm.bb_pool->bo;
>  			m->usm_batch_base_ofs =3D m->batch_base_ofs + SZ_1M;
>  			xe_tile_assert(tile, xe_bo_size(batch) =3D=3D SZ_512K);
> =20
> @@ -506,7 +507,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *til=
e, struct xe_migrate *m,
>  		m->batch_base_ofs =3D xe_migrate_vram_ofs(xe, batch_addr, false);
> =20
>  		if (xe->info.has_usm) {
> -			batch =3D tile->primary_gt->usm.bb_pool->bo;
> +			batch =3D xe_tile_pt_gt(tile)->usm.bb_pool->bo;
>  			batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>  			m->usm_batch_base_ofs =3D xe_migrate_vram_ofs(xe, batch_addr, false);
>  		}

[Severity: Medium]
Can xe_tile_pt_gt(tile)->usm.bb_pool be NULL here when tile->primary_gt is
NULL and xe->info.has_usm is set (for example, with gt_types_allowed=3Dmedia
in configfs on an Xe2+ platform)?

gt_init_with_all_forcewake() only allocates gt->usm.bb_pool when
xe_gt_is_main_type(gt) is true, so tile->media_gt->usm.bb_pool is NULL and
xe_migrate_prepare_vm() dereferences a NULL pointer.  Even if bb_pool were
allocated on xe_tile_pt_gt(tile), media GTs have no copy engines, so
gt->usm.paging_hwe0 is also NULL and the xe->info.has_usm paths in
xe_migrate_init() and xe_exec_queue_create_bind() will fail with -EINVAL
instead of falling back to xe_tile_pt_class(tile).

[ ... ]

> @@ -1276,7 +1277,7 @@ static struct dma_fence *__xe_migrate_copy(struct x=
e_migrate *m,
>  					   bool copy_only_ccs,
>  					   bool is_vram_resolve)
>  {
> -	struct xe_gt *gt =3D m->tile->primary_gt;
> +	struct xe_gt *gt =3D xe_tile_pt_gt(m->tile);
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	struct dma_fence *fence =3D NULL;
>  	u64 size =3D xe_bo_size(src_bo);

[ ... ]

> @@ -1992,7 +1993,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrat=
e *m,
>  	bool clear_vram =3D is_devmem(bo, dst);
>  	bool clear_bo_data =3D XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
>  	bool clear_ccs =3D XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
> -	struct xe_gt *gt =3D m->tile->primary_gt;
> +	struct xe_gt *gt =3D xe_tile_pt_gt(m->tile);
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	bool clear_only_system_ccs =3D false;
>  	struct dma_fence *fence =3D NULL;
> @@ -2357,7 +2358,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_=
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
When m->q is created on XE_ENGINE_CLASS_VIDEO_DECODE, do these blit copy
and clear paths silently succeed without copying or clearing memory?

A migration job puts the PTE updates in job->ptrs[0].batch_addr and the
blitter commands in job->ptrs[1].batch_addr, but the video decode ring
ops only emit job->ptrs[0]:

drivers/gpu/drm/xe/xe_ring_ops.c:emit_job_gen12_video() {
	for (i =3D 0; i < job->q->width; ++i)
		__emit_job_gen12_video(job, job->q->lrc[i],
				       job->ptrs[i].batch_addr,
				       &job->ptrs[i].head,
				       xe_sched_job_lrc_seqno(job));
}

With q->width =3D=3D 1, the engine executes only the PTE batch and signals =
the
job fence without running the copy or clear batch.  Later in the series,
commit "drm/xe: Fall back to CPU copies when the tile cannot blit" adds
xe_migrate_can_blit() checks to TTM moves, but other callers remain
unguarded: xe_ttm_access_memory() still calls xe_migrate_access_memory()
-> xe_migrate_vram() when len >=3D SZ_16K (silently dropping ptrace or
/proc/<pid>/mem reads and writes on VRAM BOs), and xe_vram_memtest() calls
xe_migrate_clear() and fails probe with -EIO when CONFIG_DRM_XE_DEBUG_MEM
is enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120054712.3775=
73-18-stuart.summers@intel.com?part=3D11
