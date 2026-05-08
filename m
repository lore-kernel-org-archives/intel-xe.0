Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FFCCD3436
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 10:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F9C10E333;
	Fri,  8 May 2026 10:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyZ/EppN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4053C10E30E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 10:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778236008; x=1809772008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pu7pmChD1XH9w2R2UuUN5IrcQ2E5t5qxx2faTX1qeLM=;
 b=MyZ/EppN++QAWFHG1XdpoZW2f3YvPtfbduRuBE8hxlV9TELSURf4AXjz
 8if+wuxMsm6Dn/uaT2o1P01ff94gStLI7u7P6rVJzb+0lqNZQKuPhey1C
 wK3KLwCQrWEW4dwvn3q1OnUbfhtOKjaZMtTacqpJPuiL+hS5BNjhkXI1t
 /vOKhi27yoFmpSqOhwIlqN65aTMU7HwvLhMYsSLfE4peuN04Ltp/L0ZvN
 Q082N87nQ7HTKEKA3U7JoYPiOSRmjUlctS9hjT3IsGArZaRf5GP9Gc6tI
 ulNFWMViy6DRDmcl5tZW2gyriW6M0Fn2lyFRXRZDBl9eO1EG4LOjYno7j w==;
X-CSE-ConnectionGUID: 2NA+1uvGSVmj2godtAZLtg==
X-CSE-MsgGUID: iCAQnU5tTmG+9giJp2l4rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89511144"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="89511144"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 03:26:48 -0700
X-CSE-ConnectionGUID: XgK3x8dlSMGHgah49f7OYA==
X-CSE-MsgGUID: r1bBQh2XT2i7ODJ1VVPNHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="236975312"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.63])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 03:26:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH v3 2/2] drm/xe/dma-buf: fix UAF with retry loop
Date: Fri,  8 May 2026 11:26:37 +0100
Message-ID: <20260508102635.149172-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508102635.149172-3-matthew.auld@intel.com>
References: <20260508102635.149172-3-matthew.auld@intel.com>
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

Retry doesn't work here, since bo will be freed on error, leading to
UAF. However, now that we do the alloc & init before the attach, we can
now combine this as one unit and have the init do the alloc for us. This
should make the retry safe.

Reported by Sashiko.

v2: Fix up the error unwind (CI)

Closes: https://sashiko.dev/#/patchset/20260506184332.86743-2-matthew.auld%40intel.com
Fixes: eb289a5f6cc6 ("drm/xe: Convert xe_dma_buf.c for exhaustive eviction")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.18+
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 49 ++++++++-------------------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 2332db502c8b..1336e048f580 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -258,16 +258,8 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 	return ERR_PTR(ret);
 }
 
-/*
- * Takes ownership of @storage: on success it is transferred to the returned
- * drm_gem_object; on failure it is freed before returning the error.
- * This matches the contract of xe_bo_init_locked() which frees @storage on
- * its error paths, so callers need not (and must not) free @storage after
- * this call.
- */
 static struct drm_gem_object *
-xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
-		    struct dma_buf *dma_buf)
+xe_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 {
 	struct dma_resv *resv = dma_buf->resv;
 	struct xe_device *xe = to_xe_device(dev);
@@ -278,10 +270,8 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 	int ret = 0;
 
 	dummy_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
-	if (!dummy_obj) {
-		xe_bo_free(storage);
+	if (!dummy_obj)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	dummy_obj->resv = resv;
 	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, ret) {
@@ -290,8 +280,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 		if (ret)
 			break;
 
-		/* xe_bo_init_locked() frees storage on error */
-		bo = xe_bo_init_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
+		bo = xe_bo_init_locked(xe, NULL, NULL, resv, NULL, dma_buf->size,
 				       0, /* Will require 1way or 2way for vm_bind */
 				       ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
 		drm_exec_retry_on_contention(&exec);
@@ -342,7 +331,6 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 	const struct dma_buf_attach_ops *attach_ops;
 	struct dma_buf_attachment *attach;
 	struct drm_gem_object *obj;
-	struct xe_bo *bo;
 
 	if (dma_buf->ops == &xe_dmabuf_ops) {
 		obj = dma_buf->priv;
@@ -357,22 +345,14 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 		}
 	}
 
-	bo = xe_bo_alloc();
-	if (IS_ERR(bo))
-		return ERR_CAST(bo);
-
 	/*
-	 * xe_dma_buf_init_obj() takes ownership of the raw bo, so do not touch
-	 * on fail, since it will already take care of cleanup. On success we
-	 * still need to drop the ref, if something later fails.
-	 *
-	 * In addition this needs to happen before the attach, since
-	 * it will create a new attachment for this, and add it to the list of
-	 * attachments, at which point it is globally visible, and at any point
-	 * the export side can call into on invalidate_mappings callback, which
-	 * require a working object.
+	 * This needs to happen before the attach, since it will create a new
+	 * attachment for this, and add it to the list of attachments, at which
+	 * point it is globally visible, and at any point the export side can
+	 * call into on invalidate_mappings callback, which require a working
+	 * object.
 	 */
-	obj = xe_dma_buf_init_obj(dev, bo, dma_buf);
+	obj = xe_dma_buf_create_obj(dev, dma_buf);
 	if (IS_ERR(obj))
 		return obj;
 
@@ -382,20 +362,15 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 		attach_ops = test->attach_ops;
 #endif
 
-	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base);
+	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, obj);
 	if (IS_ERR(attach)) {
-		obj = ERR_CAST(attach);
-		goto out_err;
+		xe_bo_put(gem_to_xe_bo(obj));
+		return ERR_CAST(attach);
 	}
 
 	get_dma_buf(dma_buf);
 	obj->import_attach = attach;
 	return obj;
-
-out_err:
-	xe_bo_put(bo);
-
-	return obj;
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
-- 
2.53.0

