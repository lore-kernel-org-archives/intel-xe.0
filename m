Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8911CC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 11:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B8410E2C1;
	Wed, 16 Sep 2026 11:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FWsV2QGw";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EDA10E2C1
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 11:36:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4FF0243B09;
 Wed, 16 Sep 2026 11:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087841F00893;
 Wed, 16 Sep 2026 11:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789558593;
 bh=GAL1bJH26VrSodqHld1FCHrvdtpwHB/dsnAVvOCM81I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FWsV2QGwOOnQ0tPf/GPKYkg6vEdmrDOI0iq0aFLGMhIzYvLV98bruUxej9sqLCZj9
 tSCDmUrf/1NDbzWpNYozFMd6G0KoBzp1LXAzEpSa4HTbUspSx0KHHDs/ysr6nxtDI8
 GuNioccwBV2xEjlxRi3XYoyDs4FWdb7+VKEqJCgBtLleWPZ201PnCMkQ5HNfiHLbj2
 CKx9yl+KijauHUQ+Cky08l5I8o1EGDNbQgra2PLljkqu8EMd/13CAAYf9ldeMEG9xE
 C0/kxuxeodgxy33ZfZikwDtIjxIaeExl98GVlSRVemLjWe1q093rUu0vZ2MekBfqaM
 EiMldfyxHZVqQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260916112828.2528881-9-himal.prasad.ghimiray@intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
 <20260916112828.2528881-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 11:36:32 +0000
Message-Id: <20260916113633.087841F00893@smtp.kernel.org>
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
- [High] drm/xe: type confusion in xe_svm_devmem_lru_bump() due to unverifi=
ed cast
--

commit 09484da3688fb659e04396330f11c6ca63c00b90
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback

This commit adds xe_svm_devmem_lru_bump() and sets it as the
drm_gpusvm_ctx.devmem_fn callback in the prefetch worker to move backing
BOs to the LRU tail during get_pages.

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 6c3033fc4db73..7de6ed818d45e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c

[ ... ]

> @@ -1612,6 +1613,25 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struc=
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
> + */
> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
> +{
> +	struct xe_bo *bo =3D to_xe_bo(devmem_allocation);
> +
> +	if (!dma_resv_trylock(bo->ttm.base.resv))

[Severity: High]
Does this cast safely handle generic device memory allocations?

If userspace maps device memory from another DRM driver into the SVM address
space, hmm_range_fault() can return those foreign device pages. The drm_gpu=
svm
core will then loop over them in drm_gpusvm_walk_devmem() and invoke this
callback with the foreign driver's devmem_allocation.

Since the generic struct drm_pagemap_devmem * is cast to a driver-specific
struct xe_bo * without verifying that the allocation actually belongs to the
xe driver, can this lead to a type confusion and invalid pointer dereference
on bo->ttm.base.resv?

Unprivileged users mapping memory from multiple devices in the same process
could trigger a GPU fault or prefetch, making this a potential denial of
service vector.

> +		return;
> +
> +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	dma_resv_unlock(bo->ttm.base.resv);
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916112828.2528=
881-6-himal.prasad.ghimiray@intel.com?part=3D3
