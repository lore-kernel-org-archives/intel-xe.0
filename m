Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35AD1061B2A
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 00:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E7410E7F8;
	Tue, 31 Mar 2026 00:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3cUbTw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6F210E7F8
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 00:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774916989; x=1806452989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxUUvJ/jwQUfxM+xpsHjk9LMeBDgv2dyd166yMfkHNA=;
 b=N3cUbTw5nLf6UFFn9mGYkRZoRvrjeC74pmm/feUpTwY+19aPsJNOdkDY
 4EWcTQctl0JQUi+32LaZckDHRwafrMkUTUrCPA+PCe8XI+hEnAgqRpdL7
 5+dItZz14eJQ/imw0rUpHdLCXhtfERLCruVQovkLDUfRFkNW9/x0WP1Yc
 eNbSiA8njGtbECrGWYqyek7F5xPsF+Vkblk14RP+KBuSHfihaL+jx2jZ7
 BekkclptVNniSs8eqN+bw5Neheb2yWXoWA5v8j1nciD5hP8lXj+Aju5gy
 QWvluUE5bdD8gmzxoi2vvxqRGIn0xsrf6LB2a/ScGrVYk8NLVht4DO18c A==;
X-CSE-ConnectionGUID: 6HtsUa9/SYe8qLVpda+Baw==
X-CSE-MsgGUID: p7RK/bUFTlCfN2euBQPgDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86221195"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="86221195"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 17:29:48 -0700
X-CSE-ConnectionGUID: t36GymbYRUOZJSqytFH0ag==
X-CSE-MsgGUID: RmzmqNL9Q3adn5JrqPOfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="227821796"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 17:29:47 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v3] drm/xe: improve readability of debugfs info engine output
Date: Mon, 30 Mar 2026 17:29:44 -0700
Message-ID: <20260331002944.601231-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324212348.4142888-1-x.wang@intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
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

Also expose multi_lrc_engine_classes in the info output and print
per-GT engine capability data in a form that is easier to inspect
manually and simpler for userspace tests to consume.

This avoids requiring userspace to duplicate kernel mask decoding
logic when validating engine capabilities.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 44 ++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..9d1c388054e4 100644
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
 
+static void print_engine_class_mask(struct drm_printer *p, const char *label, u8 mask)
+{
+	drm_printf(p, "%s", label);
+	if (mask) {
+		for (enum xe_engine_class ec = 0; ec < XE_ENGINE_CLASS_MAX; ec++) {
+			if (mask & BIT(ec))
+				drm_printf(p, " %s", xe_hw_engine_class_to_str(ec));
+		}
+	} else {
+		drm_printf(p, " none");
+	}
+	drm_printf(p, "\n");
+}
+
+static void print_engine_mask(struct drm_printer *p, const char *label,
+			      struct xe_gt *gt, u64 mask)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	drm_printf(p, "%s", label);
+	if (mask) {
+		for_each_hw_engine(hwe, gt, id)
+			if (mask & BIT_ULL(id))
+				drm_printf(p, " %s", hwe->name);
+	} else {
+		drm_printf(p, " none");
+	}
+	drm_printf(p, "\n");
+}
+
 static int info(struct seq_file *m, void *data)
 {
 	struct xe_device *xe = node_to_xe(m->private);
@@ -88,13 +121,16 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
+	print_engine_class_mask(&p, "multi_lrc_engine_classes", xe->info.multi_lrc_mask);
 	for_each_gt(gt, xe, id) {
+		char label[40];
+
 		drm_printf(&p, "gt%d force wake %d\n", id,
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
-		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
-			   gt->info.engine_mask);
-		drm_printf(&p, "gt%d multi_queue_engine_class_mask 0x%x\n", id,
-			   gt->info.multi_queue_engine_class_mask);
+		snprintf(label, sizeof(label), "gt%d engines", id);
+		print_engine_mask(&p, label, gt, gt->info.engine_mask);
+		snprintf(label, sizeof(label), "gt%d multi_queue_engine_classes", id);
+		print_engine_class_mask(&p, label, gt->info.multi_queue_engine_class_mask);
 	}
 
 	return 0;
-- 
2.43.0

