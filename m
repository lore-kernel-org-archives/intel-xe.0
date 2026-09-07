Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DB2C79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 15:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9098310E197;
	Mon,  7 Sep 2026 15:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jlST4Bwq";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B48410E197
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 15:51:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E84914363C;
 Mon,  7 Sep 2026 15:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4091F00A3A;
 Mon,  7 Sep 2026 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788796260;
 bh=X1m/tykcSSO9hreRdWVCTM7L0Vtnv8wt/MVsrTRs+hk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jlST4BwqJg9ET8Mn+odfPip+aDPOo3xvSSxs5MDtdTPMT4SKZtH05yXnOnVRQjP8O
 BlT6gLvK2XzdYb4DgFro9zdOnPAVqFu+OmL1WKFnB5ouqt3b1Bnj0ybqAZBTxhWhDB
 fphG93uL648d+n/T5beydfNHIch4bH4wr5HF5TC/lJYPYFX4l3FiEN/oDQE6DXWddl
 gbrj/b6zUuhLX9xZGbL3Qtv83pVPVQEnDzYa6vRueIYi3T10GcpWTOej1E09eIh51e
 SwDmcpSVBanFee6CzsLWoQWVp2wqk7iWGUH7ZgLDjNqBYg6noM3yGgPHRvzJDl+p0r
 T8FatNdyxbmSg==
From: sashiko-bot@kernel.org
Subject: Re: [V2] drm/xe: Skip clearing purged page-table BOs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907153706.888679-2-tejas.upadhyay@intel.com>
References: <20260907153706.888679-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 15:51:00 +0000
Message-Id: <20260907155100.9F4091F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix leaving a NULL pointer dereference on the purge fai=
lure path.
--

commit 7b05185667ad1f435ac6e264d5925cdea78caa91
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Skip clearing purged page-table BOs

This commit attempts to prevent accessing cleared vmaps during VM teardown=
=20
by checking if the buffer object is purged before calling xe_map_memset().

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5d990c1c3740a..a9b9cd7ac2c87 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
[ ... ]
> @@ -236,9 +236,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, stru=
ct llist_head *deferred)
>  */
> void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
> {
> -	struct iosys_map *map =3D &pt->bo->vmap;
> +	struct xe_bo *bo =3D pt->bo;
>=20
> -	xe_map_memset(xe, map, 0, 0, SZ_4K);
> +	xe_bo_assert_held(bo);
> +	if (!xe_bo_is_purged(bo))
> +		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);

[Severity: High]
This isn't a bug introduced by this patch, but does this incomplete fix sti=
ll
leave a NULL pointer dereference if the purge operation fails?

If a VRAM fault triggers xe_ttm_vram_purge_page() on a root page table BO,
the sequence first unmaps the virtual mapping before attempting the purge:

xe_ttm_vram_mgr.c:xe_ttm_vram_purge_page() {
    ...
    xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
    ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
    if (xe_bo_is_pinned(bo))
        xe_bo_unpin(bo);
    ret =3D xe_ttm_bo_purge(&bo->ttm, &ctx);
    ...
}

During the ttm_bo_unmap_virtual() sequence, bo->vmap is cleared. If
xe_ttm_bo_purge() subsequently fails (for example, due to a memory allocati=
on
failure in ttm_bo_validate()), the BO remains in the DONTNEED state rather
than becoming PURGED.

Later, when xe_vm_close() calls xe_pt_clear(), this newly added check
(!xe_bo_is_purged(bo)) will evaluate to true because the BO is only in the
DONTNEED state, not PURGED.

Could xe_map_memset() then be called with the cleared (NULL) bo->vmap,
causing a crash?

Would it be safer to explicitly guard against cleared mappings by checking
!iosys_map_is_null(&bo->vmap) here instead?

> }
>=20
> /**

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907153706.8886=
79-2-tejas.upadhyay@intel.com?part=3D1
