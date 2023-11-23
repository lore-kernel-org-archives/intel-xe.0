Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A685C5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 16:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A4F10E71E;
	Thu, 23 Nov 2023 16:28:42 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E495710E71E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 16:28:40 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c87adce180so12967431fa.0
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700756919; x=1701361719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8DsKzve2/aJKapvk9EfKI8hLYJEMCDDnl85IGVXdzyI=;
 b=U+UIWZZNPzp2q8mXx6RCA2KeNN3Tn5Eso9e9kXJhKeDjFlebG41MZoM/Oex1mZkiTC
 l3RvjqSTs339Jju/LvcMwSveR+j8Q3Z+dAqtvy02+OE/RIrstelsHocE9GWRxJXremv9
 yJeDaKXlYAd6rPN/FRHv0OR5u42KGmI2PtDEkL5I2OHYTCj+HxmNudgsz+WmPm/zOf8W
 9ksd4EZrJwYokzz/fCuX5NyM4BrwQzs9XSyY5zGsF8EyoztRYpRUnYJldbTIXqTQc5ko
 qTDSZ6SMky2H84S9C29B/8vOmnLzcA6wMsdNWW8TCNVo0o1Sk/C2nmmEjWf6q0Q5ULdg
 xoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700756919; x=1701361719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8DsKzve2/aJKapvk9EfKI8hLYJEMCDDnl85IGVXdzyI=;
 b=eO+WyhchqskExUlEQBLKml/45pJVssSdjB/EYOhQ/7TkZsdn/94gCIQ8Fa0JVRBiWZ
 1Yo9u5KNMonRdo+qYt4IQd0Xh32aqgBsyiZuj9eTGa+OOBVk2VcN8yOdl3ap+JLK6oRe
 uLMSG9HzoYZluXiStQfszVSPHqUA39bMubvlpIzywVZr34MKzSj+KJwXuZQTNobhpX16
 5n7KXP1MpoXu7zBKa2LBI6g0APjhvnKRwFqqEjxQt3DNX0q2v4EKyK5lBL17Zo9sV1j4
 6xTApVuEPIS0gWMfEDSYu/8i4pJnc08l2x4iKNj0EWUtEUNWkNlfMdDWd2pCd+xsp1DN
 Vmnw==
X-Gm-Message-State: AOJu0YzlCiDxQ2EKzS+BcAnJnsT6jXWTM8tPSGLBjN8KOsSNVDMLgPdp
 tIHu24wSKKsi0TaNTbRg8V+2Pw6cxvQj9Ttn9VZjNGD3Rao=
X-Google-Smtp-Source: AGHT+IHkmoFTFa5kDHOmiyTN/qh5vUixRJTaohbK3zwR5u++BppsnZ9zYm0EoXrCIqoim7Jr38oRYMJ9F5ZWR6elYNs=
X-Received: by 2002:a2e:6817:0:b0:2c7:426b:5028 with SMTP id
 c23-20020a2e6817000000b002c7426b5028mr4299500lja.2.1700756918741; Thu, 23 Nov
 2023 08:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231121100906.3587649-2-himal.prasad.ghimiray@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 23 Nov 2023 16:28:11 +0000
Message-ID: <CAM0jSHN+Tz9KhhsHcKKWebEptZZs-+NMDcb-VTAVZwibmhEdtA@mail.gmail.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [RFC v2 1/6] drm/xe/xe2: Support flat ccs.
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

On Tue, 21 Nov 2023 at 10:01, Himal Prasad Ghimiray
<himal.prasad.ghimiray@intel.com> wrote:
>
> Enable flat ccs for XE2_GFX_FEATURES.
>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

I guess this should rather be the final patch in the series, once we
have it working?

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 682ba188e456..d9754f3d45f7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -157,7 +157,7 @@ static const struct xe_graphics_desc graphics_xelpg =
=3D {
>  #define XE2_GFX_FEATURES \
>         .dma_mask_size =3D 46, \
>         .has_asid =3D 1, \
> -       .has_flat_ccs =3D 0 /* FIXME: implementation missing */, \
> +       .has_flat_ccs =3D 1, \
>         .has_range_tlb_invalidation =3D 1, \
>         .supports_usm =3D 0 /* FIXME: implementation missing */, \
>         .va_bits =3D 48, \
> --
> 2.25.1
>
