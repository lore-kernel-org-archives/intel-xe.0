Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AE1C76196
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 10:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A33910E4E5;
	Tue, 28 Mar 2023 10:48:49 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38DD10E83F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 10:48:47 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Mar 2023 12:48:36 +0200
Message-Id: <20230328104836.251873-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Reshuffle and validate all of the UAPI
 structs
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
Cc: Ryan Houdek <sonicadvance1@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Verified through pahole:
I've created a hdrtest.c with these contents:

struct xe_user_extension               __PASTE(dummy, __LINE__);
struct drm_xe_engine_class_instance    __PASTE(dummy, __LINE__);
struct drm_xe_query_mem_usage          __PASTE(dummy, __LINE__);
struct drm_xe_query_config             __PASTE(dummy, __LINE__);
struct drm_xe_query_gts                __PASTE(dummy, __LINE__);
struct drm_xe_query_topology_mask      __PASTE(dummy, __LINE__);
struct drm_xe_device_query             __PASTE(dummy, __LINE__);
struct drm_xe_gem_create               __PASTE(dummy, __LINE__);
struct drm_xe_gem_mmap_offset          __PASTE(dummy, __LINE__);
struct drm_xe_vm_bind_op_error_capture __PASTE(dummy, __LINE__);
struct drm_xe_ext_vm_set_property      __PASTE(dummy, __LINE__);
struct drm_xe_vm_create                __PASTE(dummy, __LINE__);
struct drm_xe_vm_destroy               __PASTE(dummy, __LINE__);
struct drm_xe_vm_bind_op               __PASTE(dummy, __LINE__);
struct drm_xe_vm_bind                  __PASTE(dummy, __LINE__);
struct drm_xe_ext_engine_set_property  __PASTE(dummy, __LINE__);
struct drm_xe_engine_set_property      __PASTE(dummy, __LINE__);
struct drm_xe_engine_create            __PASTE(dummy, __LINE__);
struct drm_xe_engine_get_property      __PASTE(dummy, __LINE__);
struct drm_xe_engine_destroy           __PASTE(dummy, __LINE__);
struct drm_xe_sync                     __PASTE(dummy, __LINE__);
struct drm_xe_exec                     __PASTE(dummy, __LINE__);
struct drm_xe_mmio                     __PASTE(dummy, __LINE__);
struct drm_xe_wait_user_fence          __PASTE(dummy, __LINE__);
struct drm_xe_vm_madvise               __PASTE(dummy, __LINE__);

and then ran the resulting .o file through pahole.

All padding holes are gone on 64-bits, some through extending the width
of some members, others by reorganizing, and even more by explicitly
adding padding.

I'm also ensuring xe verifies that all pad and reserved members are
zero in each ioctl implementation.

Suggested-by: Ryan Houdek <sonicadvance1@gmail.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c              |  6 ++-
 drivers/gpu/drm/xe/xe_engine.c          | 19 +++++--
 drivers/gpu/drm/xe/xe_exec.c            |  4 +-
 drivers/gpu/drm/xe/xe_mmio.c            |  3 +-
 drivers/gpu/drm/xe/xe_query.c           |  3 +-
 drivers/gpu/drm/xe/xe_sync.c            |  4 +-
 drivers/gpu/drm/xe/xe_vm.c              | 21 ++++++--
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  3 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 +-
 include/uapi/drm/xe_drm.h               | 68 +++++++++++++++++--------
 10 files changed, 98 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e4d079b61d52..b78f9d11d895 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1505,7 +1505,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	u32 handle;
 	int err;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->flags &
