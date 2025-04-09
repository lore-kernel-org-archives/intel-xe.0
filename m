Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79282C36010
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 01:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C28310E7BC;
	Wed,  9 Apr 2025 01:51:22 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4650E10E15E;
 Wed,  9 Apr 2025 01:51:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=5Fmst=3A_Add_?=
 =?utf-8?q?support_for_fractional_link_bpps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 01:51:21 -0000
Message-ID: <174416348128.50469.9296248986717369184@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408214342.1953197-1-imre.deak@intel.com>
In-Reply-To: <20250408214342.1953197-1-imre.deak@intel.com>
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

Series: drm/i915/dp_mst: Add support for fractional link bpps
URL   : https://patchwork.freedesktop.org/series/147434/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 873a058d9867729b38e717f34df420ca7e5d0fd5
Author: Imre Deak <imre.deak@intel.com>
Date:   Wed Apr 9 00:43:40 2025 +0300

    drm/i915: Add force link bpp debugfs entry to connectors
    
    Add the debugfs entry to force a link bpp to all relevant connectors:
    all DP connectors and on an FDI link CRT/SDVO/LVDS/HDMI connectors.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch a49a4787e6bc70296204f4a6e1b0fed3759938cd drm-intel
d438a986e9d8 drm/i915/dp: Use the correct connector while computing the link BPP limit on MST
bf72c399f600 drm/i915/dp: Limit max link bpp properly to a fractional value on SST
c63bf6cb6bdf drm/i915/dp_mst: Add support for fractional link bpps on MST
-:148: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#148: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:485:
+		    "DSC Sink supported compressed min bpp " FXP_Q4_FMT " compressed max bpp " FXP_Q4_FMT "\n",

-:158: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#158: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:493:
+									     limits->link.min_bpp_x16,

-:161: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#161: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:496:
+									     limits->link.max_bpp_x16,

total: 0 errors, 3 warnings, 0 checks, 132 lines checked
5f05a67da6ec drm/i915/dp_mst: Enable fractional link bpps on MST
dd84cce78bb3 drm/i915/display: Factor out intel_display_{min, max}_pipe_bpp()
-:29: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#29: FILE: drivers/gpu/drm/i915/display/intel_display.c:4329:
+		return 10*3;
 		         ^

-:31: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#31: FILE: drivers/gpu/drm/i915/display/intel_display.c:4331:
+		return 12*3;
 		         ^

-:33: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#33: FILE: drivers/gpu/drm/i915/display/intel_display.c:4333:
+		return 8*3;
 		        ^

total: 0 errors, 0 warnings, 3 checks, 58 lines checked
07ed21df827e drm/i915/dp: Export intel_dp_dsc_min_src_compressed_bpp()
d164290f8243 drm/i915/dp: Use an intel_connector pointer everywhere
d061f74d388e drm/i915/hdmi: Use an intel_connector pointer everywhere
a0b863a04a7a drm/i915: Add support for forcing the link bpp on a connector
873a058d9867 drm/i915: Add force link bpp debugfs entry to connectors
-:70: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#70: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:174:
+#define HAS_FDI(__display)		(IS_DISPLAY_VER((__display), 5, 8) && !HAS_GMCH(__display))

total: 0 errors, 0 warnings, 1 checks, 191 lines checked


