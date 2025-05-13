Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA37C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 09:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82E410E513;
	Tue, 13 May 2025 09:17:51 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A410E513;
 Tue, 13 May 2025 09:17:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/ptl=3A_Use_every?=
 =?utf-8?q?where_the_correct_DDI_port_clock_select_mask?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 09:17:51 -0000
Message-ID: <174712787107.74059.524810064676019955@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512142600.824347-1-imre.deak@intel.com>
In-Reply-To: <20250512142600.824347-1-imre.deak@intel.com>
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

Series: drm/i915/ptl: Use everywhere the correct DDI port clock select mask
URL   : https://patchwork.freedesktop.org/series/148893/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 27945843ea5e7e95ec6116751f3929f974d29bda
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon May 12 17:26:00 2025 +0300

    drm/i915/ptl: Use everywhere the correct DDI port clock select mask
    
    The PTL XELPDP_PORT_CLOCK_CTL register XELPDP_DDI_CLOCK_SELECT field's
    size is 5 bits vs. the earlier platforms where its size is 4 bits. Make
    sure the field is read-out/programmed everywhere correctly, according to
    the above.
    
    Cc: Mika Kahola <mika.kahola@intel.com>
    Cc: stable@vger.kernel.org # v6.13+
    Signed-off-by: Imre Deak <imre.deak@intel.com>
    Tested-by: Mika Kahola <mika.kahola@intel.com>
    Reviewed-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch c9de1544553b1d6112ccc32977b6d56881cedcea drm-intel
27945843ea5e drm/i915/ptl: Use everywhere the correct DDI port clock select mask
-:68: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#68: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:3172:
+					    intel_mtl_tbt_clock_select(display, crtc_state->port_clock));

-:114: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#114: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:198:
+							 _XE3_DDI_CLOCK_SELECT_MASK : _XELPDP_DDI_CLOCK_SELECT_MASK)

-:115: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#115: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:199:
+#define   XELPDP_DDI_CLOCK_SELECT_PREP(display, val)	(DISPLAY_VER(display) >= 30 ? \
+							 REG_FIELD_PREP(_XE3_DDI_CLOCK_SELECT_MASK, (val)) : \
+							 REG_FIELD_PREP(_XELPDP_DDI_CLOCK_SELECT_MASK, (val)))

-:116: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#116: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:200:
+							 REG_FIELD_PREP(_XE3_DDI_CLOCK_SELECT_MASK, (val)) : \

-:117: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#117: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:201:
+							 REG_FIELD_PREP(_XELPDP_DDI_CLOCK_SELECT_MASK, (val)))

-:118: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#118: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:202:
+#define   XELPDP_DDI_CLOCK_SELECT_GET(display, val)	(DISPLAY_VER(display) >= 30 ? \
+							 REG_FIELD_GET(_XE3_DDI_CLOCK_SELECT_MASK, (val)) : \
+							 REG_FIELD_GET(_XELPDP_DDI_CLOCK_SELECT_MASK, (val)))

-:119: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#119: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:203:
+							 REG_FIELD_GET(_XE3_DDI_CLOCK_SELECT_MASK, (val)) : \

-:120: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#120: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:204:
+							 REG_FIELD_GET(_XELPDP_DDI_CLOCK_SELECT_MASK, (val)))

-:124: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 7 warnings, 2 checks, 91 lines checked


