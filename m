Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20192CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD21210EAB5;
	Fri, 22 Aug 2025 09:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wgj0mxZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB3310EAB5
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855684; x=1787391684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfHOc4KjpJBQGWm8bI2wtMpKYskDK8NZpxr6nvMEow8=;
 b=Wgj0mxZRVDNxlpZ6HY/5RkajkjZ8Cm5Ue2eOKYl19cmkXfHbRa2Z6woZ
 TsMOpRSTKXqlJn0UlQP0DXd83GE7RjvjhNrvuYf04Ey0sTduRV7bPvPJU
 2MBXdcHtkpg0A0HFzB7exAdSHwuhOYsJI84+sdWguFEGgRc4XHAKvcfJZ
 BZJxGbDvoft84mU+RJ4sNsa+gVo5v516S37HJbEwU/+wJhhyqhBpMu8J7
 a/b8q7RJPg2IRtIKxRRGgBoTx9TZQ/x3p1qN2H+0jNpYCpTmujRA854pb
 GAOGgrZvUBN/zrkIhALOP+PvzaCxhGkuu79Dby1wjlgw929posDsFwRjR Q==;
X-CSE-ConnectionGUID: zVRlMXWuQraf4OHGo3XjlQ==
X-CSE-MsgGUID: jZusE3RCSeuEI6eu/B92Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80760649"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="80760649"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:41:23 -0700
X-CSE-ConnectionGUID: KQVQxBuaRySZPn4mRd4Ktg==
X-CSE-MsgGUID: 0i3QOccXTsucMCQHqsDheQ==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.108])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:41:21 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 15/16] drm/xe/sriov: Convert pf_provision_vf_lmem for
 exhaustive eviction
Date: Fri, 22 Aug 2025 11:40:29 +0200
Message-ID: <20250822094030.3499-16-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
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

Open-code since this is the only identified instance of pinning
without mapping.

v2:
- Break out this patch from the previous one.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 51 ++++++++++++++--------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 906011671b60..c9e3c811c35b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1452,11 +1452,12 @@ static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_confi
 static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_bo *bo;
-	int err;
+	int err = 0;
 
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, IS_DGFX(xe));
@@ -1479,23 +1480,37 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 		return 0;
 
 	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
-	bo = xe_bo_create_locked(xe, tile, NULL,
-				 ALIGN(size, PAGE_SIZE),
-				 ttm_bo_type_kernel,
-				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				 XE_BO_FLAG_NEEDS_2M |
-				 XE_BO_FLAG_PINNED |
-				 XE_BO_FLAG_PINNED_LATE_RESTORE,
-				 exec);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	err = xe_bo_pin(bo, exec);
-	xe_bo_unlock(bo);
-	if (unlikely(err)) {
-		xe_bo_put(bo);
-		return err;
+
+	/*
+	 * Open-code for now, since this is the only instance of
+	 * pinning without mapping.
+	 */
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.exclusive = true}, err) {
+		bo = xe_bo_create_locked(xe, tile, NULL,
+					 ALIGN(size, PAGE_SIZE),
+					 ttm_bo_type_kernel,
+					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					 XE_BO_FLAG_NEEDS_2M |
+					 XE_BO_FLAG_PINNED |
+					 XE_BO_FLAG_PINNED_LATE_RESTORE,
+					 &exec);
+		if (IS_ERR(bo)) {
+			drm_exec_retry_on_contention(&exec);
+			err = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &err);
+			return PTR_ERR(bo);
+		}
+
+		err = xe_bo_pin(bo, &exec);
+		xe_bo_unlock(bo);
+		if (err) {
+			xe_bo_put(bo);
+			drm_exec_retry_on_contention(&exec);
+			xe_validation_retry_on_oom(&ctx, &err);
+		}
 	}
+	if (err)
+		return err;
 
 	config->lmem_obj = bo;
 
-- 
2.50.1

