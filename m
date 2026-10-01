Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C37CA5FB3
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 03:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F3210E046;
	Thu,  1 Oct 2026 03:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vx2IgQsL";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C256910E046
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 03:47:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D28F41AE5;
 Thu,  1 Oct 2026 03:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072EC1F000FF;
 Thu,  1 Oct 2026 03:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790826457;
 bh=XreglGSPshlGqXHb8elDcShbdmy8DxxnLgqF75RFpCY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Vx2IgQsLpxF326hpTrINfQUohOt8CQOdUYs79V8KarzdI1dvFZ4W5FRJPbfK0c2r3
 EzbBFLpV2Hy/sC1mT86fh5m2Ay74P2k74KGeeBB657sHpMWFSQvA0Nf5rVg0V351p0
 s9EsBm2aOi+eK8Iymvn5jtTEm87+f3ZGiNimXFUw5Ey179PaDkbWxyJsO0gEMpiFrn
 yoZW9sxiArI10I/uG9Pv0zIVA0+4GN23vYy5Tb7+xnvZ6TOGQiNBpz/o4eu4L/yuEr
 udaYSEm+51uka1x8gPgX0/iXrVLHvNWiNpmHEn9b6gpHu1QZQOmDiim8fclGTK1GsT
 VdzRAAEXJupyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] drm/xe: Bump prefetch BO LRU for already-valid
 ranges
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261001033602.3166274-10-himal.prasad.ghimiray@intel.com>
References: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
 <20261001033602.3166274-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 03:47:36 +0000
Message-Id: <20261001034737.072EC1F000FF@smtp.kernel.org>
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
- [High] drm_gpusvm: Type confusion on foreign coherent pages causes kernel=
 panic
--

commit e6a84f5161e8175296073241c548503908bdb0fe
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Bump prefetch BO LRU for already-valid ranges

This commit adds xe_svm_range_prefetch_lru_bump() to refresh backing BOs on
the LRU for already-valid prefetch ranges. It avoids migration and binding
overhead by refaulting CPU pages without touching DMA mappings and moving
each backing BO to the LRU tail.

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index d07dd95ab4514..909a602d091ea 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c

[ ... ]

> @@ -1659,6 +1659,40 @@ void xe_svm_devmem_lru_bump(struct drm_pagemap_dev=
mem *devmem_allocation)
>  #endif
>  }
> =20
> +/**
> + * xe_svm_range_prefetch_lru_bump() - Bump the TTM LRU for an already-va=
lid range
> + * @vm: Pointer to the struct xe_vm
> + * @vma: Pointer to the VMA covering the range
> + * @range: Pointer to the xe SVM range structure
> + * @dpagemap: Target pagemap of the prefetch, or %NULL for system memory
> + *
> + * A valid range skips migration and binding, so nothing else refreshes =
its
> + * backing BOs on the LRU. Re-fault the CPU pages without touching the D=
MA
> + * mappings (@no_dma_map) and move each backing BO to the LRU tail.
> + *
> + * Prefetching is a best-effort optimization, so any failure is ignored;=
 a
> + * later fault will refault the range.
> + */
> +void xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
> +				    struct xe_svm_range *range,
> +				    struct drm_pagemap *dpagemap)
> +{
> +	struct drm_gpusvm_ctx ctx =3D {
> +		.read_only =3D xe_vma_read_only(vma),
> +		.device_private_page_owner =3D
> +			xe_svm_private_page_owner(vm, !dpagemap),
> +		.no_dma_map =3D 1,
> +		.devmem_fn =3D xe_svm_devmem_lru_bump,
> +	};
> +
> +	guard(mutex)(&range->lock);
> +
> +	if (xe_svm_range_is_removed(range))
> +		return;
> +
> +	xe_svm_range_get_pages(vm, range, &ctx);
> +}

[Severity: High]
Can this lead to a kernel panic due to a type confusion if a foreign driver=
's
MEMORY_DEVICE_COHERENT page is mapped?

If an unprivileged local user maps a foreign coherent page (for example, fr=
om
AMDGPU) into a VMA and triggers a prefetch here, xe_svm_range_get_pages()
eventually reaches drm_gpusvm_walk_devmem() in drivers/gpu/drm/drm_gpusvm.c.

Because HMM does not filter MEMORY_DEVICE_COHERENT pages by the
device_private_page_owner, drm_gpusvm_walk_devmem() proceeds:

drivers/gpu/drm/drm_gpusvm.c:drm_gpusvm_walk_devmem() {
    ...
    if (!is_device_private_page(page) &&
        !is_device_coherent_page(page)) {
        last =3D NULL;
        continue;
    }

    devmem =3D drm_pagemap_page_to_devmem(page);
    ...
}

This calls drm_pagemap_page_to_devmem() in drivers/gpu/drm/drm_pagemap.c,
which blindly casts the foreign driver's zone_device_data to a struct
drm_pagemap_zdd and reads devmem_allocation, yielding a garbage pointer.

The garbage pointer is then passed to the devmem_fn callback set in this
commit:

drivers/gpu/drm/xe/xe_svm.c:xe_svm_devmem_lru_bump() {
    ...
    if (devmem_allocation->ops !=3D &dpagemap_devmem_ops)
        return;
    ...
}

This dereferences the garbage devmem_allocation pointer to check ops, causi=
ng
an immediate unhandled page fault and kernel panic before the validation ch=
eck
can fail.

Is there a way to safely validate that the page is owned by drm_pagemap bef=
ore
extracting and dereferencing the devmem_allocation pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001033602.3166=
274-6-himal.prasad.ghimiray@intel.com?part=3D4
