Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC29CD6E56
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F964113172;
	Mon,  1 Jun 2026 10:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VVzTeCBB";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B72113173
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780309776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NR4sOBYtM0bZ0iqX/XjOc3nz+SGcL1hWjzs/0wJdl4Y=;
 b=VVzTeCBB+XKcHZMgzGwahCNp4+EYzp+4+IpGFwTNzk7IwCk4FqTbvmEs1YZ4CEm8zm14N5
 KmXILOGcEGk9mrcL9y2SYs3x5W9xSpAN6CDAOgqBbovGIgqiJyK/ZQ05qVEAYAeTBYJpCB
 +6BJ+BR60bf73BeAxGsepS3tG2ZMIp8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-Rr_s69K4PwySTTqi9la1hQ-1; Mon, 01 Jun 2026 06:29:34 -0400
X-MC-Unique: Rr_s69K4PwySTTqi9la1hQ-1
X-Mimecast-MFC-AGG-ID: Rr_s69K4PwySTTqi9la1hQ_1780309774
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-490ae0167ceso2061095e9.1
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Jun 2026 03:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780309773; x=1780914573;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NR4sOBYtM0bZ0iqX/XjOc3nz+SGcL1hWjzs/0wJdl4Y=;
 b=Nu1QZNosxt9zQ9H9UX7kSstM4POYDNPkMNEGtnF8paKppsr1p0OIjgNiHWmhGFNyc0
 be6qka9fCzmk4iQXfCqR3e+he9z27arAlUFhFRABlAqhtC8t8PxfL0VMe+zL8/zZt0gI
 ReD0OihOA5lxhERvUFLE8J3WkDTz5b8+JeEmShDA2f7yNQvdpALqbSP/h6EmU7l4XKyg
 YvusAoS5eOqbk4vBb6D/KWIwzlmMF32eMSzzP7jDtjaCYbMmoqUyDY7WjfW/DZeYKoyG
 5R/lUCCY7zLK26q427JJpUp81BXPppYxro3wxZSu6UxYgD7EO3Enm9SnO+1lajWIoulv
 k2iA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+EhgaXk6UMpSivVhkZ/WljSQfhzfxtu/DRc2S+HfmP9VAuEsL3IdinUsvLnf4ggpJYaORgZrVCdA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsUCCQYTnm4NcafW3JdODlxX1TFWXwoEszrPsiZr15ONS4Bcbz
 46baDRbGW8hMOtLjcGepXEi6g4YM+4nlVFGvsS4aHj12q5BJ6bsoWP8VEGKQ7BgTfegCTcezJsH
 wzTHfMKSQLyNwWBLyi+gW5UmS95u3bdbji26PA7rnVcRr01R5YIeuedh1oyxXcOgAC/2Z
X-Gm-Gg: Acq92OFu1KiAE2D4FeVuCWS3Vp6p9FVDwrkJX1wNQouquIxCzYD2a3Ba2l7e2+42VgI
 LERdRLNCtfk6jPrZz6uYRU053ClFLSKom8WYNaOjCDwp7YcyPa5Jn8FoEKkVcv0JH4qY5+XpdiC
 d5B7EMu8zAaPd3NKG5S1p7e19JYr4jU4Zi1TOBla21dNZVLT+UUHquLNPEwp5003zhX9TuWtF0T
 xN2lYzi4Foaw/ZNYq75MA4SVZufgkPpGS25QfKvWGGx/fgL9XEJ8fIXT2yWkuTI4kIxvuXuDe49
 rjHYJD3eIeZF9H8Hk+HMsJBdjFDvquxPqfBLD/tO+iCttEDdbrdQrywd6tVOeGTCML8nMZp5h4E
 GqgekqE2aUkWzi+9JkpLiDz58+jQizwnNnCRFhjyBLQqrGWfvSxFzpvoRHM+IvCS9hU9tgY70X6
 MDntm0Ls+wU4NfJPo=
X-Received: by 2002:a05:600d:8444:20b0:490:44eb:c1d9 with SMTP id
 5b1f17b1804b1-490a2947c86mr142088455e9.28.1780309773583; 
 Mon, 01 Jun 2026 03:29:33 -0700 (PDT)
X-Received: by 2002:a05:600d:8444:20b0:490:44eb:c1d9 with SMTP id
 5b1f17b1804b1-490a2947c86mr142087935e9.28.1780309773155; 
 Mon, 01 Jun 2026 03:29:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a037fsm25007994f8f.4.2026.06.01.03.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 03:29:32 -0700 (PDT)
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
Subject: Re: [PATCH v4 08/10] drm/damage-helper: Remove old state from
 drm_atomic_helper_damage_merged()
In-Reply-To: <20260530185716.65688-9-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-9-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:29:31 +0200
Message-ID: <87eciqlfjo.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NEvL1bcEa9ZnB4D40Fzky-fnm2wuzNHBACAfMuBgQGA_1780309774
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

> Nothing in drm_atomic_helper_damage_merged() requires the old
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

