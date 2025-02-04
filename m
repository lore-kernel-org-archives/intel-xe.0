Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DC7C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 12:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9971610E14C;
	Tue,  4 Feb 2025 12:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e9Yv6ICV";
	dkim-atps=neutral
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC3010E14C
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 12:10:47 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2f9d5f8a4b9so90660a91.0
 for <intel-xe@lists.freedesktop.org>; Tue, 04 Feb 2025 04:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738671047; x=1739275847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdE5trmAcYVmiHIs3q4d2MIxhihRV3vyoEq7rzqPwWA=;
 b=e9Yv6ICVlyZOmddGIhp3x2nPDkz4xyPpROorRUGK7VejPpfBvuJvK3w9o0vkoAqipj
 7tjuArumDzlBuZvtE+PKqwub/34bvm/VbxaSf0389x1ikFbbUgLX3W8ckNeGQRjPTPxu
 0+Nm0F+5UkilQrQ3n7QAuElLoev8uA8Gar4RPQxUxmD6VvxuNPaY97iBgA+DR0gYPjPS
 yC0RsZ2nLjiesoyOOKuS+4dA4fUX32Q3yQcvKaC41aaeOghG6kdT4xB37EQ8EDSRkb0D
 wCnMtfqDsjT9gem+hOmqtld5xsMFR73U6nXVDXsxEvBbj6TxpvQdh0afwaS7onCgzpSU
 NVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738671047; x=1739275847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hdE5trmAcYVmiHIs3q4d2MIxhihRV3vyoEq7rzqPwWA=;
 b=NnF5bsBnDeb9LRuBsaq0KzQ5WBvEUhEPBOBCkZX03YeVcsHtKm/NhRy8oa3qqw+NYS
 fA9UBFLqIb05U4trJ9X9zTyhftiOUYdmXbr0xzjoMinMtGVV2QOYJ7dOb0BB3WguSn94
 jDH/aypzxIhCmsKZVD79YVwCljEe3MCoZOqmuOOtmcI6ZFP27633o5QUfEqjIOwtam9d
 fB9ITPkvsQNTsYmKWt9mqNg11aYq45yr4nJsANfysLd/B/hwuwXKk157bx2lzrlnKnm+
 BxY3ZBABN6chv/qfUzW7XjRPg3yKqkTcqo0u6ExZhsM5p2g/NxKoljT22pY49L2QSUyi
 shCQ==
X-Gm-Message-State: AOJu0Yyf8KacsrrjCYTs8PpSl9KbNd/QRaysiHOjL0SxWHcQ1DlEO9dl
 wmFNS1QbtV0NixdwRYyd10sT+aF445jD4fsvfw8Mcz+T+tmyrs165A7KJaGolsaHxpUlTCSZMI3
 YY0YyJihkIJIhVNZrnmnsLnB7TQ4=
X-Gm-Gg: ASbGnctDdvZYatfxc5FZypUVGJeUcOTuSZpVYywOTEYFE2BeE44arDm1fGgZBt9LLUX
 Na2INOmgLZjxQ5CXQ5r/7WUeC6iarB7FnBZNNx2PAOCWabbNex31HQwmMOXpIPhRycT6QHbzoow
 ==
X-Google-Smtp-Source: AGHT+IFR8RAO5nWb0esCubbvWfgcRnA+7CW3NH905MVsYTHJfnGxikoXao83Y9x8pdt1eVE+ntk7kPC38hv8R2dzHzY=
X-Received: by 2002:a17:90b:2dca:b0:2ee:b666:d14a with SMTP id
 98e67ed59e1d1-2f83ac00cf5mr41501991a91.17.1738671047026; Tue, 04 Feb 2025
 04:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <20250114180403.896587-2-juhapekka.heikkila@gmail.com>
 <64decd28-e020-4a53-9766-7d57a5137c86@ursulin.net>
 <221a2230-1fff-4f9c-9be4-7a2ef4db2776@ursulin.net>
In-Reply-To: <221a2230-1fff-4f9c-9be4-7a2ef4db2776@ursulin.net>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 4 Feb 2025 14:10:38 +0200
X-Gm-Features: AWEUYZmTctd7fji0Zq0KhPeAdE6EDLPqQhZIgVQkBRrSD8ZWQA2U3cqQZIXm3s0
Message-ID: <CAJ=qYWTotU_P6X-HOtkBCNzG4hEcw-=Ch5ymHYyBh0POa8HUQw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/xe/display: Unify display page table mapping
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 4, 2025 at 1:38=E2=80=AFPM Tvrtko Ursulin <tursulin@ursulin.net=
> wrote:
>
>
> On 04/02/2025 11:25, Tvrtko Ursulin wrote:
> >
> > On 14/01/2025 18:04, Juha-Pekka Heikkila wrote:
> >> Unify writing of remapped and straight DPTs. Take out writing of
> >> rotated DPT since Xe doesn't support any platform that does
> >> 90 degree rotated framebuffers.
> >
> > Consider giving my series which fixes AuxCSS a look instead? Given ther=
e
> > is external interest to have all that work on ADL-P. I could respin wit=
h
> > rotated cleaned up in a similar fashion I did for remapped. Maintenance
> > cost is minimal since it is all very contained.
>
> Oh ADL-P does not support hardware rotation. I missed the fact it is
> display version 13..
>
> But the point regarding changes to remapping code are still valid I
> think, since to suport aux plane the refactoring from this patch looks
> in the wrong direction.
>

