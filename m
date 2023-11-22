Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293DFC61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 11:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E321310E600;
	Wed, 22 Nov 2023 11:04:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A18A10E5F9
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700651056; x=1732187056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U6Fff5LxfB3e5JcpVPOpflxn15/7PNg4vK13qRMK+Po=;
 b=FhIyIm3rWNASrFNthmODJbbVa+S52xxGTkrSKv6R1ZzUeDA30ua+82sL
 GEguSGTr5B+IVG07YzIolPM+AH58tczO3SMgwLOy+5E1YyXS2md0+pBW9
 ZaH7BGp685VBoY+WXPzFWTth1FfkD0xH6Z0nL2yYwL85/9ePiOw5oOHkO
 FjYbDhyYubZniNmZ7Tt1vpY+j4GdWfMnMp0Rl3QmGvlsaSXc311x1Eq47
 qck1KxVnMhjO7zFOf6vYHGnBEwIFZCug+fCY+7jnFkrVt/w7LEn8/uVn8
 HpxFODoEyuB/Cv7pfsZi15OjW/uH6lmt8bCIB5zeZjS8YotTzo31HdJNP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5224024"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="5224024"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 03:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="14868086"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.158])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 03:04:14 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 12:03:56 +0100
Message-ID: <20231122110359.4087-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe: Ensure that we don't access the
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Ensure, using xe_assert that the various try_add_<placement> functions
don't access the bo placements array out-of-bounds.

Suggested-by: Ohad Sharabi <osharabi@habana.ai>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4305f5cbc2ab..915910b87faa 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -121,9 +121,11 @@ static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
 	return to_xe_ttm_vram_mgr(mgr)->vram;
 }
 
-static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
-			   u32 bo_flags, u32 *c)
+static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
+			   struct ttm_place *places, u32 bo_flags, u32 *c)
 {
+	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
+
 	if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
 		places[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_TT,
@@ -172,6 +174,8 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 			 struct ttm_place *places, u32 bo_flags, u32 *c)
 {
+	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
+
 	if (bo->props.preferred_gt == XE_GT1) {
 		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
 			add_vram(xe, bo, places, bo_flags, XE_PL_VRAM1, c);
@@ -188,6 +192,8 @@ static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 			   struct ttm_place *places, u32 bo_flags, u32 *c)
 {
+	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
+
 	if (bo_flags & XE_BO_CREATE_STOLEN_BIT) {
 		places[*c] = (struct ttm_place) {
 			.mem_type = XE_PL_STOLEN,
@@ -210,11 +216,11 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 	/* The order of placements should indicate preferred location */
 
 	if (bo->props.preferred_mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM) {
-		try_add_system(bo, places, bo_flags, &c);
+		try_add_system(xe, bo, places, bo_flags, &c);
 		try_add_vram(xe, bo, places, bo_flags, &c);
 	} else {
 		try_add_vram(xe, bo, places, bo_flags, &c);
-		try_add_system(bo, places, bo_flags, &c);
+		try_add_system(xe, bo, places, bo_flags, &c);
 	}
 	try_add_stolen(xe, bo, places, bo_flags, &c);
 
-- 
2.41.0

