Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4B6CEACD5
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 15:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A992610E312;
	Tue,  1 Oct 2024 15:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gex1sPnX";
	dkim-atps=neutral
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC7810E08F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 08:07:12 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2fac3f20f1dso21792841fa.3
 for <intel-xe@lists.freedesktop.org>; Tue, 01 Oct 2024 01:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727770030; x=1728374830; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDGdkPHx0D1j5vHF/c6NOku8EQtRl7HCdp9J72B4+OI=;
 b=Gex1sPnX/P3aJwflqQAdXj5UkdB16MlIehWX+hBTS8jmhyfin+zSsW9gKat9KI05Ph
 BOv7jvDyEr+Yw9Dd5W15gEj+IOUIl1cYN/5AA91FM0y5V0RZDN54Oe/EUppSTJILrMb8
 Mj0/YZCtXo2TTV8eNTVZutTfg9MadFoEBUAjRr48RqgLVmeYlpLSKQ9waKu0bHJaFmKd
 CSod9gB/ULDU7Mumk6RTylymxmqxShrrVmwFpKj8FjyFvoULb7DvgVD+o0UzB3W74guc
 TL0C+sbkK3A3XHXX98GR4cDSrS1IbKffKV4jCH0qqHkJfXqR6b4FxUHa4RoThFXF1Uq5
 PzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727770030; x=1728374830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LDGdkPHx0D1j5vHF/c6NOku8EQtRl7HCdp9J72B4+OI=;
 b=WGMsGmITPZAzbR6ojde2hFJx3vPlrk6QoHwrl7HUZWn7EEfNP+zasqrj5ZnCssGvWM
 D1oMjzClnv3feg1UQLTDiKvHbC003RpRPXzEBX2nUJSeJ/SWlplpUDajOl9R/UF6hWPQ
 8EZ8jW+PwSaWffxzG+iPHiC9H8DSLWmcyvfikA2CVmblMYBmKvhBQvpFG3Mx3KAc83RP
 I54k/WlIbXUBlsuQSVWy8Dm8HQJfowiqKFZtJJPjc0muuziRxySm65LwH47mQseY01QW
 WOfzW+R1kchnP/smEgGQROAkW3gLd3ubegrP6iHZZ3l7sPG7lysLf+IdkN6gc7XwoEAY
 Je5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcWYAa6QKlUENV2dWuXUHnNQPs2JX+lsaq7uOPCEdBRf/5Kn+RE2lq1d8dGFu+DM0WAjkQZSaT4w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe8UrVH8LN2v/I5V/x32NBAaUsldeSgev79RFU/tlPSpaWdp/K
 I+Slc1pa2SEn8Vu9oPHU9k9LU5KXZr2upnN3KlFDwaMyK5//Di41f5fNI9EOh35shcN+oZOmX0v
 SFs5XZgR39eDZwvWwhsRcF119d/k=
X-Google-Smtp-Source: AGHT+IHvOBYxOwUNOdUDNsDNEt0IUTQzFgiYQcsCEoRnAjcabGr8fw/ZklnSkzujELmuW9wahcWEGEQFJ63COsA2Nq0=
X-Received: by 2002:a2e:b889:0:b0:2fa:d6cf:28f6 with SMTP id
 38308e7fff4ca-2fad6cf2c81mr19409351fa.3.1727770029640; Tue, 01 Oct 2024
 01:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241001134423.62b12a80@canb.auug.org.au>
In-Reply-To: <20241001134423.62b12a80@canb.auug.org.au>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 1 Oct 2024 10:06:58 +0200
Message-ID: <CAFULd4Yg=VmL5rCdxqbh68TSR04zFHPjxUYN0fqNBBfmdQXkmA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the random tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Theodore Ts'o" <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 DRM XE List <intel-xe@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 01 Oct 2024 15:32:45 +0000
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

On Tue, Oct 1, 2024 at 5:44=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the random tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
>
> Caused by commit
>
>   38d1a9d296c8 ("random: Do not include <linux/prandom.h> in <linux/rando=
m.h>")
>
> interacting with commit
>
>   5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
>
> from the drm-xe tree.

This was kind of expected when two commits are in flight in the same
area. IMO, the best way to solve this collision is to change the new
include in the DRM tree from <linux/random.h> to <linux/prandom.h>, as
is shown in the proposed patch.

> I have applied the following merge fix patch for today.

Thanks,
Uros.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 1 Oct 2024 13:33:48 +1000
> Subject: [PATCH] fix up for "random: Do not include <linux/prandom.h> in =
<linux/random.h>"
>
> interacting with commit
>
>   5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
>
> from the drm-xe tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/=
xe_bo.c
> index 7d3fd720478b..3a14b70f12b8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -7,7 +7,7 @@
>  #include <kunit/visibility.h>
>
>  #include <linux/iosys-map.h>
> -#include <linux/random.h>
> +#include <linux/prandom.h>
>  #include <linux/swap.h>
>
>  #include <uapi/linux/sysinfo.h>
> --
> 2.45.2
>
> --
> Cheers,
> Stephen Rothwell
