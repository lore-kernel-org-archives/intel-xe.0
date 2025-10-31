Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534DDCCFA05
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E0410EC10;
	Fri, 31 Oct 2025 18:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="H94SrdI/";
	dkim-atps=neutral
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107EE10EC0D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:13:19 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so436930466b.0
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761934397; x=1762539197; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LvDcl7aUeFUyKsgejSQVUGEaPvCe4KSsG/NO0WKzeoc=;
 b=H94SrdI/Ud/fnWy8zuyYwEWNBNgozG5E3zI5NNmNuvbJjtXzqbyz8+R7bAGqYZdXOI
 MUFl9LiwGWjclLtUzZJ/9eqacNb04A9JG69wIq4e1tiPHNjc0HjSb3VZwudG6ZFbBaGE
 7z2XUqJMthQZ/elq57NQfagKZeUs5e+5iZ1E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761934397; x=1762539197;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LvDcl7aUeFUyKsgejSQVUGEaPvCe4KSsG/NO0WKzeoc=;
 b=xSC/7bZnsAmEjgHUUbJZOn++o/sL8LvhLrDnwMMCNjlPpvjb26uEGrNjQQRjK/I52q
 SyzI2hd2OqWpWIvHE+k3xhJIX4e2yyvfq3qdZcfhICrL4rpxJqsJHfLy3fFF5sAbtjrr
 6YMwzAuu+4DyH+YKHRrK/qW9VeGiitWuhN/FZt/yPSepgcZ+8iD0Vr9ntrLYB5NKhruZ
 tCA7lMkKf+Pn/MbjcwmbyAod6g3nmlsr3Lryr3ptSn2+/+eJcF5pr4tR2XA7QnzIjmAS
 6JP2y3R3HHlIEqCZA5bMvUwvOK+9SsERhbUL8N+V3fPjkHDVdRXzgjMDD1svuqq33zXu
 m4bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc27X41Ce5NFgU+OZ4/o9cZ7v5d5ZPTnrY24KTDvCrWSfo+xWnGkTdV7ZCvy7KcjqARrGF9Qa1Cw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEUHLK1BLNPwAW8SgRxLsLU6Xh48YX+IRxTv7JH2RENRtIO2NW
 lcTWHUhHn22whHR0yGPDdvHP0ntE7dtsRqX8a1P6zWV3smMobmdIVueiSMr+q5MzEeU=
X-Gm-Gg: ASbGnctAY3OmA4HU3WEUiFOScdraCMS40AI5xAcfiNWmmGNbQZhkg/7bIKSM1B5sPS7
 wwcD3VoaPoSC3qB/Gox9V0+175fHV37gSgXp2fXLL5bY8QTd3agG6Th4UavpCCQ9QsuVXvorkqf
 eupRwp9FZagGC7WRmH/hw+buIGojM4fnZgb1c4+5+MRTpSd8JvaPfYYK2ctZR3PVbapePpy8kyU
 CFiGIEKQ02Oj+Y6nF6lSl/wzTwNwFiAqztTKL9dqZElIFibr3AxL0JWb6fJh8I+mK4I2eQka49g
 0hvL93cI/aNbFFKb34wrX3+/n05RLWYzMoJtfCByKhh0cEkDRf3FO/4xPmV8B6VMrDFEZtVujAG
 vDRkgRwBDqCxd78NAIsRnpGcXzgYo7YOdE0h32YBH3/4k9fFoiS2xkDOnwrzHWDt+bD5ez+xIzc
 R7tQ/c3Vq9Eauvn4nQl2HUCQ==
X-Google-Smtp-Source: AGHT+IHVQtSYIMKoaB09gS4Ym2WtHZOQB6rH2Sr43gGLn8sfmn5TDYxYclk0MPWzHZLKlEq2ORS/lA==
X-Received: by 2002:a17:907:868b:b0:b50:9863:dbe0 with SMTP id
 a640c23a62f3a-b70704b26c3mr433135066b.37.1761934397541; 
 Fri, 31 Oct 2025 11:13:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b70779dc143sm237175166b.30.2025.10.31.11.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 11:13:16 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:13:15 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-xe-fixes
Message-ID: <aQT8Oz-iKABeZkCj@phenom.ffwll.local>
References: <o2b3lucyitafbbcd5bewpfqnslavtnnpc6ck4qatnou2wwukix@rz6seyfw75uy>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <o2b3lucyitafbbcd5bewpfqnslavtnnpc6ck4qatnou2wwukix@rz6seyfw75uy>
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

On Thu, Oct 30, 2025 at 03:44:32PM -0500, Lucas De Marchi wrote:
> Hi Dave and Sima,
> 
> Here are the fixes towards 6.18-rc4.
> 
> drm-xe-fixes-2025-10-30:
> Driver Changes:
>  - Fix xe_validation_guard() not guarding (Thomas Hellström)
>  - Do not wake device during a GT reset (Matthew Brost)
> 
> thanks,
> Lucas De Marchi
> 
> The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:
> 
>   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-10-30
> 
> for you to fetch changes up to b3fbda1a630a9439c885b2a5dc5230cc49a87e9e:
> 
>   drm/xe: Do not wake device during a GT reset (2025-10-29 11:43:30 -0700)

Pulled into drm-fixes, thanks!
-Sima

> 
> ----------------------------------------------------------------
> Driver Changes:
>  - Fix xe_validation_guard() not guarding (Thomas Hellström)
>  - Do not wake device during a GT reset (Matthew Brost)
> 
> ----------------------------------------------------------------
> Matthew Brost (1):
>       drm/xe: Do not wake device during a GT reset
> 
> Thomas Hellström (1):
>       drm/xe: Fix uninitialized return value from xe_validation_guard()
> 
>  drivers/gpu/drm/xe/xe_gt.c         | 19 ++++++++++++-------
>  drivers/gpu/drm/xe/xe_validation.h |  8 ++++----
>  2 files changed, 16 insertions(+), 11 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
