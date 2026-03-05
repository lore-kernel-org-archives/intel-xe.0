Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B281FCA17F
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 18:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F6D10E597;
	Mon,  9 Mar 2026 18:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eEFCuXU/";
	dkim-atps=neutral
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4F210E281
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 11:49:11 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64ad9fabd08so6493516d50.2
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Mar 2026 03:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772711350; cv=none;
 d=google.com; s=arc-20240605;
 b=A4eruDAR58pg9enVa7B2/qGDTiVYGfX0VtFGRWOo3cfv40gHr++v98luQJnB5275E6
 F+jJb9Sf5W7h/2CG+5CZmoAmF66c+VBD2wOxk3jVLVgk3bqdm4ZroJQYdPJeJxP2fmr2
 O13cNqTj7vLn7p7dJ8Hfuo66KDpQDbKQXU6eOgvjAWSNBvusP9zziblY6I6IrhpN/ytn
 v4DGjhtExO1nePqcU+xiV3uqGkKvXhE647xfIUsd/YFsxXnht8ZBkjffpHdVigbDHaxy
 841qTSkPvLCiNoLHSrgEOn4XgfdvYbiBhF9b8VV/19gS3cKVmV2701kgMb+V+oB8U5Nv
 dIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5dylkg5i6KyaHiH6LW/xi+H4XkRI04kFxENx6WCyvCs=;
 fh=bYZfQtRFcSE5P7Wg2SjWhWRi5DvDHJwqnpmqe8g89cc=;
 b=btZUbd15ErMeYu9JuSXwhVdAP2Ftl8BeSe5UHp0y+FxOw9Q3rzQA3+1VfFLmDco1Lp
 /a21tuDm8idK1sTQaK96Q1w1N/P/b4xOFzVEDYP3bbIKGAE3RogOcyU/+QWAbQdUvp+j
 GRPLt6h2WezSaUFXNzD/7RBTOrt9gSL/W04bSV/1qHQcjJcjwDvKdRSQykGFHwHqaPUQ
 WTNahE1hVP9VsaZCnqLNU+DYtG0zZSU0GVpMEmfJcR1roGGvxHYj/Hn3IHDZnxE+OU4V
 6CNM9PrYNx0fkJVcbhjhe/iAh4L+cbPtC/c8ukx2xIrSFGNI0pzwLDEYTZ/lHgVuwm2F
 2abw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772711350; x=1773316150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5dylkg5i6KyaHiH6LW/xi+H4XkRI04kFxENx6WCyvCs=;
 b=eEFCuXU/4llNUFR1PgmcRBSaAqFIM56gLzSb7CbAsf28OpLpIeluJ99TGcjswBtbu5
 RkyyNDJNHKXNhqo6qIQ+w0vMz2ehjfAEIJZjv3VaF4EsXb8pv78l49huDa8kMUl2wI5f
 k9R5//GPT1030KNEAsS0oUuzCeeJS+jrUOdfeNSi8pMDTbtoRH8D5V1ITa1RWgIFRido
 ZaujgHs5CEuJg/+nqDodrjdfda1Wxb263Xm0SnlYngM3MN/K66OUTGdQtwnE0AROvNl3
 YZwmjzkDbfKpUai7eYt+fKG3L+zDgkgeYHdGzg+B6LeBSFqo5IZsIEDsZWyMM8iZGG00
 DPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772711350; x=1773316150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5dylkg5i6KyaHiH6LW/xi+H4XkRI04kFxENx6WCyvCs=;
 b=jePFdWuVMeL07HMO5T7jsHXe1Ul0Y0Utk4HQXU9S0qa5NiXX89qLUFxk5sFDZIVJxt
 5vyHB4aaCbQtDAvBK/UELVcktAVmMh97Vofk7EcglDFzm2zZBqATlrwVXXoLTXoEFa7t
 GQa97K4+90Asg5enxdI+YZbH2g6qqeSy7axwtIl3nf9fgJq/nvRgXqdBcRO32rNRpHF2
 PxsVO2y0xNyMi00GsKv6G0SatJ7btCyLLn3juWHBWF8QqnuhKGYJotiQ+mGQ2kdLEeN6
 L+5ZP4+YHjjPbA9PUb3DxsSLmRzYjDVj17IgnYU771fPts1dDfxHLbJdI+fxvcYiBUXu
 1dmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ6K8P+lXM/QGVOMmqThE7fWbFTmO8efiCmch+ABEMl+LKDpMDJwAKuJmgS4NaqFCT2+KaQJp/Lg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1PbR8FFYC+6f7XVBRoHL9O50Q0bZYQ6ZwnLfZCY1iJ1rX4Aym
 muerZyKn6JTnFSytnbHgckiRxZSBux01MGUGMpKW4LAyEWqgg977P4Th4OPeM6wly3r9gNMVYAB
 ax5i85qC8eDD9p63EZ00m8bxWuQyr9TI=
