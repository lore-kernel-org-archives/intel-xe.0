Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C138C44530
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF5310E9DA;
	Mon, 20 Jul 2026 16:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="lfwO3rL2";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F012710E9D3;
 Mon, 20 Jul 2026 16:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784564039;
 bh=JY6hjhhl0pLkhZnfXi+3FlGnf7O0uXVNLfuHLmBZ5RQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lfwO3rL2I6ZdA84bh1uwotiLzYC711w8H7STZo9WJxFTWHeQmI82jOcDD6IefOfps
 mVdGeLJBWQ6W86LnrXN3w+7Y+wuPWsuMo5iRIkXZDxpI65HW2juotopY19WIiJ9XrW
 MOUWbcSkqmPZVOJFVbEtZ9fqfZWn6pqgJb4q3RiL7oBffrj81pW3CX0PoELHnI/Uqt
 oTdFxLcUI5IWLQYBn3eDW51sb8ZqKMkxQ0CFZey3CuZfMGq0z1NaUNZ2ShbyjRl3Sm
 C9bAV49XBHTa8j9dCbk4E+2hDwhzAh6r+NV0n7M/509TpDPv368/HavphP/xK/Vzwa
 0vDid5LKkgo2Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [DO NOT REVIEW 01/11] drm/xe/ggtt: Add xe_ggtt_reserve_area
Date: Mon, 20 Jul 2026 18:14:53 +0200
Message-ID: <20260720161451.384968-14-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720161451.384968-13-dev@lankhorst.se>
References: <20260720161451.384968-13-dev@lankhorst.se>
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

Create a new function xe_ggtt_reserve_area() which will be used
for reserving the part of GGTT where the initial framebuffer was
allocated, while ensuring the reservation fits within mappable
GGTT boundaries.

This will allow us to either take over the initial mapping, or
reserve it to have the newly allocated GGTT mapping not overwriting
the initial mapping, which would cause flickering.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 69 +++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
 2 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477fc..50e5b174c7960 100644
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
+static struct xe_ggtt_node *xe_ggtt_insert_node_at(struct xe_ggtt *ggtt, u32 size,
+						   u32 align, u64 start, u64 end)
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
@@ -663,6 +677,53 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 	return node;
 }
 
+/**
+ * xe_ggtt_reserve_area - Ensure an area of the GGTT is reserved.
+ * @ggtt: the &xe_ggtt where the area should be reserved.
+ * @start: Starting offset of range to reserve
+ * @size: size of the reservation
+ *
+ * This function ensures the area of [start...start+size)
+ * is reserved, while taking care of any clipping due to start or start+size
+ * falling outside of the adressable GGTT. The size of the returned node may
+ * be smaller if part of the region falls outside the accessible GGTT, or a
+ * NULL node may be returned.
+ *
+ * Return: &xe_ggtt_node or NULL on success or a ERR_PTR on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_reserve_area(struct xe_ggtt *ggtt, u32 base, u32 size)
+{
+	u64 ggtt_start = xe_ggtt_start(ggtt), ggtt_end = ggtt_start + xe_ggtt_size(ggtt);
+
+	/* Completely truncated? */
+	if (base + size <= ggtt_start || base >= ggtt_end)
+		return NULL;
+
+	/* Partially truncated? */
+	if (base <= ggtt_start) {
+		size -= ggtt_start - base;
+		base = ggtt_start;
+	}
+
+	if (base + size >= ggtt_end)
+		size = ggtt_end - base;
+
+	return xe_ggtt_insert_node_at(ggtt, size, XE_PAGE_SIZE, base, base + size);
+}
+
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
index c864cc975a695..15e62ecec2287 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -22,6 +22,8 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
 u64 xe_ggtt_start(struct xe_ggtt *ggtt);
 u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
+struct xe_ggtt_node *
+xe_ggtt_reserve_area(struct xe_ggtt *ggtt, u32 base, u32 size);
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
 struct xe_ggtt_node *
-- 
2.53.0

