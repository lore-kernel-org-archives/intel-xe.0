Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34143C52D7D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 13:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B6C10E67D;
	Fri, 16 Aug 2024 13:04:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECFB10E58C;
 Fri, 16 Aug 2024 13:04:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Provide_client_set?=
 =?utf-8?q?up_helper_and_convert_drivers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 13:04:02 -0000
Message-ID: <172381344238.654289.15289533545578882183@2413ebb6fbb6>
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
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bc2e6acf0b21b2c317d386cd0d7dea4bdc43e304
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Fri Aug 16 14:23:52 2024 +0200

    drm/fb-helper: Remove struct drm_fb_helper.fb_probe
    
    The callback fb_probe in struct drm_fb_helper is unused. Remove it.
    New drivers should set struct drm_driver.fbdev_probe instead and call
    drm_client_setup() to instantiate in-kernel DRM clients.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch 70d6d55dea574b7b78ccf714699cc5d8d62fcc2c drm-intel
dbbe77e43aae drm/fbdev-helper: Move color-mode lookup into 4CC format helper
ffb255019bb2 drm/fbdev-helper: Set and clear VGA switcheroo client from fb_info
7087b5d41bf6 drm/fbdev: Add memory-agnostic fbdev client
-:91: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#91: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 236 lines checked
771e6926ae8c drm: Add client-agnostic setup helper
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

-:88: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#88: FILE: drivers/gpu/drm/drm_client_setup.c:51:
+	uint32_t fmt = drm_driver_color_mode_format(dev, color_mode);

total: 0 errors, 1 warnings, 1 checks, 74 lines checked
583e54980030 drm/fbdev-dma: Support struct drm_driver.fbdev_probe
7fd3f3c41621 drm/arcgpu: Run DRM default client setup
c02dde30b20e drm/arm/komeda: Run DRM default client setup
a43996abc768 drm/arm/hdlcd: Run DRM default client setup
aefeb24af9b6 drm/arm/malidp: Run DRM default client setup
8f2ba9ac84fe drm/aspeed: Run DRM default client setup
c0bd38753793 drm/atmel-hdlcd: Run DRM default client setup
6e389ec3af77 drm/fsl-dcu: Run DRM default client setup
17903ccf1bc5 drm/hisilicon/kirin: Run DRM default client setup
5ea18cea7053 drm/hx8357d: Run DRM default client setup
63f681ffa23b drm/ili9163: Run DRM default client setup
7899f4a28eb1 drm/ili9225: Run DRM default client setup
6eb5df084d1a drm/ili9341: Run DRM default client setup
4b9aa1c5f028 drm/ili9486: Run DRM default client setup
11d52d5c8394 drm/imx/dcss: Run DRM default client setup
2fcfa2c18df4 drm/imx/ipuv3: Run DRM default client setup
7a45a413b7ad drm/imx/lcdc: Run DRM default client setup
ec058833e2e3 drm/ingenic: Run DRM default client setup
e5caa29ce062 drm/kmb: Run DRM default client setup
b12f7ed8b393 drm/logicvc: Run DRM default client setup
24f9d3affacc drm/mcde: Run DRM default client setup
5244eab58bc9 drm/mediatek: Run DRM default client setup
d78200a66bd2 drm/meson: Run DRM default client setup
ab56a5ea72ab drm/mi0283qt: Run DRM default client setup
9e7871057e48 drm/mxsfb/lcdif: Run DRM default client setup
934fa3c8188e drm/msxfb: Run DRM default client setup
daced4593542 drm/panel/ili9341: Run DRM default client setup
bd50c122d8a0 drm/panel-mipi-dbi: Run DRM default client setup
5933f72d063c drm/pl111: Run DRM default client setup
a337b73ec24f drm/renesas/rcar-du: Run DRM default client setup
22dbe6e2ebf6 drm/renesas/rz-du: Run DRM default client setup
acd2b0a52626 drm/renesas/shmobile: Run DRM default client setup
6f43b9a3913c drm/repaper: Run DRM default client setup
1076fdfef342 drm/rockchip: Run DRM default client setup
3683afa0790a drm/sti: Run DRM default client setup
54fab82ed61f drm/stm: Run DRM default client setup
43cdf7378776 drm/sun4i: Run DRM default client setup
66374919ebe0 drm/tidss: Run DRM default client setup
021fa1b61d72 drm/tilcdc: Run DRM default client setup
f713bd8a3b2a drm/st7586: Run DRM default client setup
ee24930b3cb8 drm/st7735r: Run DRM default client setup
ce58cfe659ee drm/tve200: Run DRM default client setup
468714d0ea71 drm/vc4: Run DRM default client setup
c8effee76eff drm/xlnx: Run DRM default client setup
391c0e8a99db drm/fbdev-dma: Remove obsolete setup function
8442e8acabe5 drm/fbdev-shmem: Support struct drm_driver.fbdev_probe
96b62c445df9 drm/ast: Run DRM default client setup
df903cdd8223 drm/cirrus: Run DRM default client setup
-:14: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

