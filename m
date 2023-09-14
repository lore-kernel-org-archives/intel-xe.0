Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E82EEAA71
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 21:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45F410E593;
	Thu, 14 Sep 2023 21:48:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709E610E593
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 21:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694728097; x=1726264097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fFrwan1cfw9FWcp7+2uxLo9wFINPW1e+2RYNPOuf2ak=;
 b=MBdGwsqcyIPJm4dtVxxlsOBLcYIYuYyMwHn8AFfzA7/5Ew0g50G4yT2J
 rPPMRKeI0wpw+62Hw7OqE8xREepMsCKI6en6VFFHrxGJwiEkwiQDbjTHt
 13i2cubH+iGVEH7bs1U9Ms+LNeAkIPeuRht3aAO/tSNREgEWpF9s71uHx
 ApJz2zxRXBfJ3S3OAsv5bIqJ5glWblWXeuUyzu3tbJ5rpsk8oaKsr5NiT
 x7U86kbfWVcJq2Tln4yTsKYOEz5DDuNYm8i0s7uj53RD676V0wJbTrtyT
 oa1ySt6BCJ+ZQ5DiErM8MgCjb+zToPd8s4mDg75aeOrFPhrCoN3DY2UjI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465454200"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="465454200"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 14:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721437969"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="721437969"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 14:48:08 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 14:48:02 -0700
Message-ID: <20230914214802.2834851-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Add child contexts to the GuC context
 lookup
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

The CAT_ERROR message from the GuC provides the guc id of the context
that caused the problem, which can be a child context. We therefore
need to be able to match that id to the exec_queue that owns it, which
we do by adding child context to the context lookup.

While at it, fix the error path of the guc id allocation code to
correctly free the ids allocated for parallel queues.

v2: rebase on s/XE_WARN_ON/xe_assert

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/590
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 44 ++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e928a20ba0cb..cf8c5f5fff56 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -246,10 +246,28 @@ int xe_guc_submit_init(struct xe_guc *guc)
 	return 0;
 }
 
+static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
+{
+	int i;
+
+	lockdep_assert_held(&guc->submission_state.lock);
+
+	for (i = 0; i < xa_count; ++i)
+		xa_erase(&guc->submission_state.exec_queue_lookup, q->guc->id + i);
+
+	if (xe_exec_queue_is_parallel(q))
+		bitmap_release_region(guc->submission_state.guc_ids_bitmap,
+				      q->guc->id - GUC_ID_START_MLRC,
+				      order_base_2(q->width));
+	else
+		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
+}
+
 static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	int ret;
 	void *ptr;
+	int i;
 
 	/*
 	 * Must use GFP_NOWAIT as this lock is in the dma fence signalling path,
@@ -276,30 +294,27 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	if (xe_exec_queue_is_parallel(q))
 		q->guc->id += GUC_ID_START_MLRC;
 
-	ptr = xa_store(&guc->submission_state.exec_queue_lookup,
-		       q->guc->id, q, GFP_NOWAIT);
-	if (IS_ERR(ptr)) {
-		ret = PTR_ERR(ptr);
-		goto err_release;
+	for (i = 0; i < q->width; ++i) {
+		ptr = xa_store(&guc->submission_state.exec_queue_lookup,
+			       q->guc->id + i, q, GFP_NOWAIT);
+		if (IS_ERR(ptr)) {
+			ret = PTR_ERR(ptr);
+			goto err_release;
+		}
 	}
 
 	return 0;
 
 err_release:
-	ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
+	__release_guc_id(guc, q, i);
+
 	return ret;
 }
 
 static void release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	mutex_lock(&guc->submission_state.lock);
-	xa_erase(&guc->submission_state.exec_queue_lookup, q->guc->id);
-	if (xe_exec_queue_is_parallel(q))
-		bitmap_release_region(guc->submission_state.guc_ids_bitmap,
-				      q->guc->id - GUC_ID_START_MLRC,
-				      order_base_2(q->width));
-	else
-		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
+	__release_guc_id(guc, q, q->width);
 	mutex_unlock(&guc->submission_state.lock);
 }
 
@@ -1491,7 +1506,8 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 		return NULL;
 	}
 
-	xe_assert(xe, q->guc->id == guc_id);
+	xe_assert(xe, guc_id >= q->guc->id);
+	xe_assert(xe, guc_id < (q->guc->id + q->width));
 
 	return q;
 }
-- 
2.41.0

