Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694A4C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 14:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3002610E040;
	Fri,  7 Feb 2025 14:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="krR9t+1R";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CE010E040
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 14:33:38 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2166f1e589cso54920865ad.3
 for <intel-xe@lists.freedesktop.org>; Fri, 07 Feb 2025 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738938818; x=1739543618; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CSPziHJfGkPEsTcNpvGTMb0pNfuN1+oiRObIkWESbZI=;
 b=krR9t+1RfJNYn27ZP0Jxz0VFGSCMGCSEwNappST5uBN7kQFq0XkXfFmMHR29oqyikk
 BhkdH1h3stW5DvrELVFJjy9cgKPaNJoG2uJSJQhX0WXCcQ9xgx6/qA99OJazgqVV3XhW
 vxQYvQki1A4jxLjbpMqqB6KMc+wI5zH5Vk8MWGstq0HrlrnO9dJF4R0SzK2NVtoNjB6x
 8HlrZqVctogNahYQHOfw9ClP2NgCW6P6shojbBI/NnykFllnq2/YjOS9K+7kEjUu0aBT
 GE017xtoZcznrwLV0oO9CC82XTTdp+nV5GIk9R2FwrJOMppsz1Q8/+wdVp06LdWSxEa8
 e7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738938818; x=1739543618;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CSPziHJfGkPEsTcNpvGTMb0pNfuN1+oiRObIkWESbZI=;
 b=XutUHRiHN7tEHDrloxjVmZZ60kVkrlR1yw1voj2DbOiBWD31etoPeoEGbIXlaN4gh0
 sFDtiCyaWpurnHW51aEl0A57+1nDkrWW6q0ZbssmvOqOjodbj/yjoOxGgXXXcKgIJEeB
 48Gxg5sOXU83mNi7daHLxH8F/jBIYWHEpX2FsmfX+GG2fdItZsKKSfL1m5/DLHfUXk5n
 pgWpLJuwPOn4IdFoPlOiwxFRtAlCjALnLjf3dG4uxeqn76Uy1iCrroereo+XHfVXGK8o
 YPQQd7uuo1vITFZY5kq7UDvm3DF4i7X9ELpnef36NLF/uiPAPLLxvVeb2HathziluqiO
 /t1w==
X-Gm-Message-State: AOJu0YxlSeGHZrqjBJ1LFrpH87awUw+/UhRpAbp9NvGxn/v7u2ZthcOG
 BL8egSUl2Yv4CIRTPqEVhts2EHFPz3ec1CabeGAeHu+YrXK3B8SfTQ+Gt7EZ1Q0IXcKSzVjuccs
 W4q52jdAKf++tWt2LDCScGFulKMIsVH3cA3cchg==
X-Gm-Gg: ASbGncsWgMdUZ40FJclcYeJsOelCYQKw2IoVv2zvI9YRTZasELeHeHTTHNrfAKtzPtV
 HAIqzhJh8GorRcBGfk6LOx6B+15XI62Od2UBB7K8RYFnTpWxCIRcTzhz4DV1Y2ZQK3qyNb9hUS7
 E=
X-Google-Smtp-Source: AGHT+IEAxDYcyKi/u57SfZc8x54oQJqv1iREj8xdxRWSCO2yH3xGqBKBHY6bM4RE36v9u3cRxbBpIMHv34W0ZK4pMLw=
X-Received: by 2002:a17:903:234f:b0:21f:14c5:4d37 with SMTP id
 d9443c01a7336-21f4e73b0bcmr56630955ad.38.1738938817678; Fri, 07 Feb 2025
 06:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <20250114180403.896587-2-juhapekka.heikkila@gmail.com>
 <64decd28-e020-4a53-9766-7d57a5137c86@ursulin.net>
 <221a2230-1fff-4f9c-9be4-7a2ef4db2776@ursulin.net>
 <CAJ=qYWTotU_P6X-HOtkBCNzG4hEcw-=Ch5ymHYyBh0POa8HUQw@mail.gmail.com>
 <ca83eabe-d2cf-4ee9-a51d-82809d07a447@ursulin.net>
 <CAJ=qYWSUabag3Xcw-zyAPjtFbxqyyfHSP=72tEtV+MZobiEETw@mail.gmail.com>
 <bfe83139-0d16-4dcb-b3cc-d43c3d365e89@ursulin.net>
In-Reply-To: <bfe83139-0d16-4dcb-b3cc-d43c3d365e89@ursulin.net>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Fri, 7 Feb 2025 16:33:26 +0200
X-Gm-Features: AWEUYZmUGOf3szkeQ3HvMAlr_MZqwy-cMaxOsMeRNcnLmFYIGU0luL8dUuxGLw0
Message-ID: <CAJ=qYWQ0FEtH8vNL2MYBbBgRQJwef=HJYV7WJ1HqHNSy1KBzZg@mail.gmail.com>
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

