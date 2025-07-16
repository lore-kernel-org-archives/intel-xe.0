Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE047C83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 21:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D5710E089;
	Wed, 16 Jul 2025 21:23:30 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E5288284
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 21:23:30 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 1/2] drm/xe: Export xe_irq_synchronize and use it in display
Date: Wed, 16 Jul 2025 23:23:17 +0200
Message-ID: <20250716212318.239017-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250716212318.239017-1-dev@lankhorst.se>
References: <20250716212318.239017-1-dev@lankhorst.se>
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

Use the same helper instead of calling synchronize_irq() directly,
this makes the next patch possible.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c |  3 ++-
 drivers/gpu/drm/xe/xe_irq.c               | 13 +++++++++----
 drivers/gpu/drm/xe/xe_irq.h               |  1 +
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index 3c6bca66ddab6..259b8ee7a0ccf 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -6,6 +6,7 @@
 #include "i915_irq.h"
 #include "i915_reg.h"
 #include "intel_uncore.h"
+#include "xe_irq.h"
 
 void gen2_irq_reset(struct intel_uncore *uncore, struct i915_irq_regs regs)
 {
@@ -81,5 +82,5 @@ bool intel_irqs_enabled(struct xe_device *xe)
 
 void intel_synchronize_irq(struct xe_device *xe)
 {
-	synchronize_irq(to_pci_dev(xe->drm.dev)->irq);
+	xe_irq_synchronize(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5df5b8c2a3e4d..98d4062df2462 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -786,15 +786,20 @@ static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
 	synchronize_irq(to_pci_dev(xe->drm.dev)->irq);
 }
 
-void xe_irq_suspend(struct xe_device *xe)
+void xe_irq_synchronize(struct xe_device *xe)
 {
-	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
-
-	/* flush irqs */
 	if (xe_device_has_msix(xe))
 		xe_irq_msix_synchronize_irq(xe);
 	else
 		xe_irq_msi_synchronize_irq(xe);
+}
+
+void xe_irq_suspend(struct xe_device *xe)
+{
+	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
+
+	/* flush irqs */
+	xe_irq_synchronize(xe);
 	xe_irq_reset(xe); /* turn irqs off */
 }
 
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index a28bd577ba52a..9af66d4f18723 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -18,6 +18,7 @@ int xe_irq_init(struct xe_device *xe);
 int xe_irq_install(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
+void xe_irq_synchronize(struct xe_device *xe);
 void xe_irq_enable_hwe(struct xe_gt *gt);
 int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
 			    const char *name, bool dynamic_msix, u16 *msix);
-- 
2.45.2

