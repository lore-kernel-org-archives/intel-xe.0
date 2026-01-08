Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4CBCF6AB6
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 10:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCAF10E6EC;
	Thu,  8 Jan 2026 10:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="O4IkV1bX";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AA410E6E6
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767867023;
 bh=7hg3+NFADoxFWyMBCy25EBZV35uxL43+IkwuuV3mjhM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O4IkV1bXQww5RprQDo0zDKdQ7RW9LoXI3aqcpeev4feiTDWJ9DPEcfl84ztYmzHL8
 Suc2l3vZxLQ2z5O/xs8n6VSijdwYVElVN9N4tUKETCpPY48i6NOuq2HrqdnxNT+4zx
 uKRCnf6cRvVqOmXNnG4IJ3niMVdMKSJeJs2yHG8TIceridjIDbG/7ojKpfme6yL0jj
 lqb9fjpOGSP4fyc1xTcKMDCVV9hZiSG8Xgach0GbfB9YP6/xKUNyU66yKM8OiZtJW2
 6XsuzuF0pMxjThw33+y07evaoAZ3IfN0JSzzKaKrCKMRkK9TtHVeZOcMaqs9pftjHz
 hkYgnTNmnjKZQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 7/7] drm/xe: Privatize xe_ggtt_node
Date: Thu,  8 Jan 2026 11:10:22 +0100
Message-ID: <20260108101014.579906-16-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108101014.579906-9-dev@lankhorst.se>
References: <20260108101014.579906-9-dev@lankhorst.se>
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

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt_types.h | 19 +------------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index e396f33e2c5c9..7d191c68629c6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -67,6 +67,24 @@
  * give us the correct placement for free.
  */
 
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
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 {
 	u64 pte = XE_PAGE_PRESENT;
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 5fd723ce81087..d82b71a198bc2 100644
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

