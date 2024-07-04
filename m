Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50810C30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 14:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B1C10EB2E;
	Thu,  4 Jul 2024 14:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hetwEk8x";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CD910EB38
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 14:46:05 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4210f0bb857so859085e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 04 Jul 2024 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720104363; x=1720709163; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wCYmlGQa8y4SoHJ7HcU4A9E7topob9weKZ3eCRaYec0=;
 b=hetwEk8xmF964Zu3HwwtNF4vIs8O3/6qnNW2rAA06vX+bIARRmtStA8PgwAFNAt4F3
 Yq90q9lqXXxeTCPWf5axknrLAbd8YrVJjEdMF4GPKKc/xClIH/7KPKsXBVOLjDc5REYH
 aMcPdjfiY7vMS8rjsHkP1vajir11gaYgt6nIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720104363; x=1720709163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCYmlGQa8y4SoHJ7HcU4A9E7topob9weKZ3eCRaYec0=;
 b=Z8r+m2ph2a5FLhgOsFNo/BDbr7IZPSq57Hu7M2EqZPkQjSB641LE4ufL+SWqtJSwhC
 EhdEiiZwbMZivA7eUt1PRPUHbGcF6LIt6r8xwRTFdBoosKdkNkrmjWbnLRAEpZ0fCHUX
 EfEH1AhPdYg5/vmsuzjms8/zSx1S+qgCHUsVgXScQqY6CvNs0R5Qs0p2n3KwdmpC6+wm
 SgN8beVDL9L6nDGJqk5aDloUrc2U1oxVp3p0BwD4Voml4fRmuk0/TLWe96nw6I6+tbwd
 +L8OS40Grf5YKw0anm8pccX/wPveWplBLhdwRQ+9rMXBVZ3ZMwkMWyptBRlvo7u38rF3
 ft2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZumUDDRvJMKODQfTWPmewEWeAcF1iQTPbJEXPXUCR79DOsbXhjLSk0jdaGItjnemYEqJ1dbU+lmcT0mSQkUnoNGgPIWmgk6s0fa52Bo4=
X-Gm-Message-State: AOJu0YzVVMZEp4hVkT2K0QR8iYrs/5Ttus9Z54emlBLTtjRqN3wAVxgC
 8oCAIfKpBHkrGS2x0B/lIzQR+UI3p1eIsAJHonAQ2Bn/HfLb0p+pnGQD+1dtBEE=
X-Google-Smtp-Source: AGHT+IGCpONx1dysU29lSGvTPjkrn3zVgFGWLpCN1rconKEXwes7yA2BLuxynXO81Zdb3ug8YNli9w==
X-Received: by 2002:a05:600c:35d4:b0:426:4920:2846 with SMTP id
 5b1f17b1804b1-4264a46b0bbmr14016985e9.3.1720104363510; 
 Thu, 04 Jul 2024 07:46:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d6677sm27116215e9.17.2024.07.04.07.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 07:46:03 -0700 (PDT)
Date: Thu, 4 Jul 2024 16:46:00 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-xe-fixes
Message-ID: <Zoa1qA2h_T5iGsTq@phenom.ffwll.local>
References: <ZoZ-wD66lgjiNh72@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoZ-wD66lgjiNh72@fedora>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Thu, Jul 04, 2024 at 12:51:44PM +0200, Thomas Hellstrom wrote:
> Hi Dave and Sima
> 
> Two small fixes this week.
> 
> Thanks,
> Thomas
> 
> drm-xe-fixes-2024-07-04:
> Driver Changes:
> - One copy/paste mistake fix.
> - One error path fix causing an error pointer dereference.
> 
> The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:
> 
>   Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-07-04
> 
> for you to fetch changes up to 1f006470284598060ca1307355352934400b37ca:
> 
>   drm/xe/mcr: Avoid clobbering DSS steering (2024-07-04 10:36:30 +0200)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> Driver Changes:
> - One copy/paste mistake fix.
> - One error path fix causing an error pointer dereference.
> 
> ----------------------------------------------------------------
> Matt Roper (1):
>       drm/xe/mcr: Avoid clobbering DSS steering
> 
> Matthew Auld (1):
>       drm/xe: fix error handling in xe_migrate_update_pgtables
> 
>  drivers/gpu/drm/xe/xe_gt_mcr.c  | 6 +++---
>  drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
