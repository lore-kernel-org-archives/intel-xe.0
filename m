Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993C606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KrkRJJHh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C063B112780;
	Fri, 30 Oct 2026 11:50:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8292B11277D
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361008; x=1824897008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=56i1oHzpdRlsUc+qlVwW6vu5+bDgjETBZhNKtytiCbE=;
 b=KrkRJJHhfq3rvEcrOhDUJAQ735bR86tEcm1ktznhmUYMVDj7JIaqrtRB
 V1nsFiEZSE5NCh8KfDSMBuB/15I3ruxNMm7IesRvlHU2KdfAovd6NDEGh
 I/qYAdLyhDPVkP9DcCigRkNQolwyfR7aNMcXN83AS3/Y4WGOOOa3ktR3Y
 16AndHhXQlYiP5E7kIysr3dOONvJ178aX/OUIBHSdoTkOb0Z9xBWIrNPD
 Dzb+PDi0+2LAHV8Azs0UNB0Hnt+Eo3iHmc6wkxsdZjV4apb9Dv6P2Pwdq
 CKR/vezzs6UQ6NniArM4rAlKg6PSv9YaiQoqrSahBwwHoS+pWPssYuNU5 Q==;
X-CSE-ConnectionGUID: hrzC07+BSxaJNKOsDyh8KA==
X-CSE-MsgGUID: 55eWQCfqRXaR2Zri3Guudg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2135390"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2135390"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:06 -0700
X-CSE-ConnectionGUID: dq951EBrSxKWcFFOy988Kg==
X-CSE-MsgGUID: IQnZw/dvQd6DaLe3cVeCYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5441161"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.36])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 4/6] drm/xe/sa: allow callers to specify interruptible
 suballocator waits
Date: Fri, 30 Oct 2026 11:49:54 +0000
Message-ID: <20261030-migrate-bb-optimise-v1-4-b8d01649cfe9@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
References: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

__xe_sa_bo_new() currently hardcodes intr=true when calling
drm_suballoc_new(), making every suballocator wait interruptible even
when the caller cannot tolerate -ERESTARTSYS.

Plumb a bool intr parameter through __xe_sa_bo_new(), xe_sa_bo_new(),
and __xe_bb_new(), while defaulting xe_bb_new() to false for
kernel-internal callers.

Assisted-by: LLM
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c           | 4 ++--
 drivers/gpu/drm/xe/xe_bb.h           | 9 ++++++++-
 drivers/gpu/drm/xe/xe_guc_buf.c      | 4 ++--
 drivers/gpu/drm/xe/xe_page_reclaim.c | 2 +-
 drivers/gpu/drm/xe/xe_sa.c           | 6 ++++--
 drivers/gpu/drm/xe/xe_sa.h           | 9 ++++++---
 6 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 771e50e7c4e3..7f71233b1036 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -14,7 +14,7 @@
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 
-struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
+struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm, bool intr)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bb *bb = kmalloc_obj(*bb);
@@ -30,7 +30,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	 * reserved by xe_sa_bo_manager_init().
 	 */
 	bb->bo = xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt->usm.bb_pool,
-			      4 * (dwords + 1));
+			      4 * (dwords + 1), intr);
 	if (IS_ERR(bb->bo)) {
 		err = PTR_ERR(bb->bo);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index b5cc65506696..6f685176d4e8 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -6,6 +6,8 @@
 #ifndef _XE_BB_H_
 #define _XE_BB_H_
 
+#include <linux/types.h>
+
 #include "xe_bb_types.h"
 
 struct dma_fence;
@@ -14,7 +16,12 @@ struct xe_gt;
 struct xe_exec_queue;
 struct xe_sched_job;
 
-struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
+struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm, bool intr);
+
+static inline struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
+{
+	return __xe_bb_new(gt, dwords, usm, false);
+}
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 				      struct xe_bb *bb);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 7a8efb62df60..ec0b64a1d4c1 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -95,7 +95,7 @@ struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords)
 	struct drm_suballoc *sa;
 
 	if (cache->sam)
-		sa = __xe_sa_bo_new(cache->sam, dwords * sizeof(u32), GFP_ATOMIC);
+		sa = __xe_sa_bo_new(cache->sam, dwords * sizeof(u32), GFP_ATOMIC, false);
 	else
 		sa = ERR_PTR(-EOPNOTSUPP);
 
@@ -117,7 +117,7 @@ struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
 {
 	struct drm_suballoc *sa;
 
-	sa = __xe_sa_bo_new(cache->sam, size, GFP_ATOMIC);
+	sa = __xe_sa_bo_new(cache->sam, size, GFP_ATOMIC, false);
 	if (!IS_ERR(sa))
 		memcpy(xe_sa_bo_cpu_addr(sa), data, size);
 
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index da1ed99cd3f8..921f30ffb4cb 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -76,7 +76,7 @@ struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inva
 
 	/* Maximum size of PRL is 1 4K-page */
 	prl_sa = __xe_sa_bo_new(tile->mem.reclaim_pool,
-				prl_size, GFP_ATOMIC);
+				prl_size, GFP_ATOMIC, false);
 	if (IS_ERR(prl_sa))
 		return prl_sa;
 
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index b356d4327c97..d9da4276b5dd 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -93,12 +93,14 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
  * @sa_manager: the &xe_sa_manager
  * @size: number of bytes we want to suballocate
  * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL.
+ * @intr: whether to wait interruptibly if space is not immediately available
  *
  * Try to make a suballocation of size @size.
  *
  * Return: a &drm_suballoc, or an ERR_PTR.
  */
-struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp)
+struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
+				    gfp_t gfp, bool intr)
 {
 	/*
 	 * BB to large, return -ENOBUFS indicating user should split
@@ -107,7 +109,7 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	if (size > sa_manager->base.size)
 		return ERR_PTR(-ENOBUFS);
 
-	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
+	return drm_suballoc_new(&sa_manager->base, size, gfp, intr, 0);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 1be744350836..bf81be165ea0 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -15,7 +15,8 @@ struct dma_fence;
 struct xe_tile;
 
 struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
-struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
+struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
+				    gfp_t gfp, bool intr);
 
 static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
 {
@@ -26,14 +27,16 @@ static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile,
  * xe_sa_bo_new() - Make a suballocation.
  * @sa_manager: the &xe_sa_manager
  * @size: number of bytes we want to suballocate
+ * @intr: whether to wait interruptibly if space is not immediately available
  *
  * Try to make a suballocation of size @size.
  *
  * Return: a &drm_suballoc, or an ERR_PTR.
  */
-static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size)
+static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
+						u32 size, bool intr)
 {
-	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
+	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL, intr);
 }
 
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);

-- 
2.56.0
