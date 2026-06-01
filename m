Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A39CD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328A711316E;
	Mon,  1 Jun 2026 10:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JUXsIdCY";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4CB11316E
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780309740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rR3vdJBAgyYpZ/mB0zSfLOFP8KAbUlqalAgRbWXUhZ4=;
 b=JUXsIdCYHaMB644cVInQCANPZ3J0hsuIpFo9OftWktVVNg/L5qm2DFqWxonwfix0ooe6FI
 dAFBBUNWtbixWM/bfPZZE+L8f/GUm1bQuR2SMta/PAVaPOcizW/8X0wW+fAoRNpTZxl0SD
 pwuOyGGB1LpvOQuBcRh1j+4F933uuxc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-5WGTkKDMMYehG1vkZN8oYw-1; Mon, 01 Jun 2026 06:28:59 -0400
X-MC-Unique: 5WGTkKDMMYehG1vkZN8oYw-1
X-Mimecast-MFC-AGG-ID: 5WGTkKDMMYehG1vkZN8oYw_1780309739
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490479c2911so104322835e9.2
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Jun 2026 03:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780309738; x=1780914538;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rR3vdJBAgyYpZ/mB0zSfLOFP8KAbUlqalAgRbWXUhZ4=;
 b=rmilzBUmvti2yNgu9UHW3Ne+ssq7DvWv0Y92WHp89Q2cE9bta3n9cNo9MHFYSZieiY
 5TG33UaGSmEik/9SmqDpshz+7fcjEiMLEMYCBUtCp5tIiF0cwVPh5yzSA5mj2PCO4PaL
 BaoVF2UPfZVtdAex0ZF6n5CozdQUUjIobt/L342i3u32g/GxrccTw1mKRss/NprqeUdk
 PHIQNJ7fgnIAKIG7hMWGFh6xTqfFWoRjHXuDqDcnb+4otVFdCQX9OcnX/oxmoMhDX11U
 qVgyAJVJpaT1nCkYk9TIZLztlwQHfqEPZ5QMbEaKELqpdaH2oxKQxCp7+1G0sRS7E0au
 4NBg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+bYrzVvb6nPKYrjb8yoEpZRF5T1j52Ja5DaDTYrJjLKCx5YV5yvmvG2/yx3Tiw54kOBrP3uAXcuw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl1cmmsi7qlpm2t6J15bjPcGlLHEw5gKkhVRERBsTaBn6dh2mD
 VVa78cqsPfuqIr4bnnuSP1fhD9wPSCHR9Ikbh3tCeO+2kJ56hgTt9V9FDtYIWiLE3aurPtpOXeb
 iDejgug+zqyn2a/8OJlo6jjBuHiORM3yGSHOSoVxXwPhqj1r8LHaXXuc6p5fs47YaDQ+2
X-Gm-Gg: Acq92OG2INFryspVI0+79WiKVavr96j84WBHmiiEhezxbwvyikXtVKUXIOztqBxz+4K
 BdPvDCq1prwoNEjWWnAiH/vFtBEUE5aMkX7yoUluN1gIbr+5T0mnm+TAunYz0fsyp6lxvyFGXn2
 MQ7mE3DQYqv584mTBrCuQYVQAa5C5XidPhBe244dnpK1tjy3SoWefGA+JluRN89+Vn90F0TvnLn
 su4knbW6dafC1aZl2APpKpKlMZacDqNbC0A+pBSsHyaT6wYk2madtSvfp3USkEeBDy7um7RoGMP
 BpL93TdA4PKAp24bvSI4OdJ7Yw6KrbUwdwLGIuIChJqos26Orlv8Oi0FGwc8cVwK0udUOCQc/4x
 rP/D6uTHZPGTRlIUhEvK/+g6ppfroT1Denunbeiw6rjV0mkR4HnjxdsQj15+K4/TRZA0pxdhsJy
 44fO+Uj0lkmSFIBWw=
X-Received: by 2002:a05:600c:a214:b0:490:9782:3eb8 with SMTP id
 5b1f17b1804b1-490a2948f0cmr117371335e9.25.1780309738537; 
 Mon, 01 Jun 2026 03:28:58 -0700 (PDT)
X-Received: by 2002:a05:600c:a214:b0:490:9782:3eb8 with SMTP id
 5b1f17b1804b1-490a2948f0cmr117370965e9.25.1780309738117; 
 Mon, 01 Jun 2026 03:28:58 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ae3901cesm8445615e9.7.2026.06.01.03.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 03:28:57 -0700 (PDT)
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
Subject: Re: [PATCH v4 07/10] drm/damage-helper: Remove old state from
 drm_atomic_helper_damage_iter_init()
In-Reply-To: <20260530185716.65688-8-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-8-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:28:56 +0200
Message-ID: <87h5nmlfkn.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZBBSimr-jPExBJMZykiL16GawKkiB8DxuXMjqYn5NE8_1780309739
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

> Nothing in drm_atomic_helper_damage_iter_init() requires the old
> plane state. Remove the parameter and mass-convert callers.
>
> Most callers now no longer require the old plane state in their plane's
> atomic_update helper. Remove it as well.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

