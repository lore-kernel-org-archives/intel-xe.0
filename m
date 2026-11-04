Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1E1608360C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vas65d4I
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EE010E244;
	Wed,  4 Nov 2026 15:37:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A9410E244
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 15:36:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 76D3C60546;
 Wed,  4 Nov 2026 15:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC121F00919;
 Wed,  4 Nov 2026 15:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793806616;
 bh=werMYHj7gvEUxumS/gsqEL6O5VfTS6FHHRLX0ygpraU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Vas65d4IcPkUgi182y8SRyUJMRun02jfdgUWJPMVCaYXOJ7Bk2YKNnRvEFTcx2UmY
 IPFFqTZkGWj/hpc1/14MIBKpoaVSGDXS20uGFdkBPiQcKwqkWy5WADLoqfyIWWoi/H
 JD0MkSM3/CLsF1V/weT5rGUAtGZjyfBphrspLlIEumJMKjAiKSC2AC8uk7f3lQc0gf
 B3Xji4oHMvmRcZM5nKOBdGJY1V9fBsdBxqw8MDNVZvrkU9c4XeQ46QZWUT2WGJHVE/
 TqZbVWdCySRWwAIqFmLrATwfFVXdQmJRy3/BzWU1p7xrHKLYe/3rTB/Y1x5wxmVYqd
 KkBJl3AJGMd0A==
Message-ID: <sashiko-outbox-197517@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/xe: Add a per-client debugfs file reporting bo
 NUMA node distribution
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261104151335.163299-1-thomas.hellstrom@linux.intel.com>
References: <20261104151335.163299-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 15:36:55 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: BOs purged via xe_ttm_bo_purge() misreported in xe_bo_pr=
int_numa_info()
--

commit 1dc9067175a153440fcff8007b4ca1cbbb81027f
Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

drm/xe: Add a per-client debugfs file reporting bo NUMA node distribution

This commit adds a per-client "bo_numa" debugfs file that takes a GEM
handle written by userspace and reports a snapshot of the buffer object's
size, placement, and backing page distribution across NUMA nodes.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a0..ee232e73bc3b9 100644
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
> +		drm_puts(p, "pages: swapped/purged\n");
> +		return;
> +	}
> +
> +	if (tt && !ttm_tt_is_populated(tt)) {
> +		drm_puts(p, "pages: not populated\n");
> +		return;
> +	}

[Severity: Medium]
As reported by Sashiko on v2 [1], in xe_bo_print_numa_info_locked(),
should this also check xe_bo_is_purged(bo) before checking
!ttm_tt_is_populated(tt)?

While purging via the shrinker sets TTM_TT_FLAG_BACKED_UP on
tt->page_flags, DONTNEED buffer objects can also be purged via
xe_ttm_bo_purge() during eviction in xe_bo_move(), swap notification in
xe_ttm_bo_swap_notify(), or VRAM page retirement:

drivers/gpu/drm/xe/xe_bo.c:xe_ttm_bo_purge() {
    ...
	ret =3D ttm_bo_validate(ttm_bo, &place, ctx);
	if (ret)
		return ret;

	/* Commit the state transition only once invalidation was queued */
	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_PURGED);
    ...
}

Validating with an empty placement invokes ttm_bo_pipeline_gutting(),
which unpopulates or replaces bo->ttm.ttm without setting
TTM_TT_FLAG_SWAPPED or TTM_TT_FLAG_BACKED_UP. As a result, when a handle
for a BO purged via xe_ttm_bo_purge() is written to bo_numa,
ttm_tt_is_swapped(tt) is false and xe_bo_print_numa_info_locked() reports
"pages: not populated" instead of "pages: swapped/purged".

[1] https://lore.kernel.org/r/sashiko-outbox-197338@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104151335.1632=
99-1-thomas.hellstrom@linux.intel.com?part=3D1
