Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA69606A326
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 17:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SToQX089
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2AC10E636;
	Sat,  7 Nov 2026 17:43:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3850210E636
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Nov 2026 17:43:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E7BD24004D;
 Sat,  7 Nov 2026 17:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A446D1F0089F;
 Sat,  7 Nov 2026 17:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794073406;
 bh=L/GW2HtgPOQ1B1VL9L9qT3QxtCZWVXe8rsjBeY1GwoU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=SToQX089bjWOoMQnRnX2N3JVrpCfnykPhzCFKv81C5kW6MABLB1xif9InBnYlPxuh
 nLXHW+qh41XNtkYuQ6Dmf3Gz8waBtMZjlRrWEZK3+aRHyrTVo+C32nyh4IywuCX4uv
 cCMtqpVtNOKY+RbvZfgdxL+/3JRYRDo9u72iPPdz2r4PT/wKtDylV8uQ7K+gFR5k73
 oipNLIJrPdKfZcNPqn3H9ZMoM/N3RAmesdjUaIBtiexyy/jf+y//W+kdTWjN1XJF6P
 MWwDOZpFjyNE8QXdz8X/TCXHsGRicoGuvTQlNu8CNffNz0JW69PuAdgQkbeR5NgdDh
 CJ5AlqoWxl/PQ==
Message-ID: <sashiko-outbox-203124@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] drm/xe: don't allocate fake mmap offsets for
 imported dma-bufs
To: "Matthew Auld" <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261107-oom-fun-v1-1-be9eb05b82ed@intel.com>
References: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
 <20261107-oom-fun-v1-1-be9eb05b82ed@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 17:43:26 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe: bogus offset 0 in drm_gem_ttm_dumb_map_offset() for
  imported BOs
--

commit f6897baa0037e7c5c3efac24443f4046494f642e
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe: don't allocate fake mmap offsets for imported dma-bufs

This commit removes the drm_vma_offset node from imported dma-buf buffer
objects after initialization and rejects objects without a valid vma_node
in xe_gem_mmap_offset_ioctl().

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a0..0181f73ef66d0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3851,6 +3851,12 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *de=
v, void *data,
>  	if (XE_IOCTL_DBG(xe, !gem_obj))
>  		return -ENOENT;
> =20
> +	/* Imported dma-bufs have no mmap offset since CPU access is rejected. =
*/
> +	if (XE_IOCTL_DBG(xe, !drm_vma_node_size(&gem_obj->vma_node))) {
> +		xe_bo_put(gem_to_xe_bo(gem_obj));
> +		return -EINVAL;
> +	}
> +
>  	/* The mmap offset was set up at BO allocation time. */
>  	args->offset =3D drm_vma_node_offset_addr(&gem_obj->vma_node);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_=
buf.c
> index 5bf13dc4b61d8..17a8663a68de0 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -12,6 +12,7 @@
> =20
>  #include <drm/drm_device.h>
>  #include <drm/drm_prime.h>
> +#include <drm/drm_vma_manager.h>
>  #include <drm/ttm/ttm_tt.h>
> =20
>  #include "tests/xe_test.h"
> @@ -353,6 +354,14 @@ xe_dma_buf_create_obj(struct drm_device *dev, struct=
 dma_buf *dma_buf)
>  	}
>  	drm_gem_object_put(dummy_obj);
> =20
> +	/*
> +	 * CPU faults on imported BOs are rejected, so there is no point in
> +	 * consuming fake mmap offset space for them.
> +	 */
> +	if (!ret)
> +		drm_vma_offset_remove(bo->ttm.bdev->vma_manager,
> +				      &bo->ttm.base.vma_node);
> +
>  	return ret ? ERR_PTR(ret) : &bo->ttm.base;
>  }

[Severity: Medium]
Does removing vma_node here cause DRM_IOCTL_MODE_MAP_DUMB on an imported
dma-buf handle to succeed with a bogus offset of 0?

regular_driver sets .dumb_map_offset =3D drm_gem_ttm_dumb_map_offset, which
does not check drm_gem_is_imported() or drm_vma_node_size() before reading
the offset:

drivers/gpu/drm/drm_gem_ttm_helper.c:drm_gem_ttm_dumb_map_offset() {
	...
	*offset =3D drm_vma_node_offset_addr(&gem->vma_node);

	drm_gem_object_put(gem);

	return 0;
}

With bo->ttm.base.vma_node zeroed by drm_vma_offset_remove(),
drm_gem_ttm_dumb_map_offset() returns 0 with *offset =3D 0 instead of
-EINVAL.

Also, because xe_bo_init_locked() -> ttm_bo_init_reserved() still
transiently allocates the vma_node for ttm_bo_type_sg before
xe_dma_buf_create_obj() removes it, importing a dma-buf can still fail
with -ENOSPC when bdev->vma_manager is already full or fragmented.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-oom-fun-v1=
-0-be9eb05b82ed@intel.com?part=3D1
