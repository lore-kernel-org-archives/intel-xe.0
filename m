Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF399CEB2CC
	for <intel-xe@archiver.kernel.org>; Sat, 15 Nov 2025 13:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5977010E2A3;
	Sat, 15 Nov 2025 13:38:05 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A6810E2A1;
 Sat, 15 Nov 2025 13:38:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/xe3p=5Flpd=3A_En?=
 =?utf-8?q?able_display_use_of_system_cache_for_FBC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Nov 2025 13:38:04 -0000
Message-ID: <176321388486.60065.16102219132070542335@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251115133223.370577-1-vinod.govindapillai@intel.com>
In-Reply-To: <20251115133223.370577-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/xe3p_lpd: Enable display use of system cache for FBC
URL   : https://patchwork.freedesktop.org/series/157624/
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
commit 9e6b9bb17db47d92b896f24f717a9eff69fd0d53
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Sat Nov 15 15:32:23 2025 +0200

    drm/i915/xe3p_lpd: Enable display use of system cache for FBC
    
    One of the FBC instances can utilize the reserved area of SoC
    level cache for the fbc transactions to benefit reduced memory
    system power especially in idle scenarios. Reserved area of the
    system cache can be assigned to an fbc instance by configuring
    the cacheability configuration register with offset of the
    compressed frame buffer in stolen memoty of that fbc. There is
    a limit to this reserved area which is programmable and for
    xe3p_lpd the limit is defined as 2MB.
    
    v2: - better to track fbc sys cache usage from intel_display level,
          sanitize the cacheability config register on probe (Matt)
        - limit this for integrated graphics solutions, confirmed that
          no default value set for cache range by hw (Gustavo)
    
    Bspec: 68881, 74722
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 5edcc4403be062363cc220b7c5840bda1c14615f drm-intel
9e6b9bb17db4 drm/i915/xe3p_lpd: Enable display use of system cache for FBC
-:45: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#45: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:176:
+#define HAS_FBC_SYS_CACHE(__display)	(DISPLAY_VER(__display) >= 35 && !(__display)->platform.dgfx)

-:45: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#45: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:176:
+#define HAS_FBC_SYS_CACHE(__display)	(DISPLAY_VER(__display) >= 35 && !(__display)->platform.dgfx)

-:58: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:77:
+#define IS_SYS_CACHE_FBC_UNASSIGNED(__display)	((__display)->sys_cache_fbc == SYS_CACHE_FBC_UNASSIGNED)

-:181: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#181: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:131:
+#define   FBC_SYS_CACHE_START_BASE(base)	REG_FIELD_PREP(FBC_SYS_CACHE_START_BASE_MASK, (base))

-:183: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#183: FILE: drivers/gpu/drm/i915/display/intel_fbc_regs.h:133:
+#define   FBC_SYS_CACHEABLE_RANGE(range)	REG_FIELD_PREP(FBC_SYS_CACHEABLE_RANGE_MASK, (range))

total: 0 errors, 4 warnings, 1 checks, 141 lines checked


