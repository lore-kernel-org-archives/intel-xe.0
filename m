Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638F6C07545
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 18:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E5110E6C6;
	Wed, 25 Oct 2023 18:00:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55EC10E6C8
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698256809; x=1729792809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f5V/AleyhQTynQcs41XzMZMZx5ZLTEjgYZiA0W4WYEQ=;
 b=JFl3mXyrr0+ZIzycd2yQrd5mHpo/m54ymQ1imMqQsOqGWywJB4H3F0ap
 isMfkIcLR/5SWlvFjTt9UmGcjcjJ09pfUvtvz3JJCoDgKRwwblC/aCs89
 qFweRx9Lg+eyxotasVd8dasg6UPWHmlCnNoqcH1k+qrUuUf6ZNWI57NP6
 q83/l+zWhpOsCbxVSApLSidcM1Cot7nC0wnwn/e6dMrOJOw0kZTuexIqA
 UPfoZHLuJ9md3fb/PRNSrLmEvpGNZ86NqRYjs/zmnAjI0M4sgUhSCAkke
 NFIgfAMMwT2fDcsXIzYF3wZwQx/+T84m4et60CZRL9YWbBGYJ5orZmNWv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="8922328"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="8922328"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 11:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735470644"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="735470644"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 11:00:08 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 11:00:07 -0700
Message-Id: <20231025180008.24167-3-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20231025180008.24167-1-brian.welty@intel.com>
References: <20231025180008.24167-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Remove unused xe_bo_to_tile
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Unused and would like to remove the memtype_to_tile() which it calls.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 13 -------------
 drivers/gpu/drm/xe/xe_bo.h |  2 --
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..795234886f7e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -109,19 +109,6 @@ mem_type_to_tile(struct xe_device *xe, u32 mem_type)
 	return &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
 }
 
-/**
- * xe_bo_to_tile() - Get a tile from a BO's memory location
- * @bo: The buffer object
- *
- * Get a tile from a BO's memory location, should be called on BOs in VRAM only.
- *
- * Return: xe_tile object which is closest to the BO
- */
-struct xe_tile *xe_bo_to_tile(struct xe_bo *bo)
-{
-	return mem_type_to_tile(xe_bo_device(bo), bo->ttm.resource->mem_type);
-}
-
 static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
 			   u32 bo_flags, u32 *c)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 4e74201cc986..98ed35cf39a3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -113,8 +113,6 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 			      u32 bo_flags);
 
-struct xe_tile *xe_bo_to_tile(struct xe_bo *bo);
-
 static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
 {
 	return container_of(bo, struct xe_bo, ttm);
-- 
2.38.0

