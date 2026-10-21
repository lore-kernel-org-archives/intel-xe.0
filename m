Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF316606A31B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwloQUYr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65D310E1AC;
	Wed, 21 Oct 2026 15:20:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1518610FE48
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 15:20:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D053D43B6F;
 Wed, 21 Oct 2026 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837EE1F000C3;
 Wed, 21 Oct 2026 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792596020;
 bh=9HYsPf+jYtipZRRsIWJ0uCC23Sq5vgkyz89UDTUshCs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WwloQUYrmYUQPS0zj1ELRTecxsw3TDGx9xIMR8UEDbfbwruE/C4wKxpCYf3o24hSq
 2Ugf5seWZ/tmn3B9yeM3zOmSLVPVzYJGsp0SaKji4hE4UrUWQvJW7A4gd0/FBZ6v6g
 dtS3UUNfTRHYOq7/wfSaJAAJcGLZ3BLvKF/EsL/49QaEwnhTsIB5LoLkdcy5ZjRvf5
 iPSR5V4Xy8c6uLac3V+0rwMzfOwMk8vhCXVvVeciBbvQGdEYc3ByvuhcBAlMWukqUj
 GXpM88wwNlZ9IgXW0R8RunRscH3IiRnAsAMp3cLPRY5pIY03HHl7jYVps4H673BlHA
 gy0O5z4ko33SA==
Message-ID: <sashiko-outbox-180429@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/xe/display: Use xe_bo_addr_iter in remapped DPT
 pinning
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261021150116.516131-4-dev@lankhorst.se>
References: <20261021150116.516131-3-dev@lankhorst.se>
 <20261021150116.516131-4-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 15:20:20 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] drm/xe/display: missing row stride advance in write_dpt_remapp=
ed_tiled()
- [High] drm/xe/display: signed 32-bit overflow in write_dpt_remapped_tiled=
()
--

commit 4aa5c19979d6ed81b66fd21e686dffd2dbb6da7e
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/xe/display: Use xe_bo_addr_iter in remapped DPT pinning

This commit replaces individual xe_bo_addr() lookups with
xe_bo_addr_iter_first() and xe_bo_addr_iter_addr() in
write_dpt_remapped_linear() and write_dpt_remapped_tiled() to reduce
remapped page table pinning complexity from O(N^2) to O(N).

> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index e09116265ae95..e7e5c70c7b236 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c

[ ... ]

