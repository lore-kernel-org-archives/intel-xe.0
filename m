Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D33EC3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 13:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E56110E5D8;
	Tue, 20 May 2025 13:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h58Bmm+Y";
	dkim-atps=neutral
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C16310E5D8
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 13:29:02 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-30e87549254so5760292a91.2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747747738; x=1748352538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSQ9y8+3KX0Nsf9GMYslYXTiZfJ3fl/acYrPgXZfxeg=;
 b=h58Bmm+Yua74MAtt2keAWSPRVvMwf1VQbc0mUNUOZi7Iku56Hhs6f4jnhTPiSiszFt
 IlhfPReYnJhYmx4uxlxsosGQ6IQ1ppRuT8ONpImJPbfFwN5liOflJ8js0RtI9KjI6MKW
 SKqMfFbIEvw3W2LMWWs8iNFn8R2N5mG/LLJJdR/ThHZSqpmxYKcM6Z7d3Z+SfGDzpL9n
 MtBur0RGOhALOK8gqWA1ZYJ1WxF+XUl6+BSk99BEBpYZmChJMjCUgBBVf8ofbY5PWvfm
 JU8lFWxLhQKjHNd3hUE6mRYiwOfqHpgsBu8+6MD55XMlo25WNL0zDzrLhEIFlvpAmYsP
 5SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747747738; x=1748352538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSQ9y8+3KX0Nsf9GMYslYXTiZfJ3fl/acYrPgXZfxeg=;
 b=ra5Zbm8YdDtzaZZok9kGALJhSDoiPuPREzfUz/2lNiPNMnZnjodng8Xg2Q7oz74Cs6
 4AfJ7QpF//x8cigxgh1tYECkOa8RAMcHVpq8WJwA6wbXVL8e5mqjlqIMu9iFSY/h6hYF
 Vi6d1gyGibkyEzn5tl02O/5A4k5XWuJnbeHgd8N34klCaUBCJBm7I5Cv8qfK5HY0ZrbP
 15nvoeYXsIpnSJ4uhn3xp5BCW9rMFysWoYuEgji1bEDbzlocSJ7jOKGtdwdKhK3VEP9l
 /KAo+RnqE+KPMQom/Cwh/TYYTLrzZup95+j5gFVPIGNfKfGSRx7foSrBiejggbCQU33y
 lZKQ==
X-Gm-Message-State: AOJu0Yy4mGfUgpJCgaJ/8gfRWwa96Xn+uBNp0Qk27tqmK4Lp8ILEeJGO
 PR41QUaIR+MQrY8PEFvK1mdsiv0n6nSM7EUTh4LWNz5PXSNAjC1EUzlYgwQusOfPZFfF0s2kta7
 BOrQ5rKirQoeXApbvE+A3Ek47s+w+0UcfysBwRWIkLA==
X-Gm-Gg: ASbGncuoaaQ6cG5Jpn2KUpFxIXClJ2kNQMKhL7lfbf9rZljGJU587o+8YQadzR6iYi6
 N2N1nyyxiagLgBn1AdHd8zQ9AbyR4edSm1Ptl11phu+txn0sCr/AY8Vso60D9+cjPWmleqgjZh9
 4KBcIT+EwR9snv4rPM5dk8NT5JLxLpc9fx4A4=
X-Google-Smtp-Source: AGHT+IHo7Mqt6JnDz4/jHaoKE89xQz3JjFXNvZ7yXY6Z9JFj237Ea+FFgZFXfcCVQx2Y8mcN8Omno7ZhiFqRg5iWPZk=
X-Received: by 2002:a17:90b:38c5:b0:30e:9aa2:6d34 with SMTP id
 98e67ed59e1d1-30e9aa26e5bmr23469081a91.0.1747747738358; Tue, 20 May 2025
 06:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250505121924.921544-1-dev@lankhorst.se>
 <20250505121924.921544-10-dev@lankhorst.se>
In-Reply-To: <20250505121924.921544-10-dev@lankhorst.se>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 20 May 2025 16:28:48 +0300
X-Gm-Features: AX0GCFukna8BLvYUYyMK4lL1l0BVZeFkJqxB76BmHNWSG26D-tJqC0TnH94y9CI
Message-ID: <CAJ=qYWQp1y7biR91dkdLHjzJHGcBh3f3xgqhg0=039qGP71GyA@mail.gmail.com>
Subject: Re: [PATCH 09/10] drm/xe: Implement a helper for reading out a GGTT
 PTE at a specified offset
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
> Split the GGTT PTE readout to a separate function, this is useful for
> adding testcases in the next commit, and also cleaner than manually
> reading out GGTT.
>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  6 +-----
>  drivers/gpu/drm/xe/xe_ggtt.c                  | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h                  |  1 +
>  3 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/=
drm/xe/display/xe_plane_initial.c
> index 6502b82741732..59b2ff2026d47 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -87,12 +87,8 @@ initial_plane_bo(struct xe_device *xe,
>
>         base =3D round_down(plane_config->base, page_size);
>         if (IS_DGFX(xe)) {
> -               u64 __iomem *gte =3D tile0->mem.ggtt->gsm;
> -               u64 pte;
> +               u64 pte =3D xe_ggtt_read_pte(tile0->mem.ggtt, base);
>
> -               gte +=3D base / XE_PAGE_SIZE;
> -
> -               pte =3D ioread64(gte);
>                 if (!(pte & XE_GGTT_PTE_DM)) {
>                         drm_err(&xe->drm,
>                                 "Initial plane programming missing DM bit=
\n");
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 20d49a96c2407..2316f3a74d9c3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -912,3 +912,15 @@ u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt,
>  {
>         return ggtt->pt_ops->pte_encode_flags(bo, pat_index);
>  }
> +
> +/**
> + * xe_ggtt_read_pte - Read a PTE from the GGTT
> + * @ggtt: &xe_ggtt
> + * @offset: the offset for which the mapping should be read.
> + *
> + * Used by testcases, and by display reading out an inherited bios FB.
> + */
> +u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
> +{
> +       return ioread64(ggtt->gsm + (offset / XE_PAGE_SIZE));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 437ba65f33860..600a76526cf34 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -50,5 +50,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
>  #endif
>
>  u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16=
 pat_index);
> +u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
>
>  #endif
> --
> 2.45.2
>
