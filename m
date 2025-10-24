Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1401CCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 11:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE1A10EA50;
	Fri, 24 Oct 2025 11:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="L2CnG2P6";
	dkim-atps=neutral
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2474E10EA55
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 11:36:40 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so388045066b.1
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761305798; x=1761910598; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xS/jV9mpqgr8ibLarMcAksgGJ99MACM2hNYnbMBce6w=;
 b=L2CnG2P6GtLYSwAB8lx3QxF91GonJKTzacMtTpItd8Lo+4AuV193pCsNCANDFHXiFn
 J8BtrhUY/VDzHFLdnvbzLX7HzSsSEVHeyyYNSm/kej+voFi//ACi3UtME0YhZFmU3dFJ
 4JPWmj4F1thH1u77IYeCgrMvHCtBa0ha2cH28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761305798; x=1761910598;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xS/jV9mpqgr8ibLarMcAksgGJ99MACM2hNYnbMBce6w=;
 b=AmM888xuCC01XX7+vjtcBEsUZ1d2/7XG4PWKe4z/bfjBAXQsWkFfInUTl8m8ndvsWu
 CD4JasrRYUgMzhGDpqjJmoXIgBAEgOXjsj6Z1MxXmYRS7617R4QxB44OlQR6a1cVY/+J
 TifJ0A0KNyt/KTC7H7OgKgb6qobxEjTplIMJo+6YfyrZSP0C86vGrTmeNG1OPtkcvYtm
 Jg8OSgttsDwNToqtxS40jPNdTHEvmgWMnpEmyF9Z/PR4isUpjBzNIZk+Fqu4o5NofKZT
 EfD9fz4INAUuHGOwDLB93h5m0z6S67LYkdyp1gJnv3P2R/qkjBu4iLDCQ0RtY4MTKG/f
 WU+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLVfYBPMAszZcVXIJkIABTAv1A9muOIFdsI5/W7SMd2Y8b8juNqa/9Z6X/Y/jHgnOBbiedUSh/7g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSiDcOX/I4qzBrwAo46HX6pywrU+VXZVxfvkqYdZy3rEaJc8nO
 h1RFq9AdN2mBcub/DO2y07MZDsVi95jIImi2A9/9kToysbLfvh7Nuf6pIk18udK4Wh8=
X-Gm-Gg: ASbGncvo6IXvY5rZRnbumNC8LxK0SmXROgNXBLdsGirwnkVUJhCh/2hsxuMgkcZ4gde
 Mf/MUDZA7U0Y7bDh6pAmauqk8UmqZVoh/Wdz9wkTv8oV0EtpilOWNmYNmiCMbSZPEjpBMNXl2ln
 0eMPMuP+TClVby61MG4PsGvKERejLB18Y5y/eJRArslqXZATrSxLJt/2i6tpDbgHy1ZZCiy7VPs
 za7to8eRxi+ExjHJSSYir3rSbMuNtvTYt2gtYcoUwsq3MgMZepKe7Si6ppDHyYjsKh90FVnjQNF
 IjRP2fZuEPvqVxkB8Oo8ypPyDV8EG126Q3TMDGMvH+xCuGNI8guWadd75l2vAayDwLQvYBVWoJt
 TEGBD2driWLA5dQ5rhpMY53OloaboRtEHuEpNTrg7As3m8+vGBxiDcrUdncD4E0BGRhMZ5Adf/W
 ZA+dqfYRU+HCzX+3lHoZ6k0Q==
X-Google-Smtp-Source: AGHT+IEgyDCTn1Z2dJQpbcfsC4iMVoN0ZOj2eMaELwMMAzQ8g1Pm25wE6XfUCpVu0Tj9TVGdsm1fhA==
X-Received: by 2002:a17:907:6095:b0:b4f:6d1c:6f4d with SMTP id
 a640c23a62f3a-b6d6ba8ef1emr270363766b.5.1761305798580; 
 Fri, 24 Oct 2025 04:36:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebb3299sm4215129a12.2.2025.10.24.04.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:36:38 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:36:36 +0200
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
Message-ID: <aPtkxAl2lBSBjaRw@phenom.ffwll.local>
References: <20251023083449.GA13190@linux-2.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023083449.GA13190@linux-2.fritz.box>
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

On Thu, Oct 23, 2025 at 10:34:49AM +0200, Thomas Zimmermann wrote:
> Hi Dave, Sima,
> 
> here is this week's the PR for drm-misc-fixes.
> 
> Best regards
> Thomas
> 
> drm-misc-fixes-2025-10-23:
> Short summary of fixes pull:
> 
> panic:
> - Fix several issues in size calculations
> 
> panthor:
> - Fix kernel panic on partial unmap of GPU VA region
> 
> rockchip:
> - hdmi: Fix HDP setup
> The following changes since commit 5801e65206b065b0b2af032f7f1eef222aa2fd83:
> 
>   drm/sched: Fix potential double free in drm_sched_job_add_resv_dependencies (2025-10-16 14:26:05 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-10-23
> 
> for you to fetch changes up to 23437509a69476d4f896891032d62ac868731668:
> 
>   drm/panic: Fix 24bit pixel crossing page boundaries (2025-10-21 11:28:03 +0200)

Pulled into drm-fixes, thanks!
-Sima

> 
> ----------------------------------------------------------------
> Short summary of fixes pull:
> 
> panic:
> - Fix several issues in size calculations
> 
> panthor:
> - Fix kernel panic on partial unmap of GPU VA region
> 
> rockchip:
> - hdmi: Fix HDP setup
> 
> ----------------------------------------------------------------
> Akash Goel (1):
>       drm/panthor: Fix kernel panic on partial unmap of a GPU VA region
> 
> Alok Tiwari (1):
>       drm/rockchip: dw_hdmi: use correct SCLIN mask for RK3228
> 
> Jocelyn Falempe (6):
>       drm/panic: Fix drawing the logo on a small narrow screen
>       drm/panic: Fix overlap between qr code and logo
>       drm/panic: Fix qr_code, ensure vmargin is positive
>       drm/panic: Fix kmsg text drawing rectangle
>       drm/panic: Fix divide by 0 if the screen width < font width
>       drm/panic: Fix 24bit pixel crossing page boundaries
> 
>  drivers/gpu/drm/drm_panic.c                 | 60 ++++++++++++++++++++++++++---
>  drivers/gpu/drm/panthor/panthor_mmu.c       | 10 +++--
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  2 +-
>  3 files changed, 62 insertions(+), 10 deletions(-)
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
Software Engineer
http://blog.ffwll.ch
