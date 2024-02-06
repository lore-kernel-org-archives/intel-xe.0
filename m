Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47377C4829E
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B851112F64;
	Tue,  6 Feb 2024 23:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBdayZIt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C936112F69
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262614; x=1738798614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYR3ym/2BiqznFxRYmILDvCx0pfTRKzmXKFC5WVDkv0=;
 b=nBdayZItdRMpLR/pgrEzr+t3BdRwx+Lnpo8wgGQBDqOEMMoYx1StRNmR
 htoc4x3Jl2TFYgt03afTNSc8MPvockZUUKFGnM/1bVPSBZcvzhdt9X+8e
 p1fuankYzMblU6PYyg78zowvylJH2eVheZHSwpua13/bmY7SDW6ywy5o3
 Vywy66SirTKv9UDZFgz2YuhNL7Tkxys8ai+s0h/65n6fDQqwTfuim8AGc
 Vu5Z6JWzBwqtiILU1ReG3pALUXoTZfLH2x/cmQiKxqYPlUALV/AiiQ3G8
 v7rNLp5xeCamC9RsrmdVUeNcL+pYHRyVNiT1TQae9Y40es1sAimV7Sc4q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776791"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776791"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793803"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 08/22] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Date: Tue,  6 Feb 2024 15:37:15 -0800
Message-Id: <20240206233729.3173206-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

xe_engine is now xe_exec_queue, adjust this function's name to reflect.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 8 ++++----
 drivers/gpu/drm/xe/xe_migrate.h      | 3 ++-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 4fd81a553bd0..5a7bd63025b3 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -208,7 +208,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	trace_xe_vma_pf_bind(vma);
 	xe_vm_populate_dummy_rebind(vm, vma);
 	vm->dummy_ops.op.tile_mask = BIT(tile->id);
-	vm->dummy_ops.op.q = xe_tile_migrate_engine(tile);
+	vm->dummy_ops.op.q = xe_tile_migrate_exec_queue(tile);
 	fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3d2438dc86ee..7b1dde578176 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -83,15 +83,15 @@ struct xe_migrate {
 #define MAX_PTE_PER_SDI 0x1FE
 
 /**
- * xe_tile_migrate_engine() - Get this tile's migrate engine.
+ * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
  * @tile: The tile.
  *
- * Returns the default migrate engine of this tile.
+ * Returns the default migrate exec queue of this tile.
  * TODO: Perhaps this function is slightly misplaced, and even unneeded?
  *
- * Return: The default migrate engine
+ * Return: The default migrate exec queue
  */
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
 {
 	return tile->migrate->q;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 951f19318ea4..9935ce336bae 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -106,5 +106,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 void xe_migrate_wait(struct xe_migrate *m);
 
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+
 #endif
-- 
2.34.1

