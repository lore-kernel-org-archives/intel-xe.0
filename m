Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46279C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 13:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79BD10E0AE;
	Thu, 22 Aug 2024 13:08:30 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E3910E0AE
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 13:08:29 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 47MD8FbJ1355458; Thu, 22 Aug 2024 16:08:16 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com,
 niranjana.vishwanathapura@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
Subject: [PATCH 4/5] drm/xe: memirq handler changes
Date: Thu, 22 Aug 2024 16:08:14 +0300
Message-ID: <20240822130815.1355437-5-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240822130815.1355437-1-ilia.levi@intel.com>
References: <20240822130815.1355437-1-ilia.levi@intel.com>
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
This handler also caters for the new "reports to engine instance 0" mode.
Use this handler from the VF use-case as well.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 31 ++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_memirq.h |  1 +
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index a1d4bc3f9e42..c388e480b5c8 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -383,6 +383,28 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
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
+	u16 offset = memirq->reports_to_e0 ? hwe->e0_irq_offset : hwe->irq_offset;
+	u16 instance = memirq->reports_to_e0 ? hwe->instance : 0;
+
+	struct iosys_map src_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+							    XE_MEMIRQ_SOURCE_OFFSET(instance));
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
@@ -410,13 +432,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
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
index 98e2b61ef973..8a9334482a9b 100644
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

