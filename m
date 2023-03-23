Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81803C7619A
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 12:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573E010E089;
	Thu, 23 Mar 2023 12:00:03 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CE510E089
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 12:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679572801; x=1711108801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=boAdd8fxg21nDqWR9qckpmR3OrNvYs7Pw9BgOLaHpJc=;
 b=Hki1BQfmAkmzu/jbtnMnZMXlwMU3KMFwCcfe16dbeQWZ1AAeif/obVl2
 ZR84kGIsI8vWsqS71OR2x64U4iH/8YV7EPMc0IaFx+EI2UAn4KpY0IT6/
 mz8bYpIObXvXjqo1LjbHOEKlkIhi4ENP1QPbkrBOjIcAlz4lBGmQBV1M6
 0Tk1HbNWP75B8j5MeBCIY4ox6vRQRojScLoOJIkBdpJjQmieAxkIaw7zC
 NAAblRumA2Aetss8rLsqiyLnFwUSz3xrUbm5+Bzslty3hVLordLGNqJZW
 kU6gFnl3jd69iuiFFObhvfsvO8QpX6Qyj0r6O8lqB9AdUw5x9u8J0mBr+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404352497"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="404352497"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="751463211"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="751463211"
Received: from ehallina-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.2.208])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:59:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 11:59:22 +0000
Message-Id: <20230323115926.391900-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323115926.391900-1-matthew.auld@intel.com>
References: <20230323115926.391900-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/6] drm/xe/bo: refactor try_add_vram
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

Get rid of some of the duplication here. In a future patch we need to
also consider [fpfn, lpfn], so better adjust in only one place.

Suggested-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 86 ++++++++++++++------------------------
 1 file changed, 31 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index af4200aa949f..1c8e0fbaf1df 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -93,55 +93,42 @@ static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
 	}
 }
 
-static void try_add_vram0(struct xe_device *xe, struct xe_bo *bo,
-			  struct ttm_place *places, u32 bo_flags, u32 *c)
+static void add_vram(struct xe_device *xe, struct xe_bo *bo,
+		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
-	struct xe_gt *gt;
+	struct xe_gt *gt = mem_type_to_gt(xe, mem_type);
 
-	if (bo_flags & XE_BO_CREATE_VRAM0_BIT) {
-		gt = mem_type_to_gt(xe, XE_PL_VRAM0);
-		XE_BUG_ON(!gt->mem.vram.size);
+	XE_BUG_ON(!gt->mem.vram.size);
 
-		places[*c] = (struct ttm_place) {
-			.mem_type = XE_PL_VRAM0,
-			/*
-			 * For eviction / restore on suspend / resume objects
-			 * pinned in VRAM must be contiguous
-			 */
-			.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
-					     XE_BO_CREATE_GGTT_BIT) ?
-				TTM_PL_FLAG_CONTIGUOUS : 0,
-		};
-		*c += 1;
+	places[*c] = (struct ttm_place) {
+		.mem_type = mem_type,
+		/*
+		 * For eviction / restore on suspend / resume objects
+		 * pinned in VRAM must be contiguous
+		 */
+		.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
+				     XE_BO_CREATE_GGTT_BIT) ?
+			TTM_PL_FLAG_CONTIGUOUS : 0,
+	};
+	*c += 1;
 
-		if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
-			bo->props.preferred_mem_type = XE_PL_VRAM0;
-	}
+	if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
+		bo->props.preferred_mem_type = mem_type;
 }
 
-static void try_add_vram1(struct xe_device *xe, struct xe_bo *bo,
-			  struct ttm_place *places, u32 bo_flags, u32 *c)
+static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
+			 struct ttm_place *places, u32 bo_flags, u32 *c)
 {
-	struct xe_gt *gt;
-
-	if (bo_flags & XE_BO_CREATE_VRAM1_BIT) {
-		gt = mem_type_to_gt(xe, XE_PL_VRAM1);
-		XE_BUG_ON(!gt->mem.vram.size);
-
-		places[*c] = (struct ttm_place) {
-			.mem_type = XE_PL_VRAM1,
-			/*
-			 * For eviction / restore on suspend / resume objects
-			 * pinned in VRAM must be contiguous
-			 */
-			.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
-					     XE_BO_CREATE_GGTT_BIT) ?
-				TTM_PL_FLAG_CONTIGUOUS : 0,
-		};
-		*c += 1;
-
-		if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
-			bo->props.preferred_mem_type = XE_PL_VRAM1;
+	if (bo->props.preferred_gt == XE_GT1) {
+		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
+			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM1, c);
+		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
+			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM0, c);
+	} else {
+		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
+			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM0, c);
+		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
+			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM1, c);
 	}
 }
 
@@ -171,20 +158,9 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 
 	if (bo->props.preferred_mem_class == XE_MEM_REGION_CLASS_SYSMEM) {
 		try_add_system(bo, places, bo_flags, &c);
-		if (bo->props.preferred_gt == XE_GT1) {
-			try_add_vram1(xe, bo, places, bo_flags, &c);
-			try_add_vram0(xe, bo, places, bo_flags, &c);
-		} else {
-			try_add_vram0(xe, bo, places, bo_flags, &c);
-			try_add_vram1(xe, bo, places, bo_flags, &c);
-		}
-	} else if (bo->props.preferred_gt == XE_GT1) {
-		try_add_vram1(xe, bo, places, bo_flags, &c);
-		try_add_vram0(xe, bo, places, bo_flags, &c);
-		try_add_system(bo, places, bo_flags, &c);
+		try_add_vram(xe, bo, places, bo_flags, &c);
 	} else {
-		try_add_vram0(xe, bo, places, bo_flags, &c);
-		try_add_vram1(xe, bo, places, bo_flags, &c);
+		try_add_vram(xe, bo, places, bo_flags, &c);
 		try_add_system(bo, places, bo_flags, &c);
 	}
 	try_add_stolen(xe, bo, places, bo_flags, &c);
-- 
2.39.2

