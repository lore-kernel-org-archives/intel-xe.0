Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC59606A326
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NrcMFKCE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1F910E092;
	Sat,  7 Nov 2026 17:27:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E65F10E659
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Nov 2026 17:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794072469; x=1825608469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CHj5jBI0CoOHwdIMnGAbBbDi9TeHwXg9j5DiQICAewo=;
 b=NrcMFKCE8aPqxDK1Fvr2dzIMcy+c1oCezPQChQsCJUX4b42/NQ/tcz2l
 mQ7VDNteOi5zQTCGRNJn4IGbbM74PudXiivj7V+xf1KOx4volFLYnDXVc
 FZ+M+uVZgBQtLhOT1KMz5woSn7ecPXVvdwEDcsoawwvJqVTZBAIGjT+FP
 NNGynXwzR9wM8JRVjoQm5qnn49FxJgYg5murFEAe/UFXwBJETKzB0/M6U
 NydbtstBQeguBdsTNhO0yGwIXhIMkbDiCLllZ1H4ag2+0J+EtIH9RBBsx
 bp2AZrCBG1DMOBGA7yT/hsjj32HxSGYBfIgYoTSycG5oqq8y3SeBSZvXI w==;
X-CSE-ConnectionGUID: eN0gp55+QLCl4kEjiAQaHQ==
X-CSE-MsgGUID: Gms0jvKqReWtMqLSlJbT8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2901542"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2901542"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2026 09:27:45 -0800
X-CSE-ConnectionGUID: BVktYB5bRHyaoLLkuplT7Q==
X-CSE-MsgGUID: rJkOYOJvRqCaPseHRIqVbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9382480"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2026 09:27:44 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 2/3] drm/xe: Exclude imported dma-buf BOs from the TT budget
Date: Sat,  7 Nov 2026 17:26:51 +0000
Message-ID: <20261107-oom-fun-v1-2-be9eb05b82ed@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
References: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

The TT ("system") resource manager budget is sized to total host RAM
and enforced in xe_ttm_sys_mgr_new(). Imported dma-buf BOs
(ttm_bo_type_sg) placed in XE_PL_TT are backed by external pages and
never allocate from this device's TTM pool, so they consume no host
RAM. Charging them against the host-RAM-sized budget can falsely trip
it (e.g. many peer mappings on multi-GPU systems), surfacing as a
spurious -ENOSPC/OOM while memory is actually free.

Track the bytes of ttm_bo_type_sg BOs in a new per-device counter,
mem.sys_mgr_sg_usage, and subtract it from the usage compared against
the budget. The counter is maintained in xe_ttm_sys_mgr_new() and
xe_ttm_sys_mgr_del().

v2 (Matt, Sashiko)
  - Use a separate charged counter instead of subtracting import usage
    from the manager usage, avoiding an unsigned underflow race.
  - Don't dereference the BO in the free path, since the resource may
    have been transferred to a ghost object by then.
  - Make the memory region query report the charged usage.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_query.c        |  3 ++-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  | 38 ++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h  |  3 +++
 4 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d99881c6e1d5..c70f17ca8bba 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -298,6 +298,12 @@ struct xe_device {
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
index dc975f595368..ab3a4ca79e75 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -27,6 +27,7 @@
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
2.56.0
