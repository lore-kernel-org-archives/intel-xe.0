Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6C8C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 15:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D1C10E28D;
	Fri, 24 Nov 2023 15:34:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ACA10E28D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700840051; x=1732376051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TtCpxMmc4ZtNDSD5FuNy0/nEDWqFxeS3wo2crVWT6bQ=;
 b=n5nTb/NQ6hRcKHeZnJN8cNHjnaTul6wBF2qMagWz/Gq4juiAesoAojJ0
 ROK0lY+41v8MYTma/CPlaUMtLiFltXgMsnAR1EIEoHswj4XdZQmvJDpcW
 26w+hhangDfTdYoXKcHXEq8mhQtGa72DPm2Kuhj/Ao6S82LWN/hnAGXv8
 kMflXkYhtuOVn5ekQXhyIwzkwwUFfjQ15QvBX1uQaHyMEyo/lzhCysc4u
 DZiyxa/aHwIM/6ONF78o9eH1LZbeHKQtxVwuZcnKk2bUM+V2mXLlaZWR+
 Cmd6E0/xB9DMsKQRoHoJJ/w42zh3vjyoUKgERgoqiz9P9Tt+U2zepPVQT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391315667"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="391315667"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:34:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="796615246"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="796615246"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:34:09 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 16:33:42 +0100
Message-ID: <20231124153345.97385-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124153345.97385-1-thomas.hellstrom@linux.intel.com>
References: <20231124153345.97385-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/4] drm/xe: Ensure that we don't access the
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

