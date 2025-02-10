Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1294C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 12:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7562A10E513;
	Mon, 10 Feb 2025 12:53:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC0810E513;
 Mon, 10 Feb 2025 12:53:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=5Fi915=5Fprivate_to_i?=
 =?utf-8?q?ntel=5Fdisplay_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 12:53:14 -0000
Message-ID: <173919199476.297497.7374256973824346284@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250210123950.3476620-1-suraj.kandpal@intel.com>
In-Reply-To: <20250210123950.3476620-1-suraj.kandpal@intel.com>
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

Series: drm_i915_private to intel_display cleanup
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
commit 003d2984a59abe44ad8ca096dd9166d2165e665d
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Feb 10 18:09:50 2025 +0530

    drm/i915/dpll: Replace all other leftover drm_i915_private
    
    Replace all other left over drm_i915_private with intel_display
    in dpll_mgr.c.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 71542b8e400e0d4ec7215e0b8b1fce67e5215f9f drm-intel
9f13969651c2 drm/i915/display_debug_fs: Use intel_display wherever possible
-:50: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 63)
#50: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:95:
+	if (DISPLAY_VER(display) >= 9)
 		/* no global SR status; inspect per-plane WM */;

total: 0 errors, 1 warnings, 0 checks, 506 lines checked
6b178adee435 drm/i915/display_debug_fs: Prefer using display->platform
23c0fe40df55 drm/i915/dpll: Change param to intel_display in for_each_shared_dpll
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
befd3ba4cc05 drm/i915/dpll: Use intel_display for dpll dump and compare hw state
ff10da9c3d55 drm/i915/dpll: Use intel_display possible in shared_dpll_mgr hooks
72e7fa648d19 drm/i915/dpll: Use intel_display for asserting pll
0ec63f912152 drm/i915/dpll: Use intel_display for update_refclk hook
d1e37fb0ae35 drm/i915/dpll: Accept intel_display as argument for shared_dpll_init
003d2984a59a drm/i915/dpll: Replace all other leftover drm_i915_private


