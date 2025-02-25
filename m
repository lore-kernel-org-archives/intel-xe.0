Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CDCC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 08:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6510A10E5BD;
	Tue, 25 Feb 2025 08:43:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1188D10E5BD;
 Tue, 25 Feb 2025 08:43:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DPLL_framework_redesign?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 08:43:57 -0000
Message-ID: <174047303706.1904367.7223099485533019879@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225080927.157437-1-suraj.kandpal@intel.com>
In-Reply-To: <20250225080927.157437-1-suraj.kandpal@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/145380/
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
commit b1d2523bfc5fd846bc50b0e06b35286d0b99e05f
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Feb 25 13:39:27 2025 +0530

    drm/i915/dpll: Change arguments for get_freq hook
    
    Change the arguments for get_freq hook in intel_global_dpll_get_funcs
    to use only intel_crtc_state and intel_encoder since that all we need
    and the rest can be derived from the above two.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 32ff724d21f3ec064db2d1a034c47a76d800382f drm-intel
aafcc049f2c6 drm/i915/dpll: Rename intel_shared_dpll_state
daf63f325d4f drm/i915/dpll: Rename macro for_each_shared_dpll
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
5f4d41c80ea3 drm/i915/dpll: Rename intel_shared_dpll_funcs
0eda92bba5cc drm/i915/dpll: Rename intel_shared_dpll
a48d668d05a0 drm/i915/dpll: Move away from using shared dpll
409478d99c7c drm/i915/dpll: Rename crtc_get_shared_dpll
f836ad758e71 drm/i915/dpll: Change argument for enable hook in intel_global_dpll_funcs
7578144a74af drm/i915/drm: Rename disable hook in intel_dpll_global_func
3d7f81c5ebc3 drm/i915/dpll: Introduce new hook in intel_global_dpll_func
84a91b0ef17b drm/i915/dpll: Add intel_encoder argument to get_hw_state hook
b1d2523bfc5f drm/i915/dpll: Change arguments for get_freq hook


