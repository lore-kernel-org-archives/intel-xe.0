Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01830C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A74D10FB45;
	Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zaptd2sX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9EC10FAD9
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556581; x=1820092581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGehYAdkkgRvEP0s+HgFUHUoaVUAaV7Q1qMwHIFpQa4=;
 b=Zaptd2sXnZ3goLbF7vkqk/w1keTHC5qjWoDTd51BiahTcqTCj8AnGcTo
 qCcTUxlhW8z8y8N6Iye/gXGysc1SEczlG+RUWqmF9Pw3Flj5TV9XsfpV0
 ihlts6vgH5aGJ9qstwtqWRpOTKi1EujA/tZ2YlqADFpgLGUWBundnM+SV
 CwM93nRkzhscwmPxkHj6qsq7EL1QIQEQukp6GZ1mq/fLUj5Oy3vLDlw5S
 e4F+htypZnwSOIfaiUyJTuaAchiWTSy3JuDJUS5mC2hLGZM9lg2eT4Eec
 d2NYZxL5S7LIyVmuAbxvBj7k0A437SM7nXAY63C0/WHownpgLuqA2No3C w==;
X-CSE-ConnectionGUID: WIix2X0+T7WEaQXpMZAVIg==
X-CSE-MsgGUID: HVXFJIJ4TWWE5hfKLeJwRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096802"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
X-CSE-ConnectionGUID: K80AvzKkRy2WhiO+xkORUw==
X-CSE-MsgGUID: Qr6oYRnLQx+bwxf4pru7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563420"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 05/24] drm/xe: Update xe_bo_put_deferred arguments to
 include writeback flag
Date: Fri,  4 Sep 2026 14:15:54 -0700
Message-Id: <20260904211613.3934307-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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
index eede678ad303..01975586ee88 100644
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

