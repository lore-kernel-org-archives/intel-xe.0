Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4EEC021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 15:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7692A10EB12;
	Thu, 13 Feb 2025 15:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GK7QDCMp";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1168710EB12
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739460652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=PN7ur676Xsis/n7iRGBe+pGaLllpLZp2f/gL1bpC1ek=;
 b=GK7QDCMpLdW6zUE40Sjt1Cvn3myxGPgVixw6djJYkPOXNzYzWSMwkYq977ltMKm3ZGarH+
 N9yjKjt9BZigydl+r1xZHfM9ZK1fSTo92dHCzSaUaC8DUZc5xa7JejtVmWym4xHTH8ByhB
 nuEeUgsr5I+342CffTfhYgAg7RjPONU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-OSoxgblPMdeBaHUZqnyg5g-1; Thu, 13 Feb 2025 10:30:48 -0500
X-MC-Unique: OSoxgblPMdeBaHUZqnyg5g-1
X-Mimecast-MFC-AGG-ID: OSoxgblPMdeBaHUZqnyg5g
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4394c489babso5607815e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 07:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739460647; x=1740065447;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PN7ur676Xsis/n7iRGBe+pGaLllpLZp2f/gL1bpC1ek=;
 b=p9TEbqmE62cewiINtYJn88ht3oXY17TtcdzCdYWx/qq4U4WSxe9XaM2RwilVaOIY5Y
 HNb0vpxVBMeRE6vneeKYZNo6FoQfSSyokvGeiii4En16iIg4XU+patycBWd5yXanEkDp
 BdkY8KkHO6n+8DA5GRR+UZKyHSwSDXnG+X4mfvwMApnvjeBlJoeKCW3+5Y2i0SNQSgYa
 dtSGHXoBPzT61km2aT8u9TNHdMoaB139wQQBeUUtqWgm0Wb7RgfSpT3RadRKY6jdkHcm
 7XGEWsv5iaiAJA2ZbDtvi8tSmv5w24+wJDoWMHJEtVhJvKa/EqhNh4hLZ1jO6S5NzqFM
 WnWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaHuO1PXv26q6IAl11IEpxX1Qz9W3wKcXqMx+zScRqOar1KrANq/DRyHXcsn4Vgqy3kFOaxEo3vA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp1LTIpHY6pyGS2scI6kPsNULyLcue0IyJEdvM9AH25ByLn1Oh
 uTxQpocUeUoV9eB1Nl2qR17Cixy+S6Xq95VUkbKuzmi9q21WNp20JnpVY4HDaRj+RwCNx023cvP
 JBKW8qKY8qEFVIP85TZTK6Y+5EgcDQfp1peGDcimTlIn/rygiFtmAQIH+ZSVjHDqr
X-Gm-Gg: ASbGncuDJRW3P2A9ra4S+Qi80kUHgcxiiqxigZteb7enKBfj5kcwp1YeW8qHGagNkYi
 UDpB397BEknRKq/HwT+VqO9Bm0ewpSqpMtT5onjcsJEnYXPm1FReNFHs7WIcPn3ZolM+K55oSYh
 JRAag5wPFCR5l7ASDXuRx52BrWwIuS+Lmc2y/kf5nk5RHiZo8rOORUs7Tx9PdJyPWm9hnmrS3mT
 Hm6MDXHnbh74WH2It4pkYMOw9/rd21sSuuziJzee6q2grrbuK6gtkir
X-Received: by 2002:a05:600c:501f:b0:439:44eb:2d84 with SMTP id
 5b1f17b1804b1-43960179d20mr45018275e9.9.1739460647198; 
 Thu, 13 Feb 2025 07:30:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzxkEhvlPaDgSESYGojc4LYVD88oudIxFtzoghwjeJ38UrU8/0LhZlqsS+gmxL2ETvb3yf2w==
X-Received: by 2002:a05:600c:501f:b0:439:44eb:2d84 with SMTP id
 5b1f17b1804b1-43960179d20mr45017575e9.9.1739460646637; 
 Thu, 13 Feb 2025 07:30:46 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b824dsm51629645e9.34.2025.02.13.07.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 07:30:45 -0800 (PST)
Date: Thu, 13 Feb 2025 16:30:45 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
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
Subject: [PULL] drm-misc-fixes
Message-ID: <20250213-brilliant-terrier-from-hell-d06dd5@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rb564bdblb4zsmee"
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


--rb564bdblb4zsmee
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-02-13:
Some locking fixes for the HDMI infrastructure tests, an unitialized
mutex fix for host1x, an unitialized variable fix for panthor, and a
config selection fix for hibmc.
The following changes since commit 2c1ed907520c50326b8f604907a8478b27881a2e:

  Merge remote-tracking branch 'drm-misc/drm-misc-next-fixes' into drm-misc-fixes (2025-02-06 09:59:35 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-02-13

for you to fetch changes up to e00a2e5d485faf53c7a24b9d1b575a642227947f:

  drm: Fix DSC BPP increment decoding (2025-02-13 10:20:30 +0200)

----------------------------------------------------------------
Some locking fixes for the HDMI infrastructure tests, an unitialized
mutex fix for host1x, an unitialized variable fix for panthor, and a
config selection fix for hibmc.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/hisilicon/hibmc: select CONFIG_DRM_DISPLAY_DP_HELPER

Imre Deak (1):
      drm: Fix DSC BPP increment decoding

Maxime Ripard (4):
      drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
      drm/tests: hdmi: Remove redundant assignments
      drm/tests: hdmi: Reorder DRM entities variables assignment
      drm/tests: hdmi: Fix recursive locking

Rupinderjit Singh (1):
      gpu: host1x: Fix a use of uninitialized mutex

Su Hui (1):
      drm/panthor: avoid garbage value in panthor_ioctl_dev_query()

 drivers/gpu/drm/display/drm_dp_helper.c            |   2 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |   2 +
 drivers/gpu/drm/panthor/panthor_drv.c              |   1 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 200 +++++++++++----------
 drivers/gpu/host1x/dev.c                           |   2 +
 drivers/gpu/host1x/intr.c                          |   2 -
 include/drm/display/drm_dp.h                       |   1 +
 7 files changed, 110 insertions(+), 100 deletions(-)

--rb564bdblb4zsmee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ64QJQAKCRAnX84Zoj2+
dqebAX9+gpZ3VggZ+34y9hZSe/WKr/CvyqoEBSXOt/1zOfyRstawesDt4ysf/rox
L3Au1QkBgLFVqMkwNxVxUUs2AHMSWevzlyELgJas34o15aDSV6Im1rBF7dNHnaBQ
GILZJXzVwQ==
=0FBJ
-----END PGP SIGNATURE-----

--rb564bdblb4zsmee--

