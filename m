Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B4606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kF7aQk3n
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF9810E066;
	Wed,  4 Nov 2026 13:24:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E35D10E066
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 13:24:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E6914074C;
 Wed,  4 Nov 2026 13:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3AB1F000C1;
 Wed,  4 Nov 2026 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793798661;
 bh=4Gp+Puqqy3ytntrDFKDS4UZTfrk5CffDQ02g/F8d9zs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=kF7aQk3n3Z3PgHgE96TOs8307GHZmOvroWqP91pzMMFF08NK/9SWFSDDmhqsbAnWK
 4X41XtCfm8rRFCV2vBMtX5NT7R708aBdM3fo5CiMdRlj9mxwbD7t2/s1SslTBl84eA
 rmhDz+fHiMjOXtI2kl7EGm5AmDMXI+7qfGLCKtJJbDCLjZxIctU3jfjGWIPwybNCEH
 dyPaFM41mwOd+Nxgr4kisZfgQlSyjp9pQOlHmcTnqdBPPT20d9aQRvrHZninQEoO1M
 o0oNMYtF6Lee9mc8nkI0S20ljzC9jyDsmfbhRM61I/DR2vWUqnEszyosZ/hbzPWa/r
 pVAuIGQfPljfQ==
Message-ID: <sashiko-outbox-197338@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe: Add a per-client debugfs file reporting bo
 NUMA node distribution
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261104130836.134790-1-thomas.hellstrom@linux.intel.com>
References: <20261104130836.134790-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 13:24:21 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/xe: shrinker-purged BOs misreported as swapped in xe_bo_prin=
t_numa_info()
- [Medium] drm/xe: DEFER_BACKING VRAM BOs misreported in xe_bo_print_numa_i=
nfo_locked()
--

commit 66cc9eac8b32df8912217731dcdb5be7a56a8d77
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Add a per-client debugfs file reporting bo NUMA node distribution

This commit adds a per-client "bo_numa" debugfs file that implements a
write-request / read-response protocol to report the size, placement, and
per-NUMA-node page counts of a GEM buffer object specified by handle.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a0..bf3f6d9e4c61c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c

[ ... ]

> @@ -4248,6 +4250,113 @@ void xe_bo_runtime_pm_release_mmap_offset(struct =
xe_bo *bo)
>  	list_del_init(&bo->vram_userfault_link);
>  }
> =20
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static void xe_bo_count_numa_pages(struct ttm_tt *tt, unsigned long *nod=
es)
> +{
> +	pgoff_t i;
> +
> +	for (i =3D 0; i < tt->num_pages; ++i)
> +		nodes[page_to_nid(tt->pages[i])]++;
> +}
> +
> +static void xe_bo_print_numa_info_locked(struct xe_bo *bo, unsigned long=
 *nodes,
> +					 struct drm_printer *p)
> +{
> +	struct ttm_resource *res =3D bo->ttm.resource;
> +	struct ttm_tt *tt =3D bo->ttm.ttm;
> +	unsigned long total =3D 0;
> +	const char *name;
> +	int nid;
> +
> +	xe_bo_assert_held(bo);
> +
> +	name =3D res ? xe_mem_type_to_name[res->mem_type] : NULL;
> +	drm_printf(p, "size: %zu\n", xe_bo_size(bo));
> +	if (name)
> +		drm_printf(p, "placement: %s\n", name);
> +	else if (res)
> +		drm_printf(p, "placement: mem_type %u\n", res->mem_type);
> +	else
> +		drm_puts(p, "placement: none\n");
> +
> +	/* The pages of sg bos are owned by the exporter and not visible. */
> +	if (bo->ttm.type =3D=3D ttm_bo_type_sg) {
> +		drm_puts(p, "pages: unknown (sg bo)\n");
> +		return;
> +	}
> +
> +	if (tt && ttm_tt_is_swapped(tt)) {
> +		drm_puts(p, "pages: swapped\n");
> +		return;
> +	}

[Severity: Medium]
In drivers/gpu/drm/xe/xe_bo.c, can xe_bo_print_numa_info_locked() misreport
shrinker-purged buffer objects as swapped?

When a buffer object marked DONTNEED is reclaimed by the shrinker via
xe_bo_shrink() -> xe_bo_shrink_purge(), it invokes ttm_bo_shrink() with
.purge =3D true:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink_purge() {
	lret =3D ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
			     {.purge =3D true,
			      .writeback =3D false,
			      .allow_move =3D false});
}

Inside ttm_bo_shrink() -> ttm_tt_backup(), ttm_pool_backup() frees the
pages and returns the freed page count, causing ttm_tt_backup() to set
TTM_TT_FLAG_BACKED_UP on tt->page_flags even when purging. For example,
xe_ttm_tt_populate() specifically checks !xe_tt->purgeable alongside
ttm_tt_is_backed_up(tt):

drivers/gpu/drm/xe/xe_bo.c:xe_ttm_tt_populate() {
	if (ttm_tt_is_backed_up(tt) && !xe_tt->purgeable) {
		err =3D ttm_tt_restore(ttm_dev, tt, ctx);
	} else {
		ttm_tt_clear_backed_up(tt);
}

Because ttm_tt_is_swapped(tt) tests TTM_TT_FLAG_SWAPPED |
TTM_TT_FLAG_BACKED_UP without checking xe_bo_is_purged(bo) or
xe_tt->purgeable, a BO purged by the shrinker will be reported as
"pages: swapped" rather than purged or not populated.

> +
> +	if (tt && !ttm_tt_is_populated(tt)) {
> +		drm_puts(p, "pages: not populated\n");
> +		return;
> +	}

[Severity: Medium]
What happens in xe_bo_print_numa_info_locked() in drivers/gpu/drm/xe/xe_bo.c
when a VRAM buffer object is created with DRM_XE_GEM_CREATE_FLAG_DEFER_BACK=
ING
and then validated into VRAM?

In xe_bo_init_locked(), XE_BO_FLAG_DEFER_BACKING initially places the BO in
sys_placement, which causes ttm_bo_validate() to allocate an unpopulated
bo->ttm.ttm:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_init_locked() {
	/* Defer populating type_sg bos */
	placement =3D (type =3D=3D ttm_bo_type_sg ||
		     bo->flags & XE_BO_FLAG_DEFER_BACKING) ? &sys_placement :
		&bo->placement;
}

When the BO is subsequently validated into VRAM via xe_bo_validate() ->
ttm_bo_validate() -> xe_bo_move(), move_lacks_source is true because the
ttm_tt was never populated, so xe_bo_move() takes the ttm_bo_move_null()
path instead of ttm_bo_move_accel_cleanup():

drivers/gpu/drm/xe/xe_bo.c:xe_bo_move() {
	} else {
		/*
		 * ttm_bo_move_accel_cleanup() may blow up if
		 * bo->resource =3D=3D NULL, so just attach the
		 * fence and set the new resource.
		 */
		dma_resv_add_fence(ttm_bo->base.resv, fence,
				   DMA_RESV_USAGE_KERNEL);
		ttm_bo_move_null(ttm_bo, new_mem);
	}
}

Because ttm_bo_move_null() does not destroy the unused bo->ttm.ttm, tt
remains non-NULL and unpopulated while the BO is populated in VRAM. Wouldn't
xe_bo_print_numa_info_locked() then report "placement: vram0" followed by
"pages: not populated", unlike normal VRAM BOs where tt is NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104130836.1347=
90-1-thomas.hellstrom@linux.intel.com?part=3D1
