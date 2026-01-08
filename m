Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D536CD1D492
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 20:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960D510E7C6;
	Thu,  8 Jan 2026 20:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="lJ5KiOys";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCBA10E7C6
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 20:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767903936;
 bh=Tn+pDJV6SUuYI9rNrT8xQf/jNHZ0JsuQhY+NTOt4C0c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lJ5KiOysLk21nwGojlQdIzF0t4PB7ydkR27tfE180bMCBpuA24k3HO78rDtht3K08
 TqRfl2uWjSKFaoVZXBlK4WWCCdObM/9pXMm7Ga2RC2QZo4+hAd3uEE7paTtTh9teJM
 WZv8ekZEO5TAsZKXDs94XEG08TTmr6EXqs02TpBHtMEbAWlx+svjkqPh18F/m8bPyZ
 6KJrgOs6oA4V3BrjQZ3eBgZzJ57M2q0CT3KXLpuuycMuLgHR3v5rPlE7309JmUUdQj
 X1W+FH01DjLKkwExssV4LQI/SKGIa26VL9VzwXnWfjPudmoQU/gWTXUZd5t6wZ/A5m
 npudEBqXjMs4A==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW 03/12] drm/xe: Add xe_ggtt_node_addr() to avoid
 dereferencing xe_ggtt_node
Date: Thu,  8 Jan 2026 21:25:21 +0100
Message-ID: <20260108202531.671690-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108202531.671690-1-dev@lankhorst.se>
References: <20260108202531.671690-1-dev@lankhorst.se>
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

This function makes it possible to add an offset that is applied to
all xe_ggtt_node's, and hides the internals from all its users.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.h   |  8 +++++---
 drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8ab4474129c3d..c914ab719f20e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -9,6 +9,7 @@
 #include <drm/ttm/ttm_tt.h>
 
 #include "xe_bo_types.h"
+#include "xe_ggtt.h"
 #include "xe_macros.h"
 #include "xe_validation.h"
 #include "xe_vm_types.h"
@@ -252,13 +253,14 @@ static inline u32
 __xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
 {
 	struct xe_ggtt_node *ggtt_node = bo->ggtt_node[tile_id];
+	u64 offset;
 
 	if (XE_WARN_ON(!ggtt_node))
 		return 0;
 
-	XE_WARN_ON(ggtt_node->base.size > xe_bo_size(bo));
-	XE_WARN_ON(ggtt_node->base.start + ggtt_node->base.size > (1ull << 32));
-	return ggtt_node->base.start;
+	offset = xe_ggtt_node_addr(ggtt_node);
+	XE_WARN_ON(offset + xe_bo_size(bo) > (1ull << 32));
+	return offset;
 }
 
 static inline u32
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 6bb6dcb0419ad..7f45bcd0c56b0 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1185,3 +1185,14 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
 {
 	return ioread64(ggtt->gsm + (offset / XE_PAGE_SIZE));
 }
+
+/**
+ * xe_ggtt_node_addr - Get @node offset in GGTT.
+ * @node: &xe_ggtt_node
+ *
+ * Get the GGTT offset for allocated node.
+ */
+u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
+{
+	return node->base.start;
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 9adfc58edf581..76336a6296c45 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -61,4 +61,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
 u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16 pat_index);
 u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
 
+u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node);
+
 #endif
-- 
2.51.0

