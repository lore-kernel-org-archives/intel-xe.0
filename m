Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B80C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 17:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA0B10F14C;
	Thu, 20 Aug 2026 17:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Fv6kLMK8";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8269F10F14C
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787246138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
 b=Fv6kLMK8G/0YI+OgDO6OT+1+CB7IOQaM18XkcetattfkWPsJdhBoBgKJqp5wbe1qSzaUPG
 QHmamFjVmrxc0GbgI+JC9pE6LtjIbmDfChCxVbC+YornCl7Qz9XKoMkjaCpg15VfrwvXTE
 LzQvGyipqegr1xh9PdHZGZVECrVjcVM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-0ioOEa3vNjCtzIraOu3pww-1; Thu, 20 Aug 2026 13:15:31 -0400
X-MC-Unique: 0ioOEa3vNjCtzIraOu3pww-1
X-Mimecast-MFC-AGG-ID: 0ioOEa3vNjCtzIraOu3pww_1787246130
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49571407d1dso447245e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787246130; x=1787850930;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
 b=WHx1saz3/LnVQpxl1xqt4jlS75gDIJfERMcV9xDBNFH02Ok0Wju6FALt3CKSPfvFXq
 A0XWEAtIp0TI0N4DBS8rZqKGKQMJLF+woiHRvgvuTcL2/70Zl3GA2rDiOycW+SNnm3DY
 4bEXLROVAtBC43qTQTsQncILMKK8K8GFmI3wbU8KtBkGL/gD+J/UPDmZ5sNUWz0AUCtD
 OEud8AAAeNhV2nqoBtB2rJ67IDhC8ksfFB7w80bx2/SftVzT5msrP3hvj2yn6fFFZz11
 Ses6wBtafShibGLAKcDAp+WS+fW0gon3tLlaYcBfcvws5K9C5jZw9569AO7TL/5fZUXL
 AcjQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqHZSWlBr/WoY9G9NqYCWp2V6jRJuWgXyleA4A/HMfCGQwWNWU/K7glCeObe7GMecSBQ1kS4DQ1eg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEe7ACW/B3ae9PiEmzzjRhcelnmEyAQ49MRBQUy64u78bNzZRo
 ggHPfwySvSwy4dMyB6F1zR/ecEwjhgd+lT3xXZBk8PkLUq3wr9318jBLmumAtojVuuvf2dq4WDL
 7wNEAhPXenXNZ3mqg9KyMlZmaPYzQcUFRlefQNiBu6braGhfdm1r25fYvwFcqzGa8MYgK
X-Gm-Gg: AR+sD13jtyHQqrfhFXplupPN4qMe7LrpQfTx5uYayxq6wg8q34MaPwPD49fHCv8NvrW
 J/JqWWmrpP270+r289dpTfqmgBLDXS/8AjjiV0dy6W6h8PnKOdUmjV4NtOBPZj7HT3LJjfcTrxZ
 t24aAxqrwGYfLGcTTBWLcNhE23M5Ibvcx6MQVfO3aDJY02wf6ptKsyViGqXmqzij1MA/8Z78qUO
 GVRB+o0onMDZ+809n18fcUID9mnzhNdoe5bVHfEyZoiB8vMrppDNzB9VGGTOsCr5w+D5NyLGQKL
 cdJ4x4gcbIDCoDbKqzO4u24k/H+PGAU3wUlo9QiIMrkX+NKYIP6umtHHNQ5jCwoanc0/oMqQt8C
 mWu9JMNNkfcIAXVycBtSgm3IXIvnhjK7jYVR22dRssduRBg==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id
 5b1f17b1804b1-499b845c184mr6845935e9.15.1787246130483; 
 Thu, 20 Aug 2026 10:15:30 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id
 5b1f17b1804b1-499b845c184mr6843265e9.15.1787246129216; 
 Thu, 20 Aug 2026 10:15:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb?
 ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14514d5sm14505430f8f.10.2026.08.20.10.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 10:15:28 -0700 (PDT)
Message-ID: <dd1da602-675f-4b63-ace3-a23e55ce549b@redhat.com>
Date: Thu, 20 Aug 2026 19:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panic: Retry in dispatch function if panic
 output fails
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0uhdAI9N-uXJgqv7A3JbvZQMbFlVIp9ya9j4zHzRfxA_1787246130
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

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> On failed output of QR codes and kmsg buffers, fall back to a user
> message. QR-code output already did this internally, but now formally
> support it in drm_panic_dispatch(). Streamlines the existing logic.
> 
> Also pass module parameter drm_panic_type as a parameter to
> drm_panic_dispatch(). This simpifies the implementation. It will later
> allow for moving the function into a helper library.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 12c39217cbcb..0960750bfce2 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -746,9 +746,9 @@ static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
> -static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				      u32 fg_color, u32 bg_color,
> -				      unsigned int qr_version)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				     u32 fg_color, u32 bg_color,
> +				     unsigned int qr_version)
>   {
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
> @@ -816,15 +816,6 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   	drm_panic_blit(sb, &r_qr, qr_image, qr_pitch, scale, fg_color);
>   	return 0;
>   }
> -
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				     u32 fg_color, u32 bg_color,
> -				     unsigned int qr_version)
> -{
> -	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
> -		draw_panic_screen_user(sb, fg_color, bg_color);
> -	return 0;
> -}
>   #else
>   static void drm_panic_qr_init(void) {};
>   static void drm_panic_qr_exit(void) {};
> @@ -899,13 +890,22 @@ static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_typ
>   {
>   	int ret;
>   
> +retry:
>   	switch (panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
>   		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
>   		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:

