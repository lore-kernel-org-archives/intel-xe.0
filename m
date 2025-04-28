Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C794FC369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 13:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C37C10E1B6;
	Mon, 28 Apr 2025 13:59:32 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCF110E1B6;
 Mon, 28 Apr 2025 13:59:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=5Fmst=3A_Add_?=
 =?utf-8?q?support_for_fractional_link_bpps_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 13:59:31 -0000
Message-ID: <174584877143.20458.7580727306352415092@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428133135.3396080-1-imre.deak@intel.com>
In-Reply-To: <20250428133135.3396080-1-imre.deak@intel.com>
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

Series: drm/i915/dp_mst: Add support for fractional link bpps (rev2)
URL   : https://patchwork.freedesktop.org/series/147434/
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
commit bfe03115469b1d9b0077b3ca572f44b49318ff3c
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Apr 28 16:31:23 2025 +0300

    drm/i915/dp_mst: Enable fractional link bpps on MST if the bpp is forced
    
    Enable using a fractional (compressed) link bpp on MST links, if this is
    supported and the link bpp is forced. Fractional link bpps will be
    enabled by default as a follow-up change after testing this
    functionality within a set of commonly used MST monitors and docks/hubs
    which support it.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 4dfede9f7f69716060d29d84a1267f893da9dbee drm-intel
b3c2c17a4450 drm/i915/dp_mst: Use the correct connector while computing the link BPP limit on MST
9ff8557aebd0 drm/i915/dp_mst: Simplify handling the single-bpp case during state computation
e76b553771f8 drm/i915/dp_mst: Validate compressed bpp vs. platform restrictions
e4be999381e0 drm/i915/dp_mst: Update the total link slot count early
859090db1ea3 drm/i915/dp_mst: Check BW limit on the local MST link early
c01c2a065c14 drm/i915/dp_mst: Simplify computing the min/max compressed bpp limits
25e370523a36 drm/i915/dp: Limit max link bpp properly to a fractional value on SST
277bc563f300 drm/i915/dp_mst: Add support for fractional compressed link bpps on MST
-:87: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#87: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:521:
+		    "DSC Sink supported compressed min bpp " FXP_Q4_FMT " compressed max bpp " FXP_Q4_FMT "\n",

-:94: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#94: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:526:
+	max_compressed_bpp_x16 = min(max_compressed_bpp_x16, fxp_q4_from_int(crtc_state->pipe_bpp) - bpp_step_x16);

total: 0 errors, 2 warnings, 0 checks, 76 lines checked
24996d0c9f11 drm/i915/display: Factor out intel_display_{min, max}_pipe_bpp()
-:29: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#29: FILE: drivers/gpu/drm/i915/display/intel_display.c:4313:
+		return 10*3;
 		         ^

-:31: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#31: FILE: drivers/gpu/drm/i915/display/intel_display.c:4315:
+		return 12*3;
 		         ^

-:33: CHECK:SPACING: spaces preferred around that '*' (ctx:VxV)
#33: FILE: drivers/gpu/drm/i915/display/intel_display.c:4317:
+		return 8*3;
 		        ^

total: 0 errors, 0 warnings, 3 checks, 58 lines checked
89a27fc3f727 drm/i915/dp: Export intel_dp_dsc_min_src_compressed_bpp()
526ea0272683 drm/i915: Add support for forcing the link bpp on a connector
-:52: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#52: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:175:
+#define HAS_FDI(__display)		(IS_DISPLAY_VER((__display), 5, 8) && !HAS_GMCH(__display))

total: 0 errors, 0 warnings, 1 checks, 341 lines checked
bfe03115469b drm/i915/dp_mst: Enable fractional link bpps on MST if the bpp is forced


