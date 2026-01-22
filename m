Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411CBC44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 08:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014D410E94F;
	Thu, 22 Jan 2026 08:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ah+Fumuu";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AIrHbxRh";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60AD10E94C
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769071896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=vAwMvvvHUxZ6RErnKH9hGq1hwjn0bnOrqDnkVZlrd+4=;
 b=ah+Fumuusn4+6mJH2IgrI+eiruWpX3jASPKL6TRYytaSYQ0HTD4ELvoxOnA9b0XUmScbLd
 WIZkr2i9zYSIVjRFWCy2XvwpTBdd1JdqXkq0r+LVi2nQ4elfAzmxI+IZUsUYX6n1W/WY8e
 YPQF2oOuwMtfBUO8v/Ol3fJp7zqsgLc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-vSrRLW7ZO5-LhSc_BAL21g-1; Thu, 22 Jan 2026 03:51:35 -0500
X-MC-Unique: vSrRLW7ZO5-LhSc_BAL21g-1
X-Mimecast-MFC-AGG-ID: vSrRLW7ZO5-LhSc_BAL21g_1769071894
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4803a72daaeso5743915e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 00:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1769071894; x=1769676694; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vAwMvvvHUxZ6RErnKH9hGq1hwjn0bnOrqDnkVZlrd+4=;
 b=AIrHbxRh0y2nZpbAu9VgS4G8s3GZ9Z/wTy1EMuY8028pZseNe4xDhvwnVl2dav4OXa
 GULfJNBcresV4c5RdHQVhToGDqHzUnrPRM8CBU5oBiVMi8YIi/qgCDrcSmKEtX85oyEY
 uJZsMGKhBXchJXTHm9UbHn2Iw94pufz9yoKsbIi0tekqut/q6MZ12XhxBs2/OP1RpmNY
 zDYhvIMNSozTz9FguyiyC0eBI4OzvItivZpNvWAnJREg1m1gE0Dg8PQZs5WKJyIwMaS4
 X/B391+p82AbNrsbN+/iVsdZ+G1cZFFIybOLaiILaD9e1qUUaSJsQq1g8Do/5P6ONYuB
 AsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769071894; x=1769676694;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vAwMvvvHUxZ6RErnKH9hGq1hwjn0bnOrqDnkVZlrd+4=;
 b=WCGZr2Ky93OW07VNvTbfxzM2F4o7KurtVNEjEJGRtn5pZc+ZeY6jAjDQVCxAUNlAWH
 0hm0fn0TK4fOcFpp37T7lYf/PoHsjc8n2bMECw1RpmZFfWEha7+3DPFqmYpZDpWfUF68
 EcW33nOupUIJOa/vPKkFsARZj1kGyXpxHIY3QwcdkMjDYJmhKiudCTRnx/fZ0VistZNa
 copxwwVyL2g9JFOxpV5s+ZEMkZElE9eArNzMem+IcyjHam+Ygzx2h5rFKtkOvSV/p0vW
 1ZAqyhfDR4vHZoMJc+BJWkp8ipPLZaumMsctu7/JPepR0ooYmycUG1V2NsTTAMHptwlV
 bQQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfUiBSpRIbPR5J6Qwk4oWDheG/FWFOeWWxMi2mGXTqnaGyIzq+AxU87WORH9mBq2oOQxxl3hogmg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxOBXleWJJTNAeiZECqiyueUK3lmAugjeFy9CtQAciQ1cy6Fwk
 dXoQCazVS/7wuEdpmZdFQaLmedIS5QRnL5oMfEvdYi6Jb7WGPxoFtbC3/UpuBWIjbwqf6ZA+W1Y
 sk/jmC2eUfvHpsOuEXbYnKnRucANKk9f9FUlvrQ8ezs1KtjMXrRAqQJwNdNVZwjvoX6SG
X-Gm-Gg: AZuq6aIyFxkDPkulIo4gE/lpCaOPFn2f5KI+eOVL6MSgvbbzwt7CKoutWtxn4rD50fm
 X1OlcLZt2jp9IjzB+fWZEdbnOLYKM1oRmuCRaC7cJ2beZBZiC1t7XPjIxjlCMG7gdqSBwYtzjMr
 r6+OFT22TfY3dLAjNQCfDV2pd4efwXe2qc0h3hkeGQxC5kHSv25/uVXk62vGg7hQ/FZGUWza99E
 z7JzkVxTk3RA+9T5neWvP4Y13EnUu4p9LHFmiAFj5moIx256/pn0mXloHNgCxxLGe5bmgBL9N/o
 V135uAKh/hanDOn9mzTulYDSwWzdL7QBOvWzz7afm2khhj4f13JKtLpbcYvATA==