@@ -1575,7 +1576,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_gem_mmap_offset *args = data;
 	struct drm_gem_object *gem_obj;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->flags))
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 37209b13bcd6..d576f3c9d843 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -348,7 +348,8 @@ static int engine_user_ext_set_property(struct xe_device *xe,
 		return -EFAULT;
 
 	if (XE_IOCTL_ERR(xe, ext.property >=
-			 ARRAY_SIZE(engine_set_property_funcs)))
+			 ARRAY_SIZE(engine_set_property_funcs)) ||
+	    XE_IOCTL_ERR(xe, ext.pad))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(engine_set_property_funcs));
@@ -380,7 +381,8 @@ static int engine_user_extensions(struct xe_device *xe, struct xe_engine *e,
 	if (XE_IOCTL_ERR(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, ext.name >=
+	if (XE_IOCTL_ERR(xe, ext.pad) ||
+	    XE_IOCTL_ERR(xe, ext.name >=
 			 ARRAY_SIZE(engine_user_extension_funcs)))
 		return -EINVAL;
 
@@ -523,7 +525,8 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 	int len;
 	int err;
 
-	if (XE_IOCTL_ERR(xe, args->flags))
+	if (XE_IOCTL_ERR(xe, args->flags) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	len = args->width * args->num_placements;
@@ -655,6 +658,10 @@ int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_get_property *args = data;
 	struct xe_engine *e;
 
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	mutex_lock(&xef->engine.lock);
 	e = xa_load(&xef->engine.xa, args->engine_id);
 	mutex_unlock(&xef->engine.lock);
@@ -734,7 +741,8 @@ int xe_engine_destroy_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_destroy *args = data;
 	struct xe_engine *e;
 
-	if (XE_IOCTL_ERR(xe, args->pad))
+	if (XE_IOCTL_ERR(xe, args->pad) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	mutex_lock(&xef->engine.lock);
@@ -765,6 +773,9 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
 	int ret;
 	u32 idx;
 
+	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	e = xe_engine_lookup(xef, args->engine_id);
 	if (XE_IOCTL_ERR(xe, !e))
 		return -ENOENT;
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index ea869f2452ef..0ffbb8f8f4df 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -160,7 +160,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	bool write_locked;
 	int err = 0;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->pad) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	engine = xe_engine_lookup(xef, args->engine_id);
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5cacaa05759a..dc8da9c1a040 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -409,7 +409,8 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	bool allowed;
 	int ret = 0;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_MMIO_FLAGS))
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dd64ff0d2a57..97742d003c8a 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -374,7 +374,8 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_xe_device_query *query = data;
 	u32 idx;
 
-	if (XE_IOCTL_ERR(xe, query->extensions != 0))
+	if (XE_IOCTL_ERR(xe, query->extensions ||
+	    XE_IOCTL_ERR(xe, query->reserved[0] || query->reserved[1])))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 99f1ed87196d..3c9ac74970c5 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -110,7 +110,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		return -EFAULT;
 
 	if (XE_IOCTL_ERR(xe, sync_in.flags &
-			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)))
+			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)) ||
+	    XE_IOCTL_ERR(xe, sync_in.pad) ||
+	    XE_IOCTL_ERR(xe, sync_in.reserved[0] || sync_in.reserved[1]))
 		return -EINVAL;
 
 	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bdf82d34eb66..3d70ca235ba3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1774,7 +1774,9 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
 		return -EFAULT;
 
 	if (XE_IOCTL_ERR(xe, ext.property >=
-			 ARRAY_SIZE(vm_set_property_funcs)))
+			 ARRAY_SIZE(vm_set_property_funcs)) ||
+	    XE_IOCTL_ERR(xe, ext.pad) ||
+	    XE_IOCTL_ERR(xe, ext.reserved[0] || ext.reserved[1]))
 		return -EINVAL;
 
 	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
