Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B94D3ABDA
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 18:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0494410E1F7;
	Mon, 11 Nov 2024 18:02:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C9E10E1F7;
 Mon, 11 Nov 2024 18:02:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_intel=5Fdispl?=
 =?utf-8?q?ay_conversions=2C_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Nov 2024 18:02:54 -0000
Message-ID: <173134817415.2631721.12658885932910012609@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731347547.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731347547.git.jani.nikula@intel.com>
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

Series: drm/i915: intel_display conversions, cleanups
URL   : https://patchwork.freedesktop.org/series/141175/
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
commit ab5f35aff9f43ec5a84bd7f19cfc5b31861f5f09
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Nov 11 19:53:34 2024 +0200

    drm/i915/irq: emphasize display_irqs_enabled is only about VLV/CHV
    
    Rename display_irqs_enabled to vlv_display_irqs_enabled, to emphasize
    it's really only about VLV/CHV. Only access it when running on VLV/CHV.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 6d0fd3fb958e77717cedf35f49325c7c0dfa11c9 drm-intel
d387057fb0c4 drm/i915/overlay: convert to struct intel_display
-:608: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#608: FILE: drivers/gpu/drm/i915/display/intel_overlay.h:32:
 }
+static inline void intel_overlay_cleanup(struct intel_display *display)

-:626: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#626: FILE: drivers/gpu/drm/i915/display/intel_overlay.h:49:
 }
+static inline void intel_overlay_reset(struct intel_display *display)

total: 0 errors, 0 warnings, 2 checks, 578 lines checked
dddd1be899df drm/i915/overlay: add intel_overlay_available() and use it
-:44: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#44: FILE: drivers/gpu/drm/i915/display/intel_overlay.h:33:
 }
+static inline bool intel_overlay_available(struct intel_display *display)

-:56: WARNING:SPDX_LICENSE_TAG: Misplaced SPDX-License-Identifier tag - use line 1 instead
#56: FILE: drivers/gpu/drm/i915/i915_getparam.c:2:
  * SPDX-License-Identifier: MIT

total: 0 errors, 1 warnings, 1 checks, 53 lines checked
aa50c8d0f4a4 drm/i915/plane: convert initial plane setup to struct intel_display
98e1890342aa drm/i915/irq: hide display_irqs_enabled access
ab5f35aff9f4 drm/i915/irq: emphasize display_irqs_enabled is only about VLV/CHV


