Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFDA606A32F
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i48ZnpoS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72833112F15;
	Fri,  6 Nov 2026 16:46:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580BA112F15
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 16:46:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id ACE82601BF;
 Fri,  6 Nov 2026 16:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEE81F0089F;
 Fri,  6 Nov 2026 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793983574;
 bh=OOB8RhyRnMuqw1A6VEc7gMjkDSMhgBskIsU4eO5lw0Y=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=i48ZnpoSZ9ZoJ2EES1HLNzpa5O18LZpnkeOfikQUv4750ZlBPXGFmLezj69EqHMPs
 EMu2A0fhIFNgLSwyET2jdNGGwjUolNXjHMuIsK2jSkgCHDocCp2rZcf0Bpts81tB7f
 HiBKlyEV+W8IgdhyNTImteVcL8kgD6eDfvOg9IiZ1bISXsLEK87TLzv70dJPazSLLf
 o0sTjcHIufoXuUf2P9+v6WyXZp3vIEE7f0cB8SI6X/SsdhEECj0ho7eXhInuY7xFtZ
 DYCFOMGV/6uEe+JuHM3l5wga+cAGgAge1edxQUhWGGGuxFfViXJ9HDTQPviZNWOvxA
 OpzvgqPMtkfWg==
Message-ID: <sashiko-outbox-201857@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe: After VF migration, repeat BO mapping in
 progress
To: "Tomasz Lis" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261106155615.977330-3-tomasz.lis@intel.com>
References: <20261106155615.977330-1-tomasz.lis@intel.com>
 <20261106155615.977330-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 16:46:13 +0000
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

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] drm/xe: NULL pointer dereference of memirq->bo in
  __xe_ggtt_insert_bo_at()
- [Medium] drm/xe: repeated subtraction of ggtt->start on retry in
  __xe_ggtt_insert_bo_at()
- [Medium] drm/xe: stale GGTT PTEs left on migration retry in
  __xe_ggtt_insert_bo_at()
- [Medium] drm/xe: non-sleeping retry loop in __xe_ggtt_insert_bo_at()
  on pending signal
- [Low] drm/xe: stale comment in __xe_exec_queue_init() after moving
  GGTT wait
--

commit d7047c9701b23419a2eabde20e6e0dc9d936b73d
Author: Tomasz Lis <tomasz.lis@intel.com>

drm/xe: After VF migration, repeat BO mapping in progress

This commit moves the VF post-migration GGTT retry loop from LRC creation
in __xe_exec_queue_init() to BO GGTT insertion in __xe_ggtt_insert_bo_at()
so that all GGTT BO mappings are rewritten if a VF migration occurs while
PTEs are being programmed.

> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 23fd0f6cba7f1..ed24b11fdb905 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -431,28 +431,17 @@ static int __xe_exec_queue_init(struct xe_exec_queu=
e *q, u32 exec_queue_flags)
>  	 * from the moment vCPU resumes execution.
>  	 */
>  	for (i =3D 0; i < q->width; ++i) {
> -		struct xe_lrc *__lrc =3D NULL;
> -		int marker;
> =20
> -		do {
> -			struct xe_lrc *lrc;
> -
> -			marker =3D xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> -
> -			lrc =3D xe_lrc_create(q->hwe, q->vm, q->replay_state,
> -					    xe_lrc_ring_size(), q->msix_vec, flags);
> -			if (IS_ERR(lrc)) {
> -				err =3D PTR_ERR(lrc);
> -				goto err_lrc;
> -			}
> -
> -			xe_exec_queue_set_lrc(q, lrc, i);
> +		struct xe_lrc *lrc;
> =20
> -			if (__lrc)
> -				xe_lrc_put(__lrc);
> -			__lrc =3D lrc;
> +		lrc =3D xe_lrc_create(q->hwe, q->vm, q->replay_state,
> +				    xe_lrc_ring_size(), q->msix_vec, flags);
> +		if (IS_ERR(lrc)) {
> +			err =3D PTR_ERR(lrc);
> +			goto err_lrc;
> +		}
> =20
> -		} while (marker !=3D xe_vf_migration_fixups_complete_count(q->gt));
> +		xe_exec_queue_set_lrc(q, lrc, i);
>  	}

[Severity: Low]
This isn't a bug, but the second paragraph of the comment right above this
loop still describes waiting on inflight GGTT changes here, which this
commit moves to __xe_ggtt_insert_bo_at().

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 9ef2ce743770f..6508d301a0821 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -858,6 +860,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggt=
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

