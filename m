Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391D4606A33B
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 13:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCbPP3nI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B4810F1B5;
	Mon, 16 Nov 2026 13:29:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCFE10F170;
 Mon, 16 Nov 2026 13:29:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 612B5609FC;
 Mon, 16 Nov 2026 13:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60F41F000C4;
 Mon, 16 Nov 2026 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794835748;
 bh=WnO24QhOQDInsPkv5iuTM334UszoYADJa9QaFNguXKg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=eCbPP3nIsr86IBo/U8VfdFiQfqAJkY3FgxHO8+yKKax4qbXApcmBvOHrwJbQO7nQn
 XRbyPdz2fis9rHwYUZMq6eOde/rMSB/BybA50vsSobkFrHFuste1C/YkAsCvxkmHKw
 vdhF7ZHAQgOIUJZiTbhLmrVPBs4ypzvx8zkjMEW6cdg4TOOI76/05052coosBXOHqO
 R1zBNEmG27mEj9OrHWpJ6aoIszJIjz/jwS0oD4ncnPxxuNuSN5q0zTCYLcnRCsx75X
 O1Md5mIqJfuNQlwW2XSA1JSQ4zTufJNDVbcNNgC+9VRMxOdV4U+cA5O2spozYxmJnv
 1V+d6fgYR2C0Q==
Message-ID: <sashiko-outbox-217075@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] drm/xe/migrate: Support copying between sysmem
 and stolen
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20261116131349.333818-9-dev@lankhorst.se>
References: <20261116131349.333818-7-dev@lankhorst.se>
 <20261116131349.333818-9-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 13:29:06 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe/migrate: missing stolen base offset in emit_pte() on
  pre-1270 iGPUs
--

commit 73a1bb32ca907a5d90c3e0d2392791649e5d6ca0
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/xe/migrate: Support copying between sysmem and stolen

This commit adds support for XE_PL_STOLEN buffer objects to
__xe_migrate_copy() and xe_migrate_clear(), disabling identity mapping for
stolen memory and treating stolen resources as device memory when GGTT CPU
access is not required.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 19c37eb315893..2e194ac6fb4f0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
[ ... ]
> @@ -1206,6 +1211,24 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *=
m,
>  	return flush_flags;
>  }
> =20
> +static bool is_devmem(struct xe_bo *bo, struct ttm_resource *res)
> +{
> +	if (mem_type_is_vram(res->mem_type))
> +		return true;
> +
> +	/*
> +	 * Stolen is only device memory on newer platforms.
> +	 *
> +	 * On older platforms where stolen is mapped to GGTT,
> +	 * it is mapped as system memory.
> +	 */
> +	if (res->mem_type !=3D XE_PL_STOLEN ||
> +	    xe_ttm_stolen_cpu_access_needs_ggtt(xe_bo_device(bo)))
> +		return false;
> +
> +	return true;
> +}
> +
>  static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  					   struct xe_bo *src_bo,
>  					   struct xe_bo *dst_bo,
> @@ -1226,8 +1249,8 @@ static struct dma_fence *__xe_migrate_copy(struct x=
e_migrate *m,
>  	int err;
>  	bool src_is_pltt =3D src->mem_type =3D=3D XE_PL_TT;
>  	bool dst_is_pltt =3D dst->mem_type =3D=3D XE_PL_TT;
> -	bool src_is_vram =3D mem_type_is_vram(src->mem_type);
> -	bool dst_is_vram =3D mem_type_is_vram(dst->mem_type);
> +	bool src_is_vram =3D is_devmem(src_bo, src);
> +	bool dst_is_vram =3D is_devmem(dst_bo, dst);
>  	bool type_device =3D src_bo->ttm.type =3D=3D ttm_bo_type_device;
>  	bool needs_ccs_emit =3D type_device && xe_migrate_needs_ccs_emit(xe);
>  	bool copy_ccs =3D xe_device_has_flat_ccs(xe) &&
> @@ -1250,11 +1273,11 @@ static struct dma_fence *__xe_migrate_copy(struct=
 xe_migrate *m,
>  	if (src_bo !=3D dst_bo && XE_WARN_ON(xe_bo_size(src_bo) !=3D xe_bo_size=
(dst_bo)))
>  		return ERR_PTR(-EINVAL);
> =20
> -	if (!src_is_vram)
> +	if (!src_is_vram && src->mem_type !=3D XE_PL_STOLEN)
>  		xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
>  	else
>  		xe_res_first(src, 0, size, &src_it);
> -	if (!dst_is_vram)
> +	if (!dst_is_vram && dst->mem_type !=3D XE_PL_STOLEN)
>  		xe_res_first_sg(xe_bo_sg(dst_bo), 0, size, &dst_it);
>  	else
>  		xe_res_first(dst, 0, size, &dst_it);

[Severity: High]
Does emit_pte() omit vram_region_gpu_offset(res) for XE_PL_STOLEN on
integrated platforms with GRAPHICS_VERx100(xe) < 1270?

On those platforms xe_ttm_stolen_cpu_access_needs_ggtt() is true, so
is_devmem() returns false for src_is_vram, dst_is_vram, and clear_vram
while xe_res_first() still initializes the cursor with a 0-based offset
into stolen memory.  In emit_pte(), vram_region_gpu_offset(res) is only
added when is_vram is true:

drivers/gpu/drm/xe/xe_migrate.c:emit_pte() {
	...
			addr =3D xe_res_dma(cur) & PAGE_MASK;
			if (is_vram) {
				...
				addr +=3D vram_region_gpu_offset(res);
				devmem =3D true;
			}
	...
}

As a result, __xe_migrate_copy() and xe_migrate_clear() encode physical
addresses starting at 0x0 instead of mgr->stolen_base, causing GPU DMA to
read or overwrite low host system RAM (for example during fbdev BIOS
framebuffer takeover).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116131349.3338=
18-7-dev@lankhorst.se?part=3D2
