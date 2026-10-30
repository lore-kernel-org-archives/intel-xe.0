Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10547606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BmyRiyTt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9FE10E2CE;
	Fri, 30 Oct 2026 16:04:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEB310E2CE
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793376234; x=1824912234;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9Rhi95/YoidInddbHc4sgs2AnHlPyCcRYsLv+b8nBdA=;
 b=BmyRiyTtRQ9IT86/JeZwa8pbaWkwrHuRUtRwJEVDqFRHKdyXRTIwfnwZ
 nhcpqkcQHWo38g9Wv5UnddqdGXcv5N9jcBK9ugeZ0kb9Wx1cYQkuJx5QH
 essJl/eTZbP4xEh7aDnfmCBuUPOM0Hrw2V3fICGNnlXw4N8TapYMpbupi
 KIeVCQQrZTxyH1Arx996/TF9yNMUmPFp8v/bJzjWxhX5juqec6Y0msBBq
 a4wgS0fxHVMlQtGaK9z8D3Sz8p7iPx2eswnos1QSCsqJrzOBYeLOUshp5
 gSoa3ctfbhfSYfw9DiUPxC/+fzd9NeT/hSdaj/K775ju2YdD+qVqq9Fhp w==;
X-CSE-ConnectionGUID: tkonoS3jRXSFChRrXtWeXg==
X-CSE-MsgGUID: pgZKqe7+Q7uPWEscewWqHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2134159"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2134159"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 09:03:54 -0700
X-CSE-ConnectionGUID: 0tTdoesPS7GnlZ84VWHNiA==
X-CSE-MsgGUID: Xg0catgST7iCGFO8BmxqKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5371345"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 09:03:54 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/dma-buf: Add xe_dma_buf_to_gem() self-import helper
Date: Fri, 30 Oct 2026 09:03:50 -0700
Message-ID: <20261030160349.2743506-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Factor the dma-buf self-import detection out of xe_gem_prime_import()
into a standalone xe_dma_buf_to_gem() helper. The helper checks that the
dma-buf was exported by this Xe device (matching ops and drm_device) and,
if so, takes an extra reference on the backing GEM object instead of the
dma-buf file. Expose it for future use within Xe.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 38 ++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_dma_buf.h |  2 ++
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 6a85b292dee7..5bf13dc4b61d 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -239,6 +239,27 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
 	.vunmap = drm_gem_dmabuf_vunmap,
 };
 
+struct drm_gem_object *xe_dma_buf_to_gem(struct drm_device *dev,
+					 struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *obj;
+
+	if (dma_buf->ops != &xe_dmabuf_ops)
+		return NULL;
+
+	obj = dma_buf->priv;
+	if (obj->dev != dev)
+		return NULL;
+
+	/*
+	 * Importing dmabuf exported from our own gem increases
+	 * refcount on gem itself instead of f_count of dmabuf.
+	 */
+	drm_gem_object_get(obj);
+
+	return obj;
+}
+
 struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
 	struct xe_bo *bo = gem_to_xe_bo(obj);
@@ -372,17 +393,14 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 	struct dma_buf_attachment *attach;
 	struct drm_gem_object *obj;
 
-	if (dma_buf->ops == &xe_dmabuf_ops) {
-		obj = dma_buf->priv;
-		if (obj->dev == dev &&
-		    !XE_TEST_ONLY(test && test->force_different_devices)) {
-			/*
-			 * Importing dmabuf exported from out own gem increases
-			 * refcount on gem itself instead of f_count of dmabuf.
-			 */
-			drm_gem_object_get(obj);
+	obj = xe_dma_buf_to_gem(dev, dma_buf);
+	if (obj) {
+		if (!XE_TEST_ONLY(test && test->force_different_devices))
 			return obj;
-		}
+
+		/* Test only: force different devices */
+		drm_gem_object_put(obj);
+		obj = NULL;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.h b/drivers/gpu/drm/xe/xe_dma_buf.h
index 861dd28a862c..d0c7893a5a6f 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.h
+++ b/drivers/gpu/drm/xe/xe_dma_buf.h
@@ -8,6 +8,8 @@
 
 #include <drm/drm_gem.h>
 
+struct drm_gem_object *xe_dma_buf_to_gem(struct drm_device *dev,
+					 struct dma_buf *dma_buf);
 struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags);
 struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 					   struct dma_buf *dma_buf);
-- 
2.43.0

