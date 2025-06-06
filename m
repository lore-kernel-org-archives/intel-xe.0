Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A041C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 13:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4D510EA9C;
	Fri,  6 Jun 2025 13:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="V2vZIh3f";
	dkim-atps=neutral
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9B610EA9E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 13:03:43 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso3749488a12.3
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Jun 2025 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749215022; x=1749819822; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uAz3IwxVIGZtcW19UqUFOR4Ccjk5MRSj4WGpPcEqtes=;
 b=V2vZIh3fQu1v5fOsdDVzHHPY+fJG0p/mfBNm9ZlJmbMythmPFaGsm+k4MeMXX471Sg
 oFKIf12voqY7Wb60x21dk+9bFXq7/G791KUbk2Z9mNIL9qqq/NqB4IdxHUtUE9f0xzcF
 HmZpKxpDN2oUbXk+1inPzHPbL+4rwpok0DNlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749215022; x=1749819822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAz3IwxVIGZtcW19UqUFOR4Ccjk5MRSj4WGpPcEqtes=;
 b=dg8yPX1pz60L5QkxEbt4BZ3HRp+4CxCIQoLTMVGrCv+0XQyFIv+T5FYWgCZhpl50oy
 lPOGbHe6SawqrPZIN2XZ3Lt2FNKyAHGhUn9Pv+ghpk+Rj+cwlyHzhN4HFYOOcg8znPex
 ay49uCrON7eQVAzzAaYGNWXGF00SXIJp2XvMGiYIDeZDu16UfBn7Iqm0jpnUxSeMRNeS
 2gG+OTfFDQwa4XM0TFkbdsxVKUe7LB11/a7Vu8eFpIZX7B3SMN6Xljq0l3dhfTO2Cy11
 +iJ5h7X2Zc8mwJJdGQm+vFezMNkqhKiifYzCQLVSmMVoTxnLFF+0pipCqhPN7zGgZ4Ad
 mq5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxItV0vkZEwHRvTb5R5iauvtpVlAlg1dm4QmG3rQGKeAQBYFrPSqu3kmabBOf+5+aP8+RNcsIa8A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBK7ie9oyWcyrmZy9ajKgYbvaPysf6cTQA7lJ5sEobC0Jpykxr
 DcYac5IqkkaaKmGQa+PueucVldU0Spv4qvqIKjGw6xwn+2RqdBK3vVnnInfrzP6DFIY=
X-Gm-Gg: ASbGncuIipBQl9p5DVkQgGgv4itP7hb1/PJwNRaYEsPp9jQuUfIPODYqRfgR9f+4reE
 DXnsLR5l053KtRNzyZAqO71f15ngtH0Qj8858CAHwDvfRdxnA+Uh/JeVhnb53tK/06USbu4oBy8
 BjV94tZQ2xZo1EzxlsXxj88HsgloS6xYURgM2xVpVnkg/oecXKzs8wZxCFy258F1EtBb2GYM393
 EM8StIlPchMexHDd7Q0rCfIGYTidYwPv2y8WHCCAyrX0zyFkt6W4qkCP/qqm5InVpCVleQBXudj
 Qpliu68GDeJ50KgSPs+sTjL9O4fn45gZ5XXxWb/iDM4v1I4kYMfj35Rtli/V7xNMBtmsEXF4kQ=
 =
X-Google-Smtp-Source: AGHT+IHTc+eHW/5gHXGQgbG0M+E/iV0blTyu58bz6azK6vN1AzGBvRFefuTeMXZk2W50HJV0fqm4jA==
X-Received: by 2002:a05:6402:350e:b0:5e6:e842:f9d2 with SMTP id
 4fb4d7f45d1cf-60774894dbbmr2363653a12.29.1749215021824; 
 Fri, 06 Jun 2025 06:03:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-607783e682dsm985174a12.76.2025.06.06.06.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 06:03:41 -0700 (PDT)
Date: Fri, 6 Jun 2025 15:03:38 +0200
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
Message-ID: <aELnKpkG4cPilRzE@phenom.ffwll.local>
References: <20250606072853.GA13099@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606072853.GA13099@linux.fritz.box>
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

On Fri, Jun 06, 2025 at 09:28:53AM +0200, Thomas Zimmermann wrote:
> Hi Dave, Sima,
> 
> here's the PR from drm-misc-fixes for this week. It's a bit later
> due to merge-window confusion. The fixes for sysfb and video also
> affect fbdev.
> 
> Best regards
> Thomas
> 
> drm-misc-fixes-2025-06-06:
> Short summary of fixes pull:
> 
> ivpu:
> - gem: Use dma-resv lock
> - gem. Fix a warning
> - Trigger recovery on device engine reset/resume failure
> 
> panel:
> - panel-simple: Fix settings for Evervision VGG644804
> 
> sysfb:
> - Fix screen_info type check
> 
> video:
> - Update screen_info for relocated PCI framebuffers
> The following changes since commit 4557cc834712eca4eae7adbd9f0a06bdd8f79c99:
> 
>   accel/ivpu: Reorder Doorbell Unregister and Command Queue Destruction (2025-05-28 11:49:29 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-06-06

Pulled into drm-fixes, thanks.
-Sima

> 
> for you to fetch changes up to f670b50ef5e4a69bf4d2ec5ac6a9228d93b13a7a:
> 
>   sysfb: Fix screen_info type check for VGA (2025-06-05 17:54:31 +0200)
> 
> ----------------------------------------------------------------
> Short summary of fixes pull:
> 
> ivpu:
> - gem: Use dma-resv lock
> - gem. Fix a warning
> - Trigger recovery on device engine reset/resume failure
> 
> panel:
> - panel-simple: Fix settings for Evervision VGG644804
> 
> sysfb:
> - Fix screen_info type check
> 
> video:
> - Update screen_info for relocated PCI framebuffers
> 
> ----------------------------------------------------------------
> Jacek Lawrynowicz (2):
>       accel/ivpu: Use dma_resv_lock() instead of a custom mutex
>       accel/ivpu: Fix warning in ivpu_gem_bo_free()
> 
> Karol Wachowski (1):
>       accel/ivpu: Trigger device recovery on engine reset/resume failure
> 
> Michael Walle (1):
>       drm/panel-simple: fix the warnings for the Evervision VGG644804
> 
> Thomas Zimmermann (2):
>       video: screen_info: Relocate framebuffers behind PCI bridges
>       sysfb: Fix screen_info type check for VGA
> 
>  drivers/accel/ivpu/ivpu_gem.c        | 68 +++++++++++++++++---------------
>  drivers/accel/ivpu/ivpu_gem.h        |  1 -
>  drivers/accel/ivpu/ivpu_job.c        |  6 ++-
>  drivers/accel/ivpu/ivpu_jsm_msg.c    |  9 ++++-
>  drivers/firmware/sysfb.c             | 26 +++++++++----
>  drivers/gpu/drm/panel/panel-simple.c |  5 ++-
>  drivers/video/screen_info_pci.c      | 75 +++++++++++++++++++++++-------------
>  7 files changed, 117 insertions(+), 73 deletions(-)
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
