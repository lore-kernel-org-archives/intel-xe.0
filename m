Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CF8CAC597
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 21:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BBE10E909;
	Thu, 18 Sep 2025 21:57:11 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796F010E909;
 Thu, 18 Sep 2025 21:57:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Work_aroun?=
 =?utf-8?q?d_a_DSC_pixel_throughput_issue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Sep 2025 21:57:10 -0000
Message-ID: <175823263048.346755.2724792397810971040@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250918211223.209674-1-imre.deak@intel.com>
In-Reply-To: <20250918211223.209674-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Work around a DSC pixel throughput issue
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
commit 8fa8e5f5711e1e6681f59a6cb3f2a42c43bec987
Author: Imre Deak <imre.deak@intel.com>
Date:   Fri Sep 19 00:12:23 2025 +0300

    drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk
    
    Handle the DSC pixel throughput quirk, limiting the compressed link-bpp
    value for Synaptics Panamera branch devices, working around a
    blank/unstable output issue observed on docking stations containing
    these branch devices, when using a mode with a high pixel clock and a
    high compressed link-bpp value.
    
    For now use the same mode clock limit for RGB/YUV444 and YUV422/420
    output modes. This may result in limiting the link-bpp value for a
    YUV422/420 output mode already at a lower than required mode clock.
    
    Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
    Reported-by: Swati Sharma <swati2.sharma@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 3e79699fa1b216e9246e406a8649235e894772d2 drm-intel
3c182ded4953 drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
-:40: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#40: 
Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>

-:41: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#41: 
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>

-:52: WARNING:LONG_LINE_COMMENT: line length of 104 exceeds 100 columns
#52: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2546:
+	/* Synaptics PANAMERA branch devices having a pixel clock dependent DSC compressed bpp limit. */

-:53: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#53: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2547:
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x22), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },

-:54: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#54: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2548:
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x31), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },

-:55: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#55: FILE: drivers/gpu/drm/display/drm_dp_helper.c:2549:
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x33), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },

total: 0 errors, 6 warnings, 0 checks, 20 lines checked
845a8e72f9d5 drm/i915/dp: Calculate DSC slice count based on per-slice peak throughput
ff44afce21a6 drm/i915/dp: Pass DPCD device descriptor to intel_dp_get_dsc_sink_cap()
3f2501ed47a6 drm/i915/dp: Verify branch devices' overall pixel throughput/line width
8fa8e5f5711e drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>

-:17: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#17: 
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>

total: 0 errors, 2 warnings, 0 checks, 88 lines checked


