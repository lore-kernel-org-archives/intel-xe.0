Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB090D767F2
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A9710E435;
	Thu, 31 Oct 2024 18:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2FXNE6f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D276E10E03D
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398223; x=1761934223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8uk+tj4htoMlxY8Hy9DzUykmQUBi8eFHkBPKR9okMYo=;
 b=Y2FXNE6fVvhjd4BHeF4hUjYrSbzvNIOblQVETSTBNd/EyjmdAURDOgIH
 fE0z2x85OrwYV87zTHk9wbMXuLBpdBAfgLhQkKY/oCEeBJ/5JpaIt6idi
 lg5PcGweCri0uzRJhZff9rlXev7KXdfp1KZDq5Dyzzjgw8dgykBDiex4F
 5eMD+3x36xqQ453Tx+Mer9sQ1jIvzhVc6SUWFEvH+ijvXzlUUENnx1tQ5
 ragMFVbKfmtMFfRpTEUxUVl2Vw2/++BtnVgy0WEdn7HC+m6SC3rCkW+IX
 WSw1Y57qbXZiMNljMEmtK+SZ5vSh6vv5Fr2fabQTWr4CB+I0KEY3uxjql w==;
X-CSE-ConnectionGUID: SuUTu74pSQq2XqbErbTfjg==
X-CSE-MsgGUID: v4puKRFbS1iF7RSiEl1bsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41255868"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41255868"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
X-CSE-ConnectionGUID: xrB3N0eiRu6fv2u2fp5k/w==
X-CSE-MsgGUID: FfMYB4I2QdyU3dxVTnC1GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86637564"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Date: Thu, 31 Oct 2024 11:10:42 -0700
Message-Id: <20241031181048.2948948-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031181048.2948948-1-matthew.brost@intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
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

Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
VRAM easily be accessed. Add ttm_bo_access, which is similar to
ttm_bo_vm_access, to access such memory.

v4:
 - Fix checkpatch warnings (CI)
v5:
 - Fix checkpatch warnings (CI)
v6:
 - Fix kernel doc (Auld)

Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
 include/drm/ttm/ttm_bo.h          |  2 +
 3 files changed, 89 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d939925efa81..77e760ea7193 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 	return progress;
 }
+
+static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
+			      unsigned long offset,
+			      void *buf, int len, int write)
+{
+	unsigned long page = offset >> PAGE_SHIFT;
+	unsigned long bytes_left = len;
+	int ret;
+
+	/* Copy a page at a time, that way no extra virtual address
+	 * mapping is needed
+	 */
+	offset -= page << PAGE_SHIFT;
+	do {
+		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
+		struct ttm_bo_kmap_obj map;
+		void *ptr;
+		bool is_iomem;
+
+		ret = ttm_bo_kmap(bo, page, 1, &map);
+		if (ret)
+			return ret;
+
+		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
+		WARN_ON_ONCE(is_iomem);
+		if (write)
+			memcpy(ptr, buf, bytes);
+		else
+			memcpy(buf, ptr, bytes);
+		ttm_bo_kunmap(&map);
+
+		page++;
+		buf += bytes;
+		bytes_left -= bytes;
+		offset = 0;
+	} while (bytes_left);
+
+	return len;
+}
+
+/**
+ * ttm_bo_access - Helper to access a buffer object
+ *
+ * @bo: ttm buffer object
+ * @offset: access offset into buffer object
+ * @buf: pointer to caller memory to read into or write from
+ * @len: length of access
+ * @write: write access
+ *
+ * Utility function to access a buffer object. Useful when buffer object cannot
+ * be easily mapped (non-contiguous, non-visible, etc...).
+ *
+ * Returns:
+ * @len if successful, negative error code on failure.
+ */
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write)
+{
+	int ret;
+
+	if (len < 1 || (offset + len) > bo->base.size)
+		return -EIO;
+
+	ret = ttm_bo_reserve(bo, true, false, NULL);
+	if (ret)
+		return ret;
+
+	switch (bo->resource->mem_type) {
+	case TTM_PL_SYSTEM:
+		fallthrough;
+	case TTM_PL_TT:
+		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
+		break;
+	default:
+		if (bo->bdev->funcs->access_memory)
+			ret = bo->bdev->funcs->access_memory
+				(bo, offset, buf, len, write);
+		else
+			ret = -EIO;
+	}
+
+	ttm_bo_unreserve(bo);
+
+	return ret;
+}
+EXPORT_SYMBOL(ttm_bo_access);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 2c699ed1963a..20b1e5f78684 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
 }
 EXPORT_SYMBOL(ttm_bo_vm_close);
 
-static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
-				 unsigned long offset,
-				 uint8_t *buf, int len, int write)
-{
-	unsigned long page = offset >> PAGE_SHIFT;
-	unsigned long bytes_left = len;
-	int ret;
-
-	/* Copy a page at a time, that way no extra virtual address
-	 * mapping is needed
-	 */
-	offset -= page << PAGE_SHIFT;
-	do {
-		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
-		struct ttm_bo_kmap_obj map;
-		void *ptr;
-		bool is_iomem;
-
-		ret = ttm_bo_kmap(bo, page, 1, &map);
-		if (ret)
-			return ret;
-
-		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
-		WARN_ON_ONCE(is_iomem);
-		if (write)
-			memcpy(ptr, buf, bytes);
-		else
-			memcpy(buf, ptr, bytes);
-		ttm_bo_kunmap(&map);
-
-		page++;
-		buf += bytes;
-		bytes_left -= bytes;
-		offset = 0;
-	} while (bytes_left);
-
-	return len;
-}
-
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write)
 {
@@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	unsigned long offset = (addr) - vma->vm_start +
 		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
 		 << PAGE_SHIFT);
-	int ret;
-
-	if (len < 1 || (offset + len) > bo->base.size)
-		return -EIO;
 
-	ret = ttm_bo_reserve(bo, true, false, NULL);
-	if (ret)
-		return ret;
-
-	switch (bo->resource->mem_type) {
-	case TTM_PL_SYSTEM:
-		fallthrough;
-	case TTM_PL_TT:
-		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
-		break;
-	default:
-		if (bo->bdev->funcs->access_memory)
-			ret = bo->bdev->funcs->access_memory(
-				bo, offset, buf, len, write);
-		else
-			ret = -EIO;
-	}
-
-	ttm_bo_unreserve(bo);
-
-	return ret;
+	return ttm_bo_access(bo, offset, buf, len, write);
 }
 EXPORT_SYMBOL(ttm_bo_vm_access);
 
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 5804408815be..8ea11cd8df39 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
 int ttm_bo_evict_first(struct ttm_device *bdev,
 		       struct ttm_resource_manager *man,
 		       struct ttm_operation_ctx *ctx);
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write);
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 			     struct vm_fault *vmf);
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
-- 
2.34.1

