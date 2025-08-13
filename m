Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A3BC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F3710E6F2;
	Wed, 13 Aug 2025 10:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtRrBl2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B12310E6F2
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755082333; x=1786618333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wJs6C/Uan/KB/wwtpfMCWngxF1VPSibuSVlhoaykBs8=;
 b=TtRrBl2NFiIDbIbsqR69hImuqccG43d63h88RhGCFvnePYZYNTwZyaZ2
 6ebWB/tiYQY8FaIXAkMXEaZE8V8a1QyLWX4M5Y+xyZOkyZOcKPgPGicuC
 XbwLcsMq3ZJbBLrXNdyunps1DVeDkugC1HShTN+wF5URe7O6AFjh/0buE
 JbJqGbb3OW952sJNTzhwWuyo1VUbjDo0haomw8Gsg+fwv0z/xS0d+YSjp
 zPI2Y98u7ub7KyW2paaigvB2+zfCYAoyxuFD8D08IYMrjscZnPSBcjy0x
 TB6DhL9F4cVbGqHjvySYH8r6WuENvp5sXSLXeHH1LkNdx5p1VJ+dkbsBD Q==;
X-CSE-ConnectionGUID: mJk09JjGTre5GpOyD0Op7w==
X-CSE-MsgGUID: ywQgsiUPSgOmDJ/+f+1eqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57450052"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57450052"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:13 -0700
X-CSE-ConnectionGUID: OpTXLHveS26pRt/RdnxEiA==
X-CSE-MsgGUID: mZC5AqYzQ4CHOhgpVAJVCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166069093"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 11/15] drm/xe: Convert xe_dma_buf.c for exhaustive eviction
Date: Wed, 13 Aug 2025 12:51:17 +0200
Message-ID: <20250813105121.5945-12-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 59 +++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 78a827d4e726..56df1d84df21 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -163,16 +163,27 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
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
-
+	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec, 0, ret, false) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			goto out;
+
+		ret = xe_bo_migrate(bo, XE_PL_TT, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &ret);
+	}
+out:
+	/* If we failed, cpu-access takes place in current placement. */
+	(void)ret;
 	return 0;
 }
 
@@ -211,24 +222,38 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
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
+	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, false) {
+		ret = drm_exec_lock_obj(&exec, dummy_obj);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			goto error;
+
+		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
+					    0, /* Will require 1way or 2way for vm_bind */
+					    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			ret = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &ret);
+			goto error;
+		}
 	}
-	dma_resv_unlock(resv);
+	drm_gem_object_put(dummy_obj);
 
 	return &bo->ttm.base;
 
 error:
-	dma_resv_unlock(resv);
 	return ERR_PTR(ret);
 }
 
-- 
2.50.1

