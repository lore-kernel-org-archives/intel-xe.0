Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A325E7718B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D8A10F04D;
	Fri, 20 Dec 2024 19:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mX8sMS0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B75C10F04C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734723747; x=1766259747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IzBFw/n6gH3cc8Z3lRMsCLzsIZMHHIRoxHbcAVsyTTA=;
 b=mX8sMS0PpmHkg1LvrnMPezibTRbtR7I0djj/AZ9aCL43evWc6p0SHuXs
 lG/W3ySX+jbCW5BFM3KCbWZnSogEyyE5C03z4Fp0rCx5d194lhPbRhe4P
 mMkCByZGas0LAWKxc5HkwlmhkN5Q1pcQnSj/suwFWfIWD2ekdD2QN4CM8
 orxu6q5MIETp0OWmyzGgSk0sVwVK65P1AGFU1drIvZKgzAtqGnrDNdJrC
 f40mnCyarwJVmw8zM9BhrZiOSKtpUvV/R7hmyAs58ZqK0gjxE90FCle+v
 wcB4/GPiwj6JtR6JsUwwi/fkWd4bSEPU2ouFNrXD0HUXevM4NEiDbph0U g==;
X-CSE-ConnectionGUID: 7jjoiqvyQN2TDngKW/YkaQ==
X-CSE-MsgGUID: 3CqZrMmiTNWfSWPi/zF1oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38965220"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38965220"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:27 -0800
X-CSE-ConnectionGUID: fpy6nEkQRWuLlTh7Nzbq6A==
X-CSE-MsgGUID: eK/CI7a7QmaEJIVMyXZbdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99075477"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:25 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 06/11] drm/xe/sa: Allow creating suballocator with custom
 guard size
Date: Fri, 20 Dec 2024 20:41:59 +0100
Message-Id: <20241220194205.995-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241220194205.995-1-michal.wajdeczko@intel.com>
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 18 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_sa.h |  9 +++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 5f89e32b0640..f8fe61e25518 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -31,14 +31,28 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
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
index a0341eafbe77..de0330eb36d4 100644
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
 /**
  * xe_sa_bo_new() - Make a suballocation.
  * @sa_manager: the &xe_sa_manager
-- 
2.47.1

