Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90052CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD3C10EAB2;
	Fri, 22 Aug 2025 09:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sc/gR7Mj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E2A10EAB2
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 09:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855676; x=1787391676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tmse9t/l96NzZ7XCYYix+jZeOt8X/gV1BjQXNIsl99A=;
 b=Sc/gR7MjmhEK7srVC2GlqxFnVipmFIk8NrWF456hEGt1Qur2Nnh5v+Xj
 Ebg1RjTYMBspPtcp77/90VeQ4uMZUfcFQq8U/9t9DCK33lo3YBTE4SSLK
 R9Ctetrlgii8Qef8UHbefp3XRtu2zdklyWazktmaGn3QKj2VYzps4nVp8
 T1b3FmyXosAxloLHVJZOofH41UShLg+w+C2YZMJtkiigl42mIGhJZmAad
 xp9VNshkiBqRk9OQKZ0VVtdrbEnXJFXgqaYIm4Db1IEndufz7TRqbWxq1
 6lNUCzufW70w8G15fO4tR0rt5arL/UYD4Vj/Zi0RnQaYYsTUkkXnDEbjY A==;
X-CSE-ConnectionGUID: A9V2Ca44R02R1Rs5iS1GnQ==
X-CSE-MsgGUID: dGZj/9lHRQqYLzhtrtShIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80760625"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="80760625"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:41:15 -0700
X-CSE-ConnectionGUID: N/wAzwAYScOpK5MeMundDQ==
X-CSE-MsgGUID: 3XediCLWSd239JFVxnVPCA==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.108])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:41:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 11/16] drm/xe: Convert xe_dma_buf.c for exhaustive eviction
Date: Fri, 22 Aug 2025 11:40:25 +0200
Message-ID: <20250822094030.3499-12-thomas.hellstrom@linux.intel.com>
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
- Remove an unneded (void)ret. (Matt Brost)
- Fix up an error path.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 61 ++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 78a827d4e726..3f96101a06f3 100644
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
-	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
-	xe_bo_unlock(bo);
+	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec, (struct xe_val_flags) {}, ret) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			break;
+
+		ret = xe_bo_migrate(bo, XE_PL_TT, &exec);
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

