Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05971C5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C6210E700;
	Mon, 17 Aug 2026 09:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHNLS378";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50E310E702;
 Mon, 17 Aug 2026 09:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786958974; x=1818494974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IsDZA3ehFShCGEDVvLajl/0MsTXNdnPWU3St2aOplj4=;
 b=MHNLS37870SuBEOO3UQWq9bP1PHws4UQTbBsBBN6pW+yQ7n9QJoil0BY
 OQPVZQ4xkS5pqGsv/b53hWTptL2YWXE5YkM8ayByRYnUhNVP6/c0OkvW5
 h0O/74zAHhVXHA1wVcQz+byD8C0yojJ+wNg+lkUcDuA6UFXQPK/bfbG7b
 WdvM/hfP0Y/tFVWuyeiJqgW7joMeyuD9GPY7Wlr6w3B789sk2RujzVcxM
 gZyMxpwvE2KwwE8EmW3ekQiIZXC2IWBwS3XQNOy+83SRnJfqX/csnc3gi
 3ZzKunZbWZNuo2wOXzv+QAo9iZj1UgtWPIqBbpqnficqi3LQLWosxpk6x Q==;
X-CSE-ConnectionGUID: sCXtJTSDRi+Z4BtxYU7eEw==
X-CSE-MsgGUID: /OAH4GoXS7WjRLKBsplpJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87190000"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87190000"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:29:34 -0700
X-CSE-ConnectionGUID: IHFhv0onS0CYKPSR2PlwxQ==
X-CSE-MsgGUID: MtbvEx8RRy6sUmVgVvTB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268348882"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.136])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:29:32 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v3 5/5] drm/i915/display: split part of
 intel_display_reset_finish() to a new function
Date: Mon, 17 Aug 2026 12:26:24 +0300
Message-ID: <20260817092911.342072-6-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817092911.342072-1-luciano.coelho@intel.com>
References: <20260817092911.342072-1-luciano.coelho@intel.com>
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

