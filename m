Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58340C3DA62
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 07:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D845B10E9DA;
	Wed, 17 Jul 2024 07:33:39 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331E110E9C1
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 07:33:21 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46H7WN0u1135105; Wed, 17 Jul 2024 10:33:08 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, dliberman@habana.ai,
 niranjana.vishwanathapura@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v3 06/11] drm/xe/irq: add hw engine irq handler
Date: Wed, 17 Jul 2024 10:32:18 +0300
Message-ID: <20240717073223.1135072-7-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240717073223.1135072-1-ilia.levi@intel.com>
References: <20240717073223.1135072-1-ilia.levi@intel.com>
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

Introduce a simplified MSIX IRQ handler for HW engines.

Rather than having a single handler for all kinds of interrupts, we
will allocate different MSIX IRQs which will map directly to the HW
engine that generated the interrupt.

This patch provides only the handler itself - its usage will be introduced
later.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_irq.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2f17b85bf93c..31ddcbefe9a5 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -836,6 +836,23 @@ void xe_irq_resume(struct xe_device *xe)
 		xe_irq_enable_hwe(gt);
 }
 
+/**
+ * xe_irq_msix_hwe_handler - MSI-X IRQ handler for hw engines
+ * @irq: the irq raised
+ * @arg: the hw engine that raised the interrupt
+ *
+ * In MSI-X mode command streamers raise an interrupt only as a result of
+ * MI_USER_INTERRUPT and MI_FLUSH_DW_NOTIFY commands.
+ */
+irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg)
+{
+	struct xe_hw_engine *hwe = arg;
+
+	xe_memirq_hwe_handler(&gt_to_tile(hwe->gt)->memirq, hwe);
+
+	return IRQ_HANDLED;
+}
+
 static int xe_irq_alloc_msix(struct xe_device *xe, void *irq_buf, bool dynamic_msix, u16 *msix)
 {
 	struct xa_limit limit;
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 78d3321da6e3..94b32a780c68 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -19,5 +19,6 @@ void xe_irq_enable_hwe(struct xe_gt *gt);
 int xe_irq_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
 		       const char *name, bool dynamic_msix, u16 *msix);
 void xe_irq_free_irq(struct xe_device *xe, u16 msix);
+irqreturn_t xe_irq_msix_hwe_handler(int irq, void *arg);
 
 #endif
-- 
2.43.2

