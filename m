Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2235BC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 13:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C8C10E0FC;
	Tue, 20 Aug 2024 13:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6IoRGZ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3960B10E0FC
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724161300; x=1755697300;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZeRzczMKCKOPAD9UArRyOZS5kK9XAcAHmRt5vHTPFrY=;
 b=k6IoRGZ4z/PhhEpU8qYgIm8jFo/cFVMetEWXl9FYXciTT/Wkk9I6kOXa
 CSPUL78ehkM3ZZba1etxVslQdOiH/8F6ReBilfHq7ZJUMiKVyJ4+XmNzk
 9YmNbpAxh8k81tMPrqt186rDJh8P//fkdoQWKEU7hLfvvNxPJ6mK965CH
 51YSLFOaGYja/ZPgNkKECnNPv80/7SPp7eswozm2Sy4rKl7aNVTKJ/rT4
 t9NB8HBQV5yPt1ea76So47mGZLNWV4zwJ+g3bDcfN0DyM3wP7hfBKckaF
 S3yYStpffLNSieHUoxKW/f4V23FH1JftFA+EVdoHdsZHI3V75gNfvjuT1 Q==;
X-CSE-ConnectionGUID: 33ILS1LHQTaLy/nYZO4s3A==
X-CSE-MsgGUID: zReT8v51T1m9UONofOMAow==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25358694"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="25358694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:41:40 -0700
X-CSE-ConnectionGUID: Mn9XPQC7QTmq+LXvkIdUiQ==
X-CSE-MsgGUID: +Jx5q0LvThWLgvf8xTatfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="64943112"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.74])
 ([10.245.245.74])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:41:38 -0700
Message-ID: <485b9fa4714b2bdc6745d5e25d5160c98f0de0d5.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Ensure display fb is aligned in GGTT to a
 multiple of 64k, through padding
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Zbigniew =?UTF-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 15:41:36 +0200
In-Reply-To: <20240820050608.sueqpjtpayoygicj@zkempczy-mobl2>
References: <20240819153127.235831-1-maarten.lankhorst@linux.intel.com>
 <20240820050608.sueqpjtpayoygicj@zkempczy-mobl2>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Zbigniew, Maarten

