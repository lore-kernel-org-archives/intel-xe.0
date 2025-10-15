Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8FCCCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 07:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328C510E750;
	Wed, 15 Oct 2025 07:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YK/ErJOe";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D204910E754
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760514802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
 b=YK/ErJOe4ySVCbEZDx7t4Rrs+YpkmUaM7i5Nz8Y2h+86ClpnfCycAlli2dCvg0nT/gT/JJ
 JBDBMlxp2hivbyqDWvU/75CgrhsccnHK+b3Xj3G3Jc+4XlwhYzO99y2bT356rpLEV9g9et
 FVX3f1NwA3XVu1jQxknmOcCO4r1UFG8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-q2HKLXSyN62LGlKa9x3Vpw-1; Wed, 15 Oct 2025 03:53:21 -0400
X-MC-Unique: q2HKLXSyN62LGlKa9x3Vpw-1
X-Mimecast-MFC-AGG-ID: q2HKLXSyN62LGlKa9x3Vpw_1760514800
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e509374dcso27163465e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 00:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760514799; x=1761119599;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
 b=Tsndbo3BiLA3gVyTgayLg5S5T4RaAa4kUqa4IPyXgbTEdWr+EhJly7dJmZXDQpn6EE
 lYhLdEslKjEZe7ZK9VYAEDC79m/x4ca9Y3uQU861qsIt71FfpMji8fRa1v7SAwr0bd6W
 UBw/WMrM6bIFjEk6ii5NcT4/UYWQjpw37Mbvy2nTzNuV8fUMp874j+BQHYZWE30wbKyB
 GWA+aI0eokDTXsstbfW0Sm5zVaY3I5a0M5HVCfEhdok+/sv0c5gn2ksKIHJmYE9Pre8J
 WKQnHQIR52fCYD+9/53UUIpuA6xx4Dfim2oz5LR7YNrSWLDCmEYBOk9/JVaOVDgseBiC
 h9XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPMBy8+vHeO2oWErWfP8q1MStQaORUPOxzqyLQJGQkrRHvoiy7N9+i8tj0oP/s1S2/M1OyMznAmA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvYWg8qEL8dctxtgcXZitUrknDjNhJUSI99FGNUDYm3vYtTlY9
 KFYfhnhTqKe+bcwE3j4sCImbZn53SwndKhzD6mARv+gYMyzn70wNrwOPKrI+ue/Y1iWDIOJQPvG
 MIR/RCEdGVz2gkRCvOEXNs+5iUNmaFbr8SqnRromaw9x7l1X5m4UsvA2kAFJeqlMBFWjGWfs1Wl
 s0Pwg=
X-Gm-Gg: ASbGncs8IWePjz95RvNtVW5wXdULFa24/VBR3vNhe2oWXxx7fLWilYDoiJa1W5V5rPy
 NCSVuXdAjJe1rH/0LV+XwpoWGYj/1552+FibV3g9J9UhrOQXJ5z4imlF9zr191A3FW63D+holnn
 5LcfmSx4MGGm0UliJeQ4vPwVw4M9nZpfstLMpKg6+OhqswGuRbmfWpJeyyH1DcvG55bamEf2Brr
 EFt/KbY5GtWQC4faPeBag3dV1oEA7x0Ptsu1l3dDoQL3X1B6K2yXhgWHNReSkD9mXsEVAQucg3d
 HU/wlcth++yI2xmtUTH5Xq9vgj4W/VH1IKkP9bOWOgDyFDK58a36nlypnEUba1/hRTQgWqqeLby
 9mhxT
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-46fa9b11746mr202661485e9.36.1760514799495; 
 Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZf7d9TK63edfjPsh4LrX74Y6wRlhtOgKLsjlyk6mKGtY9U4BbM1bQ2mcLbjosAJUslcGWjg==
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-46fa9b11746mr202661265e9.36.1760514799084; 
 Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47101c21805sm14875785e9.10.2025.10.15.00.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 00:53:18 -0700 (PDT)
Message-ID: <c256b8d9-ec9e-4841-9136-1198ad2d590a@redhat.com>
Date: Wed, 15 Oct 2025 09:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/log: Add free callback
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oPi-3kqphZeDTyNYcuEO01NLh3Q3yVvwN18JDVc2RGU_1760514800
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
> Free the client memory in the client free callback. Also move the
> debugging output into the free callback: drm_client_release() puts
> the reference on the DRM device, so pointers to the device should
> be considered dangling afterwards.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 116e0ef9ae5d..470df4148e96 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -293,19 +293,26 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
>   	}
>   }
>   
> -static void drm_log_client_unregister(struct drm_client_dev *client)
> +static void drm_log_client_free(struct drm_client_dev *client)
>   {
>   	struct drm_log *dlog = client_to_drm_log(client);
>   	struct drm_device *dev = client->dev;
>   
> +	kfree(dlog);
> +
> +	drm_dbg(dev, "Unregistered with drm log\n");
> +}
> +
> +static void drm_log_client_unregister(struct drm_client_dev *client)
> +{
> +	struct drm_log *dlog = client_to_drm_log(client);
> +
>   	unregister_console(&dlog->con);
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
>   	mutex_unlock(&dlog->lock);
>   	drm_client_release(client);
> -	kfree(dlog);
> -	drm_dbg(dev, "Unregistered with drm log\n");
>   }
>   
>   static int drm_log_client_hotplug(struct drm_client_dev *client)
> @@ -339,6 +346,7 @@ static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lo
>   
>   static const struct drm_client_funcs drm_log_client_funcs = {
>   	.owner		= THIS_MODULE,
> +	.free		= drm_log_client_free,
>   	.unregister	= drm_log_client_unregister,
>   	.hotplug	= drm_log_client_hotplug,
>   	.suspend	= drm_log_client_suspend,

