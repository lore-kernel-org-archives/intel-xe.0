Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87469E73165
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 19:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4265A10E1C9;
	Mon,  2 Feb 2026 19:40:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935F610E1C9;
 Mon,  2 Feb 2026 19:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Account_for_DSC_bubble_ov?=
 =?utf-8?q?erhead_for_horizontal_slices_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Feb 2026 19:40:05 -0000
Message-ID: <177006120558.217225.9696289124644556489@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202103731.357416-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260202103731.357416-1-ankit.k.nautiyal@intel.com>
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

Series: Account for DSC bubble overhead for horizontal slices (rev7)
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
commit b3a077a6a874c1354ea8becae7a11f5e71a994d0
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon Feb 2 16:07:31 2026 +0530

    drm/i915/display: Extend the max dotclock limit to WCL
    
    Add upper limit check for pixel clock for WCL.
    
    For prior platforms though the bspec mentions the dotclock limits, however
    these are intentionally not enforced to avoid regressions, unless real
    issues are observed.
    
    BSpec: 49199, 68912
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch a68485eec77211a46da7bdb6a0f862e4b365f1e3 drm-intel
ba9d6bfe0b74 drm/i915/dp: Early reject bad hdisplay in intel_dp_mode_valid
4c1dc4683bbd drm/i915/dp: Move num_joined_pipes and related checks together
057ae27714ff drm/i915/dp: Extract helper to get the hdisplay limit
37371497ee1d drm/i915/dp: Rework pipe joiner logic in mode_valid
60066a8d8da5 drm/i915/dp: Rework pipe joiner logic in compute_config
7a234e3e9164 drm/i915/dp_mst: Move the check for dotclock at the end
f4aa727a02dd drm/i915/dp_mst: Move the joiner dependent code together
e358d0f3b587 drm/i915/dp_mst: Rework pipe joiner logic in mode_valid
7ddc0d6394b5 drm/i915/dp_mst: Extract helper to compute link for given joiner config
e6122823f72d drm/i915/dp_mst: Rework pipe joiner logic in compute_config
42fcce18d6ec drm/i915/dp: Remove unused joiner helpers
5e0f5937d13a drm/i915/dp: Introduce helper to check pixel rate against dotclock limits
3aca24ab7f56 drm/i915/dp: Refactor dsc_slice_count handling in intel_dp_mode_valid()
1ab1cfd5c261 drm/i915/dp: Account for DSC slice overhead
e40a0bd1236c drm/i915/dp: Add helpers for joiner candidate loops
-:101: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__num_joined_pipes' - possible side-effects?
#101: FILE: drivers/gpu/drm/i915/display/intel_dp.h:236:
+#define for_each_joiner_candidate(__connector, __mode, __num_joined_pipes) \
+	for ((__num_joined_pipes) = 1; (__num_joined_pipes) <= (I915_MAX_PIPES); (__num_joined_pipes)++) \
+		for_each_if(intel_dp_joiner_candidate_valid(__connector, (__mode)->hdisplay, __num_joined_pipes))

-:102: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#102: FILE: drivers/gpu/drm/i915/display/intel_dp.h:237:
+	for ((__num_joined_pipes) = 1; (__num_joined_pipes) <= (I915_MAX_PIPES); (__num_joined_pipes)++) \

-:103: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#103: FILE: drivers/gpu/drm/i915/display/intel_dp.h:238:
+		for_each_if(intel_dp_joiner_candidate_valid(__connector, (__mode)->hdisplay, __num_joined_pipes))

total: 0 errors, 2 warnings, 1 checks, 118 lines checked
9c69b863196e drm/i915/display: Add upper limit check for pixel clock
b3a077a6a874 drm/i915/display: Extend the max dotclock limit to WCL


