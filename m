Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BA4CA9EDE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 19:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB3610E5B8;
	Mon, 12 Oct 2026 19:10:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F2A10E5B8
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 19:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791832253; x=1823368253;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=i/+mYXE/6DWjL6muo8igCHHFSlqfUKt+53jy637ciSs=;
 b=a5MEAdys4f3Acx3KLhJnuZp2Wt8C4dsgETTh+RE2tumAlK3iW2ig25Kv
 Lz4e1IVllmFcCFaEHk/Az9nAnZ/gE2oJVBp3NmV3TszSMCrK0p4XAUbTE
 HqhXM+6/D89r90bFbVUM29AknOaLd782qqgGHKhpNww0cPPCEHR/mXJvv
 OFGt3T4J9tJ1QS7WPB4C378pvE4awINIID+jdnYKtzn/zuRKY66E/KWW4
 jvzrmBajTOcOqpr4Y5TIeljM1mkq0Zf/JGzmfaCm5VgDJV0ZndjZVPbFa
 sZQB3wtvYQoeROcKZJDBd3KGQZ8tyl5WIHSJ/KIn1TwadbSoOVKqUmUby Q==;
X-CSE-ConnectionGUID: Ac5trIJPSuihIUrwPCFYMg==
X-CSE-MsgGUID: 3pnt7aTNRrW0uVSekDecNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="445432"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="445432"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:10:46 -0700
X-CSE-ConnectionGUID: 7L4snU4FTKeV+62iHUN6rA==
X-CSE-MsgGUID: Npsm6xJtSbu7vzNFQOuGMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2747985"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:10:46 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/xe/tests: add regression for eviction of a BO with
 no resource
Date: Mon, 12 Oct 2026 12:10:41 -0700
Message-ID: <20261012191041.1492725-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012191041.1492725-4-niranjana.vishwanathapura@intel.com>
References: <20261012191041.1492725-4-niranjana.vishwanathapura@intel.com>
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

Exercise the xe_evict_flags() NULL-resource path: import a dma-buf, gut
the importer to an empty placement so it drops its resource, then drive
the real xe_dma_buf_move_notify() -> xe_bo_evict() path and verify it no
longer faults.

Assisted-by: GitHub-Copilot:claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 89 +++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 0be8440b3976..792376e965f1 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -195,6 +195,79 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 	drm_gem_object_put(&bo->ttm.base);
 }
 
+/*
+ * Reproduce the move_notify crash path: an imported BO whose ttm.resource is
+ * NULL (as happens mid-teardown) must survive xe_dma_buf_move_notify(), which
+ * evicts it via xe_bo_evict() -> xe_evict_flags(), instead of dereferencing
+ * the NULL resource.
+ */
+static void xe_test_dmabuf_move_notify_no_resource(struct xe_device *xe)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
+	struct drm_gem_object *import;
+	struct dma_buf *dmabuf;
+	struct xe_bo *bo;
+
+	/* Needs a separate, dynamically attached importer bo with move_notify. */
+	if (!params->force_different_devices || !is_dynamic(params))
+		return;
+
+	kunit_info(test, "running %s\n", __func__);
+	bo = xe_bo_create_user(xe, NULL, PAGE_SIZE, DRM_XE_GEM_CPU_CACHING_WC,
+			       params->mem_mask, NULL);
+	if (IS_ERR(bo)) {
+		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
+			   PTR_ERR(bo));
+		return;
+	}
+
+	dmabuf = xe_gem_prime_export(&bo->ttm.base, 0);
+	if (IS_ERR(dmabuf)) {
+		KUNIT_FAIL(test, "xe_gem_prime_export() failed with err=%ld\n",
+			   PTR_ERR(dmabuf));
+		goto out;
+	}
+	bo->ttm.base.dma_buf = dmabuf;
+
+	import = xe_gem_prime_import(&xe->drm, dmabuf);
+	if (IS_ERR(import)) {
+		KUNIT_FAIL(test, "xe_gem_prime_import failed with err=%ld\n",
+			   PTR_ERR(import));
+	} else {
+		struct xe_bo *import_bo = gem_to_xe_bo(import);
+		struct ttm_operation_ctx ctx = {
+			.interruptible = false,
+			.gfp_retry_mayfail = true,
+		};
+		struct ttm_placement empty = {};
+		int ret;
+
+		xe_bo_lock(import_bo, false);
+
+		/*
+		 * Gut the importer to drop its resource the same way ttm does
+		 * on teardown (validate to an empty placement), leaving a live,
+		 * still-attached BO with no resource.
+		 */
+		ret = ttm_bo_validate(&import_bo->ttm, &empty, &ctx);
+		KUNIT_EXPECT_EQ(test, ret, 0);
+		KUNIT_EXPECT_TRUE(test, !import_bo->ttm.resource);
+
+		/* Crash path: move_notify -> xe_bo_evict -> xe_evict_flags. */
+		xe_dma_buf_move_notify(import->import_attach);
+		KUNIT_EXPECT_TRUE(test, !import_bo->ttm.resource);
+
+		xe_bo_unlock(import_bo);
+		drm_gem_object_put(import);
+	}
+
+	bo->ttm.base.dma_buf = NULL;
+	dma_buf_put(dmabuf);
+out:
+	drm_gem_object_put(&bo->ttm.base);
+}
+
 static const struct dma_buf_attach_ops nop2p_attach_ops = {
 	.allow_peer2peer = false,
 	.invalidate_mappings = xe_dma_buf_move_notify
@@ -274,6 +347,22 @@ static int dma_buf_run_device(struct xe_device *xe)
 		xe_test_dmabuf_import_same_driver(xe);
 	}
 
+	/*
+	 * Regression for the move_notify NULL-resource crash. Independent of
+	 * residency, so run once with a dynamic, different-device attachment.
+	 */
+	{
+		struct dma_buf_test_params p = {
+			.mem_mask = XE_BO_FLAG_SYSTEM,
+			.attach_ops = &xe_dma_buf_attach_ops,
+			.force_different_devices = true,
+		};
+
+		p.base.id = XE_TEST_LIVE_DMA_BUF;
+		test->priv = &p;
+		xe_test_dmabuf_move_notify_no_resource(xe);
+	}
+
 	/* A non-zero return would halt iteration over driver devices */
 	return 0;
 }
-- 
2.43.0