On Tue, 2024-08-20 at 07:06 +0200, Zbigniew Kempczy=C5=84ski wrote:
> On Mon, Aug 19, 2024 at 05:31:27PM +0200, Maarten Lankhorst wrote:
> > This workaround is needed on battlemage to ensure that there is no
> > corruption when CCS is used.
> >=20
> > For testing, always enable the workaround. Should be easier to see
> > if something blows up. :)
> >=20
> > Signed-off-by: Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/display/xe_fb_pin.c | 82
> > ++++++++++++++++++++++++--
> > =C2=A01 file changed, 77 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > index d7db44e79eaf5..29a13a889414d 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -15,8 +15,68 @@
> > =C2=A0#include "xe_gt.h"
> > =C2=A0#include "xe_pm.h"
> > =C2=A0
> > +static inline bool needs_bmg_64k_workaround(struct xe_device *xe,
> > const struct intel_framebuffer *fb)
> > +{
> > +	if (xe->info.platform !=3D XE_BATTLEMAGE)
> > +		goto skip;
> > +
> > +	/* XXX? What is affected? */
> > +	if (fb->base.modifier !=3D I915_FORMAT_MOD_4_TILED)
> > +		goto skip;
> > +
> > +	if (!(intel_fb_obj(&fb->base)->ttm.base.size % SZ_64K))
> > +		goto skip;
> > +
> > +	return true;
> > +skip:
> > +	return true;
>=20
> I guess you mean false here according to commit description.
>=20
> I'm not too familiar with fb code, but if I'm not wrong you're adding
> dedicated padding on ggtt to keep fb in 64K chunks, but this is
> virtual
> range. Display folks said we should use physically contiguous 64K
> pages
> due to decompression CCS is resolved at physical addressing, not
> virtual.
>=20
> If I don't understand your code correctly, just forget about above
> note.

Yeah, if it requires *phyiscally* contigous 64K pages, then that's
indeed a different thing. But otoh, requiring 64K pages and at the same
time allowing 4K pages for other allocations might cause fragmentation
to the point where the 64K allocations fail.

So if this patch indeed doesn't fix the issue then that requires some
rethinking.

/Thomas



>=20
> --
> Zbigniew
>=20
> > +}
> > +
> > +static inline void pad_bmg_dpt(struct xe_device *xe, const struct
> > intel_framebuffer *fb,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct iosys_map *map, u32 ofs=
)
> > +{
> > +	struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)-
> > >mem.ggtt;
> > +	struct xe_bo *bo =3D intel_fb_obj(&fb->base);
> > +	u32 pad =3D 16 - (ofs % 16), x;
> > +	u64 pte;
> > +
> > +	if (!needs_bmg_64k_workaround(xe, fb))
> > +		return;
> > +
> > +	if (!(ofs % 16))
> > +		return;
> > +
> > +	pte =3D ggtt->pt_ops->pte_encode_bo(bo, 0, xe-
> > >pat.idx[XE_CACHE_NONE]);
> > +
> > +	/* Start over with the first few pages, dpt is always
> > aligned to a multiple
> > +		* of 512 pages, which means that there is enough
> > padding here
> > +		*/
> > +	for (x =3D 0; x < pad; x++)
> > +		iosys_map_wr(map, (ofs + x) * 8, u64, pte);
> > +}
> > +
> > +static inline void pad_bmg_ggtt(struct xe_device *xe, const struct
> > intel_framebuffer *fb, u32 ofs)
> > +{
> > +	struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)-
> > >mem.ggtt;
> > +	struct xe_bo *bo =3D intel_fb_obj(&fb->base);
> > +	u32 pad =3D SZ_64K - (ofs % SZ_64K), x;
> > +	u64 pte;
> > +
> > +	if (!needs_bmg_64k_workaround(xe, fb))
> > +		return;
> > +
> > +	if (!(ofs % SZ_64K))
> > +		return;
> > +
> > +	pte =3D ggtt->pt_ops->pte_encode_bo(bo, 0, xe-
> > >pat.idx[XE_CACHE_NONE]);
> > +
> > +	for (x =3D 0; x < pad; x +=3D XE_PAGE_SIZE)
> > +		ggtt->pt_ops->ggtt_set_pte(ggtt, ofs + x, pte);
> > +}
> > +
> > =C2=A0static void
> > -write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32
> > *dpt_ofs, u32 bo_ofs,
> > +write_dpt_rotated(const struct intel_framebuffer *fb, struct xe_bo
> > *bo,
> > +		=C2=A0 struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
> > =C2=A0		=C2=A0 u32 width, u32 height, u32 src_stride, u32
> > dst_stride)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> > @@ -39,6 +99,9 @@ write_dpt_rotated(struct xe_bo *bo, struct
> > iosys_map *map, u32 *dpt_ofs, u32 bo_
> > =C2=A0			src_idx -=3D src_stride;
> > =C2=A0		}
> > =C2=A0
> > +		/* Just pad everything out of paranoia? */
> > +		pad_bmg_dpt(xe, fb, map, *dpt_ofs / 8);
> > +
> > =C2=A0		/* The DE ignores the PTEs for the padding tiles
> > */
> > =C2=A0		*dpt_ofs +=3D (dst_stride - height) * 8;
> > =C2=A0	}
> > @@ -128,6 +191,9 @@ static int __xe_pin_fb_vma_dpt(const struct
> > intel_framebuffer *fb,
> > =C2=A0
> > =C2=A0			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> > =C2=A0		}
> > +
> > +		/* BMG is crappy, just pad everything? */
> > +		pad_bmg_dpt(xe, fb, &dpt->vmap, x);
> > =C2=A0	} else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED) {
> > =C2=A0		const struct intel_remapped_info *remap_info =3D
> > &view->remapped;
> > =C2=A0		u32 i, dpt_ofs =3D 0;
> > @@ -145,7 +211,7 @@ static int __xe_pin_fb_vma_dpt(const struct
> > intel_framebuffer *fb,
> > =C2=A0		u32 i, dpt_ofs =3D 0;
> > =C2=A0
> > =C2=A0		for (i =3D 0; i < ARRAY_SIZE(rot_info->plane); i++)
> > -			write_dpt_rotated(bo, &dpt->vmap,
> > &dpt_ofs,
> > +			write_dpt_rotated(fb, bo, &dpt->vmap,
> > &dpt_ofs,
> > =C2=A0					=C2=A0 rot_info-
> > >plane[i].offset,
> > =C2=A0					=C2=A0 rot_info-
> > >plane[i].width,
> > =C2=A0					=C2=A0 rot_info-
> > >plane[i].height,
> > @@ -159,7 +225,8 @@ static int __xe_pin_fb_vma_dpt(const struct
> > intel_framebuffer *fb,
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void
> > -write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32
> > *ggtt_ofs, u32 bo_ofs,
> > +write_ggtt_rotated(const struct intel_framebuffer *fb,
> > +		=C2=A0=C2=A0 struct xe_bo *bo, struct xe_ggtt *ggtt, u32
> > *ggtt_ofs, u32 bo_ofs,
> > =C2=A0		=C2=A0=C2=A0 u32 width, u32 height, u32 src_stride, u32
> > dst_stride)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> > @@ -177,6 +244,8 @@ write_ggtt_rotated(struct xe_bo *bo, struct
> > xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
> > =C2=A0			src_idx -=3D src_stride;
> > =C2=A0		}
> > =C2=A0
> > +		pad_bmg_ggtt(xe, fb, *ggtt_ofs);
> > +
> > =C2=A0		/* The DE ignores the PTEs for the padding tiles
> > */
> > =C2=A0		*ggtt_ofs +=3D (dst_stride - height) * XE_PAGE_SIZE;
> > =C2=A0	}
> > @@ -201,7 +270,8 @@ static int __xe_pin_fb_vma_ggtt(const struct
> > intel_framebuffer *fb,
> > =C2=A0		goto out;
> > =C2=A0
> > =C2=A0	align =3D XE_PAGE_SIZE;
> > -	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
> > +	if ((xe_bo_is_vram(bo) && (ggtt->flags &
> > XE_GGTT_FLAGS_64K)) ||
> > +	=C2=A0=C2=A0=C2=A0 needs_bmg_64k_workaround(xe, fb))
> > =C2=A0		align =3D max_t(u32, align, SZ_64K);
> > =C2=A0
> > =C2=A0	if (bo->ggtt_node.size && view->type =3D=3D
> > I915_GTT_VIEW_NORMAL) {
> > @@ -220,6 +290,8 @@ static int __xe_pin_fb_vma_ggtt(const struct
> > intel_framebuffer *fb,
> > =C2=A0
> > =C2=A0			ggtt->pt_ops->ggtt_set_pte(ggtt, vma-
> > >node.start + x, pte);
> > =C2=A0		}
> > +
> > +		pad_bmg_ggtt(xe, fb, vma->node.start + x);
> > =C2=A0	} else {
> > =C2=A0		u32 i, ggtt_ofs;
> > =C2=A0		const struct intel_rotation_info *rot_info =3D
> > &view->rotated;
> > @@ -235,7 +307,7 @@ static int __xe_pin_fb_vma_ggtt(const struct
> > intel_framebuffer *fb,
> > =C2=A0		ggtt_ofs =3D vma->node.start;
> > =C2=A0
> > =C2=A0		for (i =3D 0; i < ARRAY_SIZE(rot_info->plane); i++)
> > -			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
> > +			write_ggtt_rotated(fb, bo, ggtt,
> > &ggtt_ofs,
> > =C2=A0					=C2=A0=C2=A0 rot_info-
> > >plane[i].offset,
> > =C2=A0					=C2=A0=C2=A0 rot_info-
> > >plane[i].width,
> > =C2=A0					=C2=A0=C2=A0 rot_info-
> > >plane[i].height,
> > --=20
> > 2.45.2
> >=20

