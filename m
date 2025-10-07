Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9E2CCD196
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E523710E6A3;
	Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WELBLXSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2213110E197
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842312; x=1791378312;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9LzeuKGkaT4XWhx7jQITCKODc1pm5SF2tj3lPf/dMSU=;
 b=WELBLXSJgpT7iyU9y0f+o4SOg+oxvNeMZ/vzKekyYWn42ULGSyYsK7DT
 e2ROnfsDDvLlP4pnF2RohifUE6sHfklcBF9q0yk1rjLROh6uraqYS6Hbd
 tqCkq2QyPnJxws8Ltz5fm5ebOeaebRZFypSF8dr4xq0oIwcKClnt843ia
 t7jydFKS03D+ilDZe0A/aUvoF7H9swotMeRKyZmoFI+AAU/N+S1MNtZtb
 +TfmTuPyrOrabXcb99EGlJKKNcJvW8SnyFQFxBJSKNtZSTA6fEj0zFAdT
 VGMPU48sXHA7rgT4lB5otAM2IEp6+rY/idETfuWbqXTkkHXRsUGc+qvbX g==;
X-CSE-ConnectionGUID: nqlNjWPrS5CxN3C22FTpCQ==
X-CSE-MsgGUID: 9T+WHgoWT4ClaFvUyLD1Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639832"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639832"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:12 -0700
X-CSE-ConnectionGUID: 7tXtN1HzQrS+0iNhVpUZbg==
X-CSE-MsgGUID: 2tF8rLXhRIKUwHs//0hLUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576939"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 12/33] drm/xe: Move GGTT lock init to alloc
Date: Tue,  7 Oct 2025 06:04:44 -0700
Message-Id: <20251007130505.2694829-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

The GGTT lock is needed very early during GT initialization for a VF;
move the GGTT lock initialization to the allocation phase.

v8:
 - Rework function structure (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 39 +++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7fdd0a97a628..aca7ae5489b9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -159,6 +159,16 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	}
 }
 
+static void primelockdep(struct xe_ggtt *ggtt)
+{
+	if (!IS_ENABLED(CONFIG_LOCKDEP))
+		return;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&ggtt->lock);
+	fs_reclaim_release(GFP_KERNEL);
+}
+
 /**
  * xe_ggtt_alloc - Allocate a GGTT for a given &xe_tile
  * @tile: &xe_tile
@@ -169,9 +179,19 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
  */
 struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile)
 {
-	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
-	if (ggtt)
-		ggtt->tile = tile;
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_ggtt *ggtt;
+
+	ggtt = drmm_kzalloc(&xe->drm, sizeof(*ggtt), GFP_KERNEL);
+	if (!ggtt)
+		return NULL;
+
+	if (drmm_mutex_init(&xe->drm, &ggtt->lock))
+		return NULL;
+
+	primelockdep(ggtt);
+	ggtt->tile = tile;
+
 	return ggtt;
 }
 
@@ -180,7 +200,6 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 	struct xe_ggtt *ggtt = arg;
 
 	destroy_workqueue(ggtt->wq);
-	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
 
@@ -198,16 +217,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 }
 #endif
 
-static void primelockdep(struct xe_ggtt *ggtt)
-{
-	if (!IS_ENABLED(CONFIG_LOCKDEP))
-		return;
-
-	fs_reclaim_acquire(GFP_KERNEL);
-	might_lock(&ggtt->lock);
-	fs_reclaim_release(GFP_KERNEL);
-}
-
 static const struct xe_ggtt_pt_ops xelp_pt_ops = {
 	.pte_encode_flags = xelp_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
@@ -227,8 +236,6 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
 {
 	drm_mm_init(&ggtt->mm, reserved,
 		    ggtt->size - reserved);
-	mutex_init(&ggtt->lock);
-	primelockdep(ggtt);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
-- 
2.34.1

