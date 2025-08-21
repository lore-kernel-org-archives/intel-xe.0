Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC3CCA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 08:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0ED110E8A0;
	Thu, 21 Aug 2025 08:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bAXQvnzZ";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B2E10E8A3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755763981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Iu8q1LFgRVkrut1fK3PxESRCoYM2KRGJpTnUSdfNl9I=;
 b=bAXQvnzZ9CajO3cb9UepC84bevQTS2EN/LgxGDNBN0MTh2fpiAsrsO40LXYyqBgZapmLLp
 LQx9nkKCWyQjNthqoiFavw5Efb6MgNTPdFr7SGu+1EseqqW5/7f7f1VZj6qFcHzMkpi3BU
 eQo9bn4I1NPxoSXp9sJR4+y/OdEs/Rw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-hUyxF3YxNC-25QuDVvB_Gg-1; Thu, 21 Aug 2025 04:12:58 -0400
X-MC-Unique: hUyxF3YxNC-25QuDVvB_Gg-1
X-Mimecast-MFC-AGG-ID: hUyxF3YxNC-25QuDVvB_Gg_1755763977
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3b9edf2d82dso356043f8f.2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 01:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755763977; x=1756368777;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iu8q1LFgRVkrut1fK3PxESRCoYM2KRGJpTnUSdfNl9I=;
 b=sjPtVPTRa8PXLq7PG3GYpPPok8rwcOO+io5LTBquwi+ebFQXouC1i5nxMx00ekf/Q9
 VsDqtD/TdpufxiifV/ibG1bIAvokHUQsqwf6rRIgnHpyauUrnAQ8ICelU9byX2K/IViS
 hilP1e269vd+1XfpWNbpGNgOuRFmEEVfS5iq81KRO/UEtGXm0acW3TCfJLWkL1j/oG4u
 +1ArsSCA/AYY9OFphu+40RhoME+9v4dcal7Yo7RblhznZZOpT1TrwnSp+TQnMh3bJ8qq
 k7ljrK4MnfeWu2+bBfqx+VW33XD7SpUH9QaJO4HGiL/JfQ+vx6Zxspt+ALdg6LEx8jyn
 SOwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQQbFDGyM7MSa1Bt8CA8fUhLa1IIP4J6cyvMkLBHA7YBUFn8lF3zJNajx5jZ3+06n58dNYN84wZQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFSqHTUuYR6yXpQ5erc7v7jZlANHB2ug0Fv3zAAbun7nbIsxdN
 wd5quORzRjEP5DCWAbFzs/qPfUSGfAW6nU/ImV9oyNcg17vW2CsxRhy1SBP27/vjFBwOC/Svsg3
 t+Qe7tR5S5SVgYs2mTH10k6cVoHB0L7PBUxejzg66Q02g4GPTdbZztgxH55Dy/GEiZKgN
X-Gm-Gg: ASbGncu5MIYSNPEEaU3o3bv0npXJe8efZaCM1auUvxawmwj4O0gLzoUVzNq/I2CRoxK
 DMeAvYR0nM8L/mQVB7Zc7QJpOcpm2V4ekxzCK/eAHkNFEwWiFQ1mVGOCx205iHhpkxs7vv1gydW
 XgTu4lLJM8iNOYE5GhZpyLAJcv+OPAJeNQtoER9QUiYA1GuLdyEW0WTGLrXGTSKghTigoMYpR7c
 IyZlaPW1hku/hvtrg8ehximV/JhvExV3DKwrkQ7TaXsggr6nfQIogn+vx5TVLIVCEw7aOaiRAp/
 BGO7gZ1DA1Mt0o0=
X-Received: by 2002:a5d:6381:0:b0:3b8:f8e6:867b with SMTP id
 ffacd0b85a97d-3c496f92c82mr966827f8f.31.1755763976948; 
 Thu, 21 Aug 2025 01:12:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElHv2ckS6bYN4pTNyiBQ93FDKVMiUT6qg3iphXe/u2Ly6tfBIyA4Kb9p886iWiyNgkQlqzFw==
X-Received: by 2002:a5d:6381:0:b0:3b8:f8e6:867b with SMTP id
 ffacd0b85a97d-3c496f92c82mr966797f8f.31.1755763976430; 
 Thu, 21 Aug 2025 01:12:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c4e6d4d439sm1143678f8f.6.2025.08.21.01.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:12:55 -0700 (PDT)
Date: Thu, 21 Aug 2025 10:12:55 +0200
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
Message-ID: <20250821-economic-dandelion-rooster-c57fa9@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qaduzatttsqlmtga"
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


--qaduzatttsqlmtga
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2025-08-21:
A bunch of fixes for 6.17:
  - analogix_dp: devm_drm_bridge_alloc() error handling fix
  - gaudi: Memory deallocation fix
  - gpuvm: Documentation warning fix
  - hibmc: Various misc fixes
  - nouveau: Memory leak fixes, typos
  - panic: u64 division handling on 32 bits architecture fix
  - rockchip: Kconfig fix, register caching fix
  - rust: memory layout and safety fixes
  - tests: Endianness fixes
