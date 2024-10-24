Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECC4CE8E73
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 13:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A085A10E936;
	Thu, 24 Oct 2024 13:12:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0347E10E936;
 Thu, 24 Oct 2024 13:12:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/xe3lpd=3A_ptl_di?=
 =?utf-8?q?splay_patches_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 13:12:17 -0000
Message-ID: <172977553700.1327763.10353449496356396644@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023214701.963830-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241023214701.963830-1-clinton.a.taylor@intel.com>
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

Series: drm/i915/xe3lpd: ptl display patches (rev2)
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
commit 12b7e77f00e82332d0c0839a9df70dd0524f1a70
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Wed Oct 23 14:47:01 2024 -0700

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
+ /mt/dim checkpatch 121cd95da591284c97d6f9ac1c58c7a79d27b201 drm-intel
c4184897b09d drm/i915/xe3lpd: Update pmdemand programming
-:77: ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
#77: FILE: drivers/gpu/drm/i915/display/intel_pmdemand.c:341:
+	}
+	else

total: 1 errors, 0 warnings, 0 checks, 161 lines checked
5b5869f47a1a drm/i915/xe3lpd: Disable HDCP Line Rekeying for Xe3
3e6f3b9349c3 drm/i915/xe3lpd: Add check to see if edp over type c is allowed
6d8e87c92707 drm/i915/display/ptl: Fill VRR crtc_state timings before other transcoder timings
5f8e9146984d drm/i915/ptl: Define IS_PANTHERLAKE macro
-:21: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#21: FILE: drivers/gpu/drm/i915/i915_drv.h:539:
+#define IS_PANTHERLAKE(i915) (0 && i915)

total: 0 errors, 0 warnings, 1 checks, 7 lines checked
9091adaba6a9 drm/i915/cx0: Extend C10 check to PTL
ac64462a589a drm/i915/cx0: Remove bus reset after every c10 transaction
2779cad1fc9b drm/i915/xe3lpd: Move async flip bit to PLANE_SURF register
4fcb8c8f0bb5 drm/i915/xe3: Underrun recovery does not exist post Xe2
187bc6ed5ea6 drm/i915/display/xe3: disable x-tiled framebuffers
7d49c735959e drm/i915/xe3lpd: Skip disabling VRR during modeset disable
12b7e77f00e8 drm/i915/xe3lpd: Power request asserting/deasserting
-:95: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#95: FILE: drivers/gpu/drm/i915/i915_reg.h:4545:
+#define   TCSS_DISP_MAILBOX_IN_CMD_DATA(x)	TCSS_DISP_MAILBOX_IN_CMD_RUN_BUSY | \
+						REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, (x))

-:96: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#96: FILE: drivers/gpu/drm/i915/i915_reg.h:4546:
+						REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, (x))

total: 1 errors, 1 warnings, 0 checks, 65 lines checked


