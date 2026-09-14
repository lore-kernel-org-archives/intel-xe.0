Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09245C88E72
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 14:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E2110EEF0;
	Mon, 14 Sep 2026 14:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n5zKZQse";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346A810EEF0
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 14:15:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CF68241A00;
 Mon, 14 Sep 2026 14:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880811F000FF;
 Mon, 14 Sep 2026 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789395355;
 bh=jb/gXXd/dbPXZqUBGtCUG5ELAbR6T1BSwvz4ACrhc2Q=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=n5zKZQsep4sFYljyHSb4Lcl+WeaQaKqqWhLBmsd/nzspjAD739ehtYSMRyKqW1ZIg
 NP0MRIYtIYOXTW39tdYm73+hFkQT2AkW3c+8KsktyP6cKM/1uXeO16ro/AxtYThssp
 GYOfeOiq/vleE0rJg1nhcqZuDRrbCp1SM6sfUNB4tQbFMzkCgyFZFiblYFQxNVwX7K
 E2E/EilXbEuyeNzbZUhZxmSpwdI9LkgjJJe8dpArToIbkLx5VEO2GDByCz3uI6zVJw
 Yc7qGsw4yuV1Clf04A3Hhsw680xUxyhfYYYfPp0PT8CEAsoc9r3MsMZ7CRh9e2v0bX
 q/NXvm5zg4DxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Fix shrinker accounting double-subtraction on
 nested external pins
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260914134540.385186-1-thomas.hellstrom@linux.intel.com>
References: <20260914134540.385186-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:15:55 +0000
Message-Id: <20260914141555.880811F000FF@smtp.kernel.org>
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

New issues:
- [Critical] Direct manipulation of `pin_count` by display framebuffer pins=
 breaks the nested pin accounting, leading to a permanent shrinker leak and=
 Use-After-Free.

Pre-existing issues:
- [High] madvise(DONTNEED) on imported dma-bufs underflows the shrinkable p=
age count.
--

commit 0965d36457ef31061b507cea1086d7d661b82782
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Fix shrinker accounting double-subtraction on nested external pins

This commit guards shrinker accounting calls with pin-count transition
checks in the external pin paths. It ensures accounting is only updated
on the outermost pin and the final unpin to prevent underflows caused
by nested pins on imported buffers.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index dde309821237b..f8e473b14cfcb 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
[ ... ]
> @@ -3235,18 +3236,19 @@ int xe_bo_pin(struct xe_bo *bo, struct drm_exec *=
exec)
>  void xe_bo_unpin_external(struct xe_bo *bo)
>  {
>  	struct xe_device *xe =3D xe_bo_device(bo);
> +	bool last_unpin =3D bo->ttm.pin_count =3D=3D 1;

[Severity: Critical]
Does this strict pin count equality break nested pin accounting when a
display framebuffer pin is involved?

If a user creates a BO, exports it via dma-buf, and sets it as a scanout
framebuffer, __xe_pin_fb_vma() will intentionally bypass xe_bo_pin_external=
()
and directly increment bo->ttm.pin_count to 2.

When the external pin is released, xe_bo_unpin_external() observes a pin
count of 2 rather than 1. With the new logic here, it skips removing the BO
from xe->pinned.late.external and skips adding pages back to the shrinker.

Finally, when the FB is unpinned, __xe_unpin_fb_vma() directly drops the pin
count to 0 without executing the required list and shrinker cleanups. This
leads to a permanent shrinker page accounting leak and a use-after-free
if the BO is freed while still linked into the shrinker list.

> =20
>  	xe_assert(xe, !bo->vm);
>  	xe_assert(xe, xe_bo_is_pinned(bo));
>  	xe_assert(xe, xe_bo_is_user(bo));
> =20
>  	spin_lock(&xe->pinned.lock);
> -	if (bo->ttm.pin_count =3D=3D 1 && !list_empty(&bo->pinned_link))
> +	if (last_unpin && !list_empty(&bo->pinned_link))
>  		list_del_init(&bo->pinned_link);
>  	spin_unlock(&xe->pinned.lock);
> =20
>  	ttm_bo_unpin(&bo->ttm);
> -	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> +	if (last_unpin && bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
>  		xe_ttm_tt_account_add(xe, bo->ttm.ttm);

[Severity: High]
This is a pre-existing issue, but does the shrinker accounting underflow
for imported dma-bufs when userspace marks them as DONTNEED?

In xe_ttm_tt_populate(), external BOs return early without calling
xe_ttm_tt_account_add(), meaning their pages are never added to the
shrinkable page count. However, TTM unconditionally sets the populated flag.

If an unprivileged user application imports a dma-buf and calls the MADVISE
ioctl to mark it as DONTNEED, xe_bo_set_purgeable_shrinker() sees the
populated flag and subtracts the pages from shrinkable pages. This causes an
integer underflow, leading to excessive shrinker invocations and system
instability.

>=20
>  	/*
>  	 * FIXME: If we always use the reserve / unreserve functions for locking

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914134540.3851=
86-1-thomas.hellstrom@linux.intel.com?part=3D1
