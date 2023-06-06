Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AC7C7EE2F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 23:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE79410E06E;
	Tue,  6 Jun 2023 23:56:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44ADF10E06E;
 Tue,  6 Jun 2023 23:56:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 415EAAADD6;
 Tue,  6 Jun 2023 23:56:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Tue, 06 Jun 2023 23:56:16 -0000
Message-ID: <168609577626.22675.16583767488166505150@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230606235242.1895643-1-matthew.d.roper@intel.com>
In-Reply-To: <20230606235242.1895643-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ut?=
 =?utf-8?q?ilize_i915_display_probing_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Utilize i915 display probing (rev2)
URL   : https://patchwork.freedesktop.org/series/118675/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4f05c9d9908c5f3f561c3b69039259c2dceec436
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Jun 6 16:52:42 2023 -0700

    fixup! drm/xe/display: Implement display support
+ /mt/dim checkpatch a17ea8317b0260a1230cedb0469d4ba0cec0f4f2 drm-intel
97bb79751 drm/i915/display: Move display device info to header under display/
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

-:35: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros with multiple statements should be enclosed in a do - while loop
#35: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:13:
+#define DEV_INFO_DISPLAY_FOR_EACH_FLAG(func) \
+	/* Keep in alphabetical order */ \
+	func(cursor_needs_physical); \
+	func(has_cdclk_crawl); \
+	func(has_cdclk_squash); \
+	func(has_ddi); \
+	func(has_dp_mst); \
+	func(has_dsb); \
+	func(has_fpga_dbg); \
+	func(has_gmch); \
+	func(has_hotplug); \
+	func(has_hti); \
+	func(has_ipc); \
+	func(has_overlay); \
+	func(has_psr); \
+	func(has_psr_hw_tracking); \
+	func(overlay_needs_physical); \
+	func(supports_tv);

-:35: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'func' - possible side-effects?
#35: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:13:
+#define DEV_INFO_DISPLAY_FOR_EACH_FLAG(func) \
+	/* Keep in alphabetical order */ \
+	func(cursor_needs_physical); \
+	func(has_cdclk_crawl); \
+	func(has_cdclk_squash); \
+	func(has_ddi); \
+	func(has_dp_mst); \
+	func(has_dsb); \
+	func(has_fpga_dbg); \
+	func(has_gmch); \
+	func(has_hotplug); \
+	func(has_hti); \
+	func(has_ipc); \
+	func(has_overlay); \
+	func(has_psr); \
+	func(has_psr_hw_tracking); \
+	func(overlay_needs_physical); \
+	func(supports_tv);

-:35: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#35: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:13:
+#define DEV_INFO_DISPLAY_FOR_EACH_FLAG(func) \
+	/* Keep in alphabetical order */ \
+	func(cursor_needs_physical); \
+	func(has_cdclk_crawl); \
+	func(has_cdclk_squash); \
+	func(has_ddi); \
+	func(has_dp_mst); \
+	func(has_dsb); \
+	func(has_fpga_dbg); \
+	func(has_gmch); \
+	func(has_hotplug); \
+	func(has_hti); \
+	func(has_ipc); \
+	func(has_overlay); \
+	func(has_psr); \
+	func(has_psr_hw_tracking); \
+	func(overlay_needs_physical); \
+	func(supports_tv);

total: 1 errors, 2 warnings, 1 checks, 127 lines checked
b78cb546c drm/i915: Convert INTEL_INFO()->display to a pointer
-:243: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#243: FILE: drivers/gpu/drm/i915/display/intel_display_reg_defs.h:43:
+					      DISPLAY_INFO(dev_priv)->trans_offsets[TRANSCODER_A] + \

-:904: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#904: FILE: drivers/gpu/drm/i915/i915_pci.c:485:
+ };$

-:1728: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'name' may be better as '(name)' to avoid precedence issues
#1728: FILE: drivers/gpu/drm/i915/intel_device_info.c:141:
+#define PRINT_FLAG(name) drm_printf(p, "%s: %s\n", #name, str_yes_no(info->display->name))

total: 0 errors, 2 warnings, 1 checks, 1601 lines checked
b714e515f drm/i915/display: Move display runtime info to display structure
-:73: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#73: FILE: drivers/gpu/drm/i915/display/intel_display.h:108:
+#define sprite_name(p, s) ((p) * DISPLAY_RUNTIME_INFO(dev_priv)->num_sprites[(p)] + (s) + 'A')

-:91: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#91: FILE: drivers/gpu/drm/i915/display/intel_display.h:232:
+		for_each_if (DISPLAY_RUNTIME_INFO(__dev_priv)->cpu_transcoder_mask & BIT(__t))

