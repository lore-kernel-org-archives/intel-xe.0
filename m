Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422BDC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 13:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0540F10E472;
	Mon,  7 Apr 2025 13:57:13 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8696A10E472;
 Mon,  7 Apr 2025 13:57:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DPLL_framework_redesign_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Apr 2025 13:57:11 -0000
Message-ID: <174403423154.43714.9502731748712277437@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407081654.2013680-1-suraj.kandpal@intel.com>
In-Reply-To: <20250407081654.2013680-1-suraj.kandpal@intel.com>
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

Series: DPLL framework redesign (rev3)
URL   : https://patchwork.freedesktop.org/series/145380/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 970f8ce5a8c26ef0c3ef7e04268f6b5ec9b3c199
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Apr 7 13:46:54 2025 +0530

    drm/i915/dpll: Rename intel_update_active_dpll
    
    Rename intel_update_active_dpll to intel_dpll_update_active in an
    effort to have function names which are exported to start with
    filenames they are exported from.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 100ba24787e877cd422caa7d08cb046ef4bb769c drm-intel
d1ee3db0bb51 drm/i915/dpll: Rename intel_dpll
7a7318f1b468 drm/i915/dpll: Rename intel_dpll_funcs
54266a493777 drm/i915/dpll: Rename intel_shared_dpll_state
b86e73d1e626 drm/i915/dpll: Rename macro for_each_shared_dpll
-:102: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#102: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.h:33:
+#define for_each_dpll(__display, __pll, __i) \
 	for ((__i) = 0; (__i) < (__display)->dpll.num_shared_dpll && \
 		     ((__pll) = &(__display)->dpll.shared_dplls[(__i)]) ; (__i)++)

-:102: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#102: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.h:33:
+#define for_each_dpll(__display, __pll, __i) \
 	for ((__i) = 0; (__i) < (__display)->dpll.num_shared_dpll && \
 		     ((__pll) = &(__display)->dpll.shared_dplls[(__i)]) ; (__i)++)

total: 0 errors, 0 warnings, 2 checks, 81 lines checked
54dc362f06ab drm/i915/dpll: Rename intel_shared_dpll_funcs
ff993dc52fd4 drm/i915/dpll: Rename intel_shared_dpll
b95ded8a94ad drm/i915/dpll: Move away from using shared dpll
a00d749c033e drm/i915/dpll: Rename crtc_get_shared_dpll
3e81a3507b30 drm/i915/dpll: Change argument for enable hook in intel_dpll_funcs
4a79dca43d40 drm/i915/drm: Rename disable hook in intel_dpll_global_func
210c74752d66 drm/i915/dpll: Introduce new hook in intel_dpll_funcs
dcfd29712151 drm/i915/dpll: Add intel_encoder argument to get_hw_state hook
30e1af7f53fb drm/i915/dpll: Change arguments for get_freq hook
b10c0d6ca1eb drm/i915/dpll: Rename intel_[enable/disable]_dpll
558951d956b8 drm/i915/dpll: Rename intel_unreference_dpll__crtc
2289cb813ce9 drm/i915/dpll: Rename intel_<release/reserve>_dpll
2955799038a9 drm/i915/dpll: Rename intel_compute_dpll
970f8ce5a8c2 drm/i915/dpll: Rename intel_update_active_dpll


