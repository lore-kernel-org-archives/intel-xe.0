Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0F5E6F06C
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 08:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57EC10E142;
	Tue, 23 Dec 2025 08:23:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C580510E142;
 Tue, 23 Dec 2025 08:23:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Make_casf_updates_atomic_?=
 =?utf-8?q?and_dsb_ready_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Dec 2025 08:23:06 -0000
Message-ID: <176647818680.113796.7078277313747087343@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251223081300.1196417-1-nemesa.garg@intel.com>
In-Reply-To: <20251223081300.1196417-1-nemesa.garg@intel.com>
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

Series: Make casf updates atomic and dsb ready (rev2)
URL   : https://patchwork.freedesktop.org/series/158668/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ee2af1f4cf858cb2aec0cab26b72c346bcb240fb
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Tue Dec 23 13:43:00 2025 +0530

    drm/i915/display: Common wrapper for casf and pfit
    
    Make a common wrapper for pipe_scaling and sharpness
    which will be invoked from hsw_crtc_enable and
    pipe_fastset. Then accoridng to the condition
    pfit_enable or casf_enable or casf_update_strength
    can be invoked. This is done so that all pipe
    related functions can be under one umberalla.
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch f101d56dc32350daa45c130ff7a6d46512f614a9 drm-intel
1e6006f17593 drm/i915/display: Move casf_compute_config
-:49: ERROR:CODE_INDENT: code indent should use tabs where possible
#49: FILE: drivers/gpu/drm/i915/display/intel_display.c:6428:
+                    old_crtc_state->uapi.sharpness_strength)$

-:49: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#49: FILE: drivers/gpu/drm/i915/display/intel_display.c:6428:
+                    old_crtc_state->uapi.sharpness_strength)$

-:50: ERROR:CODE_INDENT: code indent should use tabs where possible
#50: FILE: drivers/gpu/drm/i915/display/intel_display.c:6429:
+                        new_crtc_state->uapi.mode_changed = true;$

-:50: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#50: FILE: drivers/gpu/drm/i915/display/intel_display.c:6429:
+                        new_crtc_state->uapi.mode_changed = true;$

total: 2 errors, 2 warnings, 0 checks, 30 lines checked
88e2834f013e drm/i915/display: Introduce skl_pipe_scaler_setup()
-:26: ERROR:CODE_INDENT: code indent should use tabs where possible
#26: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:765:
+        struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);$

-:26: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#26: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:765:
+        struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);$

-:28: ERROR:CODE_INDENT: code indent should use tabs where possible
#28: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:767:
+                &crtc_state->scaler_state;$

-:28: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#28: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:767:
+                &crtc_state->scaler_state;$

-:66: ERROR:CODE_INDENT: code indent should use tabs where possible
#66: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:782:
+                          PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height));$

-:66: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#66: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:782:
+                          PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height));$

total: 3 errors, 3 warnings, 0 checks, 114 lines checked
ee2af1f4cf85 drm/i915/display: Common wrapper for casf and pfit
-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/i915/display/intel_display.c:6622:
+static void intel_pipe_fastset(struct intel_atomic_state *state,
+		const struct intel_crtc_state *old_crtc_state,

-:57: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 24)
#57: FILE: drivers/gpu/drm/i915/display/intel_display.c:6639:
 	if (DISPLAY_VER(display) >= 9) {
+			skl_scaler_enable(state, crtc);

-:93: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'feature' - possible side-effects?
#93: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:755:
+#define is_enabling(feature, old_crtc_state, new_crtc_state) \
+        ((!(old_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)) && \
+         (new_crtc_state)->feature)

-:93: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'feature' may be better as '(feature)' to avoid precedence issues
#93: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:755:
+#define is_enabling(feature, old_crtc_state, new_crtc_state) \
+        ((!(old_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)) && \
+         (new_crtc_state)->feature)

-:93: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'new_crtc_state' - possible side-effects?
#93: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:755:
+#define is_enabling(feature, old_crtc_state, new_crtc_state) \
+        ((!(old_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)) && \
+         (new_crtc_state)->feature)

-:94: ERROR:CODE_INDENT: code indent should use tabs where possible
#94: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:756:
+        ((!(old_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)) && \$

-:94: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#94: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:756:
+        ((!(old_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)) && \$

-:95: ERROR:CODE_INDENT: code indent should use tabs where possible
#95: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:757:
+         (new_crtc_state)->feature)$

-:95: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#95: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:757:
+         (new_crtc_state)->feature)$

-:98: ERROR:CODE_INDENT: code indent should use tabs where possible
#98: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:760:
+                                const struct intel_crtc_state *old_crtc_state)$

