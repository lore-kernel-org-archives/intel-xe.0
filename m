Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0BBE77180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 14:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165E010E740;
	Mon,  9 Dec 2024 14:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSSiaVNi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7578F10E740
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733753558; x=1765289558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jpYJ6dbR9AIwVqL2nY2XP9PcEp5byLlld448XLGtPRA=;
 b=VSSiaVNiOra3snFJBtcsS0wwZvWw/d3G2RRAtzbhO6DMTtQvXJ6a9wJt
 FLqB9qZYUXm/75KHs6tZUuiqnSOat69q2y+yp8Y8b+gUc7jIlXqG+/n6I
 DcFPtexZX5cuW4iurKfUptTjsZlW5nzLkwTEPLluJEkyRviuxO8Y4Ewvr
 C7dBiY9uTyfMe4WN7vxDKA3X/nRnvANGTNBCgV9VRD9Y18uapPT+CqnR1
 yXYmcbRhx8OrpYeaqgfz7/eLGhUw/lD5QMUbtzMAzFDypoqxGOJEf8xM8
 9mgTgtG2Nc2Pvl3W/NftYLart0Rk5Se2735eLCCqRN75hZ1LZIecubQZF g==;
X-CSE-ConnectionGUID: PdPG5eOaSIGKkmMcVuifww==
X-CSE-MsgGUID: KDoru2XHTE2L2PV4jV0Cmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33967728"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="33967728"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:12:37 -0800
X-CSE-ConnectionGUID: vDoayN7nT2a2HllOKEKQLw==
X-CSE-MsgGUID: 3pc59+9eSpKoU7f9jrNgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="94768286"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.245.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:12:35 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH 1/2] drm/xe: introduce xe_gt_reset_wait to wait for async gt
 reset
Date: Mon,  9 Dec 2024 15:12:09 +0100
Message-ID: <20241209141210.1311374-2-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
References: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
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

The reset of the GT is asynchronous.
Adding a wait helper to wait until gt reset is done.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c   |  2 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c |  2 +-
 drivers/gpu/drm/xe/xe_gt.h         | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 +-
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index c9ec7a313c6b..b51434fc5bd1 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -266,7 +266,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		 */
 		for_each_gt(__gt, xe, id) {
 			xe_gt_reset_async(__gt);
-			flush_work(&__gt->reset.worker);
+			xe_gt_reset_wait(__gt);
 		}
 		if (err) {
 			KUNIT_FAIL(test, "restore kernel err=%pe\n",
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 6f9b7a266b41..7bfba172ce2a 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -163,7 +163,7 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 			read_l3cc_table(gt, &mocs.table);
 
 		xe_gt_reset_async(gt);
-		flush_work(&gt->reset.worker);
+		xe_gt_reset_wait(gt);
 
 		kunit_info(test, "mocs_reset_test after reset\n");
 		if (flags & HAS_GLOBAL_MOCS)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 82b9b7f82fca..3e75f623c346 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -56,6 +56,18 @@ void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
 void xe_gt_remove(struct xe_gt *gt);
 
+/**
+ * xe_gt_reset_wait - wait for gt's async reset to finalize.
+ * @gt: GT structure
+ * Return:
+ * %true if xe_gt_reset_wait() waited for the work to finish execution,
+ * %false if there was no scheduled reset or it was done.
+ */
+static inline bool xe_gt_reset_wait(struct xe_gt *gt)
+{
+	return flush_work(&gt->reset.worker);
+}
+
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
  * first that matches the same reset domain as @class
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 3e8c351a0eab..79f61532fd00 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -135,7 +135,7 @@ static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
 	xe_gt_reset_async(gt);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
-	flush_work(&gt->reset.worker);
+	xe_gt_reset_wait(gt);
 
 	return 0;
 }
-- 
2.43.0

