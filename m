Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042CD606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QRL63dsv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB93710E857;
	Fri, 27 Nov 2026 12:15:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956C710E9FE
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795781700; x=1827317700;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YhP4bh2izMHmd/PrnC8rzB8B2SUrpr0T9RpudLKxYgQ=;
 b=QRL63dsv1+ojr/Us1hvJ9l5GBjKCB/R1uarCGo9FMkEKjt4eg2AGzEEi
 V/FNDnSeI1ZQ5M4xCSZtdS5lOi0aGhh6lvMyLHhdADr366Dx4dA87QLVG
 fXmjrDkJFBYX+l2PBoSfiJajIvfG3cIaJHpgsvOp+2MO3yM3kFwhaSQ5x
 TZ1NOCD7NJ5Bg3nWo14YMuJikDoOa57h46Xj3nyw9pQF7efP4zj7MNznD
 e9VujRBA5OCinSg3Qs/KYpHRBrK9EF0AQ5mBtxJecCarLlIqnKq9rYtzU
 b/EFoe/P1zHPPmor9uOF85Lt9G9hV/hOBilPhdBvx/QgF17m2BlMw6ybs Q==;
X-CSE-ConnectionGUID: zCYlRbUzRx2xpCpek+CaQQ==
X-CSE-MsgGUID: CKedE7teS6Wflm5MYwdK9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4599406"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4599406"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:58 -0800
X-CSE-ConnectionGUID: IfZTv3OFSuu4CL3OQqwNaQ==
X-CSE-MsgGUID: HQKwWu7wTPCzlhvEVLdb0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14404718"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.245.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:58 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 27 Nov 2026 12:14:15 +0000
Subject: [PATCH v2 5/6] drm/xe/bb: drop per-batch prefetch padding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-migrate-bb-optimise-v2-5-808d0d520ddb@intel.com>
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

__xe_bb_new() currently appends bb_prefetch() (512B or 1K) to every
batch suballocation, inflating a 36B identity-mapped clear batch to
~1K and also causing xe_sa_bo_flush_write() to copy up to 1K of unused
padding to VRAM on every batch.

However, both kernel_bb_pool and usm.bb_pool are initialised via
xe_sa_bo_manager_init(), which already reserves a 4K guard region at
the end of the backing BO to cover CS prefetch, and prefetching into
adjacent suballocations within the mapped pool should be harmless. Drop
bb_prefetch().

This should reduce pressure on the bb pool.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 6308a1dca464..bcb3a56995a6 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -14,20 +14,6 @@
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 
-static int bb_prefetch(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	if (GRAPHICS_VERx100(xe) >= 1250 && xe_gt_is_main_type(gt))
-		/*
-		 * RCS and CCS require 1K, although other engines would be
-		 * okay with 512.
-		 */
-		return SZ_1K;
-	else
-		return SZ_512;
-}
-
 struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm, bool intr)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -38,13 +24,13 @@ struct xe_bb *__xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm, bool intr)
 		return ERR_PTR(-ENOMEM);
 
 	/*
-	 * We need to allocate space for the requested number of dwords,
-	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
-	 * space to accommodate the platform-specific hardware prefetch
-	 * requirements.
+	 * We need to allocate space for the requested number of dwords and
+	 * one additional MI_BATCH_BUFFER_END dword. Hardware CS prefetch
+	 * at the end of the pool BO is covered by the SZ_4K guard region
+	 * reserved by xe_sa_bo_manager_init().
 	 */
 	bb->bo = xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt->usm.bb_pool,
-			      4 * (dwords + 1) + bb_prefetch(gt), intr);
+			      4 * (dwords + 1), intr);
 	if (IS_ERR(bb->bo)) {
 		err = PTR_ERR(bb->bo);
 		goto err;
@@ -129,7 +115,7 @@ __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
 	if (bb->len == 0 || bb->cs[bb->len - 1] != MI_BATCH_BUFFER_END)
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
-	xe_gt_assert(q->gt, bb->len * 4 + bb_prefetch(q->gt) <= size);
+	xe_gt_assert(q->gt, bb->len * 4 <= size);
 
 	xe_sa_bo_flush_write(bb->bo);
 

-- 
2.56.1

