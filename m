Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99323C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 19:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE1910ECA5;
	Fri, 19 Jul 2024 19:12:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DE210ECA5;
 Fri, 19 Jul 2024 19:12:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Update_page_fault_queue_size_c?=
 =?utf-8?q?alculation_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Jul 2024 19:12:38 -0000
Message-ID: <172141635892.291659.5432793655146747362@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1721415811.git.stuart.summers@intel.com>
In-Reply-To: <cover.1721415811.git.stuart.summers@intel.com>
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

Series: Update page fault queue size calculation (rev4)
URL   : https://patchwork.freedesktop.org/series/135915/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/drm_atomic.c:46:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_atomic_uapi.c:43:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_blend.c:36:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_bridge.c:38:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_client.c:23:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_color_mgmt.c:32:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_client_modeset.c:26:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_connector.c:41:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_crtc.c:52:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_displayid.c:9:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_drv.c:50:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_eld.c:11:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_dumb_buffers.c:31:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_edid.c:49:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_encoder.c:32:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_file.c:48:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_framebuffer.c:38:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_ioctl.c:43:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_lease.c:15:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_mode_config.c:34:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_mode_object.c:33:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_modes.c:50:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_plane.c:36:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_property.c:33:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_sysfs.c:34:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_debugfs.c:45:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_atomic_helper.c:48:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_fb_helper.c:47:
../drivers/gpu/drm/drm_crtc_internal.h:322:6: warning: no previous prototype for ‘drm_panic_is_enabled’ [-Wmissing-prototypes]
  322 | bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
      |      ^~~~~~~~~~~~~~~~~~~~
ld: drivers/gpu/drm/drm_atomic_uapi.o: in function `drm_panic_is_enabled':
drm_atomic_uapi.c:(.text+0x1120): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_blend.o: in function `drm_panic_is_enabled':
drm_blend.c:(.text+0x890): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_bridge.o: in function `drm_panic_is_enabled':
drm_bridge.c:(.text+0x1270): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_client.o: in function `drm_panic_is_enabled':
drm_client.c:(.text+0xbd0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_client_modeset.o: in function `drm_panic_is_enabled':
drm_client_modeset.c:(.text+0x2bb0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_color_mgmt.o: in function `drm_panic_is_enabled':
drm_color_mgmt.c:(.text+0x520): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_connector.o: in function `drm_panic_is_enabled':
drm_connector.c:(.text+0x2ae0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_crtc.o: in function `drm_panic_is_enabled':
drm_crtc.c:(.text+0xd50): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_displayid.o: in function `drm_panic_is_enabled':
drm_displayid.c:(.text+0x0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_drv.o: in function `drm_panic_is_enabled':
drm_drv.c:(.text+0x1500): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_dumb_buffers.o: in function `drm_panic_is_enabled':
drm_dumb_buffers.c:(.text+0x0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_edid.o: in function `drm_panic_is_enabled':
drm_edid.c:(.text+0x7fb0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_eld.o: in function `drm_panic_is_enabled':
drm_eld.c:(.text+0xa0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_encoder.o: in function `drm_panic_is_enabled':
drm_encoder.c:(.text+0x620): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_file.o: in function `drm_panic_is_enabled':
drm_file.c:(.text+0xc20): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_framebuffer.o: in function `drm_panic_is_enabled':
drm_framebuffer.c:(.text+0xc30): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_ioctl.o: in function `drm_panic_is_enabled':
drm_ioctl.c:(.text+0x1080): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_lease.o: in function `drm_panic_is_enabled':
drm_lease.c:(.text+0x210): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_mode_config.o: in function `drm_panic_is_enabled':
drm_mode_config.c:(.text+0xfe0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_mode_object.o: in function `drm_panic_is_enabled':
drm_mode_object.c:(.text+0x8b0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_modes.o: in function `drm_panic_is_enabled':
drm_modes.c:(.text+0x2e10): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_plane.o: in function `drm_panic_is_enabled':
drm_plane.c:(.text+0x20a0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_property.o: in function `drm_panic_is_enabled':
drm_property.c:(.text+0xe10): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_sysfs.o: in function `drm_panic_is_enabled':
drm_sysfs.c:(.text+0x8b0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_debugfs.o: in function `drm_panic_is_enabled':
drm_debugfs.c:(.text+0x1370): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_atomic_helper.o: in function `drm_panic_is_enabled':
drm_atomic_helper.c:(.text+0x69c0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_panic_is_enabled':
drm_fb_helper.c:(.text+0x2ea0): multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic.o:drm_atomic.c:(.text+0x3130): first defined here
make[3]: *** [../scripts/Makefile.vmlinux_o:62: vmlinux.o] Error 1
make[2]: *** [/kernel/Makefile:1152: vmlinux_o] Error 2
make[1]: *** [/kernel/Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2

[19:12:05] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:12:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


