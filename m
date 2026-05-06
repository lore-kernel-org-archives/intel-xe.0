Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F04CD343B
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 14:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E5D10EDCE;
	Wed,  6 May 2026 14:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LutcPzjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D245910EDCC
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778076730; x=1809612730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZPIbQ+D86woQQZ9HUd3eRwj6D9KKHuXck+/tTeZZhJg=;
 b=LutcPzjX8JT/8452EV1rjXvg363sLkImS6XT/O98GmGHjKBSz8915dOz
 Em4y//K8rmiebqlooBcUJ/EfD6aLmNpK6WNRZxw89uI432PXYOwQcJfRQ
 ycYTFMidroG0M7K7u+fxoufW8OOpGGPeIiPoSSZKXFjFQLlcl9QMgdh8K
 td5nPJE15DP8mvwTIyxUjMHSn2MKDEYwUuJfI+tqeXb9tzfZgICVa6vIz
 CT4ZXDsOTjY5bDgzvyeRe3zhk4GrqGUmPW/O9FTkcm4EIiNdisU8nu1KV
 NiAIik9h3ZQa3BBOXLLCgRM0hLciSGN3Qe6c2NL5AV1F9YkJqizxdyZ/k g==;
X-CSE-ConnectionGUID: ezJkMLTLSW6yCtqAxYtD3Q==
X-CSE-MsgGUID: HmSKRMl1R6eFf4YrSahpcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96577098"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="96577098"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:12:10 -0700
X-CSE-ConnectionGUID: uNCwKEAATtud+v5Rcuxp7A==
X-CSE-MsgGUID: xZ9Av8AcQLqFQPDstc5SsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="233057105"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:12:07 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V9 05/10] drm/xe: Extend BO purge to handle vram pages as
 well
Date: Wed,  6 May 2026 19:41:46 +0530
Message-ID: <20260506141143.4033299-17-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260506141143.4033299-12-tejas.upadhyay@intel.com>
References: <20260506141143.4033299-12-tejas.upadhyay@intel.com>
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
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +----
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5ce60d161e09..04d3b25c7c8e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -903,7 +903,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
  *
  * Return: 0 on success, negative error code on failure
  */
-static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct ttm_placement place = {};
@@ -911,9 +911,6 @@ static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operatio
 
 	xe_bo_assert_held(bo);
 
-	if (!ttm_bo->ttm)
-		return 0;
-
 	if (!xe_bo_madv_is_dontneed(bo))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 68dea7d25a6b..9f55b3589caf 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -500,6 +500,7 @@ struct xe_bo_shrink_flags {
 long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
+int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.52.0

