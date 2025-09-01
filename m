Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEF3CA0FFF
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 16:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6660810E4EA;
	Mon,  1 Sep 2025 16:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoXtBiRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7229210E4EC
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756743224; x=1788279224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lsRcEivXZ8DtSf1we0MtcxAxTtVJaDFOI6eq9FSwzSM=;
 b=FoXtBiRPn0KAccbDXeXJQPJmNQaGqFaggJDzDxYgnd3417TVUaPqHFMQ
 k+xl0Ooa7T45dQhErrg1gCGWMqdAWJ1cl5MnbR3zOASPoOriORkWDeMP4
 F0OLPI4QA7v2U+yFO8ADIuqHPHeATZZUrzQ++gYxL5yz9KyTW5/VSNM8c
 6tSZaZLeWBWoAhnAZeybgFmsnHB01bMm7r/pLF/i5R0SGCblzLjRWSUOp
 A7IRFZjnPbUtChaC9FdXzggH3zNPhhbUVJMGM6rRiKu9cLloBKn1qMl27
 je1bEdCv/LwfbhxN+H2K41ncyLJYwdCHtdrscgGPV9LOHhYNV8hv8AGH/ g==;
X-CSE-ConnectionGUID: XGcP1l75Q8irlllldLK/GQ==
X-CSE-MsgGUID: bHkGCO6+RY28+dmDt/ZdIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58204387"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58204387"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:13:44 -0700
X-CSE-ConnectionGUID: 997SDOaaRdmjPrEqffWH4Q==
X-CSE-MsgGUID: RpCTb1I0TlC20CcMpbLZpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="171215219"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.171])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:13:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 12/14] drm/xe/sriov: Convert pf_provision_vf_lmem for
 exhaustive eviction
Date: Mon,  1 Sep 2025 18:12:47 +0200
Message-ID: <20250901161250.5279-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901161250.5279-1-thomas.hellstrom@linux.intel.com>
References: <20250901161250.5279-1-thomas.hellstrom@linux.intel.com>
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

Open-code instead of adding yet another xe_bo_create_xxx() interface
pending a rework of the bo create functionality.

v2:
- Break out this patch from the previous one.
v3:
- Rework commit message.
- Early return on error (Matt Brost).

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 52 ++++++++++++++--------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 906011671b60..742e069d0777 100644
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
@@ -1479,23 +1480,38 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
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
+			return err;
+		}
 	}
+	if (err)
+		return err;
 
 	config->lmem_obj = bo;
 
-- 
2.50.1

