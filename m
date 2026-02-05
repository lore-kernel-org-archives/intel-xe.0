Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30515EC1EA2
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 11:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E936C10E166;
	Thu,  5 Feb 2026 11:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aJEY4vdl";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="oZOGtSUR";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0083610E166
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770290549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=PtoeRjJPoKPjVJ+o8aSXahjNNCmAGeSluGEium8wMe0=;
 b=aJEY4vdlSLsmqjPWGTtC5uCZ+/gQnefy8YCT6md329vzII+Avm4UKP8tR5/4ExT378s4b4
 HEFwXYDGHhno+JchxafNGY08RYCKVSqhKeZVLTz3QZcl9OSxceaTJRmsdE9HwQIy57FiPt
 cfPZsMc2nk3bMYVtHPJeOzCjxgQtbJY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-F9Wi53NYPgyaqroYIf9PxA-1; Thu, 05 Feb 2026 06:22:27 -0500
X-MC-Unique: F9Wi53NYPgyaqroYIf9PxA-1
X-Mimecast-MFC-AGG-ID: F9Wi53NYPgyaqroYIf9PxA_1770290546
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-43624564fc9so356904f8f.2
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Feb 2026 03:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1770290546; x=1770895346; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PtoeRjJPoKPjVJ+o8aSXahjNNCmAGeSluGEium8wMe0=;
 b=oZOGtSURXHzoWajFEvwZgpKivgJ4wKQwpLmPg3+xZV5BAw70e8qb5T/jduBxXtTyfa
 1U6NvjyHV5HoM2ATTFlex0yynR+ohbSjhRbgwVnqR0bYofBAo1H2i2bdParlmXq7wRfM
 sAbW6T3s/GNmr1tML6DqL09XXt9bH3wpV+9pZ4twb8rxp3AIxnBXXUNxQQ8E+iJ0RIGT
 HKxBLxUAdg/TAPbXMt0a1eU9WPHtzoA209agQ+FcYJTl+u8fbKjvvqnUYUohfP8pkcO6
 z+TIG1LXE3VQozgrlhCp0eEXXxCN3jnZWyZxkbCM27Q0tr9oz2Uw6sepaJz784MwkejZ
 jMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770290546; x=1770895346;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PtoeRjJPoKPjVJ+o8aSXahjNNCmAGeSluGEium8wMe0=;
 b=vzqz0JaXpf8WbyOQTlJ7Fx2pepecVIwQ+ffD6wpSZ4glXpiJgcJ2pQ0YnTl9Rxald5
 POHGx/AGD4Otn4FfKCTUN8NTS8NUaOrMnHd2mClJC3HbQkijl5DKovKbAv3EU8AFkq3n
 GILQkWg6zRdaSl+PFg6vZfVZBfTkoonwiXbnuqgWTVylTK5rkZa9wRkIp3qaZwr5tOH9
 L1eduoRKzOJRjWJmy0O/DMJ+Ig5p86aze3SzB7pv0PIIfQCCM9m0zZIYaxjGio8Yltix
 QcgNGRQ0IhbSICNuWFHa3XUIBPtaa5m0gMvSrTgm1GdLFAdgT38w+y/dthu5Kqk9eDM3
 yOBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWfmMn1ICz2NTsCknqhp761SzpkEXc8kTr+1ojTwVaXB2nAmSPgWM8vjBFjZbC24pys9nD+e0HKg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+u3sUwWK9ONJSp3+FNhf8ZsMf1d2tPT5RItSULwITFqa/m8vG
 oRV4Wa3N1eR5z/eZ3QQzWtsgueZ6p2nx+OsHRjPbxK5ieSxqOmUxHgrpgYqulWuuanr+PB9dWkS
 jzxO1gzTiTkwoSuqtKzPedssPb2v5VeBcm0O8x/0kXrzsj7+nN1xRwTZ7DOrwMSorrKNe
X-Gm-Gg: AZuq6aIywaxS8NmNknjj3Q1zizAJ86m/2IyHTQZ0Qe3/CGVivTScmUvjxEjMT/Nhpii
 jnFAr59ecs8g6N6WfcZDofG6x86wI53syya2iU8FrPc5sdrKpz+DpFUghbeh1cGayiBRGB5zUS1
 nKezCR7IuEUF+/1TKOZH9gsxf8bk0rvueLR8tENBaZLp26MKzcCY93NYMkYZ4YtGYikdgVktM4a
 msuDc3wIa61uw5AB9+4YlVKVXe/HRCRVYrJYketSqCtMODS8I8jF5rKy4YNkUAJ9pTG934DhdfF
 afDxYEsZDnsbmILxcsGIJdwGw84JTczUR8f5AoRq4DFURi2RnXUThznISg8LjA==
