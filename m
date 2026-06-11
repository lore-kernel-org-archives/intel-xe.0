Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7650CD98D5
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 10:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF9610EE7C;
	Thu, 11 Jun 2026 10:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NAlhujsI";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA6110EE75
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 10:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781175591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OE5i5Cs1x/Y1/tYzMUIth7XXWL2BCwQTkDQ8GlOHrbw=;
 b=NAlhujsIs/QD47gCZYuAxzMY7ffp5l8qiEPIaky+2KIQQEzqojs6FYwazTJTLLfS6klIDm
 Y0/9n06U4Lwv22RidppNSHsIeejcEb7rqVkEzsnUTt+0eyCksMHzXfHLnCXEri+TYet/P1
 VBk4Fa3MohgcCizYsLNhAmqPt2dcooQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-UzixBpXbO7qFXGtrhWf0AQ-1; Thu, 11 Jun 2026 06:59:48 -0400
X-MC-Unique: UzixBpXbO7qFXGtrhWf0AQ-1
X-Mimecast-MFC-AGG-ID: UzixBpXbO7qFXGtrhWf0AQ_1781175587
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-45ef6b407b4so3399740f8f.1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 03:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781175587; x=1781780387;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OE5i5Cs1x/Y1/tYzMUIth7XXWL2BCwQTkDQ8GlOHrbw=;
 b=NUHq/3LjTA+WjlzWeqoa9Cv8Z0zD+bJ/E7Az5uppIxAihW+0yU6dTRStEm+Okm9QHn
 6S7sFOkyakQ5musE8m32lhimfTQY3NMsMpVRQ03dz5ZwFFA/NH+qKxnPTyRy3dgF3QCO
 dEfQH/WUCuZiSQS10WyGczlmne1RK7VJeR4UJW4KwoyHMnXleMnmRumBXc+xMmDEI3fD
 xyMEqKTXmH/ugEjYpN5XQigBwYrmhLieHX7A/HD6FHHVEKGIvbF8Q8ccGkFZPRxTmZ/G
 Q+bEQ6dmIjpL90cItbfkMrlg3m3I/Igd20nKEjPelJzC+niWR8OrwbgllqK0z2sxwqJs
 bhUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UYAKp013W5cayKjuyTPtyTMZw4qLjXzdvATlK4EWsofZawKfHkkJh4Kfvvh1pfESvEv4HepgvAA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+GOKiSlwO2dMur4q3VmOMTQsOhDCCFS4pfVwDO/UaHI9U7cdS
 Xn8N/CQmptM2MToqVu3Q1MP8w9fOHmVnxplIJf5WQKUMo+ZbqzBeWrEkZtIPzLChBN4kli1o25y
 ve1jKUbl0hiU1i1cyygLYqZbafJFEzbKgaLyGMq3nwttz1pUKmGNbLqGSLmn0lgUoJ+5c
X-Gm-Gg: Acq92OEzUzRQN6Yd7om6jCBB+5FmQOYf9cykzmXGgHGJx4ZDABItK3YXsNvBkSAq7lq
 Mufm0INddCb+DLDKqOj2/snKcsErWJrpjv7dPYi/v8u1Z5i0NSaRzZ1g6HchM+QAmFUWXNOE+tB
 xla67VyKi8ph7DIvvLibBlhjjTvqb3PJ17FfDW68k27Ov3hVRyj6KVT4ccVrp2oiV/mvzjRjWlh
 dD371/wdVTBwtoEOuOEQfVEG3HPJckhQC5AL4RS4/iEN1rY3XCcFdqk8762QiW6wn/x79XRAUWU
 tKlHrjGBTYRMQfIe5RH822jyKFXpNO5p0XJ3Rn9mRCqfO4wPD/cJQKs267Zhoisjg7cO8dnQObC
 dFA67oUkOqWnA+LqAhpBp62AsZATZe7LLxgSdAlOO7mWwQvP4+sNyFHeus5bMdmekqrUC5bgMb4
 sdJUcLyfBxBbGWTpE=
X-Received: by 2002:a05:6000:710:b0:460:1c5b:f25f with SMTP id
 ffacd0b85a97d-460677b1af7mr3240533f8f.20.1781175587113; 
 Thu, 11 Jun 2026 03:59:47 -0700 (PDT)
X-Received: by 2002:a05:6000:710:b0:460:1c5b:f25f with SMTP id
 ffacd0b85a97d-460677b1af7mr3240484f8f.20.1781175586716; 
 Thu, 11 Jun 2026 03:59:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcde3sm81947989f8f.1.2026.06.11.03.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:59:46 -0700 (PDT)
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
 amd-gfx@lists.freedesktop.org, Zack Rusin <zackr@vmware.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v5 01/15] drm/amd/display: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <45aec54a-ec80-48ed-9bcc-84e7bccc11eb@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-2-tzimmermann@suse.de>
 <87y0gl5qw8.fsf@ocarina.mail-host-address-is-not-set>
 <45aec54a-ec80-48ed-9bcc-84e7bccc11eb@suse.de>
Date: Thu, 11 Jun 2026 12:59:44 +0200
Message-ID: <87mrx15om7.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qbzv2jdm_-3RZwwAY5a0o8RkEjM6Fgu_3vSg4zXWtlA_1781175587
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

> Hi Javier
>
> Am 11.06.26 um 12:10 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>> Hello Thomas,
>>
>>> The mode-setting pipeline can disabled damage clippings for a commit
>>> by setting ignore_damage_clips in struct drm_plane_state. The commit
>>> will then do a full display update.
>>>
>>> Test the flag in DCN code and do a full update in DCN code if it has
>>> been set.
>>>
>>> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
>>> to ignore damage clips") introduced ignore_damage_clips to selectively
>>> ignore damage clipping in certain framebuffer changes. This driver does
>>> not do that, but DRM's damage iterator will soon rely on the flag.
>>> Therefore supporting it here as well make sense for consistency.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")
>> I don't think that a Fixes tag is correct here? Your patch series
>> is changing the 'struct drm_plane_state.ignore_damage_clips' and
>> the changes make sense, but definitely isn't a fix in my opinion.
>
> But shouldn't we have added this test in amdgpu and the other drivers as 
> part of commit 35ed38d58257 ? Sure, these drivers don't use
> ignore_damage_clips, but it's still an inconsistency wrt damage

I don't think so, since the original scope of ignore_damage_clips was for DRM
driver of virtual devices (namely virtio-gpu and vmwgfx). These do per-buffer
uploads instead of per-plane uploads, and so there was a need to force a full
plane update if the framebuffer attached to the plane was changed.

Your series are now extending the scope of ignore_damage_clips to be used by
core helpers and force a full plane update when doing a modeset. This makes
sense to me but it wasn't the original intention of the propery and that is
why I don't think that should be considered a fix.

The only patch that IMO is really a fix for commit 35ed38d58257 is patch #6.
Because is true that the plane state ignore_damage_clips was carried over
when the state was duplicated.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

