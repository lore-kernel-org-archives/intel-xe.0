Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A871CA5FD4
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 10:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF00B10E34E;
	Fri,  2 Oct 2026 10:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m8F+ScUW";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8762210E34E
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 10:53:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8258960A70;
 Fri,  2 Oct 2026 10:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179081F000FF;
 Fri,  2 Oct 2026 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790938433;
 bh=g1qA2+RtU7CcqFiymKOzKZaFedp1rIuxjmJIuYwpHfM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=m8F+ScUWU5eu1DR8eh8+4epg8lCVj6fOK2wJKADhweft90+ZQNyd65jnvTzPdEGDH
 0neCvgws4KyxlcWYBQuKNAm8i0sVwO4dVYaZRsiA83j1zrsRDd90+P4zXUtN7vvMHv
 RpBgAQF74nZiVJC14MdEePELF5Ndn1rz/PmqG5ySGY72OxDF4bTvR3CU/c/VaNL8fB
 NtSefHUUTHEtyy35CHYCZQ/YHqI6O1YAu52TsV/LDGaEaJMhgDmM8Rj0hRbtE06got
 B2eJvwCTBQVei10f5bbELQcbbZn2RfuoIoPDdUSd7qqGNY0kXBV8GDR4hE6F/7A2cr
 fNrnoc/ewNOhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/7] drm/xe/vram: Make VRAM pools the allocation handle
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261002104018.3648425-4-piotr.piorkowski@intel.com>
References: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
 <20261002104018.3648425-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 10:53:52 +0000
Message-Id: <20261002105353.179081F000FF@smtp.kernel.org>
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
- [High] xe: NULL pointer dereference of tile->mem.vram on integrated graph=
ics
--

commit c154aad6efc21416255e0f4ca071bf1270bc02d1
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
drm/xe/vram: Make VRAM pools the allocation handle

This commit changes allocation paths to use a struct xe_vram_pool rather
than a struct xe_vram_region. This allows regions to be split into several
pools without affecting every consumer. BO creation, migration, and page
fault paths are updated to interact with the new pool abstractions.

> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_asser=
t.h
> --- a/drivers/gpu/drm/xe/xe_assert.h
> +++ b/drivers/gpu/drm/xe/xe_assert.h
[ ... ]
> @@ -147,7 +147,8 @@
>  	char __buf[10] __maybe_unused;								\
>  	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,	=
		\
>  		      __tile->id, ({ string_get_size(						\
> -				     xe_vram_region_actual_physical_size(__tile->mem.vram), 1,	\
> +				     xe_vram_region_actual_physical_size(			\
> +					__tile->mem.vram->region), 1,				\
>  				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
>  })

[Severity: High]
Is it possible for __tile->mem.vram to be NULL here on integrated graphics?

On systems without dedicated graphics, xe_tile_alloc_vram() leaves=20
tile->mem.vram as NULL. If an assertion triggers, evaluating=20
__tile->mem.vram->region while formatting the message might cause a kernel
panic.

> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
[ ... ]
> @@ -99,7 +99,7 @@ static ssize_t inject_mempage_offline_trigger(struct fi=
le *f,
>  {
>  	struct xe_device *xe =3D file_inode(f)->i_private;
>  	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
> -	struct xe_vram_region *vr =3D tile->mem.vram;
> +	struct xe_vram_region *vr =3D tile->mem.vram->region;
>  	u64 pfn;
>  	int ret;

[Severity: High]
Could this early dereference cause a panic on integrated graphics?

If tile->mem.vram is NULL, evaluating tile->mem.vram->region before the
subsequent !vr check below will fault when accessing this debugfs node.

> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pa=
gefault.c
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
[ ... ]
> @@ -201,7 +201,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, =
struct xe_vma *vma,
>  		xe_validation_ctx_init(&ctx, &vm->xe->val, &exec,
>  				       (struct xe_val_flags) {});
>  		drm_exec_until_all_locked(&exec) {
> -			err =3D xe_pagefault_begin(&exec, vma, tile->mem.vram,
> +			err =3D xe_pagefault_begin(&exec, vma, tile->mem.vram->region,
>  						 needs_vram =3D=3D 1);
>  			drm_exec_retry_on_contention(&exec);
>  			xe_validation_retry_on_oom(&ctx, &err);

[Severity: High]
Does tile->mem.vram need a NULL check before being dereferenced?

During a GPU page fault on an integrated graphics system, tile->mem.vram is
expected to be NULL. Evaluating tile->mem.vram->region directly here to pass
into xe_pagefault_begin() could lead to a NULL pointer dereference.

> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
[ ... ]
> @@ -29,11 +30,12 @@ static inline bool xe_tile_is_root(struct xe_tile *ti=
le)
>   * struct xe_tile pointer
>   * @tile: Pointer to the struct xe_tile.
>   *
> - * Return: Pointer to the struct xe_vram_region embedded in *@tile.
> + * Return: Pointer to the struct xe_vram_region backing *@tile's general
> + * purpose VRAM pool.
>   */
>  static inline struct xe_vram_region *xe_tile_to_vr(struct xe_tile *tile)
>  {
> -	return tile->mem.vram;
> +	return tile->mem.vram->region;
>  }

[Severity: High]
Will this unconditionally dereference tile->mem.vram?

Previously this function just returned the pointer, which could safely be
NULL if the device had no VRAM pool. Extracting the region from it might now
panic on integrated graphics if called.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002104018.3648=
425-1-piotr.piorkowski@intel.com?part=3D3
