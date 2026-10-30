Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5A3606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 22:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i/COAYFa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1158E10E8D4;
	Fri, 30 Oct 2026 22:31:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE7510E8D4
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 22:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793399470; x=1824935470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/t37MG0p/OhMPx0PXjbSnhr+20nr3W6gjgoM8EcTOwo=;
 b=i/COAYFa69E/8J5ajtH6NaZ4yQ66rikem+S+SqT7nTjv1tt+N+lFaxZz
 he1b8FTuQWn/CIAK3RrKw8OfOXpSTlQ/Ak4E/d4Ba8d529aAld3LE/pz4
 Lze2T/hx0N/YDa3RFXz5jr1IsHaJPRLJKK5WmVF0XqVwOcs/jfTMGVWv9
 3hYsvqjMcjPURDqcwqPiFXP4k3NF9JMlckC8j8VqWmhaI91KU18zyWsgG
 LWntdE3xrhLcOmSLhmOFTuxWX9IzT0JetZ5keQl8qTtUG/gNcgnR05zNA
 tmQyS5v8pzsAOWeJYavN8jx5egV8QyqT7pdUZLnKEWhL5/qHkXz5wyeff A==;
X-CSE-ConnectionGUID: lKV1s7c1SX6t02TVsR/8cA==
X-CSE-MsgGUID: 5SpXeHeKR0aIZRGrfbWQ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2049987"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2049987"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:31:05 -0700
X-CSE-ConnectionGUID: NpXx+uZdQ2m5Sywz5oyH7A==
X-CSE-MsgGUID: WR1kRX/tSy2+WrYJ7BBdUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5550437"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:31:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Cc: riana.tauro@intel.com, shekhar.chauhan@intel.com, harish.chegondi@intel.com
Subject: [PATCH v2 2/3] drm/xe/oa: Gate OA buffer mmap faults
Date: Fri, 30 Oct 2026 15:30:59 -0700
Message-ID: <20261030223056.2266638-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030223056.2266638-5-umesh.nerlige.ramappa@intel.com>
References: <20261030223056.2266638-5-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The OA buffer currently uses ttm_bo fault handlers when mapping the
buffer to user space. We have a case where we teardown the OA buffer if
a pci unbind/remove is initiated while the user has mapped the OA
buffer. In such a case, we want to prevent access to the OA buffer.

Add xe_oa_buffer_fault(), a thin wrapper around the existing
xe_bo_cpu_fault() that first checks stream->dead and returns
VM_FAULT_SIGBUS without touching the BO if the stream is no longer
alive. Install it as the vma's vm_ops in xe_oa_mmap() after a
successful drm_gem_mmap_obj(), alongside the existing
ttm_bo_vm_open()/ttm_bo_vm_close()/xe_bo_vm_access() used for a
standard xe BO mapping.

Access the stream object from vma->vm_file->private_data, since
vm_private_data is owned by GEM/TTM for its own open/close refcounting
and must not be repurposed.

xe_bo_cpu_fault() and xe_bo_vm_access() are exposed (no longer
static) so they can be reused here.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 30 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_bo.h       |  4 ++++
 drivers/gpu/drm/xe/xe_oa.c       | 31 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
 4 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a..6b399adcb844 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2233,7 +2233,18 @@ static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_devic
 	return ret;
 }
 
-static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
+/**
+ * xe_bo_cpu_fault() - vm_ops->fault handler for xe GEM object mmaps
+ * @vmf: The vm_fault descriptor
+ *
+ * Shared fault handler for CPU access to xe BOs mapped via
+ * drm_gem_mmap_obj(). Exposed so other mmap paths built on top of a raw
+ * anon_inode fd (e.g. xe_oa) can wrap it with their own liveness checks
+ * while still deferring to the common BO fault handling.
+ *
+ * Return: A vm_fault_t encoding the result of the fault handling.
+ */
+vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
 	struct drm_device *ddev = tbo->base.dev;
@@ -2339,8 +2350,21 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	return ret;
 }
 
-static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
-			   void *buf, int len, int write)
+/**
+ * xe_bo_vm_access() - vm_ops->access handler for xe GEM object mmaps
+ * @vma: The vma accessed
+ * @addr: The virtual address accessed
+ * @buf: The buffer to read from / write to
+ * @len: The number of bytes to transfer
+ * @write: Whether this is a write access
+ *
+ * Shared vm_ops->access handler for xe BOs, exposed for the same reason as
+ * xe_bo_cpu_fault().
+ *
+ * Return: The number of bytes transferred, or a negative error code.
+ */
+int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
+		    void *buf, int len, int write)
 {
 	struct ttm_buffer_object *ttm_bo = vma->vm_private_data;
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 77b3a02e9b8e..ae435495b67b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -423,6 +423,10 @@ int xe_bo_vmap(struct xe_bo *bo);
 void xe_bo_vunmap(struct xe_bo *bo);
 int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size);
 
+vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf);
+int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
+		    void *buf, int len, int write);
+
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_visible_vram(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 50562d53e7b2..e2198fdd2a09 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1722,6 +1722,28 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static vm_fault_t xe_oa_buffer_fault(struct vm_fault *vmf)
+{
+	struct xe_oa_stream *stream = vmf->vma->vm_file->private_data;
+
+	/*
+	 * Once the stream is dead its OA buffer may already be gone (or about
+	 * to be). Refuse to (re-)install a PTE rather than letting the
+	 * generic BO fault handler touch a buffer that's being torn down.
+	 */
+	if (READ_ONCE(stream->dead))
+		return VM_FAULT_SIGBUS;
+
+	return xe_bo_cpu_fault(vmf);
+}
+
+static const struct vm_operations_struct xe_oa_vm_ops = {
+	.fault	= xe_oa_buffer_fault,
+	.open	= ttm_bo_vm_open,
+	.close	= ttm_bo_vm_close,
+	.access	= xe_bo_vm_access,
+};
+
 static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct xe_oa_stream *stream = file->private_data;
@@ -1733,6 +1755,9 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 		return ret;
 	}
 
+	if (stream->dead)
+		return -ENODEV;
+
 	/*
 	 * Userspace always maps the OA buffer at offset 0, the mapping is moved to the OA
 	 * buffer's own range in the drm device's address_space below
@@ -1761,7 +1786,11 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 
 	vma->vm_pgoff = drm_vma_node_start(&bo->ttm.base.vma_node);
 
-	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
+	ret = drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
+	if (!ret)
+		vma->vm_ops = &xe_oa_vm_ops;
+
+	return ret;
 }
 
 static const struct file_operations xe_oa_fops = {
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index e876e9be92ba..e60a90bae1c6 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -214,6 +214,9 @@ struct xe_oa_stream {
 	/** @enabled: Whether the stream is currently enabled */
 	bool enabled;
 
+	/** @dead: Gate HW access when device is wedged or going away */
+	bool dead;
+
 	/** @oa_config: OA configuration used by the stream */
 	struct xe_oa_config *oa_config;
 
-- 
2.55.0

