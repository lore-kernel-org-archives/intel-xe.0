Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809A4C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3657E10E505;
	Tue, 27 May 2025 16:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Omhc5OXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C61010E537
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362520; x=1779898520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H5NHQsZItfKVSVZTR4CmVTCdNsivRX8ZuUNhR9ueuRk=;
 b=Omhc5OXJabEJI29FhNXQzn6lCpz/rAUte9EsuEM8e66ou3jq7ZTXNPg4
 5W8mYpWznNGBt2IxS97l0WywAD92cpF72qWEM41qMqNtPUD4haiFhwTv6
 +k3V/uGXKJ9y6Vac5Zab30FXGjYNzJYI2PpBbKYtu7McGUsfuAUamJb1Q
 w0zd3j9biWOv4pPsjpz8cRux7pPpff1lCG4DU0iTWWbzAluVNEkFz2FKd
 3jzARes9r9YHsBod61FWk+IrXIf9zy1uk7536ZsUHFV+/Ee9s3TBzo2Ll
 Xxnfc6mJ3cY1OvELL3BZWqn8RDDSeflesp/ocffbnbUmSOSPf0K9AXFjP w==;
X-CSE-ConnectionGUID: rFdCudJETCuLFGb5iIMfKA==
X-CSE-MsgGUID: drvZKK1jQj6ylkqsY1nHng==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49471925"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49471925"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:14:46 -0700
X-CSE-ConnectionGUID: tLyayXmIQE6z2Z852p4HJg==
X-CSE-MsgGUID: ya6WyKp6SYOn2iy3fCPW+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147646205"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 09:14:45 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 17/19] drm/xe/uapi: Add UAPI for querying VMA count and
 memory attributes
Date: Tue, 27 May 2025 22:10:01 +0530
Message-Id: <20250527164003.1068118-18-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  1 +
 drivers/gpu/drm/xe/xe_vm.c     | 87 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |  2 +-
 include/uapi/drm/xe_drm.h      | 82 ++++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b9791c614749..8c965d15c187 100644
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
index 4520e475399e..9611d7ca2bed 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2162,6 +2162,93 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
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
+	int err = 0;
+
+	if (XE_IOCTL_DBG(xe, args->num_vmas < 0))
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
index 340ac34936f4..b1e94b536c80 100644
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
index 03adfdc20dde..6ff9ff0c09dd 100644
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
 #define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
+#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -2066,6 +2069,85 @@ struct drm_xe_madvise {
 
 };
 
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

