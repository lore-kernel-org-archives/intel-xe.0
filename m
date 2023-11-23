Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B5BC624B4
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 15:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADCA10E0B4;
	Thu, 23 Nov 2023 15:32:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED57010E09E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700753555; x=1732289555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Raofwp6vON6SP+ctQ+HjeaTbAsuJHLz26bZg6JLLwNA=;
 b=jPYx15e2GjUyPnKqmUByd5xTJKFesXVm4G0JIWGHTGCLQu70DbXJkQt/
 nxBY9wbzFUSnzLiv8zz98yj8YqXEZ0t1jBM1jxyMJb36LvB6ZF+6WPRb/
 Ami2iXck4QJAkaQaUIhSU6RRBid01TI3UDt6u3uqyj0HE/s+HhjZkTgYH
 LBSPc/c28TlJsxIp9yEciRnkOUgbjts36/Z0whR/rM6khQRr2mGy/xaiu
 +nW3NLCEpt85S18/78H3LtxpeVH9sezNlFzoIcbuMRwynSW9OVZVNOw3B
 eC35rhh9YdsszCjWxtrdIm0sI07xxGyXIRa+y1knDJUHDtEOTDwDB5Xl1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377314371"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="377314371"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 07:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="8697381"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.177])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 07:32:29 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Nov 2023 16:31:55 +0100
Message-ID: <20231123153158.12779-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
References: <20231123153158.12779-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/4] drm/xe: Ensure that we don't access the
 placements array out-of-bounds
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Ensure, using xe_assert that the various try_add_<placement> functions
don't access the bo placements array out-of-bounds.

v2:
- Remove the places argument to make sure the xe_assert operates on
  the array we're actually populating. (Matthew Auld)

Suggested-by: Ohad Sharabi <osharabi@habana.ai>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 39 +++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4305f5cbc2ab..9bbb3d70ca21 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -121,11 +121,13 @@ static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
 	return to_xe_ttm_vram_mgr(mgr)->vram;
 }
 
-static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
+static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 			   u32 bo_flags, u32 *c)
 {
+	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
+
 	if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
-		places[*c] = (struct ttm_place) {
+		bo->placements[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_TT,
 		};
 		*c += 1;
@@ -170,26 +172,30 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
-			 struct ttm_place *places, u32 bo_flags, u32 *c)
+			 u32 bo_flags, u32 *c)
 {
+	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
+
 	if (bo->props.preferred_gt == XE_GT1) {
 		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
-			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM1, c);
+			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
 		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
-			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM0, c);
+			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
 	} else {
 		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
-			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM0, c);
+			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
 		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
-			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM1, c);
+			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
 	}
 }
 
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
-			   struct ttm_place *places, u32 bo_flags, u32 *c)
+			   u32 bo_flags, u32 *c)
 {
+	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
+
 	if (bo_flags & XE_BO_CREATE_STOLEN_BIT) {
-		places[*c] = (struct ttm_place) {
+		bo->placements[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_STOLEN,
 			.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
 					     XE_BO_CREATE_GGTT_BIT) ?
@@ -202,7 +208,6 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 				       u32 bo_flags)
 {
-	struct ttm_place *places = bo->placements;
 	u32 c = 0;
 
 	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
@@ -210,22 +215,22 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 	/* The order of placements should indicate preferred location */
 
 	if (bo->props.preferred_mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM) {
-		try_add_system(bo, places, bo_flags, &c);
-		try_add_vram(xe, bo, places, bo_flags, &c);
+		try_add_system(xe, bo, bo_flags, &c);
+		try_add_vram(xe, bo, bo_flags, &c);
 	} else {
-		try_add_vram(xe, bo, places, bo_flags, &c);
-		try_add_system(bo, places, bo_flags, &c);
+		try_add_vram(xe, bo, bo_flags, &c);
+		try_add_system(xe, bo, bo_flags, &c);
 	}
-	try_add_stolen(xe, bo, places, bo_flags, &c);
+	try_add_stolen(xe, bo, bo_flags, &c);
 
 	if (!c)
 		return -EINVAL;
 
 	bo->placement = (struct ttm_placement) {
 		.num_placement = c,
-		.placement = places,
+		.placement = bo->placements,
 		.num_busy_placement = c,
-		.busy_placement = places,
+		.busy_placement = bo->placements,
 	};
 
 	return 0;
-- 
2.41.0

