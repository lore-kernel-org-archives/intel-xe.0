Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7E8EE369F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 16:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727A010E76D;
	Thu, 12 Feb 2026 16:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fk9u4Cyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2661310E76C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770914102; x=1802450102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SyHKh+CWqkO1L9cNEn5eO8NkfW3uuw2YEdhxQhwYqvA=;
 b=fk9u4CydmLJaDLe6/0G4oEio6/ZcertPxdvRcf9Gyd4qMhmwXP0VuqQz
 UlaaBw7ScJ7sCJLO62tfhqZB8rp+dYPUmt6dc2GcHU/bTK7G7uC7QzndO
 tIUNM/GDIKkecwXqenStZR4i2NXvOe5n2mbNlcXzvD7i3+PWDNN0PZkK6
 zOD5fz7sxBchxx+Ck3pAiTx52ddD94Vne+y5ep7oqWVssZg/s2iJiDuYe
 jIyakKDbpIPLUovci2Pudlbsrrpi7OgjbWS4VlABV7mI9u1GoiqmntQCe
 ZM2Gih9FBdUkiYZ/p6m4E/vnEs5RT/Q7dbGVSeFT4kqjvbk3Gi6wY4Aht A==;
X-CSE-ConnectionGUID: CDNqq3MQT+m9W1a57Ps1vw==
X-CSE-MsgGUID: Yc2jSBamRmOrFAyRv+GiQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89498540"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="89498540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 08:35:01 -0800
X-CSE-ConnectionGUID: u81Dd6X0TyC2KuEWpfSD7A==
X-CSE-MsgGUID: ZR+di+WpT9yJx0rElrrzFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="235634010"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 08:34:59 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 2/7] drm/xe/svm: Use xe_vram_addr_to_region
Date: Thu, 12 Feb 2026 22:04:42 +0530
Message-ID: <20260212163439.1514363-11-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212163439.1514363-9-tejas.upadhyay@intel.com>
References: <20260212163439.1514363-9-tejas.upadhyay@intel.com>
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

Replace the direct use of block->private with the helper function
xe_vram_addr_to_region to get vram region.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..e773456af040 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -762,7 +762,8 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 	int j = 0;
 
 	list_for_each_entry(block, blocks, link) {
-		struct xe_vram_region *vr = block->private;
+		u64 block_start = drm_buddy_block_offset(block);
+		struct xe_vram_region *vr = xe_vram_addr_to_region(bo->tile->xe, block_start);
 		struct drm_buddy *buddy = vram_to_buddy(vr);
 		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
 						    drm_buddy_block_offset(block));
@@ -1033,9 +1034,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct dma_fence *pre_migrate_fence = NULL;
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
-	struct drm_buddy_block *block;
 	struct xe_validation_ctx vctx;
-	struct list_head *blocks;
 	struct drm_exec exec;
 	struct xe_bo *bo;
 	int err = 0, idx;
@@ -1072,10 +1071,6 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 					&dpagemap_devmem_ops, dpagemap, end - start,
 					pre_migrate_fence);
 
-		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
-		list_for_each_entry(block, blocks, link)
-			block->private = vr;
-
 		xe_bo_get(bo);
 
 		/* Ensure the device has a pm ref while there are device pages active. */
-- 
2.52.0

