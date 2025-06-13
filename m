Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FCFC61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8B810E99D;
	Fri, 13 Jun 2025 12:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbZx443K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBCC10E99E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817832; x=1781353832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1QQc3lbGzCDNsqyyJCqmhN204tjRsqJqZZmCFBZ80VE=;
 b=gbZx443KQ6L1qHXNEq507TTKb1pSmPVsW9wrGreOjJ33cCLv9U+2/v/F
 s/WqJbHeyER3u5bdkTZoDr04ljYCO28xOz9crcbdVXBeRCN0neMT8S3+T
 f/Mfv2m31S6P4du5LZCw1WT+lN2NQ7mY/U7plvGmuSu28vInK7GXjUQuh
 w2Xrgs4kHVYaCBxPY1tUsf53UVBfinlWSup8ZSkTrzyyKlG+L1M89xv94
 P673MNcrkkBRHS+MxYqBywqKqBrfOWz9qhk2rEXCW2QbqAazQOn8CLVNQ
 a6xvoU6OkHr5rEN8KTQKlHIMP4fwhSGUGylntGhyNgd/8sW/+9NpQ85vA g==;
X-CSE-ConnectionGUID: NQkgaJ6qTfOiW7ttxgmy6g==
X-CSE-MsgGUID: nsQYz/9ATZSm2N+2TFOaEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610193"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610193"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:32 -0700
X-CSE-ConnectionGUID: 4yvVvWzGRwS3PzFxLj5ziA==
X-CSE-MsgGUID: iVGyU5L3RoGUOEXS2rRQ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290377"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:30 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 19/20] drm/xe/uapi: Add UAPI for querying VMA count and
 memory attributes
Date: Fri, 13 Jun 2025 18:25:57 +0530
Message-Id: <20250613125558.2607665-20-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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

Introduce the DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS ioctl to allow userspace
to query memory attributes of VMAs within a specified virtual address
range.
If num_vmas == 0 and vector_of_vma_mem_attr == NULL, the ioctl returns
the number of VMAs in the specified range.
If num_vmas > 0 and a valid user pointer is provided in
vector_of_vma_mem_attr, the ioctl fills the buffer with memory
attributes for each VMA.
This two-step interface allows userspace to first query the required
buffer size, then retrieve detailed attributes efficiently.

v2 (Matthew Brost)
- Use same ioctl to overload functionality

v3
- Add kernel-doc

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   1 +
 drivers/gpu/drm/xe/xe_vm.c     |  89 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |   2 +-
 include/uapi/drm/xe_drm.h      | 130 +++++++++++++++++++++++++++++++++
 4 files changed, 221 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 632d3ab12392..1f9969acbcd9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -199,6 +199,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 14e554f3f4d5..d9ce25f3abf4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2171,6 +2171,95 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
