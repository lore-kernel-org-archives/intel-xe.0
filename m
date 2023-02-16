Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982A2C61DA4
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 20:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6877D10E373;
	Thu, 16 Feb 2023 20:19:00 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CCE10E199
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 20:18:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n33so2485364wms.0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 12:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gV5rWMpBUKrLaDJeRT3ZsOG2NL5wYWp+tUxeIVGpLe8=;
 b=ayNqAAhtWMvqLaLONdTuEuZviGFivrgfSyq82yZ4SYZMCIIDmZdDXSusEP9oYt4GIp
 9RSUsAA2yQ9qcAxVoQumy3nrO+Gj0NZr1EHnlXU8s6eAJYatq53RJ48aPIA5U+JiDIq7
 1k+n396ufxCY7efckWfBpyC5xeGZj+L0i0kEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gV5rWMpBUKrLaDJeRT3ZsOG2NL5wYWp+tUxeIVGpLe8=;
 b=LpRhixI7sP7EQCEERigsGqwrAH3j6tQeraEI3uC8eHFKd4vc2Jfagj1kDqsm+k2Jfv
 CYac69hzu9Ba0LAabTkRfgG9XVWigaDpzVkaeTKAidqwW70X+pxipfCazFEDt97FSiMN
 Jlx5KlH1gGFwbzJ0jhzoF2Yhds7qnJeF93wi4sEw8ILOp/Wv4rAbgBs05cuksVdxi6Ev
 8j+t6q4ZXC8ZJ2EJE1cCn0X3fbNiFUShqHNpGy85a8yOltJLLa4QROfu3hw3VGJyoqWi
 KEIynmuPiQeNpT7qmmU/wpb/ghyaw84HaB2E3VonHFd2h/eCvTGhiRXjWq/0WGXvy4kX
 Yd/Q==
X-Gm-Message-State: AO0yUKWPSKFHonkq1T5K7gHtPp27XUT6k182H+16tLC1G5MoD23NBzDw
 LpC4g4urgEz2kxsRH9C0OLITiA==
X-Google-Smtp-Source: AK7set8ZvPufhv4LOvsrxJtZZQ3vK1ykDz1T4jGr712q4FvkjTlAKJFxXM0hksOu+sFnWsEPyWW17w==
X-Received: by 2002:a05:600c:3caa:b0:3dc:5ae4:c13d with SMTP id
 bg42-20020a05600c3caa00b003dc5ae4c13dmr7038314wmb.4.1676578737317; 
 Thu, 16 Feb 2023 12:18:57 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 i3-20020a05600011c300b002c4061a687bsm2261733wrx.31.2023.02.16.12.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 12:18:56 -0800 (PST)
Date: Thu, 16 Feb 2023 21:18:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <Y+6PqOdRf+vu8rZc@phenom.ffwll.local>
References: <20230216162729.219979-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230216162729.219979-1-thomas.hellstrom@linux.intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
Subject: Re: [Intel-xe] [PATCH 0/1] drm: Add a gpu page-table walker
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 05:27:28PM +0100, Thomas Hellström wrote:
> A slightly unusual cover letter for a single patch.
> 
> The page table walker is currently used by the xe driver only,
> but the code is generic so we can be good citizens and add it to drm
> as a helper, for possible use by other drivers,
> If so we can merge the commit when we merge the xe driver.
> 
> The question raised here is
> *) Should it be a generic drm helper or xe-specific with changed
>    prefixes?

I think if there's some other drivers interested in using this, then this
sounds like a good idea. Maybe more useful if it's also integrated into
the vm/vma helpers that are being discussed as an optional part?

Maybe some good old sales pitching here to convince people would be good.

Maybe one of the new accel drivers is interested in this too?

> *) If a drm helper, should we use a config option?

I am no fan of Kconfig things tbh. Maybe just include it in the vma
helpers, or perhaps we want to do a drm-accel-helpers with gem helpers,
drm/sched, this one here, vm/vma helpers or whatever they will be and so
on? Kinda like we have modeset helpers.

I'd definitely not go for a Kconfig per individual file, that's just
excessive.
-Daniel

> 
> For usage examples, see xe_pt.c
> https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_pt.c
> 
> Thanks,
> Thomas
> 
> Thomas Hellström (1):
>   drm: Add a gpu page-table walker helper
> 
>  drivers/gpu/drm/Makefile      |   1 +
>  drivers/gpu/drm/drm_pt_walk.c | 159 +++++++++++++++++++++++++++++++++
>  include/drm/drm_pt_walk.h     | 161 ++++++++++++++++++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_pt_walk.c
>  create mode 100644 include/drm/drm_pt_walk.h
> 
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
