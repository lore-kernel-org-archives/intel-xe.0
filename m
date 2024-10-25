Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539EDD149F2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 20:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2065E10EB80;
	Fri, 25 Oct 2024 20:54:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E12A10EB80;
 Fri, 25 Oct 2024 20:54:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/xe3lpd=3A_ptl_di?=
 =?utf-8?q?splay_patches_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 20:54:30 -0000
Message-ID: <172988967057.1334310.8975379578579463109@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025204743.211510-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241025204743.211510-1-clinton.a.taylor@intel.com>
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

Series: drm/i915/xe3lpd: ptl display patches (rev5)
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
commit b23dd0310751ad2191ee82ee912b86198a26c7b6
Author: Haridhar Kalvala <haridhar.kalvala@intel.com>
Date:   Fri Oct 25 13:47:43 2024 -0700

    drm/xe/ptl: Enable PTL display
    
    Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
    Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
+ /mt/dim checkpatch 3ec61d11c7429a65dcc3ac46b9e845f13891a306 drm-intel
a0e55a14b3ce drm/i915/xe3lpd: Update pmdemand programming
-:145: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#145: FILE: drivers/gpu/drm/i915/display/intel_pmdemand.c:483:
+intel_pmdemand_update_params(struct intel_display *display,
+				 const struct intel_pmdemand_state *new,

total: 0 errors, 0 warnings, 1 checks, 172 lines checked
50aee9f528b0 drm/i915/xe3lpd: Disable HDCP Line Rekeying for Xe3
-:21: WARNING:BAD_SIGN_OFF: Duplicate signature
#21: 
Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>

total: 0 errors, 1 warnings, 0 checks, 35 lines checked
acb0aceeb9bf drm/i915/xe3lpd: Add check to see if edp over type c is allowed
132f0bd93391 drm/i915/ptl: Define IS_PANTHERLAKE macro
-:22: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'i915' may be better as '(i915)' to avoid precedence issues
#22: FILE: drivers/gpu/drm/i915/i915_drv.h:539:
+#define IS_PANTHERLAKE(i915) (0 && i915)

total: 0 errors, 0 warnings, 1 checks, 7 lines checked
2da2ff092fa5 drm/i915/cx0: Extend C10 check to PTL
29711cd3194e drm/i915/cx0: Remove bus reset after every c10 transaction
f9a313540c75 drm/i915/xe3lpd: Move async flip bit to PLANE_SURF register
8fd388f11c9e drm/i915/xe3: Underrun recovery does not exist post Xe2
b661e6298d17 drm/i915/display/xe3: disable x-tiled framebuffers
d790efd4ce9f drm/i915/xe3lpd: Power request asserting/deasserting
-:96: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#96: FILE: drivers/gpu/drm/i915/i915_reg.h:4545:
+#define   TCSS_DISP_MAILBOX_IN_CMD_DATA(x)	TCSS_DISP_MAILBOX_IN_CMD_RUN_BUSY | \
+						REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, (x))

-:97: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#97: FILE: drivers/gpu/drm/i915/i915_reg.h:4546:
+						REG_FIELD_PREP(TCSS_DISP_MAILBOX_IN_CMD_CMD_MASK, (x))

total: 1 errors, 1 warnings, 0 checks, 65 lines checked
b23dd0310751 drm/xe/ptl: Enable PTL display
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


