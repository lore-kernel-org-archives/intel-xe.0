Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C03AC77B75
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 18:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBFE10E359;
	Tue, 16 May 2023 18:44:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE87A10E359
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 18:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684262666; x=1715798666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g2JyyVbYU+f+7Gv/fvdFV9XVfuCbt4eN6j6iGGJ91A4=;
 b=JFKl1qjy3iPmtpYycyOPmb5dxV5v9HQcIdzp46SZaG8pnSAnUFqxHuUX
 kUFoc2Tu3cee/cBfvVHnDlbYKHl3DFntzrfwXFNhkgiZJ2xosp/tIq7zk
 OvT1krdlw5J1cuIZ0Ppf3zF+nu6iLCF1vt1Gf1w8EqcOZ9/aFMB36ws9V
 q79ek+7+MwoMA8d6X1Wr6WfuCWY1QQWVtr5A8RrZ5F29YYJQ2K9jhA0Qy
 3/BGaOWOL/ZUSwy7ZqswaONaoDSpaIRBGR8PypIasUO0RQrzt9Ag9JMdv
 jR16W2wawqBbVV2ikSYumHxPCw6HDE8az++JE8M8BMNA+CyHftydv+NcM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="351590989"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="351590989"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 11:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="771168132"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="771168132"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 11:44:26 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 11:44:20 -0700
Message-Id: <20230516184420.11806-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Apply upper limit to sg element size
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Specify maximum segment size for sg elements by using
sg_alloc_table_from_pages_segment() to allocate sg_table.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c |  8 +++++---
 drivers/gpu/drm/xe/xe_bo.h | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c |  8 +++++---
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c82e995df779..21c5aca424dd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -251,9 +251,11 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	if (xe_tt->sg)
 		return 0;
 
-	ret = sg_alloc_table_from_pages(&xe_tt->sgt, tt->pages, num_pages,
-					0, (u64)num_pages << PAGE_SHIFT,
-					GFP_KERNEL);
+	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
+						num_pages, 0,
+						(u64)num_pages << PAGE_SHIFT,
+						xe_sg_segment_size(xe_tt->dev),
+						GFP_KERNEL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7e111332c35a..a1c51cc0ac3c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -296,6 +296,27 @@ void xe_bo_put_commit(struct llist_head *deferred);
 
 struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
 
+/*
+ * xe_sg_segment_size() - Provides upper limit for sg segment size.
+ * @dev: device pointer
+ *
+ * Returns the maximum segment size for the 'struct scatterlist'
+ * elements.
+ */
+static inline unsigned int xe_sg_segment_size(struct device *dev)
+{
+	size_t max = min_t(size_t, UINT_MAX, dma_max_mapping_size(dev));
+
+	/*
+	 * The iommu_dma_map_sg() function ensures iova allocation doesn't
+	 * cross dma segment boundary. It does so by padding some sg elements.
+	 * This can cause overflow, ending up with sg->length being set to 0.
+	 * Avoid this by ensuring maximum segment size is half of 'max'
+	 * rounded down to PAGE_SIZE.
+	 */
+	return round_down(max / 2, PAGE_SIZE);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2aa5bf9cfee1..5c2fdfc0e836 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -117,9 +117,11 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	if (ret)
 		goto out;
 
-	ret = sg_alloc_table_from_pages(&vma->userptr.sgt, pages, pinned,
-					0, (u64)pinned << PAGE_SHIFT,
-					GFP_KERNEL);
+	ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt, pages,
+						pinned, 0,
+						(u64)pinned << PAGE_SHIFT,
+						xe_sg_segment_size(xe->drm.dev),
+						GFP_KERNEL);
 	if (ret) {
 		vma->userptr.sg = NULL;
 		goto out;
-- 
2.21.0.rc0.32.g243a4c7e27

