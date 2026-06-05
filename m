Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24353CD8C80
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84D2112AF0;
	Fri,  5 Jun 2026 12:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HL6122DB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8A4112AF0
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 12:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780663147; x=1812199147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MjGJ2TilfZV+uYM5hY0bhKhqgo59e0tqgt9TVA7/L4E=;
 b=HL6122DBKlKjcY9iUDa4y06dcjdUSPsbCwed+P/HXYykMuyX3C02eCvN
 HAoEbHXgtuUweF3zQRCuK8nKWNDCfbIZf4v2jT4qOZ4/DSurHEDx6/BGK
 JWXvV0KdXyzBApoaqXHqKPvGpRHWiVGYzxsW1azvsUSji6PIEJB1Lqj0y
 VclfBySRLij7sCkLrYuTjN84jIx86YPb0PpKdRo4J4x7DdPy0MyLhymXz
 0E7+PLNOxP7sR35ngLv1eOR/y3535IXj4PWbsAvEzxqbe9JEesNu+FGd6
 zWJ6MTKWyBcphecCqtowDj2Qx8hipH5NWS8NVggE+NdDqln8dA2MGW4Fm A==;
X-CSE-ConnectionGUID: BbE+GZ+9QcuQCVDPmTVYNQ==
X-CSE-MsgGUID: 91mpG/MoTbiMwt1aCFrYMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="106937343"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="106937343"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 05:39:07 -0700
X-CSE-ConnectionGUID: WNd1JUSnQwKy53WsogdCfA==
X-CSE-MsgGUID: vQUzz90KR3it1J7jKMY2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249938916"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 05:39:06 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
Subject: [PATCH V11 05/12] drm/xe: Extend BO purge to handle vram pages as well
Date: Fri,  5 Jun 2026 18:08:43 +0530
Message-ID: <20260605123839.236021-19-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260605123839.236021-14-tejas.upadhyay@intel.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
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

Recent driver update introduce support for purgeable buffer
objects (BOs), extending the API to include VRAM pages to
better manage memory pressure and enable memory offlining.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +----
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4c80bac67622..3c2513e4cb17 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -909,7 +909,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
  *
  * Return: 0 on success, negative error code on failure
  */
-static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct ttm_placement place = {};
@@ -917,9 +917,6 @@ static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operatio
 
 	xe_bo_assert_held(bo);
 
-	if (!ttm_bo->ttm)
-		return 0;
-
 	if (!xe_bo_madv_is_dontneed(bo))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6340317f7d2e..8f9f16043c4c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -584,6 +584,7 @@ struct xe_bo_shrink_flags {
 long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
+int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.52.0

