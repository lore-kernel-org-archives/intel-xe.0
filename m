Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0678010FCADC
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 21:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A8910E105;
	Wed,  1 Apr 2026 21:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZnuuMVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E0410ED1D
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 21:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775078802; x=1806614802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SCKcPQulLwwDmBGxlykN3ml62U5oLzdTlzYyjyLY0J8=;
 b=hZnuuMVaWfUcbBH1dfxK2baJfU3u9DCjmVKNZhKvBlumzhZx6BRN/PYP
 /s/BK3NR0Pd/PssoLLVNFBeNmfb4uVYZtC42Y1YvldjzXNK8J3/OU5LOE
 BI8rTcexpA82cGMzrRWeMvppx4xctTZH0UFQaHC5oUJbluk5B/rjiQ8lz
 qHi5Mh/1dJZnP4+zYZTv1jfPNwjPsTe5kP9W3JO5ecN+lhrwwek85ZifT
 EMrpZlOh2TphXbpFUOgKf9aCuwaXt8wkHltDmeXbuJbY7WrYc4y5p9m/c
 iiyx68/APe0QZ0QPwQFBafGlvuQp7tNDq+7Po2sYuvFN7parD5IHCvzxg w==;
X-CSE-ConnectionGUID: JJKOaYUmTWWTwGlk+vdhng==
X-CSE-MsgGUID: oNM92/rJTJu5UdpYoYqCsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93520490"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="93520490"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 14:26:42 -0700
X-CSE-ConnectionGUID: RTXQBm6LSIeDjftMSqxtcg==
X-CSE-MsgGUID: WEAlFczRSoeHgcsRqIFGPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223498620"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa007.fm.intel.com with ESMTP; 01 Apr 2026 14:26:41 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v4 1/2] drm/xe: improve readability of debugfs engine info
 output
Date: Wed,  1 Apr 2026 14:26:36 -0700
Message-ID: <20260401212637.732424-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401212637.732424-1-x.wang@intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
 <20260401212637.732424-1-x.wang@intel.com>
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
to inspect manually and simpler for userspace tests to consume.

This avoids requiring userspace to duplicate kernel mask decoding
logic when validating engine capabilities.

Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 38 +++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..9986a0310c36 100644
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
@@ -61,6 +63,34 @@ static struct xe_device *node_to_xe(struct drm_info_node *node)
 	return to_xe_device(node->minor->dev);
 }
 
+static void print_engine_class_mask(struct drm_printer *p, u8 mask)
+{
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
+static void print_engine_mask(struct drm_printer *p, struct xe_gt *gt, u64 mask)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
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
@@ -91,10 +121,10 @@ static int info(struct seq_file *m, void *data)
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

