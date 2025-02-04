Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C542C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 13:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057B310E61C;
	Tue,  4 Feb 2025 13:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kfDhBSPE";
	dkim-atps=neutral
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD5710E61C
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 13:11:10 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2ee9a780de4so7150419a91.3
 for <intel-xe@lists.freedesktop.org>; Tue, 04 Feb 2025 05:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738674670; x=1739279470; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSjcnAuNj8mo9/u3Xq+KcPY46n2ajVkX3NQ/0fEUHP8=;
 b=kfDhBSPEAyOitgtPEFeB/vk5/AAMeQj8tQ9RN+nVb0WkUrKPQMiSsklKtybykty0Al
 CPEsTqvEQf+IM9GjoQOc7GPHGj1ZyLPBef1+jVm/fv0lU+pwR1wKzbeXKAZ4IzraLA0a
 1rwVEgkq1BkpZ+aByb/xie+QhuSSnMQAQdy84M11WR0cvedtVLSFfPWef5Eql5wrpXKo
 hsjX29s0nL0YACK7AqS5RiOkuaJXOQc+T6cDMYXsm/obpWK+72HiFTfy+otST11WSJWl
 WlRpLhnNi+dWw9+Pn1jdroXS+9dF5IOEPUPZD38vKc1tDLD1VTpMBq2yHw5DjpKwdaQb
 Avzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738674670; x=1739279470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSjcnAuNj8mo9/u3Xq+KcPY46n2ajVkX3NQ/0fEUHP8=;
 b=C5NfzJJpVWb8Y/vtcsPZ1bPMQm2CcEH1rs/gA09IxDktnbkjlAk1NmvQLaqKR+w+rN
 A4cBG9i6pY10Xt/4ztN3Ryr7LZyuFVIk16N83vE553akvh7I8C+GwwXbRNeN6dpa/ouR
 fMe7mKMnm9Cq8U4nVPjDR4tAc5ZKX1FpiNoXSKVqgUhC4/SUMloP3KlLO78ggNeBvzT/
 tnZBgHnpWKGO/1IYhH15VrlZ/rCtOCBT0EBw+79uuiOPULDFbU2sP5FVlofjvgbcxNN1
 UgePXZYC2s9Bwe4ZbEVW/bP1bJdJSWVvsjFDW9PZ64SH9uE0mUZnNoTqm8Wu6tA9y3KJ
 CvtQ==
X-Gm-Message-State: AOJu0YzRBxXDSGTqVTMcqNer8cCtt2Lnd0wHBd8F7g0QUxQUU9kW6uKd
 OIIweNEWvIucHpn6hjd7fd9YlohT4Kx3AmxWef1gIj0RVHQC4nYXyjeEz1XLQJIhTy6KeGyFhfl
 Yu99XwE+2pfqfsf7IviD33v/gwuuvFVdvAJs=
X-Gm-Gg: ASbGnctm6DhIHZOQtHGIXeVnox8/9Pw4crCFry0nE3Rx1urPCKV1aCoPwklUP2J6O1T
 Y+qrPkvbpGhQOdE7x57TtDAWnN6A5SuTyRKkAwF8dEjs17Am4iUqTvh6fX4oI775maaD2MYtBdA
 ==
X-Google-Smtp-Source: AGHT+IFaa7Dfjt/YeHatx2Zl7e7Wa4By6AT85ebfc/kx7NWp7gdMhF28dSbKje5QeYGpGzYRrl8OLMGfF6bVyR4lZno=
X-Received: by 2002:a17:90b:56c4:b0:2f2:3efd:96da with SMTP id
 98e67ed59e1d1-2f83ac70e20mr39029520a91.24.1738674670234; Tue, 04 Feb 2025
 05:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <20250114180403.896587-2-juhapekka.heikkila@gmail.com>
 <64decd28-e020-4a53-9766-7d57a5137c86@ursulin.net>
 <221a2230-1fff-4f9c-9be4-7a2ef4db2776@ursulin.net>
 <CAJ=qYWTotU_P6X-HOtkBCNzG4hEcw-=Ch5ymHYyBh0POa8HUQw@mail.gmail.com>
 <ca83eabe-d2cf-4ee9-a51d-82809d07a447@ursulin.net>
