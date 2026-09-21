Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5061C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 10:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9617510E0CA;
	Mon, 21 Sep 2026 10:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jp5F136A";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9726F10E0CA
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 10:08:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 535CF409EE;
 Mon, 21 Sep 2026 10:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C69E1F000FF;
 Mon, 21 Sep 2026 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789985300;
 bh=BUL4a8CPQr5+J4Mwrs+hVAEniqyYgyyJtESjZZBWGxs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jp5F136AlTDE7ufr4oMDwZ23tiS6hp1O5Yq/ISiLnHJ1b2oUBCghUVWI8gCAuqZKY
 VKk4Zj3KzAzutTVK67Jvyi4neEkjUL13hxoqWpuCvs1u35XZNrpt5Ge6MSmAMyC4RW
 E+tXtY5Q5RYsTNVcmP77W/OD5wGDTwZ0GN9kqNixCX0AZJltCGVH7ol+uN1NF1QeaS
 Lh9RyiO7cfTocYbSk6ZX/mendmOA5KFGjTcGA4LGiGp2JHi3Laz3h2icd/gvWPyAoT
 1wzZ9tyk/wk7NiIZCN3UAJUky1kwBUqJy/F8yJPPulFovrkOwPxiHqPtPMluu5vw5a
 MKItP0YJPz3FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem
 callback
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260921093651.2995928-9-himal.prasad.ghimiray@intel.com>
References: <20260921093651.2995928-6-himal.prasad.ghimiray@intel.com>
 <20260921093651.2995928-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 10:08:19 +0000
Message-Id: <20260921100820.0C69E1F000FF@smtp.kernel.org>
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
- [Low] xe: build failure in xe_svm_devmem_lru_bump when PAGEMAP is disabled
--

commit 940efd09f1bf622d948db6a47af2bd9f2667fa6e
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback

This patch adds xe_svm_devmem_lru_bump() and uses it as a devmem callback
in the prefetch worker. This allows each backing BO to be moved to the
LRU tail during get_pages.

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f39e647512ad9..56c82ff9b39ef 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
[ ... ]
> @@ -1625,6 +1626,33 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struc=
t xe_svm_range *range,
>  	return err;
>  }
> =20
> +/**
> + * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU t=
ail
> + * @devmem_allocation: The device-memory allocation backing the range's =
pages
> + *
> + * Intended as a &drm_gpusvm_ctx.devmem_fn. Runs under the GPUSVM notifi=
er lock;
> + * the dma-resv trylock avoids inverting against eviction/shrinker, whic=
h take
> + * dma-resv before the notifier lock. A contended BO is simply skipped.
> + *
> + * A shared device_private_page_owner can hand us allocations backed by a
> + * foreign driver; skip anything that is not an xe BO before casting.
> + */
> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
> +{
> +	struct xe_bo *bo;
> +
> +	if (devmem_allocation->ops !=3D &dpagemap_devmem_ops)

[Severity: Low]
Does this cause a static build failure when CONFIG_DRM_XE_PAGEMAP is
disabled?=20

The function xe_svm_devmem_lru_bump() is compiled unconditionally here,
but it references dpagemap_devmem_ops and calls to_xe_bo(). Since both of
these are omitted when CONFIG_DRM_XE_PAGEMAP is disabled, this will halt
the compiler with undeclared identifier errors in configurations where
CONFIG_DRM_XE_GPUSVM=3Dy but CONFIG_DRM_XE_PAGEMAP=3Dn.

> +		return;
> +
> +	bo =3D to_xe_bo(devmem_allocation);
> +
> +	if (!dma_resv_trylock(bo->ttm.base.resv))
> +		return;
> +
> +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	dma_resv_unlock(bo->ttm.base.resv);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921093651.2995=
928-6-himal.prasad.ghimiray@intel.com?part=3D3