X-Received: by 2002:a05:600c:1d23:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-48047073e5bmr48399275e9.5.1769071893602; 
 Thu, 22 Jan 2026 00:51:33 -0800 (PST)
X-Received: by 2002:a05:600c:1d23:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-48047073e5bmr48398675e9.5.1769071893110; 
 Thu, 22 Jan 2026 00:51:33 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470287c3sm52812045e9.3.2026.01.22.00.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 00:51:32 -0800 (PST)
Date: Thu, 22 Jan 2026 09:51:32 +0100
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
Subject: [PULL] drm-misc-next
Message-ID: <20260122-antique-sexy-junglefowl-1bc5a8@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3nm3t5sl2o35yjav"
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


--3nm3t5sl2o35yjav
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-next PR. It should be the last drm-misc-next
PR for the 6.20/7.0 release cycle.

Maxime

drm-misc-next-2026-01-22:
drm-misc-next for 6.20:

Core Changes:
 - buddy: Fix free_trees memory leak, prevent a BUG_ON
 - dma-buf: Start to introduce cgroup memory accounting in heaps, Remove
   sysfs stats, add new tracepoints
 - hdmi: Limit infoframes exposure to userspace based on driver
   capabilities
 - property: Account for property blobs in memcg

Driver Changes:
 - atmel-hlcdc: Switch to drmm resources, Support nomodeset parameter,
   various patches to use newish helpers and fix memory safety bugs
 - hisilicon: Fix various DisplayPort related bugs
 - imagination: Introduce hardware version checks
 - renesas: Fix kernel panic on reboot
 - rockchip: Fix RK3576 HPD interrupt handling, Improve RK3588 HPD
   interrupt handling
 - v3d: Convert to drm logging helpers

 - bridge:
   - Continuation of the refcounting effort
   - new bridge: Algoltek AG6311

 - panel:
   - new panel: Anbernic RG-DS
The following changes since commit b36178488d479e9a53bbef2b01280378b5586e60:

  accel/amdxdna: Fix notifier_wq flushing warning (2026-01-14 09:07:33 -080=
0)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
6-01-22

for you to fetch changes up to 68b271a3a94cfd6c7695a96b6398b52feb89e2c2:

  drm/bridge: fix kdoc syntax (2026-01-21 18:02:28 +0100)

----------------------------------------------------------------
drm-misc-next for 6.20:

Core Changes:
 - buddy: Fix free_trees memory leak, prevent a BUG_ON
 - dma-buf: Start to introduce cgroup memory accounting in heaps, Remove
   sysfs stats, add new tracepoints
 - hdmi: Limit infoframes exposure to userspace based on driver
   capabilities
 - property: Account for property blobs in memcg

Driver Changes:
 - atmel-hlcdc: Switch to drmm resources, Support nomodeset parameter,
   various patches to use newish helpers and fix memory safety bugs
 - hisilicon: Fix various DisplayPort related bugs
 - imagination: Introduce hardware version checks
 - renesas: Fix kernel panic on reboot
 - rockchip: Fix RK3576 HPD interrupt handling, Improve RK3588 HPD
   interrupt handling
 - v3d: Convert to drm logging helpers

 - bridge:
   - Continuation of the refcounting effort
   - new bridge: Algoltek AG6311

 - panel:
   - new panel: Anbernic RG-DS

----------------------------------------------------------------
Alexandru Dadu (1):
      drm/imagination: Add gpuid module parameter

Alice Ryhl (1):
      drm/tyr: rename pad0 to selected_coherency

Andy Yan (1):
      drm/rockchip: vop2: Add mode valid callback for crtc

Baihan Li (4):
      drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD i=
rq
      drm/hisilicon/hibmc: add dp mode valid check
      drm/hisilicon/hibmc: fix no showing problem with loading hibmc manual=
ly
      drm/hisilicon/hibmc: Adding reset colorbar cfg in dp init.

Chris Morgan (3):
      drm: panel: jd9365da: Use gpiod_set_value_cansleep()
      dt-bindings: display: panel: Add compatible for Anbernic RG-DS
      drm/panel: jd9365da: Support for Anbernic RG-DS Panel

Cristian Ciocaltea (2):
      drm/rockchip: dw_hdmi_qp: Fix RK3576 HPD interrupt handling
      drm/rockchip: dw_hdmi_qp: Optimize RK3588 HPD interrupt handling

