Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D649C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D736F10EA6C;
	Wed, 16 Sep 2026 13:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dsOzzoJx";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A03810EACB
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 13:09:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 30A21418BE;
 Wed, 16 Sep 2026 13:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75991F000FF;
 Wed, 16 Sep 2026 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789564195;
 bh=C3iIOsA2UIH6c157ntbuQvxuzxYrazUK0KmqqIvb7hk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dsOzzoJxX/vyEjeQXOz1Gc8nMLAb6vuV0vIlmTv/tNWBDB0W7MPl/4IpdaP5FNWZG
 YYcs86fomYvIeos7Cp9QcjRIDB0edmHTelugzA3H2/FjVCwRFBD59vtAZ3qLS1lUQx
 aTHcTn/X08GP37r7e4wMv55Ujt91VOIRGoxcTsJpPfpd/dSyJg67tf3RGyGLjv0fk+
 GvfiEPRtrbOPkWWqcyqjUaeJ8Pa3Nvyc1aTkUOXhgTEp+7E9OPGClaFpPaV4OX+Q/T
 uBUyU/U4wv/E8XfupKGm0DQRSzw/u2njjLY3ayZ2TlK8KwB4y9IOmjYYq0vzOUuUnZ
 8B8VQGUNpkzlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] [CI-ONLY][DONOT-REVIEW] Squash of Refresh TTM LRU on
 SVM prefetch
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260916125822.2605659-2-himal.prasad.ghimiray@intel.com>
References: <20260916125822.2605659-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 13:09:54 +0000
Message-Id: <20260916130954.E75991F000FF@smtp.kernel.org>
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
- [High] drm/gpusvm: type confusion accessing devmem_allocation of foreign =
DEVICE_COHERENT pages
- [Medium] drm/xe: memory leak of svm_range on prefetch_lru_bump error path
--

commit 5f7e91f97dcbc6067f561bc870cb129bb5353cab
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Squash of Refresh TTM LRU on SVM prefetch

This commit adds SVM prefetch LRU bump support for device memory in DRM
GPUSVM, integrating it with the xe driver. It introduces
drm_gpusvm_walk_devmem() to iterate over faulted device pages and invoke a
callback to refresh their TTM LRU.

> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1528,7 +1528,49 @@ static bool drm_gpusvm_pages_inlinable(struct drm_=
gpusvm_pages *svm_pages,
>  }
> =20
>  /**
> - * drm_gpusvm_dma_map_pages() - DMA map one drm_gpusvm_pages instance
> + * drm_gpusvm_walk_devmem() - Invoke the devmem callback across faulted =
pages
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @pfns: The already-faulted pfn array (size @npages)
> + * @npages: Number of pages in the CPU range
> + * @ctx: GPU SVM context, with a non-NULL &drm_gpusvm_ctx.devmem_fn
> + *
> + * Invoke &drm_gpusvm_ctx.devmem_fn once per contiguous run of @pfns bac=
ked by
> + * the same device-memory allocation. Must be called under the notifier =
lock.
> + */
> +static void drm_gpusvm_walk_devmem(struct drm_gpusvm *gpusvm,
> +				   unsigned long *pfns,
> +				   unsigned long npages,
> +				   const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_pagemap_devmem *last =3D NULL;
> +	unsigned int order =3D 0;
> +	unsigned long i;
> +
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	for (i =3D 0; i < npages; i +=3D 1 << order) {
> +		struct page *page =3D hmm_pfn_to_page(pfns[i]);
> +		struct drm_pagemap_devmem *devmem;
> +
> +		order =3D drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
> +
> +		if (!is_device_private_page(page) &&
> +		    !is_device_coherent_page(page)) {
> +			last =3D NULL;
> +			continue;
> +		}
> +
> +		devmem =3D drm_pagemap_page_to_devmem(page);
> +		if (devmem =3D=3D last)
> +			continue;
> +
> +		last =3D devmem;
> +		ctx->devmem_fn(devmem);

[Severity: High]
Could this lead to type confusion for foreign DEVICE_COHERENT pages?

If userspace maps memory from another driver (e.g., AMDGPU) that uses
MEMORY_DEVICE_COHERENT and passes it to the xe driver, hmm_range_fault()
will return the PFNs. Because is_device_coherent_page() evaluates to true
here, this code unconditionally calls drm_pagemap_page_to_devmem().

Looking at drm_pagemap_page_to_devmem(), it blindly treats the foreign
driver's page->zone_device_data as a drm_pagemap_zdd struct. That garbage
pointer is then passed to the devmem_fn callback (xe_svm_devmem_lru_bump()),
which casts it to an xe_bo and accesses bo->ttm.base.resv. This could cause
an invalid pointer dereference or memory corruption.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2583,6 +2583,15 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct =
xe_vma_ops *vops,
>  						  dpagemap, &valid_pages)) {
>  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
>  				xe_assert(vm->xe, valid_pages);
> +
> +				if (dpagemap) {
> +					err =3D xe_svm_range_prefetch_lru_bump(vm, vma,
> +									     svm_range,
> +									     dpagemap);
> +					if (err)
> +						goto unwind_prefetch_ops;

[Severity: Medium]
Does this leak the svm_range reference on the error path?

xe_svm_range_find_or_insert() returns an svm_range with an elevated
reference count. If xe_svm_range_validate() returns true, but
xe_svm_range_prefetch_lru_bump() fails (e.g., due to an hmm_range_fault
error), the code jumps to the unwind_prefetch_ops label.

At this point, the svm_range has not been added to op->prefetch_range.range
via xa_alloc(). Consequently, the cleanup function
xe_svm_prefetch_gpuva_ops_fini() will not find it, and the reference
will be permanently leaked.

> +				}
> +
>  				need_put =3D true;
>  				goto check_next_range;
>  			}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916125822.2605=
659-2-himal.prasad.ghimiray@intel.com?part=3D1
