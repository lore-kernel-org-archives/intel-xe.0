Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EA5D116EA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 04:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6534210E07F;
	Fri, 25 Oct 2024 04:27:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A271D10E07F;
 Fri, 25 Oct 2024 04:27:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/xe3lpd=3A_ptl_di?=
 =?utf-8?q?splay_patches_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 04:27:32 -0000
Message-ID: <172983045266.1330678.10909120982844432048@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024223114.785209-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241024223114.785209-1-clinton.a.taylor@intel.com>
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

Series: drm/i915/xe3lpd: ptl display patches (rev4)
URL   : https://patchwork.freedesktop.org/series/140195/
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
commit 219e6ee7bead65216cb021b37e77d75105ec78f6
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Thu Oct 24 15:31:14 2024 -0700

    drm/i915/xe3lpd: Power request asserting/deasserting
    
    There is a HW issue that arises when there are race conditions
    between TCSS entering/exiting TC7 or TC10 states while the
    driver is asserting/deasserting TCSS power request. As a
    workaround, Display driver will implement a mailbox sequence
    to ensure that the TCSS is in TC0 when TCSS power request is
    asserted/deasserted.
    
    The sequence is the following
    
    1. Read mailbox command status and wait until run/busy bit is
       clear
    2. Write mailbox data value '1' for power request asserting
       and '0' for power request deasserting
    3. Write mailbox command run/busy bit and command value with 0x1
    4. Read mailbox command and wait until run/busy bit is clear
       before continuing power request.
    
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
    Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
+ /mt/dim checkpatch 75eab7b9ee32a121d95a42ac704b679097f1fac4 drm-intel
f6facba09f78 drm/i915/xe3lpd: Update pmdemand programming
-:78: ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
#78: FILE: drivers/gpu/drm/i915/display/intel_pmdemand.c:341:
+	}
+	else

total: 1 errors, 0 warnings, 0 checks, 161 lines checked
6f1f1de809ca drm/i915/xe3lpd: Disable HDCP Line Rekeying for Xe3
5792a71cb2f0 drm/i915/xe3lpd: Add check to see if edp over type c is allowed
8a4690920e55 drm/i915/ptl: Define IS_PANTHERLAKE macro
-:22: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#22: FILE: drivers/gpu/drm/i915/i915_drv.h:539:
+#define IS_PANTHERLAKE(i915) (0 && i915)

total: 0 errors, 0 warnings, 1 checks, 7 lines checked
1cd039251d3a drm/i915/cx0: Extend C10 check to PTL
07b5616c4cb5 drm/i915/cx0: Remove bus reset after every c10 transaction
a2e80f172e63 drm/i915/xe3lpd: Move async flip bit to PLANE_SURF register
7ca63fba96fb drm/i915/xe3: Underrun recovery does not exist post Xe2
aa8f7c4c39b6 drm/i915/display/xe3: disable x-tiled framebuffers
79b37fc1020f drm/i915/xe3lpd: Skip disabling VRR during modeset disable
219e6ee7bead drm/i915/xe3lpd: Power request asserting/deasserting
-:96: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#96: FILE: drivers/gpu/drm/i915/i915_reg.h:4545:
+#define   TCSS_DISP_MAILBOX_IN_CMD_DATA(x)	TCSS_DISP_MAILBOX_IN_CMD_RUN_BUSY | \
+						REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, (x))

-:97: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#97: FILE: drivers/gpu/drm/i915/i915_reg.h:4546:
+						REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, (x))

total: 1 errors, 1 warnings, 0 checks, 65 lines checked


