Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDD5C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 01:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCD110E4A7;
	Fri, 24 Mar 2023 01:20:50 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79EA10E4A7
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 01:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679620848; x=1711156848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JGipU9+ODmm2ItQRkUI3LAyt+VzLB5P/DyS90UVBcQU=;
 b=ktLtmM8W/lnPkKFsov66/dvWeLPFj1GVqWGNhsaXcdlz0awsJviPT9Jo
 O0Kse8IVkktWdly2RBKphLaL3g9VZdSOmVLgLN2cHw97ky3guBZRSh5zq
 DX2kJOgEwnzMAzSoR+t8AvuY9ApBWKdA9wDgzvRklOFEqzI4Mg4NRynXL
 zbCbmQx2huEl7j1Vn93Haw7voDd88NDrnH/rABh0c6khBU4alsDhLCwuH
 9lEd3ly7PieGF+EkPpQAJ0sWrgvpPmlnD/scjRlSqDCyu4qmeW0vKKRGC
 QqRIer/1HxXf6N4KvYb7/hGuGkBC7nLEltr2YjN0MpPXSVGsXSfy2Q2QW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320060030"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="320060030"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="751702866"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="751702866"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:20:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 23 Mar 2023 18:20:42 -0700
Message-Id: <20230324012042.1195872-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Use fast virtual copy engine for migrate
 engine on PVC
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
Cc: Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some copy hardware engine instances are faster than others on PVC, use a
virtual engine of these plus the reserved instance for the migrate
engine on PVC. The idea being if a fast instance is available it will be
used and the throughput of kernel copies, clears, and pagefault
servicing will be higher.

Cc: Bruce Chang <yu.bruce.chang@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.h    |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
index 1cf7f23c4afd..0a9c35ea3d34 100644
--- a/drivers/gpu/drm/xe/xe_engine.h
+++ b/drivers/gpu/drm/xe/xe_engine.h
@@ -26,6 +26,8 @@ void xe_engine_destroy(struct kref *ref);
 
 struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id);
 
+u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt);
+
 static inline struct xe_engine *xe_engine_get(struct xe_engine *engine)
 {
 	kref_get(&engine->refcount);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 63a4efd5edcc..b5335f8f7dd3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -600,3 +600,23 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
+
+u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_hw_engine *hwe;
+	const u32 fast_physical_mask = 0x5b;	/* 0, 1, 3, 5, 7 */
+	u32 fast_logical_mask = 0;
+	enum xe_hw_engine_id id;
+
+	/* XXX: We only support this function on PVC for now */
+	XE_BUG_ON(!(xe->info.platform == XE_PVC));
+
+	for_each_hw_engine(hwe, gt, id) {
+		if ((fast_physical_mask | gt->usm.reserved_bcs_instance) &
+		    BIT(hwe->instance))
+			fast_logical_mask |= hwe->logical_instance;
+	}
+
+	return fast_logical_mask;
+}
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 11c8af9c6c92..4a7fec5d619d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -345,11 +345,12 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
 							   XE_ENGINE_CLASS_COPY,
 							   gt->usm.reserved_bcs_instance,
 							   false);
-		if (!hwe)
+		u32 logical_mask = xe_hw_engine_fast_copy_logical_mask(gt);
+
+		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
-		m->eng = xe_engine_create(xe, vm,
-					  BIT(hwe->logical_instance), 1,
+		m->eng = xe_engine_create(xe, vm, logical_mask, 1,
 					  hwe, ENGINE_FLAG_KERNEL);
 	} else {
 		m->eng = xe_engine_create_class(xe, gt, vm,
-- 
2.34.1

