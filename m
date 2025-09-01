Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C36CA0FF0
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 16:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C448810E4ED;
	Mon,  1 Sep 2025 16:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IF0z0ueZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0405A10E4EF
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756743216; x=1788279216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PgblD4SkZb1mUnahxQjLwP/0VqBX0XyNpAj1xJxyhG0=;
 b=IF0z0ueZtnuOgOPEYHpu3GMd5ocuTGlyl7pJvjA8oe+i8LQcE3v5hGZa
 OKMqNuNbeWW0o8Bex4/iHfgKeX629Aib54TVdY3EDMptsx8WMwUiTaK8R
 WuV/gg+t9NyLZTB4B9VRg5KmhnMbSYVOwm5hPZZkJi6aR68uYiQieoJlk
 yNFrAlcPu5+H4AQHtroDSfFF4TijdKUboCN/AiWrU/ge8aVED3Z1utwhM
 Ajk5Ir+xtgLmkFmSverr1azeoqh0DQ2NYVvZko5NdQLjUjsDhaI2O6uRH
 d7WRoEeSWAw973w98ZBVpqu/q3QJjBcatyGe5KnXA+MwFC4YRBvXRfFk5 Q==;
X-CSE-ConnectionGUID: jmTX4awHQyWQTRVszxzZVA==
X-CSE-MsgGUID: wpglNVuOSH2DKsJ3H/X4Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58204367"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58204367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:13:35 -0700
X-CSE-ConnectionGUID: tNH6LqPSSuWjOX6+sgE4qQ==
X-CSE-MsgGUID: NuB5LPwaTnqrWhZX6t7gVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="171215192"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.171])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:13:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 08/14] drm/xe: Convert xe_dma_buf.c for exhaustive eviction
Date: Mon,  1 Sep 2025 18:12:43 +0200
Message-ID: <20250901161250.5279-9-thomas.hellstrom@linux.intel.com>
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

