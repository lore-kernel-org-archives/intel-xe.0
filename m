Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BC5CCD1A5
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 11:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCC310EA50;
	Fri, 24 Oct 2025 11:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KlFEI83E";
	dkim-atps=neutral
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCD710EA5A
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 11:39:16 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-63bf76fc9faso3643805a12.2
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761305955; x=1761910755; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oALJ4BFXS0wmn9T8ZjhghWD+JcsUYwNx3dHdq2BSp/4=;
 b=KlFEI83EikieLKG6Gt5CoQy6j2JCDVevde3deAz6I5FLvAAImAagFOXDkMI+wuLqM3
 MxMo/jr2G2sa8LxnPOxl+AmoDogpNEfxLFjWIKMtQ81rABqBOoLiWLUWZvLbc1DXvRe6
 XhqpF0Kg0Lw9NFt3rAEKQUlrXiivI7r4Vstsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761305955; x=1761910755;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oALJ4BFXS0wmn9T8ZjhghWD+JcsUYwNx3dHdq2BSp/4=;
 b=O0PMwqLpB7pWXhbRT5g/E0TO79t+SiBOtm5XG45HAmnFETMjqXO08Vycrp5wBBRDB+
 ls+dW5T4VzSkSevzGBOTLT7OoRo6Ryti1+XzqNyuAhvZ1GKrNLev9cACe9F9p7+fJaP8
 If1i1F4vzuoHLScWUEk+SYR0FBCHfMJWr31G1ZAEmCWexJeWPsPSn5jWoZM2Ka4iJRHf
 A1yoalFN4ZnmOxjqCCYdyqMFHsOMEEe/7AuuM6qLiMxfVLlhwxQTKUg6ZD5txhnKDLyV
 SZ5Y+A3IjYhjF9a32PcwdtVt7NrjoPWfe9zGDKh+3KoEHdGuk0p4a8ntl0gm3ffSwUX2
 Im2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB4eEz+vIQp/4inLzonSyVCrhl3xBzx/Oixr3bPN0wLBBEtdONZeD0HzZZxPfLTp3WWURecfnUyA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPnjpdHjzhqOQ9PQkyCzfx+AtdHeNl2mNx15IDdRvmizDON5Lo
 WCJZMuUarf3mpWOOh1c00/+NorS6/HVeJHW7KLuZBoWhfpCgauTirauXM6RXSLEyrFo=
X-Gm-Gg: ASbGnctWi4/+rCEwGKWKZV3dVgILWfa1+m6/zudUFPWzhsyJnivCuKif56ZOGhHZ2eG
 +Hazjftg5FVvv6zXhlXdBeG0FTwBsPx+08wmD1ezrZgL09YeN/LpXS4w5l6Ovd9Ym+WXOFSXuGN
 0Njw5RamqKbDSuYTMkvtJjTtsibCmbtdtXfZw/6h++UoXsI0gOOpr0un3xAr2I2dQi7tKZ4a4um
 4TOyTvpquGTq2sZ0E5QQdsk2CHihNVrk9fRcdsWpKZASCAZY1w7vC0pzZvBKqqxFV/Mbxbhrk8q
 hR8JZcd/cssw0Xmki5+NXSgnWauWt3eTmDyCcPm3TU0kTF6+7mvjI+6H1lyiuggcncpLx4JjvKO
 G06675sZXK6j/EFKeoudaDb6UkZzlbG17TACr8enJ3amAAavvysNZw1BQs9bhPUK8FhihyYMDiY
 yNaGEltEW8WQ2GcaiksPj03Q==
X-Google-Smtp-Source: AGHT+IHuviw89OJ98pH99Dj0HbHVPFZjbGrY22q7RmBUEhgftWt2uXHRGFqpK7xgUG4k9NbTX8PxYw==
X-Received: by 2002:a05:6402:847:b0:63c:6ddd:fe35 with SMTP id
 4fb4d7f45d1cf-63c6dddfe90mr20584436a12.10.1761305955134; 
 Fri, 24 Oct 2025 04:39:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebcd742sm4342843a12.15.2025.10.24.04.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:39:14 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:39:12 +0200
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
Message-ID: <aPtlYNb5S0ooNqY1@phenom.ffwll.local>
References: <aPojgsvNYOU0tN4U@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPojgsvNYOU0tN4U@intel.com>
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

On Thu, Oct 23, 2025 at 08:45:54AM -0400, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes our drm-intel-fixes PR with a single fix this round.
> 
> Thanks,
> Rodrigo.
> 
> drm-intel-fixes-2025-10-23:
> - Fix panic structure allocation memory leak (Jani)
> The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:
> 
>   Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-10-23
> 
> for you to fetch changes up to 789e46fbfca1875671717a20a916ca1a920268e4:
> 
>   drm/i915/panic: fix panic structure allocation memory leak (2025-10-20 12:53:57 -0400)

Pulled into drm-fixes, thanks!
-Sima

> 
> ----------------------------------------------------------------
> - Fix panic structure allocation memory leak (Jani)
> 
> ----------------------------------------------------------------
> Jani Nikula (1):
>       drm/i915/panic: fix panic structure allocation memory leak
> 
>  drivers/gpu/drm/i915/display/intel_fb.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
