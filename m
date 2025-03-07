Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6865AC28B27
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B05810EC1D;
	Fri,  7 Mar 2025 18:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZjU8jkg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8806510EC1D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741372165; x=1772908165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w1s72ZKbG4wbAxd64B3Fa1r4fWXC8F4f1SaDavPsfo0=;
 b=mZjU8jkgVLGI6LZSmFpA2GvoMi4KPnhgXMRZEU3YKTrV4LKa9p8FrOU2
 csIMs+x4Vs2rrpbMziE8Z0n3qOYcFNfekpGYjdGQxkOyIkmpId+0RNfVj
 fU8ZuAioSGgOqBS2e256w8UZhkWaqbY1sp89mkME+RYeIrqq8jx9R0qjD
 kkku5+Oht5EsQXzpG5CMWWTwN8ioxU5Tox/eHl7DipbPIBdD3NfJyScuf
 GchCzXuWyg9nsq7Pudz8soYe6tddZUQswdrjTv50aOTFASnImLjNfDODK
 5WnYmmn2F3CAim8yuaRtKwFaw5vgJi43n2sBZ7qhAhLGPTaXuOU9RpC7K Q==;
X-CSE-ConnectionGUID: HxqT9DNzRJOpd3r2+tvu2A==
X-CSE-MsgGUID: xpweQ55KTBOh9vXT8NudWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52639832"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="52639832"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:24 -0800
X-CSE-ConnectionGUID: 21JpxFWKTsGfIxilc4PAHg==
X-CSE-MsgGUID: wkRbSH+AQMiLwbX+smsmUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124625655"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.99])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:23 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 3/8] drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
Date: Fri,  7 Mar 2025 18:29:00 +0000
Message-ID: <20250307182856.304850-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307182856.304850-10-matthew.auld@intel.com>
References: <20250307182856.304850-10-matthew.auld@intel.com>
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
index 7fe70f28f7fa..f22b02700778 100644
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
index bec33eb3fa95..3937111c2adb 100644
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
index bc1ff0a4e1e7..1bb2f08d6140 100644
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
index 25040efa043f..ed491894438b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1142,7 +1142,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
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

