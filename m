Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C727D35662
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 00:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3943F10E5E2;
	Wed, 28 Jan 2026 00:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeAOc9jJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF8410E5DA;
 Wed, 28 Jan 2026 00:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561331; x=1801097331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r3Vehl4OndggIDmEgz7+9BnBrwvQR9H0lkmrnllQyUk=;
 b=XeAOc9jJMWxv9gn7eVGGynktluDuAC5y4Vup63wfYlaQ0elMs5fAGr42
 Gzi6NfcwOIRULAl3q21tZwTL/Xj+7i5a4nTzOTxui2py4GWAwzRYoMd75
 UNbn7moAMIKjmnEhEkgxR6cXsOamzvilX/MdE9F/KyI+GNe0SDOYGPKE+
 D1045TNoJ8xbXBcJQ3+2RiCyG3d/NqifNNuU/aSy2V/qpqxVKRFOVh+ym
 JRfC5QC9hVHKjUIDdmDy0xZxMKltbTHgRSQxQ3AeAj9s3zkDf4spFYL3I
 gkXAyT+FNRAxJ9HI3MwwkApzBaFx80kEhOYat+B0XIw48y6txIxf65w32 A==;
X-CSE-ConnectionGUID: 0wWHUs+vTRKxqHo3JIpbRQ==
X-CSE-MsgGUID: erG0bNNuTCG3dM8rRK1Gbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427532"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427532"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: 7j2UDeYsQa+HOroB1vFbGQ==
X-CSE-MsgGUID: KPUroDZYS5GtbmDBivPUVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822673"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 09/11] drm/xe: Drop BO dma-resv lock during SVM
 migrate-to-device
Date: Tue, 27 Jan 2026 16:48:39 -0800
Message-Id: <20260128004841.2436896-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128004841.2436896-1-matthew.brost@intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
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

Device-to-device migration may require DRM pagemap IOVA allocations,
which are allowed to acquire dma-resv locks. To support this, pin the BO
before initiating the migration, preventing immediate eviction and
allowing dma-resv locks to be taken safely during the migration process.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index eb8d8fe6ff75..c2a6bb367e0a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1077,15 +1077,26 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 			block->private = vr;
 
 		xe_bo_get(bo);
+		/* Guard against eviction */
+		ttm_bo_pin(&bo->ttm);
 
 		/* Ensure the device has a pm ref while there are device pages active. */
 		xe_pm_runtime_get_noresume(xe);
-		/* Consumes the devmem allocation ref. */
-		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
-						    start, end, &mdetails);
 		xe_bo_unlock(bo);
-		xe_bo_put(bo);
+
 	}
+
+	/* Consumes the devmem allocation ref. */
+	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
+					    start, end, &mdetails);
+
+	xe_bo_lock(bo, false);
+	ttm_bo_unpin(&bo->ttm);
+	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+	xe_bo_unlock(bo);
+
+	xe_bo_put(bo);
+
 	xe_pm_runtime_put(xe);
 	drm_dev_exit(idx);
 
-- 
2.34.1

