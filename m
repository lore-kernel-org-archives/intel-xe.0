Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C1BC10F16
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 20:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5C511225D;
	Tue, 30 Apr 2024 20:40:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951D0112F36;
 Tue, 30 Apr 2024 20:40:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_display_support_fo?=
 =?utf-8?q?r_Battlemage_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Apr 2024 20:40:52 -0000
Message-ID: <171450965261.1793171.7833802330262301165@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430172850.1881525-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20240430172850.1881525-1-radhakrishna.sripada@intel.com>
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

Series: Enable display support for Battlemage (rev3)
URL   : https://patchwork.freedesktop.org/series/132430/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5c936dc6bc121e88289fb4b83134c96e4f635f13
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Tue Apr 30 10:28:50 2024 -0700

    drm/xe/bmg: Enable the display support
    
    Enable the display support for Battlemage
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
    Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009 drm-intel
6abbe0a9fcf1 drm/i915/bmg: Lane reversal requires writes to both context lanes
2c24a8543f83 drm/i915/bmg: Define IS_BATTLEMAGE macro
-:36: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#36: FILE: drivers/gpu/drm/i915/i915_drv.h:545:
+#define IS_LUNARLAKE(i915) (0 && i915)

-:37: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#37: FILE: drivers/gpu/drm/i915/i915_drv.h:546:
+#define IS_BATTLEMAGE(i915)  (0 && i915)

total: 0 errors, 0 warnings, 2 checks, 16 lines checked
c61b191e2786 drm/i915/xe2hpd: Initial cdclk table
db5f02a221f8 drm/i915/bmg: Extend DG2 tc check to future
f792857ea314 drm/i915/xe2hpd: Properly disable power in port A
fca27a9d1e92 drm/i915/xe2hpd: Add new C20 PHY SRAM address
-:80: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#80: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2201:
+									  PHY_C20_B_MPLLB_CNTX_CFG(i915, i));

-:86: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#86: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2205:
+									  PHY_C20_A_MPLLB_CNTX_CFG(i915, i));

-:96: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#96: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2213:
+									  PHY_C20_B_MPLLA_CNTX_CFG(i915, i));

-:102: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#102: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2217:
+									  PHY_C20_A_MPLLA_CNTX_CFG(i915, i));

-:195: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#195: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:279:
+		((_IS_XE2HPD_C20(i915) ? _XE2HPD_C20_A_TX_CNTX_CFG : _MTL_C20_A_TX_CNTX_CFG) - (idx))

-:197: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#197: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:281:
+		((_IS_XE2HPD_C20(i915) ? _XE2HPD_C20_B_TX_CNTX_CFG : _MTL_C20_B_TX_CNTX_CFG) - (idx))

-:205: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#205: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:285:
+		((_IS_XE2HPD_C20(i915) ? _XE2HPD_C20_A_CMN_CNTX_CFG : _MTL_C20_A_CMN_CNTX_CFG) - (idx))

-:207: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#207: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h:287:
+		((_IS_XE2HPD_C20(i915) ? _XE2HPD_C20_B_CMN_CNTX_CFG : _MTL_C20_B_CMN_CNTX_CFG) - (idx))

total: 0 errors, 8 warnings, 0 checks, 186 lines checked
d60f577fc01e drm/i915/xe2hpd: Add support for eDP PLL configuration
7e6e1180405a drm/i915/xe2hpd: update pll values in sync with Bspec
e85f697814dd drm/i915/xe2hpd: Add display info
e3c777951ca2 drm/i915/xe2hpd: Configure CHICKEN_MISC_2 before enabling planes
5b9e0258b22e drm/i915/xe2hpd: Add max memory bandwidth algorithm
1135818ee61c drm/i915/xe2hpd: Do not program MBUS_DBOX BW credits
18f0ad579761 drm/i915/bmg: BMG should re-use MTL's south display logic
7b40a9d28317 Revert "drm/i915/dgfx: DGFX uses direct VBT pin mapping"
a0a2397be80f drm/i915/xe2hpd: Set maximum DP rate to UHBR13.5
3007ea9a2f5f drm/xe/gt_print: add xe_gt_err_once()
6955e6038725 drm/xe/device: implement transient flush
b44de31ee1e5 drm/i915/display: perform transient flush
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:59: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#59: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 76 lines checked
5c936dc6bc12 drm/xe/bmg: Enable the display support


