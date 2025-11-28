Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3CFD116F3
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 11:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7E10E12E;
	Fri, 28 Nov 2025 11:42:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AAD10E12E;
 Fri, 28 Nov 2025 11:42:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Enabl?=
 =?utf-8?q?e_system_cache_support_for_FBC_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Nov 2025 11:42:00 -0000
Message-ID: <176433012026.38417.15942259407024675647@a3b018990fe9>
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

Series: drm/i915/display: Enable system cache support for FBC (rev4)
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
commit fd5714fe23a54f429063d343bdd7b9cb419513a4
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Thu Nov 27 13:53:49 2025 +0200

    drm/i915/fbc: Apply Wa_14025769978
    
    Disable cache read setting in the cacheability configuration
    register as per the wa recommendation
    
    Bspec: 79482, 74722, 68881
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch e1c1b3e03e356d1e20432dcb0d38ad44d5e92670 drm-intel
284b5f57a20c drm/i915/display: Use a sub-struct for fbc operations in intel_display
07742e28c6b4 drm/i915/xe3p_lpd: Enable display use of system cache for FBC
-:58: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:176:
+#define HAS_FBC_SYS_CACHE(__display)	(DISPLAY_VER(__display) >= 35 && !(__display)->platform.dgfx)

-:58: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#58: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:176:
+#define HAS_FBC_SYS_CACHE(__display)	(DISPLAY_VER(__display) >= 35 && !(__display)->platform.dgfx)

-:219: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#219: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:131:
+#define   FBC_SYS_CACHE_START_BASE(base)	REG_FIELD_PREP(FBC_SYS_CACHE_START_BASE_MASK, (base))

-:221: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#221: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:133:
+#define   FBC_SYS_CACHEABLE_RANGE(range)	REG_FIELD_PREP(FBC_SYS_CACHEABLE_RANGE_MASK, (range))

total: 0 errors, 3 warnings, 1 checks, 169 lines checked
fd5714fe23a5 drm/i915/fbc: Apply Wa_14025769978


