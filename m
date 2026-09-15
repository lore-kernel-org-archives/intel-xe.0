Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B02C88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 16:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72A210E615;
	Tue, 15 Sep 2026 16:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NH1ZX38g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799A610E574;
 Tue, 15 Sep 2026 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789488387; x=1821024387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+M7hdAx2JAWBm/7HKtlnAssdH63AcMrF0MbaeD6CIJQ=;
 b=NH1ZX38gSI4ETvjgH6N9P+EWNKl7AhkdiQsEhRH76+RQdt6s89p2P5Nl
 D+KenlbG1dHxHmMIQGAlqR9DncxY0rvs7Z+N8/lsR/YjRej+0Bv8YSI8P
 vu0w8Ijbs6zgPaFTyivhPD0dBY0xGnIz0qJGbOvPn39OBBgIqxJrFSCkd
 LbIFjPu8EnSD1RoNXOJGbh9SGLVgB23vYHPWEM50gcUiZl/a2afF+/mz0
 FTwK3/hkuOLBt6cO53DGTFY9lppyZwMt1TT3oE+UJxo9iJUpnTt0X2EE0
 beIXw99wGmCBSTNLE8kKqrCPTRoJs4r8AUp2UbfkOK4V+QOk25O7UQDbi A==;
X-CSE-ConnectionGUID: OwmQyUk5QgqxsQfiMeQI/A==
X-CSE-MsgGUID: sSpor4QwQw2uOMpKBst3Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112628381"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="112628381"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 09:06:26 -0700
X-CSE-ConnectionGUID: F9e8OPQ/QLu2gmV8qi5AWg==
X-CSE-MsgGUID: OUacvA95Q/WQiptNeHMcwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271248260"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 09:06:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH] drm/i915/dp: use EXPORT_SYMBOL_IF_KUNIT() for kunit helpers
Date: Tue, 15 Sep 2026 19:06:20 +0300
Message-ID: <20260915160620.779372-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Type: text/plain; charset=UTF-8
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

Use EXPORT_SYMBOL_IF_KUNIT() instead of the regular EXPORT_SYMBOL() to
export the symbols to the kunit namespace. Otherwise, the symbols get
exported for all the kernel to see, and the corresponding
MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING") in the tests is
meaningless.

Fixes: 2eb9982ff179 ("drm/i915/kunit: Export link training and caps funcs for testing")
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c     | 6 ++++--
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 98657aa4d3d5..abec3e2519ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -3,6 +3,8 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <kunit/visibility.h>
+
 #include <linux/bitops.h>
 #include <linux/debugfs.h>
 #include <linux/log2.h>
@@ -1302,14 +1304,14 @@ void intel_dp_link_caps_cleanup(struct intel_dp_link_caps *link_caps)
 const struct intel_dp_link_caps_test_ops i915_display_dp_link_caps_test_ops = {
 	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
 };
-EXPORT_SYMBOL(i915_display_dp_link_caps_test_ops);
+EXPORT_SYMBOL_IF_KUNIT(i915_display_dp_link_caps_test_ops);
 
 #else
 
 const struct intel_dp_link_caps_test_ops intel_display_dp_link_caps_test_ops = {
 	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
 };
-EXPORT_SYMBOL(intel_display_dp_link_caps_test_ops);
+EXPORT_SYMBOL_IF_KUNIT(intel_display_dp_link_caps_test_ops);
 
 #endif	/* I915 */
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index cb92cff90614..9a692f4fdfee 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -2825,14 +2825,14 @@ void intel_dp_link_training_cleanup(struct intel_dp_link_training *link_training
 const struct intel_dp_link_training_test_ops i915_display_dp_link_training_test_ops = {
 	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
 };
-EXPORT_SYMBOL(i915_display_dp_link_training_test_ops);
+EXPORT_SYMBOL_IF_KUNIT(i915_display_dp_link_training_test_ops);
 
 #else
 
 const struct intel_dp_link_training_test_ops intel_display_dp_link_training_test_ops = {
 	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
 };
-EXPORT_SYMBOL(intel_display_dp_link_training_test_ops);
+EXPORT_SYMBOL_IF_KUNIT(intel_display_dp_link_training_test_ops);
 
 #endif	/* I915 */
 
-- 
2.47.3