Dmitry Baryshkov (11):
      drm/tests: hdmi: check the infoframes behaviour
      drm/vc4: hdmi: implement clear_infoframe
      drm/sun4i: hdmi_enc: implement clear_infoframe stub
      drm/connector: make clear_infoframe callback mandatory for HDMI conne=
ctors
      drm/bridge: refactor HDMI InfoFrame callbacks
      drm/display: hdmi_state_helper: split InfoFrame functions per type
      drm/display: hdmi_state_helper: reject Audio IF updates if it's not s=
upported
      drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
      drm/display: bridge_connector: dynamically generate HDMI callbacks
      drm/debug: don't register files for unsupported HDMI InfoFrames
      drm/tests: hdmi: fix build failure

Eric Chanudet (2):
      dma-buf: heaps: add parameter to account allocations using cgroup
      dma-buf: system_heap: account for system heap allocation in memcg

Hugo Villeneuve (1):
      drm: renesas: rz-du: mipi_dsi: fix kernel panic when rebooting for so=
me panels

Jani Nikula (1):
      drm/rockchip: inno-hdmi: make inno_hdmi.h header self-contained

Jessica Zhang (1):
      mailmap: Update Jessica Zhang's email address

Loic Poulain (1):
      drm/bridge: anx7625: Fix invalid EDID size

Luca Ceresoli (19):
      drm: of: drm_of_panel_bridge_remove(): fix device_node leak
      drm: of: drm_of_panel_bridge_remove(): convert to of_drm_find_and_get=
_bridge()
      drm/bridge: sii902x: convert to of_drm_find_and_get_bridge()
      drm/bridge: thc63lvd1024: convert to of_drm_find_and_get_bridge()
      drm/bridge: tfp410: convert to of_drm_find_and_get_bridge()
      drm/bridge: tpd12s015: convert to of_drm_find_and_get_bridge()
      drm/bridge: lt8912b: convert to of_drm_find_and_get_bridge()
      drm/bridge: imx8mp-hdmi-pvi: convert to of_drm_find_and_get_bridge()
      drm/bridge: imx8qxp-ldb: convert to of_drm_find_and_get_bridge()
      drm/bridge: samsung-dsim: samsung_dsim_host_attach: use a temporary v=
ariable for the next bridge
      drm/bridge: samsung-dsim: samsung_dsim_host_attach: don't use the bri=
dge pointer as an error indicator
      drm/bridge: samsung-dsim: samsung_dsim_host_attach: convert to of_drm=
_find_and_get_bridge()
      drm/bridge: dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/imx/dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/mediatek: mtk_hdmi*: convert to of_drm_find_and_get_bridge()
      drm/exynos: hdmi: convert to of_drm_find_and_get_bridge()
      drm: rcar-du: lvds: convert to of_drm_find_and_get_bridge()
      drm/bridge: fix kdoc syntax

Ludovic Desroches (11):
      drm/atmel-hlcdc: use managed device resources for the display control=
ler
      drm/atmel-hlcdc: add support for the nomodeset kernel parameter
      drm/atmel-hlcdc: use drmm_simple_encoder_alloc()
      drm/atmel-hlcdc: use drm_crtc_mask()
      drm/atmel-hlcdc: use devm_drm_of_get_bridge()
      drm/atmel-hlcdc: use drmm_crtc_alloc_with_planes()
      drm/atmel-hlcdc: use drmm_universal_plane_alloc()
      drm/atmel-hlcdc: destroy properly the plane state in the reset callba=
ck
      drm/atmel-hlcdc: fix memory leak from the atomic_destroy_state callba=
ck
      drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit after release
      drm/atmel-hlcdc: don't reject the commit if the src rect has fraction=
al parts

Matt Coster (5):
      drm/imagination: Simplify module parameters
      drm/imagination: Validate fw trace group_mask
      drm/imagination: Load FW trace config at init
      drm/imagination: KUnit test for pvr_gpuid_decode_string()
      drm/imagination: Warn or error on unsupported hardware

Ma=C3=ADra Canal (2):
      drm/v3d: Consolidate CPU job validation in a function
      drm/v3d: Convert v3d logging to device-based DRM helpers

Micha=C5=82 Grzelak (1):
      drm/buddy: release free_trees array on buddy mm teardown

Sanjay Yadav (2):
      drm/buddy: Prevent BUG_ON by validating rounded allocation
      drm/tests/drm_buddy: Add tests for allocations exceeding max_order

T.J. Mercier (1):
      dma-buf: Remove DMA-BUF sysfs stats

Val Packett (3):
      dt-bindings: vendor-prefixes: Add AlgolTek
      dt-bindings: display: bridge: simple: document the Algoltek AG6311 DP=
