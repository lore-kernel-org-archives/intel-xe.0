Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F43C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB42910E9FA;
	Wed, 26 Aug 2026 13:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gK8Tw1E9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F3310E9FA
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 13:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787752321; x=1819288321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U0rZ3KD4khbUoqd+GFGbx5KAbRr9kumFlq7PT1saUoE=;
 b=gK8Tw1E9Pzf7+ahGy0WPqfY0M5lUmIagnHXwVx4WJgwufvftbAcwerVW
 1DGTTB01BQmFSQWItC+NHTeJu8YSZGlXbhpAOP3vXkAkLpyB8HdMG6eFw
 ZpIxJ5LI2TJ/rdmt1/hbnEhsZHhyujApMcuVBc8CKTM9d904KWf48ncbF
 xxIIdd0SdrgzuUYiumOiTXp/9TPoY+znqxOiVW90AHagkW7SApDm9FfjE
 R1gqI3EN9I1l3enaYHU/eq+K5H2oOBe2Fh8k8VxkuCw/IJK/ZMLyUZWBF
 bnzfeUJKqJBcCN3nCyA7MZeL17+ZKgHUC2ry906xEYq4Kuntv+9MBdM/O A==;
X-CSE-ConnectionGUID: VMYP14WgSguFxwW7WUU4Ug==
X-CSE-MsgGUID: fkqP8LX3QV2HBLvyZWZn0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88251028"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88251028"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:52:01 -0700
X-CSE-ConnectionGUID: 6ZFJy/kLS5epl6AvW50Q5A==
X-CSE-MsgGUID: H94eWx0eT6WupAQ/H4Tewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="269533485"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:51:59 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V18 04/14] drm/xe/bo: Make xe_bo_is_user() public
Date: Wed, 26 Aug 2026 19:21:39 +0530
Message-ID: <20260826135136.204044-20-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260826135136.204044-16-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
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

Export xe_bo_is_user() so it can be used by the VRAM page offline
code to distinguish user-created BOs from kernel BOs when deciding
whether a faulty page can be safely purged or requires a full reset.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 52f81e972ada..b077d137da57 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -158,7 +158,13 @@ bool xe_bo_is_vm_bound(struct xe_bo *bo)
 	return !list_empty(&bo->ttm.base.gpuva.list);
 }
 
-static bool xe_bo_is_user(struct xe_bo *bo)
+/**
+ * xe_bo_is_user - Check if BO is user-created
+ * @bo: The BO
+ *
+ * Returns: true if @bo was created by userspace
+ */
+bool xe_bo_is_user(struct xe_bo *bo)
 {
 	return bo->flags & XE_BO_FLAG_USER;
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 90b15fff36c7..eede678ad303 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -601,6 +601,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
 int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
+bool xe_bo_is_user(struct xe_bo *bo);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.52.0

