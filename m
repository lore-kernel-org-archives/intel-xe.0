Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC965C44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 11:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA4410E19B;
	Wed, 15 Jul 2026 11:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="jVIj1n71";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BC710EFA4;
 Wed, 15 Jul 2026 11:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784113508;
 bh=1qwaSV5biM9awAaPHMn1WDZ0oCBL7zyq3Tg7zloKrSI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jVIj1n718BaFoQJQIUVA7usUHtminWkmMMyrvDzGOwMWVgfNp1j4v7WXjXLO4PmOm
 ZrId6iUZoLegFVh5rMkr/t1TdQdH+MO26YOonSZqOUP5yyT9cgRTdXGK1ApFzrX1hj
 kbi1nI8qhFnMv6oVTabZ5Mc7aTNwZcyHn+KkQiyIcvgw0yk/GxugqXFhUAGM03nm3s
 hospQFSfwJY683rFOJT8UpPTqprlLuXkVbB1Bjhd81taK7tJvbSCMSLWTKuU46Wriv
 jq3CQmqVFRxgaencZnZlP6FdfkUOGTsggEj5V3QnoOwskti07qKufeEpvSt3NdjvYx
 EU1RSXbFXST9A==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 1/6] drm/xe/ggtt: Add xe_ggtt_insert_node_at
Date: Wed, 15 Jul 2026 13:05:52 +0200
Message-ID: <20260715110557.2172095-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715110557.2172095-1-dev@lankhorst.se>
References: <20260715110557.2172095-1-dev@lankhorst.se>
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

Create a new function xe_ggtt_insert_node_at() which will be used
for reserving the part of GGTT where the initial framebuffer was
allocated.

This will allow us to either take over the initial mapping, or
reserve it to have the newly allocated GGTT mapping not overwriting
the initial mapping, which would cause flickering.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 35 +++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477fc..c9f84db3bfecd 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -636,14 +636,17 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
 }
 
 /**
- * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_insert_node_at - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt into which the node should be inserted.
  * @size: size of the node
  * @align: alignment constrain of the node
+ * @start: Starting offset of range to insert node
+ * @end: Last offset for node insertion
  *
  * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
  */
-struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
+struct xe_ggtt_node *xe_ggtt_insert_node_at(struct xe_ggtt *ggtt, u32 size,
+					    u32 align, u64 start, u64 end)
 {
 	struct xe_ggtt_node *node;
 	int ret;
@@ -653,8 +656,19 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 		return node;
 
 	guard(mutex)(&ggtt->lock);
-	ret = xe_ggtt_insert_node_locked(node, size, align,
-					 DRM_MM_INSERT_HIGH);
+	if (start >= ggtt->start)
+		start -= ggtt->start;
+	else
+		start = 0;
+
+	/* Should never happen, but since we handle start, fail graciously for end */
+	if (end >= ggtt->start)
+		end -= ggtt->start;
+	else
+		end = 0;
+
+	ret = drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align,
+					  0, start, end, DRM_MM_INSERT_HIGH);
 	if (ret) {
 		ggtt_node_fini(node);
 		return ERR_PTR(ret);
@@ -663,6 +677,19 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 	return node;
 }
 
+/**
+ * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	return xe_ggtt_insert_node_at(ggtt, size, align, 0, ~0ULL);
+}
+
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
  * @node: the &xe_ggtt_node
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a695..69974da523f74 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -22,6 +22,8 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
 u64 xe_ggtt_start(struct xe_ggtt *ggtt);
 u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
+struct xe_ggtt_node *
+xe_ggtt_insert_node_at(struct xe_ggtt *ggtt, u32 size, u32 align, u64 start, u64 end);
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
 struct xe_ggtt_node *
-- 
2.53.0

