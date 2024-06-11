Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C72C27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 16:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2E410E69A;
	Tue, 11 Jun 2024 16:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNsrwmWc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BC310E69A
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718122093; x=1749658093;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5b1ZkcFt0P0ocMUUdikIFBX8xs1DXTKmomecUlWLR8E=;
 b=eNsrwmWcmtcFuLmuaEa1+GvEd7c18KLt6MoB2YgXKA9FXrJExD6w0JEA
 U05JMGOv/ELV5ubznKQANhEfe7oGoHVBYErDdJHeuxmHwGRL9E7Pvar86
 yaFGYog22SXyLTS1eXas7Y6Ac1FFxiQBAvngl44abUjSnwKF+5v7TqE5P
 Tn67Dkd1/GKTvEamkubOHH+NIVbxezfx78qYtil+a1sIcCgvdZU0NSRDO
 V5S8cKtvAApD57KNG9kNIehjvBf3Hu6XsNxBrLgZBrc6s2mSvzwZQvL9c
 MAk46xy36FXfI7lV5KSVoFGxNQgkfGrVlZ9y2b6GACD5X1Jnja43bMs0n A==;
X-CSE-ConnectionGUID: AWFFPcf1QTe8f/GmQ4yq/A==
X-CSE-MsgGUID: xV0oKBViT/K6OJkTj7DWZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14969728"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14969728"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:08:12 -0700
X-CSE-ConnectionGUID: ODpmpltNRZ+jAtRJcy6acA==
X-CSE-MsgGUID: K8mCMDDXSsCACxB9vhYjAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39950063"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:08:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe: Add xe_gt_clock_interval_to_ms helper
Date: Tue, 11 Jun 2024 09:08:46 -0700
Message-Id: <20240611160846.2812036-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add helper to convert GT clock ticks to msec. Useful for determining if
timeouts occur by examing GT clock ticks.

v6:
- s/nom/n , s/dom/d (Jonathan)
- include math64 (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_clock.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 9ff2061133df..86c2d62b4bdc 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -3,6 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <linux/math64.h>
+
 #include "xe_gt_clock.h"
 
 #include "regs/xe_gt_regs.h"
@@ -79,3 +81,21 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	gt->info.reference_clock = freq;
 	return 0;
 }
+
+static u64 div_u64_roundup(u64 n, u32 d)
+{
+	return div_u64(n + d - 1, d);
+}
+
+/**
+ * xe_gt_clock_interval_to_ms - Convert sampled GT clock ticks to msec
+ *
+ * @gt: the &xe_gt
+ * @count: count of GT clock ticks
+ *
+ * Returns: time in msec
+ */
+u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
+{
+	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
index 44fa0371b973..3adeb7baaca4 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.h
+++ b/drivers/gpu/drm/xe/xe_gt_clock.h
@@ -11,5 +11,6 @@
 struct xe_gt;
 
 int xe_gt_clock_init(struct xe_gt *gt);
+u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
 
 #endif
-- 
2.34.1

