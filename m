Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7577CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 16:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E17910E178;
	Tue, 17 Oct 2023 16:33:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706C510E178
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697560391; x=1729096391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rQPaWdymYWEmzehINOyBAWH7w/Fe2JRO1yUcz3IA+uk=;
 b=QiP6D+m3BBIMilIUnf/bUhP0c3zhSdZv8O+BumImPrzjROc4fPHhWmrd
 J0bHPP+KBIF3sLmHapIGZ4Rq4j+D4jud2HROmj1XeZWi7zXmzaSq5wkdW
 5s0VMmJRHJtNmZ+EPbf+sicR103pZWZPeC2Z/EsbAC/nbHLhDG2H2J0gA
 PbuMT6Kjftec4tqIyJ6s1QLHT2XpE5nCj+8QQDylf0UmkERYh5YBjCDXb
 IapHvhHFXx5kS8LiIFDm2gKwhNExvUGd8KPSdqfnRPfGvdhKxiAAgaCBT
 tr2ZKuiGqh01c6gaH6sxzJETEHtsNc5fhP/Bxtx+MpDqkb1wn2V2yH/xz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="370891756"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="370891756"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 09:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="785534592"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="785534592"
Received: from fhoeg-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.103])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 09:33:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 17 Oct 2023 18:32:43 +0200
Message-ID: <20231017163243.14112-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] xe/xe_bo: Reject bo creation of unaligned size
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

From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

For xe bo creation we request passing size which matches system or
vram minimum page alignment. This way we want to ensure userspace
is aware of region constraints and not aligned allocations will be
rejected returning EINVAL.

Signed-off-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 24 ++++++++++++++++--------
 include/uapi/drm/xe_drm.h  | 25 +++++++++++++++++--------
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..beed93003d40 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1201,6 +1201,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	};
 	struct ttm_placement *placement;
 	uint32_t alignment;
+	size_t aligned_size;
 	int err;
 
 	/* Only kernel objects should set GT */
@@ -1211,23 +1212,30 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
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
index 24bf8f0f52e8..ed12dc212ff1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -185,11 +185,13 @@ struct drm_xe_query_mem_region {
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
@@ -324,6 +326,14 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
+	/*
+	 * DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - This returns the
+         * maximum value of the &min_page_size across all memory regions
+	 * the device implements. User-space code that does not want
+         * to track @min_page_size per region can use this value for
+	 * a buffer-object size and GPU virtual address and -range
+	 * alignment value that is valid for all regions.
+	 */
 #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
@@ -501,9 +511,8 @@ struct drm_xe_gem_create {
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
2.41.0

