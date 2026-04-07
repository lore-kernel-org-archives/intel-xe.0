Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62458105D98C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 23:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA7E10E4DC;
	Tue,  7 Apr 2026 23:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbD+ZGnq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968D510E4E0
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 23:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775602990; x=1807138990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VvA2OFs26c4SFn8uiheuKIcvx5gJwfw/yxlVhJn07Kg=;
 b=IbD+ZGnqzly13S8xl334GxD2zu1uyRlQ4ZPxEqJtuhwL+1V4Ng/CvqSx
 lX8mkJZyP0KmlNS8DebXDc4ksyU5N3X6h9615z0mqwAatwPVSTMLZ9+yN
 SPkl1yXr6D5supu0pwXHw3ZA1hclLzCAEiUu9jpqZcTmOCkckFUsIqT+u
 /MJWfqzUnlbNGeeiN03Lgva8fHIJqLNPNlNUuO7j53ftJ7p5XGoeNL9aw
 3jFTVn2rE+2pRd9Rn7l2cE4MBmtwUCXBf+YmLT2HqrrHM84O6HXzMmuPj
 MOHOnmNkx2JanQEs4zAzkImJK9R98qEhp1nAEJ+9sQ8x2FsdVmTfMAyXY A==;
X-CSE-ConnectionGUID: rt9UWBynSTqoppYLKCnKpQ==
X-CSE-MsgGUID: +rQzB9a8RA2Cw3RVf3SoUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76542544"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76542544"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 16:03:10 -0700
X-CSE-ConnectionGUID: a9aPk7/2Tf2kgWzmONgB+Q==
X-CSE-MsgGUID: 44D4M661S5qTsUj/LNA8vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="232342655"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa003.jf.intel.com with ESMTP; 07 Apr 2026 16:03:08 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 2/2] drm/xe/ras: Clean up coding style in xe_drm_ras
Date: Tue,  7 Apr 2026 22:59:13 +0000
Message-ID: <20260407225913.3397059-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260407225913.3397059-1-shuicheng.lin@intel.com>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
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

- Fix long line in cleanup_node_param() signature.
- Drop unnecessary const on pass-by-value enum parameters.
- Simplify xe_drm_ras_init() by removing redundant local variable
  and redundant error path.

No functional change.

Cc: Riana Tauro <riana.tauro@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_ras.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index 802e4bcb731c..9cddad2be549 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.c
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -68,7 +68,7 @@ static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *x
 }
 
 static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
-			      const enum drm_xe_ras_error_severity severity)
+			      enum drm_xe_ras_error_severity severity)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct xe_drm_ras *ras = &xe->ras;
@@ -109,7 +109,8 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
 	return ret;
 }
 
-static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_error_severity severity)
+static void cleanup_node_param(struct xe_drm_ras *ras,
+			       enum drm_xe_ras_error_severity severity)
 {
 	struct drm_ras_node *node = &ras->node[severity];
 
@@ -174,15 +175,13 @@ static void xe_drm_ras_unregister_nodes(struct drm_device *device, void *arg)
 int xe_drm_ras_init(struct xe_device *xe)
 {
 	struct xe_drm_ras *ras = &xe->ras;
-	struct drm_ras_node *node;
 	int err;
 
-	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node), GFP_KERNEL);
-	if (!node)
+	ras->node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX,
+				 sizeof(*ras->node), GFP_KERNEL);
+	if (!ras->node)
 		return -ENOMEM;
 
-	ras->node = node;
-
 	err = register_nodes(xe);
 	if (err) {
 		drm_err(&xe->drm, "Failed to register DRM RAS nodes (%pe)\n", ERR_PTR(err));
@@ -190,10 +189,8 @@ int xe_drm_ras_init(struct xe_device *xe)
 	}
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_drm_ras_unregister_nodes, xe);
-	if (err) {
+	if (err)
 		drm_err(&xe->drm, "Failed to add action for Xe DRM RAS (%pe)\n", ERR_PTR(err));
-		return err;
-	}
 
-	return 0;
+	return err;
 }
-- 
2.43.0

