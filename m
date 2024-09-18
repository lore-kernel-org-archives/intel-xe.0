Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0E7CDD549
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 16:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3489510E290;
	Wed, 18 Sep 2024 16:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CF7MLbf4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1562810E5E1
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726677648; x=1758213648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=916+um0oAvKH9LZKp8sfMk9DIDEKbVR9u6m+FgdQHGo=;
 b=CF7MLbf4DGrr80RmYLkkY2jlYUiEfSvgizDf+ibSeAxowPQnd6pNXOvj
 /cHhOngDwXAITTztvhZhxPWl/IzRS7cqFJ2c4gp6Rn5e804l/d5Qg6sSp
 QGH0JDFKCK5RpeluUNaLFgOfPpS2dOJgakMJgAegCS9NWO8c1SAwgIShp
 JEK8hgQ91HZx4RbonW15La98lZ9YCw03DubKn7rxb88Q4MAYJ0UKsFyI0
 JPV32m0KJ4evd+GD0cn7zHl1kHiWbOQghBjhoWpO65YTf3NW1NQf+uUdN
 9mMYi9XQCfh9J4nLtpUozbLW+6iYOS5cPv647IsJzPuFOHjAEkhEsx6gt g==;
X-CSE-ConnectionGUID: X8LEyqLfRnGLPQs41aY+5w==
X-CSE-MsgGUID: V+SaV119SL6r3drEb23WIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25751934"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25751934"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:40:48 -0700
X-CSE-ConnectionGUID: ORiz5BR8T4yH4mAgsX28FQ==
X-CSE-MsgGUID: ADFG1YwDRme7kQ0v+DXSxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="70091009"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 18 Sep 2024 09:40:47 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 1/7] drm/xe: Add null pointer check for xe_migrate_copy
Date: Wed, 18 Sep 2024 09:40:40 -0700
Message-Id: <20240918164046.1086803-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918164046.1086803-1-zhanjun.dong@intel.com>
References: <20240918164046.1086803-1-zhanjun.dong@intel.com>
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

