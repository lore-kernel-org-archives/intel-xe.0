Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE7ED1A62D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 13:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320B110E8D5;
	Fri,  9 Jan 2026 13:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Ep4F9O6D";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5166A10E8D7
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 13:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767965877;
 bh=l+lWfkbo3bRef7s0QJAIWWviBuPgrQbSYbxtS/zvirY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ep4F9O6DuuKlYmJEu2K6xriJtBxCRE4KB//G4Qr3Db3TYfFgBQlzNyMaaA3N9k77F
 mSXfJ1V6odAoPQAUcBOVR463DqB8MuQ3qSXbmI+N4mhKKeNuO3+HXw/5d3UwpwXcAm
 j5jfI6LJiuXh/kwiizgnGhBw5uc7+1Ku0GeHeJRn0+doxEYo8oz/AMTsPjuX2EBDQO
 JfPERFN9XBOZbjcinPFMsbFrHQYSJH9ILTnei7KQPNyqHQI886TWje/ytXCd/PtOqX
 48HLrQl4mY+MqoKlQWpTC7TRfHWgXryLlynC7gTZ6zUPO1DafU5LV5nW+h7gfR+SBE
 dRbZy3060uZxA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW-v3 10/12] drm/xe: Move struct xe_ggtt to
 xe_ggtt.c
Date: Fri,  9 Jan 2026 14:37:43 +0100
Message-ID: <20260109133746.739923-11-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260109133746.739923-1-dev@lankhorst.se>
References: <20260109133746.739923-1-dev@lankhorst.se>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

No users left outside of xe_ggtt.c, so we can make the struct private.

This prevents us from accidentally touching it before init.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 55 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h       |  1 +
 drivers/gpu/drm/xe/xe_ggtt_types.h | 60 +-----------------------------
 3 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index d8ffba5144d5f..dee41ad79a4cf 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -85,6 +85,61 @@ struct xe_ggtt_node {
 	bool invalidate_on_remove;
 };
 
+/**
+ * struct xe_ggtt_pt_ops - GGTT Page table operations
+ * Which can vary from platform to platform.
+ */
+struct xe_ggtt_pt_ops {
+	/** @pte_encode_flags: Encode PTE flags for a given BO */
+	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
+
+	/** @ggtt_set_pte: Directly write into GGTT's PTE */
+	xe_ggtt_set_pte_fn ggtt_set_pte;
+
+	/** @ggtt_get_pte: Directly read from GGTT's PTE */
+	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
+};
+
+/**
+ * struct xe_ggtt - Main GGTT struct
+ *
+ * In general, each tile can contains its own Global Graphics Translation Table
+ * (GGTT) instance.
+ */
+struct xe_ggtt {
+	/** @tile: Back pointer to tile where this GGTT belongs */
+	struct xe_tile *tile;
+        /** @start: Start offset of GGTT */
+	u64 start;
+	/** @size: Total usable size of this GGTT */
+	u64 size;
+
+#define XE_GGTT_FLAGS_64K BIT(0)
+	/**
+	 * @flags: Flags for this GGTT
+	 * Acceptable flags:
+	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
+	 */
+	unsigned int flags;
+	/** @scratch: Internal object allocation used as a scratch page */
+	struct xe_bo *scratch;
+	/** @lock: Mutex lock to protect GGTT data */
+	struct mutex lock;
+	/**
+	 *  @gsm: The iomem pointer to the actual location of the translation
+	 * table located in the GSM for easy PTE manipulation
+	 */
+	u64 __iomem *gsm;
+	/** @pt_ops: Page Table operations per platform */
+	const struct xe_ggtt_pt_ops *pt_ops;
+	/** @mm: The memory manager used to manage individual GGTT allocations */
+	struct drm_mm mm;
+	/** @access_count: counts GGTT writes */
+	unsigned int access_count;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
+};
+
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 {
 	u64 pte = XE_PAGE_PRESENT;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 49ea8e7ecc105..403eb5c0db49d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -9,6 +9,7 @@
 #include "xe_ggtt_types.h"
 
 struct drm_printer;
+struct xe_bo;
 struct xe_tile;
 struct drm_exec;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index d82b71a198bc2..cf754e4d502ad 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -6,72 +6,16 @@
 #ifndef _XE_GGTT_TYPES_H_
 #define _XE_GGTT_TYPES_H_
 
+#include <linux/types.h>
 #include <drm/drm_mm.h>
 
-#include "xe_pt_types.h"
-
-struct xe_bo;
+struct xe_ggtt;
 struct xe_ggtt_node;
-struct xe_gt;
-
-/**
- * struct xe_ggtt - Main GGTT struct
- *
- * In general, each tile can contains its own Global Graphics Translation Table
- * (GGTT) instance.
- */
-struct xe_ggtt {
-	/** @tile: Back pointer to tile where this GGTT belongs */
-	struct xe_tile *tile;
-	/** @start: Start offset of GGTT */
-	u64 start;
-	/** @size: Total usable size of this GGTT */
-	u64 size;
-
-#define XE_GGTT_FLAGS_64K BIT(0)
-	/**
-	 * @flags: Flags for this GGTT
-	 * Acceptable flags:
-	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
-	 */
-	unsigned int flags;
-	/** @scratch: Internal object allocation used as a scratch page */
-	struct xe_bo *scratch;
-	/** @lock: Mutex lock to protect GGTT data */
-	struct mutex lock;
-	/**
-	 *  @gsm: The iomem pointer to the actual location of the translation
-	 * table located in the GSM for easy PTE manipulation
-	 */
-	u64 __iomem *gsm;
-	/** @pt_ops: Page Table operations per platform */
-	const struct xe_ggtt_pt_ops *pt_ops;
-	/** @mm: The memory manager used to manage individual GGTT allocations */
-	struct drm_mm mm;
-	/** @access_count: counts GGTT writes */
-	unsigned int access_count;
-	/** @wq: Dedicated unordered work queue to process node removals */
-	struct workqueue_struct *wq;
-};
 
 typedef void (*xe_ggtt_set_pte_fn)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt,
 				     struct xe_ggtt_node *node,
 				     u64 pte_flags,
 				     xe_ggtt_set_pte_fn set_pte, void *arg);
-/**
- * struct xe_ggtt_pt_ops - GGTT Page table operations
- * Which can vary from platform to platform.
- */
-struct xe_ggtt_pt_ops {
-	/** @pte_encode_flags: Encode PTE flags for a given BO */
-	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
-
-	/** @ggtt_set_pte: Directly write into GGTT's PTE */
-	xe_ggtt_set_pte_fn ggtt_set_pte;
-
-	/** @ggtt_get_pte: Directly read from GGTT's PTE */
-	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
-};
 
 #endif
-- 
2.51.0

