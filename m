Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB1606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 03:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OM9EW2Ms
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728A110E00E;
	Fri, 27 Nov 2026 03:47:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D4D10E00E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 03:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795751240; x=1827287240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xWIy6HmilNDnUO3wmzJoY0UiNWPEEbf+UWx0piOMqp8=;
 b=OM9EW2MsODwFyhRdOh6PDkICA8MVmgwfasLjxFMpfCuX/6k5VJXLbMIF
 b+c5w7PCcRIhfm+w0KwlPwwWR4NCtOYi6Fq3JT1QbZM1zar1RIY49DOjr
 hkt3cwEowqkt5U2uX6imzWMUfBv7oDsi2xutkBHTf22E1o2dJj96OUIsg
 QzznI11mP/20elJJRunAIGQqaaP1JmS6Q6TlnXZhGjNR/a0zWLdPDp68X
 xqOOcmBgc9SPUYmvwJXdtwZHcdsoH099qXlhxh2X8sUwM3bHXY79Jzvob
 tqhYB9EecZBeKXRuSdgifECJu5jiFri9HTp2+uCzy4Wg+7nfeMP4p6KCf w==;
X-CSE-ConnectionGUID: dUUPzOkhRtSMUpViX3Z0pQ==
X-CSE-MsgGUID: PSfwqYSsSSa7znWDOaDvMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4747478"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4747478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 19:47:19 -0800
X-CSE-ConnectionGUID: sxhFQ33kSxiPml12NbzRjg==
X-CSE-MsgGUID: adnnOPikSvyA94PeHTqyxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12298387"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2026 19:47:18 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Exclude imported dma-buf BOs from the TT budget
Date: Fri, 27 Nov 2026 09:22:02 +0530
Message-ID: <20261127035202.2792551-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Imported dma-bufs (ttm_bo_type_sg) use external pages, not host RAM,
so they should not count against the TT budget. Count only
non-imported BOs in a new mem.sys_mgr_charged counter and check the
budget against it. The memory region query reports the same value.

v2 (Matt, Sashiko)
  - Use a separate charged counter instead of subtracting import usage
    from the manager usage, avoiding an unsigned underflow race.
  - Don't dereference the BO in the free path, since the resource may
    have been transferred to a ghost object by then.
  - Make the memory region query report the charged usage.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Co-developed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  6 +++++
 drivers/gpu/drm/xe/xe_query.c        |  3 ++-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  | 38 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h  |  3 +++
 4 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9e0d7d3d07d5..450bfe07b1da 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -301,6 +301,12 @@ struct xe_device {
 		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/**
+		 * @mem.sys_mgr_charged: bytes charged against the @mem.sys_mgr
+		 * budget. Excludes imported dma-bufs (e.g. peer-GPU VRAM mapped
+		 * for P2P), which consume no local system memory.
+		 */
+		atomic64_t sys_mgr_charged;
 		/** @mem.shrinker: system memory shrinker. */
 		struct xe_shrinker *shrinker;
 		/** @mem.stolen_mgr: stolen memory manager. */
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9cc35fc83954..06e1aa6fe128 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -26,6 +26,7 @@
 #include "xe_mmio.h"
 #include "xe_oa.h"
 #include "xe_pxp.h"
+#include "xe_ttm_sys_mgr.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
 #include "xe_wa.h"
@@ -278,7 +279,7 @@ static int query_mem_regions(struct xe_device *xe,
 	mem_regions->mem_regions[0].instance = 0;
 	mem_regions->mem_regions[0].min_page_size = PAGE_SIZE;
 	mem_regions->mem_regions[0].total_size = man->size << PAGE_SHIFT;
-	mem_regions->mem_regions[0].used = ttm_resource_manager_usage(man);
+	mem_regions->mem_regions[0].used = xe_ttm_sys_mgr_usage(xe);
 	mem_regions->num_mem_regions = 1;
 
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9d77ba605aec..24e2c690d992 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -16,9 +16,15 @@
 
 struct xe_ttm_sys_node {
 	struct ttm_buffer_object *tbo;
+	bool charged;
 	struct ttm_range_mgr_node base;
 };
 
+static atomic64_t *to_charged_usage(struct ttm_resource_manager *man)
+{
+	return &container_of(man, struct xe_device, mem.sys_mgr)->mem.sys_mgr_charged;
+}
+
 static inline struct xe_ttm_sys_node *
 to_xe_ttm_sys_node(struct ttm_resource *res)
 {
@@ -40,10 +46,21 @@ static int xe_ttm_sys_mgr_new(struct ttm_resource_manager *man,
 	node->tbo = tbo;
 	ttm_resource_init(tbo, place, &node->base.base);
 
-	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
-	    ttm_resource_manager_usage(man) > (man->size << PAGE_SHIFT)) {
-		r = -ENOSPC;
-		goto err_fini;
+	/*
+	 * Imported dma-bufs are backed by the exporter (possibly peer VRAM),
+	 * so don't charge them against the local system memory budget.
+	 */
+	if (tbo->type != ttm_bo_type_sg) {
+		u64 size = node->base.base.size;
+		u64 usage = atomic64_add_return(size, to_charged_usage(man));
+
+		if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
+		    usage > (man->size << PAGE_SHIFT)) {
+			atomic64_sub(size, to_charged_usage(man));
+			r = -ENOSPC;
+			goto err_fini;
+		}
+		node->charged = true;
 	}
 
 	node->base.mm_nodes[0].start = 0;
@@ -65,6 +82,8 @@ static void xe_ttm_sys_mgr_del(struct ttm_resource_manager *man,
 {
 	struct xe_ttm_sys_node *node = to_xe_ttm_sys_node(res);
 
+	if (node->charged)
+		atomic64_sub(res->size, to_charged_usage(man));
 	ttm_resource_fini(man, res);
 	kfree(node);
 }
@@ -117,3 +136,14 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	ttm_resource_manager_set_used(man, true);
 	return drmm_add_action_or_reset(&xe->drm, xe_ttm_sys_mgr_fini, xe);
 }
+
+/**
+ * xe_ttm_sys_mgr_usage() - System memory charged against the TT budget
+ * @xe: The xe device.
+ *
+ * Return: Bytes of system memory in use, excluding imported dma-bufs.
+ */
+u64 xe_ttm_sys_mgr_usage(struct xe_device *xe)
+{
+	return atomic64_read(&xe->mem.sys_mgr_charged);
+}
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
index e8f5cd395b28..0b4678a05986 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
@@ -6,8 +6,11 @@
 #ifndef _XE_TTM_SYS_MGR_H_
 #define _XE_TTM_SYS_MGR_H_
 
+#include <linux/types.h>
+
 struct xe_device;
 
 int xe_ttm_sys_mgr_init(struct xe_device *xe);
+u64 xe_ttm_sys_mgr_usage(struct xe_device *xe);
 
 #endif
-- 
2.43.0