-:200: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#200: FILE: drivers/gpu/drm/i915/i915_drv.h:208:
+	struct intel_display_runtime_info __display_runtime; /* Access with DISPLAY_RUNTIME_INFO() */

-:235: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#235: FILE: drivers/gpu/drm/i915/i915_drv.h:836:
+#define HAS_TRANSCODER(i915, trans)	 ((DISPLAY_RUNTIME_INFO(i915)->cpu_transcoder_mask & BIT(trans)) != 0)

total: 0 errors, 3 warnings, 1 checks, 1068 lines checked
3581088c0 drm/i915/display: Make display responsible for probing its own IP
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1898 lines checked
e50279650 drm/i915/display: Handle GMD_ID identification in display code
579016f22 drm/i915/display: Move feature test macros to intel_display_device.h
-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#26: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:37:
+#define HAS_CUR_FBC(i915)		(!HAS_GMCH(i915) && DISPLAY_VER(i915) >= 7)

-:27: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#27: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:38:
+#define HAS_D12_PLANE_MINIMIZATION(i915) (IS_ROCKETLAKE(i915) || IS_ALDERLAKE_S(i915))

-:31: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#31: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:42:
+#define HAS_DOUBLE_BUFFERED_M_N(i915)	(DISPLAY_VER(i915) >= 9 || IS_BROADWELL(i915))

-:33: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#33: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:44:
+#define HAS_DP20(i915)			(IS_DG2(i915) || DISPLAY_VER(i915) >= 14)

-:41: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#41: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:52:
+#define HAS_GMBUS_BURST_READ(i915)	(DISPLAY_VER(i915) >= 10 || IS_KABYLAKE(i915))

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#43: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:54:
+#define HAS_HW_SAGV_WM(i915)		(DISPLAY_VER(i915) >= 13 && !IS_DGFX(i915))

-:45: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#45: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:56:
+#define HAS_IPS(i915)			(IS_HSW_ULT(i915) || IS_BROADWELL(i915))

-:47: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#47: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:58:
+#define HAS_MBUS_JOINING(i915)		(IS_ALDERLAKE_P(i915) || DISPLAY_VER(i915) >= 14)

-:53: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#53: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:64:
+#define HAS_SAGV(i915)			(DISPLAY_VER(i915) >= 9 && !IS_LP(i915))

total: 0 errors, 0 warnings, 9 checks, 161 lines checked
696a3727a drm/i915/display: Include of display limits doesn't need 'display/'
40d66b008 drm/i915: Fix error handling if driver creation fails during probe
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '12e6f6dc78e4', maybe rebased or not pulled?
#11: 
Fixes: 12e6f6dc78e4 ("drm/i915/display: Handle GMD_ID identification in display code")

-:12: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Link: with a URL to the report
#12: 
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/55236f93-dcc5-481e-b788-9f7e95b129d8@kili.mountain/

-:13: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#13: 
Closes: https://lore.kernel.org/all/55236f93-dcc5-481e-b788-9f7e95b129d8@kili.mountain/

-:13: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Closes:', use 'Link:' instead
#13: 
Closes: https://lore.kernel.org/all/55236f93-dcc5-481e-b788-9f7e95b129d8@kili.mountain/

total: 0 errors, 4 warnings, 0 checks, 10 lines checked
504f311a4 drm/i915/display: Extract display init from intel_device_info_runtime_init
-:328: CHECK:SPACING: No space is necessary after a cast
#328: FILE: drivers/gpu/drm/i915/intel_device_info.c:428:
+	BUILD_BUG_ON(BITS_PER_TYPE(intel_engine_mask_t) < I915_NUM_ENGINES);

total: 0 errors, 0 warnings, 1 checks, 313 lines checked
4f05c9d99 fixup! drm/xe/display: Implement display support
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:202: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#202: FILE: drivers/gpu/drm/xe/display/ext/intel_device_info.c:48:
 }
+int i8xx_enable_vblank(struct drm_crtc *crtc) { return 0; }

-:207: ERROR:OPEN_BRACE: open brace '{' following function definitions go on the next line
#207: FILE: drivers/gpu/drm/xe/display/ext/intel_device_info.c:53:
+bool intel_sdvo_init(struct drm_i915_private *dev_priv,
+		     i915_reg_t sdvo_reg, enum port port) { return false; }

-:211: ERROR:OPEN_BRACE: open brace '{' following function definitions go on the next line
#211: FILE: drivers/gpu/drm/xe/display/ext/intel_device_info.c:57:
+void g4x_hdmi_init(struct drm_i915_private *dev_priv,
+		   i915_reg_t hdmi_reg, enum port port) {}

-:502: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 3 errors, 1 warnings, 1 checks, 461 lines checked


