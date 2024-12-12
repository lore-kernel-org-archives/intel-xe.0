Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75588E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEBA10ECA7;
	Thu, 12 Dec 2024 01:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WmjCPXOT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE7210ECA3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965328; x=1765501328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J2lzLkF2wwDPe8iJAyoufmaRe7WOFXNLGSpA6iE+p+w=;
 b=WmjCPXOTApnOGuySG4EPJZLIVdaWtiLh//0iVYEcCL5fXfJ695q1gg3k
 BMXNijuwUkrqMQ3iCXUMWD0JoFbeh2O0VaMPDB8X6+ggz5GTRlx06Ff7l
 bJ/PpEznfUZNT4rCkj/omrG2YulAyaEh29liIr32uVe0L1M4MIt/nFey5
 eUaO86YXnQrpjX9caYDLSkEDTU+ZAdRX4wNmZ1CTXww/YrJF+AuFpTL5P
 dNgkkmdGDFA1+e6qcHeTOjsgUiVyN5ButefjBTnrZgQ4H6GKMYUQSxKn5
 XIsXlaGu6zscyPc7LvojSIQ1w1kAiChqDBTtlb3/XXSYgKeqwN6d5ZyK+ g==;
X-CSE-ConnectionGUID: SsD3dR1sTAmw9CeBxvL4UQ==
X-CSE-MsgGUID: KOQQdwLzRxadkR1piWz7ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379799"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379799"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:08 -0800
X-CSE-ConnectionGUID: lBPOZdAnRsSSiqb0vUumJw==
X-CSE-MsgGUID: 0loGKSY9TdK9YwmxubJ51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856582"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:07 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 08/13] drm/xe/sa: Allow creating suballocator with custom
 guard size
Date: Thu, 12 Dec 2024 02:01:36 +0100
Message-Id: <20241212010141.389-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241212010141.389-1-michal.wajdeczko@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
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

Actual xe_sa_manager implementation uses hardcoded 4K to exclude
it from making suballocations but in upcoming patch we want to
reuse the xe_sa_manager where such 4K guard is not needed. Add
another variant of the xe_sa_bo_manager_init() function that
accepts arbitrary guard size.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 18 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_sa.h |  9 +++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index d92d9836fa91..94f05e704a43 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -32,14 +32,28 @@ static void sa_bo_manager_fini_bo(void *arg)
 	sa_manager->bo = NULL;
 }
 
-struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
+/**
+ * __xe_sa_bo_manager_init() - Create and initialize the suballocator
+ * @tile: the &xe_tile where allocate
+ * @size: number of bytes to allocate
+ * @guard: number of bytes to exclude from suballocations
+ * @align: alignment for each suballocated chunk
+ *
+ * Prepares the suballocation manager for suballocations.
+ *
+ * Return: a pointer to the &xe_sa_manager or an ERR_PTR on failure.
+ */
+struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_sa_manager *sa_manager;
-	u32 managed_size = size - SZ_4K;
+	u32 managed_size;
 	struct xe_bo *bo;
 	int ret;
 
+	xe_tile_assert(tile, size > guard);
+	managed_size = size - guard;
+
 	sa_manager = drmm_kzalloc(&xe->drm, sizeof(*sa_manager), GFP_KERNEL);
 	if (!sa_manager)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index bf55d8c3b5eb..9328b38eff6a 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -5,6 +5,7 @@
 #ifndef _XE_SA_H_
 #define _XE_SA_H_
 
+#include <linux/sizes.h>
 #include <linux/types.h>
 #include "xe_sa_types.h"
 
@@ -12,10 +13,14 @@ struct dma_fence;
 struct xe_bo;
 struct xe_tile;
 
-struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align);
-
+struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
 struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
 
+static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
+{
+	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
+}
+
 static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size)
 {
 	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
-- 
2.47.1

