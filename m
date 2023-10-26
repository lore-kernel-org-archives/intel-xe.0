Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9494AC25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 13:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3923E10E136;
	Thu, 26 Oct 2023 13:16:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F8F10E136
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 13:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698326197; x=1729862197;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=svPi0Jjf/qxZ1daN+g3aekJ5jB6SKVNElIg55czODi8=;
 b=bpGZQwG+LcgdEjkycktLef3U/CAyQU3KfP2cm16Tt9AD1LU/ssXgoYfO
 e7KMA6TsCZAJa6gHYhGLlYokOS/E+Y6NsLIfDL2hpF8bh1Gyl78jszQ7J
 cysAjg5vYeCDHIL4UM7bJdONCfdnhBTrfeXV15ak4rx6VKIDwSw9rw1DN
 mxujTHeYX58dQ5gMlbK3MZf/PTbpIG5LaiB6bkooDSvB9khc/c5wl7cyG
 DozuCZLusfSZobXh04t+iJKPrq4stSYY3IJtb2gsuDi5f5wRuednUJm6c
 9r0prTk9fD7uC3/76NHvJl8t7y5urzVRMhNzrSR6i2TH44ogygVJjymH8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9095437"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="9095437"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 06:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="849917925"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="849917925"
Received: from asparren-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.242])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 06:12:15 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 15:11:54 +0200
Message-ID: <20231026131157.20011-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026131157.20011-1-thomas.hellstrom@linux.intel.com>
References: <20231026131157.20011-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 2/5] drm/gpuvm: add common dma-resv per struct
 drm_gpuvm
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

Provide a common dma-resv for GEM objects not being used outside of this
GPU-VM. This is used in a subsequent patch to generalize dma-resv,
external and evicted object handling and GEM validation.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 53 ++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 13 ++++++-
 include/drm/drm_gpuvm.h                | 33 ++++++++++++++++
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index b378554b81ac..d4907aace831 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -61,6 +61,15 @@
  * contained within struct drm_gpuva already. Hence, for inserting &drm_gpuva
  * entries from within dma-fence signalling critical sections it is enough to
  * pre-allocate the &drm_gpuva structures.
+ *
+ * &drm_gem_objects which are private to a single VM can share a common
+ * &dma_resv in order to improve locking efficiency (e.g. with &drm_exec).
+ * For this purpose drivers must pass a &drm_gem_object to drm_gpuvm_init(), in
+ * the following called 'resv object', which serves as the container of the
+ * GPUVM's shared &dma_resv. This resv object can be a driver specific
+ * &drm_gem_object, such as the &drm_gem_object containing the root page table,
+ * but it can also be a 'dummy' object, which can be allocated with
+ * drm_gpuvm_resv_object_alloc().
  */
 
 /**
@@ -652,11 +661,49 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
 
+static void
+drm_gpuvm_gem_object_free(struct drm_gem_object *obj)
+{
+	drm_gem_object_release(obj);
+	kfree(obj);
+}
+
+static const struct drm_gem_object_funcs drm_gpuvm_object_funcs = {
+	.free = drm_gpuvm_gem_object_free,
+};
+
+/**
+ * drm_gpuvm_resv_object_alloc() - allocate a dummy &drm_gem_object
+ * @drm: the drivers &drm_device
+ *
+ * Allocates a dummy &drm_gem_object which can be passed to drm_gpuvm_init() in
+ * order to serve as root GEM object providing the &drm_resv shared across
+ * &drm_gem_objects local to a single GPUVM.
+ *
+ * Returns: the &drm_gem_object on success, NULL on failure
+ */
+struct drm_gem_object *
+drm_gpuvm_resv_object_alloc(struct drm_device *drm)
+{
+	struct drm_gem_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return NULL;
+
+	obj->funcs = &drm_gpuvm_object_funcs;
+	drm_gem_private_object_init(drm, obj, 0);
+
+	return obj;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
+
 /**
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
  * @drm: the &drm_device this VM resides in
+ * @r_obj: the resv &drm_gem_object providing the GPUVM's common &dma_resv
  * @start_offset: the start offset of the GPU VA space
  * @range: the size of the GPU VA space
  * @reserve_offset: the start of the kernel reserved GPU VA area
@@ -671,6 +718,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 void
 drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	       struct drm_device *drm,
+	       struct drm_gem_object *r_obj,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
 	       const struct drm_gpuvm_ops *ops)
@@ -681,6 +729,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
+	gpuvm->r_obj = r_obj;
+
+	drm_gem_object_get(r_obj);
 
 	drm_gpuvm_check_overflow(gpuvm, start_offset, range);
 	gpuvm->mm_start = start_offset;
@@ -715,6 +766,8 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 
 	drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
 		 "GPUVA tree is not empty, potentially leaking memory.\n");
+
+	drm_gem_object_put(gpuvm->r_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index aaf5d28bd587..b4e7d662961a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1809,8 +1809,9 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		  u64 kernel_managed_addr, u64 kernel_managed_size)
 {
 	struct drm_device *drm = cli->drm->dev;
-	int ret;
+	struct drm_gem_object *r_obj;
 	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
+	int ret;
 
 	mutex_init(&uvmm->mutex);
 	dma_resv_init(&uvmm->resv);
@@ -1834,14 +1835,22 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
+	r_obj = drm_gpuvm_resv_object_alloc(drm);
+	if (!r_obj) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->base, cli->name, drm,
+	drm_gpuvm_init(&uvmm->base, cli->name, drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
 		       NULL);
+	/* GPUVM takes care from here on. */
+	drm_gem_object_put(r_obj);
 
 	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
 			    cli->vmm.vmm.object.oclass, RAW,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index baa1a96c038c..54dc195a68ea 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -244,10 +244,16 @@ struct drm_gpuvm {
 	 * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
 	 */
 	const struct drm_gpuvm_ops *ops;
+
+	/**
+	 * @r_obj: Resv GEM object; representing the GPUVM's common &dma_resv.
+	 */
+	struct drm_gem_object *r_obj;
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    struct drm_device *drm,
+		    struct drm_gem_object *r_obj,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
@@ -255,6 +261,33 @@ void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 
+struct drm_gem_object *
+drm_gpuvm_resv_object_alloc(struct drm_device *drm);
+
+/**
+ * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
+ * @gpuvm__: the &drm_gpuvm
+ *
+ * Returns: a pointer to the &drm_gpuvm's shared &dma_resv
+ */
+#define drm_gpuvm_resv(gpuvm__) ((gpuvm__)->r_obj->resv)
+
+/**
+ * drm_gpuvm_resv_obj() - returns the &drm_gem_object holding the &drm_gpuvm's
+ * &dma_resv
+ * @gpuvm__: the &drm_gpuvm
+ *
+ * Returns: a pointer to the &drm_gem_object holding the &drm_gpuvm's shared
+ * &dma_resv
+ */
+#define drm_gpuvm_resv_obj(gpuvm__) ((gpuvm__)->r_obj)
+
+#define drm_gpuvm_resv_held(gpuvm__) \
+	dma_resv_held(drm_gpuvm_resv(gpuvm__))
+
+#define drm_gpuvm_resv_assert_held(gpuvm__) \
+	dma_resv_assert_held(drm_gpuvm_resv(gpuvm__))
+
 static inline struct drm_gpuva *
 __drm_gpuva_next(struct drm_gpuva *va)
 {
-- 
2.41.0