> @@ -90,18 +91,17 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct ios=
ys_map *map,
>  	struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
>  	const u64 pte =3D xe_ggtt_encode_pte_flags(ggtt, bo,
>  						 xe_cache_pat_idx(xe, XE_CACHE_NONE));
> -	unsigned int offset, column, row;
> +	u32 offset =3D plane->offset * XE_PAGE_SIZE;
> +	struct xe_res_cursor cur;
> =20
> -	for (row =3D 0; row < plane->height; row++) {
> -		offset =3D (plane->offset + plane->src_stride * row) *
> -			 XE_PAGE_SIZE;
> -
> -		for (column =3D 0; column < plane->width; column++) {
> -			u64 addr =3D xe_bo_addr(bo, offset, XE_PAGE_SIZE);
> +	xe_bo_addr_iter_first(bo, &cur, offset, plane->height * plane->src_stri=
de * XE_PAGE_SIZE);

[Severity: High]
Can the size expression in write_dpt_remapped_tiled() in
drivers/gpu/drm/xe/display/xe_fb_pin.c overflow a 32-bit signed integer
before being converted to u64 for xe_bo_addr_iter_first()?

In include/drm/intel/gtt_view_types.h, struct intel_remapped_plane_info
defines height and src_stride as u16:

	struct {
		u16 width;
		u16 height;
		u16 src_stride;
		u16 dst_stride;
	};

And in drivers/gpu/drm/xe/xe_bo.h, the page size macro is defined with a
signed int literal:

	#define XE_PTE_SHIFT			12
	#define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)

Under C integer promotion rules, multiplying plane->height,
plane->src_stride, and the page size is evaluated in 32-bit signed int
arithmetic. When a large tiled framebuffer is created and pinned via
intel_fill_fb_info() -> calc_plane_remap_info() and
__xe_pin_fb_vma_dpt() -> write_dpt_remapped() -> write_dpt_remapped_tiled()
(for example, a 16384x16384 Tile4 framebuffer with a 131072-byte pitch where
plane->src_stride is 1024 and plane->height is 512, totaling 524,288 pages),
the 32-bit signed multiplication overflows to -2147483648 and sign-extends
to 0xffffffff80000000ULL in cur.remaining.

Could this use mul_u32_u32() or a u64 cast when computing the byte size?

> +	while (cur.remaining) {
> +		for (u32 column =3D 0; column < plane->width; column++) {
> +			u64 addr =3D xe_bo_addr_iter_addr(&cur);
> =20
>  			iosys_map_wr(map, dest, u64, addr | pte);
>  			dest +=3D sizeof(u64);
> -			offset +=3D XE_PAGE_SIZE;
> +			xe_res_next(&cur, XE_PAGE_SIZE);
>  		}
> =20
>  		dest =3D write_dpt_padding(map, dest,

[Severity: Critical]
When plane->src_stride > plane->width (for example, when the framebuffer
pitch in tiles exceeds the plane width in tiles via calc_plane_remap_info()
or intel_plane_remap_gtt()), doesn't write_dpt_remapped_tiled() in
drivers/gpu/drm/xe/display/xe_fb_pin.c miss advancing cur across the
remaining (plane->src_stride - plane->width) pages at the end of each row?

Previously, the outer loop iterated over row =3D 0 .. plane->height - 1 and
recomputed offset from plane->src_stride * row, skipping
(plane->src_stride - plane->width) pages in bo between rows. With the new
loop, cur is initialized with a total size covering plane->height *
plane->src_stride pages, but each iteration of while (cur.remaining) only
advances cur by plane->width pages in the inner column loop.

When plane->src_stride > plane->width, this appears to cause several
regressions:

1. Row 1 and subsequent rows map the wrong pages from bo into map, reading
from offset + row * plane->width pages instead of offset + row *
plane->src_stride pages.

2. Because cur.remaining starts at plane->height * plane->src_stride pages
and only decreases by plane->width pages per outer loop iteration, the
while (cur.remaining) loop executes more than plane->height times. However,
__xe_pin_fb_vma_dpt() in drivers/gpu/drm/xe/display/xe_fb_pin.c allocates
dpt for intel_remapped_info_size(&view->remapped) entries (plane->height *
plane->dst_stride per tiled plane):

	else if (intel_gtt_view_is_remapped(view))
		dpt_size =3D ALIGN(intel_remapped_info_size(&view->remapped) * 8,
				 XE_PAGE_SIZE);

The extra outer loop iterations write past the end of dpt->vmap via
iosys_map_wr(map, dest, u64, addr | pte).

3. If (plane->height * plane->src_stride) is not a multiple of
plane->width, cur.remaining reaches 0 in the middle of the inner column
loop and underflows on the next column iteration in xe_res_next() in
drivers/gpu/drm/xe/xe_res_cursor.h:

	XE_WARN_ON(size > cur->remaining);

	cur->remaining -=3D size;
	if (!cur->remaining)
		return;

This wraps cur->remaining to 0xfffffffffffff000ULL and walks off the end
of cur->sgl in __xe_res_sg_next() or the gpu_buddy_block list.

4. When plane->offset > 0 (such as a non-zero horizontal tile offset
src_x > 0 in intel_plane_remap_gtt()), passing plane->height *
plane->src_stride pages to xe_bo_addr_iter_first() includes
(plane->src_stride - plane->width) trailing pages after the last row, which
can exceed the allocated size of bo and trigger a warning in xe_res_first().

Should write_dpt_remapped_tiled() advance cur by
(plane->src_stride - plane->width) pages after each row when
plane->src_stride > plane->width (or size the iterator to
((plane->height - 1) * plane->src_stride + plane->width) pages and advance
by the stride gap between rows)?

>
> [ ... ]
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021150116.5161=
31-3-dev@lankhorst.se?part=3D2
