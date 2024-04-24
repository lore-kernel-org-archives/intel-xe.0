Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A17C10F16
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 04:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F65010F66D;
	Wed, 24 Apr 2024 04:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBLGK4aI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A32710F26B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 04:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713932714; x=1745468714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2AiwIt4XK4nABFupdmcL8Xnay4HuB+DNHtjkZ1ck7pE=;
 b=cBLGK4aIE50WXUZcg2FI58whlXklCqjHuwNCfawB38HRAg/gMwEya6Rf
 WhFmm6wXNUjr/UDxPHOaMLKan0SLqCcxnkd6o3HtGDACyq59wW+9V1HTq
 cFGuN2EwDiVdaOViYJWGDMOOfHV6VwhU3/A2QN5FJWXbij2TEbl63dykQ
 DgEDtoGTfmuRLBlSORGOK/12BvurWHBCIAy9F0gAggPix7TzJ5uCbkaN0
 nXyl+xxzZ+L1C7OahQATW+gcgUDyjDwU9e8i9N2Rr+JWUciG0qbx1pRPS
 OWxaKY7EBG+SnNwONO2tUJs1nofV7OY24H4mKgjKpHooC0sCBlwb/9S0S A==;
X-CSE-ConnectionGUID: 7Q5CRN2bSpGnrbhI/Fadbw==
X-CSE-MsgGUID: CL02l8SQTJqgt2WpGRvcog==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13334206"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="13334206"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 21:25:14 -0700
X-CSE-ConnectionGUID: O5F8+o7MTKmHHdX2YhMIyA==
X-CSE-MsgGUID: wwfi8TJzTDy/e9ijHaTp7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="29222132"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa003.jf.intel.com with ESMTP; 23 Apr 2024 21:25:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 2/2] drm/xe: Use xe_bo_lock()/xe_bo_unlock() helpers
Date: Wed, 24 Apr 2024 10:09:10 +0530
Message-Id: <20240424043910.2190376-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424043910.2190376-1-himal.prasad.ghimiray@intel.com>
References: <20240424043910.2190376-1-himal.prasad.ghimiray@intel.com>
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

There is no change in functionality. Using the helper function
defined within the driver for locking/unlocking the reservation
object.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 drivers/gpu/drm/xe/xe_vm.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 615bbc372ac6..2066d34ddf0b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1382,7 +1382,7 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 	if (!snapshot->lrc_snapshot)
 		goto put_bo;
 
-	dma_resv_lock(bo->ttm.base.resv, NULL);
+	xe_bo_lock(bo, false);
 	if (!ttm_bo_vmap(&bo->ttm, &src)) {
 		xe_map_memcpy_from(xe_bo_device(bo),
 				   snapshot->lrc_snapshot, &src, snapshot->lrc_offset,
@@ -1392,7 +1392,7 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 		kvfree(snapshot->lrc_snapshot);
 		snapshot->lrc_snapshot = NULL;
 	}
-	dma_resv_unlock(bo->ttm.base.resv);
+	xe_bo_unlock(bo);
 put_bo:
 	xe_bo_put(bo);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5c9d48203d73..235ab4e79d11 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3335,7 +3335,7 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 		}
 
 		if (bo) {
-			dma_resv_lock(bo->ttm.base.resv, NULL);
+			xe_bo_lock(bo, false);
 			err = ttm_bo_vmap(&bo->ttm, &src);
 			if (!err) {
 				xe_map_memcpy_from(xe_bo_device(bo),
@@ -3344,7 +3344,7 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 						   snap->snap[i].len);
 				ttm_bo_vunmap(&bo->ttm, &src);
 			}
-			dma_resv_unlock(bo->ttm.base.resv);
+			xe_bo_unlock(bo);
 		} else {
 			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
 
-- 
2.25.1

