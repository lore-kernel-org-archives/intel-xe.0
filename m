Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA34CD6E60
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF8011317E;
	Mon,  1 Jun 2026 10:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aHMId9WS";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433CC11317E
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780309830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m5PnIUHVz9ACSP+/e7SnC4cD1TL+Z3tg4EIuDM06718=;
 b=aHMId9WSwbesjz8kqCE8d2W72CjsRZl+bHJmWFLsJVqj37njL9OdQmSmx16nOK2fQ5gbQq
 QYBCHdP04s7uC24ygJZBA3ldmz9xmOjTUlLFAeJ/mR+OIwyfQNF+nkB6rNsURk0pp+6h93
 A9XIUTH9hpVJ3Koq9o6eQA020jQNbrg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-B87jetxsN6a6Oa4P9O6ung-1; Mon, 01 Jun 2026 06:30:27 -0400
X-MC-Unique: B87jetxsN6a6Oa4P9O6ung-1
X-Mimecast-MFC-AGG-ID: B87jetxsN6a6Oa4P9O6ung_1780309826
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-49045f93baeso68353375e9.1
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Jun 2026 03:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780309826; x=1780914626;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m5PnIUHVz9ACSP+/e7SnC4cD1TL+Z3tg4EIuDM06718=;
 b=ALiwNGBtMLrkESPP5JlKDVpXmjRLbSjoFyt9yRyWbAk8SLHh5ximCDaWAjXKP4zDp9
 jTutff9iCk1J5r3bu/IC+Mt67FwDTz8Rw2IQweMcpDxm+jGGMSEB1XPvjy7kx/GIZ7LM
 yj+YiIdYuNjYA9Be1IeTCwLHBeLG5ePSCjmXJSPwaQByiRQ/NpWxvhAU8yTqqfTiaesN
 AGmYQE5v5K4EJSyvEzIQK9ZB7g+mSmqM6ElWAfHhUxq5DRynyHts0UPcCzV/Rb0MY8X2
 f7AIfUCcckGrxLu+OHRGJfTfW1qVPKCoJMztAWE4M/gJfwPs4bOLLkfpq8G5f9TFDsdc
 W1kw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0Pzz3PbVHECs6Hn3N/qKXNiFivN/TVNHQcSH2GYkPSKKXkHLiJTEdHpVKWnwJbd7X7UE1rdXbpg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZmpqbZJcdZcclzs/E8RaMDfEPWkdULSpP25HClIjygQH2zQd3
 fgWwiMwHb1D+6Ona1O3cQX2UDqGW+eUL5y0uX3Xa93QOXhUN87GlF2DkwKFp8UUrajEZou5vY3u
 bJGJ6IpCfhNj7CpPiQwNMxYKl0rcWOCRL+FZlCG/nF86pHOoLxXpxYYbKFcTYc5M/FKGa
X-Gm-Gg: Acq92OFJtLAsjnhfIwiXDJa0ef+WGPMfQT6kmmTlwp5MnFgjbI5Sr9/ZPofKbQQVGWS
 FokI27CXgBzV5AscsLLQNwLki24ROBLWakcM1dlGu14H5D16nIJ7GubBvVeXqz4EXj9JF/ZMvex
 DnS5cxd3uAOTrbk0TxsHnL5qk33C1eGDuvHDjAxZ/T3ml5g3Kr9OAUD05cb66gI4egT3DoUBauC
 CrAi/Q9dx3TD80zsDhf+pnJOo5E1FpFNWf2aYRQooMPxGajBM1ys8EEvvfb3zZJcvxj/PZlGvu1
 p5eRTCcEgTLYPh1oP63/PxMHVkwI4vpM6ixWgyW6dtad67gKI9oUUlk0YmASCSA5v1URhSp9d/f
 tYdGjvoXj7en6Np1dSE5Exxk+it/vL8jjDAHRDJXkrTfinkI0gfU/8H5ZCkBzOWBPc8Y5dDsd+w
 xeWAE+5s8kwPRczfg=
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id
 5b1f17b1804b1-490a293b7c1mr147144715e9.27.1780309826053; 
 Mon, 01 Jun 2026 03:30:26 -0700 (PDT)
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id
 5b1f17b1804b1-490a293b7c1mr147143955e9.27.1780309825482; 
 Mon, 01 Jun 2026 03:30:25 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490adb4381csm24027695e9.3.2026.06.01.03.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 03:30:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklinux@outlook.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 10/10] drm/vmwgfx: Remove unused field struct
 vmwgfx_du_update_plane.old_state
In-Reply-To: <20260530185716.65688-11-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-11-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:30:23 +0200
Message-ID: <878q8ylfi8.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8ypIfk1oo4OggeFYOeh8o2jqfBj5qFCB6QGwyuEDUZs_1780309826
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Plane updates no longer require the old plane state. Remove the field
> from struct vmwgfx_du_update_plane and fix all callers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

