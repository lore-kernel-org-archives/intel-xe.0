Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3556A606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 22:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g3bNd4eL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2BB10E48A;
	Fri,  6 Nov 2026 22:25:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9215A10E489
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 22:24:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 73A4460224;
 Fri,  6 Nov 2026 22:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059931F0089F;
 Fri,  6 Nov 2026 22:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794003894;
 bh=On9aqiRrGQ+tb/zastWACtQMCADNXc8xpNfkQZZDX6E=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=g3bNd4eLjg8jgcB9pMHRHvJYEw9ntl+OcK8YyLT+juh45C2YoAx45cH7Flek5glfO
 UhEgKS1atM2PwNOvufsQifAQZuRWch03VIoOCpmbYh96bswVJ+kkyvfCBr7xEPv+lk
 yj8IIh75NiYekI28Yus0/MDVnK80dMeMYg8upFz5AeI4IwuGVH1tEUTdhb8aGs7iNE
 mLVGJGfQNbp+MZnS0XpDkGNLo/clLmZ7VvdDTP6gIf784WS3v8x3nsjsgYkNqN0HAz
 HjBeewrgMpSZrqDzhN17/IJE7TSJAIENSqJQGHQxrILgNUtTCP48HYHqerJmr8GxF+
 G+xV51oO4gWEw==
Message-ID: <sashiko-outbox-202330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/xe: After VF migration, repeat BO mapping in
 progress
To: "Tomasz Lis" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261106215700.1218318-3-tomasz.lis@intel.com>
References: <20261106215700.1218318-1-tomasz.lis@intel.com>
 <20261106215700.1218318-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 22:24:53 +0000
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
- [Medium] drm/xe: stale GGTT base cleared under lock in
  __xe_ggtt_insert_bo_at()
- [Medium] drm/xe: infinite uninterruptible retry loop in
  __xe_ggtt_insert_bo_at()
--

commit 9aaa3dde30d5f39a2d5d350e0123ac1a3e77675f
Author: Tomasz Lis <tomasz.lis@intel.com>

drm/xe: After VF migration, repeat BO mapping in progress

This commit moves the VF post-migration retry loop from LRC creation in
__xe_exec_queue_init() down into __xe_ggtt_insert_bo_at() so that any BO
being mapped into the GGTT during VF migration has its PTEs rewritten
after the GGTT base is updated.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 9ef2ce743770f..6c2f3078afb0c 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -858,6 +861,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggt=
t, struct xe_bo *bo,
>  		goto out;
>  	}
> =20
> +retry:
> +	marker =3D xe_gt_sriov_vf_wait_valid_ggtt(ggtt->tile->primary_gt);
> +
>  	mutex_lock(&ggtt->lock);
>  	/*
>  	 * When inheriting the initial framebuffer, the framebuffer is
> @@ -867,20 +873,20 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *g=
gtt, struct xe_bo *bo,
>  	 * remainder of GGTT, unaware that the start is reserved by WOPCM.
>  	 */
>  	if (start >=3D ggtt->start)
> -		start -=3D ggtt->start;
> +		rel_start =3D start - ggtt->start;
>  	else
> -		start =3D 0;
> +		rel_start =3D 0;
> =20
>  	/* Should never happen, but since we handle start, fail graciously for =
end */
>  	if (end >=3D ggtt->start)
> -		end -=3D ggtt->start;
> +		rel_end =3D end - ggtt->start;
>  	else
> -		end =3D 0;
> +		rel_end =3D 0;
> =20
> -	xe_tile_assert(ggtt->tile, end >=3D start + xe_bo_size(bo));
> +	xe_tile_assert(ggtt->tile, rel_end >=3D rel_start + xe_bo_size(bo));
> =20
>  	err =3D drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]-=
>base,
> -					  xe_bo_size(bo), alignment, 0, start, end, 0);
> +					  xe_bo_size(bo), alignment, 0, rel_start, rel_end, 0);
>  	if (err) {
>  		ggtt_node_fini(bo->ggtt_node[tile_id]);
>  		bo->ggtt_node[tile_id] =3D NULL;
> @@ -890,6 +896,24 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *gg=
tt, struct xe_bo *bo,
>  		u64 pte =3D ggtt->pt_ops->pte_encode_flags(bo, pat_index);
> =20
>  		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
> +
> +		/*
> +		 * If VF migration happens during BO mapping, some PTE value writes may
> +		 * be ignored by HW. This can happen in case GGTT range changes; alrea=
dy
> +		 * set PTEs are moved by the VF restore, but xe_ggtt_map_bo() within VM
> +		 * may still loop at old position. To be sure, redo all PTE writes.
> +		 */
> +		if (marker !=3D xe_vf_migration_fixups_complete_count(ggtt->tile->prim=
ary_gt)) {
> +			struct xe_ggtt_node *node =3D bo->ggtt_node[tile_id];
> +			/*
> +			 * Cannot skip the clear, as after releasing the ggtt lock, another
> +			 * insert operation could immediately reserve the space.
> +			 */
> +			xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
> +			drm_mm_remove_node(&node->base);
> +			mutex_unlock(&ggtt->lock);
> +			goto retry;
> +		}
>  	}
>  	mutex_unlock(&ggtt->lock);

