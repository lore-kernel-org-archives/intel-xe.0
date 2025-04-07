Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB284C36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DDD10E406;
	Mon,  7 Apr 2025 09:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Or0xyom6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B9710E406
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019617; x=1775555617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sf0yc/JfQmvcXMA0FWnC5k11BfxVVKd2ZcBtBuin+Pw=;
 b=Or0xyom6pvGwOA6canRykG1s1w2fb3sDQs1cQMe3AocmLwBkGIvpYPb6
 pnxeOt350bLWOGXQk3IQLB03Y4fMMWZgw7t/YGpbG0ZN8SDsQPoUTN6jS
 FxWTs+EM2JuUix5ofz3qo0ivoyQgYOVeO5M5YRgosQYg3VtS7JlUXH5BP
 dwrkawdHSYmO2Q0W1UPq91aLDsJMLrydnMCd63B9s3NxKqh/rOEajMlef
 cqOrnNpkGhJNBRBJuJ/3BTx5xBrSe41RLMdTNPEmECl5HIZP5511cRaIp
 zm0bOTFg7yZKWMf1/uX93P8FrmpJWQ6ZP9x+tUt8I16jX33bDgOqd4UjY Q==;
X-CSE-ConnectionGUID: q8DRi7xpQ0KvixwyNcjUZA==
X-CSE-MsgGUID: DX3daYhVQ1yARXuasg4Wbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029471"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029471"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:37 -0700
X-CSE-ConnectionGUID: 6saHCUCDQhWIu7Rjjob8sg==
X-CSE-MsgGUID: WccKoleNSXKapECbpY9SNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778951"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:35 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 30/32] drm/xe/uapi: Add uapi for vma count and mem
 attributes
Date: Mon,  7 Apr 2025 15:47:17 +0530
Message-Id: <20250407101719.3350996-31-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
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

-DRM_IOCTL_XE_VM_QUERY_VMAS: Return number of VMAs in user-specified range.
-DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS: Fill VMA attributes in user-provided
 buffer.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   2 +
 drivers/gpu/drm/xe/xe_vm.c     |  94 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |   3 +-
 include/uapi/drm/xe_drm.h      | 115 +++++++++++++++++++++++++++++++++
 4 files changed, 213 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3e57300014bf..968c24c77241 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -198,6 +198,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS, xe_vm_query_vmas_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e5246c633e62..f1d4daf90efe 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2165,6 +2165,100 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
+int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vm_query_num_vmas *args = data;
+	struct drm_gpuva *gpuva;
+	struct xe_vm *vm;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	args->num_vmas = 0;
+	down_write(&vm->lock);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, args->start, args->start + args->range)
+		args->num_vmas++;
+
+	up_write(&vm->lock);
+	return 0;
+}
+
+static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
+			 u64 end, struct drm_xe_vma_mem_attr *mem_attrs)
+{
+	struct drm_gpuva *gpuva;
+	int i = 0;
+
+	lockdep_assert_held(&vm->lock);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (i == *num_vmas)
+			return -EINVAL;
+
+		mem_attrs[i].start = xe_vma_start(vma);
+		mem_attrs[i].end = xe_vma_end(vma);
+		mem_attrs[i].atomic.val = vma->attr.atomic_access;
+		mem_attrs[i].pat_index.val = vma->attr.pat_index;
+		mem_attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
+		mem_attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;
+
+		i++;
+	}
+
+	if (i <  (*num_vmas - 1))
+		*num_vmas = i;
+	return 0;
+}
+
+int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vma_mem_attr *mem_attrs;
+	struct drm_xe_vm_query_vmas_attr *args = data;
+	u64 __user *attrs_user = NULL;
+	struct xe_vm *vm;
+	int err;
+
+	if (XE_IOCTL_DBG(xe, args->num_vmas < 1))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	down_write(&vm->lock);
+
+	attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
+	mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
+				   GFP_KERNEL | __GFP_ACCOUNT |
+				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	if (!mem_attrs)
+		return args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
+
+	err = get_mem_attrs(vm, &args->num_vmas, args->start,
+			    args->start + args->range, mem_attrs);
+	if (err)
+		goto free_mem_attrs;
+
+	err = __copy_to_user(attrs_user, mem_attrs,
+			     sizeof(struct drm_xe_vma_mem_attr) * args->num_vmas);
+
+free_mem_attrs:
+	kvfree(mem_attrs);
+
+	up_write(&vm->lock);
+
+	return err;
+}
+
 static bool vma_matches(struct xe_vma *vma, u64 page_addr)
 {
 	if (page_addr > xe_vma_end(vma) - 1 ||
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 377f62f859b7..0b2d6e9f77ef 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -193,7 +193,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
-
+int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 void xe_vm_close_and_put(struct xe_vm *vm);
 
 static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ab96dee25f6c..177ee3a1c20d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -82,6 +82,8 @@ extern "C" {
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
+ *  - &DRM_IOCTL_XE_VM_QUERY_VMAS
+ *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
  */
 
 /*
@@ -104,6 +106,8 @@ extern "C" {
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
 #define DRM_XE_MADVISE			0x0c
+#define DRM_XE_VM_QUERY_VMAS		0x0d
+#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0e
 
 /* Must be kept compact -- no holes */
 
@@ -120,6 +124,8 @@ extern "C" {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
 #define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
+#define DRM_IOCTL_XE_VM_QUERY_VMAS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS, struct drm_xe_vm_query_num_vmas)
+#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -2063,6 +2069,115 @@ struct drm_xe_madvise {
 
 };
 
+/**
+ * struct drm_xe_vm_query_num_vmas - Input of &DRM_IOCTL_XE_VM_QUERY_VMAS
+ *
+ * Get number of vmas in virtual range of vm_id
+ */
+struct drm_xe_vm_query_num_vmas {
+	 /** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+	/** @num_vmas: number of vmas in range returned in @num_vmas */
+	__u32 num_vmas;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @size: size of the virtual address range */
+	__u64 range;
+
+	 /** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_vma_mem_attr {
+	 /** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @start: start of the vma */
+	__u64 start;
+
+	/** @size: end of the vma */
+	__u64 end;
+
+	struct {
+		struct {
+		/** @val: value of atomic operation*/
+			__u32 val;
+
+		/** @reserved: Reserved */
+			__u32 reserved;
+		} atomic;
+
+		struct {
+		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
+			__u32 val;
+
+		/** @reserved: Reserved */
+			__u32 reserved;
+		} purge_state_val;
+
+		struct {
+			/** @pat_index */
+			__u32 val;
+
+			/** @reserved: Reserved */
+			__u32 reserved;
+		} pat_index;
+
+		/** @preferred_mem_loc: preferred memory location */
+		struct {
+			__u32 devmem_fd;
+
+			__u32 migration_policy;
+		} preferred_mem_loc;
+	};
+
+	 /** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_vm_query_vmas_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
+ *
+ * Get memory attributes to a virtual address range
+ */
+struct drm_xe_vm_query_vmas_attr {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+	/** @num_vmas: number of vmas in range returned in @num_vmas */
+	__u32 num_vmas;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @size: size of the virtual address range */
+	__u64 range;
+
+	union {
+		/** @num_vmas: used if num_vmas == 1 */
+		struct drm_xe_vma_mem_attr attr;
+
+		/**
+		 * @vector_of_ops: userptr to array of struct
+		 * drm_xe_vma_mem_attr if num_vmas > 1
+		 */
+		__u64 vector_of_vma_mem_attr;
+	};
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

