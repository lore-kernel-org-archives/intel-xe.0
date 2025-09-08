Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05572CAC583
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C017710E4BF;
	Mon,  8 Sep 2025 10:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNl+x/Q/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5E810E4BA
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757326398; x=1788862398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KGStUBCVBXQ8uFpNuEzA4MqYtsajeUPccyxqLmcVEos=;
 b=GNl+x/Q/JLnqqbdQs/VhqX1gDEc3F3xXRi6uMlfLr0Pp85d4rPd1gW9m
 EtIF6SLFlxyMlqQ/LLtcNf2RXgDtFg5aJtLWIUNuryCNxeebON+zM5twI
 Zdoal7O2izWVZbQgy13JESKABa0Sp2Bn0URu/JkYxdu7E36EAZTa2++98
 oSLF3+PwIy0ViQoGRiqtggSKXC88mZTWaXru2U2jOfLFQlxySnc1j0rQm
 xTGcp2CU2VN/hLroo0TJCSjcToutskXNfwIiaZ7zw/X05le+04C7D/yxM
 pf3VRv09AiUzzadAfLttgNrygdnblFOegQ+nE7P0R5TT349xYhYXoUV9l Q==;
X-CSE-ConnectionGUID: iwyP0mJlS8uNFnN9DSDJIw==
X-CSE-MsgGUID: BPwJNvfZS9imcFRKNlse4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="85022824"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="85022824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:18 -0700
X-CSE-ConnectionGUID: 9j69VmOBT4WJrVPUQy0kqw==
X-CSE-MsgGUID: syDZV+fGQNOqYtY7T4KaCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172673724"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.244.9])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:17 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 08/13] drm/xe: Convert xe_dma_buf.c for exhaustive eviction
Date: Mon,  8 Sep 2025 12:12:41 +0200
Message-ID: <20250908101246.65025-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
References: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
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
index 7c2793265561..2e5b4b37118f 100644
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
2.51.0

