Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A59FC0218B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 06:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67ABE10E8DD;
	Fri, 24 Jan 2025 06:43:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD8E10E8DD;
 Fri, 24 Jan 2025 06:43:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_Aux_based_Nits_bri?=
 =?utf-8?q?ghtness_control_for_eDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 06:43:13 -0000
Message-ID: <173770099325.3899037.9508334567453269644@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
In-Reply-To: <20250124054631.1796456-1-suraj.kandpal@intel.com>
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

Series: Enable Aux based Nits brightness control for eDP
URL   : https://patchwork.freedesktop.org/series/143910/
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
commit 9afbe28767d081b0e0671ab18c16c482b6558cd5
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Jan 24 11:16:31 2025 +0530

    drm/i915/backlight: Enable Nits based brightness
    
    Enable Nits based brightness by writing the PANEL_LUMINANCE_CONTROL
    bit and set the correct register to change brightness.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch e242335af00fca4900f579d00dc7c1ab658c7fe1 drm-intel
8549ba2ed516 drm/dp: Add eDP 1.5 bit definition
f74a9ee00acc drm/i915/backlight: Use proper interface based on eDP version
24493d2c5bff drm/i915/backlight: Check Nits based brightness control for VESA
-:8: WARNING:TYPO_SPELLING: 'dependant' may be misspelled - perhaps 'dependent'?
#8: 
is dependant on PANEL_LUMINANCE_OVERRIDE and SMOOTH_BRIGHTNESS
   ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
b8fa80568e3c drm/i915/backlight: Modify function to get VESA brightness in NITS
-:28: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#28: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:462:
+		ret = drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
+				     sizeof(buf));

total: 0 errors, 0 warnings, 1 checks, 26 lines checked
65a2dab38171 drm/i915/backlight: Add function to change brightness in NITS for VESA
-:34: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:490:
+	ret = drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf, sizeof(buf));

total: 0 errors, 1 warnings, 0 checks, 41 lines checked
30d9a8854c83 drm/i915/backlight: Setup NITS based brightness via VESA
-:94: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#94: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:599:
+		if (!panel->backlight.edp.vesa.info.aux_set || !panel->backlight.edp.vesa.info.aux_enable) {

-:120: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#120: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:623:
+				panel->backlight.level = panel->backlight.pwm_funcs->get(connector, pipe);

total: 0 errors, 2 warnings, 0 checks, 113 lines checked
9afbe28767d0 drm/i915/backlight: Enable Nits based brightness


