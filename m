Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06F4D2E018
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 06:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4C310E75C;
	Wed, 23 Oct 2024 06:57:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A6110E75C;
 Wed, 23 Oct 2024 06:57:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_3_VDSC_en?=
 =?utf-8?q?gines_12_slices_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Oct 2024 06:57:03 -0000
Message-ID: <172966662388.1322263.14353666794128318767@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023065257.190035-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241023065257.190035-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for 3 VDSC engines 12 slices (rev5)
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
commit 65ba691fc0eb0e4409f0ad7a8a97229842a0ea82
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Wed Oct 23 12:22:57 2024 +0530

    drm/i915/dp: Add Check for Odd Pixel Requirement
    
    Check if Odd pixel is required during DSC compute config and update
    the crtc_state to track the presence of odd pixels.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 8a7ac0227c7c3fe2fcb01a933df5b9c49c7f2832 drm-intel
69f0ef4c80fc drm/i915/dp: Update Comment for Valid DSC Slices per Line
2998cf218182 drm/i915/display: Prepare for dsc 3 stream splitter
85fcc2a8439e drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
7894b80f09c6 drm/i915/vdsc: Introduce 3rd VDSC engine VDSC2
a48cfcbb4f46 drm/i915/vdsc: Add support for read/write PPS for 3rd DSC engine
9aa1cadfda4f drm/i915/dp: Ensure hactive is divisible by slice count
c944e40bbc19 drm/i915/dp: Enable 3 DSC engines for 12 slices
575734439a96 drm/i915/display: Add macro HAS_PIXEL_REPLICATION
-:19: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#19: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:152:
+#define HAS_PIXEL_REPLICATION(i915)	(HAS_DSC(i915) && \
+					 (DISPLAY_VER(i915) >= 20 || \
+					  DISPLAY_VER_FULL(i915) == IP_VER(14, 1)))

total: 0 errors, 0 warnings, 1 checks, 9 lines checked
af6820eb083f drm/i915/display: Add support for DSC pixel replication
-:141: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#141: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:59:
+#define  DSC_PIXEL_REPLICATION(count)		(REG_FIELD_PREP(DSC_PIXEL_REPLICATION_MASK, (count)))

total: 0 errors, 1 warnings, 0 checks, 101 lines checked
404336075db4 drm/i915/dp_mst: Account for pixel replication for MST overhead with DSC
4c42643ed42f drm/i915/dp: Account for pixel replication for BW computation with DSC
4606aca1c370 drm/i915/display: Account for pixel replication in pipe_src
3edef40312bd drm/i915/dp: Enable DSC pixel replication
80dcc7dfee38 drm/i915/dsc: Introduce odd pixel removal
19ae19394706 drm/i915/display: Adjust Pipe SRC Width for Odd Pixels
65ba691fc0eb drm/i915/dp: Add Check for Odd Pixel Requirement


