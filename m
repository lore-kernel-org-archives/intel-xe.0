Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E423310F995C
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 17:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A522510E6B6;
	Wed,  8 Apr 2026 17:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLh3WwM3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3CA10E6B6
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 17:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775671027; x=1807207027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2zaMY3F7oFRVz7Dea0591yLbfq8b8yX7osp+i4bkhNo=;
 b=WLh3WwM3JguZbAi5gYw3wk3Op9YWukCZSLCNjHXZwdyUkMntyysMzyQQ
 LHVXl6L8+840DOSvDUdT1o7NRxktwCTNuo+gC4FXBgB884WHfl/t8LfqI
 CWtjLYgDfS7DRl7xvqF4PVhXFafFUQh1Wb8G/pnbO+ykVr+nKyAK0fZOg
 CbNs83+90WZFfHob2QmJFla349NrSDRw4qIJdqTF8cmK1ZQ2ZPK7S5gmh
 rYv2QabwBCUuYl+XU5I2ZNA2DNJzDC216CEDZVkBzdLDYRblFw38joH6A
 zg9Ui8hW+FnP+GGoWVm64mYTsoFurW6WJuS+/ayhHSB2w43bSnQ/a1Ngq Q==;
X-CSE-ConnectionGUID: I+7hTzaWSrO/6PpQAUMKNQ==
X-CSE-MsgGUID: D6EWZEPZSKaqEbDCtbipZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76567688"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76567688"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:57:06 -0700
X-CSE-ConnectionGUID: r9LsF5CpTN+OfinSWHZ2Eg==
X-CSE-MsgGUID: Veh+xoPYRFufRQ/lpab7PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="233418803"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 08 Apr 2026 10:57:05 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Fix bo leak in xe_dma_buf_init_obj() on
 allocation failure
Date: Wed,  8 Apr 2026 17:52:54 +0000
Message-ID: <20260408175255.3402838-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260408175255.3402838-1-shuicheng.lin@intel.com>
References: <20260408175255.3402838-1-shuicheng.lin@intel.com>
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

When drm_gpuvm_resv_object_alloc() fails, the pre-allocated storage bo
is not freed. Add xe_bo_free(storage) before returning the error.

xe_dma_buf_init_obj() calls xe_bo_init_locked(), which frees the bo on
error. Therefore, xe_dma_buf_init_obj() must also free the bo on its own
error paths. Otherwise, since xe_gem_prime_import() cannot distinguish
whether the failure originated from xe_dma_buf_init_obj() or from
xe_bo_init_locked(), it cannot safely decide whether the bo should be
freed.

Add comments documenting the ownership semantics: on success, ownership
of storage is transferred to the returned drm_gem_object; on failure,
storage is freed before returning.

v2: Add comments to explain the free logic.

Fixes: eb289a5f6cc6 ("drm/xe: Convert xe_dma_buf.c for exhaustive eviction")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4.6
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 7f9602b3363d..c0937c090d33 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -258,6 +258,13 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 	return ERR_PTR(ret);
 }
 
+/*
+ * Takes ownership of @storage: on success it is transferred to the returned
+ * drm_gem_object; on failure it is freed before returning the error.
+ * This matches the contract of xe_bo_init_locked() which frees @storage on
+ * its error paths, so callers need not (and must not) free @storage after
+ * this call.
+ */
 static struct drm_gem_object *
 xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 		    struct dma_buf *dma_buf)
@@ -271,8 +278,10 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 	int ret = 0;
 
 	dummy_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
-	if (!dummy_obj)
+	if (!dummy_obj) {
+		xe_bo_free(storage);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	dummy_obj->resv = resv;
 	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, ret) {
@@ -281,6 +290,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 		if (ret)
 			break;
 
+		/* xe_bo_init_locked() frees storage on error */
 		bo = xe_bo_init_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
 				       0, /* Will require 1way or 2way for vm_bind */
 				       ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
-- 
2.43.0