The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-20=
25-08-21

for you to fetch changes up to 1a2cf179e2973f6801c67397ecc987391b084bcf:

  Merge drm/drm-fixes into drm-misc-fixes (2025-08-20 16:08:49 +0200)

----------------------------------------------------------------
A bunch of fixes for 6.17:
  - analogix_dp: devm_drm_bridge_alloc() error handling fix
  - gaudi: Memory deallocation fix
  - gpuvm: Documentation warning fix
  - hibmc: Various misc fixes
  - nouveau: Memory leak fixes, typos
  - panic: u64 division handling on 32 bits architecture fix
  - rockchip: Kconfig fix, register caching fix
  - rust: memory layout and safety fixes
  - tests: Endianness fixes

----------------------------------------------------------------
Avizrat, Yaron (1):
      MAINTAINERS: Change habanalabs maintainers

Baihan Li (5):
      drm/hisilicon/hibmc: fix the i2c device resource leak when vdac init =
failed
      drm/hisilicon/hibmc: fix irq_request()'s irq name variable is local
      drm/hisilicon/hibmc: fix the hibmc loaded failed bug
      drm/hisilicon/hibmc: fix rare monitors cannot display problem
      drm/hisilicon/hibmc: fix dp and vga cannot show together

Danilo Krummrich (5):
      MAINTAINERS: entry for DRM GPUVM
      rust: alloc: replace aligned_size() with Kmalloc::aligned_layout()
      rust: drm: ensure kmalloc() compatible Layout
      rust: drm: remove pin annotations from drm::Device
      rust: drm: don't pass the address of drm::Device to drm_dev_put()

Fanhua Li (1):
      drm/nouveau/nvif: Fix potential memory leak in nvif_vmm_ctor().

Javier Garcia (1):
      drm: Add directive to format code in comment

Jocelyn Falempe (1):
      drm/panic: Add a u64 divide by 10 for arm32

Jos=E9 Exp=F3sito (2):
      drm/tests: Fix endian warning
      drm/tests: Fix drm_test_fb_xrgb8888_to_xrgb2101010() on big-endian

Liu Ying (1):
      drm/bridge: analogix_dp: Fix bailout for devm_drm_bridge_alloc()

Madhur Kumar (1):
      drm/nouveau: fix typos in comments

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Miguel Ojeda (2):
      drm: nova-drm: fix 32-bit arm build
      rust: alloc: fix `rusttest` by providing `Cmalloc::aligned_layout` too

Nitin Gote (1):
      iosys-map: Fix undefined behavior in iosys_map_clear()

Piotr Zalewski (1):
      drm/rockchip: vop2: make vp registers nonvolatile

Qianfeng Rong (1):
      drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()

Rudi Heitbaum (1):
      drm/rockchip: cdn-dp: select bridge for cdp-dp

Thomas Zimmermann (2):
      Merge drm/drm-fixes into drm-misc-fixes
      Revert "drm/amdgpu: Use dma_buf from GEM object instance"

Thorsten Blum (1):
      accel/habanalabs/gaudi2: Use kvfree() for memory allocated with kvcal=
loc()

 MAINTAINERS                                        | 14 +++++++++-
 drivers/accel/habanalabs/gaudi2/gaudi2.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  4 +--
 drivers/gpu/drm/drm_gpuvm.c                        |  2 ++
 drivers/gpu/drm/drm_panic_qr.rs                    | 22 ++++++++++++++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       | 14 ++++++++--
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    | 22 +++++++++------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |  1 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c    |  5 ++++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   | 11 ++++++--
 drivers/gpu/drm/nouveau/nouveau_exec.c             |  6 ++--
 drivers/gpu/drm/nouveau/nvif/vmm.c                 |  3 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  |  4 +--
 drivers/gpu/drm/nova/file.rs                       |  3 +-
 drivers/gpu/drm/rockchip/Kconfig                   |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  9 +++---
 drivers/gpu/drm/tests/drm_format_helper_test.c     |  3 +-
 include/linux/iosys-map.h                          |  7 +----
 rust/kernel/alloc/allocator.rs                     | 30 ++++++++++++------=
--
 rust/kernel/alloc/allocator_test.rs                | 11 ++++++++
 rust/kernel/drm/device.rs                          | 32 +++++++++++++++++-=
----
 24 files changed, 154 insertions(+), 59 deletions(-)

--qaduzatttsqlmtga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKbVBwAKCRAnX84Zoj2+
dnYBAYDAQbhzmNTAbWI5BZX/lR4QgO9ENVREPE0P0i2Q/mPV8KVhc7BPjM5kdcZh
fqAeQdUBgKbrYCoVdcCf6nFAj5xza/8GeMT5uWpbJSxBsrmoF6hzjO5symoIEhYy
pzDqGAthPg==
=pl7U
-----END PGP SIGNATURE-----

--qaduzatttsqlmtga--

