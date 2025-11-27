Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3831BCFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 14:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED9610E07D;
	Thu, 27 Nov 2025 14:05:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5C810E07D;
 Thu, 27 Nov 2025 14:05:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Enabl?=
 =?utf-8?q?e_system_cache_support_for_FBC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 14:05:10 -0000
Message-ID: <176425231083.35615.12953557898406884179@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127115349.249120-1-vinod.govindapillai@intel.com>
In-Reply-To: <20251127115349.249120-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/display: Enable system cache support for FBC (rev2)
URL   : https://patchwork.freedesktop.org/series/157944/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 18be211cec7043a8ac6187a7baa19283a59ff510
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Thu Nov 27 13:53:49 2025 +0200

    drm/i915/fbc: Apply Wa_14025769978
    
    Disable cache read setting in the cacheability configuration
    register as per the wa recommendation
    
    Bspec: 79482, 74722, 68881
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 943d0e69375e5a9030238a697f7d850af0549000 drm-intel
81274635a3f1 drm/i915/display: Use a sub-struct for fbc operations in intel_display
4bacd89350ca drm/i915/xe3p_lpd: Enable display use of system cache for FBC
-:41: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#41: FILE: drivers/gpu/drm/i915/display/intel_display_core.h:406:
+			struct mutex lock;

-:55: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:176:
+#define HAS_FBC_SYS_CACHE(__display)	(DISPLAY_VER(__display) >= 35 && !(__display)->platform.dgfx)

-:55: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#55: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:176:
+#define HAS_FBC_SYS_CACHE(__display)	(DISPLAY_VER(__display) >= 35 && !(__display)->platform.dgfx)

-:215: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#215: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:131:
+#define   FBC_SYS_CACHE_START_BASE(base)	REG_FIELD_PREP(FBC_SYS_CACHE_START_BASE_MASK, (base))

-:217: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#217: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:133:
+#define   FBC_SYS_CACHEABLE_RANGE(range)	REG_FIELD_PREP(FBC_SYS_CACHEABLE_RANGE_MASK, (range))

total: 0 errors, 3 warnings, 2 checks, 167 lines checked
18be211cec70 drm/i915/fbc: Apply Wa_14025769978


