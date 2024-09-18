Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A74CDD55E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 22:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4DC10E661;
	Wed, 18 Sep 2024 22:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQGstaKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A3F10E659
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726697421; x=1758233421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k/uqqdSqTZ6jxDgwWViggBgBkSG5bpkaw4liWepyZQQ=;
 b=IQGstaKirx1aqTULRnHpALih4SuB5cMOV0npw2fPoXe7RY9lvjV9vJi9
 XI88yKZmy14oM5nwGFh+R/27Ee92pXeR+au3h6qYEZirN/elfeSAeo9gZ
 WIhNbT8esJigTbpMnouhAybS0A8dhL80RZzTM5a2xDnLY+LOR3wgaokKH
 Ten52XHB+PnC7TgZC8KFTWhgjym1COteqaOb/aPyDbFNiCuh6aVJRIf5j
 M1uXR/johjcJZFCmmAUJUpHWz5WHa1IAjK8YfvHbWdzEs6UoiwxeYR9Wr
 yfO/Pa9TOBeAy6uPgHF2ZUUb0Z1BD+eJsKIUBRbcs73Y9oHCy+nkahW/P Q==;
X-CSE-ConnectionGUID: R4/cbITBRK+0paFv+LSLWg==
X-CSE-MsgGUID: 1QDSND2tRWmjeewo4WgkPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="48164388"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="48164388"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 15:10:04 -0700
X-CSE-ConnectionGUID: FxKagt8XRDqwJqZEaxT5jg==
X-CSE-MsgGUID: MSEm3i/oTICUwReWewAc7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="69963019"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2024 15:10:03 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 1/1] drm/xe: Add null pointer check for xe_migrate_copy
Date: Wed, 18 Sep 2024 15:10:00 -0700
Message-Id: <20240918221000.1124248-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918221000.1124248-1-zhanjun.dong@intel.com>
References: <20240918221000.1124248-1-zhanjun.dong@intel.com>
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

Add null pointer check for parameter src.
Update lack source flag to include resource is null case in xe_bo_move
before xe_migrate_copy called.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5f2f1ec46b57..761130f0e9a9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
 			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
 
-	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
-						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
+	move_lacks_source = !old_mem ? true : (handle_system_ccs ? (!bo->ccs_cleared)  :
+					       (!mem_type_is_vram(old_mem_type) && !tt_has_data));
 
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
 		(!ttm && ttm_bo->type == ttm_bo_type_device);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cfd31ae49cc1..45bba0d731ec 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -774,14 +774,22 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	u64 src_L0, dst_L0;
 	int pass = 0;
 	int err;
-	bool src_is_pltt = src->mem_type == XE_PL_TT;
-	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
-	bool src_is_vram = mem_type_is_vram(src->mem_type);
-	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
-	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
-		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
-	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
-	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
+	bool src_is_pltt, dst_is_pltt;
+	bool src_is_vram, dst_is_vram;
+	bool copy_ccs, copy_system_ccs;
+	bool use_comp_pat;
+
+	if (!src)
+		return ERR_PTR(-EINVAL);
+
+	src_is_pltt = src->mem_type == XE_PL_TT;
+	dst_is_pltt = dst->mem_type == XE_PL_TT;
+	src_is_vram = mem_type_is_vram(src->mem_type);
+	dst_is_vram = mem_type_is_vram(dst->mem_type);
+	copy_ccs = xe_device_has_flat_ccs(xe) && xe_bo_needs_ccs_pages(src_bo) &&
+		xe_bo_needs_ccs_pages(dst_bo);
+	copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
+	use_comp_pat = xe_device_has_flat_ccs(xe) &&
 		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
-- 
2.34.1

