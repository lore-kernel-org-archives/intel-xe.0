Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE97CEB2C2
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 21:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCEE10E28F;
	Mon, 30 Sep 2024 21:45:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA28C10E570;
 Mon, 30 Sep 2024 21:45:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ultrajoiner_basic_functio?=
 =?utf-8?q?nality_series_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 21:45:57 -0000
Message-ID: <172773275769.1139131.10055588716360740781@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930163549.416410-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240930163549.416410-1-ankit.k.nautiyal@intel.com>
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

Series: Ultrajoiner basic functionality series (rev8)
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
commit 92f99feaa782fa431291accc608d260ccee9bc20
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Sep 30 22:05:49 2024 +0530

    drm/i915/intel_dp: Add support for forcing ultrajoiner
    
    Allow forcing ultrajoiner through debugfs.
    
    v2: Minor refactoring of switch case logic. (Ville)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 drm-intel
a3f484fff3d7 drm/i915: Split current joiner hw state readout
f89f3edb19f1 drm/i915: Add bigjoiner and uncompressed joiner hw readout sanity checks
6bc7a428598c drm/i915/display: Add macro HAS_ULTRAJOINER()
-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#26: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:157:
+#define HAS_ULTRAJOINER(i915)		((DISPLAY_VER(i915) >= 20 || \
+					  (IS_DGFX(i915) && DISPLAY_VER(i915) == 14)) && \
+					 HAS_DSC(i915))

total: 0 errors, 0 warnings, 1 checks, 9 lines checked
7de537e8067e drm/i915/display: Refactor enable_joiner_pipes
2b833f09c814 drm/i915: Implement hw state readout and checks for ultrajoiner
789964780571 drm/i915/display/vdsc: Add ultrajoiner support with DSC
d3f7ac67a5dd drm/i915/dp: Refactor joiner max_bpp calculations into separate functions
72541bb702b9 drm/i915/dp: Use num_joined_pipes in bigjoiner_bw_max_bpp
fd5680a60c14 drm/i915/dp: Modify compressed bpp limitations for ultrajoiner
72f6370b3654 drm/i915/dp: Simplify helper to get slice count with joiner
671c415ea4cf drm/i915: Compute config and mode valid changes for ultrajoiner
2770c5910f60 drm/i915/display: Consider ultrajoiner for computing maxdotclock
92f99feaa782 drm/i915/intel_dp: Add support for forcing ultrajoiner


