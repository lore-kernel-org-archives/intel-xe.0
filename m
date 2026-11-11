Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0C9606A327
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=asPbJoDs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB9E10FA4E;
	Wed, 11 Nov 2026 10:10:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F88E10FA67
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794391798; x=1825927798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BMnxFsvhvEsTr3QuL/lZAYvYXC/iz08U4mMni2SukH4=;
 b=asPbJoDsKtnDajH+uOIpg5Dp4+NOoLMBYmknc7n1yWJLypCRen46BEnZ
 kFS+feqKC4ibAni1obxgFjkKCtY1/JpgnA5ypGmAbaSeMysf3YK6kY/+L
 2Ryx5yghWPJQiqzfeNzWyW/AtHm293ImzHKQRuNE07ZPgTlwwEnb5jYa6
 gejde06RvvpQXHqiNuqA8ci8KC80f7rnvvypuqCeRangNHd6DUNZC2+JV
 zLbC1n1eYmRxpk+S1Icj9zAT/MNPqGSMbr8fF7+57dHp56eVdHdEREnhP
 szDOCQ2vxZGpwVvan+6HpLX/YhkCvBstqj2gtVbVfQrXtExAM7k5v/XJD g==;
X-CSE-ConnectionGUID: Q0zGR6oeTc+DUMBjtKaAYw==
X-CSE-MsgGUID: 8Q2u198yQAe9n33lQJMlPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3158169"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3158169"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:09:57 -0800
X-CSE-ConnectionGUID: 3Cx5tL99R46FTssmG1yh2Q==
X-CSE-MsgGUID: VXyJeHEyRfCDOYqjyT6g4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8812997"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.171])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:09:54 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/dma-buf: Validate BOs on export to charge the exporter
Date: Wed, 11 Nov 2026 11:09:29 +0100
Message-ID: <20261111100929.2228-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_gem_prime_export() calls ttm_bo_setup_export() to make sure the
exporter is charged for the memory backing an exported BO. However,
that only populates a TTM_PL_SYSTEM tt. A BO that has been evicted, or
that has deferred backing, will instead get its memory allocated when
the importer maps it. For p2p imports this happens through
xe_bo_validate() in xe_dma_buf_map(), so the importer, not the
exporter, is charged for the allocation.

Call xe_bo_validate() at export time instead, so that the BO is moved
into its preferred placement and the exporter is charged.

Do the purgeable checks and the validation in the same
xe_validation_guard() transaction, to avoid locking the BO twice.

The commit message and code was drafted using LLM.

Link: https://patchwork.freedesktop.org/patch/747480/?series=172524&rev=1
Fixes: 91494dee1091 ("xe: populate buffers before exporting them.")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.18+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 76 +++++++++++++++++----------------
 1 file changed, 39 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 5bf13dc4b61d..90c9b90de552 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -263,60 +263,62 @@ struct drm_gem_object *xe_dma_buf_to_gem(struct drm_device *dev,
 struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct dma_buf *buf;
-	struct ttm_operation_ctx ctx = {
-		.interruptible = true,
-		.no_wait_gpu = true,
-		/* We opt to avoid OOM on system pages allocations */
-		.gfp_retry_mayfail = true,
-		.allow_res_evict = false,
-	};
-	int ret;
+	int ret = 0;
 
 	if (bo->vm)
 		return ERR_PTR(-EPERM);
 
-	/*
-	 * Reject exporting purgeable BOs. DONTNEED BOs can be purged
-	 * at any time, making the exported dma-buf unusable. Purged BOs
-	 * have no backing store and are permanently invalid.
-	 */
-	ret = xe_bo_lock(bo, true);
-	if (ret)
-		return ERR_PTR(ret);
+	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec,
+			    (struct xe_val_flags) {.interruptible = true}, ret) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			break;
 
-	if (xe_bo_madv_is_dontneed(bo)) {
-		ret = -EBUSY;
-		goto out_unlock;
-	}
+		/*
+		 * Reject exporting purgeable BOs. DONTNEED BOs can be purged
+		 * at any time, making the exported dma-buf unusable. Purged BOs
+		 * have no backing store and are permanently invalid.
+		 */
+		if (xe_bo_madv_is_dontneed(bo)) {
+			ret = -EBUSY;
+			break;
+		}
 
-	if (xe_bo_is_purged(bo)) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+		if (xe_bo_is_purged(bo)) {
+			ret = -EINVAL;
+			break;
+		}
 
-	xe_bo_willneed_get_locked(bo);
-	xe_bo_unlock(bo);
+		/*
+		 * Make sure the BO is backed in its preferred placement so that
+		 * the exporter, rather than the importer, is charged for the
+		 * memory allocation.
+		 */
+		ret = xe_bo_validate(bo, NULL, false, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &ret);
+		if (ret)
+			break;
 
-	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
+		xe_bo_willneed_get_locked(bo);
+	}
 	if (ret)
-		goto out_put;
+		return ERR_PTR(ret);
 
 	buf = drm_gem_prime_export(obj, flags);
 	if (IS_ERR(buf)) {
-		ret = PTR_ERR(buf);
-		goto out_put;
+		xe_bo_lock(bo, false);
+		xe_bo_willneed_put_locked(bo);
+		xe_bo_unlock(bo);
+		return buf;
 	}
 
 	buf->ops = &xe_dmabuf_ops;
 	return buf;
-
-out_put:
-	xe_bo_lock(bo, false);
-	xe_bo_willneed_put_locked(bo);
-out_unlock:
-	xe_bo_unlock(bo);
-	return ERR_PTR(ret);
 }
 
 static struct drm_gem_object *
-- 
2.56.0

