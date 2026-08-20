Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F90AC5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 17:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18D110F11D;
	Thu, 20 Aug 2026 17:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EdygiMYi";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2C310F12D
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787245506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
 b=EdygiMYilnj6D5hZKnPUW714eGnTFO3yG5CuLlMBX8A39srrEBOFMpFoW849G8GCOBGq57
 YxPVVvOKbLQgtVbjaJBCPiEVTvrdHE8P7hSYHMfFcJPeHv4mv8Skrb/Iq2DSsibWOGhD+g
 JRFAWW3ZBlzY35b5bNZ90PfSEQKM5Xo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-cwV6GZa0M3-CkVOWaSFxkA-1; Thu, 20 Aug 2026 13:05:00 -0400
X-MC-Unique: cwV6GZa0M3-CkVOWaSFxkA-1
X-Mimecast-MFC-AGG-ID: cwV6GZa0M3-CkVOWaSFxkA_1787245499
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-499a8039ff5so331345e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787245499; x=1787850299;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
 b=iJUFSicJ7nOqe52irwbqz2fYhRtLs3/AF96e7w2AHZtc5Sr4ujCVcmzErTeHWw5DSx
 MzjXjC6iwVUTbMlOAjpd4ELZ2BKREPS41LNm0rc4FLZXo9JzElXHcN0gJcDYq35pS/JY
 MBFjso2o71nd9zPVKovnYkl3cBv+uvY3Nm5OVAVd/OQxt+M78gaO598TJilawW0RLeXG
 2XqHhx7CvPpVjQnhO+mQWKjZFi9JEmOHZr5v4NQJWNflLytfHuHL1d6wkDxvYQnhNraa
 DZZ+acxoUjxQfXbrL2cjvLq7jXMFNFI7GxQXghx8kw6iPiXu0PE1i1hF4u81FkCcAyrs
 aZJQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrGEbccZ/Yz02WTyiDrkeu5MyrLQxJEa0krcYsbN1jK3Ye6NkFNRKcJXqPoiooUbULMOHEGipzpiw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxmfrh7l0Cn5kJpYe/BvkpZxHYWOuChILkHzeCw8udwqHK0fAt8
 6BPw18tHo9qiRP2pczz+6xqtGHd4r5eApZJQqsapduTKi2Yqav/0WdFu6EwIGOZgK/065r7TEk+
 oVbsiuJMrJKk0SyYPjmxod17DgT5QvfcTzpsUiPJFppCvlPUhId7iWwZMqJrdWvMTo8w3
X-Gm-Gg: AR+sD13PChXVOS75C+4lEXywdRa37pBOGBV5FFmJWuvDB85PmoUJwLAl14OUCRcH1gU
 +Gaj5OjbkkaxVw5UX5p8kPQDQ8p6JhZmu9UhGtB/rlRLonXWw8RpMxTymbSkG4a8UXEp+0001df
 CPzZ4XHt72dNtpPBm+hWctKekpQLbN+lcUHuAoV84DC0OiiEkr4Fdol4FvhX8sdZA3wL4qtEm7d
 U6OV04Y9kZWiMTZYJ6E21K95IJJreUk36GZXU1NPUUDfFXwg86IdSm1LACEvpxoaXpO9AVn33g2
 ymPIaf5sECAQ8I3vXr/R4b5jiCZtiyNvomFJM2Pir3nZNFyMrLDEXVpvcIrZKxg4UySfQBaHq4z
 XtSOnW0pPzAZ9hXJSBEKiPJgYisWLSH5beEq56doglW3OuQ==
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id
 5b1f17b1804b1-499b8465f7dmr5017145e9.10.1787245499119; 
 Thu, 20 Aug 2026 10:04:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id
 5b1f17b1804b1-499b8465f7dmr5015695e9.10.1787245498659; 
 Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb?
 ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c33b3sm13157002f8f.27.2026.08.20.10.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Message-ID: <cb784cf6-f3d8-41aa-9f71-c197a5eba7f2@redhat.com>
Date: Thu, 20 Aug 2026 19:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/panic: Return -EINVAL if font is not available
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
 <20260818125012.468092-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7XcffjF31nWOk72oObGoFic_i8YAgk9X1M2X6Ss6SIU_1787245499
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
> Font lookup does not allocate memory. Hence reporting ENOMEM on
> failed lookups is misleading. Report EINVAL instead.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 705b72bf0d83..96d238bfceee 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -757,8 +757,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	int qr_width, qr_canvas_width, qr_pitch, v_margin;
>   	u8 *qr_image;
>   
> -	if (!font || !stream.workspace)
> +	if (!stream.workspace)
>   		return -ENOMEM;
> +	if (!font)
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   

