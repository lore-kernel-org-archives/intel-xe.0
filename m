Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F903D15D88
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 12:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234A510E4CD;
	Mon, 21 Oct 2024 12:38:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1482210E4CD;
 Mon, 21 Oct 2024 12:38:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_3_VDSC_en?=
 =?utf-8?q?gines_12_slices_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 12:38:00 -0000
Message-ID: <172951428008.1304905.16046847524930583921@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021123414.3993899-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241021123414.3993899-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for 3 VDSC engines 12 slices (rev4)
URL   : https://patchwork.freedesktop.org/series/139933/
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
commit a8306708119fab999bfeb5d23594576ea16a39d2
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Oct 21 18:04:14 2024 +0530

    drm/i915/dp: Add Check for Odd Pixel Requirement
    
    Check if Odd pixel is required during DSC compute config and update
    the crtc_state to track the presence of odd pixels.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 784111a40e40a37100e61736dd137c72cedbdb39 drm-intel
69726585436d drm/i915/dp: Update Comment for Valid DSC Slices per Line
424efc5fb6c1 drm/i915/display: Prepare for dsc 3 stream splitter
e9de737af16c drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
dee711386760 drm/i915/vdsc: Introduce 3rd VDSC engine VDSC2
59d8e0bd71c5 drm/i915/vdsc: Add support for read/write PPS for 3rd DSC engine
7255bbf3b09d drm/i915/dp: Ensure hactive is divisible by slice count
0daa7cdeefee drm/i915/dp: Enable 3 DSC engines for 12 slices
213874bf521b drm/i915/display: Add macro HAS_PIXEL_REPLICATION
-:19: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#19: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:152:
+#define HAS_PIXEL_REPLICATION(i915)	(HAS_DSC(i915) && \
+					 (DISPLAY_VER(i915) >= 20 || \
+					  DISPLAY_VER_FULL(i915) == IP_VER(14, 1)))

total: 0 errors, 0 warnings, 1 checks, 9 lines checked
6ddfb2c5703a drm/i915/display: Add support for DSC pixel replication
-:139: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#139: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:59:
+#define  DSC_PIXEL_REPLICATION(count)		(REG_FIELD_PREP(DSC_PIXEL_REPLICATION_MASK, (count)))

total: 0 errors, 1 warnings, 0 checks, 99 lines checked
707448556021 drm/i915/dp_mst: Account for pixel replication for MST overhead with DSC
ccd8c3edaf7d drm/i915/dp: Account for pixel replication for BW computation with DSC
0e3fb8eed1fd drm/i915/display: Account for pixel replication in pipe_src
dcf3bd03e240 drm/i915/dp: Enable DSC pixel replication
8b8afaf85c5c drm/i915/dsc: Introduce odd pixel removal
4b94093ce977 drm/i915/display: Adjust Pipe SRC Width for Odd Pixels
a8306708119f drm/i915/dp: Add Check for Odd Pixel Requirement


