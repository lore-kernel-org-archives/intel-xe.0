Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4437CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 13:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECB310EA64;
	Thu,  9 Oct 2025 13:52:35 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC4C10EA61
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 13:52:31 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 2/6] drm/mm: Introduce address space shifting
Date: Thu,  9 Oct 2025 15:52:21 +0200
Message-ID: <20251009135221.712384-10-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009135221.712384-8-dev@lankhorst.se>
References: <20251009135221.712384-8-dev@lankhorst.se>
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

From: Tomasz Lis <tomasz.lis@intel.com>

Due to resource reprovisioning, sometimes a need arises to move
a living address space to a new area, preserving all the nodes
and holes stored within.

It is possible to do that by removing all nodes to a temporary list,
reiniting the drm_mm instance and re-adding everything while applying
a shift to each node. But that is a lot of extra work for a task
which could be done internally without any node shuffle operations.

This change introduces an interface which allows to shift the range
without pruning the whole drm_mm instance.

Having a drm_mm interface for such shift significantly simplifies
the code required to adjust a KMD for a change in base address
of a space managed by drm_mm instance.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Link: https://lore.kernel.org/r/20250204224136.3183710-2-tomasz.lis@intel.com
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
 include/drm/drm_mm.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index ca254611b3823..ce3bd8b5e41f0 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -917,6 +917,30 @@ struct drm_mm_node *drm_mm_scan_color_evict(struct drm_mm_scan *scan)
 }
 EXPORT_SYMBOL(drm_mm_scan_color_evict);
 
+/**
+ * drm_mm_shift - move the range of addresses managed by this @mm
+ * @mm: the drm_mm structure instance to shift
+ * @shift: the shift value to be added to addresses of all nodes
+ *
+ * The function shifts all nodes by given offset, moving the address space
+ * range managed by this @mm.
+ */
+void drm_mm_shift(struct drm_mm *mm, s64 shift)
+{
+	struct drm_mm_node *node;
+
+	/*
+	 * Head node represents a hole, with negative size and start at the end
+	 * of addressable area. This means it is never present within nodes
+	 * list - needs to be shifted separately.
+	 */
+	mm->head_node.start += shift;
+
+	drm_mm_for_each_node(node, mm)
+		node->start += shift;
+}
+EXPORT_SYMBOL(drm_mm_shift);
+
 /**
  * drm_mm_init - initialize a drm-mm allocator
  * @mm: the drm_mm structure to initialize
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index f654874c4ce67..798e5a4f07add 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -465,6 +465,7 @@ static inline int drm_mm_insert_node(struct drm_mm *mm,
 void drm_mm_remove_node(struct drm_mm_node *node);
 void drm_mm_init(struct drm_mm *mm, u64 start, u64 size);
 void drm_mm_takedown(struct drm_mm *mm);
+void drm_mm_shift(struct drm_mm *mm, s64 shift);
 
 /**
  * drm_mm_clean - checks whether an allocator is clean
-- 
2.51.0

