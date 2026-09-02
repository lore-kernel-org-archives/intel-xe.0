Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267F0C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 15:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95EE10E00A;
	Wed,  2 Sep 2026 15:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BNUFhHr0";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FC389C28
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 15:57:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 51678439E6;
 Wed,  2 Sep 2026 15:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADA41F000E9;
 Wed,  2 Sep 2026 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788364664;
 bh=T4Vm91WymNhHIUVoNxS08bjNzP7SEqGRfXCUiRUjKnQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BNUFhHr0L2Q69QgzeafN2Y02/m+4H4QG5FKfMAdYehkVrjCHAirUDq0N8yWHPXjHA
 05RsYX440BDeVM/7NgDWp/EUIIlC9pSnZOq1QDl9nSCzrlvYUtHO9IomV8kkPAqQEB
 Cu0unotr6zr3z93k2pBKo8T4kgOGCBF/3vjg31seK/2SKWP7sETh9B0hXR/+YsY9Mu
 m86tVzf4Wk0oVp2e34HA+rjR/qMwP6y8iFiJZwnzQ7ambSk5nXwaqDEqkLCuBa80f1
 t/VtATTdQUz3NHpyUrYECD7956et7hc+XpCC8JfnPBcWKzINEjqakogmtMNPHCe9Fu
 3BkbmqnvnGb0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V20 06/15] drm/xe: Guard teardown paths against purged BOs
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902145343.465686-23-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-23-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:57:43 +0000
Message-Id: <20260902155744.0ADA41F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] xe_bo_unpin_external() is missing the xe_bo_is_purged() guard, whi=
ch will cause a crash when unpinning purged DMA-buf exports.
- [High] xe_dma_buf_begin_cpu_access() fails to check if the BO is purged.
--

commit 58df7bf49c93c1c7134f73fd8224de6fa0f907f3
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: drm/xe: Guard teardown paths against purged BOs

This commit adds xe_bo_is_purged guards to various teardown and mapping
paths in the xe driver. It prevents unpinning or mapping a buffer object
that has already been purged by VRAM page offlining.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c255327669da5..b162753cebb70 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3267,6 +3267,9 @@ void xe_bo_unpin(struct xe_bo *bo)
>  	struct ttm_place *place =3D &bo->placements[0];
>  	struct xe_device *xe =3D xe_bo_device(bo);
> =20
> +	if (xe_bo_is_purged(bo))
> +		return;
> +

[Severity: High]
Does xe_bo_unpin_external also need a check for purged BOs?

When a DMA-buf exported BO is purged, closing the DMA-buf file descriptor
from userspace will call xe_dma_buf_unpin, which calls xe_bo_unpin_external:

drivers/gpu/drm/xe/xe_dma_buf.c:xe_dma_buf_unpin() {
	...
	xe_bo_unpin_external(bo);
}

Because xe_bo_unpin_external lacks the xe_bo_is_purged check, it will
attempt to unpin an already-unpinned BO. This leads to a pin_count underflow
and fails the assertion:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_unpin_external() {
	...
	xe_assert(xe, !bo->vm);
	xe_assert(xe, xe_bo_is_pinned(bo));
	...
}

>  	xe_assert(xe, !bo->ttm.base.import_attach);
>  	xe_assert(xe, xe_bo_is_pinned(bo));
> =20
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_=
buf.c
> index bf0728838ead5..5d9f1cd24b7f3 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -104,6 +104,9 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf=
_attachment *attach,
>  	struct sg_table *sgt;
>  	int r =3D 0;
> =20
> +	if (xe_bo_is_purged(bo))
> +		return ERR_PTR(-ENOENT);
> +

[Severity: High]
Does xe_dma_buf_begin_cpu_access need a similar guard against purged BOs?

If a DMA-buf exported BO is purged, and userspace invokes the
DMA_BUF_IOCTL_SYNC ioctl to begin CPU access, xe_dma_buf_begin_cpu_access
will call xe_bo_migrate:

drivers/gpu/drm/xe/xe_dma_buf.c:xe_dma_buf_begin_cpu_access() {
	...
	xe_validation_guard(...) {
		ret =3D drm_exec_lock_obj(&exec, &bo->ttm.base);
		...
		ret =3D xe_bo_migrate(bo, XE_PL_TT, NULL, &exec);
	...
}

Without an xe_bo_is_purged check before migrating, xe_bo_migrate will try
to migrate a destroyed buffer object. This can cause a NULL pointer
dereference since bo->ttm.resource->mem_type can be NULL for purged BOs,
or it will silently migrate the empty backing store to XE_PL_TT, providing
userspace with garbage memory.

>  	if (!attach->peer2peer && !xe_bo_can_migrate(bo, XE_PL_TT))
>  		return ERR_PTR(-EOPNOTSUPP);
> =20

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902145343.4656=
86-17-tejas.upadhyay@intel.com?part=3D6
