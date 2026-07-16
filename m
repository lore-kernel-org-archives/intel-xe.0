Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE53C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379DE10F289;
	Thu, 16 Jul 2026 10:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ayx8WHMH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD16710F289
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784198411; x=1815734411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=etDkq0TmQ2fnsoAH3FM+s/loouXjcBx8fUA8MoFQYRs=;
 b=Ayx8WHMHJuoVQwz2Rxcj20m0GpV6J+lWhJatRa7a+FbfYPWfr/WZbR9m
 Mg6quseGR0BNsTrHySDyEV/w+oeXJzZiVvnWEv3SaXGo8SigDGnR/Aifn
 wqdmb3QZfaU6MoSQO53WDRYRp0GyjLHWDyKayOfHlxDYiQiFHddKKwITK
 v1hrpCQq+gKDMd/hKIWdEoWqfiOVbNTi5c+il0uzCQqcPmOiQoc/YR6y6
 C5SClMQGRNcYNH90pYT2HurQTzdxyC9MI6nCydN7HjBhzHxqOWO/JN1mw
 EpJSF1P5o+oCspeaGtDINJPX0UBcNNnGNyP2DGDhym6uSxF9PkDZAGRQ0 g==;
X-CSE-ConnectionGUID: aV3rpcYcSJyPXlxBApZtvA==
X-CSE-MsgGUID: bH2peyNETP6/bsJoBt3rmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84813479"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84813479"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:40:11 -0700
X-CSE-ConnectionGUID: WXXxVGPLT+efe151Lj+92w==
X-CSE-MsgGUID: e4VzRj5oSGyNg2HFIKNhSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253053895"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:40:09 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
Subject: [PATCH V13 04/11] drm/xe: Extend BO purge to handle vram pages as well
Date: Thu, 16 Jul 2026 16:09:52 +0530
Message-ID: <20260716103949.1554216-17-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716103949.1554216-13-tejas.upadhyay@intel.com>
References: <20260716103949.1554216-13-tejas.upadhyay@intel.com>
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
index c266fa6bade1..66fefe65cfcb 100644
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
index 7ae1d9ac0574..9bd4221be8d8 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -585,6 +585,7 @@ struct xe_bo_shrink_flags {
 long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
+int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.52.0

