Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F55C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 13:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950E210E67C;
	Fri, 16 Aug 2024 13:02:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA2110E58C;
 Fri, 16 Aug 2024 13:02:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=3A_Provide_clien?=
 =?utf-8?q?t_setup_helper_and_convert_drivers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 13:02:51 -0000
Message-ID: <172381337177.653293.12950387282180110331@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816125408.310253-1-tzimmermann@suse.de>
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm: Provide client setup helper and convert drivers
URL   : https://patchwork.freedesktop.org/series/137387/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 70d6d55dea57 drm-tip: 2024y-08m-16d-08h-43m-44s UTC integration manifest
=== git am output follows ===
Applying: drm/fbdev-helper: Move color-mode lookup into 4CC format helper
Applying: drm/fbdev-helper: Set and clear VGA switcheroo client from fb_info
Applying: drm/fbdev: Add memory-agnostic fbdev client
Applying: drm: Add client-agnostic setup helper
Applying: drm/fbdev-dma: Support struct drm_driver.fbdev_probe
Applying: drm/arcgpu: Run DRM default client setup
Applying: drm/arm/komeda: Run DRM default client setup
Applying: drm/arm/hdlcd: Run DRM default client setup
Applying: drm/arm/malidp: Run DRM default client setup
Applying: drm/aspeed: Run DRM default client setup
Applying: drm/atmel-hdlcd: Run DRM default client setup
Applying: drm/fsl-dcu: Run DRM default client setup
Applying: drm/hisilicon/kirin: Run DRM default client setup
Applying: drm/hx8357d: Run DRM default client setup
Applying: drm/ili9163: Run DRM default client setup
Applying: drm/ili9225: Run DRM default client setup
Applying: drm/ili9341: Run DRM default client setup
Applying: drm/ili9486: Run DRM default client setup
Applying: drm/imx/dcss: Run DRM default client setup
Applying: drm/imx/ipuv3: Run DRM default client setup
Applying: drm/imx/lcdc: Run DRM default client setup
Applying: drm/ingenic: Run DRM default client setup
Applying: drm/kmb: Run DRM default client setup
Applying: drm/logicvc: Run DRM default client setup
Applying: drm/mcde: Run DRM default client setup
Applying: drm/mediatek: Run DRM default client setup
Applying: drm/meson: Run DRM default client setup
Applying: drm/mi0283qt: Run DRM default client setup
Applying: drm/mxsfb/lcdif: Run DRM default client setup
Applying: drm/msxfb: Run DRM default client setup
Applying: drm/panel/ili9341: Run DRM default client setup
Applying: drm/panel-mipi-dbi: Run DRM default client setup
Applying: drm/pl111: Run DRM default client setup
Applying: drm/renesas/rcar-du: Run DRM default client setup
Applying: drm/renesas/rz-du: Run DRM default client setup
Applying: drm/renesas/shmobile: Run DRM default client setup
Applying: drm/repaper: Run DRM default client setup
Applying: drm/rockchip: Run DRM default client setup
Applying: drm/sti: Run DRM default client setup
Applying: drm/stm: Run DRM default client setup
Applying: drm/sun4i: Run DRM default client setup
Applying: drm/tidss: Run DRM default client setup
Applying: drm/tilcdc: Run DRM default client setup
Applying: drm/st7586: Run DRM default client setup
Applying: drm/st7735r: Run DRM default client setup
Applying: drm/tve200: Run DRM default client setup
Applying: drm/vc4: Run DRM default client setup
Applying: drm/xlnx: Run DRM default client setup
Applying: drm/fbdev-dma: Remove obsolete setup function
Applying: drm/fbdev-shmem: Support struct drm_driver.fbdev_probe
Applying: drm/ast: Run DRM default client setup
Applying: drm/cirrus: Run DRM default client setup
Applying: drm/gm12u320: Run DRM default client setup
Applying: drm/gud: Run DRM default client setup
Applying: drm/hyperv_drm: Run DRM default client setup
Applying: drm/mgag200: Run DRM default client setup
Applying: drm/ofdrm: Use DRM default client setup
Applying: drm/simpledrm: Run DRM default client setup
Applying: drm/solomon: Run DRM default client setup
Applying: drm/udl: Run DRM default client setup
Applying: drm/virtgpu: Run DRM default client setup
Applying: drm/vkms: Run DRM default client setup
Applying: drm/fbdev-shmem: Remove obsolete setup function
Applying: drm/fbdev-ttm: Support struct drm_driver.fbdev_probe
Applying: drm/amdgpu: Run DRM default client setup
Applying: drm/bochs: Run DRM default client setup
Applying: drm/hisilicon/hibmc: Run DRM default client setup
Applying: drm/loongson: Run DRM default client setup
Applying: drm/nouveau: Run DRM default client setup
Applying: drm/qxl: Run DRM default client setup
Applying: drm/vboxvideo: Run DRM default client setup
Applying: drm/vmwgfx: Run DRM default client setup
Applying: drm/fbdev-ttm: Remove obsolete setup function
Applying: drm/armada: Run DRM default client setup
Applying: drm/exynos-drm: Run DRM default client setup
Applying: drm/gma500: Run DRM default client setup
Applying: drm/msm: Run DRM default client setup
Applying: drm/radeon: Run DRM default client setup
Applying: drm/tegra: Run DRM default client setup
Applying: drm/i915: Remove struct drm_fb_helper from struct intel_fbdev
Applying: drm/i915: Move custom restore code into separate callback
Applying: drm/i915: Move custom hotplug code into separate callback
Applying: drm/{i915,xe}: Run DRM default client setup
Applying: drm/omapdrm: Remove struct drm_fb_helper from struct omap_fbdev.
Applying: drm/omapdrm: Run DRM default client setup
Applying: drm/fb-helper: Remove struct drm_fb_helper.fb_probe


