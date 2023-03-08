Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9242DC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 10:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B3510E665;
	Wed,  8 Mar 2023 10:18:28 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70F910E106
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 10:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678270705; x=1709806705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D5ID1ZSaL1rOPlRapBrrvXnJMon12C8dGh63v4x82/g=;
 b=GOwJg+qr3LCoI/pSl281/1Pnik/+6pEgDQozI4IGvEpsWvX85uDXtExJ
 KFhsKTM2djA1BQcthNP/EXMjGLS7PLnl3jiTsl+AkKwnNvmZffwK5qXeS
 NGwUwcXRnwUZKHDtRVxY3AXMAwTWvzQ6bEsVTAW19RkX1j7eUDAYl53EY
 9IjK1zmksNRDIOlPqZTznf9M6TCcJLJ/H/hXbxrt/1IIp8nFcAoiA/cTN
 OIIY2sxz+EWUwSKSjx9KO4U/Nx+QUBiFE7T6nprC+1/mRCW7ytHzGaTqU
 hWwbsAt6kYVt4sVFQnFeJiUMgNnCkxXeyF4byTBXylshMtTlYa0fA05nT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338444545"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="338444545"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626861475"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="626861475"
Received: from jlenoir-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.24.168])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:18:15 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Mar 2023 10:17:40 +0000
Message-Id: <20230308101745.217120-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308101745.217120-1-matthew.auld@intel.com>
References: <20230308101745.217120-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/6] drm/xe: add
 xe_ttm_stolen_cpu_access_needs_ggtt()
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

xe_ttm_stolen_cpu_inaccessible() was originally meant to just cover the
case where stolen is not directly CPU accessible on some older
integrated platforms, and as such a GGTT mapping was also required for
CPU access (as per the check in xe_bo_create_pin_map_at()).

However with small-bar systems on dgfx we have one more case where
stolen is also inaccessible, however here we don't have any fallback
GGTT mode for CPU access. Fix the check in xe_bo_create_pin_map_at() to
make this distinction clear. In such a case the later vmap() will fail
anyway.

v2: fix kernel-doc warning

Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c             |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bfd3f6f2e9a..876f77669104 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1151,7 +1151,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
 	u64 end = offset == ~0ull ? offset : start + size;
 
 	if (flags & XE_BO_CREATE_STOLEN_BIT &&
-	    xe_ttm_stolen_cpu_inaccessible(xe))
+	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_CREATE_GGTT_BIT;
 
 	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 2e8d07ad42ae..e608b49072ba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -66,6 +66,20 @@ bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe)
 	return !mgr->io_base || GRAPHICS_VERx100(xe) < 1270;
 }
 
+/**
+ * xe_ttm_stolen_cpu_access_needs_ggtt - If we can't directly CPU access stolen,
+ * can we then fallback to mapping through the GGTT.
+ * @xe: xe device
+ *
+ * Some older integrated platforms don't support reliable CPU access for stolen,
+ * however on such hardware we can always use the mappable part of the GGTT for
+ * CPU access. Check if that's the case for this device.
+ */
+bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
+{
+	return xe_ttm_stolen_cpu_inaccessible(xe) && !IS_DGFX(xe);
+}
+
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
index 2fda97b97a05..e210dada636e 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
@@ -15,6 +15,7 @@ struct xe_device;
 void xe_ttm_stolen_mgr_init(struct xe_device *xe);
 int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
 bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe);
+bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
 u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe);
 
-- 
2.39.2