[Severity: High]
Does calling xe_gt_sriov_vf_wait_valid_ggtt() here cause a NULL pointer
dereference on memirq->bo during VF probe?

During xe_device_probe() -> xe_tile_init() -> xe_memirq_init(),
memirq_alloc_pages() creates its XE_BO_FLAG_GGTT buffer object and enters
__xe_ggtt_insert_bo_at() before assigning memirq->bo =3D bo:

drivers/gpu/drm/xe/xe_memirq.c:memirq_alloc_pages() {
    ...
	bo =3D xe_managed_bo_create_pin_map(xe, tile, bo_size,
					  XE_BO_FLAG_SYSTEM |
					  XE_BO_FLAG_GGTT |
					  ...);
	if (IS_ERR(bo)) {
		err =3D PTR_ERR(bo);
		goto out;
	}
    ...
	memirq->bo =3D bo;
}

On a VF where migration and memirq are supported,
xe_gt_sriov_vf_wait_valid_ggtt() and xe_vf_migration_fixups_complete_count()
both call vf_valid_ggtt() -> xe_memirq_guc_sw_int_0_irq_pending(), which
dereferences &memirq->bo->vmap while memirq->bo is still NULL.

> @@ -890,6 +895,18 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *gg=
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
> +			drm_mm_remove_node(&bo->ggtt_node[tile_id]->base);
> +			mutex_unlock(&ggtt->lock);
> +			goto retry;
> +		}
>  	}
>  	mutex_unlock(&ggtt->lock);

[Severity: Medium]
When this jumps to retry, doesn't __xe_ggtt_insert_bo_at() subtract
ggtt->start from start and end a second time?

Between the retry label and drm_mm_insert_node_in_range(), start and end are
converted in place into offsets relative to ggtt->start:

drivers/gpu/drm/xe/xe_ggtt.c:__xe_ggtt_insert_bo_at() {
    ...
	if (start >=3D ggtt->start)
		start -=3D ggtt->start;
	else
		start =3D 0;

	/* Should never happen, but since we handle start, fail graciously for end=
 */
	if (end >=3D ggtt->start)
		end -=3D ggtt->start;
	else
		end =3D 0;

	xe_tile_assert(ggtt->tile, end >=3D start + xe_bo_size(bo));
    ...
}

On a retry after migration, start and end already hold relative offsets, so
subtracting the updated ggtt->start again (or clamping end to 0 when the
relative offset is below ggtt->start) corrupts the range, can trigger the
xe_tile_assert(), and causes drm_mm_insert_node_in_range() to allocate at
the wrong offset or fail with -ENOSPC.

[Severity: Medium]
Can removing the drm_mm node without clearing its PTEs leave stale GGTT
mappings behind on retry?

Unlike ggtt_node_remove(), the retry path calls drm_mm_remove_node() without
xe_ggtt_clear() and drops ggtt->lock before re-inserting.  Because PF
save/restore copies the PTEs already written before migration to the same
relative offset in the new GGTT range, if another allocation claims part of
that range while ggtt->lock is dropped or if the retry fails, those migrated
PTEs remain live in an unallocated drm_mm hole instead of pointing to the
scratch page.  Since ggtt->mm uses relative offsets that do not change acro=
ss
xe_ggtt_shift_nodes(), keeping the drm_mm node allocated and only redoing
xe_ggtt_map_bo() after waiting for a valid GGTT would avoid both re-inserti=
ng
the node and leaving stale PTEs.

[Severity: Medium]
If the calling thread has a pending signal while VF migration fixups are in
progress, will this retry loop spin without sleeping while repeatedly taking
ggtt->lock?

xe_gt_sriov_vf_wait_valid_ggtt() uses wait_event_interruptible_timeout(),
ignores -ERESTARTSYS, and returns the current fixups_complete_count (>=3D 0)
even when vf_valid_ggtt() is still false.  __xe_ggtt_insert_bo_at() then
locks ggtt->lock, writes all PTEs for the BO, sees
xe_vf_migration_fixups_complete_count() return -1, and loops back to retry
without sleeping, contending on ggtt->lock against xe_ggtt_shift_nodes() in
the migration recovery worker.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106155615.9773=
30-1-tomasz.lis@intel.com?part=3D2
