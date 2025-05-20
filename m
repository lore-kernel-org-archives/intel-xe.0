Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2592C3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 13:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F51F10E4CC;
	Tue, 20 May 2025 13:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WpACpKF1";
	dkim-atps=neutral
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94B210E4CC
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 13:06:12 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-30ea7f78337so2859828a91.2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747746372; x=1748351172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K2EJwFnq+5pKUOhtZSNlU6I5TjsFLzCKuun5FpGnzeA=;
 b=WpACpKF16jaFh8FfiXvaLjk9wvpAoiBDr3beDgzaVr5FchtkR+AyXAaVXsOKWqAW39
 F6g6ehOHPapoZVB2I5BfMdYR8GHVrabkGhBIqZOZUJtmictXqXtgn4R3iFGl5lOLUnFI
 8daa+pIsQVG68j9B7Ae54qnf3wKJOb1r4aZ4h84Of1QeBC7xPFgo+B/fuNhaKOzfgIg4
 CgId8JzSn4RcUZ0OT70ynhvbGo2ZtjQOv0XaE5GpqbDeadjxlgPx32/c2Xkl6X3+XZQX
 QVTkpOkNnrr/SBqkUB7wA3ec4LgzubzAnocgUjftMf24Uo130pMLLKWO7zUOLCCLedbQ
 arkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747746372; x=1748351172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2EJwFnq+5pKUOhtZSNlU6I5TjsFLzCKuun5FpGnzeA=;
 b=tUBesfovQzRxU7HA7G7k15OdYYvhPGEaBvF+CSaFvXKj/bRt/ewbaH2aU2qL1yDfVN
 md83oJMto3eForpf8CHC8eigfvIvwB/5wuckl14yn6Kzqf+HRhxkkHTl+/FxcG+nChsy
 EHtQE75+L/mduJ0dO4cA7Y+afEiuzDFCEvvhAVmdsjD/e7nQA43oAwyZ8vPrSs041r2W
 GnBwVBiaeRtvK3cOw7+COFq6E+aNfVQYNPfcTiSUjKtgJI5qimifBRE4mYxGbp+xA4tn
 dUSJdHuuwJRrQ80QI1o7or3wk8RIOMuztaltu83KgF3OYJYeB25t6A9eFvXg934lPRAB
 9+cQ==
X-Gm-Message-State: AOJu0Yw18NdHDsCvGdcrrhA9q8QaCLgsATeF+FwhQbKpItBN75Xtxz9I
 JvWHlYgQJm6kY//S9pocX6p4Fv7I3HBF8Ddr+X0EkVyN+K01JeMRO197KxkVzfYiCuK2a0xMMPi
 1p6fUhPxTUMXaPsHZdY4jsIZkhOQMukgOW7RSh9p0rw==
X-Gm-Gg: ASbGncvAWuSpwgKqHqbr7kUS31yXYyEisEdaCo2aPi7E7JiUjvuxEZlJoVUcY0n59/+
 UpIQ31JriAS8GnoLXRncIH+b4oKz07xWZiX7w+EvUTNtmV//cHvU0Me4Ycn5Np3Cxo4Oc2rinaE
 eP2EdsqzLnzyOBUG7wNVveeh6PMz/eyjW4DSA=
X-Google-Smtp-Source: AGHT+IEYDKUGioLKINKoY1StxWV0Y1mxhllwJoD6TM/brngMCfqyFiwSuxzWmJQKybRK+GvGPma09nwtqCEiW/4lL4U=
X-Received: by 2002:a17:90a:e70f:b0:2ff:5e4e:864 with SMTP id
 98e67ed59e1d1-30e832162d4mr26817384a91.25.1747746372046; Tue, 20 May 2025
 06:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250505121924.921544-1-dev@lankhorst.se>
 <20250505121924.921544-7-dev@lankhorst.se>
In-Reply-To: <20250505121924.921544-7-dev@lankhorst.se>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 20 May 2025 16:06:00 +0300
X-Gm-Features: AX0GCFtF8X7Ha5QsvYWKvHiU-tstRw29MQpnk276S3dTAtAD8MQBLouTv_gddok
Message-ID: <CAJ=qYWRQvDyKKmkddPRk8657bmpJ8rf0DMNdz0WJyy5feFLQzQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] drm/xe/display: Dont poke into GGTT internals to
 fill a DPT
To: Maarten Lankhorst <dev@lankhorst.se>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Mon, May 5, 2025 at 3:20=E2=80=AFPM Maarten Lankhorst <dev@lankhorst.se>=
 wrote:
