Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F04C79F85
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62B510F83E;
	Fri,  4 Sep 2026 02:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoR2Kk2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAAD10E07F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788488535; x=1820024535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cm9QI4TthZESymJ9kZRrUc22TPos1r2hDZgtylGJbsM=;
 b=CoR2Kk2E4a0xKs75Nyc6jVtTXA2Fl8SkAWHdpKwzhVO2opKGolEPr6d0
 d8IfMpcOtDjmbc2V1l6RfLcZgg7TaoKDWRe2k0N1eb5W8alknFhYBhiNw
 kuprDO13/LLqDGHEAwgN0AILq+ea513otq1HFHOrNCLn0nG6bHt+HQDRx
 Yoii8cxlwpyDeZxxIcp3m3f/WSLajwV3Qn03/+8Fa+Luug1fmqBvRGEBB
 uVjZIwpiX4bBbCtfwpSafIkF7N4jTZl2BGBeLPTtazPraAbE/IgTltdTK
 8EhIGQnF6mvF4U/gqo6bKHP/RTZtAzKGIhRU+CHDWNAYcv8oSdyA3fjgm g==;
X-CSE-ConnectionGUID: b6ykZPXwQBWIW9Gq9GmxBw==
X-CSE-MsgGUID: 2wDYhiBJRTe5wVK/sEqkpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106506277"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106506277"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:14 -0700
X-CSE-ConnectionGUID: 870ywLnsTh6xsYvGXdlMUA==
X-CSE-MsgGUID: vnhEey+2SQuQ9ckDdesbBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275185118"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v5 05/25] drm/xe: Update xe_bo_put_deferred arguments to
 include writeback flag
Date: Thu,  3 Sep 2026 19:21:47 -0700
Message-Id: <20260904022207.3490018-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904022207.3490018-1-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
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

Update the xe_bo_put_deferred arguments to include a writeback flag,
which indicates whether the BO was added to the deferred list. This is
useful when the caller needs to take additional actions after the BO has
been queued for deferred release.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-6-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.h         | 10 ++++++++--
 drivers/gpu/drm/xe/xe_drm_client.c |  2 +-
 drivers/gpu/drm/xe/xe_pt.c         |  2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index e8081af5bfc1..6092f305ea8e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -495,6 +495,8 @@ void __xe_bo_release_dummy(struct kref *kref);
  * @bo: The bo to put.
  * @deferred: List to which to add the buffer object if we cannot put, or
  * NULL if the function is to put unconditionally.
+ * @added: BO was added to deferred list, written back to caller, can be NULL if
+ * writeback is not needed. Only set to true when added, never set to false.
  *
  * Since the final freeing of an object includes both sleeping and (!)
  * memory allocation in the dma_resv individualization, it's not ok
@@ -514,7 +516,8 @@ void __xe_bo_release_dummy(struct kref *kref);
  * false otherwise.
  */
 static inline bool
-xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
+xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred,
+		   bool *added)
 {
 	if (!deferred) {
 		xe_bo_put(bo);
@@ -524,6 +527,9 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 	if (!kref_put(&bo->ttm.base.refcount, __xe_bo_release_dummy))
 		return false;
 
+	if (added)
+		*added = true;
+
 	return llist_add(&bo->freed, deferred);
 }
 
@@ -540,7 +546,7 @@ xe_bo_put_async(struct xe_bo *bo)
 {
 	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
 
-	if (xe_bo_put_deferred(bo, &bo_device->async_list))
+	if (xe_bo_put_deferred(bo, &bo_device->async_list, NULL))
 		schedule_work(&bo_device->async_free);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index e116fb562c4c..4c424d1c6721 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -256,7 +256,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 			xe_assert(xef->xe, !list_empty(&bo->client_link));
 		}
 
-		xe_bo_put_deferred(bo, &deferred);
+		xe_bo_put_deferred(bo, &deferred, NULL);
 	}
 	spin_unlock(&client->bos_lock);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 854c0a59af71..3170df1f3fbf 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -213,7 +213,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 
 	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
 	xe_bo_unpin(pt->bo);
-	xe_bo_put_deferred(pt->bo, deferred);
+	xe_bo_put_deferred(pt->bo, deferred, NULL);
 
 	if (pt->level > 0 && pt->num_live) {
 		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
-- 
2.34.1

