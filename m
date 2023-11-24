Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C387C636BD
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 09:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE76E10E7C2;
	Fri, 24 Nov 2023 09:11:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B1D10E7BA
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700817094; x=1732353094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TtCpxMmc4ZtNDSD5FuNy0/nEDWqFxeS3wo2crVWT6bQ=;
 b=YY9BC5qXYGNQs3QNQc2A7q8GSU9gRq/Glg/tzERdI2cOM/pzI3xbzWuL
 KW5akWMn9MxLo0DXK911H/4z6Z0EsjjaL6yeBzRBkTKk0HoABR4GR/BgB
 537GGWdAe6IeALAXJB4Lkn09tXBDLC1yhxLdnDhb9ugHiHXxc+cLaEU/8
 KgS5ShMqM3MK40rI0uDkLVAH9lYOTPLDPjboSwn1F8iMeECHtldraF7oH
 sYu8isXcCrR10j41dw/L8p5a7QCM6JwFo1nxhPuLe/WlIbQOoXIG2Xe3h
 fCLwStTo5uFNrsIhHjnKiZ92NFtt3BSBZdOh0d/jzwWWPGDDWtiB279hl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377423913"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="377423913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 01:11:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771208057"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="771208057"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 01:11:32 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 10:11:08 +0100
Message-ID: <20231124091111.77269-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124091111.77269-1-thomas.hellstrom@linux.intel.com>
References: <20231124091111.77269-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/4] drm/xe: Ensure that we don't access the
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
Reviewed-by: Ohad Sharabi <osharabi@habana.ai> #v1
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231123153158.12779-2-thomas.hellstrom@linux.intel.com
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