-to-HDMI bridge
      drm/bridge: simple: add the Algoltek AG6311 DP-to-HDMI bridge

Xiao Kan (1):
      drm: Account property blob allocations to memcg

gaoxiang17 (1):
      dma-buf: add some tracepoints to debug.

 .mailmap                                           |   4 +-
 .../ABI/testing/sysfs-kernel-dmabuf-buffers        |  24 -
 .../bindings/display/bridge/simple-bridge.yaml     |   1 +
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/driver-api/dma-buf.rst               |   5 -
 drivers/dma-buf/Kconfig                            |  15 -
 drivers/dma-buf/Makefile                           |   1 -
 drivers/dma-buf/dma-buf-sysfs-stats.c              | 202 -------
 drivers/dma-buf/dma-buf-sysfs-stats.h              |  35 --
 drivers/dma-buf/dma-buf.c                          |  27 +-
 drivers/dma-buf/dma-heap.c                         |   5 +
 drivers/dma-buf/heaps/system_heap.c                |   7 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |  32 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |  40 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |   1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |  50 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |  98 ++-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 166 ++---
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   2 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |  15 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  12 +-
 drivers/gpu/drm/bridge/inno-hdmi.c                 |  41 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  87 +--
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  31 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 145 +++--
 drivers/gpu/drm/bridge/samsung-dsim.c              |  37 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   7 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |   5 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 116 ++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   7 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |   7 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  27 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |   8 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 190 +++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 114 ++--
 drivers/gpu/drm/drm_bridge.c                       |   3 +
 drivers/gpu/drm/drm_buddy.c                        |  10 +
 drivers/gpu/drm/drm_connector.c                    |   6 +
 drivers/gpu/drm/drm_debugfs.c                      |   7 +
 drivers/gpu/drm/drm_property.c                     |   2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   4 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h       |   4 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h     |   2 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c         |  38 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h         |   8 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h        |   3 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c     |  71 ++-
 drivers/gpu/drm/imagination/Kconfig                |  12 +
 drivers/gpu/drm/imagination/Makefile               |   3 +-
 drivers/gpu/drm/imagination/pvr_debugfs.c          |   2 -
 drivers/gpu/drm/imagination/pvr_device.c           | 200 +++++-
 drivers/gpu/drm/imagination/pvr_device.h           |  24 +-
 drivers/gpu/drm/imagination/pvr_fw_trace.c         | 125 +++-
 drivers/gpu/drm/imagination/pvr_fw_trace.h         |   3 -
 drivers/gpu/drm/imagination/pvr_params.c           | 147 -----
 drivers/gpu/drm/imagination/pvr_params.h           |  72 ---
 drivers/gpu/drm/imagination/pvr_test.c             |  73 +++
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c            |   7 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |  12 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h         |   1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 114 ++--
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |   6 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 195 +++---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   | 281 ++++++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |  10 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |   8 +
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  13 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  47 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  12 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  42 +-
 drivers/gpu/drm/tests/drm_buddy_test.c             |  35 ++
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   3 +
 drivers/gpu/drm/tests/drm_connector_test.c         |  19 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 667 +++++++++++++++++=
++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 119 ++++
 drivers/gpu/drm/tyr/gpu.rs                         |   5 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |   8 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   6 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  16 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |   8 +-
 drivers/gpu/drm/v3d/v3d_mmu.c                      |   6 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |   6 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   | 140 ++---
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 105 +++-
 include/drm/bridge/inno_hdmi.h                     |   2 +
 include/drm/bridge/samsung-dsim.h                  |   1 -
 include/drm/drm_bridge.h                           | 127 +++-
 include/drm/drm_connector.h                        | 115 ++--
 include/drm/drm_of.h                               |   6 +-
 include/linux/dma-buf.h                            |  12 -
 include/linux/dma-heap.h                           |   2 +
 include/trace/events/dma_buf.h                     |  50 +-
 94 files changed, 3108 insertions(+), 1489 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
 delete mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 delete mode 100644 drivers/gpu/drm/imagination/pvr_params.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_test.c

--3nm3t5sl2o35yjav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXHlEwAKCRAnX84Zoj2+
drV4AYD0UR4P2ca5rh1TJzj9bl7+fIQqyxGdialw5Y1R/mek4lQ7vUei6dGqXuUf
FPCb4EYBf19QzC5daLd5f4uHvBgS936S4CWVnZ7kuilC4PS1jOSZAEiMBz1L1cMQ
jHQpdf/xig==
=6hsF
-----END PGP SIGNATURE-----

--3nm3t5sl2o35yjav--

