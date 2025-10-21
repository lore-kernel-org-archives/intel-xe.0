Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CE4CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC83610E5DE;
	Tue, 21 Oct 2025 12:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Ir3Eus0u";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEADF10E5DB
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761049110;
 bh=GI1rYcIVhIisj2LlHGsxkYb7OpVG5+DzIne+1lxJHT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ir3Eus0uNwRTD9SGgs2YoTQNv+3qeIECqFaHkvgPmlY+9pjrf7IYWnHEqvILW9ghf
 kepJFFN2+8GcTkAB7tBoqQqFN0vik9CnejFriDKYf5jeN1DE3ItVq6FqQqAl0kz6RL
 PlvooI2g8a/EnLmU8m1ELOTlrOJy4DBCbtHEgkYXXJMBXiagTj2duoJwgQU5NJeqEc
 3HMAVN0/N4/Y4zYNOsMf7P9ikSopCAjRNTF3lvAf6ZfV38PG+l6pUgU8JkHuYW2gnR
 V20dycnWRcA+bFMkxouONlXKgiKGUtScDt9/R1XzEreQp6cJmlJvIQ6lVRi9F1XUJ7
 WLIHDP5XmDK9w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 7/7] drm/xe: Privatize xe_ggtt_node
Date: Tue, 21 Oct 2025 14:18:21 +0200
Message-ID: <20251021121814.2193153-16-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021121814.2193153-9-dev@lankhorst.se>
References: <20251021121814.2193153-9-dev@lankhorst.se>
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

Nothing requires it any more, make the member private.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt_types.h | 19 +------------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 81038d94b497d..5c1880da3ffa4 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -34,6 +34,24 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+/**
+ * struct xe_ggtt_node - A node in GGTT.
+ *
+ * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
+ * insertion, reservation, or 'ballooning'.
+ * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
+ */
+struct xe_ggtt_node {
+	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
+	struct xe_ggtt *ggtt;
+	/** @base: A drm_mm_node */
+	struct drm_mm_node base;
+	/** @delayed_removal_work: The work struct for the delayed removal */
+	struct work_struct delayed_removal_work;
+	/** @invalidate_on_remove: If it needs invalidation upon removal */
+	bool invalidate_on_remove;
+};
+
 /**
  * DOC: Global Graphics Translation Table (GGTT)
  *
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index f4aa5671cb3e3..31054e00daa6b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -11,6 +11,7 @@
 #include "xe_pt_types.h"
 
 struct xe_bo;
+struct xe_ggtt_node;
 struct xe_gt;
 
 /**
@@ -53,24 +54,6 @@ struct xe_ggtt {
 	struct workqueue_struct *wq;
 };
 
-/**
- * struct xe_ggtt_node - A node in GGTT.
- *
- * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
- * insertion, reservation, or 'ballooning'.
- * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
- */
-struct xe_ggtt_node {
-	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
-	struct xe_ggtt *ggtt;
-	/** @base: A drm_mm_node */
-	struct drm_mm_node base;
-	/** @delayed_removal_work: The work struct for the delayed removal */
-	struct work_struct delayed_removal_work;
-	/** @invalidate_on_remove: If it needs invalidation upon removal */
-	bool invalidate_on_remove;
-};
-
 typedef void (*xe_ggtt_set_pte_fn)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt,
 				     struct xe_ggtt_node *node,
-- 
2.51.0

