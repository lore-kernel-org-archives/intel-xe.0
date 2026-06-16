Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD66FCD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 14:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8543010E1E6;
	Tue, 16 Jun 2026 14:59:19 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186AE10E1E6;
 Tue, 16 Jun 2026 14:59:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_CMRR_in_fixed-RR_V?=
 =?utf-8?q?RR_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jun 2026 14:59:18 -0000
Message-ID: <178162195809.85096.3353820810689479591@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable CMRR in fixed-RR VRR path
URL   : https://patchwork.freedesktop.org/series/168613/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 837e6d170bd003387c28e7206e19440d5ed638e1
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue Jun 16 20:12:32 2026 +0530

    drm/i915/vrr: Enable cmrr
    
    Enable CMRR during compute config and add related state
    checker for the same.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch 70646d7ea3ac559ed269c0a38cd3699fea4e1eeb drm-intel
514592d1b64c drm/i915/vrr: add per-CRTC vrr/cmrr debugfs control
2c73b5db5aa0 drm/i915/vrr: compute CMRR fractional timings generically
b5d3b3beb328 drm/i915/vrr: dump CMRR state in the crtc state dump
ebec82bb1e09 drm/i915/vrr: Move CMRR hw registers to fix refresh rate path
e54b0c4f6521 drm/i915/vrr: Enable/Disable CMRR based on enable/disable preconditions
-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'feature' - possible side-effects?
#25: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:37:
+#define is_enabling(feature, old_crtc_state, new_crtc_state) \
+	((!(old_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)) && \
+	 (new_crtc_state)->feature)

-:25: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'feature' may be better as '(feature)' to avoid precedence issues
#25: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:37:
+#define is_enabling(feature, old_crtc_state, new_crtc_state) \
+	((!(old_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)) && \
+	 (new_crtc_state)->feature)

-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'new_crtc_state' - possible side-effects?
#25: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:37:
+#define is_enabling(feature, old_crtc_state, new_crtc_state) \
+	((!(old_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)) && \
+	 (new_crtc_state)->feature)

-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'feature' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:40:
+#define is_disabling(feature, old_crtc_state, new_crtc_state) \
+	((old_crtc_state)->feature && \
+	 (!(new_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)))

-:28: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'feature' may be better as '(feature)' to avoid precedence issues
#28: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:40:
+#define is_disabling(feature, old_crtc_state, new_crtc_state) \
+	((old_crtc_state)->feature && \
+	 (!(new_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)))

-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'new_crtc_state' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:40:
+#define is_disabling(feature, old_crtc_state, new_crtc_state) \
+	((old_crtc_state)->feature && \
+	 (!(new_crtc_state)->feature || intel_crtc_needs_modeset(new_crtc_state)))

total: 0 errors, 0 warnings, 6 checks, 127 lines checked
bd595cfa13d5 drm/i915/display: Move CMRR crtc_state members under VRR
376932a29bb3 drm/i915/vrr: Fix the CMRR enabling/disabling sequence
aa6b1186c1ba drm/i915/vrr: Compare state and HW registers if platform supports CMRR
6d41ece355d6 drm/i915/vrr: Remove TODO as CMRR is exclusive to Adaptive mode
97a229846fdb drm/i915/vrr: Return from CMRR compute config in case of PSR2 enabled
837e6d170bd0 drm/i915/vrr: Enable cmrr


