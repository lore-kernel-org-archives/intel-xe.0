Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90184C83F1D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 09:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8C810E9EF;
	Fri, 11 Jul 2025 09:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XMWwUyse";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6690D10E9EA
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 09:27:52 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so1219356f8f.0
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 02:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752226071; x=1752830871; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=69R7fK047N7Folo8KI4FUcJCF/Yw3fDsI2bPC+kFnCc=;
 b=XMWwUysei6MrLab87YpWP3019m55OKxmqdW/DCIXeJArWmgJLUhjlaHKy5U7BIXQU+
 cHARFFGSoG5zdBNDBvFoF1QMP8aBdzXaUMp1RYRAv9yfZTnPtjE0RfDfU4KltybA5ZKU
 wAV+cE+q935Zf/hvZYHVL5Gtonz7wQzbQMF/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752226071; x=1752830871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69R7fK047N7Folo8KI4FUcJCF/Yw3fDsI2bPC+kFnCc=;
 b=gKRw9zg+KB4KR/h3VsHgWQI2dU9IgZkhCeF3LknFTQQI1DXPLAGXGLgsphQIsODnL1
 Ih+dfakdYMbh6k8YdD+gx2Ls0rePK9i2bYtVQVBfOXpSzXdaqWlUgW2ywZEynhXGvwae
 8TH/3dtNaGY/kil0sXvDlVKcqZV8wzf5Ln2gFy8ywfxoXrONELvmBn0mRV0DbPL3tsse
 VHtlQ2ePEemKJLp5mDkmVf4pZAh4Sot2kYUp3Spa0e1vTms3sbqTjBuiUosDealU1ESX
 LjWHugM7Po8bu9SorOH0yd11kQcy6JMgisWsJeF0OBG+b8gen/iMPIT8uwYxQrAQhsxa
 Y6Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMks2oSg92FcChvCskrJ1nN7/3c8bsYuBWtX1J2Jmuuiv67S4MGeVinJj1GaLMQiQP3zpR7TQ0qQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVJ661VM3hBgXYfQ+xOHmXdzldLkoc1ntLa4xW2OYx4+Qek2Sz
 g+IkM7nNnxcAx/vftczldQv+QC1MmtzDxpRLEWQLb6GUNP76KsSPWdmTj+w2rICf5wo=
X-Gm-Gg: ASbGncsBg/qPCOqZgam/X+DMTVfVaXtaOP37AxLeoZXxfHQvfVYsGqEQP5yI59zGCfa
 PGcLfYhYpW2myhrmSggMdLOE66jilLhGbS/P31dNemgQiHfmZmr6Mv8bWgzYImN4ujmgTfIiiyh
 6ju1UUJxVRfAOKK9HIKp1m8njbCqyNrq8qmSJmAwjRUO8JKCmAPk9mXEzWPWaZTt1p3vwqPYOrr
 mR9DYgKfZxGkxq1QDfd/Q7+AXK36pHA5H6K+y9PQGFbk+B7GphE3tudt83zHwLTA3XtCQXQnTNS
 i9TGYQ9kpot5vPndYo6zZmf6V9sDAdaCXXAHu18SehIal0RxPIUPXft6xmcUibb7oZsRf1OiLKH
 1i/SQZizew0F5xFPSws9YrRkP3Im3mNHNaA==
X-Google-Smtp-Source: AGHT+IFriAEMZH8Zv/Is7lzL7RiYRWbTomXRefGYi40KVJkjj1sFrZgi4AbLTX5v8af+ec6IcGKBaA==
X-Received: by 2002:adf:ce82:0:b0:3a6:d95c:5e8 with SMTP id
 ffacd0b85a97d-3b5f18ceb32mr2270196f8f.35.1752226070793; 
 Fri, 11 Jul 2025 02:27:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc1de0sm3931464f8f.24.2025.07.11.02.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 02:27:50 -0700 (PDT)
Date: Fri, 11 Jul 2025 11:27:48 +0200
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
Subject: Re: [PULL] drm-intel-next
Message-ID: <aHDZFFIHA3GnbD-f@phenom.ffwll.local>
References: <aHA-qrFQ00TaNsGr@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHA-qrFQ00TaNsGr@intel.com>
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

On Thu, Jul 10, 2025 at 06:28:58PM -0400, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes the last drm-intel-next towards 6.17. I'm covering for Jani here,
> but in the end we got just one patch that is a fix, but let's push that soon
> anyway and minimize the -next-fixes round.
> 
> Thanks,
> Rodrigo.
> 
> drm-intel-next-2025-07-10:
> Driver Changes:
> - DSI panel's version 2 mipi-sequences fix (Hans)
> The following changes since commit d6a59ee852758bc69c4cc821954db277a2bd5b93:
> 
>   drm/ttm: Remove unneeded blank line in comment (2025-07-02 13:31:20 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2025-07-10

Pulled into drm-next, thanks!
-Sima

> 
> for you to fetch changes up to 11895f375939d60efe7ed5dddc1cffe2e79f976c:
> 
>   drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too (2025-07-10 11:30:32 -0400)
> 
> ----------------------------------------------------------------
> Driver Changes:
> - DSI panel's version 2 mipi-sequences fix (Hans)
> 
> ----------------------------------------------------------------
> Hans de Goede (1):
>       drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too
> 
>  drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
