Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C72D5C0C5
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 13:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA02010E995;
	Fri,  8 Nov 2024 13:09:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2CB10E995;
 Fri,  8 Nov 2024 13:09:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=5Fwl=3A_Fixe?=
 =?utf-8?q?s_and_enablement_for_Xe3=5FLPD_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Nov 2024 13:09:51 -0000
Message-ID: <173107139184.1427063.14035003661276212543@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108130218.24125-1-gustavo.sousa@intel.com>
In-Reply-To: <20241108130218.24125-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Fixes and enablement for Xe3_LPD (rev4)
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
commit ab515c7d6ac04646f0bb9c6ae35eb5517b3229af
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Nov 8 09:57:20 2024 -0300

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
    
    Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 5521311ecd7ffbb0adf016dbf83bd0165fc94d25 drm-intel
3699e754be0f drm/i915/dmc_wl: Use i915_mmio_reg_offset() instead of reg.reg
a5ff63bde768 drm/xe: Mimic i915 behavior for non-sleeping MMIO wait
95991032bfca drm/i915/dmc_wl: Use non-sleeping variant of MMIO wait
82ccb7651e0c drm/i915/dmc_wl: Check for non-zero refcount in release work
e9490040cb2a drm/i915/dmc_wl: Get wakelock when disabling dynamic DC states
72a50787302c drm/i915/dmc_wl: Use sentinel item for range tables
0d8890cfaade drm/i915/dmc_wl: Extract intel_dmc_wl_reg_in_range()
be874f0f38b1 drm/i915/dmc_wl: Rename lnl_wl_range to powered_off_ranges
7ca99332dbea drm/i915/dmc_wl: Track registers touched by the DMC
f8121aea1721 drm/i915/dmc_wl: Allow simpler syntax for single reg in range tables
ca3dbfb5b8d2 drm/i915/dmc_wl: Deal with existing references when disabling
6fd5c1f3a9b8 drm/i915/dmc_wl: Couple enable/disable with dynamic DC states
61e13c4fdb28 drm/i915/dmc_wl: Add and use HAS_DMC_WAKELOCK()
903ccf259033 drm/i915/dmc_wl: Sanitize enable_dmc_wl according to hardware support
ab515c7d6ac0 drm/i915/xe3lpd: Use DMC wakelock by default
-:35: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#35: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:127:
+intel_display_param_named_unsafe(enable_dmc_wl, int, 0400,
 	"Enable DMC wakelock "

total: 0 errors, 0 warnings, 1 checks, 33 lines checked


