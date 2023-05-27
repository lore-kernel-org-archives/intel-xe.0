Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A5EC77B7C
	for <intel-xe@archiver.kernel.org>; Sat, 27 May 2023 05:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1440B10E211;
	Sat, 27 May 2023 05:17:17 +0000 (UTC)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1407F10E211
 for <intel-xe@lists.freedesktop.org>; Sat, 27 May 2023 05:17:15 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5552cbcda35so788256eaf.1
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685164635; x=1687756635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6yJ2jdH8fsRTKCQCtLBtlPfUqrlD3A9+N6BA9TtkMI=;
 b=sRecVBHquwbICs+5EgyVqIo1ssX6dwazadbO1gEN/RXr10nry03ijmx4KbJXDulFy1
 gLGakmgV/HYtNcLMNewECMNCXjw7GovV3OuQebfxyIfoeDluptWxoXowtwS8KoEyHjqd
 68vISW+jce60BsCMyivRYi5+O54rTSpXucOkgaVFaemxml3RrsA3h3wtzAfFcMo9FR5Y
 6MlReUp9dvPSNUcgLLPT4wtif1GQXDiBlPmEFLBOoX4hLaS59pXBUBaBjD+R2JzMkAZl
 msIrZomeLJrhYQtPZXlCRGRQP/9NfZlmol2lbhxABhhcI9o+pA0ejwYVcHBEEoQIbvvo
 t04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685164635; x=1687756635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d6yJ2jdH8fsRTKCQCtLBtlPfUqrlD3A9+N6BA9TtkMI=;
 b=YgH0C+zhgt8clrASggKZMP1CMoYfCctkq+8v4S31ayXeECNOVkjni4frWrCxB6yKXV
 UjIv/6Aif/pFjiqU3IvxRHKgfovuVhc/6Zeu8T5cbi6zQPWCSQyjUASQMC7K5pI/T9Sw
 UCFqWFHhqJiJL4Fp3afGW5dJ9su0WgzpzR1AfJ0A99XlXOLz5sO6vX8FZApWP4AnlrZv
 UHO1XF3/WFf2FsZmFePtnPhWsTHAA0hO9HCBZq6YaIKfIR+5vrrMgFdySVqw0ODRbhpZ
 w7Ry8Yd2HCnPtp53fBmI+E/VXR49S7OGos6sZjir9wXASYDnH4sX9W+tZUQ67XzkSq+I
 MDPQ==
X-Gm-Message-State: AC+VfDzZL2KACDbEuVHLOu7re7hBbBCCmIbPtZI3W5U15gM39KUnU/h0
 y5yhmLVa/nWKUbnjngKVClk1b5gRdXhQAKU8tO8=
X-Google-Smtp-Source: ACHHUZ46GF+tZb68Jnf7SVk7g5Zqd5mFuaDDdZk/eOOEmaZyEDVEUlSxKOLKkuR6pTz6QxJIPTQtdwDAZ5qFCNEAnG4=
X-Received: by 2002:a4a:37d2:0:b0:555:5348:f2b with SMTP id
 r201-20020a4a37d2000000b0055553480f2bmr824446oor.0.1685164634650; Fri, 26 May
 2023 22:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-6-maarten.lankhorst@linux.intel.com>
 <97d4425bbb46b19cf48dd04594c9eb3c2f0c5662.camel@intel.com>
In-Reply-To: <97d4425bbb46b19cf48dd04594c9eb3c2f0c5662.camel@intel.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Fri, 26 May 2023 22:17:03 -0700
Message-ID: <CA+aRtuYGnrdL_o+iO=Xj9ikRA_ddtGf8jhpuhPcXJN63qUK4-w@mail.gmail.com>
To: "Souza, Jose" <jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 5/5] drm/xe: Return the correct error when
 dma_resv_wait_timeout fails
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 12:16=E2=80=AFPM Souza, Jose <jose.souza@intel.com>=
 wrote:
>
> On Fri, 2023-05-26 at 14:11 +0200, Maarten Lankhorst wrote:
> > We call dma_resv_wait_timeout with MAX_SCHEDULE_TIMEOUT, so it can
> > never return -ETIME. It will however fail if interrupted, so in that
> > case return the error.
> >
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/239
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 8735facb1cf9..77ba8492bd90 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -611,8 +611,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm=
_bo, bool evict,
> >                                                    DMA_RESV_USAGE_BOOKK=
EEP,
> >                                                    true,
> >                                                    MAX_SCHEDULE_TIMEOUT=
);
> > -             if (timeout <=3D 0) {
> > -                     ret =3D -ETIME;
> > +             if (timeout < 0) {
> > +                     ret =3D timeout;
> >                       goto out;
>
> 0 means timeout, so what this is doing is allowing a error to be treated =
a success.
> I understanding that is should never happen with MAX_SCHEDULE_TIMEOUT but=
 I would rather leave this as "<=3D" just in case there is a bug in
> dma_resv_wait_timeout() that ignores the MAX_SCHEDULE_TIMEOUT.

If 0 means timeout, and < 0 means other error, then perhaps it should
return -ETIME for 0, otherwise pass on the error?

>
> >               }
> >               ttm_bo_move_null(ttm_bo, new_mem);
>
