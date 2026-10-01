Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F282CA5FA5
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 03:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B4210E058;
	Thu,  1 Oct 2026 03:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JzLrlOF9";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEFC10E058
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 03:49:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 34A9D60142;
 Thu,  1 Oct 2026 03:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B487D1F000FF;
 Thu,  1 Oct 2026 03:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790826542;
 bh=s1Ioz0iGKIjCPr34OiX2oteYhCfuyNHBfc4j9lj8M2s=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JzLrlOF9tmiLFhswa4hAD6xRngA6Ehy6eDwhd2oPHWC/frWB11x1M6p+1r31YpDQ2
 hjw+/JNHcQgtPIN6k+bBdTSQqVL4FWWe01fJC3GSAW/CVrTGOSaRBY4gNqgjLQu95h
 Zyvtk83Iu/TxAX6xo5dgGuzfO3xP9FJ5k/RtTsaIBJSlg3aHxZLBJC/blZXzKoYQw6
 xGGcYxa4KMBqkybK6LYJ5Nfkg/Q7vcwqBgnHTtKQ0V0UfB4cieY5JU3j9j3pnLpHq8
 0EYq2RFx3zul6LXEHAGz9qKQvQINsyPzV38DkHSnWlAyeoCuAxVh4ktg85RJVco5Dx
 erR1Om0KltEWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem
 callback
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261001033602.3166274-9-himal.prasad.ghimiray@intel.com>
References: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
 <20261001033602.3166274-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 03:49:02 +0000
Message-Id: <20261001034902.B487D1F000FF@smtp.kernel.org>
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
- [High] mm: kernel oops via invalid zone_device_data dereference on foreig=
n DEVICE_COHERENT pages
--

commit 958d8ac307a125ba9f54f827cc57e2a2d00555d1
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback

This commit adds xe_svm_devmem_lru_bump() and sets it as the devmem_fn
callback in the prefetch worker to move backing BOs to the LRU tail
during get_pages.

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f39e647512ad9..d07dd95ab4514 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
[ ... ]
> @@ -1625,6 +1626,39 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struc=
t xe_svm_range *range,
>  	return err;
>  }
> =20
> +/**
> + * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU t=
ail
[ ... ]
> + */
> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +	struct xe_bo *bo;
> +
> +	if (devmem_allocation->ops !=3D &dpagemap_devmem_ops)
> +		return;

[Severity: High]
Does this guard effectively protect against foreign allocations?

When a user maps a foreign DEVICE_COHERENT page (e.g., from an AMDGPU
allocation) and binds it into an xe VM, this guard appears to be reached
too late.

The kernel oops seems to occur earlier in the call chain when
drm_gpusvm_walk_devmem() blindly calls drm_pagemap_page_to_devmem().=20

That helper erroneously casts the foreign driver's zone_device_data to a
struct drm_pagemap_zdd pointer and dereferences zdd->devmem_allocation
before this ops check is ever executed.

> +
> +	bo =3D to_xe_bo(devmem_allocation);
> +
> +	if (!dma_resv_trylock(bo->ttm.base.resv))
> +		return;
> +
> +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	dma_resv_unlock(bo->ttm.base.resv);
> +#endif
> +}
> +
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 425c678f4480a..a42d86f674cc8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3242,6 +3242,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct=
 xe_vma_ops *vops,
>  	ctx.devmem_possible =3D devmem_possible;
>  	ctx.check_pages_threshold =3D devmem_possible ? SZ_64K : 0;
>  	ctx.device_private_page_owner =3D xe_svm_private_page_owner(vm, !dpagem=
ap);
> +	ctx.devmem_fn =3D xe_svm_devmem_lru_bump;

[Severity: High]
Can setting this callback trigger a denial of service by unprivileged users?

Setting ctx.devmem_fn activates the drm_gpusvm_walk_devmem() code path
during hmm_range_fault() processing.=20

If a user maps a foreign DEVICE_COHERENT page, hmm_range_fault() returns a
valid PFN, and the walker will process it, leading to the invalid
zone_device_data dereference mentioned above.

> =20
>  	skip_threads =3D  op->prefetch_range.ranges_count =3D=3D 1 ||
>  		(!dpagemap && !(vops->flags &

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001033602.3166=
274-6-himal.prasad.ghimiray@intel.com?part=3D3
