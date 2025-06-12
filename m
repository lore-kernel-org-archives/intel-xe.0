Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F12AC61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 13:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627F010E3F8;
	Thu, 12 Jun 2025 13:14:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A849510E828;
 Thu, 12 Jun 2025 13:14:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_make_?=
 =?utf-8?q?all_global_state_opaque?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 13:14:16 -0000
Message-ID: <174973405668.72049.11607581733228501471@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1749730224.git.jani.nikula@intel.com>
In-Reply-To: <cover.1749730224.git.jani.nikula@intel.com>
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

Series: drm/i915/display: make all global state opaque
URL   : https://patchwork.freedesktop.org/series/150157/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0ec5aba21280d173fd611f1f3571b832ca82097e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jun 12 15:12:11 2025 +0300

    drm/i915/cdclk: make struct intel_cdclk_state opaque
    
    With all the code touching struct intel_cdclk_state moved inside
    intel_cdclk.c, we move the struct definition there too, and make the
    type opaque. This nicely reduces includes from intel_cdclk.h.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a338c75e43f1604b70e9b2f8d287bb1b5d7ca934 drm-intel
ec9ddf123579 drm/i915/wm: abstract intel_dbuf_pmdemand_needs_update()
-:63: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'state' - possible side-effects?
#63: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:44:
+#define intel_atomic_get_old_dbuf_state(state) \
+	to_intel_dbuf_state(intel_atomic_get_old_global_obj_state(state, &to_intel_display(state)->dbuf.obj))

-:64: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#64: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:45:
+	to_intel_dbuf_state(intel_atomic_get_old_global_obj_state(state, &to_intel_display(state)->dbuf.obj))

-:65: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'state' - possible side-effects?
#65: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:46:
+#define intel_atomic_get_new_dbuf_state(state) \
+	to_intel_dbuf_state(intel_atomic_get_new_global_obj_state(state, &to_intel_display(state)->dbuf.obj))

-:66: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:47:
+	to_intel_dbuf_state(intel_atomic_get_new_global_obj_state(state, &to_intel_display(state)->dbuf.obj))

total: 0 errors, 2 warnings, 2 checks, 94 lines checked
d01566e344e3 drm/i915/wm: add more accessors to dbuf state
-:28: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#28: FILE: drivers/gpu/drm/i915/display/intel_pmdemand.c:366:
+			min_t(u8, intel_dbuf_num_active_pipes(new_dbuf_state), INTEL_NUM_PIPES(display));

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
5b546b7ddd65 drm/i915/wm: make struct intel_dbuf_state opaque type
b66ac648b412 drm/i915/bw: abstract intel_bw_pmdemand_needs_update()
e11f9bc27b3f drm/i915/bw: relocate intel_can_enable_sagv() and rename to intel_bw_can_enable_sagv()
ed40e4caf95a drm/i915: move icl_sagv_{pre, post}_plane_update() to intel_bw.c
382c385cb881 drm/i915/bw: abstract intel_bw_qgv_point_peakbw()
a2a197842c96 drm/i915/bw: make struct intel_bw_state opaque
70affc178a2b drm/i915/cdclk: abstract intel_cdclk_logical()
4bc78f94980f drm/i915/cdclk: abstract intel_cdclk_min_cdclk()
8625ae8ad0e2 drm/i915/cdclk: abstract intel_cdclk_bw_min_cdclk()
066010611645 drm/i915/cdclk: abstract intel_cdclk_pmdemand_needs_update()
5f179f789c38 drm/i915/cdclk: abstract intel_cdclk_force_min_cdclk()
13206b7101de drm/i915/cdclk: abstract intel_cdclk_read_hw()
21688a79b280 drm/i915/cdclk: abstract intel_cdclk_actual() and intel_cdclk_actual_voltage_level()
0ec5aba21280 drm/i915/cdclk: make struct intel_cdclk_state opaque


