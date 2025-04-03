Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53EEC3601E
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 10:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877B910E999;
	Thu,  3 Apr 2025 10:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXlZR5iB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C8910E999
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675896; x=1775211896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E99ucAwT0ssDIiX4yiLrJDK5xDs6PgDdUodUP36bvQg=;
 b=NXlZR5iBKE6h2nPgS2LsTgIJf9eGdXKE1MBXj60A6wQ3zhlJdvDJck9J
 DdirARjJk/3hvBYf6qJ7ALSsVBqJeRJ36nQZ1vYvXjLTz1Izu1OUcB/Db
 gxKiVMt6VutCCErh/U48Rd7etxKcS+CtOzgvVCfVlZaSagaCWSzLfBGaa
 IPBFzWz/CEJaZHuMXF7Sdxd8COC1JGu77maSodZDiIR6V4nBr4Esod7V7
 XASUVMQwxJtQUq6aS6k9oYDto3E/+wDzYfUuPc+Gi1365+T3HUToHASPJ
 lw3OyfRXX2IAnqJRaRzqBZoyhcLm6yedTETwA3zkvw2PN+RO+qEKn5JBW A==;
X-CSE-ConnectionGUID: kG7hsTLpQbauuTXNRzsktg==
X-CSE-MsgGUID: azSPdfvmR9+1tJzBkhVNFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62475414"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62475414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:24:56 -0700
X-CSE-ConnectionGUID: 2WCLhQgLShmtdf00WqnbAA==
X-CSE-MsgGUID: AX6lwvMLRbeOLM2qsMvwjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="132166756"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:24:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 2/7] drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
Date: Thu,  3 Apr 2025 11:24:43 +0100
Message-ID: <20250403102440.266113-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403102440.266113-9-matthew.auld@intel.com>
References: <20250403102440.266113-9-matthew.auld@intel.com>
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
index 1c6b2718fb11..6668a1a5eb93 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1110,6 +1110,9 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	if (!xe_bo_is_vram(bo))
 		goto out_unlock_bo;
 
+	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
+		goto out_unlock_bo;
+
 	backup = xe_bo_create_locked(xe, NULL, NULL, bo->size, ttm_bo_type_kernel,
 				     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
 				     XE_BO_FLAG_PINNED);
@@ -2123,7 +2126,8 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
 	struct xe_bo *bo;
 	u32 dst_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT;
 
-	dst_flags |= (*src)->flags & XE_BO_FLAG_GGTT_INVALIDATE;
+	dst_flags |= (*src)->flags & (XE_BO_FLAG_GGTT_INVALIDATE |
+				      XE_BO_FLAG_PINNED_NORESTORE);
 
 	xe_assert(xe, IS_DGFX(xe));
 	xe_assert(xe, !(*src)->vmap.is_iomem);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 05479240bf75..3d6e4902dff3 100644
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
index bee4e0cfe7b8..88400f249e61 100644
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
index 686fe664c20d..0a4fef7d7225 100644
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
index e2453e40586c..18c623992035 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1185,7 +1185,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
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
2.49.0

