Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4DFC531D0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 22:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFC510E4D0;
	Mon, 27 Jul 2026 22:27:59 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A7B10E4D0;
 Mon, 27 Jul 2026 22:27:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_SKL?=
 =?utf-8?q?=5FDSSM_/_DE=5FCAP_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Jul 2026 22:27:58 -0000
Message-ID: <178519127807.229056.15048593427842134401@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260727222125.2459634-1-michal.grzelak@intel.com>
In-Reply-To: <20260727222125.2459634-1-michal.grzelak@intel.com>
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

Series: drm/i915/display: SKL_DSSM / DE_CAP fixes
URL   : https://patchwork.freedesktop.org/series/171136/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ca9a5d53c1b514bf71a546b7e9cc28daffa1cd1d
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Tue Jul 28 00:21:25 2026 +0200

    drm/i915/xe2lpd+: disable 3D LUT if unsupported
    
    XE2LPD_DE_CAP_3DLUT_MASK is defined but never used. Check with it if
    3DLUT is enabled.
    
    Check DE_CAP register if 3D LUT is disabled. Store the info in a new
    field of struct intel_display_runtime_info.
    
    Add macros for checking both 3D LUT hardware and 3D LUT capability.
    
    Initialize has_3dlut to 1 on each platform since LNL.
    
    Log value of has_3dlut in intel_display_device_info_print().
    
    Bspec: 71161
    Cc: Chaitanya Borah Kumar <chaitanya.borah.kumar@intel.com>
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch 28e3f47d47a61b5e28e7566944479e9c9715d41d drm-intel
d89fa6b5f997 drm/i915/display: fix SKL_DSSM register masks
ca9a5d53c1b5 drm/i915/xe2lpd+: disable 3D LUT if unsupported
-:95: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#95: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:151:
+#define HAS_3DLUT_CAP(__display)	(IS_DISPLAY_VER(__display, 10, 20) || DISPLAY_RUNTIME_INFO(__display)->has_3dlut)

-:95: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#95: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:151:
+#define HAS_3DLUT_CAP(__display)	(IS_DISPLAY_VER(__display, 10, 20) || DISPLAY_RUNTIME_INFO(__display)->has_3dlut)

-:96: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#96: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:152:
+#define HAS_3DLUT(__display)		(HAS_3DLUT_HW(__display) && HAS_3DLUT_CAP(__display))

total: 0 errors, 1 warnings, 2 checks, 70 lines checked


