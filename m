Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C99D49C76
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 08:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9502610E970;
	Fri, 30 Jan 2026 08:41:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B637110E970;
 Fri, 30 Jan 2026 08:41:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Account_for_DSC_bubble_ov?=
 =?utf-8?q?erhead_for_horizontal_slices_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Jan 2026 08:41:20 -0000
Message-ID: <176976248074.208851.14839747722223023958@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
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

Series: Account for DSC bubble overhead for horizontal slices (rev6)
URL   : https://patchwork.freedesktop.org/series/152803/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a90b5b376ed0b3d49550caedcc3dd1f77acbaaa5
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Fri Jan 30 13:48:12 2026 +0530

    drm/i915/display: Extend the max dotclock limit to WCL
    
    Add upper limit check for pixel clock for WCL.
    
    For prior platforms though the bspec mentions the dotclock limits, however
    these are intentionally not enforced to avoid regressions, unless real
    issues are observed.
    
    BSpec: 49199, 68912
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 69c1143407ca17d556eb4e5ead7eb43b60a3fe65 drm-intel
0872fbf8a04a drm/i915/dp: Early reject bad hdisplay in intel_dp_mode_valid
3188b96d1646 drm/i915/dp: Move num_joined_pipes and related checks together
f9bfd2b83ba1 drm/i915/dp: Extract helper to get the hdisplay limit
4337e85fb793 drm/i915/dp: Rework pipe joiner logic in mode_valid
b943f67b743a drm/i915/dp: Rework pipe joiner logic in compute_config
30052af9b269 drm/i915/dp_mst: Move the check for dotclock at the end
bacd0798d55d drm/i915/dp_mst: Move the joiner dependent code together
8e2b64e19a0e drm/i915/dp_mst: Rework pipe joiner logic in mode_valid
b917873473a8 drm/i915/dp_mst: Extract helper to compute link for given joiner config
bddb6c3ef8ec drm/i915/dp_mst: Rework pipe joiner logic in compute_config
b9baae204d87 drm/i915/dp: Remove unused joiner helpers
735d9ce430ff drm/i915/dp: Introduce helper to check pixel rate against dotclock limits
2553c202ae0a drm/i915/dp: Refactor dsc_slice_count handling in intel_dp_mode_valid()
2faf358819c6 drm/i915/dp: Account for DSC slice overhead
7dd563890ff2 drm/i915/dp: Add helpers for joiner candidate loops
-:100: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__num_joined_pipes' - possible side-effects?
#100: FILE: drivers/gpu/drm/i915/display/intel_dp.h:236:
+#define for_each_joiner_candidate(__connector, __mode, __num_joined_pipes) \
+	for ((__num_joined_pipes) = 1; (__num_joined_pipes) <= (I915_MAX_PIPES); (__num_joined_pipes)++) \
+		for_each_if(intel_dp_joiner_candidate_valid(__connector, (__mode)->hdisplay, __num_joined_pipes))

-:101: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#101: FILE: drivers/gpu/drm/i915/display/intel_dp.h:237:
+	for ((__num_joined_pipes) = 1; (__num_joined_pipes) <= (I915_MAX_PIPES); (__num_joined_pipes)++) \

-:102: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#102: FILE: drivers/gpu/drm/i915/display/intel_dp.h:238:
+		for_each_if(intel_dp_joiner_candidate_valid(__connector, (__mode)->hdisplay, __num_joined_pipes))

total: 0 errors, 2 warnings, 1 checks, 118 lines checked
1d8a85fb985a drm/i915/display: Add upper limit check for pixel clock
a90b5b376ed0 drm/i915/display: Extend the max dotclock limit to WCL


