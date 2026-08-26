Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF1EC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 14:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBCB10E27F;
	Wed, 26 Aug 2026 14:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UJ2yPEBn";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A63A10E27F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 14:07:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D87640C17;
 Wed, 26 Aug 2026 14:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BF61F000E9;
 Wed, 26 Aug 2026 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787753250;
 bh=uzHFmd/Ou1SkJsp1rJ2BLlH3ZkJ6Zektq2fgSWmvlDo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UJ2yPEBnWC4W7i9loImnEV15O+Tpjx6An7/tWDW0u8Q6eB5HiQ/+fmX/dECPvZXqV
 yjzmzoapLbF9d4Q3qCC3LsPmr+6GuW5pSaFurSwg+n3nNOSRKhHSfMJtxoCWuSCJK2
 qsxyzjBSNKpWxbhFeVSPqL0mqCY4HIidY1fH27fTQtf5dRUCw6+siYqwWgEVEQlFTq
 y02MAtlnubYMwWMx3pD2DEnQySNwrzkxEpebsA8B/3fD9mv0/4bTUTSPI+hKzVPu8B
 RQhybvDx6rSr7cbyJmnxiiCGCka3xVaVQvOMmlBg6HVhcScWEwfzjtBfQMcUK+A4TQ
 /5fqDLgzlQDag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram pages
 as well
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260826135136.204044-19-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-19-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 14:07:29 +0000
Message-Id: <20260826140729.C8BF61F000E9@smtp.kernel.org>
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
- [Critical] Calling `xe_bo_is_vram()` on a purged BO causes a NULL pointer=
 dereference because `bo->ttm.resource` is NULL.
--

commit 8ea3d385f1cb1d34b69c171b968bd8b676aaa611
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe: Extend BO purge to handle vram pages as well

Recent driver update introduce support for purgeable buffer
objects (BOs), extending the API to include VRAM pages to
better manage memory pressure and enable memory offlining.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index dde309821237b..52f81e972adad 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -921,7 +921,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>   *
>   * Return: 0 on success, negative error code on failure
>   */
> -static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_=
operation_ctx *ctx)
> +int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operati=
on_ctx *ctx)
>  {
>  	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
>  	struct ttm_placement place =3D {};
> @@ -929,9 +929,6 @@ static int xe_ttm_bo_purge(struct ttm_buffer_object *=
ttm_bo, struct ttm_operatio
> =20
>  	xe_bo_assert_held(bo);
> =20
> -	if (!ttm_bo->ttm)
> -		return 0;
> -

[Severity: Critical]
This is a pre-existing issue, but I have a question about how xe_bo_is_vram=
()
handles purged BOs.

When a BO is purged, its TTM resource is freed and set to NULL. However,
xe_bo_is_vram() unconditionally passes bo->ttm.resource to resource_is_vram=
(),
which then dereferences it:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_is_vram() {
	return resource_is_vram(bo->ttm.resource) ||
		resource_is_stolen_vram(xe_bo_device(bo), bo->ttm.resource);
}

drivers/gpu/drm/xe/xe_bo.c:resource_is_vram() {
	return mem_type_is_vram(res->mem_type);
}

This can lead to a NULL pointer dereference. For instance, in madvise_atomi=
c(),
an unprivileged user can trigger this on a purged BO:

drivers/gpu/drm/xe/xe_vm_madvise.c:madvise_atomic() {
    ...
		/* Invalidate cpu page table, so bo can migrate to smem in next access */
		if (xe_bo_is_vram(bo) &&
		    (bo->attr.atomic_access =3D=3D DRM_XE_ATOMIC_CPU ||
		     bo->attr.atomic_access =3D=3D DRM_XE_ATOMIC_GLOBAL))
			ttm_bo_unmap_virtual(&bo->ttm);
    ...
}

It is also called unguarded in xe_pt_target_leaf_level_from_bo(), which cou=
ld
crash during VM rebind if debug page size mode is enabled:

drivers/gpu/drm/xe/xe_pt.c:xe_pt_target_leaf_level_from_bo() {
    ...
	if (!bo || !xe_bo_is_vram(bo) || !(bo->flags & XE_BO_FLAG_USER))
		return 0;
    ...
}

Does xe_bo_is_vram() need a check for !bo->ttm.resource before accessing
res->mem_type to prevent a kernel oops or panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826135136.2040=
44-16-tejas.upadhyay@intel.com?part=3D3
