Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A09CE77182
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 14:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252DB10E8F8;
	Tue, 10 Dec 2024 14:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/FVSIY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7779010E8F7
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733841484; x=1765377484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vnb2/vCyqwIls4WNf2XgN4VE+IXR43a/vMtieQBzszg=;
 b=R/FVSIY49cIm5t3rV8QECLk95s9mznlLan2TzmPGTAMBPX90RIun1c/w
 NvpJeuGLwhxN0ZclLxE2fdSq3YwnXjeNtGb1E5osSMIofA5AEbKfTsJd+
 2Iu7m5S2WZBjv6K41P/dGtmcCwkenk0cVzslVaUPOZfTNuObVBJs+guAK
 ghbujwK/Xg/6eyWLZ1UQcX6urnufPPuhvpfAAKm9hOWm4q2ccriT7H7rp
 woA03SExAUmRezax6Qy7GuTegDU80y0vVX5e+MU4+aCRSeuWfXAzO4HGO
 p7mF+vYrY79pZm7FjegNU7dCnH1KkI44CHlJi5HxImdeevmsq8RUQLRKG Q==;
X-CSE-ConnectionGUID: hQh3Xci9TdC88B/2x/BvFg==
X-CSE-MsgGUID: IaQGnLY7QfqorNRsPQlJ2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38114262"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="38114262"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:38:01 -0800
X-CSE-ConnectionGUID: vxn5qHbLQSqrPoAEgYN1pg==
X-CSE-MsgGUID: e/WCJI7ISCK8h8KZyFuOMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="96240156"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.244.12])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:38:00 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, lucas.demarchi@intel.com,
 raag.jadav@intel.com, Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v2 1/2] drm/xe: introduce xe_gt_reset and xe_gt_reset_wait
Date: Tue, 10 Dec 2024 15:37:47 +0100
Message-ID: <20241210143748.1417098-2-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210143748.1417098-1-maciej.patelczyk@intel.com>
References: <20241210143748.1417098-1-maciej.patelczyk@intel.com>
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

Adding synchronous version gt reset as there are few places where it
is expected.
Adding also a wait helper to wait until gt reset is done.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c   |  7 +++----
 drivers/gpu/drm/xe/tests/xe_mocs.c |  3 +--
 drivers/gpu/drm/xe/xe_gt.h         | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 +-
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index c9ec7a313c6b..a1af45e06189 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -264,10 +264,9 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		 * however seems quite fragile not to also restart the GT. Try
 		 * to do that here by triggering a GT reset.
 		 */
-		for_each_gt(__gt, xe, id) {
-			xe_gt_reset_async(__gt);
-			flush_work(&__gt->reset.worker);
-		}
+		for_each_gt(__gt, xe, id)
+			xe_gt_reset(__gt);
+
 		if (err) {
 			KUNIT_FAIL(test, "restore kernel err=%pe\n",
 				   ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 6f9b7a266b41..2698e433c6fa 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -162,8 +162,7 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 		if (flags & HAS_LNCF_MOCS)
 			read_l3cc_table(gt, &mocs.table);
 
-		xe_gt_reset_async(gt);
-		flush_work(&gt->reset.worker);
+		xe_gt_reset(gt);
 
 		kunit_info(test, "mocs_reset_test after reset\n");
 		if (flags & HAS_GLOBAL_MOCS)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 82b9b7f82fca..8db64e289892 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -56,6 +56,31 @@ void xe_gt_sanitize(struct xe_gt *gt);
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
+/**
+ * xe_gt_reset - perform synchronous reset
+ * @gt: GT structure
+ * Return:
+ * %true if waited for the reset to finish,
+ * %false if there was no scheduled reset.
+ */
+static inline bool xe_gt_reset(struct xe_gt *gt)
+{
+	xe_gt_reset_async(gt);
+	return xe_gt_reset_wait(gt);
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

