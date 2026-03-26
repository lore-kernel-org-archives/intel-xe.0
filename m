Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B123010A1E68
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 11:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D01210E1DE;
	Thu, 26 Mar 2026 11:24:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154CC10E0BA;
 Thu, 26 Mar 2026 11:24:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dsi=3A_Some_DSI_?=
 =?utf-8?q?fixes_and_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Mar 2026 11:24:51 -0000
Message-ID: <177452429106.401012.4826702662433920439@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326111814.9800-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260326111814.9800-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dsi: Some DSI fixes and improvements
URL   : https://patchwork.freedesktop.org/series/163908/
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
commit a871b73dc1b4f821abec8cf76f99e86790a9f5a4
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Mar 26 13:18:14 2026 +0200

    drm/i915/dsi: Place clock into LP during LPM if requested
    
    TGL/ADL DSI can be configured to place the clock lane into
    LP state during LPM, if otherwise configured for continuous
    HS clock.
    
    Hook that up. VBT tells us whether this should be done.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf drm-intel
806cba236ae1 drm/i915/dsi: Don't do DSC horizontal timing adjustments in command mode
-:49: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
0d504eb27e80 drm/i915/dsi: s/eotp_pkt/eot_pkt/
6bdde5b2a24c drm/i915/dsi: Make 'clock_stop' boolean
ee79304e118d drm/i915/dsi: Fill BLLPs with blanking packets if requested
-:68: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#68: FILE: drivers/gpu/drm/i915/display/intel_dsi_vbt.c:721:
+	drm_printf(&p, "Blanking packets during BLLP %s\n", str_enabled_disabled(intel_dsi->blanking_pkt));

total: 0 errors, 1 warnings, 0 checks, 44 lines checked
a871b73dc1b4 drm/i915/dsi: Place clock into LP during LPM if requested
-:66: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_dsi_vbt.c:721:
+	drm_printf(&p, "LP clock during LPM %s\n", str_enabled_disabled(intel_dsi->lp_clock_during_lpm));

total: 0 errors, 1 warnings, 0 checks, 40 lines checked


