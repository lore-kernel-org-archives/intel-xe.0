Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBB1EB64DB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 08:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD1110E499;
	Thu, 15 Jun 2023 08:42:34 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8188110E189
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 08:42:32 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b1afe57bdfso24152921fa.0
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686818550; x=1689410550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xPK93GLoCMn2jJKUmFadfSiD0KJiOEGQWG6otnkLVPM=;
 b=PsmrI/D7AXccWu3zfxaefAKvStI6XdvFKJInoPNVkP7Xb7XZxoeovq1DGTXw9IGbhE
 icLycaJGWyjnvCX2u717VsqcUx9A4fIpjnzwEH29LuQ6rWijNc2SuWXAcdKFq6KNUZUL
 O8LJqogRTbN9EoH852r9qvpcVcgMnSbA09wF22l6ta0pCxUu9J6xAM5ep+RbNaZyAhhK
 JfkL4tiMMUwMMseO8o/welFQik3pUEk50RV3oLZxyqhu7WpjpjQhXIU96UqihABxoBF+
 d5RDvHSzNmBrSYK0iAdCC8pD7cYaSjN8ToXlnATlbK8zUfz83duS0Jh/HDKHLX179Bz9
 mrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686818550; x=1689410550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xPK93GLoCMn2jJKUmFadfSiD0KJiOEGQWG6otnkLVPM=;
 b=aV5Ji91xnH60tjWmSuqHRKmLNGZxCZUhIOlp3FaitqhwaWFRhComa1INCDN36cmcR6
 5o+OsDOSArqo9kF9A8BuCiU8rZQDC4DIRZi6MpkoMhAiZi5Qc7FoCq9nWneJLKZjV7tu
 cXTdpu4uOPzV84LQ3aJ8mv6Uphl4lZ9QrXMKHcNVmsY9lsbiOl4BO3We/v3xMYC6S3Ti
 sVfDVq37FPFhY4FmxoXVp3wcScx6Utb5TTT1YoDsv7LhjzbWLY4sRH99DRdmbwWwgZ87
 B+KUR9LGq1phGYTz4O4QRNAFN/fOv443uDP/CPD5AtVUvl8YMBdY8s5vCNWAv2b1D6+7
 K+qw==
X-Gm-Message-State: AC+VfDySJd8nE+I8t31mFgwBQyrP5DxnTipYJCO4mn+xfqpso5EUyk3L
 obUUbsET+eJFQQShQ3yWHhdl6ojg0ajcTnuCJ9YsJqzoHsrhfw==
X-Google-Smtp-Source: ACHHUZ6BVv79OE7+xfUPx3NuGpuy9eWyWfqCOXgN3lJW4q57sl1TFGBCwxRx2HhaGC734fRDWuEOS/GsSYKj4HKkN3g=
X-Received: by 2002:a2e:8783:0:b0:2b1:a89a:5f2b with SMTP id
 n3-20020a2e8783000000b002b1a89a5f2bmr8016104lji.2.1686818550263; Thu, 15 Jun
 2023 01:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230614200445.3363527-1-matthew.d.roper@intel.com>
In-Reply-To: <20230614200445.3363527-1-matthew.d.roper@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 15 Jun 2023 09:42:03 +0100
Message-ID: <CAM0jSHNkKHgyuSUAAHEurhGi2ufhgnyDod0fhaXjTgUFEh6arw@mail.gmail.com>
To: Matt Roper <matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Grab runtime PM over MMIO ioctl
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

On Wed, 14 Jun 2023 at 21:04, Matt Roper <matthew.d.roper@intel.com> wrote:
>
> The MMIO ioctl (which is generally used from IGT's xe_reg tool) may be
> called while the device is in D3, resulting in invalid results (i.e.,
> all registers read back as 0xFFFFFFFF, writes are dropped).  Make sure
> we grab runtime PM wakeref before performing register reads/writes.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

AFAIK we should use mem_access_get() for MMIO:
https://patchwork.freedesktop.org/patch/542124/?series=119213&rev=1

But that requires first fixing the races with mem_access which is
quite involved, so perhaps using runtime_get() directly here is fine
for now. We can just replace the instance here with mem_access once
that's ready.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f7a7f996b37f..5f4c8ae23771 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -19,6 +19,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
> +#include "xe_pm.h"
>
>  #define XEHP_MTCFG_ADDR                XE_REG(0x101800)
>  #define TILE_COUNT             REG_GENMASK(15, 8)
> @@ -476,6 +477,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>          */
>         reg = XE_REG(args->addr);
>
> +       xe_pm_runtime_get(xe);
>         xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>
>         if (args->flags & DRM_XE_MMIO_WRITE) {
> @@ -519,6 +521,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>
>  exit:
>         xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +       xe_pm_runtime_put(xe);
>
>         return ret;
>  }
> --
> 2.40.1
>
