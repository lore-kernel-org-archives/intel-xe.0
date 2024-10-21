Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE02BD1714B
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 23:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBFC10E21D;
	Mon, 21 Oct 2024 23:48:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5071810E21D;
 Mon, 21 Oct 2024 23:48:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=5Fwl=3A_Fixe?=
 =?utf-8?q?s_and_enablement_for_Xe3=5FLPD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 23:48:20 -0000
Message-ID: <172955450032.1306981.9940243324910988932@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021222744.294371-1-gustavo.sousa@intel.com>
In-Reply-To: <20241021222744.294371-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Fixes and enablement for Xe3_LPD
URL   : https://patchwork.freedesktop.org/series/140283/
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
commit 95256bd463f37a1cace127866a5a922245670607
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Oct 21 19:27:32 2024 -0300

    drm/i915/xe3lpd: Use DMC wakelock by default
    
    Although Bspec doesn't explicitly mentions that, as of Xe3_LPD, using
    DMC wakelock is the officially recommended way of accessing registers
    that would be off during DC5/DC6 and the legacy method (where the DMC
    intercepts MMIO to wake up the hardware) is to be avoided.
    
    As such, update the driver to use the DMC wakelock by default starting
    with Xe3_LPD. Since the feature is somewhat new to the driver, also
    allow disabling it via a module parameter for debugging purposes.
    
    For that, make the existing parameter allow values -1 (per-chip
    default), 0 (disabled) and 1 (enabled), similarly to what is done for
    other parameters.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch aa0898115bcff3eda6d021cc66eb8a1c3b264c56 drm-intel
5d8105c4c9ce drm/xe: Mimic i915 behavior for non-sleeping MMIO wait
dc64a19a5c2a drm/i915/dmc_wl: Use non-sleeping variant of MMIO wait
-:33: WARNING:LONG_LINE: line length of 134 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/display/intel_de.h:133:
+#define __intel_de_wait_for_register_atomic_nowl(p,...) ____intel_de_wait_for_register_atomic_nowl(__to_intel_display(p), __VA_ARGS__)

-:33: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#33: FILE: drivers/gpu/drm/i915/display/intel_de.h:133:
+}
+#define __intel_de_wait_for_register_atomic_nowl(p,...) ____intel_de_wait_for_register_atomic_nowl(__to_intel_display(p), __VA_ARGS__)

-:33: ERROR:SPACING: space required after that ',' (ctx:VxV)
#33: FILE: drivers/gpu/drm/i915/display/intel_de.h:133:
+#define __intel_de_wait_for_register_atomic_nowl(p,...) ____intel_de_wait_for_register_atomic_nowl(__to_intel_display(p), __VA_ARGS__)
                                                   ^

total: 1 errors, 1 warnings, 1 checks, 55 lines checked
31ccaf36002f drm/i915/dmc_wl: Check for non-zero refcount in release work
f947ac2e799a drm/i915/dmc_wl: Get wakelock when disabling dynamic DC states
d4488bbbc81b drm/i915/dmc_wl: Use sentinel item for range tables
ae3c9b3c0115 drm/i915/dmc_wl: Extract intel_dmc_wl_addr_in_range()
b083f4d16ada drm/i915/dmc_wl: Check ranges specific to DC states
118c8a479335 drm/i915/dmc_wl: Allow simpler syntax for single reg in range tables
ef2c4c703b24 drm/i915/dmc_wl: Deal with existing references when disabling
320cd4901765 drm/i915/dmc_wl: Couple enable/disable with dynamic DC states
49d30d6585f5 drm/i915/dmc_wl: Add and use HAS_DMC_WAKELOCK()
-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#25: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:131:
+#define HAS_DMC_WAKELOCK(i915)		(HAS_DMC(i915) && DISPLAY_VER(i915) >= 20)

total: 0 errors, 0 warnings, 1 checks, 37 lines checked
414e7db171e6 drm/i915/dmc_wl: Sanitize enable_dmc_wl according to hardware support
95256bd463f3 drm/i915/xe3lpd: Use DMC wakelock by default
-:31: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#31: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:127:
+intel_display_param_named_unsafe(enable_dmc_wl, int, 0400,
 	"Enable DMC wakelock "

total: 0 errors, 0 warnings, 1 checks, 32 lines checked


