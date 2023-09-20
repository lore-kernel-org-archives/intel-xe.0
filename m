Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03408CE79AC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 08:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CAB10E168;
	Wed, 20 Sep 2023 08:22:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DE910E168
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695198149; x=1726734149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q7mun/78loOohHiZqs4rNcpptGLdacd8jA5XbsHnUYg=;
 b=aaDUFnaEP9Ks+wNMrO8liof/s6XkOOZRoozFEWl/d2+7FTuqs+amwChY
 1YmeVx1dn92eQ5sMRkHYWNpWCN5A+rzq5GyiDEpsSFRBMDerFEVY3bCM6
 bGjCjndjCEymYUcVaxaREkiaG6lb8uQPkzqIZukZhef3hEkqjm1VhKXY6
 T6XmVjJzEhvQYJBnhDtwl8Ehd+wDxcWTLad1nYyk8H+rkYRpYBvXpKSLH
 4MjTUtJVI521qtVL6bqglp3Yl4sDjsH5H8B2sJNSHi7EEsFAdIpzVom0H
 AJ0dRmJ5sQe+BrnKvKZDAwfW0zQhs3f2w2xaUy3s+3SxFsrEpP1SGcIKG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446629852"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="446629852"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="696218021"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="696218021"
Received: from noors55x-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.146])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:22:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 10:22:17 +0200
Message-ID: <20230920082217.2093-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/bo: Evict VRAM to TT rather than
 to system
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

The dma-buf kunit test and to some extent the dma-buf code assumed
that all bos were evicted to system. Fix this by having the dma-buf
code not assume anything about eviction placement and the test
code assume that VRAM bos are evicted to TT.

The patch applies using automerge conflict resolution.

This fixes the following errors:

[  102.102086]     KTAP version 1
[  102.102102]     # Subtest: xe_dma_buf
[  102.102113]     1..1
[  102.102377]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.106167]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
               Importer wasn't properly evicted.
[  102.106327]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.107136]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:98
                   Expected xe_bo_is_mem_type(exported, mem_type) to be true, but is false
[  102.107691]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.108099]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
               Importer wasn't properly evicted.
[  102.108158]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.108294]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.108742]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
               Importer wasn't properly evicted.
[  102.108800]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.108908]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.109080]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.109842]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.109941]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.110131]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.110236]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.110402]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.110731]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
               Importer wasn't properly evicted.
[  102.110790]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.111498]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.111793]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
               Importer wasn't properly evicted.
[  102.111851]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.112302]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.112580]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
               Importer wasn't properly evicted.
[  102.112638]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
[  102.113292]     not ok 1 xe_dma_buf_kunit
[  102.113296] not ok 1 xe_dma_buf

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c |  5 ++---
 drivers/gpu/drm/xe/xe_dma_buf.c       | 11 ++++-------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 1c3f4bc72b99..1c4d8751be69 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -72,7 +72,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 	}
 
 	/* Verify that also importer has been evicted to SYSTEM */
-	if (!xe_bo_is_mem_type(imported, XE_PL_SYSTEM)) {
+	if (exported != imported && !xe_bo_is_mem_type(imported, XE_PL_SYSTEM)) {
 		KUNIT_FAIL(test, "Importer wasn't properly evicted.\n");
 		return;
 	}
@@ -91,8 +91,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 	 * possible, saving a migration step as the transfer is just
 	 * likely as fast from system memory.
 	 */
-	if (params->force_different_devices &&
-	    params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)
+	if (params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)
 		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, XE_PL_TT));
 	else
 		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index bd8d51e7f93f..cfde3be3b0dc 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -98,13 +98,10 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 		return ERR_PTR(-EOPNOTSUPP);
 
 	if (!xe_bo_is_pinned(bo)) {
-		if (!attach->peer2peer ||
-		    bo->ttm.resource->mem_type == XE_PL_SYSTEM) {
-			if (xe_bo_can_migrate(bo, XE_PL_TT))
-				r = xe_bo_migrate(bo, XE_PL_TT);
-			else
-				r = xe_bo_validate(bo, NULL, false);
-		}
+		if (!attach->peer2peer)
+			r = xe_bo_migrate(bo, XE_PL_TT);
+		else
+			r = xe_bo_validate(bo, NULL, false);
 		if (r)
 			return ERR_PTR(r);
 	}
-- 
2.41.0

