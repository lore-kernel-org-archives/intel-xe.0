Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29F1C79FAA
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 21:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE5910E512;
	Mon,  7 Sep 2026 21:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E4srLzoR";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D11210E512
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788814864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
 b=E4srLzoRT2lSFcaQysiCLk/7gYWQXXHBWble0pc3yRK0BKbcUWXlkkenZdQBdblXltv429
 aq23hN2ImYmLgJhVNpUkK9ErT/FV8Sa0bc3WYo3Bf/cgSD4jChuPK5MW4huzJs8Xh8G3m2
 v2U/A6AYyGRGC393cggcW25+9qGapb4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-3IBrGa5lO3mBLlP37Icvbg-1; Mon, 07 Sep 2026 17:01:02 -0400
X-MC-Unique: 3IBrGa5lO3mBLlP37Icvbg-1
X-Mimecast-MFC-AGG-ID: 3IBrGa5lO3mBLlP37Icvbg_1788814862
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49cc954a3edso30576355e9.2
 for <intel-xe@lists.freedesktop.org>; Mon, 07 Sep 2026 14:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788814862; x=1789419662;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
 b=lH6XMjasX2q48LkGz8Cy+FOgvajIL83N+t4SK9emRT8BjfvOlOP2p8rsOZTicInnJk
 0UUtcdilHA23w/++pInqfzKqu5l68PUj5PpqTQU3EXY0yULxp/5pgNHiXVIEXH5kUKgc
 emV+0WTKxPVo8JODrPebj4SVimlyzFg9KEyEOY5hJaNrB04fmer4OfvatrkxTiqE5Dhc
 RYeEqQJCFQtcY1/zEuuvM+7cd+6NU5m7PO9GcW9TJkkUs+7BxMw09TdKD1nWnC+FZcNf
 KRMaQQw7IHtNkx5vnbaTnKk8heDefky9Wajl6cHW6OyAlx0bF8z3KApF/52AYCHYX5m+
 kbAQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzh7TM1SI8sbhwQ2WnbI4V9CHeK7olPdq4zLqJQ/oJjx9xRqXH3jXNN8MSAX+1MFoaU0KaSg6UIag==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nWbiN+buPLNQ0UO/4gX+J0XnXpx/KpTkQVbDzZDfGdXDgIrEYB
 XP1MwFSGOJTiPZ1DwEW0Vv3LxZ5m7o7wWxgqSVTLgLEPemINno7e88pOI8lNKmwoE7U8x5NYJa7
 YDxX+l9xNxsIamssUfICtfB049gAeO3RPoESpErz4Hvq9znGw19s1FLjkv1NLJVqGUBnF
X-Gm-Gg: AYBFou3iRTEvuqAOriHnp+fA/JRrEa17CFwWMzlDznZocX7vS4Cv/cX7cmCjpqMybex
 LXGP3zW1unKTKMgY410HxKSfEJcZrXs7Vm9Le5QflyEmSF2q+8DCsFTfIZDk6OBhUjDrTJ56XKT
 8Xc2lzsqM9bz34qglCWTd9YTXGwDZGEcIB2JEYj3bpckaQ1kqEEMKe/2DVMj/n0rOKuk7lXJA0i
 COROOicrXK7XW913QHXmklR7zp03I9O2c5ZsHfQWitvlijllQ1kN7M9EWAJEB26n5uOSqqcIQur
 YaAj9nn7Xr4IicKDYKpN+T2gU2XAr4aXYFOCPoijkmCYrdI2IkWtvKpDZaFEYlkAP6nb9alX1yI
 4t5jd4ibG4QJzlSoIxZZxnikZT/K8YilplpN4eFQ53t5BjsfX
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id
 5b1f17b1804b1-49cfa20cd58mr167275095e9.33.1788814861708; 
 Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id
 5b1f17b1804b1-49cfa20cd58mr167274945e9.33.1788814861409; 
 Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9?
 ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cefsm458086515e9.5.2026.09.07.14.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 14:01:00 -0700 (PDT)
Message-ID: <b34807ad-6390-4804-ba29-43a407b3d9fb@redhat.com>
Date: Mon, 7 Sep 2026 23:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/panic: Do not use un-escaped URL as format
 string
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
References: <20260902121930.597222-1-tzimmermann@suse.de>
 <20260902121930.597222-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ko5_CbaL9Eo3yQPEJ0pPbOs8SSETwi32qwI1QfYdXkw_1788814862
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 9/2/26 14:13, Thomas Zimmermann wrote:
> Replace the direct use of DRM_PANIC_SCREEN_QR_CODE_URL in snprintf()
> with a %s conversion specifier. Avoids a possible vulnerabilty from
> a crafted URL string.
> 
> As the attacker needs to control the kernel at the Kconfig level, the
> potential for an exploit is likely low.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.12+
> ---
>   drivers/gpu/drm/drm_panic.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index e576c4791861..ba21df4be338 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -658,7 +658,8 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   	char *kmsg;
>   	int max_qr_data_size, url_len;
>   
> -	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
> +	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
> +			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
>   			   utsname()->machine, utsname()->release);
>   
>   	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);

