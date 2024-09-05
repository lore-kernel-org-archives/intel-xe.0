Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C79CD5BAE
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 11:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF4910E87D;
	Thu,  5 Sep 2024 11:59:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679F610E87C;
 Thu,  5 Sep 2024 11:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Implement_Wa=5F1402176879?=
 =?utf-8?q?2_to_bypass_m=5Fn_ratio_limit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Sep 2024 11:59:42 -0000
Message-ID: <172553758240.950487.11150874079399693507@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905115505.3629087-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240905115505.3629087-1-ankit.k.nautiyal@intel.com>
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

Series: Implement Wa_14021768792 to bypass m_n ratio limit
URL   : https://patchwork.freedesktop.org/series/138256/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 39d56a8b9faffe448c824010db1051bc2256724b
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Sep 5 17:25:05 2024 +0530

    drm/i915: Add Wa_14021768792 as per WA framework
    
    Modify the condition for WA as per Xe WA framework.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch b9fe1879bf216a835796a599fbc717992ba16e04 drm-intel
ab7e8621924c drm/i915/display: Add bits for link_n_exended for DISPLAY >= 14
b9ec1dfeac6d drm/i915/display: Limit m/n ratio to 10 for display > 12
812678c406bf drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
-:158: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#158: FILE: drivers/gpu/drm/i915/display/intel_display.c:5251:
+				     "found tu %i, data %i/%i link %i/%i link_n_ext %i bypass_m_n_ratio_limit %s)", \

total: 0 errors, 1 warnings, 0 checks, 169 lines checked
3fba6c358076 drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n ratio > 10
39d56a8b9faf drm/i915: Add Wa_14021768792 as per WA framework
-:40: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/display/intel_display_wa.h:17:
+static inline bool intel_display_needs_wa_14021768792(struct drm_i915_private *i915) { return false; }

total: 0 errors, 1 warnings, 0 checks, 38 lines checked


