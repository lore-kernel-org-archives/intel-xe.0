Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A528C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 08:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB7F10E43D;
	Wed, 26 Jul 2023 08:29:09 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C5910E445;
 Wed, 26 Jul 2023 08:29:06 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso9997975e87.3; 
 Wed, 26 Jul 2023 01:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690360144; x=1690964944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5hzLinp+cbw3J104D7KZexundulZMBGLcnRmGbBPM58=;
 b=BNZZUvg8hvFHE+NZIDNULpmkmWKtcVhnFO6EIvapeZ3pnPTal8wqje+tyUBgpkSykF
 xjfgx1ue/YwcOiRwEt9S1i5Nwhu5oBacPKM9WESrRJXIHd+e0RDN7BJs8iap9O/xtNoO
 ly+z6flydY3dDfDdSl2PFJ4dN2AS7CevDDNm1JZ4KGF8IQ7Bi7nElHWk9bYDBalNxBMV
 VD7UN74ROppIJpyta/9OpqX0gAw2e30oA0wSfXlg3ydOrKBghgBEhO5oO1iCdu3xvl2W
 2OHchmhOSWQIisRDUOqqvnHl/UmAuC131OtQyLvBODmduqGQ37FJmGhxKE8ThewbEtBK
 3YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690360144; x=1690964944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5hzLinp+cbw3J104D7KZexundulZMBGLcnRmGbBPM58=;
 b=PvDabjJwTulLSgcHWZ+WOQXK1iYUXGcHP8C4jG+Nz0PB6DBZ1u0oi9sVifn6+/s+Op
 7EeIjJ8/3+C3DVTuXRR7k1+yFNcQ5cFgcrtAYspY9ofS2qnfclxwjgXlml1V3GjF8NnF
 N9ZTQtFPbU3LvOcpMI2ylh0+z74J8n0P/FKS0Y6uE07Al38FxBBEOC9qPk663CxnTZk3
 DEXVdwitOJqSJxSTPRAQv0mptJHJp2qE+BpU78lcuQ+fyi2cpiuvrHyAqtf768zIWHwg
 fRAcPeMXqOc8N8aqXzKApRFB//fkhLI03rEYwGvACqSQt5xrZLpo3xkv94cBqyajnROK
 MXAw==
X-Gm-Message-State: ABy/qLbaA4hA0idK2uCzM1jHQnTLVr9gvIJFpbluxd6QRXHQBOmjgqBs
 ydH+jS0mN9yQTCMG51HX0SOV7kQrlHR0gXsGMFDTb1yhygplFg==
X-Google-Smtp-Source: APBJJlHsy82fqBabzd8uHw8k8Rp6+qsr8XtLgHzgeqjlD/6Rw1QyyYJUf5T1JXjMLnqiXGSZ3pYbQWqd/zFUBvLZ228=
X-Received: by 2002:a19:6710:0:b0:4fd:d3aa:e425 with SMTP id
 b16-20020a196710000000b004fdd3aae425mr783700lfc.27.1690360144056; Wed, 26 Jul
 2023 01:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230725205626.346256-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230725205626.346256-1-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 26 Jul 2023 09:28:36 +0100
Message-ID: <CAM0jSHNOjGrrNhxYF_8H-jYUNjMPKyPzBpVejKtKQC_1=i0AMw@mail.gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t 1/2] xe: Align uapi after
 removal of XE_QUERY_CONFIG_FLAGS_USE_GUC
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 25 Jul 2023 at 21:56, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> drm-xe-next commit ("drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC")
>
> Also this is the header generated with:
> make -j21 headers_install  INSTALL_HDR_PATH=3D.
> ,as it should,
> what explains some other unrelated changes that are appearing
> in the diff below.
>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Does IGT build here? The second patch is still depending on
XE_QUERY_CONFIG_FLAGS_USE_GUC? Should the order be switched around or
maybe everything squashed into a single patch?

Otherwise for the series,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 9 ++++-----
>  tests/xe/xe_query.c       | 3 ---
>  2 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 02419c1d5..1ea453737 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright =C2=A9 2023 Intel Corporation
>   */
>
> -#ifndef _UAPI_XE_DRM_H_
> -#define _UAPI_XE_DRM_H_
> +#ifndef _XE_DRM_H_
> +#define _XE_DRM_H_
>
>  #include "drm.h"
>
> @@ -180,7 +180,7 @@ struct drm_xe_query_mem_region {
>          * zero.
>          */
>         __u64 used;
> -       /*
> +       /**
>          * @cpu_visible_size: How much of this region can be CPU
>          * accessed, in bytes.
>          *
> @@ -246,7 +246,6 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID      0
>  #define XE_QUERY_CONFIG_FLAGS                  1
>         #define XE_QUERY_CONFIG_FLAGS_HAS_VRAM          (0x1 << 0)
> -       #define XE_QUERY_CONFIG_FLAGS_USE_GUC           (0x1 << 1)
>  #define XE_QUERY_CONFIG_MIN_ALIGNEMENT         2
>  #define XE_QUERY_CONFIG_VA_BITS                        3
>  #define XE_QUERY_CONFIG_GT_COUNT               4
> @@ -1051,4 +1050,4 @@ struct drm_xe_vm_madvise {
>  }
>  #endif
>
> -#endif /* _UAPI_XE_DRM_H_ */
> +#endif /* _XE_DRM_H_ */
> diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
> index 47aa98a8f..a4e40afdd 100644
> --- a/tests/xe/xe_query.c
> +++ b/tests/xe/xe_query.c
> @@ -371,9 +371,6 @@ test_query_config(int fd)
>         igt_info("  XE_QUERY_CONFIG_FLAGS_HAS_VRAM\t%s\n",
>                 config->info[XE_QUERY_CONFIG_FLAGS] &
>                 XE_QUERY_CONFIG_FLAGS_HAS_VRAM ? "ON":"OFF");
> -       igt_info("  XE_QUERY_CONFIG_FLAGS_USE_GUC\t\t%s\n",
> -               config->info[XE_QUERY_CONFIG_FLAGS] &
> -               XE_QUERY_CONFIG_FLAGS_USE_GUC ? "ON":"OFF");
>         igt_info("XE_QUERY_CONFIG_MIN_ALIGNEMENT\t\t%#llx\n",
>                 config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT]);
>         igt_info("XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
> --
> 2.41.0
>
