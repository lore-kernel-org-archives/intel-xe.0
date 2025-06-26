Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B46C7115B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 08:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C1110E042;
	Thu, 26 Jun 2025 08:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gsaIhEYf";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE9A10E042
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750925179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Un7u/oigN2lAcR1eqnwk5UCeHFwE7wCa9VlsCrBoRy4=;
 b=gsaIhEYfVAm2EQVNZ4LW5jqfx2P1pOh88vYTHqw+12BRseb5LQd2BytseoWGl9Y2CZJEPe
 gqGZQTqyBd5nYqIYoLGwJr2hpNmpmJXRqrgFWP9MzeOT8CW1cZSjiWvQYCuxxfusnk/b/G
 cN12HiRby+po/hvdwFSJlr5B7pjYUqw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-heNV7pa0MQWNdMnkkDFxMA-1; Thu, 26 Jun 2025 04:06:16 -0400
X-MC-Unique: heNV7pa0MQWNdMnkkDFxMA-1
X-Mimecast-MFC-AGG-ID: heNV7pa0MQWNdMnkkDFxMA_1750925176
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4538a3c8885so3323275e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 01:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750925176; x=1751529976;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Un7u/oigN2lAcR1eqnwk5UCeHFwE7wCa9VlsCrBoRy4=;
 b=OfOhjv1G3LXVKE61p8aJfU5r4AbKjjgGm6nZuk1wNrYz3ANIsSSyZJW5hovV9bNh8B
 uqP3nGbmGPiulcY5E5W+uYWmmJcqNwxcYHx4iVDjBe5ZsHi8bQ+hKKvzJ/RDbwcGeOmJ
 zcQVC2Hq5TSsik5vBRFikpljA2WMXFzm7V6QZ3jke05F7eLMlCAmu9tiN8RBcsT2IhHA
 mqo8wz96l/+CqfMV5tjONlvq+qdE9FiXSfJW2lA8tsuXAixIO8lDMknD/XPxUL9QV4k+
 1HaZj6fDLezrv7ZXLCe3CRi9KvLcucGH8HRrysuKE7yVCgdPT1Nvo5CSsAk581m9kLZs
 1skQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSRTixHd9mEP8FoTuQ2InZMZKovGnFiCgiGO5bD+iPRabqiXkIQjgcD4zka+G5TjosJ+E9Xv7NHQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxhZqDOZl0JcN8XZyBhOoG6OIOCcqacR2AHQsvIwAF0B7mhfJU
 LRJYiaVKGITiVa8uH7sFtIXAzlgOAYOHoqu+MULlMbUHiLfmJ4PA3Oq63DnkU8fNbyfDWsACStc
 UDWfOOpgueDwbCuEb+ql58HWDtuHQfUJX2w/CWUHMj31TbWeBuLuzKC8LSPU9gv6nngDv
X-Gm-Gg: ASbGncuUFJl103cUkw0Jw0SKWBj71Q4GLVq7MhSTtS4Sxjk3cEWfh0wgQi1sbNY8oWA
 o+3Lunv259o15EW8hGN4Zgwfi4RfrN1IJnOwCzMdlhuY9SvmommigCYN4AvkaKKbtNoERf2YP2j
 yB9FLDF6wRLYkM0wg0CK8CB8VW3P3bE9yA/PxhW6cmrB00Es9p6bl/eD5zOtiGD+QhUyOzcufpz
 YdxFInKStWhpDD5qj0UUbQa1XlFUNoeAd0kdmwWbsmnej0c/oZIgZvhHXCT5TNZxooB9zrjgQ==
X-Received: by 2002:a05:6000:98e:b0:3a4:d953:74a1 with SMTP id
 ffacd0b85a97d-3a6ed5f2660mr4904902f8f.23.1750925175670; 
 Thu, 26 Jun 2025 01:06:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl+Et2fQCJMFtk7w65nFxPJgBsxzoM5kJmWZLpdhngsi7SOfXyOTEHOy5GgaRKAMwMVgqNNg==