On Tue, Feb 4, 2025 at 8:05=E2=80=AFPM Tvrtko Ursulin <tursulin@ursulin.net=
> wrote:
>
>
> On 04/02/2025 13:11, Juha-Pekka Heikkil=C3=A4 wrote:
> > On Tue, Feb 4, 2025 at 2:31=E2=80=AFPM Tvrtko Ursulin <tursulin@ursulin=
.net> wrote:
> >>
> >>
> >> On 04/02/2025 12:10, Juha-Pekka Heikkil=C3=A4 wrote:
> >>> On Tue, Feb 4, 2025 at 1:38=E2=80=AFPM Tvrtko Ursulin <tursulin@ursul=
in.net> wrote:
> >>>>
> >>>>
> >>>> On 04/02/2025 11:25, Tvrtko Ursulin wrote:
> >>>>>
> >>>>> On 14/01/2025 18:04, Juha-Pekka Heikkila wrote:
> >>>>>> Unify writing of remapped and straight DPTs. Take out writing of
> >>>>>> rotated DPT since Xe doesn't support any platform that does
> >>>>>> 90 degree rotated framebuffers.
> >>>>>
> >>>>> Consider giving my series which fixes AuxCSS a look instead? Given =
there
> >>>>> is external interest to have all that work on ADL-P. I could respin=
 with
> >>>>> rotated cleaned up in a similar fashion I did for remapped. Mainten=
ance
> >>>>> cost is minimal since it is all very contained.
> >>>>
> >>>> Oh ADL-P does not support hardware rotation. I missed the fact it is
> >>>> display version 13..
> >>>>
> >>>> But the point regarding changes to remapping code are still valid I
> >>>> think, since to suport aux plane the refactoring from this patch loo=
ks
> >>>> in the wrong direction.
> >>>>
> >>>
> >>> Yea, I kinda agree here with Tvrtko. I did earlier mention this to
> >>> JSaa. That aux thing will need to be checked.
> >>
> >> Ah cool, fingers crossed.
> >>
> >>> Though, how far are we with your set Tvrtko? It did seem lot kms_ccs
> >>> tests failed.
> >>> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v1/shards-all.h=
tml?testfilter=3Dkms_ccs.*crc.*gen12&hosts=3Dadlp
> >>>
> >>> Did you check you had compression when you had clean image on your
> >>> machine? (aux surface was not zeroes) Those failures on my link ci ar=
e
> >>> with failing crc which mean the picture on screen was not correct.
> >>
> >> I was looking into this just this morning and posted some
> >> half-conclusions here:
> >>
> >> https://lore.kernel.org/intel-xe/eb3a3729-e8ef-4868-b8ff-b6efd66ef4fa@=
igalia.com/T/#u
> >>
> >> When you say test with a clear image that I did not. I smoke tested it
> >> in desktop usage and looked at kms_flip_tiling which visually looks
> >> correct but as the above msg-id talks about, something is potentially
> >> fishy with crc collections and/or vblank handling. Since display isn't
> >> my area of expertise that is as far as I could get.
> >
> > Those test explicitly testing for flipping and such may show there
> > something interesting but imo unrelated to this situation (for now).
> >
> > If you have adlp machine where you see the screen you could try those
> > kms_ccs crc tests, you can run the tests in interactive mode with
> > '--i' parameter where the test always stop at commit so you'll see
> > what's there on screen. On kms_ccs I would not expect any vblank/other
> > issues to interfere crc because kms_ccs uses
> > igt_pipe_crc_collect_crc() to get the crc, what this mean is once the
> > test image is on screen crc counting is started, collected one crc and
> > crc counting is stopped .. to get the first crc this way few vblanks
> > have passed already since getting image on screen. Then on kms_ccs
> > test there is -c flag which should check there is something written on
> > aux surface. Getting these to work reliably I think is the first
> > thing...and on that subject I'd at first concentrate just one gen12rc
> > ccs, not ccs-cc and not mc ccs. I'd get these results by myself but
> > I'm bit of recovering at home and don't have needed hw in my hands.
>
> kms_crc with and without -c are both a complete pass.

I tried this too, the result is..interesting. I tried adlp and mtlp.
Reading crc on adlp seems to do something unexpected for display on
Xe. If you run kms_ccs on adlp with interactive parameter and step
forward those images you'll likely see lot of broken images but crc
still matches as if image was correct.

