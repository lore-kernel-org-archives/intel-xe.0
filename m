Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF577CCD197
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB3110E8FD;
	Wed,  8 Oct 2025 21:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abx9sl1E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D5510E8A9
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959941; x=1791495941;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=G/j2zqv9oYoJr/d9VkB/HFqqxnuK/8oCAHDZaeD9o74=;
 b=abx9sl1EnedAFGoou6Tp4VMbezQuBQ3YgTImd6WomY1GvfbOQVjqZfY1
 fIqWeq2kFtYH5WFmP4rGoF7ADHkmCQUMXpIM9+miUgdPaMIRbTVSCtG7D
 aaOos7Umr4tm8zuFy3gpQQI7sFvugkcVUzVijGkFvTsXjJiToGaGD7ScW
 +kUfVMK//V2i49j15l4ygvmPpdaABtABrAOsI0D8imiS9ErE42gJHgOSS
 Cw2uew2hEYBPFEXU7rKEwKAq5eT+JmjM5zLuElghGdf63Qglv9OynQclA
 RcYwGGbet538nooc/HaK3r0G69jU/lYt4vkhuukjeZWM1ESOV/ejnmL1v w==;
X-CSE-ConnectionGUID: V9FJdKdkSv2uULyaLIj+sA==
X-CSE-MsgGUID: 1y+xtGISQZC+c4OP56nlvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726854"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:41 -0700
X-CSE-ConnectionGUID: U9gUq1thRaS5y9zDF/Kh9Q==
X-CSE-MsgGUID: DpCaNnJPTBix5rsp5Tl/TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635192"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 12/34] drm/xe: Move GGTT lock init to alloc
Date: Wed,  8 Oct 2025 14:45:10 -0700
Message-Id: <20251008214532.3442967-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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

