Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17EAC98316
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 14:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FFA10F0B5;
	Wed, 23 Sep 2026 14:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RvJuHdxS";
	dkim-atps=neutral
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com
 [74.125.230.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C447897F6
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 08:07:30 +0000 (UTC)
Received: by mail-qv2-f12.google.com with SMTP id
 6a1803df08f44-90cdfe60d5fso536896d6.1
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 01:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790150849; cv=none;
 d=google.com; s=arc-20260327;
 b=CcozPfP6oqkwPfWaX5L++Y28+hOGpWaeNN/67CQ1M4NuBRxKQdJhSAllN8dkajzmAM
 EnobxU07Wkf3mg36fQnBf8e1avFxV9tDO247TQM0Qeahiq6SLfFc8UsSvR0lYWuVrthA
 YmEriEb6KQEztdWFKsGz3moBXQVjrIu0XswGpw3IVLUZiDkl9LxzwQ2h7uysUH23QGCP
 3ker1TJ1e7QEeSrU47mB3ea6EuSDEAHi/zM4kV4t9tsDP1VLTVax47ZtKVcrlDNvTOB2
 g/ZOgBYBGbW00skYM6Xl60fQtjAyYSR0g7yPueYT+b7bUrdXtW/OhbuYqIYfHlqhGvf0
 uInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=X6tfoxJ5bpmB6e0WP97I+GLmoZutAadx7RSvw4hqVZ0=;
 fh=cYju3PbiVfCVdTS+mC06aeCVZmiQgxJTafsZhylXRns=;
 b=osLjEkTlmSvGBXE7qvb8CicKOKXTp//8ccZAKAJJ0cf1ONhHrI5f+kve3886le1OnF
 ItGjer0lKLBxTCbrGKlGE/RjlK4K4COg1ubvOzZ+1kYPzQ8haPB164zKUvki6RmkW8cx
 hZJAJKXxr9KTTgaHU4OZEwOGgHHxzKC6AAuEQoN96KW1jTfJRAIJD+7EFB7IYMDQvved
 4Q0e/9070FvxXRycu6WJ55a5RKOU/IhFyuYlmOUr8nrmvfdHcmDDJCRQmeO9W/uHG+4k
 hF7qUckkVPWcsCH2MawuRPXqewAj3TMPB4mt7nCf+okGn5j1MXEJCMMkg6Jy6bN06Jev
 EAmA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790150849; x=1790755649; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=X6tfoxJ5bpmB6e0WP97I+GLmoZutAadx7RSvw4hqVZ0=;
 b=RvJuHdxS4DzPLW74CvaE3ZUuO+Mi05YFW5wrE0Di1VXmFX3yKiAIaluwbrDcBqNJLk
 qdfeVaeqLw60CLx5XiI1x/+3Bj/Rjs2FIIet/tNKq4PBs4Z4rX7YBRRMIC7isk/YYfv3
 YsBt1dTi1pMthGIHjpYezy0TYnYzzypg7gNm+ZYMTCPRVXpfUXWDaRX4bDjRtu2SHP1u
 Ea9YL/y6pyMNU4yDovDtDPYfBBUfehja6cfUpfaAIoNRR0PNIq8PvVX00zxC1bkYagtq
 VOOckLOoiU8XuL6n514ZmJoJBKcBj+orG2QSSdd6AjRWMK+7zAtYvGc2J3B7lirxjoyi
 c6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790150849; x=1790755649;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=X6tfoxJ5bpmB6e0WP97I+GLmoZutAadx7RSvw4hqVZ0=;
 b=pADBFmhaR4zsCp/tQRgI+FchN6M8qxKj4wUNF+BbWweZLP0L/B6MxBPxlUSGQqnmcb
 fWQsKMt/p4SRdjbnWjvNAULaHlbk5RQskygCi+WK/u2v6XvBTyzE1ZtqQonu++jpRioz
 THsNzMOJ2fCkyrsbJoSy+1pyw3Etfx97MklYgDV6RgfiYWjpCuti5FIE/j+9Pl8wL9fg
 dUKDVsfo0TsNa146vPaDT6GBAV8nFw92vx7077QpEQEKehWNfZ0sp4cPsz036stnAHjC
 FF8HFjx62DdPEWa4WxK4+7BObaKxIptwUuQmv8678xucdVWwxsHn3nKhFVGm6kzGTnep
 gd1g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwmnwFEQNZcjjjNuumzo6vEBES7kq7LI/OtzmRp+NyhXr55tmXorsZipvw02CpspMLqKecd4iA2wQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++n2C/M00DtCM5acM85RQ5enLXLEWakYjKY1g3u9yNEPtZOL7Tqz
 +WcZMbGui1++cLEA7G7RliinCUQBXQoM5yvaMgG032NN5oPFT3QF2FrgzjyCDKBCNLOjLQEI4nr
 P75xh6rX12uL/CnCSS4gTjWGTPa9kN+4=
X-Gm-Gg: AYBFou0EAO5gPczoTlWTph8+e3glprukvG92ySEOnw0taIZ2rglYMhfWmxuVUiCJWkW
 kiwCY7ckdbEY6xuL6nKvyGNAkCjAsPVvLfVrqmvc1/ZJWro+x2zew9C3oqkqJrYtzsF3mQPZ+bl
 b62SYS/1a3SFvdx9tEXg19ebvg51pvrAV6yudYF5h8beo1OQlJ5wr2D+6pp+dr1lvdW2kzzhxhI
 V9D5B5NKCetC/InlXP6jwCydLUSUEG5zbP6XDSXS2jJSUyf7M3BsqNuao3KtgNrcerMnXyBqWog
 ZXBJbKWFfZgUBsCrGnGLFYIK8Hi0jPFkxSaO94YcyDpW8WsfH/5fKCtfox7I2Ns3WVQ1AqvYGM0
 9VJDWh8+D5Q==
X-Received: by 2002:a05:6214:4886:b0:90e:8be9:c384 with SMTP id
 6a1803df08f44-9140c4244d5mr29354756d6.27.1790150849428; Wed, 23 Sep 2026
 01:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260908044035.62093-1-mario.limonciello@amd.com>
 <CAFOAJEfgXY7cfLvizuxbS75CJd7mF5tewxp+PH=EhTtpy+aZXg@mail.gmail.com>
 <32f96551-358b-4874-8fd1-a685b02853e1@amd.com> <arJwOSq6-oSywTK6@houat>
 <08e47991-0d72-471f-9955-0b4ebbcffcdf@suse.de> <arJ0huW356NjqpGR@houat>
In-Reply-To: <arJ0huW356NjqpGR@houat>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Wed, 23 Sep 2026 10:07:16 +0200
X-Gm-Features: AclHuK8xgDnVa7N6ARRpfcYEwFozCo04IqFUVuiW8m2XtM8bq-AsJWi-i2VQJfk
Message-ID: <CAFZQkGz9O8dZfmxEC5Fcpa2mRHXde+FFwu4JVz3fvKTzHT49LQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] Add support for a DRM backlight capability
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, Simona Vetter <simona@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, amd-gfx@lists.freedesktop.org, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 23 Sep 2026 14:17:53 +0000
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

> Couldn't we make a sysfs write trigger an atomic commit then? That way,
it would always go through the atomic commit path, no matter whether
you're on a "legacy" compositor or not.
That could cause stutter.

> It probably would, but it would create a precedent I'm not really
> familiar with. Hotplug events are kind of separate because it really is
> a hardware event most of the time: you get an interrupt, and report it
> to userspace. And it's largely outside of the properties space (except
> maybe for things like edid).
If there's any property changes, userspace does need to be notified
about it. Whether the change is caused by hardware or software doesn't
matter.

> If we start having the argument that a property changing must trigger a
> uevent, then it means that we can expect *any* property to do so
For anything modified outside of the compositor's control, yes.
The client cap avoids needing uevents for the luminance property
though, since backlight control is exclusive to DRM if the compositor
supports it.

> "the compositor needs to be in control of it" can apply to many, like
> color formats, positions, tiling, etc.
If there were other APIs that desktops relied on for controlling color
formats and similar, we would indeed also need a client cap for those
things, until definitely all software is ported away from the old API.

- Xaver