X-Received: by 2002:a05:6000:2909:b0:430:ff81:2961 with SMTP id
 ffacd0b85a97d-4361805d057mr9636934f8f.51.1770290546059; 
 Thu, 05 Feb 2026 03:22:26 -0800 (PST)
X-Received: by 2002:a05:6000:2909:b0:430:ff81:2961 with SMTP id
 ffacd0b85a97d-4361805d057mr9636872f8f.51.1770290545520; 
 Thu, 05 Feb 2026 03:22:25 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e38ec5sm14063139f8f.14.2026.02.05.03.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 03:22:24 -0800 (PST)
Date: Thu, 5 Feb 2026 12:22:24 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20260205-refreshing-natural-vole-4c73af@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ow64eandfwfxuszq"
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


--ow64eandfwfxuszq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next-fixes
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-next-fixes PR.

Maxime

drm-misc-next-fixes-2026-02-05:
Several fixes for amdxdna around PM handling, error reporting and
memory safety, a compilation fix for ilitek-ili9882t, a NULL pointer
dereference fix for imx8qxp-pixel-combiner and several PTE fixes for
nouveau
The following changes since commit db7e7ea838c916ee4cdf26bee126fd36f58295dc:

  drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy() (2026-01-27 12:22:22 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2026-02-05

for you to fetch changes up to 69674c1c704c0199ca7a3947f3cdcd575973175d:

  accel/amdxdna: Move RPM resume into job run function (2026-02-04 13:08:48 -0800)

----------------------------------------------------------------
Several fixes for amdxdna around PM handling, error reporting and
memory safety, a compilation fix for ilitek-ili9882t, a NULL pointer
dereference fix for imx8qxp-pixel-combiner and several PTE fixes for
nouveau

----------------------------------------------------------------
Dave Airlie (3):
      nouveau/vmm: rewrite pte tracker using a struct and bitfields.
      nouveau/vmm: increase size of vmm pte tracker struct to u32 (v2)
      nouveau/vmm: start tracking if the LPT PTE is valid. (v6)

Liu Ying (1):
      drm/bridge: imx8qxp-pixel-combiner: Fix bailout for imx8qxp_pc_bridge_probe()

Lizhi Hou (6):
      accel/amdxdna: Hold mm structure across iommu_sva_unbind_device()
      accel/amdxdna: Stop job scheduling across aie2_release_resource()
      accel/amdxdna: Remove hardware context status
      accel/amdxdna: Fix incorrect error code returned for failed chain command
      accel/amdxdna: Fix incorrect DPM level after suspend/resume
      accel/amdxdna: Move RPM resume into job run function

Nathan Chancellor (1):
      drm/panel: ilitek-ili9882t: Remove duplicate initializers in tianma_il79900a_dsc

Zishun Yi (1):
      accel/amdxdna: Fix memory leak in amdxdna_ubuf_map

 drivers/accel/amdxdna/aie2_ctx.c                   | 48 +++++--------
 drivers/accel/amdxdna/aie2_message.c               |  3 +
 drivers/accel/amdxdna/aie2_pm.c                    |  3 +
 drivers/accel/amdxdna/aie2_smu.c                   |  2 -
 drivers/accel/amdxdna/amdxdna_ctx.h                |  5 --
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |  3 +
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |  1 +
 drivers/accel/amdxdna/amdxdna_ubuf.c               | 10 ++-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |  4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      | 82 ++++++++++++++--------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h      | 16 +++--
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |  4 --
 13 files changed, 103 insertions(+), 80 deletions(-)

--ow64eandfwfxuszq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYR9bwAKCRAnX84Zoj2+
dpccAYC3hibmSRRvXuB0MgqO2qrGhihntcn/vNIF9FTLWdoMiuza11H9Sf2enr/p
64XqztsBgPiWWrzdmLtzUQcMzU815Y5DRYJA8zfX+7f/fPe+Q1JI5/uHqLDwpRZO
1SiTu+ZY6Q==
=rkc7
-----END PGP SIGNATURE-----

--ow64eandfwfxuszq--

