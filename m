Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60482C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 13:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231CD10E0D7;
	Tue, 20 May 2025 13:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ehYUStww";
	dkim-atps=neutral
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7A210E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 13:23:23 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-30dfd9e7fa8so6932625a91.2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747747403; x=1748352203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AV1V9qiuBJ3u2cvJ0MkcLH2kvoSAUwtsiloVaVjZsHo=;
 b=ehYUStwwVBsyLPPAL2v3M3K1RXxllIh8Q6ps10+VmPVIDHuW0pwVgLpRyZmSC8u5Hv
 hmwXiyzaWK6OATJ3ShHWH8cKSlZ6qrnhSFo/idZP55T5Iqdli9R23ZExl4Ek2uLE/R8Y
 lZemc3qCdJck5bLY8lqlUq5BftCzz5XJWYoYAxOzG6ZfJYTkKKOsBzlkPCSg+AZqBE20
 o7dWcRz2jiREiplgd2YEePdRT+GLeyypz1UkYjBHErwZ6GNxoUBzdPXcM0wU3bAezln2
 kALPEkokoAVOAdqQyAuNlUWui40eExbPPUBmPc5VmwHdoTpodTynlNzLvnQdLwFT62Gg
 Txyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747747403; x=1748352203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AV1V9qiuBJ3u2cvJ0MkcLH2kvoSAUwtsiloVaVjZsHo=;
 b=W780bs2LqKW5pkpEAAE50MM16wTVS6xDGG5wJlrKvCOCc6hmEA9ljiLEv1jmG8b+E5
 0b7FbHKb4MZGrUDIWmTiEiYCIMV/UQdCC57vTncTBo0PdlPysxaetubENK4oqs/Byjfg
 jlLb4/MzPF9MSuWk4/38rz5oVxi/3PlrK/9yJeAx7XVFE+WoCp1WGDKdZbg3j3hjWTPg
 HriXdgAUELa68GP9CHyIVqWOxMWEulTfc2kuBqm5pPru+CKoMsGwFW/Ht0X49R89OYn6
 0tmJikucz5WZwk5C7XyzqLWVo1URqFGZOOfNAqB3gTjgeB04PydZ7zhHmbWug5MZ8JPJ
 SF8Q==
X-Gm-Message-State: AOJu0YwdliFpN5eotkDRltNB+3y2fq+D3PqVK3h23YaWB5G5FaKIt5U3
 2l5HLqCp+fRwNZZc9CiQ/yLjISTm1smhvv7/BUTH74xo6XnOSL/th0aP2S3Kw53Weo1vmWNutoN
 P2EBNdXaG1AOY0JukpztZ8VzivDI0pqasvlQNJ7uFgQ==
X-Gm-Gg: ASbGncu6MDpfix/3bL711IAEuOjc1lOnZWV749h8zM6qFYbECpHDeeXXQIq/4JFb0Bj
 PFo2LI1lq24prLL7c9zeJM7BvcHAapisCGwZIakHN4VBVwTWBkFVQIgDs9ELhXZT2tYZzBwh0DF
 bvnjzf9roSh5MAuewP1h1D8MzaP8/w1cgliaQ=
X-Google-Smtp-Source: AGHT+IHn8C18JK+o+Au0EgUxSx/hbMEynMxTA6Tp7Hrl3MBbjVCxZAlauS1CgirTs7m+VhiDwRXkHghR3dlnBDv+iXQ=
X-Received: by 2002:a17:90b:1dc2:b0:2ee:b2e6:4276 with SMTP id
 98e67ed59e1d1-30e8322593dmr24920618a91.27.1747747403295; Tue, 20 May 2025
 06:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250505121924.921544-1-dev@lankhorst.se>
 <20250505121924.921544-9-dev@lankhorst.se>
In-Reply-To: <20250505121924.921544-9-dev@lankhorst.se>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 20 May 2025 16:23:13 +0300
X-Gm-Features: AX0GCFuKZn7iAeUl7Q6X7dsHluiQM5Fw__YI3667UnezEWoLpY6eMFwrr6mvO_k
Message-ID: <CAJ=qYWRta_jp0FU0c_et=B2urQBAxc5Ov6Ai-UUO1vrbH1rrwA@mail.gmail.com>
Subject: Re: [PATCH 08/10] drm/xe: Remove pte_encode_bo callback
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
> The users inside display have been converted to use thepte_encode_flags
> callback, we can now remove the pte_encode_bo cb.
>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c       | 14 --------------
>  drivers/gpu/drm/xe/xe_ggtt_types.h |  3 ---
>  2 files changed, 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 59097c7a494b2..20d49a96c2407 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -75,11 +75,6 @@ static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 p=
at_index)
>         return pte;
>  }
>
> -static u64 xelp_ggtt_encode_bo(struct xe_bo *bo, u64 bo_offset, u16 pat_=
index)
> -{
> -       return xelp_ggtt_pte_flags(bo, pat_index) | xe_bo_addr(bo, bo_off=
set, XE_PAGE_SIZE);
> -}
> -
>  static u64 xelpg_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
>  {
>         struct xe_device *xe =3D xe_bo_device(bo);
> @@ -98,12 +93,6 @@ static u64 xelpg_ggtt_pte_flags(struct xe_bo *bo, u16 =
pat_index)
>         return pte;
>  }
>
> -static u64 xelpg_ggtt_encode_bo(struct xe_bo *bo, u64 bo_offset,
> -                               u16 pat_index)
> -{
> -       return xelpg_ggtt_pte_flags(bo, pat_index) | xe_bo_addr(bo, bo_of=
fset, XE_PAGE_SIZE);
> -}
> -
>  static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  {
>         u16 gmch_ctl, ggms;
> @@ -218,19 +207,16 @@ static void primelockdep(struct xe_ggtt *ggtt)
>  }
>
>  static const struct xe_ggtt_pt_ops xelp_pt_ops =3D {
> -       .pte_encode_bo =3D xelp_ggtt_encode_bo,
>         .pte_encode_flags =3D xelp_ggtt_pte_flags,
>         .ggtt_set_pte =3D xe_ggtt_set_pte,
>  };
>
>  static const struct xe_ggtt_pt_ops xelpg_pt_ops =3D {
> -       .pte_encode_bo =3D xelpg_ggtt_encode_bo,
>         .pte_encode_flags =3D xelpg_ggtt_pte_flags,
>         .ggtt_set_pte =3D xe_ggtt_set_pte,
>  };
>
>  static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops =3D {
> -       .pte_encode_bo =3D xelpg_ggtt_encode_bo,
>         .pte_encode_flags =3D xelpg_ggtt_pte_flags,
>         .ggtt_set_pte =3D xe_ggtt_set_pte_and_flush,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_g=
gtt_types.h
> index 06b1a602dd8d1..c5e999d58ff2a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -74,9 +74,6 @@ struct xe_ggtt_node {
>   * Which can vary from platform to platform.
>   */
>  struct xe_ggtt_pt_ops {
> -       /** @pte_encode_bo: Encode PTE flags for a given BO */
> -       u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_ind=
ex);
> -
>         /** @pte_encode_flags: Encode PTE flags for a given BO */
>         u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
>         /** @ggtt_set_pte: Directly write into GGTT's PTE */
> --
> 2.45.2
>
