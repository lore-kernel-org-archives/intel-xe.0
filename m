Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C72C5320E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 13:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709F910E60A;
	Wed, 21 Aug 2024 13:14:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517A610E605;
 Wed, 21 Aug 2024 13:14:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Provide_client_set?=
 =?utf-8?q?up_helper_and_convert_drivers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Aug 2024 13:14:43 -0000
Message-ID: <172424608332.718388.1005153846989910631@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821130348.73038-1-tzimmermann@suse.de>
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
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

Series: drm: Provide client setup helper and convert drivers (rev2)
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
commit d2dee79890defb981bed96140c1bc1f0158b235e
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Aug 21 15:00:23 2024 +0200

    drm/fb-helper: Remove struct drm_fb_helper.fb_probe
    
    The callback fb_probe in struct drm_fb_helper is unused. Remove it.
    New drivers should set struct drm_driver.fbdev_probe instead and call
    drm_client_setup() to instantiate in-kernel DRM clients.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
+ /mt/dim checkpatch c83ab549ef8f647c3de42793d222a980021a973f drm-intel
d6a266719a7f drm/fbdev-helper: Move color-mode lookup into 4CC format helper
c3c796ea8565 drm/fbdev-helper: Set and clear VGA switcheroo client from fb_info
c8f7619f4f8b drm/fbdev: Add memory-agnostic fbdev client
-:97: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#97: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 245 lines checked
d16bb8cc29b3 drm: Add client-agnostic setup helper
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 91 lines checked
c38fa56e31c5 drm/fbdev-dma: Support struct drm_driver.fbdev_probe
e9d9ebefcf56 drm/arcgpu: Run DRM default client setup
06f98bda8dbe drm/arm/komeda: Run DRM default client setup
19db1253f88d drm/arm/hdlcd: Run DRM default client setup
6aca9989108c drm/arm/malidp: Run DRM default client setup
5526f08ce3db drm/aspeed: Run DRM default client setup
f42705fe8980 drm/atmel-hdlcd: Run DRM default client setup
ac6fa8842853 drm/fsl-dcu: Run DRM default client setup
79175d163f11 drm/hisilicon/kirin: Run DRM default client setup
faa33bfb7107 drm/hx8357d: Run DRM default client setup
e943e1b06b05 drm/ili9163: Run DRM default client setup
941f018d9d45 drm/ili9225: Run DRM default client setup
4603588a7526 drm/ili9341: Run DRM default client setup
de89bd21b287 drm/ili9486: Run DRM default client setup
67cc1723a792 drm/imx/dcss: Run DRM default client setup
dece4f349d09 drm/imx/ipuv3: Run DRM default client setup
d740e5527248 drm/imx/lcdc: Run DRM default client setup
739d5e57b84a drm/ingenic: Run DRM default client setup
a5102072ea3d drm/kmb: Run DRM default client setup
a9eff23ee933 drm/logicvc: Run DRM default client setup
9bd043450481 drm/mcde: Run DRM default client setup
47c32c599a25 drm/mediatek: Run DRM default client setup
d88a4ab21de8 drm/meson: Run DRM default client setup
fa0e0d70d60b drm/mi0283qt: Run DRM default client setup
96120ecccca1 drm/mxsfb/lcdif: Run DRM default client setup
7f8116832a0c drm/msxfb: Run DRM default client setup
75e37b0d21e7 drm/panel/ili9341: Run DRM default client setup
ab4e74f30c27 drm/panel-mipi-dbi: Run DRM default client setup
9f1b68346f49 drm/pl111: Run DRM default client setup
5a0ca745bb4e drm/renesas/rcar-du: Run DRM default client setup
267144d81038 drm/renesas/rz-du: Run DRM default client setup
dd6461b9e8be drm/renesas/shmobile: Run DRM default client setup
45385617883f drm/repaper: Run DRM default client setup
0e3aef5bf59a drm/rockchip: Run DRM default client setup
ccdb0b5953c0 drm/sti: Run DRM default client setup
16e7db4c52ad drm/stm: Run DRM default client setup
a68186873ff8 drm/sun4i: Run DRM default client setup
88983a1fef45 drm/tidss: Run DRM default client setup
94405e97ad29 drm/tilcdc: Run DRM default client setup
8a550c6a0245 drm/st7586: Run DRM default client setup
d5740222855f drm/st7735r: Run DRM default client setup
669052b12ad4 drm/tve200: Run DRM default client setup
d21e293b2716 drm/vc4: Run DRM default client setup
6f6b8a4256c0 drm/xlnx: Run DRM default client setup
4b25e6800a83 drm/fbdev-dma: Remove obsolete setup function
ee97feea0b15 drm/fbdev-shmem: Support struct drm_driver.fbdev_probe
84f4a8bfd7ad drm/ast: Run DRM default client setup
a64250d18383 drm/cirrus: Run DRM default client setup
-:19: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

-:22: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

total: 0 errors, 2 warnings, 0 checks, 22 lines checked
f73bc910fa05 drm/gm12u320: Run DRM default client setup
3cb9099f17a2 drm/gud: Run DRM default client setup
a5ee4096a158 drm/hyperv_drm: Run DRM default client setup
c00bff2efbf7 drm/mgag200: Run DRM default client setup
3b285018875d drm/ofdrm: Use DRM default client setup
350c1c793d0b drm/simpledrm: Run DRM default client setup
8019164b1390 drm/solomon: Run DRM default client setup
94c73c514bfb drm/udl: Run DRM default client setup
9427464fcf47 drm/virtgpu: Run DRM default client setup
1f89846e9fa1 drm/vkms: Run DRM default client setup
1c4758b2d7ef drm/fbdev-shmem: Remove obsolete setup function
d14c81e91988 drm/fbdev-ttm: Support struct drm_driver.fbdev_probe
6eb9db1ff023 drm/amdgpu: Run DRM default client setup
4b69aa6e019d drm/bochs: Run DRM default client setup
ea5f71810e42 drm/hisilicon/hibmc: Run DRM default client setup
4fd7355c688f drm/loongson: Run DRM default client setup
c1605980330e drm/nouveau: Run DRM default client setup
2ab937ae0f62 drm/qxl: Run DRM default client setup
f9dfc01fe064 drm/vboxvideo: Run DRM default client setup
9f9731fe83b5 drm/vmwgfx: Run DRM default client setup
7ac97f500c8a drm/fbdev-ttm: Remove obsolete setup function
a21e3b06fdff drm/armada: Run DRM default client setup
7d413d421818 drm/exynos-drm: Run DRM default client setup
bf0966859421 drm/gma500: Run DRM default client setup
9f87d41a8b74 drm/msm: Run DRM default client setup
5f31f3540ca1 drm/radeon: Run DRM default client setup
6d96611d0921 drm/tegra: Run DRM default client setup
bc9735891201 drm/i915: Remove struct drm_fb_helper from struct intel_fbdev
6f06695ba0bc drm/i915: Move custom restore code into separate callback
d5687c38d204 drm/i915: Move custom hotplug code into separate callback
cc2ebf76b323 drm/{i915,xe}: Run DRM default client setup
a972dfbfbadb drm/omapdrm: Remove struct drm_fb_helper from struct omap_fbdev.
1ea8e5062817 drm/omapdrm: Run DRM default client setup
d2dee79890de drm/fb-helper: Remove struct drm_fb_helper.fb_probe


