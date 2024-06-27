Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4010CC30653
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 12:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC51B10E11C;
	Thu, 27 Jun 2024 12:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="gNkptAMv";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F7C10E227
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 12:41:10 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719492076; bh=TzXj7STKoi8tCCa51cREH4BbaOjOq2WsrPe9Nb/Jmgk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gNkptAMvN/Xmzwa9N6KIrQu1TQnvRyPwesqf+dPGOVSgl5FQQvtOL6TRCUIOYy8Sd
 qFG1YoGQSQPSDhn0dBqUQAKrsTi54ElLgoeJ/leyX+EVExdl0LmraA+sYD4Ta2RdNZ
 NverPdku9wdLyUUIWZ9RqmAuh+iOEzU6davlZlPbbKJ3aN/CLtFsbm8gt1DWRCgFC6
 p96K2cCN+tosZsjxLJFIPM72hAfcYspAXRrcieXMRdCrbVr1TLER5Qt315ToCb9H+A
 10itf7ZxlKiOn1z+WPqCgeAS4KZM4G7nLOJ2OZtZbMbjmwn9SonOWHar68P92I7qE+
 ALsusSyaZHNtA==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 45RCewIS2923631
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 15:40:58 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45RCeweZ2923630; 
 Thu, 27 Jun 2024 15:40:58 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: dliberman@habana.ai, illevi@habana.ai, rodrigo.vivi@intel.com
Subject: [PATCH v2 3/8] drm/xe/irq: add hw engine irq handler
Date: Thu, 27 Jun 2024 15:40:38 +0300
Message-Id: <20240627124043.2923586-4-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627124043.2923586-1-dliberman@habana.ai>
References: <20240627124043.2923586-1-dliberman@habana.ai>
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

From: Ilia Levi <illevi@habana.ai>

Introduce a simplified MSIX IRQ handler for HW engines.

Rather than having a single handler for all kinds of interrupts, we
will allocate different MSIX IRQs which will map directly to the HW
engine that generated the interrupt.

This patch provides only the handler itself - its usage will be introduced
later.

Signed-off-by: Ilia Levi <illevi@habana.ai>
---
 drivers/gpu/drm/xe/xe_irq.c | 18 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_irq.h |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b552af53db2f..28173e946e77 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -821,7 +821,23 @@ void xe_irq_resume(struct xe_device *xe)
 		xe_irq_enable_hwe(gt);
 }
 
-static int xe_irq_alloc_msix(struct xe_device *xe, void *irq_buf, bool dynamic_msix, u32 *msix)
+/*
+ * This handles MI_USER_INTERRUPT.
+ * In MSI-X mode command streamers raise an interrupt only as a result of
+ * MI_USER_INTERRUPT and MI_FLUSH_DW_NOTIFY commands.
+ * Currently, there is no use-case for MI_FLUSH_DW_NOTIFY.
+ */
+irqreturn_t xe_irq_hwe_handler(int irq, void *arg)
+{
+	struct xe_hw_engine *hwe = arg;
+
+	xe_hw_engine_handle_irq(hwe, GT_RENDER_USER_INTERRUPT);
+
+	return IRQ_HANDLED;
+}
+
+static int xe_irq_alloc_msix(struct xe_device *xe, void *irq_buf,
+			     bool dynamic_msix, u32 *msix)
 {
 	struct xa_limit limit;
 	int ret = 0;
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 6529dff90f76..4ab63e61a062 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -19,5 +19,6 @@ void xe_irq_enable_hwe(struct xe_gt *gt);
 int xe_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf, const char *name,
 		   bool dynamic_msix, u32 *msix);
 void xe_free_irq(struct xe_device *xe, u32 msix);
+irqreturn_t xe_irq_hwe_handler(int irq, void *arg);
 
 #endif
-- 
2.34.1

