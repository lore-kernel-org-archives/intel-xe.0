Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C19CCD18E
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8DA10E88D;
	Wed,  8 Oct 2025 18:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G22My5gX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE1210E882
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946709; x=1791482709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=G/j2zqv9oYoJr/d9VkB/HFqqxnuK/8oCAHDZaeD9o74=;
 b=G22My5gXkAEmpUqbHrzqlDL/MLQz7n07bXSX59XNe/DvouuSa/jplP2G
 JED6aqBVX36aVvKr2i4CPrm4JuCIqJyyBHZc9obLjy07/b3d1eqnyUyO1
 jH0p8vbXSWcEw2M94AZdPolaVhzvODZmdfIbrdc13AG5Sxt/wRzpjFVAV
 eaK/XFONpedP3T9QEu2i6XofW2AT7myakuYJv4fqzm7jWmudYgfHC/8lC
 MdeyGCdDQIr6dUIGNrMINVtFAQxwQuA1tGHDqriPt+W/zYxxHcF9D0VAY
 +XoG/7TfCh/D89iDWgQvY3u5pJdTi9HvjYDVev3OvGg5kO+j3WPZR4dst Q==;
X-CSE-ConnectionGUID: 3acWpJ2yQZ+eMX25T3p6bg==
X-CSE-MsgGUID: qV6v/e14Tlu9iKuFWJjI8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067522"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: pZxvT0NaToiM54/BRJKgiQ==
X-CSE-MsgGUID: APEffdhvRSybmffX7PeRcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593729"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 12/34] drm/xe: Move GGTT lock init to alloc
Date: Wed,  8 Oct 2025 11:04:38 -0700
Message-Id: <20251008180500.3261209-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
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

