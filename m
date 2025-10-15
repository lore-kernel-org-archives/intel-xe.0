Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF099CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03B510E738;
	Wed, 15 Oct 2025 08:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NUcmgX8b";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAED110E738
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760516451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=;
 b=NUcmgX8brJO7rulW4Ec3TcnwfLgQR/rMylIYD6rsze3ztSr/VTqFd7ZppczCYQUbyygOJu
 /HiamGW+a3ppHJUKqZIcjLPBZm1X49URXqQcVZRsYp0W/VoIYf/caOpu0Z3gqnjKuNDR0+
 T7ecxQVjvRBYkTGw4ikYdNShaNjUDeg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-AtR-FhErMYilVW2WdvMxfA-1; Wed, 15 Oct 2025 04:20:47 -0400
X-MC-Unique: AtR-FhErMYilVW2WdvMxfA-1
X-Mimecast-MFC-AGG-ID: AtR-FhErMYilVW2WdvMxfA_1760516446
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4710055d00bso1957485e9.3
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 01:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760516446; x=1761121246;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=;
 b=s3itI14fjvkx1z2OZ8Su5gu7qS/9AT3XFpzx/9Jn7iFDYdb2bXICKV/yFG6lfye4eS
 gISElZ1zV2BWr52ffdbNvVqmWHkfQLlkQ1PQ/JV4meX9uIhbWCoTu7cMLRHyMXDqTM3k
 nWfZt1+W2IC2/XMF5KB+S+B2TfLUVwa36Q1reHvQTyiYTQ+YsXJhlpdl908O0FfLWucL
 mdw8PQ9zI0WituGEpxNkMw7/qf0BF2aW/8z4xmDYfIgZbHOWHlOvudbZFY0Oh4GbotIp
 BsWO4zwdAzRKwhVp7+K5LmSAclxwNRCHZb25ZP2Ac7JnTGnHPF2l+LepMvtHWo6+aQAA
 Kujw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPmDpmp/0o+7THpk2MJsct6uemxf/4y3GxOP+6ojH8aFDhSrhlXaULLeYYAkBs56UiAgzlaZlwfQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNqti6ofd9LaZRwKoomfiPgNm3rksQYMV2KXXlUCBpogsoU9yx
 d1CbgoR9Wt5wgh0XbrQC77p5L2KOEC8DNz94gDZHUnBJEB0i6DE1KY2J1QURTa64yIK2PgujWgM
 sPXYHuLOH11vOXO4ze5p/odNGOqNKsaF7dGzmPpfu+Q2KM9TsWK5wVYnGSxl6fU5bsV1Q
X-Gm-Gg: ASbGncv7cXQ0J/y8OJurf2+1BcSuyLrX0AFZlIVe2pkJW36xjpCvU2dzxBj1Bd9dAaN
 c5+G+pdcImSqOnW3krGOaFxp0QauaF6vgXVKGl5iqLakzjMWPNv4So10H3opOEv7kkAbdmk/4HI
 6mqM/u2JKPgV1gOujwfgJBMzn02xSsovb/LlrP9vZ9NTRh2s8zepPdFDA+8t68MZIeXbNy2SwQv
 oGQMucuODnLBX0OyKIM26oJxGnTTVMi82fVbOJAnkcWusoBKgdQnPbQPuJpX+nANFwBSJCtGyga
 SwGjObuqN2GiB6CmDqRB5rJDOPibOxf9RaY6ORJc5wU0Z8yBCtJj+HR/I97SHowkEN9S1CzcrVh
 7JgaB
X-Received: by 2002:a05:600d:41c4:b0:471:7a:791a with SMTP id
 5b1f17b1804b1-471007a7a96mr9522825e9.7.1760516446522; 
 Wed, 15 Oct 2025 01:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKG0piBaN7As1r+PD/K5QtUV2Z28HHZlEUD35iBfCWvoyf69YaDGLCaS5NwDRxAhyjJ4bu3g==
X-Received: by 2002:a05:600d:41c4:b0:471:7a:791a with SMTP id
 5b1f17b1804b1-471007a7a96mr9522475e9.7.1760516446097; 
 Wed, 15 Oct 2025 01:20:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9absm327503135e9.2.2025.10.15.01.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 01:20:45 -0700 (PDT)
Message-ID: <c85d528c-6787-4023-8883-3519b7498627@redhat.com>
Date: Wed, 15 Oct 2025 10:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/client: Do not free client memory by default
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q0BlYOUoO26yiyuR4V1CazY3tBL15YJjWfdh8ZFAs1E_1760516446
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

On 09/10/2025 15:16, Thomas Zimmermann wrote:
> Make no assumption on the allocation of the client's memory. For
> example, amdgpu stores a client within another data structures,
> where it cannot be freed by itself.
> 
> The correct place to free the client's memory is the client's free
> callback. All existing clients implement this.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_client_event.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
> index c83196ad8b59..f36fe0392ce6 100644
> --- a/drivers/gpu/drm/drm_client_event.c
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -39,12 +39,13 @@ void drm_client_dev_unregister(struct drm_device *dev)
>   	mutex_lock(&dev->clientlist_mutex);
>   	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
>   		list_del(&client->list);
> -		if (client->funcs && client->funcs->unregister) {
> +		/*
> +		 * Unregistering consumes and frees the client.
> +		 */
> +		if (client->funcs && client->funcs->unregister)
>   			client->funcs->unregister(client);
> -		} else {
> +		else
>   			drm_client_release(client);
> -			kfree(client);
> -		}
>   	}
>   	mutex_unlock(&dev->clientlist_mutex);
>   }

