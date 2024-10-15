Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD53D20686
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 23:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5990710E134;
	Tue, 15 Oct 2024 23:18:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1203510E134;
 Tue, 15 Oct 2024 23:18:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_xe3lpd_edp_enabling_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Oct 2024 23:18:10 -0000
Message-ID: <172903429006.1270963.18419016957690180822@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241015231124.23982-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241015231124.23982-1-matthew.s.atwood@intel.com>
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

Series: Add xe3lpd edp enabling (rev3)
URL   : https://patchwork.freedesktop.org/series/139732/
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
commit 9808249e02c7c4f2b29ea68b4b79c19b48137998
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Oct 15 16:11:24 2024 -0700

    drm/i915/xe3lpd: Add condition for EDP to powerdown P2.PG
    
    Add condition for P2.PG power down value.
    
    v2: change subject line to better match patch condition
    
    Bspec: 74494
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch 01c7b2c084e5c84313f382734c10945b9aa49823 drm-intel
4b8ce1c46e5f drm/i915/xe3lpd: Update pmdemand programming
2d578fa20cce drm/i915/xe3lpd: Add cdclk changes
-:15: WARNING:TYPO_SPELLING: 'doesnt' may be misspelled - perhaps 'doesn't'?
#15: 
v3: xe3lpd doesnt supply the power control unit the voltage index
           ^^^^^^

total: 0 errors, 1 warnings, 0 checks, 89 lines checked
85a1241e4d16 drm/i915/xe3lpd: Include hblank restriction for xe3lpd
-:23: ERROR:SPACING: spaces required around that '>=' (ctx:WxV)
#23: FILE: drivers/gpu/drm/i915/display/intel_hdcp.c:54:
+		else if (DISPLAY_VER(display) >=30)
 		                              ^

total: 1 errors, 0 warnings, 0 checks, 17 lines checked
d18efaa76272 drm/i915/xe3lpd: Add C20 Phy consolidated programming table
b2c202b2f3af drm/i915/xe3lpd: Add new bit range of MAX swing setup
-:9: WARNING:TYPO_SPELLING: 'seperate' may be misspelled - perhaps 'separate'?
#9: 
v2: implement as two seperate macros instead of a single macro
                     ^^^^^^^^

-:32: CHECK:LINE_SPACING: Please don't use multiple blank lines
#32: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:334:
 
+

-:65: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:299:
+#define PORT_ALPM_CTL(port)				_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)

-:69: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#69: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:303:
+#define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(val)		REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val)

-:70: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#70: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:304:
+#define  XE3_PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(val)	REG_FIELD_PREP(XE3_PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val)

-:72: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#72: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:306:
+#define  PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(val)		REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_HOLD_MASK, val)

-:74: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#74: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:308:
+#define  PORT_ALPM_CTL_SILENCE_PERIOD(val)		REG_FIELD_PREP(PORT_ALPM_CTL_SILENCE_PERIOD_MASK, val)

total: 0 errors, 6 warnings, 1 checks, 52 lines checked
05d4e675a0da drm/i915/xe3lpd: Add check to see if edp over type c is allowed
9808249e02c7 drm/i915/xe3lpd: Add condition for EDP to powerdown P2.PG


