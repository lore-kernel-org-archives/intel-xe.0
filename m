Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10876CD98D5
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 10:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC8D10EDEC;
	Thu, 11 Jun 2026 10:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g/4Fym+m";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E632310EDEC
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 10:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781172638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rQRyqUjYEtr0y/u9/sXosv9fI09dOaWuwDl+f7MSICU=;
 b=g/4Fym+mT49AX8qos/OQFBpJN0WP3TglYoLXiUi55EWYvFZ+1fptMJVszXdsMtjJg/F6mv
 GR5jw9j3VXLoChophn1H0qWDxx2pWt/wA+FJ42HvRjaCZzRA2bAF76aVbEXs6DYKiCvA3X
 mhP+QY0z14SMwr9YmNLal7kxQ9zOM6U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-uW5KHCrNNOqJbAnp8p9bwQ-1; Thu, 11 Jun 2026 06:10:35 -0400
X-MC-Unique: uW5KHCrNNOqJbAnp8p9bwQ-1
X-Mimecast-MFC-AGG-ID: uW5KHCrNNOqJbAnp8p9bwQ_1781172634
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490bae3a39bso19152105e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 03:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781172634; x=1781777434;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQRyqUjYEtr0y/u9/sXosv9fI09dOaWuwDl+f7MSICU=;
 b=rRbLDGMt+lIO+vormHBk454WHpWItnrhxQ4lnUEti9Qt6zbV6QQEgu6q3dHy5VdCoP
 Ppqq439BRFFMbv727Jv0KjAHvlXvZgLXtvsfFyOZbY1/nAmmURuO4k1sBzhbuehqorJC
 ThRxCN7Pip8Vdhycj0ImMrt2VrJSSOGqjQH78xw+nBZ+U3rrZDE76EMiX3DQ+EUb8lOG
 aF7JwLl1UZvDNuW1oY4A067dg372jf/mL7n+3lwSgYlgIj3xLH9jHA8kNJX5SaDbtCqb
 AtyEuHuHRsba7az/KgDCMvgRfXhZ4o86/KIbYQ7OtEHa6CjjdaXShCN3qxLF+vHQmWnl
 Kavg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8bIeVCulGCYzUXWSIL+E6B+fwI/xrVmlrJGdUJMgxC5DZvGhmZM2hGFbP+jKq/nmArlq5xAzBrSw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD97rbajxvGCABOjYoHgCqxssq89PI1/5W3cSHnzJToo0z2mCH
 gUPp2f52W6OEWz+Qx741stXs2xg1qkn6TQ7cZlXkjT2Py8BwiKxfOSYHBD1zyKjigQiC1vwC6pO
 ohiSHaI6JU7H1Ae/Fp1y6PUqpBqssgNEJYyT21phblFlijKULRepSgOwKvVn3ISzAOltd
X-Gm-Gg: Acq92OFNHd20z3HKv759zHuarxoAkUFX7V9U7qk2RGqWRJss8+ulxqujvuW6+1k0g6S
 8TYpq5x/zhPWZr4c37nIfemCDU1NfrWu4BTV5zX041WTGkKTQPmONlpnGgYg7G00lUvRpmuRRl/
 z9WNdIoYorKvbSGCslunEHwpDMcFQtGCRBiU471SHXFqnnq1azdOyqsmHYUE4GsWhpYZf24nLoN
 7jpjf3UzxllqN9xTheFwa7aw8Wj2PZLP8LhTy0kqXhEd+9QIb9OFiu8GHDzu9H14dxctPlt5wBD
 SIm6OSKRGjXXfaNnIpXmAY1ZM1tF59tWPBDx+BSvDLBFzOnJLTKeGH+3NhNRfesnZ2MGDPICcMt
 5vXRETsd5ixtrqdjXQx0AOYabRxaoXYHVFw0VcHon0yR1+7xWuLpeKqnrK1QULFy0aoB3r8FS7m
 TWLF66qrGEwWX4L5E=
X-Received: by 2002:a05:600c:4685:b0:490:e1e6:8988 with SMTP id
 5b1f17b1804b1-490e55dc1damr31237485e9.7.1781172633823; 
 Thu, 11 Jun 2026 03:10:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4685:b0:490:e1e6:8988 with SMTP id
 5b1f17b1804b1-490e55dc1damr31236645e9.7.1781172633469; 
 Thu, 11 Jun 2026 03:10:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e52ac9aasm38076025e9.4.2026.06.11.03.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:10:32 -0700 (PDT)
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
Subject: Re: [PATCH v5 01/15] drm/amd/display: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-2-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-2-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:10:31 +0200
Message-ID: <87y0gl5qw8.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t5-5q1ksY-l3sl0N5KcUarDn1YY0nZ2QayWgu7CYj8E_1781172634
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

Hello Thomas,

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update.
>
> Test the flag in DCN code and do a full update in DCN code if it has
> been set.
>
> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
> to ignore damage clips") introduced ignore_damage_clips to selectively
> ignore damage clipping in certain framebuffer changes. This driver does
> not do that, but DRM's damage iterator will soon rely on the flag.
> Therefore supporting it here as well make sense for consistency.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

I don't think that a Fixes tag is correct here? Your patch series
is changing the 'struct drm_plane_state.ignore_damage_clips' and
the changes make sense, but definitely isn't a fix in my opinion.

Having said that, the change look good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

