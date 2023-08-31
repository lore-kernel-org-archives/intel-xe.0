Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF118C83F01
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 00:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B943610E63B;
	Thu, 31 Aug 2023 00:29:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6958110E63B
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 00:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693441783; x=1724977783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=breVq9hrsr348WTQSXpR6OcvIF8RQ53wj9nn9czhYTQ=;
 b=DnRmtqnAvLeXuqGu/YUsVE8o9T+qVW0l+fJ5pI/7y5HLTFLDWFGHRIUZ
 /zxetcI2Kh7OKxFuliT6kREzNKkr3mgrbMDYmPZMpdTR/9d+Ue6uoKPv0
 qUHkTgbpfvUpSK9n/qQZNHJm6i0ZhQa3nnU4+j2boWwZjxgyjqFb3/xkV
 2omTdIsjL+cYYOQYmvHfSBv3SVrOWYvZRJwiwTZfDC3WBlpRsZpvGJ3XU
 ZbriM0IpXExYFWAODRI8SfD0bQcagoEizyPbApBJsajUmctBn07jS7lS6
 luk26DVONs2vfCjOthrU7z7Ts++d9i86gj1WR3DctRU4GmRRTcQrwX8i4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="439732479"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="439732479"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 17:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809340094"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="809340094"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 17:29:42 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 30 Aug 2023 17:29:31 -0700
Message-ID: <20230831002931.2327568-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add child contexts to the GuC context
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

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/590
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 44 ++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c6a9e17d6889..f912b6fd51ad 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -245,10 +245,28 @@ int xe_guc_submit_init(struct xe_guc *guc)
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
@@ -275,30 +293,27 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
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
 
@@ -1473,7 +1488,8 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 		return NULL;
 	}
 
-	XE_WARN_ON(q->guc->id != guc_id);
+	XE_WARN_ON(guc_id < q->guc->id);
+	XE_WARN_ON(guc_id > (q->guc->id + q->width - 1));
 
 	return q;
 }
-- 
2.41.0

