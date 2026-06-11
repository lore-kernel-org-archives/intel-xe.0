Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582EACD98D4
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 10:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1991B10EE1D;
	Thu, 11 Jun 2026 10:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="higD+1i9";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C3710EE1C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781172782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dFYGrtWClhfZ3Q43+mH8yJXNZwovzAkM0JScXulojb8=;
 b=higD+1i98BrnfLJuByphXdnrz89UlhmPTU2QT1ar8h1/ZoTBFvkZ0/ew8kEBimNDRxfDz+
 Mdf70WvLwFUVs/na2TyscpfiAj6U2iHWlXoiWeP6PmTCrMpGbzaOY2F1KPuGS4OtSZzJtv
 8Cj3lopo6VHB+98EEw3f7GsbgnzJnoI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-YSoda279PYCN0TBxtqQSdg-1; Thu, 11 Jun 2026 06:12:56 -0400
X-MC-Unique: YSoda279PYCN0TBxtqQSdg-1
X-Mimecast-MFC-AGG-ID: YSoda279PYCN0TBxtqQSdg_1781172775
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490bfd70b0fso78222485e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 03:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781172775; x=1781777575;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dFYGrtWClhfZ3Q43+mH8yJXNZwovzAkM0JScXulojb8=;
 b=eITHJ6AbXxAexgbHUOeOhVnTPYuehClish5y+C6UH/SlV/Aep9aidT/zYd8knFhA5R
 I8zGeHtuXSqtLXFlobsRMphpNoeUH1cU1YMnfLr/0ZmcAv3PipC5cROZzrYQn4cBUl+e
 VO5V0u5c8C+fbNP1MTv1mGRNv6s6v1j0MQypb/ZIvqMk9UJ9D9w+5AiYwyJsCm8qrVMN
 ja297CvQEWo+RYvlcSU4oxqT3iQLT94VXvEeMnp/wBDTjdajs28dbrmDvkxJSjhyBcQo
 t7c7x5YpC6agRaPlEhu70+iLwXuFf+gRwJ+Xe65AwAD4IHAG6i8d+KJWMfhrgD6/aVio
 XINg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/H58mzna5f/w4/dtTrxaemS1YDaTtB3nuau382SJO1/t/moNu7PBpuT9t2Sf97kT25k21RM6FGcg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1QsyIgTfkfXUs8EhcSI4YnEyMYDRHw0aeLtiTo/urzfzJ5suA
 Hy99oQfULMvk3XWNqQ77o4pOeLAQvOckRDjNJC70dQ34rBLvA5uVGXN5gNILQ/apHol1FliTJPO
 1b6s1SweIM4w5qbjTgnyAyGrFjf0pZ5be74c45SUJyroawq1aXM/VCEjo1MBUbMZFfZ1z
X-Gm-Gg: Acq92OG57Mq9cNEIR8aJo9KijbX0yULSg3BxMmt3EnvhRYL5mIwK4R1GiPYJDSZHl5p
 8xTG0DO5w49DSmr4gT+k+vijJ8Xr/yO51XZTKpYf0IpNMXHERct3J2tN38Wuv/8i6gfbQc/5ciE
 uzMLgjFkYgr7c7BjO3KT6yoyFGzSughrNMueSSp0nTp9poVwsN/a+Ff4FznAxMFj8s8XqLf9tGb
 HrrkPPUiDUR5CN46TEAL5poZlvBbZCAOB0vXb3S5lLtqe2ZXpJg7dI0sdS3ErmxMG82oRvT2T9m
 2jp2b9wMrd0zGPrHc1inQLrLM6g2HPgW/eKwB+By+hHZSy6dHwG/zzbsHK3P+tmHd0H0kFpj98c
 VTUw6CupuQaTeaba3U8lZ/ahLcN8M8fD05rqzHXjBODMXPGaja/0guNE+Cz3unOnkQ4GyezWaFN
 TP495DrOr9RXe8Tfc=
X-Received: by 2002:a05:600c:c493:b0:490:a298:3859 with SMTP id
 5b1f17b1804b1-490e5639bf0mr26218665e9.24.1781172775421; 
 Thu, 11 Jun 2026 03:12:55 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:490:a298:3859 with SMTP id
 5b1f17b1804b1-490e5639bf0mr26217975e9.24.1781172775016; 
 Thu, 11 Jun 2026 03:12:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e532c778sm38051805e9.14.2026.06.11.03.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:12:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklkml@zohomail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5 04/15] drm/vmwgfx: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-5-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-5-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:12:53 +0200
Message-ID: <87pl1x5qsa.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6MY0ldfF7rOkSlg1oyszPVuPEMc8xU96_jUm3tVKnEc_1781172775
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

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update.
>
> Test the flag in the primary ldu plane's atomic_update and do a full
> update if it has been set.
>
> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
> to ignore damage clips") introduced ignore_damage_clips to selectively
> ignore damage clipping in certain framebuffer changes. Vmwgfx does not
> do that, but DRM's damage iterator will soon rely on the flag. Therefore
> supporting it here as well make sense for consistency.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

