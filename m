Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34978CD3427
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 14:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01A510E307;
	Mon,  2 Sep 2024 14:08:43 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE50610E305
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 14:08:41 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 482E8QnV2526278; Mon, 2 Sep 2024 17:08:29 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, matthew.brost@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v3 4/4] drm/xe: memirq handler changes
Date: Mon,  2 Sep 2024 17:08:26 +0300
Message-ID: <20240902140826.2526259-5-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240902140826.2526259-1-ilia.levi@intel.com>
References: <20240902140826.2526259-1-ilia.levi@intel.com>
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

This patch exposes an interrupt processing handler for a single hw engine.
This handler also caters for the MSI-X mode, where the hardware engines
report interrupt source and status to the offset of engine instance zero.
Refactored code to use this handler from the VF use-case as well.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 19 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_memirq.c    | 31 ++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_memirq.h    |  1 +
 3 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c9c3beb3ce8d..1b8c8a24916c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -460,6 +460,20 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
 }
 
+static const struct engine_info *find_engine_info(enum xe_engine_class class, int instance)
+{
+	const struct engine_info *info;
+	enum xe_hw_engine_id id;
+
+	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
+		info = &engine_infos[id];
+		if (info->class == class && info->instance == instance)
+			return info;
+	}
+
+	return NULL;
+}
+
 static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 				 enum xe_hw_engine_id id)
 {
@@ -479,7 +493,10 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->class = info->class;
 	hwe->instance = info->instance;
 	hwe->mmio_base = info->mmio_base;
-	hwe->irq_offset = info->irq_offset;
+	/* For MSI-X, hw engines report to offset of engine instance zero */
+	hwe->irq_offset = xe_device_has_msix(gt_to_xe(gt)) ?
+		find_engine_info(info->class, 0)->irq_offset :
+		info->irq_offset;
 	hwe->domain = info->domain;
 	hwe->name = info->name;
 	hwe->fence_irq = &gt->fence_irq[info->class];
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 5cbc366b2eea..b743d4eedd3d 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -398,6 +398,28 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
 		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
 }
 
+/**
+ * xe_memirq_hwe_handler - Check and process interrupts for a specific HW engine.
+ * @memirq: the &xe_memirq
+ * @hwe: the hw engine to process
+ *
+ * This function reads and dispatches `Memory Based Interrupts` for the provided HW engine.
+ */
+void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
+{
+	u16 offset = hwe->irq_offset;
+	u16 instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;
+	struct iosys_map src_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+							    XE_MEMIRQ_SOURCE_OFFSET(instance));
+
+	if (memirq_received(memirq, &src_offset, offset, "SRC")) {
+		struct iosys_map status_offset =
+			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+					      XE_MEMIRQ_STATUS_OFFSET(instance) + offset * SZ_16);
+		memirq_dispatch_engine(memirq, &status_offset, hwe);
+	}
+}
+
 /**
  * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
  * @memirq: the &xe_memirq
@@ -425,13 +447,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 		if (gt->tile != tile)
 			continue;
 
-		for_each_hw_engine(hwe, gt, id) {
-			if (memirq_received(memirq, &memirq->source, hwe->irq_offset, "SRC")) {
-				map = IOSYS_MAP_INIT_OFFSET(&memirq->status,
-							    hwe->irq_offset * SZ_16);
-				memirq_dispatch_engine(memirq, &map, hwe);
-			}
-		}
+		for_each_hw_engine(hwe, gt, id)
+			xe_memirq_hwe_handler(memirq, hwe);
 	}
 
 	/* GuC and media GuC (if present) must be checked separately */
diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
index 2934f03cfbb5..26fc116ad555 100644
--- a/drivers/gpu/drm/xe/xe_memirq.h
+++ b/drivers/gpu/drm/xe/xe_memirq.h
@@ -20,6 +20,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
 
 void xe_memirq_reset(struct xe_memirq *memirq);
 void xe_memirq_postinstall(struct xe_memirq *memirq);
+void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
 void xe_memirq_handler(struct xe_memirq *memirq);
 
 int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
-- 
2.43.2

