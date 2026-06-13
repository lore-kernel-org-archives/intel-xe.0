Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA575CD98CE
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jun 2026 00:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813AC10E67B;
	Sat, 13 Jun 2026 00:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOAR66sr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0773A10E67B
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jun 2026 00:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781309822; x=1812845822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5r5Ko84bvGurDIrIkT3QUt7TdqtmdGj85O6GS7seoAM=;
 b=jOAR66sr7a9vzVpg9NjcGlBrebPYTfoMstgCGGfDEuzdU3bXZBfL5Rc2
 riARCYe8/+0VR3a3wFwi+Zlqeq0e2EXdYDus8266/E4oey6qvZS9LN9A+
 G87tfB8MINiL8OPtTt716u38+Fsq/EpDxIc6q40SZJStWIlAreVqw+52c
 sNbW+GlVLnQ+hYHTsDLRE6R0fF9Btfd6JzAo/mvuOUXNu9F8xAmIRf+yt
 YybjrU8BvWPqq2VdM1BwxJXixkniOtZ2J347qvlO09J+JYvqOKvzWH/PD
 fhYgdBtXU/LJJghtLPNJHbFPuaf9TqGoekMbl27Ockc6lw+wDBAfKacrg Q==;
X-CSE-ConnectionGUID: NcDlvUuqRRyJaO7ud6akUQ==
X-CSE-MsgGUID: ll9wpZNaT3WbVs9K3gZThQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81162974"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="81162974"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 17:17:02 -0700
X-CSE-ConnectionGUID: aw6SKPJCScCoxXJ4srs6EA==
X-CSE-MsgGUID: yP0Gth+dRK+HNvIhNCc0vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="247019401"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa007.jf.intel.com with ESMTP; 12 Jun 2026 17:17:02 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/memirq: Size report pages from static engine mask
Date: Fri, 12 Jun 2026 17:16:52 -0700
Message-ID: <20260613001652.2614612-1-x.wang@intel.com>
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

xe_memirq_init() is called from xe_tile_init(), before HW engines are
initialized. hwe_max_count() uses for_each_hw_engine() to size the
memirq BO, but at this point hwe->name is still NULL so the iterator
yields nothing and the BO is allocated with a single page, which is
insufficient on platforms where engine instances do not start at 0.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
 drivers/gpu/drm/xe/xe_memirq.c    |  6 ++----
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 98265293f2dc..16ff37756ddb 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1018,6 +1018,32 @@ u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 	return mask;
 }
 
+/**
+ * xe_hw_engine_max_instance - Get the maximum HW engine instance for a GT.
+ * @gt: the &xe_gt
+ *
+ * Compute the highest HW engine instance present on @gt based on the static
+ * engine mask. Unlike iterating with for_each_hw_engine(), this relies only on
+ * @gt->info.engine_mask (set during early PCI probe) and the static engine
+ * descriptor table, so it is valid even before hw engines are initialized
+ * (e.g. when sizing the `Memory Based Interrupts`_ report pages).
+ *
+ * Return: The maximum engine instance value on @gt.
+ */
+unsigned int xe_hw_engine_max_instance(struct xe_gt *gt)
+{
+	unsigned int max_instance = 0;
+	enum xe_hw_engine_id id;
+
+	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
+		if (gt->info.engine_mask & BIT(id))
+			max_instance = max(max_instance,
+					   (unsigned int)engine_infos[id].instance);
+	}
+
+	return max_instance;
+}
+
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index c3ee37f8cfc0..838abf7092a5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -55,6 +55,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
+unsigned int xe_hw_engine_max_instance(struct xe_gt *gt);
 struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
 void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 9dfe965cb46e..5a87ac42351d 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -175,13 +175,11 @@ static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
 static unsigned int hwe_max_count(struct xe_tile *tile)
 {
 	unsigned int max_instance = 0;
-	unsigned int gtid, hweid;
-	struct xe_hw_engine *hwe;
+	unsigned int gtid;
 	struct xe_gt *gt;
 
 	for_each_gt_on_tile(gt, tile, gtid)
-		for_each_hw_engine(hwe, gt, hweid)
-			max_instance = max(max_instance, hwe->instance);
+		max_instance = max(max_instance, xe_hw_engine_max_instance(gt));
 
 	return max_instance + 1;
 }
-- 
2.43.0

