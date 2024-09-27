Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AFCCEBF85
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 08:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05A810EC82;
	Fri, 27 Sep 2024 08:43:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329F110E1B1;
 Fri, 27 Sep 2024 08:43:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ultrajoiner_basic_functio?=
 =?utf-8?q?nality_series_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 08:43:57 -0000
Message-ID: <172742663720.1110149.15450752877385962187@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927083831.3913645-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240927083831.3913645-1-ankit.k.nautiyal@intel.com>
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

Series: Ultrajoiner basic functionality series (rev5)
URL   : https://patchwork.freedesktop.org/series/138827/
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
commit e6b996cf3dd02022efcc45663defbbab9e542b94
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Sep 27 14:08:31 2024 +0530

    drm/i915/intel_dp: Add support for forcing ultrajoiner
    
    Allow forcing ultrajoiner through debugfs.
    
    v2: Minor refactoring of switch case logic. (Ville)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch c114fec0af7e702962ba625f659e4647a9887194 drm-intel
a3b0a92100cc drm/i915/display_device: Add Check HAS_DSC for bigjoiner
-:27: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#27: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:121:
+#define HAS_BIGJOINER(i915)		(DISPLAY_VER(i915) >= 11 && HAS_DSC(i915))

total: 0 errors, 0 warnings, 1 checks, 8 lines checked
f2ac68026059 drm/i915/display_debugfs: Allow force joiner only if supported
8f2d0098df42 drm/i915/display: Modify debugfs for joiner to force n pipes
b50657079472 drm/i915/dp: Add helper to compute num pipes required
0305b4ca3f1c drm/i915: Split current joiner hw state readout
ebd9d1f2abf3 drm/i915: Add bigjoiner and uncompressed joiner hw readout sanity checks
7700ea00cec6 drm/i915/display: Add macro HAS_ULTRAJOINER()
-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#26: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:157:
+#define HAS_ULTRAJOINER(i915)		((DISPLAY_VER(i915) >= 20 || \
+					  (IS_DGFX(i915) && DISPLAY_VER(i915) == 14)) && \
+					 HAS_DSC(i915))

total: 0 errors, 0 warnings, 1 checks, 9 lines checked
b4e74b6e1a5d drm/i915/display: Refactor enable_joiner_pipes
-:144: CHECK:SPACING: No space is necessary after a cast
#144: FILE: drivers/gpu/drm/i915/display/intel_display.c:3819:
+		cpu_transcoder = (enum transcoder) ffs(primary_pipe) - 1;

total: 0 errors, 0 warnings, 1 checks, 132 lines checked
1e790b65d57e drm/i915: Implement hw state readout and checks for ultrajoiner
e620f5f169f3 drm/i915/display/vdsc: Add ultrajoiner support with DSC
d7b4f584c78f drm/i915/dp: Refactor joiner max_bpp calculations into separate functions
f9a19269e4ac drm/i915/dp: Simplify the helper get_max_compressed_bpp_with_joiner
4171e5a3aa07 drm/i915/dp: Modify compressed bpp limitations for ultrajoiner
331e2d05c473 drm/i915/dp: Simplify helper to get slice count with joiner
ae9e99d87fc0 drm/i915: Compute config and mode valid changes for ultrajoiner
ee7f5b8052f8 drm/i915/display: Consider ultrajoiner for computing maxdotclock
e6b996cf3dd0 drm/i915/intel_dp: Add support for forcing ultrajoiner


