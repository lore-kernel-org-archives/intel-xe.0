Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EAFCD6E56
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B033E10E75A;
	Mon,  1 Jun 2026 10:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RIGsXs0c";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F0010E75A
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 10:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780309314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cbduX2ADEGxdwqbVWpmygVu5C4B36x/+bcdfT1PUUqQ=;
 b=RIGsXs0cMKBwTnwVFEDAV3//WaQHg4zl1hpNPIfMrjpEzy3rLECIG3LmunqKsOsJkxE6t0
 3ZAxZPTVZye63+jVfJkCDY+0PRzolwkM2O6mvdMiSjloYb7iD9r++9tZ75H08b2whO3c0D
 NpXQYyWcqYyGOFbpcDLsVH950JSYlEc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-nmdzJD4hPLmMHLwA10JMQg-1; Mon, 01 Jun 2026 06:21:53 -0400
X-MC-Unique: nmdzJD4hPLmMHLwA10JMQg-1
X-Mimecast-MFC-AGG-ID: nmdzJD4hPLmMHLwA10JMQg_1780309312
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-45ef2bd566bso1641050f8f.0
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Jun 2026 03:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780309312; x=1780914112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cbduX2ADEGxdwqbVWpmygVu5C4B36x/+bcdfT1PUUqQ=;
 b=AxAMxLlcx9rgnIEmAd/Az1VkZrmvqkS5sjoC/y/j/+BQduzXsABupH6QnZyfqXbjh2
 OjrhF9tS1ZRBJej7DFe7vOsh6ld3my9wnd3sbYqmZHa2C9Nc4yx7p0fT4d/Mzol8lIFr
 xQMdMkRbx5TpXbI9XQ8E7GSrabGRGtYsd6cLvoFKCY7PAP13I7iUrstVtYWgs7yBCDvd
 +NNXVvjBNl92KVlDL7XbMAR/lyd5gH2izOgi/HGblX+PBuasVr9jOWbI3PQfdZOCePqm
 zcU/UZv2uVlVdrsDlo+M9cWKXiSEGNriIcoZzyTwc3fATTLaZWcGRU5nWnVudGRzmyJg
 U9tw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+CDt2L011L5nZhGS4OmkVOVKbrlXOWNNE28dY44jW9a808GPgvRgD2x/swxKDaTWj8FUT8oUSyUg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1zrWPrGUrN/3r5utQWqF4/eIGCc6teDcW9co+Pjz15S/3XtZ0
 WJ04OqUtD2sNnUG9Tw21HnOxeL5basyx/eYhPE1ov+jwfBUFvhca2pkryIFN0TyhD7yzZAaFPh8
 T9cXcmConun/5o73h6qNrIKZkuMiD/r2qM/O4eRUX0RkPIqlStgDVRzC7zQ9FfCQqaZQi
X-Gm-Gg: Acq92OEAuMujw5iFPOIf57h6EqtQLqf5DJTOxENNOpKHK1BzxgO0w/AVQTzDznX7S5c
 mRk4ta+aE3gI2H7wUai2ZGZiZpEocdsWf1rRHEL3rIy98nYv4HJA1lXqsUZOOYLGtHURt3S5pQm
 +E9w2hozg9oW022iOFlQiaf5bCOTRcS0nXNqUfu3A0itFfA1nFkDqAzr/9Z/1kUN0EkJA9N2LBr
 5Xu/bQIcJtgLAgzYjA2HKT4wX8PXP8caKOYce+NzLFsBoJ5TDVZ04hjh66avoMGNRfhPqEIuLRB
 3s5mN1w08u3d+3h4rg4JLW4hpHTf6AWR0RhEsaNRt9ed249RUk7n1qf5+Fj4qa8qUQ+hqpkkERB
 DRTKhYG50Oyvb+iGhelNw38IS+axs0FUoLvxx3UF3hKV3hMul2+vfI6/wOq5TDNMDr7U2lm2PX9
 vm3U45ny+xT0lDuM8=
X-Received: by 2002:a05:600c:a415:b0:490:60cb:55f0 with SMTP id
 5b1f17b1804b1-490a292febdmr182719135e9.21.1780309311975; 
 Mon, 01 Jun 2026 03:21:51 -0700 (PDT)
X-Received: by 2002:a05:600c:a415:b0:490:60cb:55f0 with SMTP id
 5b1f17b1804b1-490a292febdmr182718675e9.21.1780309311464; 
 Mon, 01 Jun 2026 03:21:51 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68a925sm366735475e9.2.2026.06.01.03.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 03:21:50 -0700 (PDT)
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
Subject: Re: [PATCH v4 04/10] drm/appletbdrm: Allocate request/response
 buffers in begin_fb_access
In-Reply-To: <20260530185716.65688-5-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-5-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:21:50 +0200
Message-ID: <87pl2alfwh.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vgAUXv5sJ-gr6a4WjNEIrPCUDzXkf-1Nu3MGgJw5IsU_1780309312
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

> In atomic_check, damage handling is not fully evaluated. Another
> atomic_check helper could trigger a full modeset and thus invalidate
> damage clips.
>
> Allocation of the request/response buffers in appletbdrm depends on
> correct damage information. Otherwise it might allocate incorrectly
> sized buffers. Allocate the buffers in the driver's begin_fb_access
> helper. It runs early during the commit when damage clipping has been
> fully evaluated.
>
> v2:
> - allocate before drm_gem_begin_shadow_fb_access() to avoid leak on error

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

