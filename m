Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1255BC3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 13:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AB110E0D7;
	Tue, 20 May 2025 13:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AFidgORy";
	dkim-atps=neutral
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802AF10E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 13:20:37 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-30e7e46cb47so4406976a91.1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747747237; x=1748352037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CeBD6Zf0RYxOcjFNkqwOPim8WZ10xrSoMO3uYn/XsLc=;
 b=AFidgORylAhKcjOQf9/qQa6B5KjmBd15psleblgRTX5YretFlCWHHxnxpnuWxGA0pk
 a7CLzDSqgY5qAaEBJRquVx/fiMXbmcbBUKFaJpPde/GFhNgdP1BYvLie5RGEJAE5nlj1
 tsUFqYFTwt8rQ+BYzanmX86BnIMxd/Xvtz8JTJEWzmla0rSfnrUdhtVc7vZ57AXTOT1z
 KaaUrKxIoO/kd1Cyk+gBQIPra6wqpG2DwDIojhrGvnVTssi8PZYFcdnsmLAgpoDsrfLk
 g5bFweOn5Uavugx6VKf+r28hnmkpHxELh17HnEo1SVX/PTvyXDROAE3IyrnFMm/txLUv
 kEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747747237; x=1748352037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CeBD6Zf0RYxOcjFNkqwOPim8WZ10xrSoMO3uYn/XsLc=;
 b=vd1QCjQwm/mvWJYksmPKNFtLPRFF5DKhQmNo4EBndBXfHDctA4PqL/7voFS2GVAAyq
 5DJx4WukHsKh9j7B8BrP4L0MnL53v8GK30Oa4S7e7brkE4JttNlOofBnesBcLw+qc4hK
 dCJhU5Yb9PdGwIIEJvB29OrYH2a4vbGjF0V8ZpQEWc6FzTs5PzjTmm27bjj9NVXqkB78
 KVpQnLf3jnUilXmJvYUh+rjqGTdSZ8vxWBg9lCJCHFoD4tThWfbLlgGzfDKOVL1gmSQO
 Web/P2XmSidDnQw60lS6QpSWX/cLk8iD4dpQ2TDQlno5CUt2VWHudI3xNOJ75+Wqf4wD
 lndg==
X-Gm-Message-State: AOJu0YwdknCK4ktY6+itX4TQXL7nPIxG2F2IdGnKS90aCh8NyfT2UERN
 x4pQFToyYEbiv9WCeO6yt97FIdpoWWgjdhonm2OnfCQhfwZiTnwOEBC2pU/DX5wB868yYtUOtPe
 8p4T7OOECXTTrYPQi6eqWZaGkPX3n39I=
X-Gm-Gg: ASbGncvmctktXbSIIwy90E1AGsvey0V5tAL7dknOUPu3pI0B3OzilVsYsQZotVgEjbl
 m6vc9OXZelgZyP902dheWjrIGXuDutT42fj4n3viMYxItU0R2T80OHgJnDUR1EMgTk81c1u8PhN
 rxjVoO14nAnjrbbhiNtpjFGJEcCBmvWONuslk=
X-Google-Smtp-Source: AGHT+IEmzCrehE2+a32BaiehMihl3vRJ7Yl0R+bvSWfj7q3/6awbhKMHDFDKfa6DvMRK5zO037Gzv7lvAjW44N/G52s=
X-Received: by 2002:a17:90b:1a91:b0:2ee:e113:815d with SMTP id
 98e67ed59e1d1-30e830ebc99mr24679469a91.8.1747747236457; Tue, 20 May 2025
 06:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250505121924.921544-1-dev@lankhorst.se>
 <20250505121924.921544-8-dev@lankhorst.se>
In-Reply-To: <20250505121924.921544-8-dev@lankhorst.se>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 20 May 2025 16:20:25 +0300
X-Gm-Features: AX0GCFseZRSamnfuPoFx911Gd6mojS65w-ZP-HHn5GCI09PFKkkKlnPP6v3FPzI
Message-ID: <CAJ=qYWTqEnHkd6fb3CJJO-M7K_T7B2-oG+0smPqJpobuZqTLug@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/xe/display: Convert GGTT mapping to use
 pte_encode_flags
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
> Another small step in removing pte_encode_bo callback.
>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index 5392e46a3a134..9059b56bc23c8 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -171,15 +171,15 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt=
 *ggtt, u32 *ggtt_ofs, u32 bo
>  {
>         struct xe_device *xe =3D xe_bo_device(bo);
>         u32 column, row;
> +       u64 pte =3D ggtt->pt_ops->pte_encode_flags(bo, xe->pat.idx[XE_CAC=
HE_NONE]);
>
>         for (column =3D 0; column < width; column++) {
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
> -                       ggtt->pt_ops->ggtt_set_pte(ggtt, *ggtt_ofs, pte);
> +                       ggtt->pt_ops->ggtt_set_pte(ggtt, *ggtt_ofs, pte |=
 addr);
>                         *ggtt_ofs +=3D XE_PAGE_SIZE;
>                         src_idx -=3D src_stride;
>                 }
> @@ -217,26 +217,19 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_=
framebuffer *fb,
>         if (bo->ggtt_node[tile0->id] && view->type =3D=3D I915_GTT_VIEW_N=
ORMAL) {
>                 vma->node =3D bo->ggtt_node[tile0->id];
>         } else if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
> -               u32 x, size =3D bo->ttm.base.size;
> -
>                 vma->node =3D xe_ggtt_node_init(ggtt);
>                 if (IS_ERR(vma->node)) {
>                         ret =3D PTR_ERR(vma->node);
>                         goto out_unlock;
>                 }
>
> -               ret =3D xe_ggtt_node_insert_locked(vma->node, size, align=
, 0);
> +               ret =3D xe_ggtt_node_insert_locked(vma->node, bo->size, a=
lign, 0);
>                 if (ret) {
>                         xe_ggtt_node_fini(vma->node);
>                         goto out_unlock;
>                 }
>
> -               for (x =3D 0; x < size; x +=3D XE_PAGE_SIZE) {
> -                       u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, x,
> -                                                             xe->pat.idx=
[XE_CACHE_NONE]);
> -
> -                       ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node->base.=
start + x, pte);
> -               }
> +               xe_ggtt_map_bo(ggtt, vma->node, bo, xe->pat.idx[XE_CACHE_=
NONE]);
>         } else {
>                 u32 i, ggtt_ofs;
>                 const struct intel_rotation_info *rot_info =3D &view->rot=
ated;
> --
> 2.45.2
>