Yea, I kinda agree here with Tvrtko. I did earlier mention this to
JSaa. That aux thing will need to be checked.

Though, how far are we with your set Tvrtko? It did seem lot kms_ccs
tests failed.
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v1/shards-all.html?te=
stfilter=3Dkms_ccs.*crc.*gen12&hosts=3Dadlp

Did you check you had compression when you had clean image on your
machine? (aux surface was not zeroes) Those failures on my link ci are
with failing crc which mean the picture on screen was not correct.

/Juha-Pekka

> >> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> >> ---
> >>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++--------------=
--
> >>   1 file changed, 48 insertions(+), 93 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> index c28885316986..70322f28eee5 100644
> >> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> @@ -14,66 +14,44 @@
> >>   #include "xe_ggtt.h"
> >>   #include "xe_pm.h"
> >> -static void
> >> -write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32
> >> *dpt_ofs, u32 bo_ofs,
> >> -          u32 width, u32 height, u32 src_stride, u32 dst_stride)
> >> +static void encode_and_write_pte(struct xe_bo *bo, struct iosys_map
> >> *map,
> >> +                 u32 *ofs, u32 src_idx, struct xe_device *xe)
> >>   {
> >> -    struct xe_device *xe =3D xe_bo_device(bo);
> >>       struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
> >> -    u32 column, row;
> >> -
> >> -    /* TODO: Maybe rewrite so we can traverse the bo addresses
> >> sequentially,
> >> -     * by writing dpt/ggtt in a different order?
> >> -     */
> >> -
> >> -    for (column =3D 0; column < width; column++) {
> >> -        u32 src_idx =3D src_stride * (height - 1) + column + bo_ofs;
> >> -
> >> -        for (row =3D 0; row < height; row++) {
> >> -            u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, src_idx *
> >> XE_PAGE_SIZE,
> >> -                                  xe->pat.idx[XE_CACHE_NONE]);
> >> -
> >> -            iosys_map_wr(map, *dpt_ofs, u64, pte);
> >> -            *dpt_ofs +=3D 8;
> >> -            src_idx -=3D src_stride;
> >> -        }
> >> -
> >> -        /* The DE ignores the PTEs for the padding tiles */
> >> -        *dpt_ofs +=3D (dst_stride - height) * 8;
> >> -    }
> >> -
> >> -    /* Align to next page */
> >> -    *dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
> >> +    u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZ=
E,
> >> +                          xe->pat.idx[XE_CACHE_NONE]);
> >> +    iosys_map_wr(map, *ofs, u64, pte);
> >> +    *ofs +=3D 8;
> >>   }
> >> -static void
> >> -write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32
> >> *dpt_ofs,
> >> -           u32 bo_ofs, u32 width, u32 height, u32 src_stride,
> >> -           u32 dst_stride)
> >> +static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u32
> >> *dpt_ofs,
> >> +              const struct intel_remapped_plane_info *plane,
> >> +              enum i915_gtt_view_type type)
> >>   {
> >>       struct xe_device *xe =3D xe_bo_device(bo);
> >> -    struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
> >> -    u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_ind=
ex)
> >> -        =3D ggtt->pt_ops->pte_encode_bo;
> >> -    u32 column, row;
> >> -
> >> -    for (row =3D 0; row < height; row++) {
> >> -        u32 src_idx =3D src_stride * row + bo_ofs;
> >> -
> >> -        for (column =3D 0; column < width; column++) {
> >> -            iosys_map_wr(map, *dpt_ofs, u64,
> >> -                     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> >> -                     xe->pat.idx[XE_CACHE_NONE]));
> >> -
> >> -            *dpt_ofs +=3D 8;
> >> -            src_idx++;
> >> +    const u32 dpt_even =3D (plane->dst_stride - plane->width) * 8;
> >> +    const u32 dest_width =3D plane->width;
> >> +    const u32 dest_height =3D plane->height;
> >> +    u32 src_idx;
> >> +
> >> +    for (u32 row =3D 0; row < dest_height; ++row) {
> >> +        for (u32 column =3D 0; column < dest_width; ++column) {
> >> +            switch (type) {
> >> +            case I915_GTT_VIEW_NORMAL:
> >> +                src_idx =3D plane->offset + column;
> >> +                break;
> >> +            case I915_GTT_VIEW_REMAPPED:
> >> +                src_idx =3D plane->offset +
> >> +                    row * plane->src_stride + column;
> >> +                break;
> >> +            default:
> >> +                WARN(1, "Unsupported GTT view type: %d", type);
> >> +                return;
> >> +            }
> >> +            encode_and_write_pte(bo, map, dpt_ofs, src_idx, xe);
> >>           }
> >> -
> >> -        /* The DE ignores the PTEs for the padding tiles */
> >> -        *dpt_ofs +=3D (dst_stride - width) * 8;
> >> +        *dpt_ofs +=3D dpt_even;
> >>       }
> >> -
> >> -    /* Align to next page */
> >>       *dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
> >>   }
> >> @@ -125,59 +103,36 @@ static int __xe_pin_fb_vma_dpt(const struct
> >> intel_framebuffer *fb,
> >>   {
> >>       struct xe_device *xe =3D to_xe_device(fb->base.dev);
> >>       struct xe_tile *tile0 =3D xe_device_get_root_tile(xe);
> >> -    struct xe_ggtt *ggtt =3D tile0->mem.ggtt;
> >>       struct drm_gem_object *obj =3D intel_fb_bo(&fb->base);
> >>       struct xe_bo *bo =3D gem_to_xe_bo(obj), *dpt;
> >>       u32 dpt_size, size =3D bo->ttm.base.size;
> >> +    const struct intel_remapped_plane_info *plane;
> >> +    u32 i, plane_count, dpt_ofs =3D 0;
> >> +    struct intel_remapped_plane_info normal_plane;
> >> -    if (view->type =3D=3D I915_GTT_VIEW_NORMAL)
> >> +    if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
> >>           dpt_size =3D ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
> >> -    else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED)
> >> -        dpt_size =3D
> >> ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
> >> -                 XE_PAGE_SIZE);
> >> -    else
> >> -        /* display uses 4K tiles instead of bytes here, convert to
> >> entries.. */
> >> -        dpt_size =3D ALIGN(intel_rotation_info_size(&view->rotated) *=
 8,
> >> +        normal_plane.offset =3D 0;
> >> +        normal_plane.width =3D size / XE_PAGE_SIZE;
> >> +        normal_plane.height =3D 1;
> >> +        normal_plane.src_stride =3D size / XE_PAGE_SIZE;
> >> +        normal_plane.dst_stride =3D size / XE_PAGE_SIZE;
> >> +        plane =3D &normal_plane;
> >> +        plane_count =3D 1;
> >> +    } else {
> >> +        dpt_size =3D ALIGN(intel_remapped_info_size(&view->remapped) =
* 8,
> >>                    XE_PAGE_SIZE);
> >> +        plane =3D view->remapped.plane;
> >> +        plane_count =3D ARRAY_SIZE(view->remapped.plane);
> >> +    }
> >>       dpt =3D xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment)=
;
> >>       if (IS_ERR(dpt))
> >>           return PTR_ERR(dpt);
> >> -    if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
> >> -        u32 x;
> >> -
> >> -        for (x =3D 0; x < size / XE_PAGE_SIZE; x++) {
> >> -            u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_S=
IZE,
> >> -                                  xe->pat.idx[XE_CACHE_NONE]);
> >> -
> >> -            iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> >> -        }
> >> -    } else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED) {
> >> -        const struct intel_remapped_info *remap_info =3D &view->remap=
ped;
> >> -        u32 i, dpt_ofs =3D 0;
> >> -
> >> -        for (i =3D 0; i < ARRAY_SIZE(remap_info->plane); i++)
> >> -            write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
> >> -                       remap_info->plane[i].offset,
> >> -                       remap_info->plane[i].width,
> >> -                       remap_info->plane[i].height,
> >> -                       remap_info->plane[i].src_stride,
> >> -                       remap_info->plane[i].dst_stride);
> >> -
> >> -    } else {
> >> -        const struct intel_rotation_info *rot_info =3D &view->rotated=
;
> >> -        u32 i, dpt_ofs =3D 0;
> >> -
> >> -        for (i =3D 0; i < ARRAY_SIZE(rot_info->plane); i++)
> >> -            write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
> >> -                      rot_info->plane[i].offset,
> >> -                      rot_info->plane[i].width,
> >> -                      rot_info->plane[i].height,
> >> -                      rot_info->plane[i].src_stride,
> >> -                      rot_info->plane[i].dst_stride);
> >> -    }
> >> +    for (i =3D 0; i < plane_count; i++)
> >> +        write_dpt(bo, &dpt->vmap, &dpt_ofs, &plane[i], view->type);
> >>       vma->dpt =3D dpt;
> >>       vma->node =3D dpt->ggtt_node[tile0->id];