In-Reply-To: <ca83eabe-d2cf-4ee9-a51d-82809d07a447@ursulin.net>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 4 Feb 2025 15:11:02 +0200
X-Gm-Features: AWEUYZlQWuGAkKpdphjAwswI2kHeJFXF4QjKri6ODkb5zTG2mzMpnnKt8cKsdPM
Message-ID: <CAJ=qYWSUabag3Xcw-zyAPjtFbxqyyfHSP=72tEtV+MZobiEETw@mail.gmail.com>
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

On Tue, Feb 4, 2025 at 2:31=E2=80=AFPM Tvrtko Ursulin <tursulin@ursulin.net=
> wrote:
>
>
> On 04/02/2025 12:10, Juha-Pekka Heikkil=C3=A4 wrote:
> > On Tue, Feb 4, 2025 at 1:38=E2=80=AFPM Tvrtko Ursulin <tursulin@ursulin=
.net> wrote:
> >>
> >>
> >> On 04/02/2025 11:25, Tvrtko Ursulin wrote:
> >>>
> >>> On 14/01/2025 18:04, Juha-Pekka Heikkila wrote:
> >>>> Unify writing of remapped and straight DPTs. Take out writing of
> >>>> rotated DPT since Xe doesn't support any platform that does
> >>>> 90 degree rotated framebuffers.
> >>>
> >>> Consider giving my series which fixes AuxCSS a look instead? Given th=
ere
> >>> is external interest to have all that work on ADL-P. I could respin w=
ith
> >>> rotated cleaned up in a similar fashion I did for remapped. Maintenan=
ce
> >>> cost is minimal since it is all very contained.
> >>
> >> Oh ADL-P does not support hardware rotation. I missed the fact it is
> >> display version 13..
> >>
> >> But the point regarding changes to remapping code are still valid I
> >> think, since to suport aux plane the refactoring from this patch looks
> >> in the wrong direction.
> >>
> >
> > Yea, I kinda agree here with Tvrtko. I did earlier mention this to
> > JSaa. That aux thing will need to be checked.
>
> Ah cool, fingers crossed.
>
> > Though, how far are we with your set Tvrtko? It did seem lot kms_ccs
> > tests failed.
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v1/shards-all.htm=
l?testfilter=3Dkms_ccs.*crc.*gen12&hosts=3Dadlp
> >
> > Did you check you had compression when you had clean image on your
> > machine? (aux surface was not zeroes) Those failures on my link ci are
> > with failing crc which mean the picture on screen was not correct.
>
> I was looking into this just this morning and posted some
> half-conclusions here:
>
> https://lore.kernel.org/intel-xe/eb3a3729-e8ef-4868-b8ff-b6efd66ef4fa@iga=
lia.com/T/#u
>
> When you say test with a clear image that I did not. I smoke tested it
> in desktop usage and looked at kms_flip_tiling which visually looks
> correct but as the above msg-id talks about, something is potentially
> fishy with crc collections and/or vblank handling. Since display isn't
> my area of expertise that is as far as I could get.

Those test explicitly testing for flipping and such may show there
something interesting but imo unrelated to this situation (for now).

If you have adlp machine where you see the screen you could try those
kms_ccs crc tests, you can run the tests in interactive mode with
'--i' parameter where the test always stop at commit so you'll see
what's there on screen. On kms_ccs I would not expect any vblank/other
issues to interfere crc because kms_ccs uses
igt_pipe_crc_collect_crc() to get the crc, what this mean is once the
test image is on screen crc counting is started, collected one crc and
crc counting is stopped .. to get the first crc this way few vblanks
have passed already since getting image on screen. Then on kms_ccs
test there is -c flag which should check there is something written on
aux surface. Getting these to work reliably I think is the first
thing...and on that subject I'd at first concentrate just one gen12rc
ccs, not ccs-cc and not mc ccs. I'd get these results by myself but
I'm bit of recovering at home and don't have needed hw in my hands.

On that lore.kernel.org thread where you mention "Bad CRC also varies
run to run, while visually things look fine to me on screen. Also a
delay before collecting the crc seems to improve things." could be
quite much anything, my first quess with those always is some
alignment missed somewhere.

/Juha-Pekka

