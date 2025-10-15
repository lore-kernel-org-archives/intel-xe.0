Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB5ACCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 07:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F5A10E733;
	Wed, 15 Oct 2025 07:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KU1ZYWOy";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB1F10E748
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760514765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHykXUHzy3P15VrWtRxCqfqVXwzZ2Ylga+RWIrK7dZE=;
 b=KU1ZYWOyDIwp4S0YN5O9G5v4PiTcyS4tN2OQ/zFd0tL87xUu7N5utJO4rRX6rfjM5Tep26
 Bu+ls5UIsYWtXP0m1ccwoy7RBnvhQu42i7X6UWwHXKRfzSKKL01F0/My/kbWlUsQI+uqgl
 mdqwvQiqrlRTGWgul8yBE/ZqBjORHc8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-LHTYIpD1PgGylmY5KK9VzQ-1; Wed, 15 Oct 2025 03:52:44 -0400
X-MC-Unique: LHTYIpD1PgGylmY5KK9VzQ-1
X-Mimecast-MFC-AGG-ID: LHTYIpD1PgGylmY5KK9VzQ_1760514763
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-470fd92ad57so5978325e9.3
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760514763; x=1761119563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MHykXUHzy3P15VrWtRxCqfqVXwzZ2Ylga+RWIrK7dZE=;
 b=KR5kvHzHf1pmHBnoiB5UTH14PdEElkqK+OcNlCRRHhqPRy3rxvMjdRCeu148Fx1iR+
 W/mtjY1eTYsjjHmy9BdjtKH5sMQq41fjZJspoo7fPef5ebgNoIwlztgSrswYjNZJgOgu
 NZcIqyQaJATEtf1dSfXC9QrSjFmWAmIy5Te7aOo8KKWyuYoShmCoIjYzGr1UdkjlGm62
 TsjS1xIkWpHNMM8xzvTce0Oruwt9aFWTRLh2ZXK8/rtnZ4PhF1QROePyuw4qCSnDWrtR
 Sav35JF5Oi8hBayEMbByDgUOEZnprYhlhweKZx+ex+h4bg+WyDTJRnzsqPgJyl1jmQGn
 2q5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO+rZfvmovb/ErbSYHO3cRBpxGdlY13IP1q6wAJ/UPJQsPDbIjKBbqXFeBeDnorO5tV2arI67SJA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYjbwkmA0s//mgYhsiRPqtG03Z2pURO9QNyzdKGg/8sHjMajKu
 blir0G8+hSzlxp6wa8eFGJD9ZfEBpdDRa0JUNiHLHke7+UX0iG4DBmkEhnZ/sV7unyLX0LM9aj4
 nvZ55ScpA6fo2EormTCTQBpjF5OFbpOJGtFq4B9E5eL/+x13qv42hoDlw6xxCBjQrApoD
X-Gm-Gg: ASbGncs0wpkGKFDkAjatMg3pcOLx+EZvF0wBbBfgBgMiVw7pN+ZAQE/sNNWll4kk62p
 P9gtZPvVfwiJM+8ZgLpXgcRN9yCKWlx/F3IYo+Ib00w02bXD7ImDmhEdLuxMbi+Hy+F4S6SdgXr
 o5rbAUNxHuwArMX0VenSOGVXePwdu5TSR8BKqftMKJERSmmkwuDqDWnDeflLh3kuNdqvUmjf8E6
 14p/oPKish6bsH1lKaaUNafzeC/vgaITfuU36BRBW0bH4iEOkFIpvoHSshQOve032lRCmAKQkrk
 sOADAbFNLOj7aVD8riiWhSvv0xvmll+AO6lVbQ8RWdudvX6eYZsitgIJHquGRr93XZXQT2Re93q
 cwLkb
X-Received: by 2002:a05:600c:34cc:b0:46e:59dd:1b4d with SMTP id
 5b1f17b1804b1-46fa9aa2076mr211303495e9.16.1760514763146; 
 Wed, 15 Oct 2025 00:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW2ZDBPJxUfYCX0H6nLEKOLye2i61674dJQY/ZLYYwFVcv5Uohdp1HeQRReQYkGVWqF+Eh1g==
X-Received: by 2002:a05:600c:34cc:b0:46e:59dd:1b4d with SMTP id
 5b1f17b1804b1-46fa9aa2076mr211303305e9.16.1760514762767; 
 Wed, 15 Oct 2025 00:52:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47106fc97adsm2155395e9.9.2025.10.15.00.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 00:52:42 -0700 (PDT)
Message-ID: <3d07c6ba-02d6-4d3f-8684-65a41b128539@redhat.com>
Date: Wed, 15 Oct 2025 09:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/log: Do not hold lock across drm_client_release()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pTmUGWdhrdC49RuaV3I6zF8g7NfQRPUHEBrLU5MmW6E_1760514763
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
> When calling drm_client_release(), the client is already quiescent.
> Internal locks should therefore be dropped before the caller releases
> the client.
> 
> In the case of the DRM log, concurrency originates from the console or
> from client events. The console has been unregistered in the previous
> line. The caller of the unregister callback, drm_log_client_unregister(),
> holds clientlist_mutex from struct drm_device to protect against concurrent
> client events. It is therefore safe to release the client without holding
> locks.

Thanks, I agree, it should be safe to move drm_client_release() after 
the lock.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index d239f1e3c456..116e0ef9ae5d 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -302,8 +302,8 @@ static void drm_log_client_unregister(struct drm_client_dev *client)
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
> -	drm_client_release(client);
>   	mutex_unlock(&dlog->lock);
> +	drm_client_release(client);
>   	kfree(dlog);
>   	drm_dbg(dev, "Unregistered with drm log\n");
>   }