-:17: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

total: 0 errors, 2 warnings, 0 checks, 22 lines checked
95fb9e3b25df drm/gm12u320: Run DRM default client setup
9b3a4f251bbf drm/gud: Run DRM default client setup
1a068a584971 drm/hyperv_drm: Run DRM default client setup
351e33650c94 drm/mgag200: Run DRM default client setup
-:11: WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Dave Airlie <airlied@redhat.com>i', should be: 'Dave Airlie <airlied@redhat.com> (i)'
#11: 
Cc: Dave Airlie <airlied@redhat.com>i

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
e95cd30e0d7d drm/ofdrm: Use DRM default client setup
47e6aa7c3f91 drm/simpledrm: Run DRM default client setup
056cf3290b0f drm/solomon: Run DRM default client setup
6c7a736467ca drm/udl: Run DRM default client setup
658ef1942b6f drm/virtgpu: Run DRM default client setup
58e7053be64b drm/vkms: Run DRM default client setup
32baba39fab1 drm/fbdev-shmem: Remove obsolete setup function
8b09ac708491 drm/fbdev-ttm: Support struct drm_driver.fbdev_probe
1ed15f91d832 drm/amdgpu: Run DRM default client setup
c8ff49a15c36 drm/bochs: Run DRM default client setup
9510ebcf0f2b drm/hisilicon/hibmc: Run DRM default client setup
1ffc796b420e drm/loongson: Run DRM default client setup
4e1a08dc41d0 drm/nouveau: Run DRM default client setup
fd55ab97914a drm/qxl: Run DRM default client setup
1e2fc1ad8dc3 drm/vboxvideo: Run DRM default client setup
1d132a14ac42 drm/vmwgfx: Run DRM default client setup
0dae2236b45e drm/fbdev-ttm: Remove obsolete setup function
d7c84f493c4a drm/armada: Run DRM default client setup
5e4b1403c0be drm/exynos-drm: Run DRM default client setup
d3b4c45a25c4 drm/gma500: Run DRM default client setup
4cacef18386d drm/msm: Run DRM default client setup
fe7063f9bd0b drm/radeon: Run DRM default client setup
3af6ff5c95e1 drm/tegra: Run DRM default client setup
a6a36c949951 drm/i915: Remove struct drm_fb_helper from struct intel_fbdev
56a17e40ea0e drm/i915: Move custom restore code into separate callback
6613c0d1379d drm/i915: Move custom hotplug code into separate callback
7f6e9f3ee45a drm/{i915,xe}: Run DRM default client setup
1ed62e940865 drm/omapdrm: Remove struct drm_fb_helper from struct omap_fbdev.
eb772971d08c drm/omapdrm: Run DRM default client setup
bc2e6acf0b21 drm/fb-helper: Remove struct drm_fb_helper.fb_probe