On adlp it look like image is given to display hw too early, some
timing somewhere go wrong, I often saw images where primary surface
was written but aux surface was not yet fully written (you'll get
compression markers on screen from main surface because unwritten aux
says nothing is compressed). If I fix kms_ccs to read crcs
continuously it will never pass crc checks, same as is seen in many
other tests. It did look like enabling crc creation caused update on
frontbuffer which fixed the image since at that moment compressors
were already done. It did seem mc ccs was much more easy to get this
effect to show, rc ccs was 50-50 on Lenovo laptop I tried while mc ccs
was far more frequent.

I did also try run kms_plane pixel-format tests and there I see lot of
broken images. On pixel-format tests there's supposing to be 64x64 fb
with either horizontal lines or full color (for planar formats) but I
see lot of broken images which make me think this issue is not about
ccs but maybe some timing or caching issue. Essential difference with
kms_plane pixel format tests and kms_ccs is kms_ccs use render engine
(and media engine for mc) while pixel format tests use copy engine and
they failed quite equally.

On mtlp there are similar issues but mc ccs cannot run at all, any try
to use media engine (which is needed to compress mc ccs) just crashed
the engine. Probably nobody ever tried any of these with Xe.

>
> > On that lore.kernel.org thread where you mention "Bad CRC also varies
> > run to run, while visually things look fine to me on screen. Also a
> > delay before collecting the crc seems to improve things." could be
> > quite much anything, my first quess with those always is some
> > alignment missed somewhere.
>
> Going back to kms_flip_tiling it is hard to figure out what's up. Good
> news is that I have spotted some visual glitching but it mostly only
> happens withing the first few frames after commit of the reference frame.
>
> For instance when I add a loop such as:
>
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.=
c
> index e937c21716ad..5538fe88c5a0 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -131,7 +131,10 @@ test_flip_tiling(data_t *data, enum pipe pipe,
> igt_output_t *output, uint64_t mo
>                        "commit failed with " IGT_MODIFIER_FMT "\n",
>                        IGT_MODIFIER_ARGS(modifier[1]));
>          pipe_crc_new(data, pipe);
> -       igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc,
> &reference_crc);
> +       ret =3D 20;
> +       while (ret--)
> +               igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc,
> +                                        &reference_crc);

This matches to what I saw, on adlp/mtlp framebuffers are given to
display too early or something need to be triggered before display get
correct image. Once the image is in frontbuffer it is on screen and if
caches/engines/.. were not ready then that show on screen as broken
image.

>
>          /* Commit the first fb. */
>          igt_plane_set_fb(primary, &data->fb[0]);
>
> All tests pass.
>
> Could this be interacting with some other display feature like fbc or psr=
?

I wouldn't expect this to be fbc/psr issue. While those can be source
for screen glithes, when I see partially ccs compressed images on
screen I know all updating was correct for fbc/psr, just that the
original was broken.

>
> There is also something interesting with CRC if I put a sleep into that
> loop. Apparently something gets powered off and CRC garbage such as
> 0xffffffff starts appearing. But only if there is a sleep for like
> 250ms. A busy loop can go for 3000 frames and not hit that.

I have hunch this relate to intel_crtc_crc_setup_workarounds but can't
say for sure. I've been trying to find crc setup related bugs
recently.

Anyway, with those random bugs it's difficult to say how far adlp is
from being supported on Xe and not sure how media engine really work
there since it doesn't work at all on mtlp with Xe.

/Juha-Pekka

