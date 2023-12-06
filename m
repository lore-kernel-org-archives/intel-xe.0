Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167F6C10F05
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 12:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC44010E71F;
	Wed,  6 Dec 2023 12:58:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199AF10E718
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701867508; x=1733403508;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jN/23Uk65wj2HfNoe9bUX6qnMIyYoyFj2PsCBk3//18=;
 b=lv5DtjrCoufqk2CPxBeQ8IihNZb8d1Fyv/3ge1kHZP0dwtPR9Cw0rOfa
 s4hFZL7INJPCpjoDPNY738XmOkos+Hs8rgDXF080swwelPNqn5y/cGLGM
 2V73JoaxB+oACLc9Yim/5NX8k0xc9SUS5qnTzPiGXKbCpYGTp7e4AM0d6
 MO76HnN0YcG0mFNfwaaCBYCyaAAtgfOCW/y33pC0/n7ar+jmnzZ6UXhlY
 YSUeN3kjVBA+Xo9ZrAC7sEoKKomhbCxItrwmqD1Xs4J/ydsJnERmsd6Kb
 H686o9+wvMeQ7u9br781pmaWb78e97P6LxJrj9mHrwD25NhbI52ySMIyz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1123899"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1123899"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018565061"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="1018565061"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.121])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:58:26 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 13:58:01 +0100
Message-ID: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 01/17] drm/gpuvm: convert WARN() to drm_WARN()
 variants
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

From: Danilo Krummrich <dakr@redhat.com>

Use drm_WARN() and drm_WARN_ON() variants to indicate drivers the
context the failing VM resides in.

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-2-dakr@redhat.com
(cherry picked from commit 546ca4d35dccaca6613766ed36ccfb2b5bd63bfe)
---
 drivers/gpu/drm/drm_gpuvm.c            | 32 ++++++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 include/drm/drm_gpuvm.h                |  7 ++++++
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 02ce6baacdad..b378554b81ac 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -614,12 +614,12 @@ static int __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 static void __drm_gpuva_remove(struct drm_gpuva *va);
 
 static bool
-drm_gpuvm_check_overflow(u64 addr, u64 range)
+drm_gpuvm_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 {
 	u64 end;
 
-	return WARN(check_add_overflow(addr, range, &end),
-		    "GPUVA address limited to %zu bytes.\n", sizeof(end));
+	return drm_WARN(gpuvm->drm, check_add_overflow(addr, range, &end),
+			"GPUVA address limited to %zu bytes.\n", sizeof(end));
 }
 
 static bool
@@ -647,7 +647,7 @@ static bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
-	return !drm_gpuvm_check_overflow(addr, range) &&
+	return !drm_gpuvm_check_overflow(gpuvm, addr, range) &&
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
@@ -656,6 +656,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
+ * @drm: the &drm_device this VM resides in
  * @start_offset: the start offset of the GPU VA space
  * @range: the size of the GPU VA space
  * @reserve_offset: the start of the kernel reserved GPU VA area
@@ -668,8 +669,8 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
  * &name is expected to be managed by the surrounding driver structures.
  */
 void
-drm_gpuvm_init(struct drm_gpuvm *gpuvm,
-	       const char *name,
+drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+	       struct drm_device *drm,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
 	       const struct drm_gpuvm_ops *ops)
@@ -677,20 +678,20 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
 	gpuvm->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
-	drm_gpuvm_check_overflow(start_offset, range);
-	gpuvm->mm_start = start_offset;
-	gpuvm->mm_range = range;
-
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->ops = ops;
+	gpuvm->drm = drm;
 
-	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
+	drm_gpuvm_check_overflow(gpuvm, start_offset, range);
+	gpuvm->mm_start = start_offset;
+	gpuvm->mm_range = range;
 
+	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
 	if (reserve_range) {
 		gpuvm->kernel_alloc_node.va.addr = reserve_offset;
 		gpuvm->kernel_alloc_node.va.range = reserve_range;
 
-		if (likely(!drm_gpuvm_check_overflow(reserve_offset,
+		if (likely(!drm_gpuvm_check_overflow(gpuvm, reserve_offset,
 						     reserve_range)))
 			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
 	}
@@ -712,8 +713,8 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 	if (gpuvm->kernel_alloc_node.va.range)
 		__drm_gpuva_remove(&gpuvm->kernel_alloc_node);
 
-	WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
-	     "GPUVA tree is not empty, potentially leaking memory.");
+	drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
+		 "GPUVA tree is not empty, potentially leaking memory.\n");
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
@@ -795,7 +796,8 @@ drm_gpuva_remove(struct drm_gpuva *va)
 	struct drm_gpuvm *gpuvm = va->vm;
 
 	if (unlikely(va == &gpuvm->kernel_alloc_node)) {
-		WARN(1, "Can't destroy kernel reserved node.\n");
+		drm_WARN(gpuvm->drm, 1,
+			 "Can't destroy kernel reserved node.\n");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 5cf892c50f43..aaf5d28bd587 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1808,6 +1808,7 @@ int
 nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		  u64 kernel_managed_addr, u64 kernel_managed_size)
 {
+	struct drm_device *drm = cli->drm->dev;
 	int ret;
 	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
 
@@ -1836,7 +1837,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->base, cli->name,
+	drm_gpuvm_init(&uvmm->base, cli->name, drm,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 361fea5cb849..baa1a96c038c 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -29,6 +29,7 @@
 #include <linux/rbtree.h>
 #include <linux/types.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 
 struct drm_gpuvm;
@@ -201,6 +202,11 @@ struct drm_gpuvm {
 	 */
 	const char *name;
 
+	/**
+	 * @drm: the &drm_device this VM lives in
+	 */
+	struct drm_device *drm;
+
 	/**
 	 * @mm_start: start of the VA space
 	 */
@@ -241,6 +247,7 @@ struct drm_gpuvm {
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+		    struct drm_device *drm,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
-- 
2.42.0

