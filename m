Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF168C5DF6D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 09:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FA410E11E;
	Wed, 19 Aug 2026 09:47:28 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740AF10ED94
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 09:47:27 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-66c82b32121so1421171d50.1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 02:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787132846; x=1787737646;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=;
 b=X2AlP8t2Kq0AbBwhdOehWMkOp3nuv/Ud0q2Lk2AlExo8Rbi4pUtaK105fYgHFzCr2Y
 insBk7kAPoeODwBPLWkZDYcwCeU6oI/dKfdzKwrTQWRN9RIuCDSq9+jxHq2NPVlBXBmf
 SETE1efSivoDUMW3Mkpveg75tTn43sLCds/gYaev50/rAefHuz6Yqn1nqhrQdWsd93ZJ
 WYGqEB6U0v1OcyiJVnA9pImdVsir7i9TMU4ct3iKgWLmJHTiuYEV6Oi4DwAWSNvxPZBP
 ts5rH+tMqtfetLRojMbdm89LRO7bWLvISFLsUeJG4+XRsc2ZlcknIhB8JomtaQvEHsuI
 Q0FQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoDkh4x7rzE/xKcZ/3NNuRJRep91j5cwnAaqyDl9YvIKwzkk9DOcNFDUoOUQHLZ2XcTmTLylm8JTw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kVIry9gQzqKHVy/UPCCjfTlpH9s+WKsmBVEVcQUI7nvaQfz7sc
 dfECmR6rO2wzFit9aVftnPJxWzsQ3TVOmgGMzOlfeZdW+1GQZQDyjxBPx51Y6h4YnJ4=
X-Gm-Gg: AR+sD13Tj/wEUYEIvtP6qEvQTqsprwkpPnWhIl3PcfmBuGl6RFrUquFvLYVbEtx5o35
 C64dTj3Ati6FHkpM72gj0Pvb5zslGHNTICznsMVBFVW2UDo1v7dnZ78ASYWdo7tTBJ32Oz4qUon
 1It457LVazOytR4WvyUxR7BhGx87LciCO4fWB1JiFeZmlmgD5VRLu/cmGI0rkz+CQ9d3mU2w45s
 Ufrah6UYP7croRMTfHJk/6mYaMBN9EhREkSWv2eCFLysge3rWRixgcEYFFqYt4J6fE93zRUM2RE
 O24/XXVqAaccDdOnTlVYUro/Vz7uj4rK6FimOXj+ErkyfoAyXhnaWMr3xMXckr5C7jKaB90xh5t
 IlRrFDuMqEizWltJUPmMyj5JRCHMBIlpfaPvDNDNSu277vHX7N/SWRIFL7zXZ1wx6QffEm+YUaA
 xuYHuFp89YPFCeQZu/LhEXfI6aBok2Y76bg+MicAXdupIRRlOPxBh44u3LZEe3EapD/MD4RsNBD
 swb5tXbk5H883D0N/DpNUQv8w==
X-Received: by 2002:a53:e706:0:b0:667:9481:5b37 with SMTP id
 956f58d0204a3-66ccb5e56cfmr940250d50.2.1787132846353; 
 Wed, 19 Aug 2026 02:47:26 -0700 (PDT)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com.
 [74.125.224.43]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-66ccb1737c1sm691047d50.17.2026.08.19.02.47.26
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 02:47:26 -0700 (PDT)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-66c82b32121so1421160d50.1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 02:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RrNT0ojg0o9gZQfvQXNRxdcB5pSoJ1ItU6Ihmgy1o/YOAGUTJAon1HubVYAdNb7Mb5oH3z/HxnOgA==@lists.freedesktop.org
X-Received: by 2002:a67:e04e:0:b0:777:ffe0:a10b with SMTP id
 ada2fe7eead31-777ffe0a6b7mr539021137.4.1787132346344; Wed, 19 Aug 2026
 02:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-2-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 11:38:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Uwr-MWNK1wEAyEr8Z9JNVhxk4jrnSNE7dazUpWIvLo30uHHQJP967oerw
Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/panic: Allocate QR-code buffers statically
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
 sashiko-reviews@lists.linux.dev
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, 18 Aug 2026 at 15:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Declare qrbuf1 and qrbuf2 as static arrays so that the module loader
> allocates them for us. Avoids the kmalloc later on. Also allows for
> using sizeof() to get the number of bytes in each array. Access the
> arrays once with memset, so that the physical pages are available on
> a panic.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -628,24 +628,23 @@ MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
>  #define WINDOW_BITS 12
>  #define MEM_LEVEL 4
>
> -static char *qrbuf1;
> -static char *qrbuf2;
> +static u8 qrbuf1[QR_BUFFER1_SIZE];
> +static u8 qrbuf2[QR_BUFFER2_SIZE];

I am not a big fan of increasing kernel size like this.
You may run (faster) into boot loader limitations.

>  static struct z_stream_s stream;
>
>  static void __init drm_panic_qr_init(void)
>  {
> -       qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
> -       qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
> +       /* best-effort allocation; can be NULL */
>         stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
>                                    GFP_KERNEL);

<ironic>Why not use a static array for this, too?</ironic>

> +
> +       /* touch memory so that pages are there in the case of a panic */
> +       memset(qrbuf1, 0, sizeof(qrbuf1));
> +       memset(qrbuf2, 0, sizeof(qrbuf2));

Please clarify "there"?
In cache? Not all systems have sufficient data cache, so it may be
evicted at any time.
In RAM? AFAIK kernel and module memory is not demand-paged.
In TLB? Like cache, it may be evicted at any time.

So IMHO this is futile.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
