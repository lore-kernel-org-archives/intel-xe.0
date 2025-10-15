Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE26CCD199
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC6810E131;
	Wed, 15 Oct 2025 18:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDf1NF5s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087E510E131
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760551921; x=1792087921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i81gRpSs8YlnxsID1XbyRR5CqhCldol4ZdpD/iCTH1c=;
 b=JDf1NF5sk5AEcyL9gL7Cat8oyUxAMrkV68Yq4ATwym793cNlVr8QTVhJ
 /z5PGGtTBn+Rc944mW9pA83c5QxpbTfBRdEY31IadljIoN1NhlcCi8iMD
 gvjpjRFcRcDDLA6OU9QFVOp1vhjzkKXaFcUMtUnCxWbcLcxTGnTE1YSwi
 Uv1wvVvH/FXNTQXjlkO/A0hypsnvGcLfEUfehXDMyQR9VzB2DqmeqEqZD
 hw7M/uYbqH5n8tuNf6jP571mhzmOlZp41enl3r4Q091dLGIgSnFM07YdE
 kaNbPsjEhr0xTY1YNlbFJZIHsalurlk9CglPAq3l2kYzKImqOqGdxJJ22 g==;
X-CSE-ConnectionGUID: WOzULNnPShS27Lkz9yGjtQ==
X-CSE-MsgGUID: AmUQBH9ZQsK0H01zPPy+tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62631364"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62631364"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:12:01 -0700
X-CSE-ConnectionGUID: oXNIhkKTTkWU4NdxFsLHMw==
X-CSE-MsgGUID: XGLKcgAhQMqtSd7v0YKt5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182700733"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:12:01 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH] drm/xe/xe_guc: Dynamically decide g2g buffer owner
Date: Wed, 15 Oct 2025 18:12:00 +0000
Message-ID: <20251015181159.92509-2-jonathan.cavitt@intel.com>
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

Note that the associated kunit testing code does not need to be updated
to reflect this change because
1. The kunit testing code always runs with the primary GT enabled, and
2. Tracking the g2g buffer owner in the xe device is unnecessary to
   perform the functions of the tests.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 4 ++++
 drivers/gpu/drm/xe/xe_guc.c          | 9 ++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 02c04ad7296e..e17f8b84b8d4 100644
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
@@ -626,6 +627,9 @@ struct xe_device {
 	atomic_t g2g_test_count;
 #endif
 
+	/** @g2g_owner: Pointer to the GuC that is the owner of the g2g buffer */
+	struct xe_guc *g2g_owner;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d94490979adc..9790ddad606a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -465,9 +465,8 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 	if (guc->g2g.bo)
 		return 0;
 
-	if (gt->info.id != 0) {
-		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
-		struct xe_guc *root_guc = &root_gt->uc.guc;
+	if (xe->g2g_owner) {
+		struct xe_guc *root_guc = xe->g2g_owner;
 		struct xe_bo *bo;
 
 		bo = xe_bo_get(root_guc->g2g.bo);
@@ -492,6 +491,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
 	guc->g2g.bo = bo;
 	guc->g2g.owned = true;
+	xe->g2g_owner = guc;
 
 	return 0;
 }
@@ -504,6 +504,9 @@ static void guc_g2g_fini(struct xe_guc *guc)
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

