Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE8606A337
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jIFXAsM3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2106C10F717;
	Tue, 24 Nov 2026 15:54:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEE310F717
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:54:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 84A9C4048C;
 Tue, 24 Nov 2026 15:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C23A1F000EE;
 Tue, 24 Nov 2026 15:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795535650;
 bh=tUaDaMHxGHLBlvVYatsMajoGAf60vINJiBAd7al/034=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jIFXAsM39sxNvihziQJeYmPzSRjfNapBVVBD51NqFBrn/UX8I64oKPrBBGtRucRab
 jlfq9rCD1ckAUDjRTVmCMP37H6uUiy0hSmp0Fa0kk/kCCM1eQ9wscIQi2nNmZGrfaY
 KKj4pUifSvHV1umwDMhH+E7yjs7f8OSpf2DD5wAlYtvnfp2Sov2qmdQ3AfNqW+0AG7
 upUuHB40AzK056kVzQeZiZpqO8sR+t9TI1djUiR9oQkZiR8oYsQFL3z9yTbtDV3lEg
 nNyrtHpUxNICsYiWwnn6yXOV1X85WzZImdkFCftJeNosylUchVvDvN+wRa6PDdH6rC
 OvcOtG8hYuBVA==
Message-ID: <sashiko-outbox-231491@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] drm/xe: Retry when drm_gpusvm_get_pages() gives -EBUSY
To: "Tomasz Lis" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261124152300.2450568-1-tomasz.lis@intel.com>
References: <20261124152300.2450568-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 15:54:09 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe: missing -EAGAIN retry in xe_pagefault_handle_vma()
  for userptr
- [Medium] drm/xe: untranslated -EAGAIN in xe_vm_bind_ioctl() prefetch
  paths
--

commit f646c29e1d6daa1b730a627c9bb86fd464763df6
Author: Tomasz Lis <tomasz.lis@intel.com>

drm/xe: Retry when drm_gpusvm_get_pages() gives -EBUSY

This commit translates -EBUSY from drm_gpusvm_get_pages() into -EAGAIN in
xe_svm_range_get_pages() and xe_vma_userptr_pin_pages() so callers retry
on exhausted HMM retries, and updates new_vma() to map -EAGAIN to -ENOMEM.

> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_user=
ptr.c
> index 9c1dac0fce6f1..423c190ac68d6 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
[ ... ]
> @@ -91,12 +93,14 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *u=
vma)
>  	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>  		return 0;
> =20
> -	return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages, 1,
> -				    uvma->userptr.notifier.mm,
> -				    &uvma->userptr.notifier,
> -				    xe_vma_userptr(vma),
> -				    xe_vma_userptr(vma) + xe_vma_size(vma),
> -				    &ctx);
> +	err =3D drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages, 1,
> +				   uvma->userptr.notifier.mm,
> +				   &uvma->userptr.notifier,
> +				   xe_vma_userptr(vma),
> +				   xe_vma_userptr(vma) + xe_vma_size(vma),
> +				   &ctx);
> +
> +	return xe_gpusvm_get_pages_err(err);
>  }

[Severity: Medium]
Does xe_pagefault_handle_vma() actually retry when
xe_vma_userptr_pin_pages() returns -EAGAIN?

drivers/gpu/drm/xe/xe_pagefault.c:xe_pagefault_handle_vma() {
	...
	do {
		xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_NONE);

		if (xe_vma_is_userptr(vma) &&
		    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
			struct xe_userptr_vma *uvma =3D to_userptr_vma(vma);

			err =3D xe_vma_userptr_pin_pages(uvma);
			if (err) {
				xe_pagefault_set_error(pf, XE_PAGEFAULT_ERROR_VMA_USERPTR_PIN);
				return err;
			}
		}
		...
	} while (err =3D=3D -EAGAIN);
}

Because xe_pagefault_handle_vma() returns directly on any non-zero err
instead of continuing when err =3D=3D -EAGAIN, the error propagates to
xe_pagefault_service() and xe_pagefault_queue_work(), which treats it as
a fatal fault failure and NACKs the pagefault to the GPU.

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dd855876f571c..6e6937870ac6b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2746,11 +2746,11 @@ static struct xe_vma *new_vma(struct xe_vm *vm, s=
truct drm_gpuva_op_map *op,
>  			err =3D xe_vma_userptr_pin_pages(to_userptr_vma(vma));
>  			/*
>  			 * -EBUSY has dedicated meaning that a user fence
> -			 * attached to the VMA is busy, in practice
> -			 * xe_vma_userptr_pin_pages can only fail with -EBUSY if
> -			 * we are low on memory so convert this to -ENOMEM.
> +			 * attached to the VMA is busy. xe_vma_userptr_pin_pages
> +			 * reports exhausted HMM retries as -EAGAIN, which makes
> +			 * no sense for the bind ioctl, so convert it to -ENOMEM.
>  			 */
> -			if (err =3D=3D -EBUSY)
> +			if (err =3D=3D -EAGAIN)
>  				err =3D -ENOMEM;
>  		}
>  	}

[Severity: Medium]
Can DRM_GPUVA_OP_PREFETCH in the bind ioctl now leak -EAGAIN to userspace
when drm_gpusvm_get_pages() exhausts its HMM retry budget?

In vm_bind_ioctl_ops_parse(), the DRM_GPUVA_OP_PREFETCH userptr path
returns err from xe_vma_userptr_pin_pages() directly without converting
-EAGAIN to -ENOMEM.  Similarly, prefetch_thread_func() calls
xe_svm_range_get_pages() and only translates -EOPNOTSUPP, -EFAULT and
-EPERM to -ENODATA (unlike op_prepare() in xe_pt.c, which also translates
-EAGAIN to -ENODATA), causing xe_vm_bind_ioctl() to unwind all bind
operations and return -EAGAIN to userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124152300.2450=
568-1-tomasz.lis@intel.com?part=3D1
