Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6746CC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5A710E6FA;
	Wed, 13 Aug 2025 10:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D106T+4Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E4C10E6F8
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755082325; x=1786618325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nS+b+s/xeeODlyn9JJvMsT/agAHZhaKq3ovTVYCbSIk=;
 b=D106T+4QufA6BzIpAveOcerXICYUfjFTDXY80yR1hK3CZZumBAEuwB1+
 rgyGxnDW/ZkkFEMrU2fF8R7aEmhEpykagUXRv9ofoh06Ls1AQLEDO/1V5
 emXptC7ZRL8IzcZTFqRIerksS/3kBz3v0ucc03ZJ1WBktH3j/u77Nu6eZ
 icS1wlPJOSuF1/eT8PSeifyc63dq78lpGSlQDENkURfNpXbTgDWdsso/3
 IqJ4VT0PvK75FeJzmCRi+F38aeRPkz40L2JnFckMY8fThkhEsdbF75rOs
 Q5X/jG5Xj2F57dbGSn7nbfZhc+5b34YElqm0ANluTZYrnZgOb0shsga+b g==;
X-CSE-ConnectionGUID: PPf1b00SS8asAXyBumjMgg==
X-CSE-MsgGUID: jqPhjInvTKaDaemHdbRkdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57450013"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57450013"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:05 -0700
X-CSE-ConnectionGUID: qgv2/SJzR62Rxp3ZycQQ8g==
X-CSE-MsgGUID: 6LGbKxICQCOvQ70BsuwG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166069020"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 07/15] drm/xe: Convert SVM validation for exhaustive eviction
Date: Wed, 13 Aug 2025 12:51:13 +0200
Message-ID: <20250813105121.5945-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Convert SVM validation to support exhaustive eviction,
using xe_validation_guard().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 63 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 39e3aa6df25a..ba85665d85d4 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -699,51 +699,48 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
 	struct drm_buddy_block *block;
+	struct xe_validation_ctx vctx;
 	struct list_head *blocks;
-	struct drm_exec *exec;
+	struct drm_exec exec;
 	struct xe_bo *bo;
-	ktime_t time_end = 0;
-	int err, idx;
+	int err = 0, idx;
 
 	if (!drm_dev_enter(&xe->drm, &idx))
 		return -ENODEV;
 
 	xe_pm_runtime_get(xe);
-	exec = XE_VALIDATION_UNIMPLEMENTED;
-
- retry:
-	bo = xe_bo_create_locked(vr->xe, NULL, NULL, end - start,
-				 ttm_bo_type_device,
-				 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
-				 XE_BO_FLAG_CPU_ADDR_MIRROR, exec);
-	if (IS_ERR(bo)) {
-		err = PTR_ERR(bo);
-		if (xe_vm_validate_should_retry(NULL, err, &time_end))
-			goto retry;
-		goto out_pm_put;
-	}
 
-	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
-				&dpagemap_devmem_ops, dpagemap, end - start);
-
-	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
-	list_for_each_entry(block, blocks, link)
-		block->private = vr;
+	xe_validation_guard(&vctx, &xe->val, &exec, 0, err, false) {
+		bo = xe_bo_create_locked(xe, NULL, NULL, end - start,
+					 ttm_bo_type_device,
+					 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
+					 XE_BO_FLAG_CPU_ADDR_MIRROR, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			err = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&vctx, &err);
+			break;
+		}
 
-	xe_bo_get(bo);
+		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
+					&dpagemap_devmem_ops, dpagemap, end - start);
 
-	/* Ensure the device has a pm ref while there are device pages active. */
-	xe_pm_runtime_get_noresume(xe);
-	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
-					    start, end, timeslice_ms,
-					    xe_svm_devm_owner(xe));
-	if (err)
-		xe_svm_devmem_release(&bo->devmem_allocation);
+		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
+		list_for_each_entry(block, blocks, link)
+			block->private = vr;
 
-	xe_bo_unlock(bo);
-	xe_bo_put(bo);
+		xe_bo_get(bo);
 
-out_pm_put:
+		/* Ensure the device has a pm ref while there are device pages active. */
+		xe_pm_runtime_get_noresume(xe);
+		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
+						    start, end, timeslice_ms,
+						    xe_svm_devm_owner(xe));
+		if (err)
+			xe_svm_devmem_release(&bo->devmem_allocation);
+		xe_bo_unlock(bo);
+		xe_bo_put(bo);
+	}
 	xe_pm_runtime_put(xe);
 	drm_dev_exit(idx);
 
-- 
2.50.1

