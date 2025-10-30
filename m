Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08517CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 21:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B0410EA3D;
	Thu, 30 Oct 2025 21:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GC5xZpD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED5910EA3D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761859525; x=1793395525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lQS4u52mbm8qqau90MGql9MiJGFs0HYo+Ef3UoU0EbA=;
 b=GC5xZpD4L/8PJIvaMRmtBkQrMoj1PUsQVp/e3ZYrXG++jCMZXPJvHtJs
 /Ef4oE8lOxD1UuPqLxqynhhhqF8v42KFwIJEMem2YmZY1YMkC4XC1aoLo
 1N1TlfP5EsDbkgboUS3ZRxbn3yENmtufuSWXLApSe0f4mEycteRcUsNvz
 6ancwvKJsIx92XjeJSOm73m0fiCvQ7R4MaAEK7Jj63YXqBcmH6HCN9PCw
 t2sU/ulbJGdmHll9VCf5timNH4/jQtAxU4YaKwKx2MvtDuBpEZybduq9w
 VULTqFm7UGXQ9boNCujtUa2IMaysTp8m6/HQ5VyTxsZ1Fjly8qiDLLBjr Q==;
X-CSE-ConnectionGUID: hGdWkKzKTqyG6BQd2Xy0uQ==
X-CSE-MsgGUID: MSzH6FtcQl2Fgv6S5IH+jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64165944"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64165944"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 14:25:24 -0700
X-CSE-ConnectionGUID: bqQUnXk7TBi1KSWi+XMFYg==
X-CSE-MsgGUID: 0W40kuj1RIWLpNO8RSU8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185272240"
Received: from dut4086lnl.fm.intel.com ([10.105.10.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 14:25:24 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com, michal.wajdeczko@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v3] drm/xe/xe_guc: Dynamically decide g2g buffer owner
Date: Thu, 30 Oct 2025 21:25:23 +0000
Message-ID: <20251030212522.245585-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

On today's driver, xe_device_get_gt(xe, 0); can never return NULL.
Hardware-wise there's always at least one tile, and every tilie has a
primary GT.  If something went wrong during init of tile or GT and we
couldn't create/initialize the structures, then we already aborted the
device probe immediately and we'll never get further on to places in the
code that would be chasing a NULL pointer.

However, there's currently ongoing work to allow the primary GT to be
disabled via configfs for debugging purposes.  Once that lands, it will
be possible for this query to return a NULL pointer.  This can cause
problems in guc_g2g_alloc, as this process currently relies on the
primary GT always being present.

Instead of making the primary GT the g2g buffer owner, make the first
GuC passed to guc_g2g_alloc the g2g buffer owner.  This requires keeping
track of the g2g buffer owner in the xe device so each GuC can know if
it's the owner or not during initialization.

Note that because all the kunit tests will always run with GT0 enabled,
we only need to ensure that the g2g reinitialization path is fixed in
xe_guc_g2g_test.c

v2:
- Update the kunit tests to clear and reset the g2g_owner variable as
  needed (Daniele)

v3:
- Update commit message to describe why kunit tests are minimally
  modified (Daniele)
- Drop single-use root_guc variable (Daniele)

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h       |  4 ++++
 drivers/gpu/drm/xe/xe_guc.c                | 10 ++++++----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
index 3b213fcae916..6446232422e2 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
@@ -358,6 +358,7 @@ static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_b
 	root_gt = xe_device_get_gt(xe, 0);
 	root_gt->uc.guc.g2g.bo = bo;
 	root_gt->uc.guc.g2g.owned = true;
+	xe->g2g_owner = &root_gt->uc.guc;
 	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
 
 	for_each_gt(gt, xe, i) {
@@ -447,6 +448,7 @@ static void g2g_free(struct kunit *test, struct xe_device *xe)
 
 		gt->uc.guc.g2g.bo = NULL;
 	}
+	xe->g2g_owner = NULL;
 }
 
 static void g2g_stop(struct kunit *test, struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index af0ce275b032..91ec9a295226 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -38,6 +38,7 @@ struct dram_info;
 struct intel_display;
 struct intel_dg_nvm_dev;
 struct xe_ggtt;
+struct xe_guc;
 struct xe_i2c;
 struct xe_pat_ops;
 struct xe_pxp;
@@ -628,6 +629,9 @@ struct xe_device {
 	atomic_t g2g_test_count;
 #endif
 
+	/** @g2g_owner: Pointer to the GuC that is the owner of the g2g buffer */
+	struct xe_guc *g2g_owner;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc3e091b89e..68c827ccf473 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -468,12 +468,10 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 	if (guc->g2g.bo)
 		return 0;
 
-	if (gt->info.id != 0) {
-		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
-		struct xe_guc *root_guc = &root_gt->uc.guc;
+	if (xe->g2g_owner) {
 		struct xe_bo *bo;
 
-		bo = xe_bo_get(root_guc->g2g.bo);
+		bo = xe_bo_get(xe->g2g_owner->g2g.bo);
 		if (!bo)
 			return -ENODEV;
 
@@ -495,6 +493,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
 	guc->g2g.bo = bo;
 	guc->g2g.owned = true;
+	xe->g2g_owner = guc;
 
 	return 0;
 }
@@ -507,6 +506,9 @@ static void guc_g2g_fini(struct xe_guc *guc)
 	/* Unpinning the owned object is handled by generic shutdown */
 	if (!guc->g2g.owned)
 		xe_bo_put(guc->g2g.bo);
+	/* g2g owner is no longer valid.  Mark as NULL in xe device */
+	else
+		guc_to_xe(guc)->g2g_owner = NULL;
 
 	guc->g2g.bo = NULL;
 }
-- 
2.43.0

