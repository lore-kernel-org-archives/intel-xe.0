Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C989F34C49
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 13:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D6C10E442;
	Mon, 13 Apr 2026 13:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkgYQ7jJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B6E10E442
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776086223; x=1807622223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xAJeOB34GhKiK1qoEYm17j8UnzrPYP/lZkjLHw6OfMo=;
 b=jkgYQ7jJFgwFXXKg/HtdDrPxBmJ6lewKveh0a5myxhqHL1W4py5ksshl
 jHSWc76Vy15DNSvYgb3+IwQZPEMp8GcU0rmmYw5WSDZhiBUuM3ONL9UQG
 nAdfIbrEJVA89Bke2a2sxQ2i+0VHsFseebjhPF7ugriBq9qpIr/+8Y0It
 rgla6BEsD3z962CQJmrz4HHm8L7SIlUhG00SaG3qj0+5t1yjf68Wj+s+1
 F8aJAKTIsLDX3YzRM00IoMKOqOUrei6pqNcBn75HXzbFYqZZ4aZGB8Z5R
 iEyXeMGOYs4cE52a/BzWGVuBRb6N83FEkNKxsKV1aAD1cEFvRvroE6blr Q==;
X-CSE-ConnectionGUID: eTGDTyT1Tc+CYwwuv5ahlw==
X-CSE-MsgGUID: DKglbJgKT8KpntexWbJFlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77037301"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="77037301"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:17:03 -0700
X-CSE-ConnectionGUID: q8IA6QM+SgyycyFBNG5t8w==
X-CSE-MsgGUID: /hexvwGCRwqpb37qr8tYcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="260224349"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:17:01 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V7 4/9] drm/xe: Extend BO purge to handle vram pages as
 well
Date: Mon, 13 Apr 2026 18:46:25 +0530
Message-ID: <20260413131623.2891528-15-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
References: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
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
index a7c2dc7f224c..7baa326c9421 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -916,7 +916,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
  *
  * Return: 0 on success, negative error code on failure
  */
-static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct ttm_placement place = {};
@@ -924,9 +924,6 @@ static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operatio
 
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

