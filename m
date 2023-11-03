Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCEBC001B2
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04E410E179;
	Fri,  3 Nov 2023 15:33:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C3D10E172
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699025578; x=1730561578;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8cGFgqy6uxvtC0eHv05iX2w6UxWFFZCv9/rpQqwiXzE=;
 b=iIr/9WIQMMDC49kQPzGtN3x4VrOWbNaaZO2OWTpgrqR5CmP51AWy/Vpo
 7zsnP18BCAEPLl/0tBpDlnF568Qec7hy3UjxRztTJWa7mot2wwYXqq5Hv
 0Rk3RPWSwsKgLY377FtQ/WAZjWmmSz157h3qHzecgokKTcREbhY7L489Z
 Q7ki1+47r2HoFRGpF/yQtSzbow6XJ8yV9gkkqGNGW9o7bnNqzFRRa3WnV
 HHoYvRH7Z1AGb74FF8nwfe7M7+0cvu4FZr99Udu2egyQtNATbto7/dkUf
 TzqEiQa9LOtAIW31ypPLWVaN0rik9cr1LcxVOLax8hi/jX2ML2e0VyNx8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387853749"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387853749"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:32:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765272651"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="765272651"
Received: from shouweis-mobl1.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.68])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:32:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 16:32:27 +0100
Message-ID: <20231103153234.30407-11-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
References: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI v8 11/18] drm/gpuvm: reference count drm_gpuvm
 structures
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

Implement reference counting for struct drm_gpuvm.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 44 +++++++++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
 include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
 3 files changed, 78 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0a010b52e33d..6e3199f4a1e0 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
+	kref_init(&gpuvm->kref);
+
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->flags = flags;
 	gpuvm->ops = ops;
@@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_init);
 
-/**
- * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
- * @gpuvm: pointer to the &drm_gpuvm to clean up
- *
- * Note that it is a bug to call this function on a manager that still
- * holds GPU VA mappings.
- */
-void
-drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
+static void
+drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
 {
 	gpuvm->name = NULL;
 
@@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 
 	drm_gem_object_put(gpuvm->r_obj);
 }
-EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
+
+static void
+drm_gpuvm_free(struct kref *kref)
+{
+	struct drm_gpuvm *gpuvm = container_of(kref, struct drm_gpuvm, kref);
+
+	if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
+		return;
+
+	drm_gpuvm_fini(gpuvm);
+
+	gpuvm->ops->vm_free(gpuvm);
+}
+
+/**
+ * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
+ * @gpuvm: the &drm_gpuvm to release the reference of
+ *
+ * This releases a reference to @gpuvm.
+ */
+void
+drm_gpuvm_put(struct drm_gpuvm *gpuvm)
+{
+	if (gpuvm)
+		kref_put(&gpuvm->kref, drm_gpuvm_free);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_put);
 
 static int
 __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
@@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 	if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
 		return -EINVAL;
 
-	return __drm_gpuva_insert(gpuvm, va);
+	return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_insert);
 
@@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
 	}
 
 	__drm_gpuva_remove(va);
+	drm_gpuvm_put(va->vm);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_remove);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 54be12c1272f..cb2f06565c46 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 	}
 }
 
+static void
+nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
+{
+	struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
+
+	kfree(uvmm);
+}
+
+static const struct drm_gpuvm_ops gpuvm_ops = {
+	.vm_free = nouveau_uvmm_free,
+};
+
 int
 nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 			   void *data,
@@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 		       NOUVEAU_VA_SPACE_END,
 		       init->kernel_managed_addr,
 		       init->kernel_managed_size,
-		       NULL);
+		       &gpuvm_ops);
 	/* GPUVM takes care from here on. */
 	drm_gem_object_put(r_obj);
 
@@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 	return 0;
 
 out_gpuvm_fini:
-	drm_gpuvm_destroy(&uvmm->base);
-	kfree(uvmm);
+	drm_gpuvm_put(&uvmm->base);
 out_unlock:
 	mutex_unlock(&cli->mutex);
 	return ret;
@@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 
 	mutex_lock(&cli->mutex);
 	nouveau_vmm_fini(&uvmm->vmm);
-	drm_gpuvm_destroy(&uvmm->base);
-	kfree(uvmm);
+	drm_gpuvm_put(&uvmm->base);
 	mutex_unlock(&cli->mutex);
 }
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 239680b83079..4dc83a27506a 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -247,6 +247,11 @@ struct drm_gpuvm {
 		struct list_head list;
 	} rb;
 
+	/**
+	 * @kref: reference count of this object
+	 */
+	struct kref kref;
+
 	/**
 	 * @kernel_alloc_node:
 	 *
@@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
-void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
+
+/**
+ * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
+ * @gpuvm: the &drm_gpuvm to acquire the reference of
+ *
+ * This function acquires an additional reference to @gpuvm. It is illegal to
+ * call this without already holding a reference. No locks required.
+ */
+static inline struct drm_gpuvm *
+drm_gpuvm_get(struct drm_gpuvm *gpuvm)
+{
+	kref_get(&gpuvm->kref);
+
+	return gpuvm;
+}
+
+void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
 
 bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
@@ -683,6 +704,14 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
  * operations to drivers.
  */
 struct drm_gpuvm_ops {
+	/**
+	 * @vm_free: called when the last reference of a struct drm_gpuvm is
+	 * dropped
+	 *
+	 * This callback is mandatory.
+	 */
+	void (*vm_free)(struct drm_gpuvm *gpuvm);
+
 	/**
 	 * @op_alloc: called when the &drm_gpuvm allocates
 	 * a struct drm_gpuva_op
-- 
2.41.0

