Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D56C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 07:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC5610E711;
	Fri, 19 Jul 2024 07:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cHS+W/oK";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E06A10E650
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721374799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=4kxYdIrHu4b00o0zuiOs8N/yg0Z0AcAqiSsUuf4gK9Y=;
 b=cHS+W/oKr0mEUkfnYea0pAk8p1yfxLvYxRu6e28JPv88bdcyLeZkkIaWJfpLPKEMFudR4w
 Q8IogYcXjg3UHQ8sZH/ole27irq99fbS8rRm782gvjLjxNsRV7HQDwHsYIhKG1nul/IMtH
 zfm6NnX6KkqEhJ5GRbF7JgO2YuM5rvc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-pZYWLx6bOQmvqyEjVbyYpQ-1; Fri, 19 Jul 2024 03:39:57 -0400
X-MC-Unique: pZYWLx6bOQmvqyEjVbyYpQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-36873a449dfso245383f8f.0
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 00:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721374796; x=1721979596;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kxYdIrHu4b00o0zuiOs8N/yg0Z0AcAqiSsUuf4gK9Y=;
 b=Ey2XrfhrS0vXSzemA5dH/qT5KCvC4p2oPfvJY1Ywb2o/nQck6s+QhswYAzJiqsXRZF
 9rISJ7/gHONTGRjsbMAlM83jrhMggrJpGLFV79R0O5W6RI6yl4fGvAuvr5WuTw66/THC
 k05VBVsXKsjodLKIpM/7wd2BPLli3nKvEselazacRarJBih4VsaBFGy+xBaVDU5Dq0T9
 VVEuptU9mywbsEB46yv4RfQ9v55eLnJWrZRKp/2i0fKoga6FZgkPdg14JWEa5MtNlikf
 W1lg9/D4De2wvR6OpqIP5NHObmdT7PFrfuQ6bye8II0YY26HSf5sliYVTHp7ZmrONAkA
 lF5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEU6hmnVYzNm1auKQCCs35/kgJcABW3UXxKJT+BOx8zC3s5GE/YKEW27RH5ajFyxO/lWyIHPVusrYT32p+YejMV58EL1et1S9UL//ntrE=
X-Gm-Message-State: AOJu0YzwTN5vDPiaOmujcfnCrT9D5ZOUDtBfSCl4BXbmiQEcuH/o+qNt
 DbopVKHtTzTw1qLvxFfYZfphxY6XP7efT7l2U0TQIbNcTIu81vZ7j6HH236f1ZpmgAHlcKWRiui
 Tzk8/EU3IFkd4mNzzqyHonDkCaJ4sjxmle6ocTfjnIOZPTb7mQkLztFDLaBJreJIj
X-Received: by 2002:a05:6000:100c:b0:368:377a:e8bb with SMTP id
 ffacd0b85a97d-36874027587mr896398f8f.28.1721374796050; 
 Fri, 19 Jul 2024 00:39:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj8idIyc+IRNzwwG6x5fdHgk4zHPBp8GCc3h83ZY13uWqnImlcSxnUYfuF4t8oZH8vJ5F6Qw==
X-Received: by 2002:a05:6000:100c:b0:368:377a:e8bb with SMTP id
 ffacd0b85a97d-36874027587mr896376f8f.28.1721374795651; 
 Fri, 19 Jul 2024 00:39:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368786848basm857701f8f.15.2024.07.19.00.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 00:39:55 -0700 (PDT)
Date: Fri, 19 Jul 2024 09:39:54 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20240719-emerald-newt-of-skill-89b54a@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mnbsingi4eabsfox"
Content-Disposition: inline
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


--mnbsingi4eabsfox
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-next-fixes PR

Thanks!
Maxime

drm-misc-next-fixes-2024-07-19:
Two fixes for v3d to fix an array indexing on newer V3D revisions.
The following changes since commit c537fb4e3d36e7cd1a0837dd577cd30d3d64f1bc:

  drm/qxl: Pin buffer objects for internal mappings (2024-07-10 09:12:42 +0=
200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fix=
es-2024-07-19

for you to fetch changes up to 1fe1c66274fb80cc1ac42e0d38917d53adc7d7a3:

  drm/v3d: Fix Indirect Dispatch configuration for V3D 7.1.6 and later (202=
4-07-15 12:49:52 -0300)

----------------------------------------------------------------
Two fixes for v3d to fix an array indexing on newer V3D revisions.

----------------------------------------------------------------
Ma=EDra Canal (2):
      drm/v3d: Add V3D tech revision to the device information
      drm/v3d: Fix Indirect Dispatch configuration for V3D 7.1.6 and later

 drivers/gpu/drm/v3d/v3d_drv.c   |  5 ++++-
 drivers/gpu/drm/v3d/v3d_drv.h   |  8 +++++---
 drivers/gpu/drm/v3d/v3d_sched.c | 16 +++++++++++++---
 3 files changed, 22 insertions(+), 7 deletions(-)

--mnbsingi4eabsfox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZpoYSgAKCRDj7w1vZxhR
xTJFAQCZxg8Rb0UtvvZy0VN+QIFodVbw1dOcJELCGWf5x/QzogD/T+7JqgDk187n
/55o0MtDBa5ItxE0R7eggdl9iZoUQwA=
=8lBw
-----END PGP SIGNATURE-----

--mnbsingi4eabsfox--