X-Gm-Gg: ATEYQzx55oEQKi7ejiU0Q6IuBvTIaIBdepvxxklsoS1rlvtmEKfiM7GvGvTL5lGd325
 LC0JngDqGTh1GhlgLViRxmS1mmhUYm5Mfqb8fPuqmJP2bEVKZ5b4En6PKNMtDTf2a0ESDG3AM4G
 Wg3WxqPdFH3W6PCpVe+ijTMQ/AgwoDklorSPcJnAjpXsxhdyxV8wpbJScgyTgf4A2hj0iMPiR+6
 3r5+DyDYUMxvtskMqo5VwsQ+R908dGWub5yajBT6ImbO+xMyrMkHFqhsnJFfcvDgQ8SLOf/G5ad
 2CwIUZhZGxIWZa1Z1+eYKazh8lU6RR/XEVVoTP+ewVL0I3tj
X-Received: by 2002:a53:ee64:0:b0:64c:a41f:31a7 with SMTP id
 956f58d0204a3-64cf9bf8358mr3598103d50.84.1772711349977; Thu, 05 Mar 2026
 03:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20260305113734.1309238-1-dev@lankhorst.se>
In-Reply-To: <20260305113734.1309238-1-dev@lankhorst.se>
From: Julian Orth <ju.orth@gmail.com>
Date: Thu, 5 Mar 2026 12:48:57 +0100
X-Gm-Features: AaiRm53czpcJ4Kh_-9QH5wh840dLk4f394RKZj8SS2WW2Xr8DRLTxejqPtyf7BY
Message-ID: <CAHijbEWKN8EY0uy73XR2RRh1ScgarZTLibu5ECR08OeqTje54Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty
 stack"
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Mar 2026 18:55:56 +0000
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

On Thu, Mar 5, 2026 at 12:37=E2=80=AFPM Maarten Lankhorst <dev@lankhorst.se=
> wrote:
>
> This reverts commit 2e3649e237237258a08d75afef96648dd2b379f7.
>
> The problem occurs when userspace is compiled against new headers
> with new members, but don't correctly initialise those new members.
>
> This is not a kernel problem, and should be fixed in userspace by
> correctly zero'ing all members.

I don't mind it being reverted since userspace rust code is not
affected by this failure mode.

However, if you're committed to the idea that this is a userspace
issue, then I think the correct solution would be to instead apply the
patch you suggested. It clarifies the intention of the code in my
opinion.

>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Julian Orth <ju.orth@gmail.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 49eccb43ce63d..250734dee928e 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev=
, void *data,
>                 return drm_syncobj_export_sync_file(file_private, args->h=
andle,
>                                                     point, &args->fd);
>
> -       if (point)
> +       if (args->point)
>                 return -EINVAL;
>
>         return drm_syncobj_handle_to_fd(file_private, args->handle,
> @@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev=
, void *data,
>                                                           args->handle,
>                                                           point);
>
> -       if (point)
> +       if (args->point)
>                 return -EINVAL;
>
>         return drm_syncobj_fd_to_handle(file_private, args->fd,
> --
> 2.51.0
>
