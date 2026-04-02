Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C946D6AAEE
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 16:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516E910E3A7;
	Thu,  2 Apr 2026 16:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8XftKbZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2E410E3A7
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775147401; x=1806683401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y32vEX4TAJW3P8064ykdlWfF45p2dQEwgR2FW12CakM=;
 b=E8XftKbZuNGhp0utbPfgF8buG40eozUftZgPyz8rsc1FCgnAbfn/fZCU
 SLP8Mkf0sKb9ONUQnVhC49C6wrFefz+L2s/k1pBgYp4K9PLZi+1mFbZXo
 4J3ZzloZcDwN3w4HUN5a0euEqUCjXWzWVLwh0M8aQZOjf1eHneZJOAKV6
 fvAL1RluDe8x5qBEstOlIMAAMKzV2XJB5oRQqiC9KyxheN4lU4aP837ZS
 WG9Yx95kM/MLqQi4ddIzTB8UV4fSZlGRDe9LG9qTXUN/Dw9ohq0Dg1Urz
 ikw3ZUzdHzA0Bp5+z5/IQ1k2KNDTSsXrUcLaSw33I6FEX+NJgA0VXlwfZ A==;
X-CSE-ConnectionGUID: QTf267arS3KdF3kCm26ZQw==
X-CSE-MsgGUID: dEtzkfQaSTu+EFNgdDb+bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93605229"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93605229"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 09:30:01 -0700
X-CSE-ConnectionGUID: 0Y7d/usxSSGhOklq6yK4tg==
X-CSE-MsgGUID: IxorLT1zSZG3kjRXJmhjCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="226975423"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa008.jf.intel.com with ESMTP; 02 Apr 2026 09:30:00 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v5 1/2] drm/xe: improve readability of debugfs engine info
 output
Date: Thu,  2 Apr 2026 09:29:57 -0700
Message-ID: <20260402162958.16924-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402162958.16924-1-x.wang@intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
 <20260402162958.16924-1-x.wang@intel.com>
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

