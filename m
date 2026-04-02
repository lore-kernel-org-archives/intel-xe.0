Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867FBD6AAEC
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 18:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AFA10F08C;
	Thu,  2 Apr 2026 18:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="db0EkjdZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED8210F064
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 18:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775153164; x=1806689164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y32vEX4TAJW3P8064ykdlWfF45p2dQEwgR2FW12CakM=;
 b=db0EkjdZB7/iOrDVM2hG/dIBWp07EqtOfcKtYJn85gIW70nXAqTBGxJj
 rZUJqRvCKY52jzmDvOxgU2Ak3VRhnCvqjatoWPrzp/5LFFoSMmJsw98ZV
 9VWt9Ky3jCBfw0y00IRepoAHS0eiXqxxC4tVAj2FY+kJDlnkmZR1AY7ys
 Yy6x8YZxA+18hYuHZ4baZY8lo3JMk1fBlgrBGrzxO5lsCKsV+fzR3AwcD
 VnS0IM6kIQ81asWsC+u5hCTeKk6hrjBpJ3BKcLS/awmm/YGtsE5KeFg/s
 KQ0CrRXUgwJ+p8j5eAxOnB7YiemAEoelYOBWJdUAIZhgbN+3ZMdP9YXx7 g==;
X-CSE-ConnectionGUID: FtnpzIm6SiaXT7ekH9CNGQ==
X-CSE-MsgGUID: mOAUZJ8VS9ev05gY64vTPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76100739"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76100739"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 11:05:56 -0700
X-CSE-ConnectionGUID: VEBR6YLDTtm4dLFr5/CECg==
X-CSE-MsgGUID: 2jcFu5clRAKQA9tVLwmerg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="257527202"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa002.jf.intel.com with ESMTP; 02 Apr 2026 11:05:56 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v5 1/2] drm/xe: improve readability of debugfs engine info
 output
Date: Thu,  2 Apr 2026 11:05:50 -0700
Message-ID: <20260402180552.24121-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402180552.24121-1-x.wang@intel.com>
References: <20260402180552.24121-1-x.wang@intel.com>
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

Improve the readability of the info debugfs output by replacing
raw numeric engine masks with human-readable engine and class
names.

Also print per-GT engine capability data in a form that is easier
for a human to interpret directly, and as a side effect simpler
for IGT tests to use when validating engine capabilities.

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 41 +++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..490d7ef7e812 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -15,9 +15,11 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
+#include "xe_gt.h"
 #include "xe_gt_debugfs.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
+#include "xe_hw_engine.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_psmi.h"
@@ -61,6 +63,37 @@ static struct xe_device *node_to_xe(struct drm_info_node *node)
 	return to_xe_device(node->minor->dev);
 }
 
+static void print_engine_class_mask(struct drm_printer *p, u16 mask)
+{
+	if (!mask) {
+		drm_printf(p, " none\n");
+		return;
+	}
+
+	for (enum xe_engine_class ec = 0; ec < XE_ENGINE_CLASS_MAX; ec++) {
+		if (mask & BIT(ec))
+			drm_printf(p, " %s", xe_hw_engine_class_to_str(ec));
+	}
+	drm_printf(p, "\n");
+}
+
+static void print_engine_mask(struct drm_printer *p, struct xe_gt *gt, u64 mask)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	if (!mask) {
+		drm_printf(p, " none\n");
+		return;
+	}
+
+	for_each_hw_engine(hwe, gt, id) {
+		if (mask & BIT_ULL(id))
+			drm_printf(p, " %s", hwe->name);
+	}
+	drm_printf(p, "\n");
+}
+
 static int info(struct seq_file *m, void *data)
 {
 	struct xe_device *xe = node_to_xe(m->private);
@@ -91,10 +124,10 @@ static int info(struct seq_file *m, void *data)
 	for_each_gt(gt, xe, id) {
 		drm_printf(&p, "gt%d force wake %d\n", id,
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
-		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
-			   gt->info.engine_mask);
-		drm_printf(&p, "gt%d multi_queue_engine_class_mask 0x%x\n", id,
-			   gt->info.multi_queue_engine_class_mask);
+		drm_printf(&p, "gt%d engines", id);
+		print_engine_mask(&p, gt, gt->info.engine_mask);
+		drm_printf(&p, "gt%d multi_queue_engine_classes", id);
+		print_engine_class_mask(&p, gt->info.multi_queue_engine_class_mask);
 	}
 
 	return 0;
-- 
2.43.0

