Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF3BC2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 07:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4BB10E7A0;
	Thu, 15 May 2025 07:47:21 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885CB10E79F;
 Thu, 15 May 2025 07:47:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DPLL_framework_redesign?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 07:47:20 -0000
Message-ID: <174729524054.83245.13071711019447111547@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250515071801.2221120-1-suraj.kandpal@intel.com>
In-Reply-To: <20250515071801.2221120-1-suraj.kandpal@intel.com>
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

Series: DPLL framework redesign
URL   : https://patchwork.freedesktop.org/series/149051/
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
commit 48fbbd77f4f3e1bb483c06ef665e529ccc39bc83
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu May 15 12:48:01 2025 +0530

    drm/i915/dpll: Rename intel_update_active_dpll
    
    Rename intel_update_active_dpll to intel_dpll_update_active in an
    effort to have function names which are exported to start with
    filenames they are exported from.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 3d6670fab64cb00b5e6ed80d2517147db533faf1 drm-intel
cb9643b09d5c drm/i915/dpll: Rename intel_dpll
2cefad8ee2ed drm/i915/dpll: Rename intel_dpll_funcs
e9ee1ad5439b drm/i915/dpll: Rename intel_shared_dpll_state
3d3af853a2de drm/i915/dpll: Rename macro for_each_shared_dpll
-:103: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#103: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.h:33:
+#define for_each_dpll(__display, __pll, __i) \
 	for ((__i) = 0; (__i) < (__display)->dpll.num_shared_dpll && \
 		     ((__pll) = &(__display)->dpll.shared_dplls[(__i)]) ; (__i)++)

-:103: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#103: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.h:33:
+#define for_each_dpll(__display, __pll, __i) \
 	for ((__i) = 0; (__i) < (__display)->dpll.num_shared_dpll && \
 		     ((__pll) = &(__display)->dpll.shared_dplls[(__i)]) ; (__i)++)

total: 0 errors, 0 warnings, 2 checks, 81 lines checked
285588eb392c drm/i915/dpll: Rename intel_shared_dpll_funcs
7aeff800a71b drm/i915/dpll: Rename intel_shared_dpll
a8fd668513a2 drm/i915/dpll: Move away from using shared dpll
2d29283db0e2 drm/i915/dpll: Rename crtc_get_shared_dpll
fcfc6f5fe637 drm/i915/dpll: Rename intel_[enable/disable]_dpll
38597b653493 drm/i915/dpll: Rename intel_unreference_dpll_crtc
2e53aaf90811 drm/i915/dpll: Rename intel_reference_dpll_crtc
61facb52d3f1 drm/i915/dpll: Rename intel_<release/reserve>_dpll
89c3ae84faa5 drm/i915/dpll: Rename intel_compute_dpll
48fbbd77f4f3 drm/i915/dpll: Rename intel_update_active_dpll