> >>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> >>>> ---
> >>>>    drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++-----------=
-----
> >>>>    1 file changed, 48 insertions(+), 93 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>> index c28885316986..70322f28eee5 100644
> >>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>> @@ -14,66 +14,44 @@
> >>>>    #include "xe_ggtt.h"
> >>>>    #include "xe_pm.h"
> >>>> -static void
> >>>> -write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32
> >>>> *dpt_ofs, u32 bo_ofs,
> >>>> -          u32 width, u32 height, u32 src_stride, u32 dst_stride)
> >>>> +static void encode_and_write_pte(struct xe_bo *bo, struct iosys_map
> >>>> *map,
> >>>> +                 u32 *ofs, u32 src_idx, struct xe_device *xe)
> >>>>    {
> >>>> -    struct xe_device *xe =3D xe_bo_device(bo);
> >>>>        struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggt=
t;
> >>>> -    u32 column, row;
> >>>> -
> >>>> -    /* TODO: Maybe rewrite so we can traverse the bo addresses
> >>>> sequentially,
> >>>> -     * by writing dpt/ggtt in a different order?
> >>>> -     */
> >>>> -
> >>>> -    for (column =3D 0; column < width; column++) {
> >>>> -        u32 src_idx =3D src_stride * (height - 1) + column + bo_ofs=
;
> >>>> -
> >>>> -        for (row =3D 0; row < height; row++) {
> >>>> -            u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, src_idx *
> >>>> XE_PAGE_SIZE,
> >>>> -                                  xe->pat.idx[XE_CACHE_NONE]);
> >>>> -
> >>>> -            iosys_map_wr(map, *dpt_ofs, u64, pte);
> >>>> -            *dpt_ofs +=3D 8;
> >>>> -            src_idx -=3D src_stride;
> >>>> -        }
> >>>> -
> >>>> -        /* The DE ignores the PTEs for the padding tiles */
> >>>> -        *dpt_ofs +=3D (dst_stride - height) * 8;
> >>>> -    }
> >>>> -
> >>>> -    /* Align to next page */
> >>>> -    *dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
> >>>> +    u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_S=
IZE,
> >>>> +                          xe->pat.idx[XE_CACHE_NONE]);
> >>>> +    iosys_map_wr(map, *ofs, u64, pte);
> >>>> +    *ofs +=3D 8;
> >>>>    }
> >>>> -static void
> >>>> -write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32
> >>>> *dpt_ofs,
> >>>> -           u32 bo_ofs, u32 width, u32 height, u32 src_stride,
> >>>> -           u32 dst_stride)
> >>>> +static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u32
> >>>> *dpt_ofs,
> >>>> +              const struct intel_remapped_plane_info *plane,
> >>>> +              enum i915_gtt_view_type type)
> >>>>    {
> >>>>        struct xe_device *xe =3D xe_bo_device(bo);
> >>>> -    struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
> >>>> -    u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_i=
ndex)
> >>>> -        =3D ggtt->pt_ops->pte_encode_bo;
> >>>> -    u32 column, row;
> >>>> -
> >>>> -    for (row =3D 0; row < height; row++) {
> >>>> -        u32 src_idx =3D src_stride * row + bo_ofs;
> >>>> -
> >>>> -        for (column =3D 0; column < width; column++) {
> >>>> -            iosys_map_wr(map, *dpt_ofs, u64,
> >>>> -                     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> >>>> -                     xe->pat.idx[XE_CACHE_NONE]));
> >>>> -
> >>>> -            *dpt_ofs +=3D 8;
> >>>> -            src_idx++;
> >>>> +    const u32 dpt_even =3D (plane->dst_stride - plane->width) * 8;
> >>>> +    const u32 dest_width =3D plane->width;
> >>>> +    const u32 dest_height =3D plane->height;
> >>>> +    u32 src_idx;
> >>>> +
> >>>> +    for (u32 row =3D 0; row < dest_height; ++row) {
> >>>> +        for (u32 column =3D 0; column < dest_width; ++column) {
> >>>> +            switch (type) {
> >>>> +            case I915_GTT_VIEW_NORMAL:
> >>>> +                src_idx =3D plane->offset + column;
> >>>> +                break;
> >>>> +            case I915_GTT_VIEW_REMAPPED:
> >>>> +                src_idx =3D plane->offset +
> >>>> +                    row * plane->src_stride + column;
> >>>> +                break;
> >>>> +            default:
> >>>> +                WARN(1, "Unsupported GTT view type: %d", type);
> >>>> +                return;
> >>>> +            }
> >>>> +            encode_and_write_pte(bo, map, dpt_ofs, src_idx, xe);
> >>>>            }
> >>>> -
> >>>> -        /* The DE ignores the PTEs for the padding tiles */
> >>>> -        *dpt_ofs +=3D (dst_stride - width) * 8;
> >>>> +        *dpt_ofs +=3D dpt_even;
> >>>>        }
> >>>> -
> >>>> -    /* Align to next page */
> >>>>        *dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
> >>>>    }
> >>>> @@ -125,59 +103,36 @@ static int __xe_pin_fb_vma_dpt(const struct
> >>>> intel_framebuffer *fb,
> >>>>    {
> >>>>        struct xe_device *xe =3D to_xe_device(fb->base.dev);
> >>>>        struct xe_tile *tile0 =3D xe_device_get_root_tile(xe);
> >>>> -    struct xe_ggtt *ggtt =3D tile0->mem.ggtt;
> >>>>        struct drm_gem_object *obj =3D intel_fb_bo(&fb->base);
> >>>>        struct xe_bo *bo =3D gem_to_xe_bo(obj), *dpt;
> >>>>        u32 dpt_size, size =3D bo->ttm.base.size;
> >>>> +    const struct intel_remapped_plane_info *plane;
> >>>> +    u32 i, plane_count, dpt_ofs =3D 0;
> >>>> +    struct intel_remapped_plane_info normal_plane;
> >>>> -    if (view->type =3D=3D I915_GTT_VIEW_NORMAL)
> >>>> +    if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
> >>>>            dpt_size =3D ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE)=
;
> >>>> -    else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED)
> >>>> -        dpt_size =3D
> >>>> ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
> >>>> -                 XE_PAGE_SIZE);
> >>>> -    else
> >>>> -        /* display uses 4K tiles instead of bytes here, convert to
> >>>> entries.. */
> >>>> -        dpt_size =3D ALIGN(intel_rotation_info_size(&view->rotated)=
 * 8,
> >>>> +        normal_plane.offset =3D 0;
> >>>> +        normal_plane.width =3D size / XE_PAGE_SIZE;
> >>>> +        normal_plane.height =3D 1;
> >>>> +        normal_plane.src_stride =3D size / XE_PAGE_SIZE;
> >>>> +        normal_plane.dst_stride =3D size / XE_PAGE_SIZE;
> >>>> +        plane =3D &normal_plane;
> >>>> +        plane_count =3D 1;
> >>>> +    } else {
> >>>> +        dpt_size =3D ALIGN(intel_remapped_info_size(&view->remapped=
) * 8,
> >>>>                     XE_PAGE_SIZE);
> >>>> +        plane =3D view->remapped.plane;
> >>>> +        plane_count =3D ARRAY_SIZE(view->remapped.plane);
> >>>> +    }
> >>>>        dpt =3D xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignme=
nt);
> >>>>        if (IS_ERR(dpt))
> >>>>            return PTR_ERR(dpt);
> >>>> -    if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
> >>>> -        u32 x;
> >>>> -
> >>>> -        for (x =3D 0; x < size / XE_PAGE_SIZE; x++) {
> >>>> -            u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE=
_SIZE,
> >>>> -                                  xe->pat.idx[XE_CACHE_NONE]);
> >>>> -
> >>>> -            iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> >>>> -        }
> >>>> -    } else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED) {
> >>>> -        const struct intel_remapped_info *remap_info =3D &view->rem=
apped;
> >>>> -        u32 i, dpt_ofs =3D 0;
> >>>> -
> >>>> -        for (i =3D 0; i < ARRAY_SIZE(remap_info->plane); i++)
> >>>> -            write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
> >>>> -                       remap_info->plane[i].offset,
> >>>> -                       remap_info->plane[i].width,
> >>>> -                       remap_info->plane[i].height,
> >>>> -                       remap_info->plane[i].src_stride,
> >>>> -                       remap_info->plane[i].dst_stride);
> >>>> -
> >>>> -    } else {
> >>>> -        const struct intel_rotation_info *rot_info =3D &view->rotat=
ed;
> >>>> -        u32 i, dpt_ofs =3D 0;
> >>>> -
> >>>> -        for (i =3D 0; i < ARRAY_SIZE(rot_info->plane); i++)
> >>>> -            write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
> >>>> -                      rot_info->plane[i].offset,
> >>>> -                      rot_info->plane[i].width,
> >>>> -                      rot_info->plane[i].height,
> >>>> -                      rot_info->plane[i].src_stride,
> >>>> -                      rot_info->plane[i].dst_stride);
> >>>> -    }
> >>>> +    for (i =3D 0; i < plane_count; i++)
> >>>> +        write_dpt(bo, &dpt->vmap, &dpt_ofs, &plane[i], view->type);
> >>>>        vma->dpt =3D dpt;
> >>>>        vma->node =3D dpt->ggtt_node[tile0->id];
