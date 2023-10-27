Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F5AC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E4A10E953;
	Fri, 27 Oct 2023 08:16:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C365710E953
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 08:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698394569; x=1729930569;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fCorWNgjoyNMBoi/uSBAlqfnlZn86bP9Vf3+qo6zmx0=;
 b=cvmb2Y22iSOPgmqaAvaT5MDJpVbsyJPd9HHTiSPt8h5N6trCt5nx3N2x
 jpExJEJLC2CRBl6ZgqptdrrxmiuoIA+VkHYrtv3w08+7wzRey7AAu0kvl
 Q1Sr3OI3r9khInyHcX/lzUedLVC+tGDuBZAGR9vvHqBgJsU8EsQy8qbFM
 OfjfmO52qao9+KxFp+mgbjVyVzPqwBb1cJgsBoUJaV17+XMtXZAdsv46n
 9VtUYYh7DOyP3+h7N0XG3hOU95IK1SBOS5t/ftJYBwcG/cZr0qIYpCCuL
 TJZOg2Pw7SnrzWOHJdo1Sb3NbdvNJ3vCzPiVbwJzAVQXBWNmddY0e8ix6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9270235"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="9270235"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="763129085"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="763129085"
Received: from krchrist-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.140])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:16:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:15:43 +0200
Message-ID: <20231027081552.5321-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 01/10] drm/gpuvm: convert WARN() to drm_WARN()
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

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
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
2.41.0

