Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA07BE77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 12:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B110E10EB96;
	Wed, 18 Dec 2024 12:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLglqqAT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5CF10EB96
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 12:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734524354; x=1766060354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xoRJvmW34VWP9qO8ZYpoQAe8uqs/C6fbXm2tGkp7x7s=;
 b=GLglqqAT1JHsWFuwu0/CwDomxsrOk3L/hqkFQGH5tO9RyBWpV6K+EVXl
 s7X7GSci5bS9Cy7xDSfTxgp0kB+wVEVuEYV0CjHgafsyeWzGHQkQXI1in
 LjSdNsk83k/TqH2zPoo3eBMmKhYBewmMOsmMIprQ4X30Vfb3tHgJkfwEU
 iTJp/ruurHfuNE4lnupu/P2vNNy2dLEd0MaCWF6j/57YdOZFuT75eEzJv
 3aWojd88utl8hKiFkLddkGXKDO411JFGcjMaaJMJUXJ+vZWta+197p4di
 OwmwqyM9lpM9H8SmflbY78JC/GSP3/vAz5aAhPP7TTqWCvsGs2Ut8twx0 Q==;
X-CSE-ConnectionGUID: 6WSGK4QsR46W23Em0WtdwQ==
X-CSE-MsgGUID: MTQUDMF6S32lu+hinISDrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35028092"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35028092"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:14 -0800
X-CSE-ConnectionGUID: GHi0WSCtQ+eJKUgcTTSjig==
X-CSE-MsgGUID: pUdsVJ4XRhae+q8IVjyrnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97633586"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 3/7] drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
Date: Wed, 18 Dec 2024 12:18:41 +0000
Message-ID: <20241218121837.226393-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218121837.226393-9-matthew.auld@intel.com>
References: <20241218121837.226393-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Matthew Brost <matthew.brost@intel.com>

Not all BOs need to be restored on resume / d3cold exit, add
XE_BO_FLAG_PINNED_NO_RESTORE which skips restoring of BOs rather just
allocates VRAM for the BO. This should slightly speedup resume / d3cold
exit flows.

Marking GuC ADS, GuC CT, GuC log, GuC PC, and SA as NORESTORE.

v2:
 - s/WONTNEED/NORESTORE (Vivi)
 - Rebase on newly added g2g and backup object flow

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 6 +++++-
 drivers/gpu/drm/xe/xe_bo.h      | 9 +++++----
 drivers/gpu/drm/xe/xe_guc.c     | 3 ++-
 drivers/gpu/drm/xe/xe_guc_ads.c | 3 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c  | 3 ++-
 drivers/gpu/drm/xe/xe_guc_log.c | 3 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c  | 3 ++-
 drivers/gpu/drm/xe/xe_sa.c      | 3 ++-
 8 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c0515c1dd00c..73a023af0bc8 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -869,6 +869,9 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	if (!xe_bo_is_vram(bo))
 		goto out_unlock_bo;
 
+	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
+		goto out_unlock_bo;
+
 	backup = xe_bo_create_locked(xe, NULL, NULL, bo->size, ttm_bo_type_kernel,
 				     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
 				     XE_BO_FLAG_PINNED);
@@ -1830,7 +1833,8 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
 	struct xe_bo *bo;
 	u32 dst_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT;
 
-	dst_flags |= (*src)->flags & XE_BO_FLAG_GGTT_INVALIDATE;
+	dst_flags |= (*src)->flags & (XE_BO_FLAG_GGTT_INVALIDATE |
+				      XE_BO_FLAG_PINNED_NORESTORE);
 
 	xe_assert(xe, IS_DGFX(xe));
 	xe_assert(xe, !(*src)->vmap.is_iomem);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a0ac2b9c903d..d75740b6e0a5 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -39,10 +39,11 @@
 #define XE_BO_FLAG_NEEDS_64K		BIT(15)
 #define XE_BO_FLAG_NEEDS_2M		BIT(16)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
-#define XE_BO_FLAG_GGTT0                BIT(18)
-#define XE_BO_FLAG_GGTT1                BIT(19)
-#define XE_BO_FLAG_GGTT2                BIT(20)
-#define XE_BO_FLAG_GGTT3                BIT(21)
+#define XE_BO_FLAG_PINNED_NORESTORE	BIT(18)
+#define XE_BO_FLAG_GGTT0                BIT(19)
+#define XE_BO_FLAG_GGTT1                BIT(20)
+#define XE_BO_FLAG_GGTT2                BIT(21)
+#define XE_BO_FLAG_GGTT3                BIT(22)
 #define XE_BO_FLAG_GGTT_ALL             (XE_BO_FLAG_GGTT0 | \
 					 XE_BO_FLAG_GGTT1 | \
 					 XE_BO_FLAG_GGTT2 | \
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 408365dfe4ee..02203cb1164d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -481,7 +481,8 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
 					  XE_BO_FLAG_GGTT_ALL |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 943146e5b460..887181c5395c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -413,7 +413,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d33f3a11e61..390598babae9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -238,7 +238,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index df4cfb698cdb..88e4348204a0 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -261,7 +261,8 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e8b9faeaef64..7c7f04f0d574 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1086,7 +1086,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index e055bed7ae55..d26e6d52d01f 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -49,7 +49,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
 			PTR_ERR(bo));
-- 
2.47.1

