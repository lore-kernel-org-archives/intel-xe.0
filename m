Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4EFC36014
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 08:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF3B10E712;
	Wed,  2 Apr 2025 08:40:26 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB77A10E715;
 Wed,  2 Apr 2025 08:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DPLL_framework_redesign_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 08:40:24 -0000
Message-ID: <174358322469.26569.15836924691309056442@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402083204.1523470-1-suraj.kandpal@intel.com>
In-Reply-To: <20250402083204.1523470-1-suraj.kandpal@intel.com>
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

Series: DPLL framework redesign (rev2)
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
commit 15868762c8a0acfbd506f0385c9caf431e99ded7
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Wed Apr 2 14:02:04 2025 +0530

    drm/i915/dpll: Rename intel_update_active_dpll
    
    Rename intel_update_active_dpll to intel_dpll_update_active in an
    effort to have function names which are exported to start with
    filenames they are exported from.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch f0fd77956987f035c79d08c812343a27a655a57b drm-intel
6d389dc3b7a2 drm/i915/dpll: Rename intel_shared_dpll_state
7d821180c8e9 drm/i915/dpll: Rename macro for_each_shared_dpll
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
118b57db0a78 drm/i915/dpll: Rename intel_shared_dpll_funcs
c54777679a04 drm/i915/dpll: Rename intel_shared_dpll
35a75716f77c drm/i915/dpll: Move away from using shared dpll
4bbc0d5f6251 drm/i915/dpll: Rename crtc_get_shared_dpll
c046d7908512 drm/i915/dpll: Change argument for enable hook in intel_global_dpll_funcs
1877a99c9263 drm/i915/drm: Rename disable hook in intel_dpll_global_func
16e7b9fa1ebe drm/i915/dpll: Introduce new hook in intel_dpll_global_func
014809e753d9 drm/i915/dpll: Add intel_encoder argument to get_hw_state hook
257612d424b8 drm/i915/dpll: Change arguments for get_freq hook
7a1d1026788d drm/i915/dpll: Rename intel_[enable/disable]_global_dpll
d675005552ca drm/i915/dpll: Rename intel_unreference_dpll_global_crtc
28f28a463697 drm/i915/dpll: Rename intel_<release/reserve>_dpll_globals
0ad1c0f06a81 drm/i915/dpll: Rename intel_compute_dpll_globals
15868762c8a0 drm/i915/dpll: Rename intel_update_active_dpll


