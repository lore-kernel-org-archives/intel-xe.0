Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B7DD5B852
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 00:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59CA10E259;
	Tue, 29 Oct 2024 00:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQfut/QU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE7C10E58A
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 00:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730161919; x=1761697919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oK/8gdPyL2yvoPikSknxlC2VrIqaFK5cU/cB4Y5FSb0=;
 b=jQfut/QUFbFe2aufA83MN5JyubovBNAZCkeLXGniNlR2PUaS0gE8iZeT
 5Z1mPxSpbZfdzPkw+xiA/AxD9uWyBonSsmdPa7mrNo4UX3whtizm+J41K
 jHj1+fXVrQQsKP4+xXCc5E1oy/6fvibMHlDKTase7/DLctDYZUcvEMehb
 1qXIyYQhJGL88ny+q1jpH6jHixqYjbpjMUiAQ99fzCfvi+6Zr1a9P/fT5
 JwwEqigGill8dMwLHDMZ87PZMP7D+ZnIpf8Q7uTAVvvHDc9MPejMteQZP
 WAurXesi/sdeduMRSTNYdmzz3Nkzb+CXg6OIo0+CuGx6M7kT9LOYfud3E w==;
X-CSE-ConnectionGUID: WziDS/PZS1etKYag5FBTNA==
X-CSE-MsgGUID: CQVo36vsTfq/eTdjunm7YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52337960"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52337960"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 17:31:58 -0700
X-CSE-ConnectionGUID: oTFJ5lZwR4SGXtueGmg0rw==
X-CSE-MsgGUID: 38EVHenBT72TNqLTam3whQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="119244301"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 17:31:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, umesh.nerlige.ramappa@intel.com,
 riana.tauro@intel.com
Subject: [PATCH 1/3] drm/xe: Add XE_BO_FLAG_PINNED_WONTNEED
Date: Mon, 28 Oct 2024 17:32:22 -0700
Message-Id: <20241029003224.2257439-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029003224.2257439-1-matthew.brost@intel.com>
References: <20241029003224.2257439-1-matthew.brost@intel.com>
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

Not all BOs need to restored on resume / d3cold exit, add
XE_BO_FLAG_PINNED_WONTNEED which skips restoring of BOs rather just
allocates VRAM for the BO. This should slighly speedup resume / d3cold
exit flows.

Marking GuC ADS, GuC CT, GuC log, GuC PC, and SA as WONTNEED.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 24 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_bo.h      |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c |  3 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c  |  3 ++-
 drivers/gpu/drm/xe/xe_guc_log.c |  3 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c  |  3 ++-
 drivers/gpu/drm/xe/xe_sa.c      |  3 ++-
 7 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..bd747e53eb9b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -771,7 +771,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		xe_pm_runtime_get_noresume(xe);
 	}
 
-	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
+	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
+		ttm_bo_move_null(&bo->ttm, new_mem);
+	} else if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
 		/*
 		 * Kernel memory that is pinned should only be moved on suspend
 		 * / resume, some of the pinned memory is required for the
@@ -891,6 +893,11 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 	if (WARN_ON(!xe_bo_is_vram(bo)))
 		return -EINVAL;
 
+	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
+		ttm_bo_move_null(&bo->ttm, NULL);
+		return 0;
+	}
+
 	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
 	if (ret)
 		return ret;
@@ -943,14 +950,16 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 
 	xe_bo_assert_held(bo);
 
-	if (WARN_ON(!bo->ttm.resource))
-		return -EINVAL;
-
 	if (WARN_ON(!xe_bo_is_pinned(bo)))
 		return -EINVAL;
 
-	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
-		return -EINVAL;
+	if (!(bo->flags & XE_BO_FLAG_PINNED_WONTNEED)) {
+		if (WARN_ON(!bo->ttm.resource))
+			return -EINVAL;
+
+		if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
+			return -EINVAL;
+	}
 
 	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
 	if (ret)
@@ -1692,7 +1701,8 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
 	struct xe_bo *bo;
 	u32 dst_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT;
 
-	dst_flags |= (*src)->flags & XE_BO_FLAG_GGTT_INVALIDATE;
+	dst_flags |= (*src)->flags & (XE_BO_FLAG_GGTT_INVALIDATE |
+				      XE_BO_FLAG_PINNED_WONTNEED);
 
 	xe_assert(xe, IS_DGFX(xe));
 	xe_assert(xe, !(*src)->vmap.is_iomem);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7fa44a0138b0..854ab8624d7a 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -39,6 +39,7 @@
 #define XE_BO_FLAG_NEEDS_64K		BIT(15)
 #define XE_BO_FLAG_NEEDS_2M		BIT(16)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
+#define XE_BO_FLAG_PINNED_WONTNEED	BIT(18)
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 4e746ae98888..506b26ea7b74 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -418,7 +418,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_WONTNEED);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 1b5d8fb1033a..61641329fa95 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -237,7 +237,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_WONTNEED);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index fead96216243..2a4886f25835 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -261,7 +261,8 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_WONTNEED);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e8b9faeaef64..751c38c41f26 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1086,7 +1086,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_WONTNEED);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index e055bed7ae55..a31b085d2d9b 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -49,7 +49,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					  XE_BO_FLAG_GGTT |
-					  XE_BO_FLAG_GGTT_INVALIDATE);
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_WONTNEED);
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
 			PTR_ERR(bo));
-- 
2.34.1

