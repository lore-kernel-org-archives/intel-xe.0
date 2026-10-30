Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA7D606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 11:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P7pWugRo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859C511277A;
	Fri, 30 Oct 2026 11:50:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B91B11277A
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361004; x=1824897004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Jr6vvcE5bK5zSTGTKrVqT678FFN+euW3WM2gBNabqM=;
 b=P7pWugRowcPtSf+5R8qqffejKvjbwOeU7BFeZ3hZNWUpUQyDRXJVNTuy
 cZ30M4tfZoXNbOhv29dtEkA5O2qJ8yfcS0mO3JjkZaqF5YjMUCvxEA5WD
 CiT7FCB82xtN0W75QO48AeqtkeuQIwKKl7bNcgRBtYBnDyxW5gTCIYEif
 Shxc255A8ptXGXXdowrQK3KQpbYIe/TPXemZfhlcyEZTKoBUOkQ+P0lSN
 Sf4lMxg3+Rr8eTaPD+ReFAfxQ55xEna0u7z1YI5Cwd2TDssNVcwifjM8Y
 GjtXZyLOLwmB7VBJlcY2Ryq6HIBribMvp80whd8iJ0CEih3cvN5uBz2Ul g==;
X-CSE-ConnectionGUID: K/iz7x/kRdGjQpMEf6j3cw==
X-CSE-MsgGUID: eb3P7PAOTTePzbtn93tWJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2135386"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2135386"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:04 -0700
X-CSE-ConnectionGUID: BUkKOoGxSzS05He/nKU3Nw==
X-CSE-MsgGUID: VD91pxnmTMewHK7vlxpI0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5441147"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.36])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:04 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/6] drm/xe/bb: drop per-batch prefetch padding
Date: Fri, 30 Oct 2026 11:49:52 +0000
Message-ID: <20261030-migrate-bb-optimise-v1-2-b8d01649cfe9@intel.com>
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

xe_bb_new() currently appends bb_prefetch() (512B or 1K) to every
batch suballocation, inflating a 36B identity-mapped clear batch to
~1K and also causing xe_sa_bo_flush_write() to copy up to 1K of unused
padding to VRAM on every batch.

However, both kernel_bb_pool and usm.bb_pool are initialised via
xe_sa_bo_manager_init(), which already reserves a 4K guard region at
the end of the backing BO to cover CS prefetch, and prefetching into
adjacent suballocations within the mapped pool should be harmless. Drop
bb_prefetch().

This should reduce pressure on the bb pool.

Assisted-by: LLM
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index b896b6f6615c..b2603902c147 100644
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
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -38,13 +24,13 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
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
-			      4 * (dwords + 1) + bb_prefetch(gt));
+			      4 * (dwords + 1));
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
2.56.0