>
> For DPT, it is sufficient to get the GGTT encode flags to fill the DPT.
> Create a function to return the encode flags, and then encode using the
> BO address.
>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 20 +++++++++-----------
>  drivers/gpu/drm/xe/xe_ggtt.c           | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h           |  2 ++
>  3 files changed, 26 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index d509def82b134..5392e46a3a134 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -23,6 +23,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *m=
ap, u32 *dpt_ofs, u32 bo_
>         struct xe_device *xe =3D xe_bo_device(bo);
>         struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
>         u32 column, row;
> +       u64 pte =3D xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CAC=
HE_NONE]);
>
>         /* TODO: Maybe rewrite so we can traverse the bo addresses sequen=
tially,
>          * by writing dpt/ggtt in a different order?
> @@ -32,10 +33,9 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *=
map, u32 *dpt_ofs, u32 bo_
>                 u32 src_idx =3D src_stride * (height - 1) + column + bo_o=
fs;
>
>                 for (row =3D 0; row < height; row++) {
> -                       u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, src_i=
dx * XE_PAGE_SIZE,
> -                                                             xe->pat.idx=
[XE_CACHE_NONE]);
> +                       u64 addr =3D xe_bo_addr(bo, src_idx * XE_PAGE_SIZ=
E, XE_PAGE_SIZE);
>
> -                       iosys_map_wr(map, *dpt_ofs, u64, pte);
> +                       iosys_map_wr(map, *dpt_ofs, u64, pte | addr);
>                         *dpt_ofs +=3D 8;
>                         src_idx -=3D src_stride;
>                 }
> @@ -55,17 +55,15 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map=
 *map, u32 *dpt_ofs,
>  {
>         struct xe_device *xe =3D xe_bo_device(bo);
>         struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
> -       u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_ind=
ex)
> -               =3D ggtt->pt_ops->pte_encode_bo;
>         u32 column, row;
> +       u64 pte =3D xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CAC=
HE_NONE]);
>
>         for (row =3D 0; row < height; row++) {
>                 u32 src_idx =3D src_stride * row + bo_ofs;
>
>                 for (column =3D 0; column < width; column++) {
> -                       iosys_map_wr(map, *dpt_ofs, u64,
> -                                    pte_encode_bo(bo, src_idx * XE_PAGE_=
SIZE,
> -                                    xe->pat.idx[XE_CACHE_NONE]));
> +                       u64 addr =3D xe_bo_addr(bo, src_idx * XE_PAGE_SIZ=
E, XE_PAGE_SIZE);
> +                       iosys_map_wr(map, *dpt_ofs, u64, pte | addr);
>
>                         *dpt_ofs +=3D 8;
>                         src_idx++;
> @@ -129,13 +127,13 @@ static int __xe_pin_fb_vma_dpt(const struct intel_f=
ramebuffer *fb,
>                 return PTR_ERR(dpt);
>
>         if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
> +               u64 pte =3D xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.id=
x[XE_CACHE_NONE]);
>                 u32 x;
>
>                 for (x =3D 0; x < size / XE_PAGE_SIZE; x++) {
> -                       u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, x * X=
E_PAGE_SIZE,
> -                                                             xe->pat.idx=
[XE_CACHE_NONE]);
> +                       u64 addr =3D xe_bo_addr(bo, x * XE_PAGE_SIZE, XE_=
PAGE_SIZE);
>
> -                       iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> +                       iosys_map_wr(&dpt->vmap, x * 8, u64, pte | addr);
>                 }
>         } else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED) {
>                 const struct intel_remapped_info *remap_info =3D &view->r=
emapped;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 7526739034ea0..59097c7a494b2 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -911,3 +911,18 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 al=
ignment, struct drm_printer
>
>         return total;
>  }
> +
> +/**
> + * xe_ggtt_encode_pte_flags - Get PTE encoding flags for BO
> + * @ggtt: &xe_ggtt
> + * @bo: &xe_bo
> + * @pat_index: The pat_index for the PTE.
> + *
> + * This function returns the pte_flags for a given BO, without  address.
> + * It's used for DPT to fill a GGTT mapped BO with a linear lookup table=
.
> + */
> +u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt,
> +                            struct xe_bo *bo, u16 pat_index)
> +{
> +       return ggtt->pt_ops->pte_encode_flags(bo, pat_index);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index c48da99908848..437ba65f33860 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -49,4 +49,6 @@ static inline void xe_ggtt_might_lock(struct xe_ggtt *g=
gtt)
>  void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
>  #endif
>
> +u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16=
 pat_index);
> +
>  #endif
> --
> 2.45.2
>