+static void xe_vm_query_vmas(struct xe_vm *vm, u32 *num_vmas, u64 start, u64 end)
+{
+	struct drm_gpuva *gpuva;
+
+	lockdep_assert_held(&vm->lock);
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end)
+		(*num_vmas)++;
+}
+
+static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
+			 u64 end, struct drm_xe_vma_mem_attr *attrs)
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
+		attrs[i].start = xe_vma_start(vma);
+		attrs[i].end = xe_vma_end(vma);
+		attrs[i].atomic.val = vma->attr.atomic_access;
+		attrs[i].pat_index.val = vma->attr.pat_index;
+		attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
+		attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;
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
+	u64 __user *attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
+	struct xe_vm *vm;
+	int err = 0;
+
+	if (XE_IOCTL_DBG(xe,
+			 (args->num_vmas == 0 && attrs_user) ||
+			(args->num_vmas > 0 && !attrs_user)))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	down_read(&vm->lock);
+
+	attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
+
+	if (args->num_vmas == 0 && !attrs_user) {
+		xe_vm_query_vmas(vm, &args->num_vmas, args->start, args->start + args->range);
+		goto unlock_vm;
+	}
+
+	mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
+				   GFP_KERNEL | __GFP_ACCOUNT |
+				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	if (!mem_attrs) {
+		err = args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
+		goto unlock_vm;
+	}
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
+unlock_vm:
+	up_read(&vm->lock);
+	return err;
+}
+
 static bool vma_matches(struct xe_vma *vma, u64 page_addr)
 {
 	if (page_addr > xe_vma_end(vma) - 1 ||
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 1fb639a33ffb..e4a601a3583f 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -195,7 +195,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
-
+int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 void xe_vm_close_and_put(struct xe_vm *vm);
 
 static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 81e90270313d..c0aa7c19870e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -82,6 +82,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
+ *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
  */
 
 /*
@@ -104,6 +105,7 @@ extern "C" {
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
 #define DRM_XE_MADVISE			0x0c
+#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0d
 
 /* Must be kept compact -- no holes */
 
@@ -120,6 +122,7 @@ extern "C" {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
 #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
+#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -2093,6 +2096,133 @@ struct drm_xe_madvise {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vma_mem_attr - Output of &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
+ *
+ * This structure is provided by userspace and filled by KMD in response to the
+ * DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS ioctl. It describes memory attributes of
+ * a VMA within a specified address range in a VM.
+ *
+ * The structure includes information such as atomic access policy, purgeable
+ * state, page attribute table (PAT) index, and preferred memory location.
+ * Userspace allocates an array of these structures and passes a pointer to the
+ * ioctl to retrieve attributes for each VMA
+ *
+ * @extensions: Pointer to the first extension struct, if any
+ * @start: Start address of the virtual memory area
+ * @end: End address of the virtual memory area
+ *
+ * @atomic.val: Value of atomic operation policy
+ * @atomic.reserved: Reserved, must be zero
+ *
+ * @purge_state_val.val: Value for DRM_XE_VMA_ATTR_PURGEABLE_STATE
+ * @purge_state_val.reserved: Reserved, must be zero
+ *
+ * @pat_index.val: Page Attribute Table (PAT) index
+ * @pat_index.reserved: Reserved, must be zero
+ *
+ * @preferred_mem_loc.devmem_fd: File descriptor for preferred device memory
+ * @preferred_mem_loc.migration_policy: Migration policy for memory placement
+ *
+ */
+struct drm_xe_vma_mem_attr {
+	 /** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @start: start of the vma */
+	__u64 start;
+
+	/** @end: end of the vma */
+	__u64 end;
+
+	struct {
+		struct {
+		/** @atomic.val: atomic attribute for vma*/
+			__u32 val;
+
+		/** @atomic.reserved: Reserved */
+			__u32 reserved;
+		} atomic;
+
+		struct {
+			/** @pat_index.val: PAT index of vma */
+			__u32 val;
+
+			/** @pat_index.reserved: Reserved */
+			__u32 reserved;
+		} pat_index;
+
+		/** @preferred_mem_loc: preferred memory location */
+		struct {
+			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
+			__u32 devmem_fd;
+
+			/** @preferred_mem_loc.migration_policy: Page migration policy */
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
+ * This structure is used to query memory attributes of virtual memory areas
+ * (VMAs) within a specified address range in a VM. It provides detailed
+ * information about each VMA, including atomic access policy, purgeable state,
+ * page attribute table (PAT) index, and preferred memory location.
+ *
+ * Userspace first calls the ioctl with @num_vmas = 0 and
+ * @vector_of_vma_mem_attr = NULL to retrieve the number of VMAs in the range.
+ * Then, it allocates a buffer of that size and calls the ioctl again to fill
+ * the buffer with VMA attributes.
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *
+ *     struct drm_xe_vma_mem_attr *attrs;
+ *     __u32 num_vmas;
+ *
+ *     // First call to get number of VMAs
+ *     ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS, &query);
+ *     num_vmas = query.num_vmas;
+ *
+ *     // Allocate and query attributes
+ *     attrs = malloc(num_vmas, sizeof(*attrs));
+ *     query.vector_of_vma_mem_attr = (__u64)(uintptr_t)attrs;
+ *     query.num_vmas = num_vmas;
+ *     ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS, &query);
+ */
+struct drm_xe_vm_query_vmas_attr {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+	/** @num_vmas: number of vmas in range */
+	__u32 num_vmas;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @size: size of the virtual address range */
+	__u64 range;
+
+	/**
+	 * @vector_of_ops: userptr to array of struct
+	 * drm_xe_vma_mem_attr
+	 */
+	__u64 vector_of_vma_mem_attr;
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

