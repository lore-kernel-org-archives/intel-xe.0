Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE2CC7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 10:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C800F10E8C3;
	Thu, 25 May 2023 10:52:56 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1DB10E8C3
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 10:52:54 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f3a611b3ddso1034623e87.0
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685011973; x=1687603973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jR+wjz2NFTMa1iAL2o5qgDSoGvp26ktEGH+FMJ1XQt8=;
 b=gbpY57l1lJ7+WA69m4QSyXeYyCHqPVdNFOTQueGum536JrMMDQuxUUqH5SdWViZpJu
 9Mn0kVEh2pbcoJABOGLAIPmEH8iJ7MFWPbPfvCGz39mFFJhOmQAECe/UmN93Mb56BtAH
 SQ7xL4+1rIRgA++A4WhtYwJtG4T+Ze8xXpCb6LprsvizuGVrXlwsX+KqFIGWgM6DQuP0
 53UUD42oVYqlSzmikrTawf7gJBjfOEsbNy81puaY48B8J9cHjCvlw3XPT6dcLu49OK9P
 lPLnoQwAKBxfjWjkdrg8OZfqI3Qy0ocY9GrlWDMjzhiE5k9taA2cb9q/1pLBMh8BG3kg
 oH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685011973; x=1687603973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jR+wjz2NFTMa1iAL2o5qgDSoGvp26ktEGH+FMJ1XQt8=;
 b=J6uMWREVtQgIPnNX8GxySHQwh5Naj8c6THmtg36IwFWxbYI6KnPbH9obugNKhbMegL
 CGkRPuErswRep9KYc8+bSffjwOTI7Hs07MN8ZWaPxnGv4RJWOPmZT5htlP2GqEJdZSjh
 /hR80MNoRTlawQDTbpMHUudpsoJj9y4p8h8P7vi1q/VrCMYR3Vk/DdD09VYv9A/bTNCj
 m00N929WBi1ij0HMfSEEB7c+MNodnFOUwZk24GPiIxKJrfKqdsJw1/1Oq/muD6jCsxTv
 FSv7BN6ppaE5U9UHpDnDlYBg6JegA0hekyxGbGTgfaBV4ncpb2s8cSaqDgB9BBiYC9qX
 TnsA==
X-Gm-Message-State: AC+VfDwy8tLIPEvGGrCpZ9gMy146KvBxMmjq9caI8T0U05a4x9BOOy00
 gnvD8YzDLFVKfGBcp5iKMmQbWy3oNU9mUdl9Y0GnTM21EIY=
X-Google-Smtp-Source: ACHHUZ4GKpnTxmhrhtm7Z6nyKB0QJOQY6ZIApu+jl2MveeBMcZsaFnpZQ/aR6Kenz5KL7CaTkF/QsyrOp1oxmCfp4bo=
X-Received: by 2002:a2e:b5d3:0:b0:2af:2965:8f78 with SMTP id
 g19-20020a2eb5d3000000b002af29658f78mr684003ljn.12.1685011972705; Thu, 25 May
 2023 03:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230525081615.179819-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230525081615.179819-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 25 May 2023 11:52:23 +0100
Message-ID: <CAM0jSHPUrKtB3C=d7m3tUW2SNJ0hPwtQy9c9=NjxF6UXCc1sHQ@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix engine lookup refcount race
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 25 May 2023 at 09:16, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Fix a race where the engine could disappear between lookup unlock and
> xe_engine_get().
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engin=
e.c
> index 094ec17d3004..3a400a546dfe 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -161,10 +161,9 @@ struct xe_engine *xe_engine_lookup(struct xe_file *x=
ef, u32 id)
>
>         mutex_lock(&xef->engine.lock);
>         e =3D xa_load(&xef->engine.xa, id);
> -       mutex_unlock(&xef->engine.lock);
> -
>         if (e)
>                 xe_engine_get(e);
> +       mutex_unlock(&xef->engine.lock);

Makes sense to me.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

But looking around a bit, why does engine_get_property_ioctl() not use
this? It also does a raw xa_load() and then touches the engine without
holding the lock or keeping a ref?

>
>         return e;
>  }

> --
> 2.39.2
>
