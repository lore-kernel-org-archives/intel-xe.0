Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E0DC79FAC
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 09:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4206410EACC;
	Tue,  8 Sep 2026 09:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxMZcRRg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D209110EAC4;
 Tue,  8 Sep 2026 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788858586; x=1820394586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IsDZA3ehFShCGEDVvLajl/0MsTXNdnPWU3St2aOplj4=;
 b=HxMZcRRgYxgsYXk0XDtxOEaJBYg5OvDyBxYS84wtsrn/hhsS68yC7R3T
 QnCAgFPWebSKL8LHKxsY6BGbY9fpWuoXorPF3onhjDG3i38pVxhhrGUKw
 IZJzFUdZyvPAx0VCC3/Ro264q/ZZgUQrXm6HRtu4ZeLB6pPaOKUCKUI27
 SX58RoX8k7oihKF/hcK/in5V0/u8MtwhoWHK1tFwiedJNBwyvhJzyQNEN
 T2+zh/bZTudBTwRz6PIIEYEWORnDrvSSh+PaI+YqFAr3kBv2tqzk2v8U+
 QFJ1M8hxJlnH0ZVaIuVh2/N36u2gA4gU4eKpX/ota1skN/JRtxO+HXw4A g==;
X-CSE-ConnectionGUID: RrgBn8KITCGjZAn7RtiHbQ==
X-CSE-MsgGUID: MnzT4LppQUqLvAAFVZ+IhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89285086"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89285086"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 02:09:46 -0700
X-CSE-ConnectionGUID: ffkkJjJXT0exs8Hxq1+8Cw==
X-CSE-MsgGUID: 29mByVKtQfSImZ4cKuiNpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="267690311"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.144])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 02:09:44 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v4 2/2] drm/i915/display: split part of
 intel_display_reset_finish() to a new function
Date: Tue,  8 Sep 2026 11:43:03 +0300
Message-ID: <20260908090924.52117-3-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090924.52117-1-luciano.coelho@intel.com>
References: <20260908090924.52117-1-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In the intel_display_reset_finish() function, we are currently calling
the non-display function intel_clock_gating_init(), creating an
unnecessary dependency.

In order to avoid this, split out the function calls that happen
before the call to intel_clock_gating_init() to a new function that
can be directly called by intel_gt_reset_global(), which then calls
intel_clock_gating_init() itself, if needed.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../drm/i915/display/intel_display_reset.c    | 19 +++++++++++++------
 .../drm/i915/display/intel_display_reset.h    |  1 +
 drivers/gpu/drm/i915/gt/intel_reset.c         |  5 +++++
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drivers/gpu/drm/i915/display/intel_display_reset.c
index 504ec7043cd9..529dd1c1fa5d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.c
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
@@ -8,7 +8,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_print.h>
 
-#include "intel_clock_gating.h"
 #include "intel_cx0_phy.h"
 #include "intel_display_core.h"
 #include "intel_display_driver.h"
@@ -73,6 +72,17 @@ void intel_display_reset_prepare(struct intel_display *display)
 	state->acquire_ctx = ctx;
 }
 
+bool intel_display_reset_reinit(struct intel_display *display)
+{
+	if (!display->restore.modeset_state)
+		return false;
+
+	intel_pps_unlock_regs_wa(display);
+	intel_display_driver_init_hw(display);
+
+	return true;
+}
+
 void intel_display_reset_finish(struct intel_display *display, bool test_only)
 {
 	struct drm_modeset_acquire_ctx *ctx = &display->restore.reset_ctx;
@@ -94,12 +104,9 @@ void intel_display_reset_finish(struct intel_display *display, bool test_only)
 		}
 	} else {
 		/*
-		 * The display has been reset as well,
-		 * so need a full re-initialization.
+		 * The display has been reset as well, so complete the
+		 * re-initialization started by intel_display_reset_reinit().
 		 */
-		intel_pps_unlock_regs_wa(display);
-		intel_display_driver_init_hw(display);
-		intel_clock_gating_init(display->drm);
 		intel_cx0_pll_power_save_wa(display);
 		intel_hpd_init(display);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.h b/drivers/gpu/drm/i915/display/intel_display_reset.h
index b88c330a3441..e741e969d877 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.h
@@ -13,6 +13,7 @@ struct intel_display;
 bool intel_display_reset_supported(struct intel_display *display);
 bool intel_display_reset_test(struct intel_display *display);
 void intel_display_reset_prepare(struct intel_display *display);
+bool intel_display_reset_reinit(struct intel_display *display);
 void intel_display_reset_finish(struct intel_display *display, bool test_only);
 
 void intel_display_reset_debugfs_register(struct intel_display *display);
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 6053f3e8aa27..be282cfbe615 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -24,6 +24,7 @@
 #include "i915_reg.h"
 #include "i915_wait_util.h"
 #include "intel_breadcrumbs.h"
+#include "intel_clock_gating.h"
 #include "intel_engine_pm.h"
 #include "intel_engine_regs.h"
 #include "intel_gt.h"
@@ -1445,6 +1446,10 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 
 		intel_gt_reset(gt, engine_mask, reason);
 
+		if (need_display_reset &&
+		    intel_display_reset_reinit(display))
+			intel_clock_gating_init(&i915->drm);
+
 		if (reset_display)
 			intel_display_reset_finish(display, !need_display_reset);
 	}
-- 
2.53.0