@@ -1802,7 +1804,8 @@ static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
 	if (XE_IOCTL_ERR(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, ext.name >=
+	if (XE_IOCTL_ERR(xe, ext.pad) ||
+	    XE_IOCTL_ERR(xe, ext.name >=
 			 ARRAY_SIZE(vm_user_extension_funcs)))
 		return -EINVAL;
 
@@ -1833,6 +1836,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	int err;
 	u32 flags = 0;
 
+	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	if (XE_IOCTL_ERR(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
 		return -EINVAL;
 
@@ -1916,7 +1922,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_vm_destroy *args = data;
 	struct xe_vm *vm;
 
-	if (XE_IOCTL_ERR(xe, args->pad))
+	if (XE_IOCTL_ERR(xe, args->pad) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
@@ -2866,6 +2873,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int i;
 
 	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]) ||
 	    XE_IOCTL_ERR(xe, !args->num_binds) ||
 	    XE_IOCTL_ERR(xe, args->num_binds > MAX_BINDS))
 		return -EINVAL;
@@ -2898,6 +2906,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 region = (*bind_ops)[i].region;
 
+		if (XE_IOCTL_ERR(xe, (*bind_ops)[i].pad) ||
+		    XE_IOCTL_ERR(xe, (*bind_ops)[i].reserved[0] ||
+				     (*bind_ops)[i].reserved[1])) {
+			err = -EINVAL;
+			goto free_bind_ops;
+		}
+
 		if (i == 0) {
 			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
 		} else if (XE_IOCTL_ERR(xe, !*async) ||
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 29815852985a..c7e3ae7203d7 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -301,7 +301,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 	struct xe_vma **vmas = NULL;
 	int num_vmas = 0, err = 0, idx;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->property > ARRAY_SIZE(madvise_funcs)))
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 15c2e5aa08d2..eef989647bb0 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -100,7 +100,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
 	unsigned long timeout = args->timeout;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_FLAGS))
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..13b50198ba04 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -91,7 +91,7 @@ struct xe_user_extension {
 	 */
 	__u32 name;
 	/**
-	 * @flags: MBZ
+	 * @pad: MBZ
 	 *
 	 * All undefined bits must be zero.
 	 */
@@ -137,7 +137,7 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
 struct drm_xe_engine_class_instance {
-	__u16 engine_class;
+	__u32 engine_class;
 
 #define DRM_XE_ENGINE_CLASS_RENDER		0
 #define DRM_XE_ENGINE_CLASS_COPY		1
@@ -291,6 +291,13 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
+	/**
+	 * @pad: MBZ
+	 *
+	 * All undefined bits must be zero.
+	 */
+	__u32 pad;
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -335,6 +342,9 @@ struct drm_xe_ext_vm_set_property {
 #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 
@@ -379,6 +389,9 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 obj;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		/**
 		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
@@ -469,6 +482,12 @@ struct drm_xe_vm_bind {
 	/** @num_binds: number of binds in this IOCTL */
 	__u32 num_binds;
 
+	/** @num_syncs: amount of syncs to wait on */
+	__u32 num_syncs;
+
+	/** @syncs: pointer to struct drm_xe_sync array */
+	__u64 syncs;
+
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
@@ -479,12 +498,6 @@ struct drm_xe_vm_bind {
 		__u64 vector_of_binds;
 	};
 
-	/** @num_syncs: amount of syncs to wait on */
-	__u32 num_syncs;
-
-	/** @syncs: pointer to struct drm_xe_sync array */
-	__u64 syncs;
-
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -497,6 +510,9 @@ struct drm_xe_ext_engine_set_property {
 	/** @property: property to set */
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 };
@@ -604,8 +620,12 @@ struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
+	/** @flags: One of DRM_XE_SYNC_* flags */
 	__u32 flags;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 #define DRM_XE_SYNC_SYNCOBJ		0x0
 #define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
 #define DRM_XE_SYNC_DMA_BUF		0x2
@@ -613,7 +633,7 @@ struct drm_xe_sync {
 #define DRM_XE_SYNC_SIGNAL		0x10
 
 	union {
-		__u32 handle;
+		__u64 handle;
 		/**
 		 * @addr: Address of user fence. When sync passed in via exec
 		 * IOCTL this a GPU address in the VM. When sync passed in via
@@ -654,7 +674,10 @@ struct drm_xe_exec {
 	 * @num_batch_buffer: number of batch buffer in this exec, must match
 	 * the width of the engine
 	 */
-	__u16 num_batch_buffer;
+	__u32 num_batch_buffer;
+
+	/** @pad: MBZ */
+	__u32 pad;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -664,8 +687,10 @@ struct drm_xe_mmio {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
+	/** @addr: Address in mmio space to do an op on */
 	__u32 addr;
 
+	/** @flags: Combination of DRM_XE_MMIO_* flags */
 	__u32 flags;
 
 #define DRM_XE_MMIO_8BIT	0x0
@@ -712,12 +737,13 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_GTE	3
 #define DRM_XE_UFENCE_WAIT_LT	4
 #define DRM_XE_UFENCE_WAIT_LTE	5
-	__u16 op;
+	__u32 op;
 	/** @flags: wait flags */
 #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
 #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
-	__u16 flags;
+	__u32 flags;
+
 	/** @value: compare value */
 	__u64 value;
 	/** @mask: comparison mask */
@@ -747,15 +773,21 @@ struct drm_xe_vm_madvise {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @vm_id: The ID VM in which the VMA exists */
-	__u32 vm_id;
-
 	/** @range: Number of bytes in the VMA */
 	__u64 range;
 
 	/** @addr: Address of the VMA to operation on */
 	__u64 addr;
 
+	/** @vm_id: The ID VM in which the VMA exists */
+	__u32 vm_id;
+
+	/** @property: property to set (DRM_XE_VM_MADVISE_*) */
+	__u32 property;
+
+	/** @value: property value */
+	__u64 value;
+
 	/*
 	 * Setting the preferred location will trigger a migrate of the VMA
 	 * backing store to new location if the backing store is already
@@ -791,12 +823,6 @@ struct drm_xe_vm_madvise {
 	/* Pin the VMA in memory, must be elevated user */
 #define DRM_XE_VM_MADVISE_PIN			6
 
-	/** @property: property to set */
-	__u32 property;
-
-	/** @value: property value */
-	__u64 value;
-
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
-- 
2.34.1

