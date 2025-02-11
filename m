Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C18BC0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 11:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DA710E2E8;
	Tue, 11 Feb 2025 11:51:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9379C10E2E8;
 Tue, 11 Feb 2025 11:51:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=5Fi915=5Fprivate_to_i?=
 =?utf-8?q?ntel=5Fdisplay_cleanup_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Feb 2025 11:51:19 -0000
Message-ID: <173927467960.883771.7062731537139997484@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211104857.3501566-1-suraj.kandpal@intel.com>
In-Reply-To: <20250211104857.3501566-1-suraj.kandpal@intel.com>
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

Series: drm_i915_private to intel_display cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/144587/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1f3acac76736d9598784b153dd4d7f7d6c552dda
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Feb 11 16:18:57 2025 +0530

    drm/i915/dpll: Replace all other leftover drm_i915_private
    
    Replace all other left over drm_i915_private with intel_display
    in dpll_mgr.c.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 27f9e4e3866556a4498e3b4ddebc27d4f6d0ae2f drm-intel
0c9c8fdd19b6 drm/i915/display_debug_fs: Use intel_display wherever possible
-:54: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 63)
#54: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:95:
+	if (DISPLAY_VER(display) >= 9)
 		/* no global SR status; inspect per-plane WM */;

total: 0 errors, 1 warnings, 0 checks, 507 lines checked
869c25c351e1 drm/i915/display_debug_fs: Prefer using display->platform
1eb71cbed5e8 drm/i915/dpll: Change param to intel_display in for_each_shared_dpll
-:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#141: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.h:33:
+#define for_each_shared_dpll(__display, __pll, __i) \
+	for ((__i) = 0; (__i) < (__display)->dpll.num_shared_dpll && \
+		     ((__pll) = &(__display)->dpll.shared_dplls[(__i)]) ; (__i)++)

-:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#141: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.h:33:
+#define for_each_shared_dpll(__display, __pll, __i) \
+	for ((__i) = 0; (__i) < (__display)->dpll.num_shared_dpll && \
+		     ((__pll) = &(__display)->dpll.shared_dplls[(__i)]) ; (__i)++)

total: 0 errors, 0 warnings, 2 checks, 218 lines checked
2efa14bd8694 drm/i915/dpll: Use intel_display for dpll dump and compare hw state
31f898c03ebf drm/i915/dpll: Use intel_display possible in shared_dpll_mgr hooks
fd69bc1f8d4d drm/i915/dpll: Use intel_display for asserting pll
52fd522258d2 drm/i915/dpll: Use intel_display for update_refclk hook
7a7e82d4ee53 drm/i915/dpll: Accept intel_display as argument for shared_dpll_init
1f3acac76736 drm/i915/dpll: Replace all other leftover drm_i915_private


