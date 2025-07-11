Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A53C83F21
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 12:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D71C10EA33;
	Fri, 11 Jul 2025 12:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OEpr3Qjn";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8247010EA48
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 12:15:49 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so1260094f8f.0
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752236148; x=1752840948; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j7o6WO/ubCLkafzT7RhuSteJI5L2X5ZOO+7e52gjV7M=;
 b=OEpr3Qjnjc4TT7iermpA2dvoOpRpooGZRTtQdeSIhAv/PewYIb6S8Lhs0h6qRW4Q8Y
 iGf03VuLiDOJigAAnAzOCkkwR2LXF2zsVvo4XYrSQgtUm2tF3bqPLXv27aCaHZ9Y8f2H
 mKwbewcxtxMEoVsG0NCKYnbulCKE74ym4/6Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752236148; x=1752840948;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7o6WO/ubCLkafzT7RhuSteJI5L2X5ZOO+7e52gjV7M=;
 b=Zs/ZbwfMs2NnLx08ELWIvvN8WdICaPpn12jkFqBt8aa+/XFYtcHR2rzNZBSNf6Q1gw
 lVqXyhjRcsrHghSVf17p9Nkv9JGI1Mgb5MRcHKtUFFg8CnXJiMr9oQMDybOYX7Ef1uac
 gfltCqz7m/+y0HLJyYESmU2F7XqQmUo54gQ0dmCgaTYQwzA93YWi/4ulImVJtrsDqVME
 264BNR3pErciQoOFi7VaFFfXE+B5Yc9fP72go+eYLg14qKYixCd/K8iR93+4/FmZqRPq
 HgadyBq+0z5Jfr6gegrDfwTvG4oyfgFu6UYNOsTDvaBSzfm9TqcRO7wavViypJbW8xYX
 lhjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwTTL9NQy1XQ1RJjIu+SMYpQkG7A1dzR2TOhQkVoqmAFfdlvvMZ5s0VCsbrmAgnRYP2waTnxxtBA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUUbsHu691nqwYobWcEtsVQa+6sCgqqGPbH+o/uYuOlz4Daa5R
 zvdLqRQ65uzcrUVnmknTMp5wgYcYNz/IY5kLc0IaGpjQE5hFK3e+LxgHsmw99jAW7fc=
X-Gm-Gg: ASbGnctyXYR1LiNGXlXNOGtQZ0OMQ01CIlaFU44TMUy/N4/BJKX9UWJo7UnSRI/LdYe
 5w38CJ5DOqb9hJjp3wovYdS+Hpst7cscZ8udM0xISmYYO81lzuLtYhZLq5TmNUX1j0Gd9X3jQML
 AqcHGIRBewNcE8YLfN92eA3yK4Bnwntzu5SxStBL9YHpdulLChg8W+YIR+QR0/4pI34l7rHoPu8
 2QE0AHd0KvJoGvzURPh9xcGHjdO798hOD38xC5NrHx8wIK8uvfB72u4NdqeB3siZq9+QLev8/ZX
 AapgTdZ3TPCjiANxz8f2r05qMRigvjWVIco5mA1Hmtu52VYpzyWcD7Ludx3tHo0SAee7f5oZrWl
 R7CLNodWC9S0lQhd6LzRNjVzcicWt0WUn8Q==
X-Google-Smtp-Source: AGHT+IG4lw/1ObjlK9R/H1a8epU8yfIcFEsjIXOWSPEYi65lTbPyWKu8x7qcTt+AHPmA2N3d8d9Yfw==
X-Received: by 2002:a05:6000:2006:b0:3a8:6262:e78 with SMTP id
 ffacd0b85a97d-3b5f18dc57cmr2802992f8f.37.1752236147762; 
 Fri, 11 Jul 2025 05:15:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26ff9sm4291582f8f.93.2025.07.11.05.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:15:47 -0700 (PDT)
