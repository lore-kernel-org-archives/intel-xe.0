Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094B8C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 18:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C239610E1CF;
	Wed, 26 Mar 2025 18:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gk9LTTUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8067610E1CF
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 18:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743013175; x=1774549175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MT35gIWid04NLicvvB73scUEhONz/tZBRRB11CaK99Y=;
 b=Gk9LTTUToq6k4508z3JkfTJHj6JftJ6gkawDgDvmg0Wq0aUuwA2GjZif
 WykOzNMy4rJmcnI3pnG6g41m6jpYeizfNvFeDjNX9WRnp1MFvBrQOCj1s
 Wd9/AJPOSdAzcggDDqVURpbnt6Bohn+TJ5Tzfxg5uLdLGSQ6cfHOzUka0
 P8A8A3gtjDPcNGg2eYkpW7wvN+GZ+jOC5CTcJTbCJ68BSd/WmEFQUS2UP
 prc4UqtDxTjcqe+McCAJLdyIlhLCkk5kubYflmjrd2jf2HtQYDF7p9jCY
 sWUUJ7+OVnygpIWU+ewF9WA4v4llsHqtmUB1Vrfwe6PTnIGvDQwCRKbVO g==;
X-CSE-ConnectionGUID: m3EYoU2ORsW17YVeBm+eGg==
X-CSE-MsgGUID: TtJTigqeRp+s39Zt74cUuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44213587"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44213587"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:35 -0700
X-CSE-ConnectionGUID: xbtBztcVToCLr3bm86lD5w==
X-CSE-MsgGUID: 4wIpByejR+KX2rRW1Zf54A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="125383316"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.12])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 2/7] drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
Date: Wed, 26 Mar 2025 18:19:11 +0000
Message-ID: <20250326181908.124082-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250326181908.124082-9-matthew.auld@intel.com>
References: <20250326181908.124082-9-matthew.auld@intel.com>
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
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
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
index 362f08f8e743..5e78e177e7cc 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1092,6 +1092,9 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	if (!xe_bo_is_vram(bo))
 		goto out_unlock_bo;
 
+	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
+		goto out_unlock_bo;
+
 	backup = xe_bo_create_locked(xe, NULL, NULL, bo->size, ttm_bo_type_kernel,
 				     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
 				     XE_BO_FLAG_PINNED);
@@ -2080,7 +2083,8 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
 	struct xe_bo *bo;
 	u32 dst_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT;
 
-	dst_flags |= (*src)->flags & XE_BO_FLAG_GGTT_INVALIDATE;
+	dst_flags |= (*src)->flags & (XE_BO_FLAG_GGTT_INVALIDATE |
+				      XE_BO_FLAG_PINNED_NORESTORE);
 
 	xe_assert(xe, IS_DGFX(xe));
 	xe_assert(xe, !(*src)->vmap.is_iomem);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index ec3e4446d027..4dbb4b0c8cdb 100644
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
index bc5714a5b36b..38866135c019 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -483,7 +483,8 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
 					  XE_BO_FLAG_GGTT_ALL |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e7c9e095a19f..6d08871ac5ea 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -414,7 +414,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 72ad576fc18e..56b2c82a57d5 100644
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
index 80514a446ba2..38039c411387 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -260,7 +260,8 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 85215313976c..673d9cb0c447 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1169,7 +1169,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index f8fe61e25518..1d43e183ca21 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -60,7 +60,8 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
 			size / SZ_1K, bo);
-- 
2.48.1

