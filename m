Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC529606A323
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 10:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F2E10E9E7;
	Mon, 16 Nov 2026 10:37:23 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF91210E9E7;
 Mon, 16 Nov 2026 10:37:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/atomic=3A_Try_to_make?=
 =?utf-8?q?_atomic+async_usable=2C_and_clear_up_the_=22async_update=22_helpe?=
 =?utf-8?q?r_confusion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 10:37:22 -0000
Message-ID: <179482544291.30140.7112922050900323381@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/atomic: Try to make atomic+async usable, and clear up the "async update" helper confusion
URL   : https://patchwork.freedesktop.org/series/178652/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f475fad08c303fd39bd60f4adb8fcbb36131e62f
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Nov 16 11:11:30 2026 +0200

    drm/atomic/uapi: Extract {connector, crtc, plane}_async_flip_check()
    
    Reduce the clutter in drm_atomic_set_property() by
    extracting the async flip related checks to
    connector,crtc,plane}_async_flip_check().
    
    Cc: amd-gfx@lists.freedesktop.org
    Cc: André Almeida <andrealmeid@igalia.com>
    Cc: Boris Brezillon <bbrezillon@kernel.org>
    Cc: Christopher Snowhill <chris@kode54.net>
    Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
    Cc: Dharma Balasubiramani <dharma.b@microchip.com>
    Cc: Dmitry Baryshkov <lumag@kernel.org>
    Cc: freedreno@lists.freedesktop.org
    Cc: Gustavo Padovan <gustavo.padovan@collabora.com>
    Cc: Huacai Chen <chenhuacai@kernel.org>
    Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>
    Cc: intel-gfx@lists.freedesktop.org
    Cc: intel-xe@lists.freedesktop.org
    Cc: Jianmin Lv <lvjianmin@loongson.cn>
    Cc: linux-arm-msm@vger.kernel.org
    Cc: linux-mediatek@lists.infradead.org
    Cc: linux-rockchip@lists.infradead.org
    Cc: linux-tegra@vger.kernel.org
    Cc: Liviu Dudau <liviu.dudau@arm.com>
    Cc: Maíra Canal <mcanal@igalia.com>
    Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Mingcong Bai <jeffbai@aosc.io>
    Cc: nouveau@lists.freedesktop.org
    Cc: Qianhai Wu <wuqianhai@loongson.cn>
    Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
    Cc: Simon Ser <contact@emersion.fr>
    Cc: wayland-devel@lists.freedesktop.org
    Cc: Xaver Hugl <xaver.hugl@kde.org>
    Cc: Xi Ruoyao <xry111@xry111.site>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 5bb208452f267a62584fc2c559a6b6feb18356f0 drm-intel
7dac1f962677 drm/atomic: Remove tall tales about tearing vs. "async updates"
a5594e92bb5d drm/atomic: s/async/bypass/
-:106: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#106: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c:1591:
 }
+EXPORT_IF_KUNIT(amdgpu_dm_plane_atomic_bypass_check);

-:126: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#126: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c:1751:
 }
+EXPORT_IF_KUNIT(amdgpu_dm_plane_atomic_bypass_update);

-:353: WARNING:LONG_LINE_COMMENT: line length of 104 exceeds 100 columns
#353: FILE: drivers/gpu/drm/drm_atomic_helper.c:2102:
+ * drm_atomic_helper_bypass_check - check if state can be committed bypassing the normal commit tracking

