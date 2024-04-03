Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BDDCD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 11:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CFD112A38;
	Wed,  3 Apr 2024 11:30:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6031C112655;
 Wed,  3 Apr 2024 11:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_dislay_support_for?=
 =?utf-8?q?_Battlemage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Apr 2024 11:30:18 -0000
Message-ID: <171214381839.1171321.2942173307239063043@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240403112253.1432390-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240403112253.1432390-1-balasubramani.vivekanandan@intel.com>
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

Series: Enable dislay support for Battlemage (rev2)
URL   : https://patchwork.freedesktop.org/series/131983/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c35007eb4aea066dd0b84a5b775e00a2f6ee7e3a
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Wed Apr 3 16:52:53 2024 +0530

    drm/xe/bmg: Enable the display support
    
    Enable the display support for Battlemage
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch 23e6199ddb938adf30f3174971cd36160b8f0ade drm-intel
9a5f515d0fec drm/i915/display: Prepare to handle new C20 PLL register address
-:75: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#75: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2207:
+									  PHY_C20_B_MPLLB_CNTX_CFG(pll_reg, i));

-:79: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#79: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2210:
+									  PHY_C20_A_MPLLB_CNTX_CFG(pll_reg, i));

-:87: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#87: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2217:
+									  PHY_C20_B_MPLLA_CNTX_CFG(pll_reg, i));

-:91: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#91: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2220:
+									  PHY_C20_A_MPLLA_CNTX_CFG(pll_reg, i));

total: 0 errors, 4 warnings, 0 checks, 186 lines checked
a28d9e863d9c drm/xe/bmg: Add BMG platform definition
-:57: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#57: FILE: include/drm/xe_pciids.h:211:
+#define XE_BMG_IDS(MACRO__, ...) \
+	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE20B, ## __VA_ARGS__), \
+	MACRO__(0xE20C, ## __VA_ARGS__), \
+	MACRO__(0xE20D, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__)

-:57: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#57: FILE: include/drm/xe_pciids.h:211:
+#define XE_BMG_IDS(MACRO__, ...) \
+	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE20B, ## __VA_ARGS__), \
+	MACRO__(0xE20C, ## __VA_ARGS__), \
+	MACRO__(0xE20D, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 37 lines checked
3fd79fc2f9b8 drm/xe/bmg: Define IS_BATTLEMAGE macro
9b6c7275985d drm/i915/bmg: Define IS_BATTLEMAGE macro
-:34: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#34: FILE: drivers/gpu/drm/i915/i915_drv.h:556:
+#define IS_LUNARLAKE(i915) (0 && i915)

-:35: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#35: FILE: drivers/gpu/drm/i915/i915_drv.h:557:
+#define IS_BATTLEMAGE(i915)  (0 && i915)

total: 0 errors, 0 warnings, 2 checks, 16 lines checked
b98c10368ab3 drm/i915/xe2: Skip CCS modifiers for Xe2 platforms
fe646222363f drm/i915/xe2hpd: Initial cdclk table
b219bfe59553 Revert "drm/i915/dgfx: DGFX uses direct VBT pin mapping"
4af43f08c05a drm/i915/bmg: Extend DG2 tc check to future
9d6141b412e5 drm/i915/xe2hpd: Properly disable power in port A
8b1c778623bf drm/i915/xe2hpd: Add new C20 PLL register address
75c18f0e87b7 drm/i915/xe2hpd: Add support for eDP PLL configuration
dab12f2def86 drm/i915/xe2hpd: update pll values in sync with Bspec
af03dda0fdfa drm/i915/xe2hpd: Add display info
5af2b400ec7f drm/i915/xe2hpd: Add missing chicken bit register programming
b6e0eee3c589 drm/xe/display: Lane reversal requires writes to both context lanes
9f35427d7542 drm/xe/xe2hpd: Define a new DRAM type INTEL_DRAM_GDDR
60d31e9772b7 drm/i915/xe2hpd: Add max memory bandwidth algorithm
fc68d8f61e3d drm/i915/display: Enable RM timeout detection
a143320ad616 drm/i915/xe2hpd: Do not program MBUS_DBOX BW credits
c0f1aaca2f7b drm/i915/bmg: BMG should re-use MTL's south display logic
248ca93363a9 drm/i915/xe2hpd: Set maximum DP rate to UHBR13.5
6db37381b6d6 drm/xe/gt_print: add xe_gt_err_once()
a2c3dfd69eac drm/xe/device: implement transient flush
699d33c2330f drm/i915/display: perform transient flush
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:56: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#56: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 76 lines checked
c35007eb4aea drm/xe/bmg: Enable the display support


