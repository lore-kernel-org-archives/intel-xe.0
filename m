Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE88C7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 10:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5112C10E0E2;
	Wed, 25 Jun 2025 10:42:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F11510E0E2;
 Wed, 25 Jun 2025 10:42:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_make_?=
 =?utf-8?q?all_global_state_opaque_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Jun 2025 10:42:21 -0000
Message-ID: <175084814112.107859.15848636365748877919@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1750847509.git.jani.nikula@intel.com>
In-Reply-To: <cover.1750847509.git.jani.nikula@intel.com>
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

Series: drm/i915/display: make all global state opaque (rev2)
URL   : https://patchwork.freedesktop.org/series/150157/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 03470e8c7ece10eeaeec77d95bf2529d4d878040
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jun 25 13:32:34 2025 +0300

    drm/i915/cdclk: make struct intel_cdclk_state opaque
    
    With all the code touching struct intel_cdclk_state moved inside
    intel_cdclk.c, we move the struct definition there too, and make the
    type opaque. This nicely reduces includes from intel_cdclk.h.
    
    Reviewed-by: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch e4196e8184ee5a9c70c136f659dccef786c263b3 drm-intel
0039319189b4 drm/i915/wm: abstract intel_dbuf_pmdemand_needs_update()
-:64: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'state' - possible side-effects?
#64: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:45:
+#define intel_atomic_get_old_dbuf_state(state) \
+	to_intel_dbuf_state(intel_atomic_get_old_global_obj_state(state, &to_intel_display(state)->dbuf.obj))

-:65: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:46:
+	to_intel_dbuf_state(intel_atomic_get_old_global_obj_state(state, &to_intel_display(state)->dbuf.obj))

-:66: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'state' - possible side-effects?
#66: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:47:
+#define intel_atomic_get_new_dbuf_state(state) \
+	to_intel_dbuf_state(intel_atomic_get_new_global_obj_state(state, &to_intel_display(state)->dbuf.obj))

-:67: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#67: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:48:
+	to_intel_dbuf_state(intel_atomic_get_new_global_obj_state(state, &to_intel_display(state)->dbuf.obj))

total: 0 errors, 2 warnings, 2 checks, 94 lines checked
cf99f9955488 drm/i915/wm: add more accessors to dbuf state
-:29: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#29: FILE: drivers/gpu/drm/i915/display/intel_pmdemand.c:366:
+			min_t(u8, intel_dbuf_num_active_pipes(new_dbuf_state), INTEL_NUM_PIPES(display));

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
7c151bf53e16 drm/i915/wm: make struct intel_dbuf_state opaque type
ce8b5d2c32f8 drm/i915/bw: abstract intel_bw_pmdemand_needs_update()
eae7144cbf1d drm/i915/bw: relocate intel_can_enable_sagv() and rename to intel_bw_can_enable_sagv()
4d9c2f4c5934 drm/i915: move icl_sagv_{pre, post}_plane_update() to intel_bw.c
3d0e5a83bb3b drm/i915/bw: abstract intel_bw_qgv_point_peakbw()
e32ed708fb64 drm/i915/bw: make struct intel_bw_state opaque
f81cfbc4a25b drm/i915/cdclk: abstract intel_cdclk_logical()
ae21fbc18dd6 drm/i915/cdclk: abstract intel_cdclk_min_cdclk()
41eee6fbfe50 drm/i915/cdclk: abstract intel_cdclk_bw_min_cdclk()
f409597f69ba drm/i915/cdclk: abstract intel_cdclk_pmdemand_needs_update()
efec290d819f drm/i915/cdclk: abstract intel_cdclk_force_min_cdclk()
216c5784b41d drm/i915/cdclk: abstract intel_cdclk_read_hw()
5aa60c5a12aa drm/i915/cdclk: abstract intel_cdclk_actual() and intel_cdclk_actual_voltage_level()
03470e8c7ece drm/i915/cdclk: make struct intel_cdclk_state opaque


