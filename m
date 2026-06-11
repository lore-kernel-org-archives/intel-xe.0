Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A435CCD98D4
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 10:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F93810EE05;
	Thu, 11 Jun 2026 10:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jQH+Awhi";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F47210EE00
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781172730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q0r9Bb05wU768Bts6kNipr0zjojivSJzgQogOHI5wH0=;
 b=jQH+AwhiNYfDNE+fpr4EyyfDzX+dLcde4fPwRfQtPkFv4U4Ir1NylXa63M2xY7sHY9Lsh0
 2QjNaTT2VebPP1X4WLmCuDf8Q08O5dzGXjc8KU7LN722trj0LbRBVADxg9kRbg8AOdBkGb
 FynE6i7WfrFwElLyvj9LvMXWaXI+0/g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-qBaV_P-6OH647-uyo8_FWg-1; Thu, 11 Jun 2026 06:12:09 -0400
X-MC-Unique: qBaV_P-6OH647-uyo8_FWg-1
X-Mimecast-MFC-AGG-ID: qBaV_P-6OH647-uyo8_FWg_1781172728
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490e17fff23so7655815e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 03:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781172728; x=1781777528;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q0r9Bb05wU768Bts6kNipr0zjojivSJzgQogOHI5wH0=;
 b=UtW1nL8CovcXPzJqFurlG+hcMm5ybM7Mz5i0OhBEffF8rZZh6yTz7uQXTB0NhPScg3
 qxyYXmmnzj1A/lAkEAF0CucrmuRZ1SjRj0mBApTMPfKbJZRy/pI+/KVtua45VF1LmAvR
 Kd5TcyGoXhuWbDWI/LarM4S2XPB/iIhO8KU8bA0+sZBTcP4H9wTfwhYqu2ppoYFE6HiZ
 X04GsMSmOJju5o0n84E6/PhFuumm3xYiyxaq2UhbqiE0MQDlt072ZqpWuxeA3qWy+Cot
 sdDjzeNQB+0Qc7tU9phbomcnX440dqQaWPPs6TO9KaEks3F4x9sN5WXPNH+exOY2PoTm
 HWIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/E0Tvi4MpkFFel9mVWNmcB6Z579ZpEjbheUg6RgpzMipfe9SpBaZBQUNAnY4751TPWD6o3YVIRVw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpwF8cRrLH2cUPgMvi5y0i10O02cJx1f+W8X0q6mTa+m2RXvFO
 uKAK5sU7yBLYmmh5mWwi9fQTNeDUOGE/VDehdJWZt8/Qv2qMjQ+ubNsg8nQRNehkQwZbHK6ckkL
 nLxURyHgvH0Jf5SxtzlXpa80LkVEv0BgyZVYZPrb1Qix0p229dt0XreDVsocOMW1TXeyS
X-Gm-Gg: Acq92OGa5ycKdCKJ/QfRmuzWzZGEwqfiPtgPozSkxMwM5/fTTZKn/0UUGdaDdZxGZdA
 AaskoGcKeN6dr/91n5BAhyPhtLHdIqJzk/r9rWoEHWKRzhyfraDGqjFrZlcqKWn28PZiZqVCAJw
 NgezG/ASAN0Q2onMXsa/prX7ioyPYkPjTDlscQZD1ZWtYMCK1mA8P00x9gAgZr44wz6ni42deEj
 GQEs51EgA7e94qctxzpezFpzra4kEfezsNNADG8fvgl9dbHOL5MjhI6IjYyZLbbYIQHNJc3FB0H
 XDOKDHDGvSzJKWFmBzNdzgaNO5CsANip6k34z2B4mY30lTelI+99rz3OlnYbwoAlKRZBDeEV73l
 yqgH/mYJvBxZa/yt+hPuT2NNdWHsVZ65nBGdfXjMIzAQlPQCajQqjpCzI3aJSI19lpNVnYtwA/v
 vj9QmJgzBQWaQQIc4=
X-Received: by 2002:a05:600c:a39b:b0:490:c08b:b24b with SMTP id
 5b1f17b1804b1-490e5607e3cmr15876095e9.26.1781172728113; 
 Thu, 11 Jun 2026 03:12:08 -0700 (PDT)
X-Received: by 2002:a05:600c:a39b:b0:490:c08b:b24b with SMTP id
 5b1f17b1804b1-490e5607e3cmr15875655e9.26.1781172727683; 
 Thu, 11 Jun 2026 03:12:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d09a85sm51975965e9.14.2026.06.11.03.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:12:07 -0700 (PDT)
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
Subject: Re: [PATCH v5 03/15] drm/vboxvideo: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-4-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-4-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:12:06 +0200
Message-ID: <87se6t5qtl.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cz-a5YxWzzg5XZVFto8OJM2w8quN3vJHmWjy47hq3rk_1781172728
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
> Test the flag in the primary plane's atomic_update and do a full update
> if it has been set.
>
> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
> to ignore damage clips") introduced ignore_damage_clips to selectively
> ignore damage clipping in certain framebuffer changes. Vboxvideo does not
> do that, but DRM's damage iterator will soon rely on the flag. Therefore
> supporting it here as well make sense for consistency.
>
> While at it, also replace uint32_t with the preferred u32.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

And for this one as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

