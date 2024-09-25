Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5190CCFA02
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 22:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9372E10E1BD;
	Wed, 25 Sep 2024 22:14:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA66310E00F;
 Wed, 25 Sep 2024 22:13:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ultrajoiner_basic_functio?=
 =?utf-8?q?nality_series_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 22:13:59 -0000
Message-ID: <172730243995.1103192.6873104114542978693@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923181336.3303940-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240923181336.3303940-1-ankit.k.nautiyal@intel.com>
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

Series: Ultrajoiner basic functionality series (rev3)
URL   : https://patchwork.freedesktop.org/series/138827/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dbbd2551522b01499500006cf1578286f5d80058
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Sep 23 23:43:36 2024 +0530

    drm/i915/intel_dp: Add support for forcing ultrajoiner
    
    Allow forcing ultrajoiner through debugfs.
    
    v2: Minor refactoring of switch case logic. (Ville)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 88d592f72f7bc508d6a027b1f96aa2e53f803e1b drm-intel
6dfe0f77552c drm/i915/display_device: Add Check HAS_DSC for bigjoiner
-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:121:
+#define HAS_BIGJOINER(i915)		(DISPLAY_VER(i915) >= 11 && HAS_DSC(i915))

total: 0 errors, 0 warnings, 1 checks, 8 lines checked
76d9f939063e drm/i915/display_debugfs: Allow force joiner only if supported
f04f32d53edf drm/i915/display: Modify debugfs for joiner to force n pipes
c4158e370196 drm/i915/dp: Add helper to compute num pipes required
-:101: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#101: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2520:
+	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, connector,
+						      adjusted_mode->crtc_hdisplay,

-:120: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#120: FILE: drivers/gpu/drm/i915/display/intel_dp.h:155:
+int intel_dp_num_joined_pipes(struct intel_dp *intel_dp,
+			       struct intel_connector *connector,

-:140: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#140: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:585:
+	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, connector,
+						      adjusted_mode->crtc_hdisplay,

-:168: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#168: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:1475:
+	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, intel_connector,
+						      mode->hdisplay, target_clock);

total: 0 errors, 0 warnings, 4 checks, 129 lines checked
c45a9722ceb7 drm/i915/display: Add debugfs support to avoid joiner
4f8f8330cae9 drm/i915: Split current joiner hw state readout
b60b17275207 drm/i915: Add bigjoiner and uncompressed joiner hw readout sanity checks
9d72fb4d6a85 drm/i915/display: Add macro HAS_ULTRAJOINER()
-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#26: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:157:
+#define HAS_ULTRAJOINER(i915)		((DISPLAY_VER(i915) >= 20 || \
+					  (IS_DGFX(i915) && DISPLAY_VER(i915) == 14)) && \
+					 HAS_DSC(i915))

total: 0 errors, 0 warnings, 1 checks, 9 lines checked
5b1897a8aa54 drm/i915: Implement hw state readout and checks for ultrajoiner
7b49f6e4a5c8 drm/i915/display: Refactor enable_joiner_pipes
-:80: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#80: FILE: drivers/gpu/drm/i915/display/intel_display.c:3798:
+			expected_uncompressed_joiner_secondary_pipes(primary_uncompressed_joiner_pipes);

total: 0 errors, 1 warnings, 0 checks, 120 lines checked
e24d993eaa19 drm/i915/display/vdsc: Add ultrajoiner support with DSC
e2d5f5b7f0c5 drm/i915/dp: Modify compressed bpp limitations for ultrajoiner
2f8056f9c0f3 drm/i915/dp: Modify helper to get slice count for ultrajoiner
1bd121b755b9 drm/i915: Compute config and mode valid changes for ultrajoiner
03125bc4623a drm/i915/display: Consider ultrajoiner for computing maxdotclock
dbbd2551522b drm/i915/intel_dp: Add support for forcing ultrajoiner


