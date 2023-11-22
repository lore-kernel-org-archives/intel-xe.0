Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D336EC61DA7
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 14:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E186E10E65B;
	Wed, 22 Nov 2023 14:39:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC4510E656
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663943; x=1732199943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uRkDBEY+QVcS2i/efOuZMlOL8PDpfgO21EkXSVOqOsQ=;
 b=ZyreJaFH5Hwt86I//wquNaZPrSojLWP8GUwCR5zQBSGV+byeAUxU6DI4
 db85BsTG9fDjghdWCHT5C56NbBC1ri/VkkOHmUfcMQ48yvDzmXJLBp49j
 fyUTQC6rkWRQDIgWw+1PTgGTmQzwiq8T0zq6UQiLsUTy0jFCYsB9iC8j/
 2yOJcSLwYW9S6A+C/pu/O3KHJeybWfdbxG47KLlorOTQaS/cWBKnigyLB
 fhKJXqMG+jnDIdGoXwlI4cZ7izaC47r/CyDnEHtf8oHrA51laF5EVPIQu
 BrzbH9+cjHB+CB+rcCMTo7PrusVgu8zaZUNJPk+k9k9QIKMCpSLAGRooj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395985120"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="395985120"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098430334"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1098430334"
Received: from arechber-mobl.ger.corp.intel.com (HELO 039181c9d572.intel.com)
 ([10.249.44.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:47 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 14:38:23 +0000
Message-Id: <20231122143833.7-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/14] drm/xe/uapi: Reject bo creation of
 unaligned size
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

For xe bo creation we request passing size which matches system or
vram minimum page alignment. This way we want to ensure userspace
is aware of region constraints and not aligned allocations will be
rejected returning EINVAL.

v2:
- Rebase, Update uAPI documentation. (Thomas)
v3:
- Adjust the dma-buf kunit test accordingly. (Thomas)
v4:
- Fixed rebase conflicts and updated commit message. (Francois)

Signed-off-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c |  8 +++++++-
 drivers/gpu/drm/xe/xe_bo.c            | 24 ++++++++++++++++--------
 include/uapi/drm/xe_drm.h             | 17 +++++++++--------
 3 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 18c00bc03024..a6756b554069 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -109,14 +109,20 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 	struct drm_gem_object *import;
 	struct dma_buf *dmabuf;
 	struct xe_bo *bo;
+	size_t size;
 
 	/* No VRAM on this device? */
 	if (!ttm_manager_type(&xe->ttm, XE_PL_VRAM0) &&
 	    (params->mem_mask & XE_BO_CREATE_VRAM0_BIT))
 		return;
 
+	size = PAGE_SIZE;
+	if ((params->mem_mask & XE_BO_CREATE_VRAM0_BIT) &&
+	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+		size = SZ_64K;
+
 	kunit_info(test, "running %s\n", __func__);
-	bo = xe_bo_create(xe, NULL, NULL, PAGE_SIZE, ttm_bo_type_device,
+	bo = xe_bo_create(xe, NULL, NULL, size, ttm_bo_type_device,
 			  XE_BO_CREATE_USER_BIT | params->mem_mask);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index bbce4cd80f7e..4c7c37ca8c50 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1202,6 +1202,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	};
 	struct ttm_placement *placement;
 	uint32_t alignment;
+	size_t aligned_size;
 	int err;
 
 	/* Only kernel objects should set GT */
@@ -1212,23 +1213,30 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (!bo) {
-		bo = xe_bo_alloc();
-		if (IS_ERR(bo))
-			return bo;
-	}
-
 	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
 	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
 	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
-		size = ALIGN(size, SZ_64K);
+		aligned_size = ALIGN(size, SZ_64K);
+		if (type != ttm_bo_type_device)
+			size = ALIGN(size, SZ_64K);
 		flags |= XE_BO_INTERNAL_64K;
 		alignment = SZ_64K >> PAGE_SHIFT;
+
 	} else {
-		size = ALIGN(size, PAGE_SIZE);
+		aligned_size = ALIGN(size, SZ_4K);
+		flags &= ~XE_BO_INTERNAL_64K;
 		alignment = SZ_4K >> PAGE_SHIFT;
 	}
 
+	if (type == ttm_bo_type_device && aligned_size != size)
+		return ERR_PTR(-EINVAL);
+
+	if (!bo) {
+		bo = xe_bo_alloc();
+		if (IS_ERR(bo))
+			return bo;
+	}
+
 	bo->tile = tile;
 	bo->size = size;
 	bo->flags = flags;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c80e03b61489..da10d946930b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -206,11 +206,13 @@ struct drm_xe_query_mem_region {
 	 *
 	 * When the kernel allocates memory for this region, the
 	 * underlying pages will be at least @min_page_size in size.
-	 *
-	 * Important note: When userspace allocates a GTT address which
-	 * can point to memory allocated from this region, it must also
-	 * respect this minimum alignment. This is enforced by the
-	 * kernel.
+	 * Buffer objects with an allowable placement in this region must be
+	 * created with a size aligned to this value.
+	 * GPU virtual address mappings of (parts of) buffer objects that
+	 * may be placed in this region must also have their GPU virtual
+	 * address and range aligned to this value.
+	 * Affected IOCTLS will return %-EINVAL if alignment restrictions are
+	 * not met.
 	 */
 	__u32 min_page_size;
 	/**
@@ -516,9 +518,8 @@ struct drm_xe_gem_create {
 	__u64 extensions;
 
 	/**
-	 * @size: Requested size for the object
-	 *
-	 * The (page-aligned) allocated size for the object will be returned.
+	 * @size: Size of the object to be created, must match region
+	 * (system or vram) minimum alignment (&min_page_size).
 	 */
 	__u64 size;
 
-- 
2.34.1

