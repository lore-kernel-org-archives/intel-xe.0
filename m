Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4402A606A32C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BZ3mbR99
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0543710E59B;
	Fri, 27 Nov 2026 12:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242F710E59B
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795781694; x=1827317694;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=TzQ+w+qe+lN1CHePCmfIKaW4gCH4+JkPzjf4TeqRuTk=;
 b=BZ3mbR99pSRxBQz+jgQRSlPg66pf0bWCYUUAJXSxudjOhexrnX3tkd27
 JCK7ZiYXJh5zoHzpfW7vzalBmmqjDZ19hmJXq41Uk5ETXQr9n0U9Sc3b8
 j08tttHyjf5a0rS4GoO02PXt/KwTZVFdNpEZuy7pBD6JHn0u3BkQk1uoU
 qzJai6auZk5TnHba7XYUIvIPeoZkm+J0CAUuSmqWNFfl1HZpN8kW6wLnF
 HjPzVFQPwx9MjX04gn3Pi7s8FtdKZZGSqSyBgbvby51f5GLeTuVBldVXL
 EFzjDivRwTL2eLFEQkdMYmrD9lfEgNM06Bm1APqG0AYtZEyp1n9LAaqer A==;
X-CSE-ConnectionGUID: T2IFYqgTT9mCN8OPD52CQg==
X-CSE-MsgGUID: 13i3dh5wQ5WcKMwSYoH8vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4599397"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4599397"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:53 -0800
X-CSE-ConnectionGUID: w4RLMvNGTzWrsLkthmKDTw==
X-CSE-MsgGUID: tCUyB3p0RsijH3nYAaZVLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14404692"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.245.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:53 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 27 Nov 2026 12:14:11 +0000
Subject: [PATCH v2 1/6] drm/xe/sa: allow callers to specify interruptible
 suballocator waits
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-migrate-bb-optimise-v2-1-808d0d520ddb@intel.com>
References: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
In-Reply-To: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
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

v2:
  - Add Fixes/stable tags (Thomas)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: <stable@vger.kernel.org> # v6.12+
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c           | 4 ++--
 drivers/gpu/drm/xe/xe_bb.h           | 9 ++++++++-
 drivers/gpu/drm/xe/xe_guc_buf.c      | 4 ++--
 drivers/gpu/drm/xe/xe_page_reclaim.c | 2 +-
 drivers/gpu/drm/xe/xe_sa.c           | 6 ++++--
 drivers/gpu/drm/xe/xe_sa.h           | 9 ++++++---
 6 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index b896b6f6615c..6308a1dca464 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -28,7 +28,7 @@ static int bb_prefetch(struct xe_gt *gt)
 		return SZ_512;
 }
 
-struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
+struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm, bool intr)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bb *bb = kmalloc_obj(*bb);
@@ -44,7 +44,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	 * requirements.
 	 */
 	bb->bo = xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt->usm.bb_pool,
-			      4 * (dwords + 1) + bb_prefetch(gt));
+			      4 * (dwords + 1) + bb_prefetch(gt), intr);
 	if (IS_ERR(bb->bo)) {
 		err = PTR_ERR(bb->bo);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index 231870b24c2f..66fcc40c0b00 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -6,6 +6,8 @@
 #ifndef _XE_BB_H_
 #define _XE_BB_H_
 
+#include <linux/types.h>
+
 #include "xe_bb_types.h"
 
 struct dma_fence;
@@ -15,7 +17,12 @@ struct xe_exec_queue;
 struct xe_sa_manager;
 struct xe_sched_job;
 
-struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
+struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm, bool intr);
+
+static inline struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
+{
+	return __xe_bb_new(gt, dwords, usm, false);
+}
 struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
 int xe_bb_init(struct xe_bb *bb, struct xe_sa_manager *bb_pool, u32 dwords);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 11f77decd8d1..cdb3b3e31c94 100644
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
index f32045f40b7a..e8908c2973ff 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -164,12 +164,14 @@ void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo)
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
@@ -178,7 +180,7 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	if (size > sa_manager->base.size)
 		return ERR_PTR(-ENOBUFS);
 
-	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
+	return drm_suballoc_new(&sa_manager->base, size, gfp, intr, 0);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 50218b0d1404..e24ed5ceb7dc 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -17,7 +17,8 @@ struct xe_tile;
 #define XE_SA_BO_MANAGER_FLAG_SHADOW	BIT(0)
 struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
 					      u32 guard, u32 align, u32 flags);
-struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
+struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
+				    gfp_t gfp, bool intr);
 
 static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
 {
@@ -28,14 +29,16 @@ static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile,
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
 
 struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);

-- 
2.56.1

