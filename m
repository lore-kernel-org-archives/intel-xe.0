Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939AECCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5952110E385;
	Fri, 31 Oct 2025 18:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="J/ZEjUMN";
	dkim-atps=neutral
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D6B10EC02
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:09:13 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b6d345d7ff7so709886366b.1
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761934152; x=1762538952; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nKtssmUP+ALDMkzJQfah53QYQZLXpEc5pubXPz+gpuA=;
 b=J/ZEjUMNfd7O8vd4yD6KkOvROz6OjaHX4Z88/XjE9lhbbnLLxL9tLSnvCA0/2YP6U4
 /q41msBCTdoKuZC1lYmHEt7C70k4w6l+6xVdYBAZKU+yern5LkWvpOONrgxP43+9riO0
 BqDNBXGmXd/iQz9ljRn1/SoI3f7CYamawBkfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761934152; x=1762538952;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKtssmUP+ALDMkzJQfah53QYQZLXpEc5pubXPz+gpuA=;
 b=B0DpVxwmoj3OE+gAB/1YjiRDx+PlCL7PWao+RAREDqqk7wIHMVXSRQqr5A2798DlWm
 fGwmw2nubsUpjKIWxbabrjUUoKnSMxtYoQ+udZ9P1nl32nhNFgJJUGoepBxSR57A8lah
 EnFPweDIN/sS7FEqE/KF0Gny/NW72IjdKtLCUHJHPJs3bMdLGIpr5CtpVudvLDa9pk3R
 0BVmwP9BuAqqOwWvYFnJaz4EccTFTwQOdqS6+mPwdSD/BbIfgKM/IdYCuWhmYFdBycsM
 yiDxTwe1hipK6NpTGlU10TNtCfhXsTM49EtQ5/h0+FApqxjCURCGp2Jz4RPFegpXxqvl
 k57w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGNI1dcqNjbkz41J4RekuObjp4djMwkK1NhJjSwiZwrrrE7nWrhXzDGDk5exFChh14K+KQWYOveQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPD3oFDt/6jc+9ogBCmyo37UF+RBa2WigDEwvPpMFBZE16rNgF
 ssgjmbhln3OkM4GuFBJitChgZSylrR1FKm9P9s0UtoFuuziSKxc6h0FrcCrgVB9GBjTQz9d1su1
 pov9q
X-Gm-Gg: ASbGnct45SJvUD1UotuxUPX0kqOQmYgllpl26OxKCAVefQkQuazhsbZYlg/0EwgPRkI
 YMjXkzlfcM/48iM7e37odB9uwYA+UXcwgPSw+KRScDD9KN5VkN/E6V1Q+arcRcWiLDGOuRFGYcL
 Jh+BcsldISQ+IDgK9bF9cDcHeVuPXvvrlhsa27znHyCV6i93l5zDQyhPLid4qZk/trneE8KhEse
 PcvuL4d7T6j3I73cnehXGfVpUmbJKigYj80jvdmSh8yixFYtAHi5zyX4sBAgixuUN3GA7ixpWxw
 Pln1bo639sdeU7mW59PWND5HRu48jQPup3eOZ64X+KY4UWFoERvHFxMu/QnQC0McHD5mtVak6Pe
 mJdxkUvoMwT64GuQqAi27/r2GagLOHE3gEOEEOLGpEA1IrKlCOevrm+pC6GTT3rCYOaRd9BW/5b
 fgsLFS0x2x+NObIjX77mr1wg==
X-Google-Smtp-Source: AGHT+IEKnHd7pJ1dQSxnCMJJVqL4EtiSOZpH8KMq1b10ZNQEIBxUJj5PF57dXuhBIN7vAPX1M39U3w==
X-Received: by 2002:a17:907:3cc7:b0:b2f:4970:8720 with SMTP id
 a640c23a62f3a-b706e270568mr574233266b.8.1761934147789; 
 Fri, 31 Oct 2025 11:09:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077cfa966sm236173766b.65.2025.10.31.11.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 11:09:07 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:09:05 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <aQT7QV8F48fwteHm@phenom.ffwll.local>
References: <aQNtTV75vPaDhnXh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQNtTV75vPaDhnXh@intel.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Thu, Oct 30, 2025 at 09:51:09AM -0400, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes our only fix for intel-display for this
> round.
> 
> Thanks,
> Rodrigo.
> 
> drm-intel-fixes-2025-10-30:
> - Fix DMC/DC6 asserts on ADL-S (Ville)
> The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:
> 
>   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-10-30
> 
> for you to fetch changes up to dc8aa0cb87a7836b59422cc02d969c8df849ee39:
> 
>   drm/i915/dmc: Clear HRR EVT_CTL/HTP to zero on ADL-S (2025-10-28 16:00:19 -0400)

Pulled into drm-fixes, thanks!
-Sima

> 
> ----------------------------------------------------------------
> - Fix DMC/DC6 asserts on ADL-S (Ville)
> 
> ----------------------------------------------------------------
> Ville Syrjälä (1):
>       drm/i915/dmc: Clear HRR EVT_CTL/HTP to zero on ADL-S
> 
>  drivers/gpu/drm/i915/display/intel_dmc.c | 55 +++++++++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
