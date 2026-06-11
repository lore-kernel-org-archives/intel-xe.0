Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C96ECD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 10:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70810EDFD;
	Thu, 11 Jun 2026 10:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V4wDati0";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B46610EDFA
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781172689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8J03CxoywVvGkdqDT93IzLl+xZxTV2J8FpCDOD6Xyq8=;
 b=V4wDati0cTd3kX5sMPsw3op3tmBPD0gd4A6IfmxwLfYgxXcXdJx89HZu5LWLlBs0Ps1Tr0
 5uExXAQbYeULw1ta3bFLyJDqOlAareV/IpqtUu1IhNRgb/I4NVnINKIhDKLEiF4o7fYn1+
 vlySgvoppTd5TWK78f9zWAqwIYx3iiA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-fkWyOqX-Mr-QIDnKNnB-Tg-1; Thu, 11 Jun 2026 06:11:28 -0400
X-MC-Unique: fkWyOqX-Mr-QIDnKNnB-Tg-1
X-Mimecast-MFC-AGG-ID: fkWyOqX-Mr-QIDnKNnB-Tg_1781172687
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-460198535bcso5015259f8f.3
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 03:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781172687; x=1781777487;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8J03CxoywVvGkdqDT93IzLl+xZxTV2J8FpCDOD6Xyq8=;
 b=TCUtt8PErDTat3XUUM9cH4V2xexXtxToHUmtr/I2uJSQWdaSQhfN0dVpN8Vze2hRG5
 pGw3iVjkzLl08RfRygYj7WG1XXTFxkp8zX72XRXAnlxK8nRNcVtoJlPeqrl614P2rpbP
 2A7slFUFP9EpHBO2VBRtAzn76u66IqGNwZ1RnjvbnLJcLnJAdvbaFvW5gGAWody0AOoo
 eJjJPMSAJVxmuznJL5wHq4PB97nd8EvXuNLN78mgYkQtV5eb6ZQ4MsXtSjp9RSosu2rg
 gvKMgbinFHL99IlkOis3JodBbj12jeOmzdCviU8vMrW0uBu7AS40rlYJy9BQejRI0etM
 IoiQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8RkUwJW5EiVe+Tt8W9uYj3iQrk0CtVJHFoJTER7O+RGvHv5f59S2JCib850aIAq3mtFLEu3CdC+A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPSHeW/mb0LhMCvHCl5a1KFVKGybJ4G8liKsFx9I2h/oh3wC0l
 Dq2dZ6fQBkAOYVQGyADoBUNX8+LwzUChi9FT18A72YCDp4SYc6knlDgX3JQ3027hG6A0y3Ja1rQ
 Iq2yHrVx2OLLk7bRcnOVN+wU7gWGeh5mFh677ZsHZeKx0BA7BKBAwpspYltVL3KwCSPDg
X-Gm-Gg: Acq92OEK+FzibPzf/rKstvZ1V4PKpdCi79nVk2I0DVvj7fVbXl450TpVC0poCCrEbJY
 pFGLQbiGD6qp6O1st8LJLAHxBCNONdesSsbPmX6zO7y/ZAguay/FVulwhvM4KMsqmYMYJgnGhgr
 vCbLd5I5h3Nx76DdTw/0HcO0X/AbNklm3qJhVL8R9gFByBFkom6Tt5eVIcG9ENVn2kZ+//eLaLu
 zU35fVZ/u0QNME3ReOKCIxVfSQ1DHJnfQzLuEgTb0WPgUSznNpBMtdlDPUS+T4ACgc0LZotjljv
 X62S8VZG5YhAKbp7N/R2ZgNRkYeShCioCEIf4kiPQ/f5+YR7l5i0KCtO4JVLizX85ttQ5I5hX7t
 RvjuPyyFg5VySiWfwKz15ZwDIS26qE4L7RWNHi76AVtE4tTmWqp+590Hxnd9FMX8diwknCvfswX
 5dsGq+kT+6T2XvSIc=
X-Received: by 2002:a5d:524f:0:b0:460:3233:bee8 with SMTP id
 ffacd0b85a97d-460677b28camr2150185f8f.40.1781172687239; 
 Thu, 11 Jun 2026 03:11:27 -0700 (PDT)
X-Received: by 2002:a5d:524f:0:b0:460:3233:bee8 with SMTP id
 ffacd0b85a97d-460677b28camr2150129f8f.40.1781172686816; 
 Thu, 11 Jun 2026 03:11:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2e4b18sm63288157f8f.10.2026.06.11.03.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:11:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklkml@zohomail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org, Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v5 02/15] drm/i915/display: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-3-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-3-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:11:25 +0200
Message-ID: <87v7bp5quq.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NpbKevSceeEGySzHdXUzp094mEeGqU1EOJYsGuC-DaM_1781172687
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update. Commit 35ed38d58257 ("drm: Allow
> drivers to indicate the damage helpers to ignore damage clips") introduced
> ignore_damage_clips to selectively ignore damage clipping in certain
> framebuffer changes.
>
> The i915 driver does not modify the flag, but DRM's damage iterator
> will soon rely on it. Calling drm_atomic_helper_check_plane_damage()
> right before drm_atomic_helper_damage_merged() guarantees that it
> has the correct state. The i915 driver does not do this elsewhere
> so far.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

Same comment here than for patch #1. I don't think this is a fix.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

