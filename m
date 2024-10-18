Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E01D3F2BF
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 22:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4CA10E9D1;
	Fri, 18 Oct 2024 22:09:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A713910E9D1;
 Fri, 18 Oct 2024 22:09:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/xe3lpd=3A_ptl_di?=
 =?utf-8?q?splay_patches?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 22:09:08 -0000
Message-ID: <172928934868.1294974.12096043457521988536@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018204941.73473-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241018204941.73473-1-matthew.s.atwood@intel.com>
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

Series: drm/i915/xe3lpd: ptl display patches
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
commit 1df00cdf1ba33a6d8de61d4544ad009fbf2ed7a2
Author: Mika Kahola <mika.kahola@intel.com>
Date:   Fri Oct 18 13:49:41 2024 -0700

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
+ /mt/dim checkpatch fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403 drm-intel
b1590b7f97d4 drm/i915/display/ptl: Fill VRR crtc_state timings before other transcoder timings
-:9: WARNING:TYPO_SPELLING: 'accomodate' may be misspelled - perhaps 'accommodate'?
#9: 
intel_vrr_get_config before intel_get_transcoder_timings to accomodate
                                                            ^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
f97c93359ee7 drm/i915/ptl: Define IS_PANTHERLAKE macro
-:20: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#20: FILE: drivers/gpu/drm/i915/i915_drv.h:541:
+#define IS_PANTHERLAKE(i915) (0 && i915)

total: 0 errors, 0 warnings, 1 checks, 7 lines checked
935b92ec02fd drm/i915/cx0: Extend C10 check to PTL
ebe1c86c8c1f drm/i915/ptl: Move async flip bit to PLANE_SURF register
-:28: ERROR:SPACING: space required before the open brace '{'
#28: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:1575:
+	if (async_flip){

-:30: ERROR:CODE_INDENT: code indent should use tabs where possible
#30: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:1577:
+^I                plane_surf |= PLANE_SURF_ASYNC_UPDATE;$

total: 2 errors, 0 warnings, 0 checks, 33 lines checked
18d5ef9fe33f drm/i915/xe3: Underrun recovery does not exist post Xe2
5c8aeb66093c drm/i915/display/xe3: disable x-tiled framebuffers
018c9256ded6 drm/i915/xe3lpd: Skip disabling VRR during modeset disable
fdc3bf44cfeb drm/i915/xe3lpd: Increase resolution for plane to support 6k
-:39: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#39: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:435:
+static int xe3_plane_max_width(const struct drm_framebuffer *fb,
+				   int color_plane,

-:57: ERROR:SPACING: space required after that close brace '}'
#57: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2603:
+	}else if (DISPLAY_VER(dev_priv) >= 11) {

total: 1 errors, 0 warnings, 1 checks, 36 lines checked
40dcf4fb778a drm/i915/xe3lpd: Increase max_h max_v for PSR
65f1a9b80443 drm/i915/xe3lpd: Increase bigjoiner limitations
7142c85f9a4f drm/i915/xe3lpd: Prune modes for YUV420
-:6: WARNING:TYPO_SPELLING: 'upto' may be misspelled - perhaps 'up to'?
#6: 
We only support resolution upto 4k for single pipe when using
                           ^^^^

total: 0 errors, 1 warnings, 0 checks, 42 lines checked
1df00cdf1ba3 drm/i915/xe3lpd: Power request asserting/deasserting
-:95: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#95: FILE: drivers/gpu/drm/i915/i915_reg.h:4543:
+#define   TCSS_DISP_MAILBOX_IN_CMD_DATA(x)	TCSS_DISP_MAILBOX_IN_CMD_RUN_BUSY | \
+						REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, (x))

-:96: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#96: FILE: drivers/gpu/drm/i915/i915_reg.h:4544:
+						REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, (x))

total: 1 errors, 1 warnings, 0 checks, 65 lines checked


