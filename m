Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48753C61CE8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 12:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FA310EA7A;
	Fri,  6 Jun 2025 12:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SAlssYPS";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E76C10EA8F
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 12:38:05 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a510432236so1621825f8f.0
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Jun 2025 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749213484; x=1749818284; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K4RGkwRtwLz/ApyoBObDOLrgrSMH07hxl8gkzqpa9lE=;
 b=SAlssYPSFU75boFbajoxIroKKhQC5MxhjwSFGhqmQA1D5BIfj7206oGUJUslmS9qz6
 xtMu1+F0xzOhWITr3DPMk9Cf4THwe7KQa7+dv2ufejrQSYRP1rS6NsxUg3+nHazDCa0Z
 6JOj6gmEPEYlUyVAYG9mIsoYyYk5W1JcyFnRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749213484; x=1749818284;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K4RGkwRtwLz/ApyoBObDOLrgrSMH07hxl8gkzqpa9lE=;
 b=aHj9GKQRUbFwzC8gMPTdVPouzB23mkfd29RIIjAaha5Rt6rqob/aFOC6amVYoyyOjJ
 dltRYab0vhpRhd0nWLoKC6ZOBEsL9nPBT45y1qULeV00g5SJXgTMIhNtxK0fQ7Ow4w3Z
 uvLw8Z6JycMJIG12rA0vw105ADfdXagcmdbDAfGjZAPRVH8FcKOKIhsuUtK2UyLyJBLf
 P2tNbGdm1wiL4rpSZ9IJc/qSbg5UubofX6DHQEJKRC8ehNE0lxp6AJ//h7dO1sFVnp4e
 L0x6qNRQp/ORJvqEauE6cKqy5Zmaok5F2HUM7ESf+NlPVtuxpzIL9kZQiYUBPDwEV1fo
 z86g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKZUdtPoskC0tt3UkOKgJYoG8Zfm73VKPsleLEK0LiOwn6cjnJpUWwKBPJH7CGpgnSLGi4I7oB5w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlvM7ajy9fZJ4WaMoqsHlYZ15jHNsaoCSCCE5RMf5tGoh6pPCU
 SsUUe5nn1Hb7QNvxxdcR2rzdsc9yvf5NgDBfVURkinIBtJWOpJWeYYp5e33eJ+RHPxo=
X-Gm-Gg: ASbGncv9o5ty48x+fwZ4FIbjBiYKkqyYU1a/B4HYSZURN8+k5NDWHI8+z63ipXE5rO0
 XcfX1NFeRpFkSqKqjeaukrlueipLGt8qOrvAS0ol04c+sMQX/TGiEoymPSP8yF9AOTuHAFuHRIR
 xEH9s31i1I35AEVj4uOuK064iuoM5Pbygt436RFy4FzwdMR23sGuDdWeye6eBPiozSGrsTZA+RG
 GrjXdfvSp0x3hBSyfeE+CVmj6TvL4+ED30nFOqlaLshomkkdVMSSqdXKUMqK+nhnvlRFg2V9rfp
 FIXR8pYNhN0GJuOTSBN1hayeHw2awdJ5lkOcefdpywyZQ+RUymQSIw4XTvEJomE=
X-Google-Smtp-Source: AGHT+IFOw67PVNk8q11ZmC1f2g0emtQP8TMaOJnWBq/fbR5Ey7/O01xLkairF/ed2N64Zcgf1Hh0Iw==
X-Received: by 2002:a05:6000:26c8:b0:3a3:7077:aba1 with SMTP id
 ffacd0b85a97d-3a531ce677bmr2722476f8f.48.1749213483789; 
 Fri, 06 Jun 2025 05:38:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5322ae43fsm1762351f8f.25.2025.06.06.05.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 05:38:03 -0700 (PDT)
Date: Fri, 6 Jun 2025 14:38:01 +0200
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
Message-ID: <aELhKAjV2bMRPORf@phenom.ffwll.local>
References: <20250528153550.GA21050@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528153550.GA21050@linux.fritz.box>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, May 28, 2025 at 05:35:50PM +0200, Thomas Zimmermann wrote:
> Hi Dave, Sima,
> 
> this is the weekly PR for drm-misc-fixes. Besides DRM, the bugfix
> for dummycon possibly affects fbcon and fbdev output as well.
> 
> Best regards
> Thomas
> 
> drm-misc-fixes-2025-05-28:
> Short summary of fixes pull:
> 
> drm-scheduler:
> - signal scheduled fence when killing job
> 
> dummycon:
> - trigger deferred takeover when switching consoles
> 
> ivpu:
> - improve logging
> - update firmware filenames
> - reorder steps in command-queue unregistering
> The following changes since commit 6692dbc15e5ed40a3aa037aced65d7b8826c58cd:
> 
>   drm/edid: fixed the bug that hdr metadata was not reset (2025-05-19 12:26:08 +0300)

Pulled into drm-fixes, thanks.
-Sima

> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-05-28
> 
> for you to fetch changes up to 4557cc834712eca4eae7adbd9f0a06bdd8f79c99:
> 
>   accel/ivpu: Reorder Doorbell Unregister and Command Queue Destruction (2025-05-28 11:49:29 +0200)
> 
> ----------------------------------------------------------------
> Short summary of fixes pull:
> 
> drm-scheduler:
> - signal scheduled fence when killing job
> 
> dummycon:
> - trigger deferred takeover when switching consoles
> 
> ivpu:
> - improve logging
> - update firmware filenames
> - reorder steps in command-queue unregistering
> 
> ----------------------------------------------------------------
> Jacek Lawrynowicz (2):
>       accel/ivpu: Improve buffer object logging
>       accel/ivpu: Use firmware names from upstream repo
> 
> Karol Wachowski (1):
>       accel/ivpu: Reorder Doorbell Unregister and Command Queue Destruction
> 
> Lin.Cao (1):
>       drm/scheduler: signal scheduled fence when kill job
> 
> Thomas Zimmermann (1):
>       dummycon: Trigger redraw when switching consoles with deferred takeover
> 
>  drivers/accel/ivpu/ivpu_fw.c             | 12 ++++++------
>  drivers/accel/ivpu/ivpu_gem.c            | 25 +++++++++++++++++--------
>  drivers/accel/ivpu/ivpu_gem.h            |  1 +
>  drivers/accel/ivpu/ivpu_job.c            |  8 ++++----
>  drivers/gpu/drm/scheduler/sched_entity.c |  1 +
>  drivers/video/console/dummycon.c         | 18 +++++++++++++-----
>  6 files changed, 42 insertions(+), 23 deletions(-)
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