X-Received: by 2002:a05:6000:98e:b0:3a4:d953:74a1 with SMTP id
 ffacd0b85a97d-3a6ed5f2660mr4904857f8f.23.1750925175169; 
 Thu, 26 Jun 2025 01:06:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80f26ebsm6691042f8f.51.2025.06.26.01.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 01:06:14 -0700 (PDT)
Date: Thu, 26 Jun 2025 10:06:14 +0200
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
Subject: [PULL] drm-misc-next
Message-ID: <20250626-sincere-loon-of-effort-6dbdf9@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="o64ig7trmkikf3gy"
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


--o64ig7trmkikf3gy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi,

It looks like it's been a slow week, but here's this week drm-misc-next PR

Maxime

drm-misc-next-2025-06-26:
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- ci: Add Device tree validation and kunit
- connector: Move HDR sink metadat to drm_display_info

Driver Changes:
- bochs: drm_panic Support
- panfrost: MT8370 Support

- bridge:
  - tc358767: Convert to devm_drm_bridge_alloc()
The following changes since commit 1a45ef022f0364186d4fb2f4e5255dcae1ff638a:

  drm/format-helper: Move drm_fb_build_fourcc_list() to sysfb helpers (2025-06-18 10:46:03 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-06-26

for you to fetch changes up to d6b93bfa5d1eba452e494d3a05d6bef65bc569b7:

  drm/nouveau/disp: Use dev->dev to get the device (2025-06-25 20:07:03 +0200)

----------------------------------------------------------------
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- ci: Add Device tree validation and kunit
- connector: Move HDR sink metadat to drm_display_info

Driver Changes:
- bochs: drm_panic Support
- panfrost: MT8370 Support

- bridge:
  - tc358767: Convert to devm_drm_bridge_alloc()

----------------------------------------------------------------
Jani Nikula (1):
      drm/connector: move HDR sink metadata to display info

Louis-Alexis Eyraud (5):
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8370 SoC
      drm/panfrost: Drop duplicated Mediatek supplies arrays
      drm/panfrost: Commonize Mediatek power domain array definitions
      drm/panfrost: Add support for Mali on the MT8370 SoC
      arm64: dts: mediatek: mt8370: Enable gpu support

Luca Ceresoli (1):
      drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API

Ryosuke Yasuoka (1):
      drm/bochs: Add support for drm_panic

Sakari Ailus (1):
      drm/nouveau/disp: Use dev->dev to get the device

Vignesh Raman (2):
      drm/ci: Add jobs to validate devicetrees
      drm/ci: Add jobs to run KUnit tests

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +-
 arch/arm64/boot/dts/mediatek/mt8370.dtsi           | 16 ++++++
 drivers/gpu/drm/bridge/tc358767.c                  | 56 ++++++++++++++------
 drivers/gpu/drm/ci/check-devicetrees.yml           | 50 ++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh             | 19 +++++++
 drivers/gpu/drm/ci/dtbs-check.sh                   | 22 ++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml                   |  4 ++
 drivers/gpu/drm/ci/kunit.sh                        | 16 ++++++
 drivers/gpu/drm/ci/kunit.yml                       | 37 +++++++++++++
 drivers/gpu/drm/ci/setup-llvm-links.sh             | 13 +++++
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  2 +-
 drivers/gpu/drm/drm_connector.c                    |  2 +-
 drivers/gpu/drm/drm_edid.c                         | 19 +++----
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            | 61 ++++++++++++----------
 drivers/gpu/drm/tiny/bochs.c                       | 19 +++++++
 include/drm/drm_connector.h                        |  8 +--
 18 files changed, 292 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml
 create mode 100755 drivers/gpu/drm/ci/setup-llvm-links.sh

--o64ig7trmkikf3gy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFz/dQAKCRAnX84Zoj2+
dpQrAYD5yJ8ZYbrX4N8fGExKTQewOb+1Opt6nglHHG2SmlPBjDlOTabB0dPy2Ynu
NcMVDKQBgL3Hq1/V/W7f3n6PltrFi+k7FH+tUqsY9zZZPT3pq12Io/j56B3x4h+3
3sErNO+vRw==
=Tv+w
-----END PGP SIGNATURE-----

--o64ig7trmkikf3gy--

