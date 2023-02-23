Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026F9C61DA4
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 11:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07E810EB15;
	Thu, 23 Feb 2023 11:03:24 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB1310EB37
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 11:03:22 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a10so10515623ljq.1
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 03:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=32QD6Lj8L4UzsygTUs/64Hz0ZPcV/VpLuh5zMhLXl38=;
 b=n+NKLwTk65FRJXG29yWxeVn+SQzYWACirjJjIGhrn14g3fgW/6344ImYLWw/HLSu6n
 lD/M4E4Jjoo6Up9ojRsDB2Q0qzwHdkb4oXqH2QmbWbuu/xwLrcAOEWEWiI4VsPLxz7eB
 5I+zVd1kiwHYRReES68uBofxYGlTtBhV+LH4QWxhZpVLrCvI2j1P26ps8SD3fqesiIp4
 Q9CnVoH7sjzurD1tlSnmBhFA7gpkkJNXF6pwgXzacyKpjh2pJrVjb76zVqVN+6vBPajx
 jvRsNhMpkLeiiZzz92i8cSxl5YdLg5te6lCtyLsGs5QUYGSm0YMBeLVzTE07FOzP/odX
 D3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=32QD6Lj8L4UzsygTUs/64Hz0ZPcV/VpLuh5zMhLXl38=;
 b=MVMeBdp6ycod+goT0eol+03bOD19FXaXp2ntsHe4nsv95NG/Y6cplXcqWkWTcbOxCz
 vwdFw+wYkHXSXLHu0CqT6HBGxyUZN2B7lsm/ltC6CO1Rt32/cNezm65YrKMkwoCpYm17
 +Us87ziJ0p6YPRildGlk9tEwfG+6gM/0xdHRxmgHKPa6MXnpLQ8+UDHXjY9c8ZpzoeN1
 8Er7M3qXwNpYzte5rx9bpGTFEBYJvtrUEenCJCa/Pc8sPHNo1idsoCppR6dQnsHv0FcS
 U/6oDo2P7MAaHtEX24S8NUrIxcn2Jt0+TeaOABk2hsc+4nSrSGTaSVZtyJqb9YX9GOdv
 ZHaA==
X-Gm-Message-State: AO0yUKUMP2rDKVpj2vDx7ExUm/IBiXWhWiMjMmcDohoYCsfS2p3EH7wJ
 jCh1Aa46eeOzA4pBYKEHFRfOg2vQraiUKSoWU6xYRa411bw=
X-Google-Smtp-Source: AK7set880bGYPzdow2Oywfw5+CjwxH7pSh6KmXgEGMz+qSabOTuqiQSrU8DQ1tUyuafR+Xjs4GQx8pvNjr2ZYLx/lfE=
X-Received: by 2002:a05:651c:3dd:b0:293:4be7:14d5 with SMTP id
 f29-20020a05651c03dd00b002934be714d5mr3562280ljp.2.1677150200712; Thu, 23 Feb
 2023 03:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20230217103647.416741-1-matthew.auld@intel.com>
In-Reply-To: <20230217103647.416741-1-matthew.auld@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 23 Feb 2023 11:02:53 +0000
Message-ID: <CAM0jSHPMAgFe0G+C=QjNwuHeVnsxV7xMNU0uf5KUqbLHFPMeuQ@mail.gmail.com>
To: Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: fix bo leak when unloading
 module
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
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 17 Feb 2023 at 10:37, Matthew Auld <matthew.auld@intel.com> wrote:
>
> One of the issues affecting module unload (DG2 + display) appears to be
> some kind of BO leak:
>
> WARNING: CPU: 1 PID: 1198 at drivers/gpu/drm/drm_mm.c:999 drm_mm_takedown+0x2e/0xc0
> WARNING: CPU: 1 PID: 1198 at drivers/gpu/drm/drm_buddy.c:174 drm_buddy_fini+0x5e/0x70 [drm_buddy]
>
> Turning on more debugging points at:
>
> [drm:drm_mm_takedown] *ERROR* node [00e10000 + 00e11000]: inserted at
>   drm_mm_insert_node_in_range+0x2c8/0x500
>   __xe_ggtt_insert_bo_at+0xb0/0x120 [xe]
>   xe_bo_create_locked_range+0x255/0x2d0 [xe]
>   xe_bo_create_pin_map_at+0x4d/0x170 [xe]
>   intel_alloc_initial_plane_obj.isra.0+0x175/0x340 [xe]
>   intel_crtc_initial_plane_config+0x7e/0x270 [xe]
>   intel_modeset_init_nogem+0x341/0x8b0 [xe]
>   xe_display_init_noaccel+0x1e/0x50 [xe]
>   xe_device_probe+0x1fa/0x2a0 [xe]
>
> So looks like we are leaking the object ref for the initial fb. Looking
> at the i915 code we also drop the driver reference to the underlying BO,
> which appears to just leave the drm framebuffer holding the last ref. Do
> the same for Xe.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Gentle ping. Maarten, any chance you can take a look at this change?

> ---
>  drivers/gpu/drm/xe/display/xe_plane_initial.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index bd5d588e8fbf..a2ef0823ed02 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -230,6 +230,8 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
>
>         atomic_or(plane->frontbuffer_bit, &to_intel_framebuffer(fb)->bits);
>
> +       plane_config->vma = vma;
> +
>         /*
>          * Flip to the newly created mapping ASAP, so we can re-use the
>          * first part of GGTT for WOPCM, prevent flickering, and prevent
> @@ -263,6 +265,9 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
>                 else
>                         kfree(fb);
>         }
> +
> +       if (plane_config->vma)
> +               drm_gem_object_put(&plane_config->vma->bo->ttm.base);
>  }
>
>  void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
> --
> 2.39.1
>
