Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5D5E93816
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 04:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA1910E300;
	Mon, 13 Apr 2026 04:18:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31B810E300;
 Mon, 13 Apr 2026 04:18:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_Common_SD?=
 =?utf-8?q?P_Transmission_Line_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Apr 2026 04:18:23 -0000
Message-ID: <177605390371.455032.6865875827006770652@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for Common SDP Transmission Line (rev2)
URL   : https://patchwork.freedesktop.org/series/162623/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c38a955388dcc23ade695af7cea3c0ca8e2fd9a3
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Apr 13 09:23:49 2026 +0530

    drm/i915/display: Dump SDP Transmission lines
    
    Add SDP transmission lines to the CRTC state dump.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch b6fce504bb100219c9b8bb7f719d67c660382f51 drm-intel
e1f37cf3952e drm/i915/vrr: Add HAS_EMP_AS_SDP_TL macro
-:22: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:176:
+#define HAS_EMP_AS_SDP_TL(__display)	(DISPLAY_VERx100(__display) == 1401 || DISPLAY_VER(__display) >= 20)

-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:176:
+#define HAS_EMP_AS_SDP_TL(__display)	(DISPLAY_VERx100(__display) == 1401 || DISPLAY_VER(__display) >= 20)

total: 0 errors, 1 warnings, 1 checks, 15 lines checked
c10fbe38850a drm/i915/vrr: Add helper to readback EMP_AS_SDP_TL
c7811bff82dc drm/i915/vrr: Separate out helper to write EMP_AS_SDP_TL
03da546b2eac drm/i915/dp: Add helper to get AS SDP Transmission Line
6a6d1a58521b drm/i915/dp: Add crtc state for AS SDP transmission line
f01e204e50b5 drm/i915/dp: Store and use AS SDP transmission line from crtc state
f7ca8bc5ceef drm/i915/nvl: Add register definitions for common SDP Transmission Line
-:30: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2133:
+#define CMN_SDP_TL_STGR_CTL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_STGR_CTL_A)

total: 0 errors, 1 warnings, 0 checks, 25 lines checked
4373a1ef907f drm/i915/display: Add HAS_CMN_SDP_TL macro
dfbc826bdffb drm/i915/dp: Store SDP transmission lines in crtc_state
e445e67c8996 drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission line
37f3d8e1ba38 drm/i915/dp: Enable Common SDP Transmission line
c38a955388dc drm/i915/display: Dump SDP Transmission lines


