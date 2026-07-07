Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDDFC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 13:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D680910ECFA;
	Tue,  7 Jul 2026 13:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="avgsTFir";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E67410ECF3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783429608; x=1814965608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MjGJ2TilfZV+uYM5hY0bhKhqgo59e0tqgt9TVA7/L4E=;
 b=avgsTFirJzJTytFWDQwwLX1lHKnq40YqEMEDypAly9+ssSDuwX9r/QJ8
 8gGhKKQImikTSyUkIjc5QIcYRjK4GFliFi6OfvjS0Mh94LSoTkhq9T/Gl
 ik5boxXRGfBIA9ydM893PU4sVY3nHfVLfqMeUvS+rWFDIZ6ntK3K2OXN6
 7p217jLhsicjejUIrNE91nY3tmfiTFevuIqf9oST4Cpo1I4eZKqgBXlMy
 vsO3BVgRL8UNeABheJXOdwjHCRQQPK3cSYYoS++OiREe31xT/dW7nu5jv
 7z5p9EfacUWaMUFO7+LVWFoQrVNrU4BWRX0Bo0dyvDSnwBHSsejSIa0gP w==;
X-CSE-ConnectionGUID: NVNRVV3fSAa03U2gNmas4w==
X-CSE-MsgGUID: 5viQeDYWQs29yDbq9jEpHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84050120"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84050120"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 06:06:48 -0700
X-CSE-ConnectionGUID: gZ/F8qtgTraQbcYdED4C7A==
X-CSE-MsgGUID: u8bDECqqRIWrYpUg9ZzmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="250006199"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 06:06:45 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
Subject: [PATCH V11 04/11] drm/xe: Extend BO purge to handle vram pages as well
Date: Tue,  7 Jul 2026 18:36:17 +0530
Message-ID: <20260707130617.970638-17-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260707130617.970638-13-tejas.upadhyay@intel.com>
References: <20260707130617.970638-13-tejas.upadhyay@intel.com>
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

