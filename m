Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AE9C54E49
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 05:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9748E112EE7;
	Wed,  6 Mar 2024 05:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qvm2xp1d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E5C10F1BC
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 05:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709702396; x=1741238396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M7SypObqAl9UqR/Y/giyOBYHXgHfXq5BSqV0udHCQnw=;
 b=Qvm2xp1dK2nqN3O7DWHdCdrFyJHTdMUlb5ZMeQaFGrObfou1ZufIdiLt
 mQ4bv5CRydkMRkquA2d38j9CGm0e8S0/E/UozRIco44Zft/7SHx9R5jIM
 9o9BVSO1AvicIGL2wwXMlYqpJXibzODA/YXcmpQEHGPevKt6F+r3OGbU6
 ZfXGBbKUiXZCf542pJHK4VJ2a+vXwcLaam9MH+ZwjTvFigSTLE+i5ISmn
 WnS3GAsh8G6B802mPMGThmHlb+ojyw2JqG8vS42nv4W1CKlcYC9IZV97F
 2bOzT8R9ucv93nLl//kPIVRDuWpyQDhkR3jgK2JqNNZ6VqGG5Jqsnd/lg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4415014"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4415014"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="32789813"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:19:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: rodrigo.vivi@intel.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 4/4] drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
Date: Tue,  5 Mar 2024 21:20:02 -0800
Message-Id: <20240306052002.311196-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306052002.311196-1-matthew.brost@intel.com>
References: <20240306052002.311196-1-matthew.brost@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Considering the caller of the GGTT functions should keep the
backing storage alive before the function completes, it's not
necessary to invalidate with the GGTT lock held. This just adds
latency for every user of the GGTT.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 42e92011dd69..dc5a6994f1be 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -389,9 +389,6 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
-
-	if (bo->flags & XE_BO_GGTT_INVALIDATE_BIT)
-		xe_ggtt_invalidate(ggtt);
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
@@ -420,6 +417,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
+
+	if (!err && bo->flags & XE_BO_GGTT_INVALIDATE_BIT)
+		xe_ggtt_invalidate(ggtt);
 	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 
 	return err;
@@ -440,16 +440,16 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
 	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
-	mutex_lock(&ggtt->lock);
 
+	mutex_lock(&ggtt->lock);
 	xe_ggtt_clear(ggtt, node->start, node->size);
 	drm_mm_remove_node(node);
 	node->size = 0;
+	mutex_unlock(&ggtt->lock);
 
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
-	mutex_unlock(&ggtt->lock);
 	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
-- 
2.34.1

