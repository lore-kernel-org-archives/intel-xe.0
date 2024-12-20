Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFEFE77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B70910F049;
	Fri, 20 Dec 2024 19:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Myt4N0Yx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1671010F049
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734723745; x=1766259745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UWR54koBGUWhm3Q0FhgMwwXo0JR2eejZkDw2ZTciXwI=;
 b=Myt4N0YxZtGDeilCffhsAIebOUn82SVXrVeqPA6C8W7bseMPRmVecbCL
 w38C7vXQRZLTwh2qJEbyiWa/vWBiiOvXGE0NY3wGWLzDNNhgf+bi25ZfY
 hpSgrDqMRus6/t5SIZmPa4L66K5G292noLgFFSbKbzfLdlJbuVTRi0VJj
 JiGsd572R66dT9ceeZpaB49qU+vHjFD1JUazKDNnUpAEMv/mvayMoRUZ+
 38UeGEnq0HIwz7xhpKa6a7P8SUAZwZZeL3CRWFuJHRmvkcPtgSSpC2yog
 DbdDHBaHSKCgYSPNwc4kzXseu67omKC9O4YG6vK0baObNTGy9C2YtINok A==;
X-CSE-ConnectionGUID: 4TTgxwjNTO2nSg5P7CPnFg==
X-CSE-MsgGUID: FoDBHg1eQs2//7BN5HWqrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38965219"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38965219"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:25 -0800
X-CSE-ConnectionGUID: 2KsMQKbkTIahji5nkht+IQ==
X-CSE-MsgGUID: wyfVfnDGTZ+5Ya+myuVgmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99075466"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:42:23 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 05/11] drm/xe/sa: Allow making suballocations using custom
 gfp flags
Date: Fri, 20 Dec 2024 20:41:58 +0100
Message-Id: <20241220194205.995-6-michal.wajdeczko@intel.com>
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

Actual xe_sa_manager implementation uses hardcoded GFP_KERNEL flag
during creation of suballocations but in upcoming patch we want to
reuse the xe_sa_manager in places where GFP_KERNEL is not allowed.
Add another variant of the xe_sa_bo_new() function that accepts
arbitrary gfp flags.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
v2: add kernel-doc for xe_sa_bo_new (Matt)
---
 drivers/gpu/drm/xe/xe_sa.c | 15 ++++++++++++---
 drivers/gpu/drm/xe/xe_sa.h | 19 +++++++++++++++++--
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 0e78ae46667e..5f89e32b0640 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -74,8 +74,17 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	return sa_manager;
 }
 
-struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
-				  unsigned int size)
+/**
+ * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags.
+ * @sa_manager: the &xe_sa_manager
+ * @size: number of bytes we want to suballocate
+ * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL.
+ *
+ * Try to make a suballocation of size @size.
+ *
+ * Return: a &drm_suballoc, or an ERR_PTR.
+ */
+struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp)
 {
 	/*
 	 * BB to large, return -ENOBUFS indicating user should split
@@ -84,7 +93,7 @@ struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
 	if (size > sa_manager->base.size)
 		return ERR_PTR(-ENOBUFS);
 
-	return drm_suballoc_new(&sa_manager->base, size, GFP_KERNEL, true, 0);
+	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
 }
 
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 4e96483057d7..a0341eafbe77 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -5,6 +5,7 @@
 #ifndef _XE_SA_H_
 #define _XE_SA_H_
 
+#include <linux/types.h>
 #include "xe_sa_types.h"
 
 struct dma_fence;
@@ -13,8 +14,22 @@ struct xe_tile;
 
 struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align);
 
-struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
-				  u32 size);
+struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
+
+/**
+ * xe_sa_bo_new() - Make a suballocation.
+ * @sa_manager: the &xe_sa_manager
+ * @size: number of bytes we want to suballocate
+ *
+ * Try to make a suballocation of size @size.
+ *
+ * Return: a &drm_suballoc, or an ERR_PTR.
+ */
+static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size)
+{
+	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
+}
+
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo,
 		   struct dma_fence *fence);
-- 
2.47.1

