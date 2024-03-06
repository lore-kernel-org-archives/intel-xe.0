Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CF7C54E5C
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 05:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4596410F88C;
	Wed,  6 Mar 2024 05:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctqpotYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEF010EE18
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 05:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709702396; x=1741238396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sl1Z6yzfjmgzG7mV96hu5oj0fpCTMA0XbEbkJl0Bfwg=;
 b=ctqpotYSjbH68UB0a58SA1XCsj1g30b4m8eD5Y6WpgMDzyg7NFkiwXo7
 /zOL3nB+8oB/w2mQ4fUyr4urajStcD9ZiGteM9fNpjAPi8iZvvfSCdRx8
 Vazz6oMBWEnLGFf89A2dCnqmlDtG8o9i/bIIcfaBgzXLLALJoQ/DoP8m3
 jRWVf7QKZb2gfDNlP6vzdbl1VyxUrUxYmTSudI4xH1lasDAt8G4pAAl75
 +sYNxv3/SiIYKrf62D68nqvD+7kvOdNHh2Ak1yopxhAE+9YiCLgI/Ze8l
 Aw/JZhpKELD7SzoJtjljVFa/MB4KP405hvdrBcmNNmgraaoZQ7Lq6yfv4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4415012"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4415012"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="32789807"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:19:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: rodrigo.vivi@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/4] drm/xe: Drop ggtt invalidate from display code
Date: Tue,  5 Mar 2024 21:20:00 -0800
Message-Id: <20240306052002.311196-3-matthew.brost@intel.com>
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

Only buffers mapped in the GGTT used by the GuC require an invalidation.
Display buffers do not require an invalidation. Delete the invalidatio
from display code and make invalidation a static function in xe_ggtt.c.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 +--
 drivers/gpu/drm/xe/xe_ggtt.c           | 4 +++-
 drivers/gpu/drm/xe/xe_ggtt.h           | 1 -
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..a6acee04e90b 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -238,7 +238,6 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 					   rot_info->plane[i].dst_stride);
 	}
 
-	xe_ggtt_invalidate(ggtt);
 out_unlock:
 	mutex_unlock(&ggtt->lock);
 out:
@@ -381,4 +380,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 325337c38961..cc60ea08fc84 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -200,6 +200,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 }
 
+static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
+
 static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 {
 	struct drm_mm_node *hole;
@@ -261,7 +263,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
 }
 
-void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
+static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 {
 	/* Each GT in a tile has its own TLB to cache GGTT lookups */
 	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 42705e1338e1..dc9631d20720 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -11,7 +11,6 @@
 struct drm_printer;
 
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
-void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
-- 
2.34.1