[Severity: Medium]
Does xe_ggtt_clear() here write scratch PTEs using the stale pre-migration
ggtt->start offset?

__xe_ggtt_insert_bo_at() holds ggtt->lock across xe_ggtt_map_bo() and this
retry check.  When VF migration happens during xe_ggtt_map_bo(),
vf_valid_ggtt() becomes false (for example, while GUC_INTR_SW_INT_0 is
pending or ggtt_need_fixes is set), so
xe_vf_migration_fixups_complete_count() returns -1 and enters this retry
branch.  However, the post-migration recovery worker updates ggtt->start
via xe_ggtt_shift_nodes(), which also has to take ggtt->lock:

drivers/gpu/drm/xe/xe_ggtt.c:xe_ggtt_shift_nodes() {
	guard(mutex)(&ggtt->lock);
    ...
	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
	WRITE_ONCE(ggtt->start, new_start);
}

Because __xe_ggtt_insert_bo_at() has not released ggtt->lock yet,
xe_ggtt_shift_nodes() cannot have updated ggtt->start when xe_ggtt_clear()
is called.  xe_ggtt_node_addr(node) therefore computes
node->base.start + old_start instead of node->base.start + new_start.
The PTEs that PF restore copied to new_start + node->base.start are left
uncleared when drm_mm_remove_node() frees the node, and if the old and new
GGTT ranges overlap, xe_ggtt_clear() overwrites PTEs at the old address
that may now belong to another allocation.

> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_vf.c
> index 4412ed6eb422f..8ac91b271137d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1615,9 +1615,9 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  	    !xe_sriov_vf_migration_supported(gt_to_xe(gt)))
>  		return 0;
> =20
> -	ret =3D wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> -					       vf_valid_ggtt(gt),
> -					       HZ * 5);
> +	ret =3D wait_event_timeout(gt->sriov.vf.migration.wq,
> +				 vf_valid_ggtt(gt),
> +				 HZ * 5);
>  	xe_gt_WARN_ON(gt, !ret);
> =20
>  	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);

[Severity: Medium]
Can __xe_ggtt_insert_bo_at() loop forever in uninterruptible sleep if
wait_event_timeout() times out while vf_valid_ggtt(gt) remains false?

On timeout (!ret), xe_gt_sriov_vf_wait_valid_ggtt() returns the
non-negative fixups_complete_count as marker, whereas
xe_vf_migration_fixups_complete_count() returns -1 whenever
!vf_valid_ggtt(gt):

drivers/gpu/drm/xe/xe_gt_sriov_vf.c:xe_vf_migration_fixups_complete_count()=
 {
    ...
	/* should never match fixups_complete_count value */
	if (!vf_valid_ggtt(gt))
		return -1;

	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
}

In __xe_ggtt_insert_bo_at(), marker !=3D -1 is always true while
vf_valid_ggtt(gt) stays false, so it jumps back to retry and sleeps
uninterruptibly for another 5 seconds indefinitely while holding the BO
dma_resv lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106215700.1218=
318-1-tomasz.lis@intel.com?part=3D2
