Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ED9C77B61
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 16:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4043B10E260;
	Fri, 21 Apr 2023 16:32:24 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0FC10E260
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 16:32:22 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2a8baeac4d1so17193071fa.1
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682094740; x=1684686740;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XmwQlzMFGE/FprhwGXaCIt6kKn57Oio+xjWFzMdaty4=;
 b=OttwrVAGCPd+JFefP4ewB8DR+N5dlwJ/gHfZd+S9/quygCJVWmthyWtYmT4kl/0/EJ
 4+xc076fWasJ+GpsuBxdBTEX7Tpg6A6o/rgR6nLpFT4T1v25REAAW7HQm6v44pW+3qNa
 MFYbttO6CJN4Fi16LhZIHx86+dbUzcPZXTEHazqF4aYO8Zt6XEEK6ULCN+Q+A2SMXQrM
 B1z/u6/d3qfUldn6+oKQ+rzCsWuw4MxjkzskZjo6A5zr0VcgLzRVKUoAFfNZVBgnvjCN
 hdnanE09p0gH3hZsMIJrIToMyPRZae2C+npitX1ziIwABsTsYXByqOw64YVUU0rFgMsj
 K46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682094740; x=1684686740;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XmwQlzMFGE/FprhwGXaCIt6kKn57Oio+xjWFzMdaty4=;
 b=mGyTzl33iSQoHKo09wp84/d5mTf1AVMeLKDRSSke91nSbEGGO2znIa0AiOWkiHPptu
 oNuqoODTkOOlxAV7QGIwH7r5UL5LzFvpvVdE8dRWqJXeSLcaLB8tqNUgFuZeALATNFmF
 cr2m657E2bDcO+PpcF7mVEguu7dBLFK5NjLDXwn9fKyH5PCJAn3i2UCHkTmrqKG0NZL7
 bo/4o7TvsHPgtnmmARdgXLvvArGj0tBnmOODAF896/edEdWpOvlYwCYSlMUb/z1VCbtx
 C7azx9wsBU4wxx6e7pqcRz7alstrVPfVlFaOI5EhMYuXlPEznaMUozVsO5QlynbslF52
 +nOw==
X-Gm-Message-State: AAQBX9ciHLPJn30hSBiudJco5VaCks0mGNeMXWl1TL1xr+6QfVq/AbjZ
 S+zjb1ttJk6LyunFrqCevUMYX5NJAqsxPg9C4Ck=
X-Google-Smtp-Source: AKy350b8i7aqmffxfzDjreotbFZlMcXnHcLX3EsWF6HcSe/nnQ6gBn0Ao8/8KkyZ+yppY8zdqEYK8IWzUVa1xSh/rXw=
X-Received: by 2002:a2e:90c9:0:b0:2a6:1b80:1ff3 with SMTP id
 o9-20020a2e90c9000000b002a61b801ff3mr756738ljg.0.1682094740148; Fri, 21 Apr
 2023 09:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230421153852.329899-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20230421153852.329899-1-balasubramani.vivekanandan@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 21 Apr 2023 17:31:53 +0100
Message-ID: <CAM0jSHO_-1KAs-rOBxaaq0hN7B2octzeN3XcGHrWoRbOYMuo6Q@mail.gmail.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Keep all resize bar related
 prints inside xe_resize_vram_bar
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

On Fri, 21 Apr 2023 at 16:39, Balasubramani Vivekanandan
<balasubramani.vivekanandan@intel.com> wrote:
>
> xe_resize_vram_bar() function is already printing the status of bar
> resizing. It has prints covering both success and failure.
> There is no need of additional prints in the caller which were not so
> easily to follow.
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 98357c1f109f..8bd39c3e65ae 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -107,6 +107,8 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
>                         return 0;
>         }
>
> +       drm_info(&xe->drm, "Resizing bar from %llu -> %llu\n", current_size, rebar_size);

Maybe convert to MiB and print the unit?

> +
>         while (root->parent)
>                 root = root->parent;
>
> @@ -117,7 +119,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
>         }
>
>         if (!root_res) {
> -               drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing\n");
> +               drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
>                 return -1;
>         }
>
> @@ -183,7 +185,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>         u64 vram_size;
>         u64 original_size;
>         u64 usable_size;
> -       int resize_result, err;
> +       int err;
>
>         if (!IS_DGFX(xe)) {
>                 xe->mem.vram.mapping = 0;
> @@ -212,7 +214,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>         if (err)
>                 return err;
>
> -       resize_result = xe_resize_vram_bar(xe, vram_size);
> +       xe_resize_vram_bar(xe, vram_size);
>         xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
>         xe->mem.vram.io_size = min(usable_size,
>                                    pci_resource_len(pdev, GEN12_LMEM_BAR));
> @@ -221,13 +223,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>         if (!xe->mem.vram.size)
>                 return -EIO;
>
> -       if (resize_result > 0)
> -               drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
> -                        (u64)original_size >> 20,
> -                        (u64)xe->mem.vram.io_size >> 20);
> -       else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
> -               drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
> -                        (u64)xe->mem.vram.size >> 20);

Should we then update the _resize_bar() fail message to include this
information?

>         if (usable_size > xe->mem.vram.io_size)
>                 drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
>                          usable_size, xe->mem.vram.io_size);
> --
> 2.34.1
>
