Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A2BC61DA4
	for <intel-xe@archiver.kernel.org>; Sat, 18 Mar 2023 03:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB5210E43D;
	Sat, 18 Mar 2023 03:28:40 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFCB10E179
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Mar 2023 03:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679110118; x=1710646118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OxkEZ7pIKIwwJ5EcGDCZhdRSkSDuKIr8sucqIBq/A9E=;
 b=noWnluzFEZMV41LYGMNWJkvDkcj1ag7TKksJuDYP0db1BOF/F8Z9NP78
 RnGCA+pXEn76uwfzYQqeCuGSa59R9SOuqIq0cPVdNMmWW9Z5jP2fFLEmn
 t2pE/hZoQ7fd5yXDhq4PSo4S6rUke9bYLoq/KyFc+IujFieHMYSUgdYAr
 fsUkrI2JWXni2eHetzjV5Ps/+Z+FWj2zaoehX5sPc4nG8XIPDMRUEIj5C
 n+B0x2yfm92axqCnAg52zspQM+LIU8cGJsfwMD/YjgzLV0ow8MbUkAE7m
 JFHootM7Y+tedXQZjQ0874iTDOrdcy1VVjb5DzmY1lKGZ4pgbYvL1/iA/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322251401"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="322251401"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 20:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926371496"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="926371496"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 20:28:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 17 Mar 2023 20:28:42 -0700
Message-Id: <20230318032842.578049-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix potential deadlock handling page
 faults
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

Within a class the GuC will hault scheduling if the head of the queue
can't be scheduled the queue will block. This can lead to deadlock if
BCS0-7 all have faults and another engine on BCS0-7 is at head of the
GuC scheduling queue as the migration engine used to fix tthe fault will
be blocked. To work around this set the migration engine to the highest
priority when servicing page faults.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 76ec40567a78..8fad6e60f826 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -106,6 +106,7 @@ static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
 static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_engine *e = xe_gt_migrate_engine(gt);
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	struct xe_bo *bo;
@@ -185,6 +186,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (ret)
 		goto unlock_vm;
 
+	e->ops->set_priority(e, DRM_SCHED_PRIORITY_KERNEL);
 	if (atomic) {
 		if (xe_vma_is_userptr(vma)) {
 			ret = -EACCES;
@@ -204,7 +206,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	/* Bind VMA only to the GT that has faulted */
 	trace_xe_vma_pf_bind(vma);
-	fence = __xe_pt_bind_vma(gt, vma, xe_gt_migrate_engine(gt), NULL, 0,
+	fence = __xe_pt_bind_vma(gt, vma, e, NULL, 0,
 				 vma->gt_present & BIT(gt->info.id));
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
@@ -218,6 +220,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	 */
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
+	e->ops->set_priority(e, DRM_SCHED_PRIORITY_NORMAL);
 
 	if (xe_vma_is_userptr(vma))
 		ret = xe_vma_userptr_check_repin(vma);
-- 
2.34.1

