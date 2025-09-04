Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A44ECA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 14:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440F710EA7E;
	Thu,  4 Sep 2025 14:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEkZIaCG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E1110EA87
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756997388; x=1788533388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PgblD4SkZb1mUnahxQjLwP/0VqBX0XyNpAj1xJxyhG0=;
 b=bEkZIaCGUmduVOv3XuCqmUvWZxytpXy6HXWV3XfojfcFpykExMZylWWE
 81Z6jorxmyuak0XI7Iq0MMqpRTBgSw6FUf6/kGhgbVb+z83knZsmA4w5L
 NI1KZ8viCiVUab8ZfoHoH8cuAKsZo7B1eiBKLECJ/qaS2wtJPOXcw7MBE
 dlv+L3DFedIWdWhT8XmAVK4j8WBdsI6hyibFacLpmxVNuAJjAaKlYHoMG
 9M323AAUmQZ+biAsIgL8weEdeHU6Qlvc7aMxSrWm4lRnCdCsjo3uf963f
 VXobUZtZ3ssaP7knftCl/5erNZEnTi0GXY5OUZrx1TwlSiZDxv8e8gNGG g==;
X-CSE-ConnectionGUID: wTal30q3TpGEKzp3feYalA==
X-CSE-MsgGUID: LLJfV0DVSre2EyFmH3wgzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76790135"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="76790135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 07:49:47 -0700
X-CSE-ConnectionGUID: kq5HSPQ7Rluzgz+PONHMlA==
X-CSE-MsgGUID: nwr2Sp+eTVm2N+7jpYtOdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171851037"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora) ([10.245.244.98])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 07:49:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v5 08/13] drm/xe: Convert xe_dma_buf.c for exhaustive eviction
Date: Thu,  4 Sep 2025 16:49:03 +0200
Message-ID: <20250904144908.14303-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904144908.14303-1-thomas.hellstrom@linux.intel.com>
References: <20250904144908.14303-1-thomas.hellstrom@linux.intel.com>
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

Convert dma-buf migration to XE_PL_TT and dma-buf import to
support exhaustive eviction, using xe_validation_guard().
It seems unlikely that the import would result in an -ENOMEM,
but convert import anyway for completeness.

The dma-buf map_attachment() functionality unfortunately doesn't
support passing a drm_exec, which means that foreign devices
validating a dma-buf that we exported will not, unless they are
xeKMD devices, participate in the exhaustive eviction scheme.

v2:
- Avoid gotos from within xe_validation_guard(). (Matt Brost)
- Adapt to signature change of xe_validation_guard(). (Matt Brost)
- Remove an unneeded (void)ret. (Matt Brost)
- Fix up an error path.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 61 ++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 2fdfeaf59fb1..8d8e5f7345b6 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -163,16 +163,26 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	bool reads =  (direction == DMA_BIDIRECTIONAL ||
 		       direction == DMA_FROM_DEVICE);
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	int ret = 0;
 
 	if (!reads)
 		return 0;
 
 	/* Can we do interruptible lock here? */
-	xe_bo_lock(bo, false);
-	(void)xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
-	xe_bo_unlock(bo);
+	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec, (struct xe_val_flags) {}, ret) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			break;
+
+		ret = xe_bo_migrate(bo, XE_PL_TT, NULL, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &ret);
+	}
 
+	/* If we failed, cpu-access takes place in current placement. */
 	return 0;
 }
 
@@ -211,25 +221,36 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 {
 	struct dma_resv *resv = dma_buf->resv;
 	struct xe_device *xe = to_xe_device(dev);
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
+	struct xe_validation_ctx ctx;
+	struct drm_gem_object *dummy_obj;
+	struct drm_exec exec;
 	struct xe_bo *bo;
-	int ret;
-
-	dma_resv_lock(resv, NULL);
-	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
-				    0, /* Will require 1way or 2way for vm_bind */
-				    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, exec);
-	if (IS_ERR(bo)) {
-		ret = PTR_ERR(bo);
-		goto error;
+	int ret = 0;
+
+	dummy_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
+	if (!dummy_obj)
+		return ERR_PTR(-ENOMEM);
+
+	dummy_obj->resv = resv;
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, ret) {
+		ret = drm_exec_lock_obj(&exec, dummy_obj);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			break;
+
+		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
+					    0, /* Will require 1way or 2way for vm_bind */
+					    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			ret = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &ret);
+			break;
+		}
 	}
-	dma_resv_unlock(resv);
-
-	return &bo->ttm.base;
+	drm_gem_object_put(dummy_obj);
 
-error:
-	dma_resv_unlock(resv);
-	return ERR_PTR(ret);
+	return ret ? ERR_PTR(ret) : &bo->ttm.base;
 }
 
 static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
-- 
2.50.1

