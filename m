Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF75AD29FBC
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 01:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769F710E20E;
	Thu,  7 Nov 2024 01:24:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53F810E20E;
 Thu,  7 Nov 2024 01:24:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=5Fwl=3A_Fixe?=
 =?utf-8?q?s_and_enablement_for_Xe3=5FLPD_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 01:24:22 -0000
Message-ID: <173094266273.1419668.154196109206678842@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106215231.103474-1-gustavo.sousa@intel.com>
In-Reply-To: <20241106215231.103474-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Fixes and enablement for Xe3_LPD (rev2)
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
commit d18a073b37334f7e286c4878a54f856750ee2656
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Wed Nov 6 18:50:43 2024 -0300

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
    
    v2:
      - Describe -1 in the same area where 0 and 1 are described. (Luca)
    
    Cc: Luca Coelho <luciano.coelho@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3 drm-intel
43a5eb68dcbb drm/i915/dmc_wl: Use i915_mmio_reg_offset() instead of reg.reg
ed55a8a02fbf drm/xe: Mimic i915 behavior for non-sleeping MMIO wait
eadb34a0d1fb drm/i915/dmc_wl: Use non-sleeping variant of MMIO wait
365b305ebf92 drm/i915/dmc_wl: Check for non-zero refcount in release work
19187b11e2a9 drm/i915/dmc_wl: Get wakelock when disabling dynamic DC states
90fe42b10d31 drm/i915/dmc_wl: Use sentinel item for range tables
237bada61242 drm/i915/dmc_wl: Extract intel_dmc_wl_reg_in_range()
ba5193cea694 drm/i915/dmc_wl: Rename lnl_wl_range to powered_off_ranges
78e16ac8fd17 drm/i915/dmc_wl: Track registers touched by the DMC
dcd2f5a04f2e drm/i915/dmc_wl: Allow simpler syntax for single reg in range tables
c354ae9b3afa drm/i915/dmc_wl: Deal with existing references when disabling
aa6c4e370adc drm/i915/dmc_wl: Couple enable/disable with dynamic DC states
e238904b651c drm/i915/dmc_wl: Add and use HAS_DMC_WAKELOCK()
97935638e96d drm/i915/dmc_wl: Init only after we have runtime device info
6a7fa4e99f7e drm/i915/dmc_wl: Use HAS_DMC() in HAS_DMC_WAKELOCK()
-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#22: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:150:
+#define HAS_DMC_WAKELOCK(i915)		(HAS_DMC(i915) && DISPLAY_VER(i915) >= 20)

total: 0 errors, 0 warnings, 1 checks, 8 lines checked
46e79b2c524b drm/i915/dmc_wl: Sanitize enable_dmc_wl according to hardware support
d18a073b3733 drm/i915/xe3lpd: Use DMC wakelock by default
-:35: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#35: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:127:
+intel_display_param_named_unsafe(enable_dmc_wl, int, 0400,
 	"Enable DMC wakelock "

total: 0 errors, 0 warnings, 1 checks, 33 lines checked


