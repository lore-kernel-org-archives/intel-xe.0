Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3951CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 15:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A569110E765;
	Wed, 24 Sep 2025 15:32:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494BE10E765;
 Wed, 24 Sep 2025 15:32:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Work_aroun?=
 =?utf-8?q?d_a_DSC_pixel_throughput_issue_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 15:32:21 -0000
Message-ID: <175872794127.362993.13122384905933862908@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250924152332.359768-1-imre.deak@intel.com>
In-Reply-To: <20250924152332.359768-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Work around a DSC pixel throughput issue (rev4)
URL   : https://patchwork.freedesktop.org/series/154737/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b9bc9d8726a9598e245a93608641b7f917f785e5
Author: Imre Deak <imre.deak@intel.com>
Date:   Wed Sep 24 18:23:32 2025 +0300

    drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk
    
    Handle the DSC pixel throughput quirk, limiting the compressed link-bpp
    value for Synaptics Panamera branch devices, working around a
    blank/unstable output issue observed on docking stations containing
    these branch devices, when using a mode with a high pixel clock and a
    high compressed link-bpp value.
    
    For now use the same mode clock limit for RGB/YUV444 and YUV422/420
    output modes. This may result in limiting the link-bpp value for a
    YUV422/420 output mode already at a lower than required mode clock.
    
    v2: Apply the quirk only when DSC is enabled.
    v3 (Ville):
    - Move adjustment of link-bpp within the already existing is_dsc
      if branch.
    - Add TODO comment to move the HW revision check as well to the
      DRM core quirk table.
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
    Reported-by: Swati Sharma <swati2.sharma@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch a4d9163251f4832a7d34d4b59449f9a68b9b7adf drm-intel
84a674941f7e drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
-:46: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#46: 
Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>

-:47: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#47: 
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>

-:58: WARNING:LONG_LINE_COMMENT: line length of 111 exceeds 100 columns
#58: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2554:
+	/* Synaptics Panamera supports only a compressed bpp of 12 above 50% of its max DSC pixel throughput */

-:59: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#59: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2555:
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x22), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },

-:60: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#60: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2556:
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x31), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },

-:61: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#61: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2557:
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x33), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },

total: 0 errors, 6 warnings, 0 checks, 25 lines checked
e468a9579343 drm/dp: Add helpers to query the branch DSC max throughput/line-width
b0fffd341356 drm/i915/dp: Calculate DSC slice count based on per-slice peak throughput
2eae1112f793 drm/i915/dp: Pass DPCD device descriptor to intel_dp_get_dsc_sink_cap()
741e6bccbb76 drm/i915/dp: Verify branch devices' overall pixel throughput/line width
b9bc9d8726a9 drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk
-:27: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#27: 
Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>

-:28: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#28: 
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>

-:108: WARNING:LONG_LINE: line length of 140 exceeds 100 columns
#108: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2571:
+				    "[CRTC:%d:%s][CONNECTOR:%d:%s] Decreasing link max bpp to " FXP_Q4_FMT " due to DSC throughput quirk\n",

total: 0 errors, 3 warnings, 0 checks, 94 lines checked