>
> Regards,
>
> Tvrtko
>
> >>>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++--------=
--------
> >>>>>>     1 file changed, 48 insertions(+), 93 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>>>> index c28885316986..70322f28eee5 100644
> >>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>>>> @@ -14,66 +14,44 @@
> >>>>>>     #include "xe_ggtt.h"
> >>>>>>     #include "xe_pm.h"
> >>>>>> -static void
> >>>>>> -write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32
> >>>>>> *dpt_ofs, u32 bo_ofs,
> >>>>>> -          u32 width, u32 height, u32 src_stride, u32 dst_stride)
> >>>>>> +static void encode_and_write_pte(struct xe_bo *bo, struct iosys_m=
ap
> >>>>>> *map,
> >>>>>> +                 u32 *ofs, u32 src_idx, struct xe_device *xe)
> >>>>>>     {
> >>>>>> -    struct xe_device *xe =3D xe_bo_device(bo);
> >>>>>>         struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.=
ggtt;
> >>>>>> -    u32 column, row;
> >>>>>> -
> >>>>>> -    /* TODO: Maybe rewrite so we can traverse the bo addresses
> >>>>>> sequentially,
> >>>>>> -     * by writing dpt/ggtt in a different order?
> >>>>>> -     */
> >>>>>> -
> >>>>>> -    for (column =3D 0; column < width; column++) {
> >>>>>> -        u32 src_idx =3D src_stride * (height - 1) + column + bo_o=
fs;
> >>>>>> -
> >>>>>> -        for (row =3D 0; row < height; row++) {
> >>>>>> -            u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, src_idx *
> >>>>>> XE_PAGE_SIZE,
> >>>>>> -                                  xe->pat.idx[XE_CACHE_NONE]);
> >>>>>> -
> >>>>>> -            iosys_map_wr(map, *dpt_ofs, u64, pte);
> >>>>>> -            *dpt_ofs +=3D 8;
> >>>>>> -            src_idx -=3D src_stride;
> >>>>>> -        }
> >>>>>> -
> >>>>>> -        /* The DE ignores the PTEs for the padding tiles */
> >>>>>> -        *dpt_ofs +=3D (dst_stride - height) * 8;
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    /* Align to next page */
> >>>>>> -    *dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
> >>>>>> +    u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE=
_SIZE,
> >>>>>> +                          xe->pat.idx[XE_CACHE_NONE]);
> >>>>>> +    iosys_map_wr(map, *ofs, u64, pte);
> >>>>>> +    *ofs +=3D 8;
> >>>>>>     }
> >>>>>> -static void
> >>>>>> -write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32
> >>>>>> *dpt_ofs,
> >>>>>> -           u32 bo_ofs, u32 width, u32 height, u32 src_stride,
> >>>>>> -           u32 dst_stride)
> >>>>>> +static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u3=
2
> >>>>>> *dpt_ofs,
> >>>>>> +              const struct intel_remapped_plane_info *plane,
> >>>>>> +              enum i915_gtt_view_type type)
> >>>>>>     {
> >>>>>>         struct xe_device *xe =3D xe_bo_device(bo);
> >>>>>> -    struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggt=
t;
> >>>>>> -    u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat=
_index)
> >>>>>> -        =3D ggtt->pt_ops->pte_encode_bo;
> >>>>>> -    u32 column, row;
> >>>>>> -
> >>>>>> -    for (row =3D 0; row < height; row++) {
> >>>>>> -        u32 src_idx =3D src_stride * row + bo_ofs;
> >>>>>> -
> >>>>>> -        for (column =3D 0; column < width; column++) {
> >>>>>> -            iosys_map_wr(map, *dpt_ofs, u64,
> >>>>>> -                     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> >>>>>> -                     xe->pat.idx[XE_CACHE_NONE]));
> >>>>>> -
> >>>>>> -            *dpt_ofs +=3D 8;
> >>>>>> -            src_idx++;
> >>>>>> +    const u32 dpt_even =3D (plane->dst_stride - plane->width) * 8=
;
> >>>>>> +    const u32 dest_width =3D plane->width;
> >>>>>> +    const u32 dest_height =3D plane->height;
> >>>>>> +    u32 src_idx;
> >>>>>> +
> >>>>>> +    for (u32 row =3D 0; row < dest_height; ++row) {
> >>>>>> +        for (u32 column =3D 0; column < dest_width; ++column) {
> >>>>>> +            switch (type) {
> >>>>>> +            case I915_GTT_VIEW_NORMAL:
> >>>>>> +                src_idx =3D plane->offset + column;
> >>>>>> +                break;
> >>>>>> +            case I915_GTT_VIEW_REMAPPED:
> >>>>>> +                src_idx =3D plane->offset +
> >>>>>> +                    row * plane->src_stride + column;
> >>>>>> +                break;
> >>>>>> +            default:
> >>>>>> +                WARN(1, "Unsupported GTT view type: %d", type);
> >>>>>> +                return;
> >>>>>> +            }
> >>>>>> +            encode_and_write_pte(bo, map, dpt_ofs, src_idx, xe);
> >>>>>>             }
> >>>>>> -
> >>>>>> -        /* The DE ignores the PTEs for the padding tiles */
> >>>>>> -        *dpt_ofs +=3D (dst_stride - width) * 8;
> >>>>>> +        *dpt_ofs +=3D dpt_even;
> >>>>>>         }
> >>>>>> -
> >>>>>> -    /* Align to next page */
> >>>>>>         *dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
> >>>>>>     }
> >>>>>> @@ -125,59 +103,36 @@ static int __xe_pin_fb_vma_dpt(const struct
> >>>>>> intel_framebuffer *fb,
> >>>>>>     {
> >>>>>>         struct xe_device *xe =3D to_xe_device(fb->base.dev);
> >>>>>>         struct xe_tile *tile0 =3D xe_device_get_root_tile(xe);
> >>>>>> -    struct xe_ggtt *ggtt =3D tile0->mem.ggtt;
> >>>>>>         struct drm_gem_object *obj =3D intel_fb_bo(&fb->base);
> >>>>>>         struct xe_bo *bo =3D gem_to_xe_bo(obj), *dpt;
> >>>>>>         u32 dpt_size, size =3D bo->ttm.base.size;
> >>>>>> +    const struct intel_remapped_plane_info *plane;
> >>>>>> +    u32 i, plane_count, dpt_ofs =3D 0;
> >>>>>> +    struct intel_remapped_plane_info normal_plane;
> >>>>>> -    if (view->type =3D=3D I915_GTT_VIEW_NORMAL)
> >>>>>> +    if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
> >>>>>>             dpt_size =3D ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SI=
ZE);
> >>>>>> -    else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED)
> >>>>>> -        dpt_size =3D
> >>>>>> ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * =
8,
> >>>>>> -                 XE_PAGE_SIZE);
> >>>>>> -    else
> >>>>>> -        /* display uses 4K tiles instead of bytes here, convert t=
o
> >>>>>> entries.. */
> >>>>>> -        dpt_size =3D ALIGN(intel_rotation_info_size(&view->rotate=
d) * 8,
> >>>>>> +        normal_plane.offset =3D 0;
> >>>>>> +        normal_plane.width =3D size / XE_PAGE_SIZE;
> >>>>>> +        normal_plane.height =3D 1;
> >>>>>> +        normal_plane.src_stride =3D size / XE_PAGE_SIZE;
> >>>>>> +        normal_plane.dst_stride =3D size / XE_PAGE_SIZE;
> >>>>>> +        plane =3D &normal_plane;
> >>>>>> +        plane_count =3D 1;
> >>>>>> +    } else {
> >>>>>> +        dpt_size =3D ALIGN(intel_remapped_info_size(&view->remapp=
ed) * 8,
> >>>>>>                      XE_PAGE_SIZE);
> >>>>>> +        plane =3D view->remapped.plane;
> >>>>>> +        plane_count =3D ARRAY_SIZE(view->remapped.plane);
> >>>>>> +    }
> >>>>>>         dpt =3D xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alig=
nment);
> >>>>>>         if (IS_ERR(dpt))
> >>>>>>             return PTR_ERR(dpt);
> >>>>>> -    if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
> >>>>>> -        u32 x;
> >>>>>> -
> >>>>>> -        for (x =3D 0; x < size / XE_PAGE_SIZE; x++) {
> >>>>>> -            u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, x * XE_PA=
GE_SIZE,
> >>>>>> -                                  xe->pat.idx[XE_CACHE_NONE]);
> >>>>>> -
> >>>>>> -            iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> >>>>>> -        }
> >>>>>> -    } else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED) {
> >>>>>> -        const struct intel_remapped_info *remap_info =3D &view->r=
emapped;
> >>>>>> -        u32 i, dpt_ofs =3D 0;
> >>>>>> -
> >>>>>> -        for (i =3D 0; i < ARRAY_SIZE(remap_info->plane); i++)
> >>>>>> -            write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
> >>>>>> -                       remap_info->plane[i].offset,
> >>>>>> -                       remap_info->plane[i].width,
> >>>>>> -                       remap_info->plane[i].height,
> >>>>>> -                       remap_info->plane[i].src_stride,
> >>>>>> -                       remap_info->plane[i].dst_stride);
> >>>>>> -
> >>>>>> -    } else {
> >>>>>> -        const struct intel_rotation_info *rot_info =3D &view->rot=
ated;
> >>>>>> -        u32 i, dpt_ofs =3D 0;
> >>>>>> -
> >>>>>> -        for (i =3D 0; i < ARRAY_SIZE(rot_info->plane); i++)
> >>>>>> -            write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
> >>>>>> -                      rot_info->plane[i].offset,
> >>>>>> -                      rot_info->plane[i].width,
> >>>>>> -                      rot_info->plane[i].height,
> >>>>>> -                      rot_info->plane[i].src_stride,
> >>>>>> -                      rot_info->plane[i].dst_stride);
> >>>>>> -    }
> >>>>>> +    for (i =3D 0; i < plane_count; i++)
> >>>>>> +        write_dpt(bo, &dpt->vmap, &dpt_ofs, &plane[i], view->type=
);
> >>>>>>         vma->dpt =3D dpt;
> >>>>>>         vma->node =3D dpt->ggtt_node[tile0->id];
