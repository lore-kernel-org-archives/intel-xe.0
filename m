Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F3DC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337CA10E1DB;
	Thu,  7 Dec 2023 14:49:40 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDE910E1DB
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:49:38 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50be03cc8a3so1033733e87.1
 for <intel-xe@lists.freedesktop.org>; Thu, 07 Dec 2023 06:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701960576; x=1702565376; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zGpqS5xV5hsutiePSKJbMHeMbMnkWZyya/apNG7zkaw=;
 b=g1V0F4pTBBTjHBdJs5BOeBlmfOkcgZCR8T8yt0NtrisdeMPWeXKOpUlzL8IPYfxcA3
 X/JlUrKcGFq5fNYAC/xqaJYXNPiD2mhyxVjmHY5tYPyKFBc+2ZDfV5y0xqpZaQd50mDQ
 F8oSHOfQGd9w3L/M49NJCRPKceWASJwwAxs9dOu9OSTue+OS1Vha5m6i77SnNRc+jpke
 k1YqN3Hm1PtGJD6mANgY8BoXD/babTSInCBz5AyBiFSavMTpOGrqR/SbkDIArr4YhMdQ
 0YWp5Z73uEf1gVssJmp2RWqx/hdH4nYnNoB0HiieBT6UJN+xskZ008E+WfLlWr43Oqhv
 g4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701960576; x=1702565376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zGpqS5xV5hsutiePSKJbMHeMbMnkWZyya/apNG7zkaw=;
 b=FTtXTsqXvSl1CLk9vTL0QY5US2GT8qYW9rdDsrFK864qApixqN9Bc8qJ85LYrU3Tri
 BCaWn44LsaNN35Me/FPlmenDpwPzrpD74Et1C/a21DNjhH7lOovt7kt1OVkA2nxL6ylk
 xUOpFeDi0yVZiyN5h0uHDlXEvJX1VW1/tl2re4cEiSFrAMszPdyQK3fpPSsDYLY9bU6M
 m42ryK+fLjkD/uV3pQ6J7R4yTvahuFKUNblPvof18b7rJFHArVt530SR3qMXlAH+ijLG
 hWaLb9xqN26iEalClJpBRX4Pk7tQzn4JvgzGiPaRnYlmU2qinoFqd6yefxTQcd5KdElR
 exXg==
X-Gm-Message-State: AOJu0YxvV8ljW1IG99MynkP2vEl6aed/l0TRGl/6J83g34wgsIcK4P5k
 IhLW7imBTOyCSNPtwu1bBP+4EAQQpywa2Kw5+MrHxwN37w6mPQ==
X-Google-Smtp-Source: AGHT+IEE3avah+loVkeRQltQXakJx2toGxe6qNo9FmSCGSkPC3LsAKbxxg52Rh6ukD39w/vYm4kOETt5heG9OC8yeZk=
X-Received: by 2002:a05:6512:e92:b0:502:f2a8:d391 with SMTP id
 bi18-20020a0565120e9200b00502f2a8d391mr1980857lfb.45.1701960576293; Thu, 07
 Dec 2023 06:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-8-francois.dugast@intel.com>
In-Reply-To: <20231207135009.7-8-francois.dugast@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 7 Dec 2023 14:49:08 +0000
Message-ID: <CAM0jSHNbrvP2MyNmT8=n6qE1ZmJw5KA1uBer6tdsFThgKH=niQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/14] drm/xe/uapi: Replace BO with GEM in documentation
To: Francois Dugast <francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 7 Dec 2023 at 14:27, Francois Dugast <francois.dugast@intel.com> wrote:
>
> Align documentation with names of constants and structs, which
> use GEM instead of BO.

AFAIK GEM means Graphics Execution Manager, which is just a memory
management backend. Maybe "GEM BO" would be better here? IMO saying "A
mask of memory instances of where GEM can be placed" doesn't sound
correct.

>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e608a8e7dd76..f9178fe024a5 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -610,14 +610,14 @@ struct drm_xe_gem_create {
>          */
>         __u64 size;
>
> -       /** @placement: A mask of memory instances of where BO can be placed. */
> +       /** @placement: A mask of memory instances of where GEM can be placed. */
>         __u32 placement;
>
>  #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING           (1 << 0)
>  #define DRM_XE_GEM_CREATE_FLAG_SCANOUT                 (1 << 1)
>  #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM      (1 << 2)
>         /**
> -        * @flags: Flags, currently a mask of memory instances of where BO can
> +        * @flags: Flags, currently a mask of memory instances of where GEM can
>          * be placed
>          */
>         __u32 flags;
> @@ -625,7 +625,7 @@ struct drm_xe_gem_create {
>         /**
>          * @vm_id: Attached VM, if any
>          *
> -        * If a VM is specified, this BO must:
> +        * If a VM is specified, this GEM must:
>          *
>          *  1. Only ever be bound to that VM.
>          *  2. Cannot be exported as a PRIME fd.
> @@ -768,8 +768,8 @@ struct drm_xe_vm_destroy {
>   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>   *    tables are setup with a special bit which indicates writes are
>   *    dropped and all reads return zero. In the future, the NULL flags
> - *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
> - *    handle MBZ, and the BO offset MBZ. This flag is intended to
> + *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the GEM
> + *    handle MBZ, and the GEM offset MBZ. This flag is intended to
>   *    implement VK sparse bindings.
>   */
>  struct drm_xe_vm_bind_op {
> --
> 2.34.1
>
