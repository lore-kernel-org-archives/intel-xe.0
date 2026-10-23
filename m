Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBCD606A325
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8wWFaPI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7788E112AE0;
	Fri, 23 Oct 2026 11:59:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB8C112AFC
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 11:59:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9E4B5429FA;
 Fri, 23 Oct 2026 11:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D781F01829;
 Fri, 23 Oct 2026 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792756743;
 bh=F0zVUrmuOQ3o4dIOeAOPuP2k/sMbfOEscnOMsew53Ag=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=n8wWFaPIXGhb0kEBxe+DZwVcqtCruP2MF10B/M4A2hxYP7HZCFnXh1psIOpJ8Achv
 sjoKGHyDP4+33VaTOVH3X5lXSCit//+IdTo4T3xRns2j4wgJj+EyZq3AzICSpynoMx
 qDwdFORM/KOoBq4vmpwdLrWJNye/ILh9I5DpDmgD/fygpCGSAV2r8hVlv3BTJbsclk
 2spL/B96lh546pqVP9DVy3ySUdnpb8GHQHQFIj6WwNHOJPKfsSd+bilPQ7f4j9VZh3
 e7V5Z1YSytGaUe+9f7w8ntqYUSVA5MALbDQYXdiRJz7PVlDLI4AacVj0ID0Oy0b4hJ
 X9z1LIoh3gnOg==
Message-ID: <sashiko-outbox-182746@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe/display: Use xe_bo_addr_iter in remapped
 DPT pinning
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261023114616.735366-2-dev@lankhorst.se>
References: <20261023114616.735366-1-dev@lankhorst.se>
 <20261023114616.735366-2-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 11:59:02 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] drm/xe/display: 32-bit overflow in write_dpt_remapped_tiled() =
size calculation
--

commit 061485566c342a900f9594f9a2b0fa400ea6f8c5
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/xe/display: Use xe_bo_addr_iter in remapped DPT pinning

This patch replaces per-page xe_bo_addr() lookups in
write_dpt_remapped_linear() and write_dpt_remapped_tiled() with
xe_bo_addr_iter_first() and xe_bo_addr_iter_addr() cursor iteration to
reduce pinning complexity from O(N^2) to O(N).

> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index 15fbd3fe6cbb7..7d53f77308a46 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -17,6 +17,7 @@
>  #include "xe_ggtt.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> +#include "xe_res_cursor.h"
>  #include "xe_vram_types.h"
> =20
>  static void
> @@ -68,14 +69,14 @@ write_dpt_remapped_linear(struct xe_bo *bo, struct io=
sys_map *map,
>  	const u64 pte =3D xe_ggtt_encode_pte_flags(ggtt, bo,
>  						 xe_cache_pat_idx(xe, XE_CACHE_NONE));
>  	unsigned int offset =3D plane->offset * XE_PAGE_SIZE;
> -	unsigned int size =3D plane->size;
> +	unsigned int size =3D plane->size * XE_PAGE_SIZE;
> +	struct xe_res_cursor cur;
> =20
> -	while (size--) {
> -		u64 addr =3D xe_bo_addr(bo, offset, XE_PAGE_SIZE);
> +	for (xe_bo_addr_iter_first(bo, &cur, offset, size); cur.remaining; xe_r=
es_next(&cur, XE_PAGE_SIZE)) {
> +		u64 addr =3D xe_bo_addr_iter_addr(&cur);
> =20
>  		iosys_map_wr(map, dest, u64, addr | pte);
>  		dest +=3D sizeof(u64);
> -		offset +=3D XE_PAGE_SIZE;
>  	}
> =20
>  	return dest;
> @@ -90,20 +91,22 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct ios=
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
> +	while (cur.remaining) {

[Severity: Critical]
Can the size calculation in write_dpt_remapped_tiled() overflow a 32-bit
signed int and cause an out-of-bounds write past the end of map?

In include/drm/intel/gtt_view_types.h, struct intel_remapped_plane_info
defines height and src_stride as u16:

include/drm/intel/gtt_view_types.h:
	struct intel_remapped_plane_info {
		/* in gtt pages */
		u32 offset:31;
		u32 linear:1;
		union {
			/* in gtt pages for !linear */
			struct {
				u16 width;
				u16 height;
				u16 src_stride;
				u16 dst_stride;
			};

			/* in gtt pages for linear */
			u32 size;
		};
	} __packed;

And in drivers/gpu/drm/xe/xe_bo.h, XE_PAGE_SIZE is a signed int expression:

	#define XE_PTE_SHIFT			12
	#define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)

In write_dpt_remapped_tiled(), plane->height and plane->src_stride undergo
standard C integer promotion from u16 to 32-bit signed int, so the product
plane->height * plane->src_stride * XE_PAGE_SIZE is evaluated in 32-bit
signed arithmetic before being converted to u64 for xe_bo_addr_iter_first().

When userspace pins a maximum-dimension tiled framebuffer via
drm_mode_addfb2 -> intel_framebuffer_init() -> intel_fill_fb_info() and
xe_fb_pin_to_ggtt() -> xe_pin_fb_vma_dpt() -> write_dpt_remapped_tiled()
(for example, a 16384x16384 4-tiled or Y-tiled plane with a 128 KiB pitch
where plane->height is 512 and plane->src_stride is 1024, totaling 524,288
pages or 2 GiB), the multiplication 512 * 1024 * 4096 overflows INT_MAX to
-0x80000000 and sign-extends to u64 as 0xffffffff80000000ULL.

Because the outer loop condition was changed from row < plane->height to
while (cur.remaining), cur.remaining starts at 0xffffffff80000000ULL and do=
es
not reach zero after all plane->height rows are written. This causes the lo=
op
to overrun the BO resource cursor in xe_res_next() and write PTEs past the
end of the DPT iosys_map via iosys_map_wr().

Similarly, in both write_dpt_remapped_linear() and
write_dpt_remapped_tiled(), multiplying plane->offset and plane->size by
XE_PAGE_SIZE in 32-bit unsigned int / u32 variables truncates byte offsets
and sizes at or above 4 GiB. Should these byte offset and size calculations
use u64 arithmetic (or mul_u32_u32() / a 64-bit page size constant)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023114616.7353=
66-1-dev@lankhorst.se?part=3D2
