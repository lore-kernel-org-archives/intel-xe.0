Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26E1C02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 10:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7406F10E7DF;
	Fri, 24 Jan 2025 10:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="gEAQmToE";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D476510E7DF
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 10:42:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso19835975e9.2
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 02:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737715323; x=1738320123; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LEMkBFBGAz91UL682z8DEvmvnG+YVr2nxf2Sty5wrA0=;
 b=gEAQmToE4dDtbs+Bth1Gmmdv/JXfL+8wZVt+DcjCMmcGc7USPX7FtIEYlhzIW+U20g
 OuTNCbWJ8jaRpZ/GjE77Z7TYzLxGbbzeCoJ8mC7/JgBW3gq9PIWs+2wRCfcNS9tNYbhr
 OhcdNp1DteZuGbMmZeV9fM6vBH/vNxNjw3/nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737715323; x=1738320123;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEMkBFBGAz91UL682z8DEvmvnG+YVr2nxf2Sty5wrA0=;
 b=aMovhvnoJnT3KPP90zRH26kZ6IVPtafMAjfEyiro+KJJbohUuUbhCQLvfOlu4EGpf8
 m9cOaYIlGwjonUrrxss3VZXgC5uhC78i0vF+iLUkUKigxepxFp/yVvOKjkkA0tSwDxE9
 /rLf3XJtRWXsJbPYBV8C87CtCvXex3gl6+1Yyr+vPcTDRJM75LIaAw0XLdpIaYkZmNvP
 vySIXA74DhMmWrX9k5li+/CJ1QO1aZcQdk3O4iQkjF/eCx/wfwU2+hBbyfYl/DWh8yOd
 C0cIfDuFwHTpdx/CEwQuvxpG5w2PNE/nInnFwMT3H/QIMZOxHemXmK8IYdvnf7OrsrXL
 jU7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVIFT0Sfbanvpg+2ZJIMezgcsxCoXbc+71EW5jYgjZeyrRnqIyC5aRLo6WuhbCR5u6f4BsLmk2UA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg7eiZ+JuwmO89QSOC6OgnvC8/JF4pEhmCUmVNpSazGocwb219
 t3+mI5znrzQGb7dymggzLdZsrQ9nHXGtoM46HAk9fRzrtQdECMjS+yLiUdG0zR4=
X-Gm-Gg: ASbGncsh284ydnMNhKpafHaRxWfZ4RMc9sKjwFsGcfEuqpUnPt1aJG6UhbCRz+wRPz/
 njPLde9A/L9g9qdOwLgxTE3iOrYec9Dk5SIUBHqi+j+1afu67oXc38Q0cQSkzuwCN5qL3Aq8tBA
 BqXWrdRVbNcycj9oGJFlsNO7BO/tRm5rDmLxeqqeqdsNVxCsY+6aIwUaBRQYne6xoSfrsy6qTkF
 /k1afo++QzMdoGQWT28gtZ9vkQ85ohFNRCv/wl/PfWS7x3YeidLdUfPNyg90zjDMkGNUd4BGqNI
 /i6RNumsxlDF0UoR
X-Google-Smtp-Source: AGHT+IGxcHQ073OHTXbA6LCWZq/bLG2+an6Uq8KVDF9rDOXyu5Vz6d0xoM/4cy2CJ9cwqh7al1imcQ==
X-Received: by 2002:a05:600c:1986:b0:434:feb1:adbb with SMTP id
 5b1f17b1804b1-4389143a662mr281418685e9.31.1737715322947; 
 Fri, 24 Jan 2025 02:42:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188915sm2268564f8f.41.2025.01.24.02.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 02:42:02 -0800 (PST)
Date: Fri, 24 Jan 2025 11:42:00 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <Z5NueDr3MeL9biwd@phenom.ffwll.local>
References: <20250124082932.GA13715@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124082932.GA13715@linux.fritz.box>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Fri, Jan 24, 2025 at 09:29:32AM +0100, Thomas Zimmermann wrote:
> Hi Dave, Sima,
> 
> here's the weekly PR for drm-misc-fixes.
> 
> Best regards
> Thomas
> 
> drm-misc-fixes-2025-01-24:
> Short summary of fixes pull:
> 
> bochs:
> - Fix double-free on driver removal
> 
> client:
> - Improve support for tile-based modes
> - Fix fbdev Kconfig select rules
> 
> xlnx:
> - zynqmp_dp: Add locking to DP-bridge enable helper
> The following changes since commit ef84aee151bd6c2c9223c8b430cae21d57b5e1c1:
> 
>   drm/bridge: ite-it6263: Prevent error pointer dereference in probe() (2025-01-15 11:27:08 +0800)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-01-24

Pulled, thanks a lot.
-Sima

> 
> for you to fetch changes up to 0a1ee19d46b71691c5acdf234bb6105913bd9add:
> 
>   drm: zynqmp_dp: Unlock on error in zynqmp_dp_bridge_atomic_enable() (2025-01-24 09:26:45 +0200)
> 
> ----------------------------------------------------------------
> Short summary of fixes pull:
> 
> bochs:
> - Fix double-free on driver removal
> 
> client:
> - Improve support for tile-based modes
> - Fix fbdev Kconfig select rules
> 
> xlnx:
> - zynqmp_dp: Add locking to DP-bridge enable helper
> 
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       drm: select DRM_KMS_HELPER from DRM_GEM_SHMEM_HELPER
> 
> Dan Carpenter (1):
>       drm: zynqmp_dp: Unlock on error in zynqmp_dp_bridge_atomic_enable()
> 
> Maarten Lankhorst (2):
>       drm/modeset: Handle tiled displays in pan_display_atomic.
>       drm/client: Handle tiled displays better
> 
> Thomas Zimmermann (1):
>       drm/bochs: Do not put DRM device in PCI remove callback
> 
>  drivers/gpu/drm/Kconfig              |  3 +++
>  drivers/gpu/drm/drm_client_modeset.c |  9 +++++++++
>  drivers/gpu/drm/drm_fb_helper.c      | 14 ++++++++------
>  drivers/gpu/drm/tiny/bochs.c         |  1 -
>  drivers/gpu/drm/xlnx/zynqmp_dp.c     |  3 +--
>  5 files changed, 21 insertions(+), 9 deletions(-)
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
