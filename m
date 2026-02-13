Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C9AEE36A0
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6480310E7BD;
	Fri, 13 Feb 2026 09:45:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C834710E7AD;
 Fri, 13 Feb 2026 09:45:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixes_and_updates_when_us?=
 =?utf-8?q?ing_AUX_backlight_using_Luminance?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Feb 2026 09:45:35 -0000
Message-ID: <177097593579.252083.17967159664230532700@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260213091653.2250887-1-suraj.kandpal@intel.com>
In-Reply-To: <20260213091653.2250887-1-suraj.kandpal@intel.com>
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

Series: Fixes and updates when using AUX backlight using Luminance
URL   : https://patchwork.freedesktop.org/series/161579/
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
commit 6d68957cc62c5e919455c8709eb77934373058a2
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Feb 13 14:46:53 2026 +0530

    drm/i915/backlight: Avoid 0 brightness for INTEL AUX HDR backlight
    
    Whenever the minimum brightness is reported as 0 there are chances
    we maybe sometimes end up with blank screen. This confuses the user
    into thinking the display is acting weird. This occurs in eDP 1.4b
    when we use proprietary INTEL AUX HDR DPCD registers to mainupate
    brightness via luminance values. Make sure if minimum luminance
    range is 0 we program it to 10% of max luminance range.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch cd76e45b9a192aa3d4f7a2efb8ee46767f098e07 drm-intel
89c1c1e8960c drm/i915/backlight: Avoid 0 brightness for VESA AUX backlight
c306cb4e4071 drm/i915/backlight: Use intel_panel variable instead of intel_connector
f0d31f3b9f28 drm/i915/backlight: Take luminance_set into account for VESA backlight
e25babab50b0 drm/i915/backlight: Check luminance_set when disabling PWM via AUX VESA backlight
-:23: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#23: FILE: drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c:518:
+	if (!(panel->backlight.edp.vesa.info.aux_enable || panel->backlight.edp.vesa.info.luminance_set))

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
666d699f8c1f drm/i915/backlight: Short circuit intel_dp_aux_supports_hdr_backlight
a9f99255df29 drm/i915/backlight: Update debug log during backlight setup
7cb2a8208d5f drm/i915/backlight: Provide clear description on how backlight level is controlled
6d68957cc62c drm/i915/backlight: Avoid 0 brightness for INTEL AUX HDR backlight