Date: Fri, 11 Jul 2025 14:15:45 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <aHEAcYYtfj_fcguP@phenom.ffwll.local>
References: <e522cdc7-1787-48f2-97e5-0f94783970ab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e522cdc7-1787-48f2-97e5-0f94783970ab@linux.intel.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Thu, Jul 10, 2025 at 10:59:19AM +0200, Maarten Lankhorst wrote:
> Hi Dave, Simona,
> 
> Pull request for v6.16!
> 
> Best regards,
> ~Maarten
> 
> drm-misc-fixes-2025-07-10:
> drm-misc-fixes for v6.16-rc6 or final:
> - Fix nouveau fail on debugfs errors.
> - Magic 50 ms to fix nouveau suspend.
> - Call rust destructor on drm device release.
> - Fix DMA api error handling in tegra/nvdec.
> - Fix PVR device reset.
> - Habanalabs maintainer update.
> - Small memory leak fix when nouveau acpi init fails.
> - Do not attempt to bind to any PCI device with AGP capability.
> - Make FB's acquire handles on backing object, same as i915/xe already does.
> - Fix race in drm_gem_handle_create_tail.
> The following changes since commit 226862f50a7a88e4e4de9abbf36c64d19acd6fd0:
> 
>   drm/v3d: Disable interrupts before resetting the GPU (2025-07-02 19:08:11 -0300)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-07-10

Pulled into drm-fixes, thanks.
-Sima

> 
> for you to fetch changes up to bd46cece51a36ef088f22ef0416ac13b0a46d5b0:
> 
>   drm/gem: Fix race in drm_gem_handle_create_tail() (2025-07-09 15:53:34 +0200)
> 
> ----------------------------------------------------------------
> drm-misc-fixes for v6.16-rc6 or final:
> - Fix nouveau fail on debugfs errors.
> - Magic 50 ms to fix nouveau suspend.
> - Call rust destructor on drm device release.
> - Fix DMA api error handling in tegra/nvdec.
> - Fix PVR device reset.
> - Habanalabs maintainer update.
> - Small memory leak fix when nouveau acpi init fails.
> - Do not attempt to bind to any PCI device with AGP capability.
> - Make FB's acquire handles on backing object, same as i915/xe already does.
> - Fix race in drm_gem_handle_create_tail.
> 
> ----------------------------------------------------------------
> Aaron Thompson (1):
>       drm/nouveau: Do not fail module init on debugfs errors
> 
> Alessio Belle (1):
>       drm/imagination: Fix kernel crash when hard resetting the GPU
> 
> Ben Skeggs (1):
>       drm/nouveau/gsp: fix potential leak of memory used during acpi init
> 
> Danilo Krummrich (1):
>       rust: drm: device: drop_in_place() the drm::Device in release()
> 
> Dave Airlie (1):
>       nouveau/gsp: add a 50ms delay between fbsr and driver unload rpcs
> 
> Lukas Wunner (1):
>       agp/amd64: Check AGP Capability before binding to unsupported devices
> 
> Mikko Perttunen (1):
>       drm/tegra: nvdec: Fix dma_alloc_coherent error check
> 
> Ofir Bitton (1):
>       MAINTAINERS: Change habanalabs maintainer
> 
> Simona Vetter (1):
>       drm/gem: Fix race in drm_gem_handle_create_tail()
> 
> Tamir Duberstein (1):
>       rust: drm: remove unnecessary imports
> 
> Thomas Zimmermann (1):
>       drm/framebuffer: Acquire internal references on GEM handles
> 
>  MAINTAINERS                                        |  2 +-
>  drivers/char/agp/amd64-agp.c                       | 16 ++++----
>  drivers/gpu/drm/drm_framebuffer.c                  | 31 +++++++++++++-
>  drivers/gpu/drm/drm_gem.c                          | 48 +++++++++++++++-------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c       | 16 ++++----
>  drivers/gpu/drm/drm_internal.h                     |  2 +-
>  drivers/gpu/drm/drm_panic_qr.rs                    |  2 +-
>  drivers/gpu/drm/imagination/pvr_power.c            |  4 +-
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c          |  6 +--
>  drivers/gpu/drm/nouveau/nouveau_debugfs.h          |  5 +--
>  drivers/gpu/drm/nouveau/nouveau_drm.c              |  4 +-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 27 +++++++++---
>  drivers/gpu/drm/tegra/nvdec.c                      |  6 +--
>  include/drm/drm_file.h                             |  3 ++
>  include/drm/drm_framebuffer.h                      |  7 ++++
>  rust/kernel/drm/device.rs                          | 12 +++++-
>  rust/kernel/drm/driver.rs                          |  1 -
>  17 files changed, 130 insertions(+), 62 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