-:692: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#692: FILE: drivers/gpu/drm/tegra/dc.c:1130:
+static int tegra_cursor_atomic_bypass_check(struct drm_plane *plane, struct drm_atomic_commit *state,

total: 0 errors, 2 warnings, 2 checks, 712 lines checked
c71a4277e1f5 drm/atomic: Add FIXMEs around the incorrect use of the .atomic_bypass_check() for async flips
f5a92ae9b6c0 drm/atomic: Highlight that bypass commits need care
e135d605afa5 drm/atomic/uapi: Eliminate the confusing drm_atomic_check_prop_changes()
69bd6a603447 drm/atomic/uapi: Improve the async flip property rejection debugs
73e4a4a8ecaa drm/atomic/uapi: Document the non-obvious fence/fb_id prop behaviour
94b3e70759e5 drm/atomic/uapi: Add a FIXME about colorop vs. async flips
5fc713862c28 drm/atomic-helper: Mark drm_atomic_crtc_state_for_each_plane_state() unsafe
-:119: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#119: FILE: drivers/gpu/drm/i915/display/intel_display.h:310:
+#define __intel_atomic_crtc_state_for_each_plane_state_unsafe( \
 		  plane, plane_state, \
 		  crtc_state) \
 	for_each_intel_plane_mask(((crtc_state)->uapi.state->dev), (plane), \
 				((crtc_state)->uapi.plane_mask)) \
 		for_each_if ((plane_state = \
+			      to_intel_plane_state(__drm_atomic_get_current_plane_state_unsafe((crtc_state)->uapi.state, &plane->base))))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:119: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'plane' - possible side-effects?
#119: FILE: drivers/gpu/drm/i915/display/intel_display.h:310:
+#define __intel_atomic_crtc_state_for_each_plane_state_unsafe( \
 		  plane, plane_state, \
 		  crtc_state) \
 	for_each_intel_plane_mask(((crtc_state)->uapi.state->dev), (plane), \
 				((crtc_state)->uapi.plane_mask)) \
 		for_each_if ((plane_state = \
+			      to_intel_plane_state(__drm_atomic_get_current_plane_state_unsafe((crtc_state)->uapi.state, &plane->base))))

-:119: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc_state' - possible side-effects?
#119: FILE: drivers/gpu/drm/i915/display/intel_display.h:310:
+#define __intel_atomic_crtc_state_for_each_plane_state_unsafe( \
 		  plane, plane_state, \
 		  crtc_state) \
 	for_each_intel_plane_mask(((crtc_state)->uapi.state->dev), (plane), \
 				((crtc_state)->uapi.plane_mask)) \
 		for_each_if ((plane_state = \
+			      to_intel_plane_state(__drm_atomic_get_current_plane_state_unsafe((crtc_state)->uapi.state, &plane->base))))

-:126: WARNING:LONG_LINE: line length of 137 exceeds 100 columns
#126: FILE: drivers/gpu/drm/i915/display/intel_display.h:316:
+			      to_intel_plane_state(__drm_atomic_get_current_plane_state_unsafe((crtc_state)->uapi.state, &plane->base))))

-:260: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#260: FILE: include/drm/drm_atomic_helper.h:235:
+#define __drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, plane_state, crtc_state) \
 	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)->plane_mask) \
 		for_each_if ((plane_state = \
+			      __drm_atomic_get_current_plane_state_unsafe((crtc_state)->state, \
+									  plane)))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:260: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'plane' - possible side-effects?
#260: FILE: include/drm/drm_atomic_helper.h:235:
+#define __drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, plane_state, crtc_state) \
 	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)->plane_mask) \
 		for_each_if ((plane_state = \
+			      __drm_atomic_get_current_plane_state_unsafe((crtc_state)->state, \
+									  plane)))

-:260: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'crtc_state' - possible side-effects?
#260: FILE: include/drm/drm_atomic_helper.h:235:
+#define __drm_atomic_crtc_state_for_each_plane_state_unsafe(plane, plane_state, crtc_state) \
 	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)->plane_mask) \
 		for_each_if ((plane_state = \
+			      __drm_atomic_get_current_plane_state_unsafe((crtc_state)->state, \
+									  plane)))

total: 2 errors, 1 warnings, 4 checks, 156 lines checked
ae15450fd980 drm/i915: Complete no-op "async flips" by hand
ab36804e3382 drm/atomic/uapi: Make async flips a bit more palatable through atomic
-:133: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#133: FILE: drivers/gpu/drm/drm_atomic.c:520:
+}
+/* Do not export! Only meant for drm_atomic_set_property(). */

-:177: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#177: FILE: drivers/gpu/drm/drm_atomic.c:764:
+}
+/* Do not export! Only meant for drm_atomic_set_property(). */

-:222: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#222: FILE: drivers/gpu/drm/drm_atomic.c:1594:
+}
+/* Do not export! Only meant for drm_atomic_set_property(). */

total: 0 errors, 0 warnings, 3 checks, 313 lines checked
f475fad08c30 drm/atomic/uapi: Extract {connector, crtc, plane}_async_flip_check()


