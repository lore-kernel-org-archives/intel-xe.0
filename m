Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CB3CA5FE4
	for <intel-xe@archiver.kernel.org>; Sat,  3 Oct 2026 11:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC61010E85F;
	Sat,  3 Oct 2026 11:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RW75a+r/";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E5C10E0D4
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Oct 2026 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791027436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHJZUWTv7rBEBUCND4bSkxxGBQPHEUSgPjoiGT34ol8=;
 b=RW75a+r/ZFCVTheiqwyJ8oYgxLXL6KbvpsXZd9Cqkz8HHw4xye7D0j+PEwnIEkInieWfLt
 Amf40Bj38zqTqCVOH8V3LVdQuQZXmIFyn4JU1Laj7fGqn3Xn6sIBxWLu1L7lSnSKM4sn/H
 QlMj44cJNGbP/9EQmorHs9Nlr63hHqY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-nyw_kSj6PBuHrHdieR8T9Q-1; Sat, 03 Oct 2026 07:37:15 -0400
X-MC-Unique: nyw_kSj6PBuHrHdieR8T9Q-1
X-Mimecast-MFC-AGG-ID: nyw_kSj6PBuHrHdieR8T9Q_1791027434
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4a01d1fb07bso5048395e9.2
 for <intel-xe@lists.freedesktop.org>; Sat, 03 Oct 2026 04:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791027434; x=1791632234;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lHJZUWTv7rBEBUCND4bSkxxGBQPHEUSgPjoiGT34ol8=;
 b=0v492qm2xLWDCej83xFBvMTkEaklhN+iGuju4seUk/N21vOwPKFr4sP4vCSP9jN+/R
 RHLQh5P6BPJCsaRaeV1GVsgVNGqYkU6mupk9Wu9q0tv/aU+1n1zTu3QyXkpjIbv52/Hx
 jY7YDArn6wQJivGYeEbsS/1mmFOrG/qml4ksjCDMg/SvZxfq50F7vNpFnnV/P2Smy9W7
 cuCoNviivOQNBxhpx1S3Q4y+NGHv8WH6yLoYuU0bM94L0Lob6kCRMAJje/nm/nEyWwwq
 gg2aKpkGydSgsawK23ZOwdubFl5ZnEb+7uF1YeoNrn1bVsmFoiJYKzWMEB37ubNh+z0y
 sCmA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3GG4hViF83emQsstG9RL3qwLAlezR60/YN4Tot5gul4dTeIkJYol1j7k4ctTagwqECnIo5bwQIA==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYL1r1YbLpTR1avtClXf/qlHwkJPWoYgadIWJOkdvGf2iGCyroGD
 eCspmcymX9J8qKeGIlxVecHU3q0mHiCcvln3QyAwadCDOWBuUyshcZzI3ESXlXlG7J49ziG4FEh
 AnpTyRV6T0httcxpMX9xbt6VxSR27fJOsSHnhO9HGasbxD6Yx5a25YZoNiXY+5LRNEGcq
X-Gm-Gg: AYBFou2wHUquekmHjuZchDUjJqJZDLqoU3nVxm2VNIt89jvtq6qnaj/Obl5CtCZM9XA
 5REyi9OdM1NsZj4ki+UUu953W5akMWcOAhaSzNYtyylzxtUu9HjrQpdcParPw9Z1Nl0u0vVLqgc
 tyV1+wxsetKskT6W8vdySFXyaCCJeKvzs4JQ2cR9kzj8upWSwQ4ei2RdcZqH+HNE9ja6qmcB0ZZ
 pqGWczEuptu9wV8V+WaH0Qe24oZzKc5f0frda/hJXgqRqBqESBimeM385xFPLvB5fqv3D/6QoWB
 JeSpZr1iQNiwqBzAm+KopMiNxVQs7MyZUrsshfV/7Y/jV3sCOuh2ua3pkoORkCu4WeX8tdCAj9i
 qeirLWe+BKYj8+hL3u/A9biqkZho4rYp2SRBhZtg/Uef4vf0Mw2diuPNysv5bXDaLmg==
X-Received: by 2002:a5d:5f09:0:b0:48a:f464:2cc5 with SMTP id
 ffacd0b85a97d-48c4800d152mr3245845f8f.37.1791027433673; 
 Sat, 03 Oct 2026 04:37:13 -0700 (PDT)
X-Received: by 2002:a5d:5f09:0:b0:48a:f464:2cc5 with SMTP id
 ffacd0b85a97d-48c4800d152mr3245816f8f.37.1791027433222; 
 Sat, 03 Oct 2026 04:37:13 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b380fab11sm11943111f8f.16.2026.10.03.04.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 04:37:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, Simona Vetter
 <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-xe@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v9 01/21] drm: add connector LUMINANCE property
In-Reply-To: <20261002190030.211356-2-mario.limonciello@amd.com>
References: <20261002190030.211356-1-mario.limonciello@amd.com>
 <20261002190030.211356-2-mario.limonciello@amd.com>
Date: Sat, 03 Oct 2026 13:37:11 +0200
Message-ID: <xlv1ece7ggm0.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9XEVE1P5u2x4jiAYKo9n28PttMbN_ODUY-zxTgB0TM4_1791027434
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

Mario Limonciello <mario.limonciello@amd.com> writes:

Hello Mario,

> Panel brightness is a property of a display, and thus of a DRM
> connector. Add an atomic per-connector LUMINANCE range property so
> compositors can manage relative panel luminance together with the rest
> of the display state.
>
> Keep the core backend-agnostic. Drivers create the property with their
> hardware range and implement connector helper callbacks to set luminance
> or disable panel emission. The atomic helpers sequence those callbacks
> around pipeline enable and disable, including luminance-only commits.
>
> The stored property value is independent of display power. A commit made
> while the connector is inactive is retained and applied on the next
> enable; disabling the pipeline does not overwrite it.
>
> LUMINANCE values are relative, driver-defined levels rather than
> absolute luminance in cd/m^2. The interface supports emissive panels as
> well as panels with a separate backlight.
>
> Keep the interface behind a default-off DRM_LUMINANCE option. Migrated
> drivers retain their legacy backlight class ABI unless the new interface
> is explicitly selected, allowing the DRM UAPI and legacy compatibility
> policy to remain separate.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Thanks a lot for the rework. I went through this patch and have no more
objections on the core bits.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