-:98: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#98: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:760:
+                                const struct intel_crtc_state *old_crtc_state)$

-:100: ERROR:CODE_INDENT: code indent should use tabs where possible
#100: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:762:
+        if (!new_crtc_state->hw.active)$

-:100: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#100: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:762:
+        if (!new_crtc_state->hw.active)$

-:101: ERROR:CODE_INDENT: code indent should use tabs where possible
#101: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:763:
+                return false;$

-:101: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#101: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:763:
+                return false;$

-:103: ERROR:CODE_INDENT: code indent should use tabs where possible
#103: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:765:
+        return is_enabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);$

-:103: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#103: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:765:
+        return is_enabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);$

-:114: ERROR:CODE_INDENT: code indent should use tabs where possible
#114: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:876:
+                       struct intel_crtc *crtc)$

-:114: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#114: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:876:
+                       struct intel_crtc *crtc)$

-:116: ERROR:CODE_INDENT: code indent should use tabs where possible
#116: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:878:
+        struct intel_crtc_state *new_crtc_state =$

-:116: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#116: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:878:
+        struct intel_crtc_state *new_crtc_state =$

-:117: ERROR:CODE_INDENT: code indent should use tabs where possible
#117: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:879:
+                intel_atomic_get_new_crtc_state(state, crtc);$

-:117: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#117: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:879:
+                intel_atomic_get_new_crtc_state(state, crtc);$

-:118: ERROR:CODE_INDENT: code indent should use tabs where possible
#118: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:880:
+        struct intel_crtc_state *old_crtc_state =$

-:118: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#118: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:880:
+        struct intel_crtc_state *old_crtc_state =$

-:119: ERROR:CODE_INDENT: code indent should use tabs where possible
#119: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:881:
+                intel_atomic_get_old_crtc_state(state, crtc);$

-:119: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#119: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:881:
+                intel_atomic_get_old_crtc_state(state, crtc);$

-:121: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#121: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:883:
+       if (new_crtc_state->pch_pfit.enabled)$

-:121: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (7, 15)
#121: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:883:
+       if (new_crtc_state->pch_pfit.enabled)
+               skl_pfit_enable(new_crtc_state);

-:122: ERROR:CODE_INDENT: code indent should use tabs where possible
#122: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:884:
+               skl_pfit_enable(new_crtc_state);$

-:122: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#122: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:884:
+               skl_pfit_enable(new_crtc_state);$

-:123: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#123: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:885:
+       else if (intel_casf_enabling(new_crtc_state, old_crtc_state))$

-:123: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (7, 16)
#123: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:885:
+       else if (intel_casf_enabling(new_crtc_state, old_crtc_state))
+                intel_casf_enable(new_crtc_state);

-:124: ERROR:CODE_INDENT: code indent should use tabs where possible
#124: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:886:
+                intel_casf_enable(new_crtc_state);$

-:124: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#124: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:886:
+                intel_casf_enable(new_crtc_state);$

-:125: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#125: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:887:
+       else if (new_crtc_state->hw.casf_params.strength != old_crtc_state->hw.casf_params.strength)$

-:125: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (7, 16)
#125: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:887:
+       else if (new_crtc_state->hw.casf_params.strength != old_crtc_state->hw.casf_params.strength)
+                intel_casf_update_strength(new_crtc_state);

-:126: ERROR:CODE_INDENT: code indent should use tabs where possible
#126: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:888:
+                intel_casf_update_strength(new_crtc_state);$

-:126: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#126: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:888:
+                intel_casf_update_strength(new_crtc_state);$

-:141: ERROR:CODE_INDENT: code indent should use tabs where possible
#141: FILE: drivers/gpu/drm/i915/display/skl_scaler.h:44:
+                       struct intel_crtc *crtc);$

-:141: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#141: FILE: drivers/gpu/drm/i915/display/skl_scaler.h:44:
+                       struct intel_crtc *crtc);$

total: 15 errors, 22 warnings, 4 checks, 110 lines checked


