Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C54CC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBB01127BA;
	Mon, 15 Apr 2024 19:43:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F2A10E3EA;
 Mon, 15 Apr 2024 19:43:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_display_support_fo?=
 =?utf-8?q?r_Battlemage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 19:43:51 -0000
Message-ID: <171321023159.1423803.3302560583125392030@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415081423.495834-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240415081423.495834-1-balasubramani.vivekanandan@intel.com>
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

Series: Enable display support for Battlemage
URL   : https://patchwork.freedesktop.org/series/132430/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b5ea86147e19910e0b2bd8e95bf2b27258bcf15c
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Mon Apr 15 13:44:23 2024 +0530

    drm/xe/bmg: Enable the display support
    
    Enable the display support for Battlemage
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
+ /mt/dim checkpatch 1bfe3965a846936d93b6e69385e53f1bd1c3b889 drm-intel
14d17879d769 drm/xe/display: Lane reversal requires writes to both context lanes
506a61b4ffdc drm/i915/display: Enable RM timeout detection
2ac2879d7ea8 drm/i915/bmg: Define IS_BATTLEMAGE macro
-:35: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#35: FILE: drivers/gpu/drm/i915/i915_drv.h:545:
+#define IS_LUNARLAKE(i915) (0 && i915)

-:36: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#36: FILE: drivers/gpu/drm/i915/i915_drv.h:546:
+#define IS_BATTLEMAGE(i915)  (0 && i915)

total: 0 errors, 0 warnings, 2 checks, 16 lines checked
adef17830194 drm/i915/xe2hpd: Skip CCS modifiers
-:10: WARNING:TYPO_SPELLING: 'auxillary' may be misspelled - perhaps 'auxiliary'?
#10: 
auxillary surface in the plane, containing the CCS data.  But on
^^^^^^^^^

-:12: WARNING:TYPO_SPELLING: 'auxillary' may be misspelled - perhaps 'auxiliary'?
#12: 
part of the plane. It contains no auxillary surface.
                                  ^^^^^^^^^

-:41: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#41: FILE: drivers/gpu/drm/i915/display/intel_fb.c:435:
+	if (intel_fb_is_ccs_modifier(md->modifier)) {
+

total: 0 errors, 2 warnings, 1 checks, 22 lines checked
f8f4358f049e drm/i915/xe2hpd: Initial cdclk table
c69218a7f004 drm/i915/bmg: Extend DG2 tc check to future
e3948fff940a drm/i915/xe2hpd: Properly disable power in port A
e9b4295e8104 drm/i915/xe2hpd: Add new C20 PHY SRAM address
-:78: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#78: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2201:
+									  PHY_C20_B_MPLLB_CNTX_CFG(i915, i));

-:84: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#84: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2205:
+									  PHY_C20_A_MPLLB_CNTX_CFG(i915, i));

-:94: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#94: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2213:
+									  PHY_C20_B_MPLLA_CNTX_CFG(i915, i));

-:100: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#100: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2217:
+									  PHY_C20_A_MPLLA_CNTX_CFG(i915, i));

total: 0 errors, 4 warnings, 0 checks, 203 lines checked
5664d016efc4 drm/i915/xe2hpd: Add support for eDP PLL configuration
98be3aae9986 drm/i915/xe2hpd: update pll values in sync with Bspec
-:13: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Matt Roper <matthew.d.roper@intel.com'
#13: 
Reviewed-by: Matt Roper <matthew.d.roper@intel.com

total: 1 errors, 0 warnings, 0 checks, 63 lines checked
9151aefab8e2 drm/i915/xe2hpd: Add display info
b5cade99f771 drm/i915/xe2hpd: Configure CHICKEN_MISC_2 before enabling planes
2b801333a2fd drm/i915/xe2hpd: Add max memory bandwidth algorithm
6ea6381ad033 drm/i915/xe2hpd: Do not program MBUS_DBOX BW credits
f00f633a5ed2 drm/i915/bmg: BMG should re-use MTL's south display logic
7f9d538efe70 Revert "drm/i915/dgfx: DGFX uses direct VBT pin mapping"
e01ce30cabb7 drm/i915/xe2hpd: Set maximum DP rate to UHBR13.5
f2c893b21c25 drm/xe/gt_print: add xe_gt_err_once()
96b97cb17100 drm/xe/device: implement transient flush
a82acd5c86e9 drm/i915/display: perform transient flush
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 76 lines checked
b5ea86147e19 drm/xe/bmg: Enable the display support


