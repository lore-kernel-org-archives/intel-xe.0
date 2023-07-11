Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B5EEB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 09:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D6510E356;
	Tue, 11 Jul 2023 09:21:45 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBD010E354
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 09:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689067303; x=1720603303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XMUywIN1lLBaymuI2bLg6wsb07qCSmndYq39vwf9HZA=;
 b=TA12fy7MA3XzLSiYJXwpiuWc/AmbDcXj7SkvAfZAOOEDHxLUouNNtcFF
 caLv3CosqgCyBq478znh3a0rBPksD+nVbHt+vT515FM3jPURwI1awt+iM
 mEhwsjBQVDhHGkTO0I4TX+VTvT/JgrgXT9gl4irl08im2NXC/EuW7Sj3m
 NOAaQZGwzdoFRTm1ciRna4P7+rx5WecjDdESYp7qxPWk71z4IM/gUZEhL
 6UAc5t4mQNnUs0Luy1nY+OoHba61gzrSSA7i0xtFw7fmbbLel6kCWI0dM
 V3DfBCodkUKthdJuRmQJmtUGInxHTcnHHcSaCFFI4bPcxdFkKkmvMt5Dm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450932475"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="450932475"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750689319"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="750689319"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.34.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 02:21:41 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jul 2023 09:21:22 +0000
Message-Id: <20230711092122.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711092122.7-1-francois.dugast@intel.com>
References: <20230711092122.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/1] drm/xe: Prevent flooding the kernel log
 with XE_IOCTL_ERR
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
Cc: matthew.d.roper@intel.com, Francois Dugast <francois.dugast@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Lower log level of XE_IOCTL_ERR macro to debug in order to prevent
flooding kernel log. Rely on drm_dbg macro output which includes
function name, so removing file and name macros.

v2: Rename XE_IOCTL_ERR to XE_IOCTL_DBG (Rodrigo Vivi)

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c              |  26 ++--
 drivers/gpu/drm/xe/xe_engine.c          | 112 +++++++++---------
 drivers/gpu/drm/xe/xe_exec.c            |  14 +--
 drivers/gpu/drm/xe/xe_macros.h          |   8 +-
 drivers/gpu/drm/xe/xe_mmio.c            |  14 +--
 drivers/gpu/drm/xe/xe_query.c           |  30 ++---
 drivers/gpu/drm/xe/xe_sync.c            |  32 ++---
 drivers/gpu/drm/xe/xe_vm.c              | 150 ++++++++++++------------
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  40 +++----
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  30 ++---
 10 files changed, 228 insertions(+), 228 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e240df6c7ae6..fdbbac6cb388 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1713,35 +1713,35 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	u32 handle;
 	int err;
 
-	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
-	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags &
+	if (XE_IOCTL_DBG(xe, args->flags &
 			 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			   XE_GEM_CREATE_FLAG_SCANOUT |
 			   xe->info.mem_region_mask)))
 		return -EINVAL;
 
 	/* at least one memory type must be specified */
-	if (XE_IOCTL_ERR(xe, !(args->flags & xe->info.mem_region_mask)))
+	if (XE_IOCTL_DBG(xe, !(args->flags & xe->info.mem_region_mask)))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->handle))
+	if (XE_IOCTL_DBG(xe, args->handle))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, !args->size))
+	if (XE_IOCTL_DBG(xe, !args->size))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->size > SIZE_MAX))
+	if (XE_IOCTL_DBG(xe, args->size > SIZE_MAX))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->size & ~PAGE_MASK))
+	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
 		return -EINVAL;
 
 	if (args->vm_id) {
 		vm = xe_vm_lookup(xef, args->vm_id);
-		if (XE_IOCTL_ERR(xe, !vm))
+		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
 		err = xe_vm_lock(vm, &ww, 0, true);
 		if (err) {
@@ -1784,15 +1784,15 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_gem_mmap_offset *args = data;
 	struct drm_gem_object *gem_obj;
 
-	if (XE_IOCTL_ERR(xe, args->extensions) ||
-	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags))
+	if (XE_IOCTL_DBG(xe, args->flags))
 		return -EINVAL;
 
 	gem_obj = drm_gem_object_lookup(file, args->handle);
-	if (XE_IOCTL_ERR(xe, !gem_obj))
+	if (XE_IOCTL_DBG(xe, !gem_obj))
 		return -ENOENT;
 
 	/* The mmap offset was set up at BO allocation time. */
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 530f55a33b03..9edc03f30a00 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -179,10 +179,10 @@ xe_engine_device_get_max_priority(struct xe_device *xe)
 static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
 			       u64 value, bool create)
 {
-	if (XE_IOCTL_ERR(xe, value > DRM_SCHED_PRIORITY_HIGH))
+	if (XE_IOCTL_DBG(xe, value > DRM_SCHED_PRIORITY_HIGH))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, value > xe_engine_device_get_max_priority(xe)))
+	if (XE_IOCTL_DBG(xe, value > xe_engine_device_get_max_priority(xe)))
 		return -EPERM;
 
 	return e->ops->set_priority(e, value);
@@ -210,33 +210,33 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
 static int engine_set_compute_mode(struct xe_device *xe, struct xe_engine *e,
 				   u64 value, bool create)
 {
-	if (XE_IOCTL_ERR(xe, !create))
+	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, e->flags & ENGINE_FLAG_COMPUTE_MODE))
+	if (XE_IOCTL_DBG(xe, e->flags & ENGINE_FLAG_COMPUTE_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, e->flags & ENGINE_FLAG_VM))
+	if (XE_IOCTL_DBG(xe, e->flags & ENGINE_FLAG_VM))
 		return -EINVAL;
 
 	if (value) {
 		struct xe_vm *vm = e->vm;
 		int err;
 
-		if (XE_IOCTL_ERR(xe, xe_vm_in_fault_mode(vm)))
+		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
 			return -EOPNOTSUPP;
 
-		if (XE_IOCTL_ERR(xe, !xe_vm_in_compute_mode(vm)))
+		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
 			return -EOPNOTSUPP;
 
-		if (XE_IOCTL_ERR(xe, e->width != 1))
+		if (XE_IOCTL_DBG(xe, e->width != 1))
 			return -EINVAL;
 
 		e->compute.context = dma_fence_context_alloc(1);
 		spin_lock_init(&e->compute.lock);
 
 		err = xe_vm_add_compute_engine(vm, e);
-		if (XE_IOCTL_ERR(xe, err))
+		if (XE_IOCTL_DBG(xe, err))
 			return err;
 
 		e->flags |= ENGINE_FLAG_COMPUTE_MODE;
@@ -249,10 +249,10 @@ static int engine_set_compute_mode(struct xe_device *xe, struct xe_engine *e,
 static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
 				  u64 value, bool create)
 {
-	if (XE_IOCTL_ERR(xe, !create))
+	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, e->flags & ENGINE_FLAG_COMPUTE_MODE))
+	if (XE_IOCTL_DBG(xe, e->flags & ENGINE_FLAG_COMPUTE_MODE))
 		return -EINVAL;
 
 	if (value)
@@ -266,7 +266,7 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
 static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
 				  u64 value, bool create)
 {
-	if (XE_IOCTL_ERR(xe, !create))
+	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
 	if (!capable(CAP_SYS_NICE))
@@ -278,10 +278,10 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
 static int engine_set_acc_trigger(struct xe_device *xe, struct xe_engine *e,
 				  u64 value, bool create)
 {
-	if (XE_IOCTL_ERR(xe, !create))
+	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, !xe->info.supports_usm))
+	if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
 		return -EINVAL;
 
 	e->usm.acc_trigger = value;
@@ -292,10 +292,10 @@ static int engine_set_acc_trigger(struct xe_device *xe, struct xe_engine *e,
 static int engine_set_acc_notify(struct xe_device *xe, struct xe_engine *e,
 				 u64 value, bool create)
 {
-	if (XE_IOCTL_ERR(xe, !create))
+	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, !xe->info.supports_usm))
+	if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
 		return -EINVAL;
 
 	e->usm.acc_notify = value;
@@ -306,10 +306,10 @@ static int engine_set_acc_notify(struct xe_device *xe, struct xe_engine *e,
 static int engine_set_acc_granularity(struct xe_device *xe, struct xe_engine *e,
 				      u64 value, bool create)
 {
-	if (XE_IOCTL_ERR(xe, !create))
+	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, !xe->info.supports_usm))
+	if (XE_IOCTL_DBG(xe, !xe->info.supports_usm))
 		return -EINVAL;
 
 	e->usm.acc_granularity = value;
@@ -344,12 +344,12 @@ static int engine_user_ext_set_property(struct xe_device *xe,
 	u32 idx;
 
 	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_ERR(xe, err))
+	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, ext.property >=
+	if (XE_IOCTL_DBG(xe, ext.property >=
 			 ARRAY_SIZE(engine_set_property_funcs)) ||
-	    XE_IOCTL_ERR(xe, ext.pad))
+	    XE_IOCTL_DBG(xe, ext.pad))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(engine_set_property_funcs));
@@ -374,22 +374,22 @@ static int engine_user_extensions(struct xe_device *xe, struct xe_engine *e,
 	int err;
 	u32 idx;
 
-	if (XE_IOCTL_ERR(xe, ext_number >= MAX_USER_EXTENSIONS))
+	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
 		return -E2BIG;
 
 	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_ERR(xe, err))
+	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, ext.pad) ||
-	    XE_IOCTL_ERR(xe, ext.name >=
+	if (XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.name >=
 			 ARRAY_SIZE(engine_user_extension_funcs)))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.name,
 				 ARRAY_SIZE(engine_user_extension_funcs));
 	err = engine_user_extension_funcs[idx](xe, e, extensions, create);
-	if (XE_IOCTL_ERR(xe, err))
+	if (XE_IOCTL_DBG(xe, err))
 		return err;
 
 	if (ext.next_extension)
@@ -435,11 +435,11 @@ static u32 bind_engine_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 	enum xe_hw_engine_id id;
 	u32 logical_mask = 0;
 
-	if (XE_IOCTL_ERR(xe, width != 1))
+	if (XE_IOCTL_DBG(xe, width != 1))
 		return 0;
-	if (XE_IOCTL_ERR(xe, num_placements != 1))
+	if (XE_IOCTL_DBG(xe, num_placements != 1))
 		return 0;
-	if (XE_IOCTL_ERR(xe, eci[0].engine_instance != 0))
+	if (XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
 		return 0;
 
 	eci[0].engine_class = DRM_XE_ENGINE_CLASS_COPY;
@@ -466,7 +466,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 	u16 gt_id;
 	u32 return_mask = 0, prev_mask;
 
-	if (XE_IOCTL_ERR(xe, !xe_device_guc_submission_enabled(xe) &&
+	if (XE_IOCTL_DBG(xe, !xe_device_guc_submission_enabled(xe) &&
 			 len > 1))
 		return 0;
 
@@ -479,14 +479,14 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 			n = j * width + i;
 
 			hwe = find_hw_engine(xe, eci[n]);
-			if (XE_IOCTL_ERR(xe, !hwe))
+			if (XE_IOCTL_DBG(xe, !hwe))
 				return 0;
 
-			if (XE_IOCTL_ERR(xe, xe_hw_engine_is_reserved(hwe)))
+			if (XE_IOCTL_DBG(xe, xe_hw_engine_is_reserved(hwe)))
 				return 0;
 
-			if (XE_IOCTL_ERR(xe, n && eci[n].gt_id != gt_id) ||
-			    XE_IOCTL_ERR(xe, n && eci[n].engine_class != class))
+			if (XE_IOCTL_DBG(xe, n && eci[n].gt_id != gt_id) ||
+			    XE_IOCTL_DBG(xe, n && eci[n].engine_class != class))
 				return 0;
 
 			class = eci[n].engine_class;
@@ -498,7 +498,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 		}
 
 		/* Parallel submissions must be logically contiguous */
-		if (i && XE_IOCTL_ERR(xe, current_mask != prev_mask << 1))
+		if (i && XE_IOCTL_DBG(xe, current_mask != prev_mask << 1))
 			return 0;
 
 		prev_mask = current_mask;
@@ -525,21 +525,21 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 	u32 len;
 	int err;
 
-	if (XE_IOCTL_ERR(xe, args->flags) ||
-	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->flags) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	len = args->width * args->num_placements;
-	if (XE_IOCTL_ERR(xe, !len || len > XE_HW_ENGINE_MAX_INSTANCE))
+	if (XE_IOCTL_DBG(xe, !len || len > XE_HW_ENGINE_MAX_INSTANCE))
 		return -EINVAL;
 
 	err = __copy_from_user(eci, user_eci,
 			       sizeof(struct drm_xe_engine_class_instance) *
 			       len);
-	if (XE_IOCTL_ERR(xe, err))
+	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, eci[0].gt_id >= xe->info.tile_count))
+	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.tile_count))
 	       return -EINVAL;
 
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
@@ -553,11 +553,11 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 			logical_mask = bind_engine_logical_mask(xe, gt, eci,
 								args->width,
 								args->num_placements);
-			if (XE_IOCTL_ERR(xe, !logical_mask))
+			if (XE_IOCTL_DBG(xe, !logical_mask))
 				return -EINVAL;
 
 			hwe = find_hw_engine(xe, eci[0]);
-			if (XE_IOCTL_ERR(xe, !hwe))
+			if (XE_IOCTL_DBG(xe, !hwe))
 				return -EINVAL;
 
 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
@@ -586,15 +586,15 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 		logical_mask = calc_validate_logical_mask(xe, gt, eci,
 							  args->width,
 							  args->num_placements);
-		if (XE_IOCTL_ERR(xe, !logical_mask))
+		if (XE_IOCTL_DBG(xe, !logical_mask))
 			return -EINVAL;
 
 		hwe = find_hw_engine(xe, eci[0]);
-		if (XE_IOCTL_ERR(xe, !hwe))
+		if (XE_IOCTL_DBG(xe, !hwe))
 			return -EINVAL;
 
 		vm = xe_vm_lookup(xef, args->vm_id);
-		if (XE_IOCTL_ERR(xe, !vm))
+		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
 
 		e = xe_engine_create(xe, vm, logical_mask,
@@ -608,11 +608,11 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 
 	if (args->extensions) {
 		err = engine_user_extensions(xe, e, args->extensions, 0, true);
-		if (XE_IOCTL_ERR(xe, err))
+		if (XE_IOCTL_DBG(xe, err))
 			goto put_engine;
 	}
 
-	if (XE_IOCTL_ERR(xe, e->vm && xe_vm_in_compute_mode(e->vm) !=
+	if (XE_IOCTL_DBG(xe, e->vm && xe_vm_in_compute_mode(e->vm) !=
 			 !!(e->flags & ENGINE_FLAG_COMPUTE_MODE))) {
 		err = -EOPNOTSUPP;
 		goto put_engine;
@@ -645,11 +645,11 @@ int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
 	struct xe_engine *e;
 	int ret;
 
-	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	e = xe_engine_lookup(xef, args->engine_id);
-	if (XE_IOCTL_ERR(xe, !e))
+	if (XE_IOCTL_DBG(xe, !e))
 		return -ENOENT;
 
 	switch (args->property) {
@@ -758,14 +758,14 @@ int xe_engine_destroy_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_destroy *args = data;
 	struct xe_engine *e;
 
-	if (XE_IOCTL_ERR(xe, args->pad) ||
-	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->pad) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	mutex_lock(&xef->engine.lock);
 	e = xa_erase(&xef->engine.xa, args->engine_id);
 	mutex_unlock(&xef->engine.lock);
-	if (XE_IOCTL_ERR(xe, !e))
+	if (XE_IOCTL_DBG(xe, !e))
 		return -ENOENT;
 
 	if (!(e->flags & ENGINE_FLAG_PERSISTENT))
@@ -789,14 +789,14 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
 	int ret;
 	u32 idx;
 
-	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	e = xe_engine_lookup(xef, args->engine_id);
-	if (XE_IOCTL_ERR(xe, !e))
+	if (XE_IOCTL_DBG(xe, !e))
 		return -ENOENT;
 
-	if (XE_IOCTL_ERR(xe, args->property >=
+	if (XE_IOCTL_DBG(xe, args->property >=
 			 ARRAY_SIZE(engine_set_property_funcs))) {
 		ret = -EINVAL;
 		goto out;
@@ -805,7 +805,7 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
 	idx = array_index_nospec(args->property,
 				 ARRAY_SIZE(engine_set_property_funcs));
 	ret = engine_set_property_funcs[idx](xe, e, args->value, false);
-	if (XE_IOCTL_ERR(xe, ret))
+	if (XE_IOCTL_DBG(xe, ret))
 		goto out;
 
 	if (args->extensions)
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index c52edff9a358..8b6ab49b6b6c 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -184,22 +184,22 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	bool write_locked;
 	int err = 0;
 
-	if (XE_IOCTL_ERR(xe, args->extensions) ||
-	    XE_IOCTL_ERR(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
-	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
+	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	engine = xe_engine_lookup(xef, args->engine_id);
-	if (XE_IOCTL_ERR(xe, !engine))
+	if (XE_IOCTL_DBG(xe, !engine))
 		return -ENOENT;
 
-	if (XE_IOCTL_ERR(xe, engine->flags & ENGINE_FLAG_VM))
+	if (XE_IOCTL_DBG(xe, engine->flags & ENGINE_FLAG_VM))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, engine->width != args->num_batch_buffer))
+	if (XE_IOCTL_DBG(xe, engine->width != args->num_batch_buffer))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, engine->flags & ENGINE_FLAG_BANNED)) {
+	if (XE_IOCTL_DBG(xe, engine->flags & ENGINE_FLAG_BANNED)) {
 		err = -ECANCELED;
 		goto err_engine;
 	}
diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index 0d24c124d202..ab142f10cbda 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -12,9 +12,9 @@
 #define XE_WARN_ON WARN_ON
 #define XE_BUG_ON BUG_ON
 
-#define XE_IOCTL_ERR(xe, cond) \
-	((cond) && (drm_info(&(xe)->drm, \
-			    "Ioctl argument check failed at %s:%d: %s", \
-			    __FILE__, __LINE__, #cond), 1))
+#define XE_IOCTL_DBG(xe, cond) \
+	((cond) && (drm_dbg(&(xe)->drm, \
+			    "Ioctl argument check failed: %s", \
+			    #cond), 1))
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5effb21db9d4..aa62864e3622 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -441,14 +441,14 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	bool allowed;
 	int ret = 0;
 
-	if (XE_IOCTL_ERR(xe, args->extensions) ||
-	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_MMIO_FLAGS))
+	if (XE_IOCTL_DBG(xe, args->flags & ~VALID_MMIO_FLAGS))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, !(args->flags & DRM_XE_MMIO_WRITE) && args->value))
+	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_MMIO_WRITE) && args->value))
 		return -EINVAL;
 
 	allowed = capable(CAP_SYS_ADMIN);
@@ -463,12 +463,12 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	if (XE_IOCTL_ERR(xe, !allowed))
+	if (XE_IOCTL_DBG(xe, !allowed))
 		return -EPERM;
 
 	bits_flag = args->flags & DRM_XE_MMIO_BITS_MASK;
 	bytes = 1 << bits_flag;
-	if (XE_IOCTL_ERR(xe, args->addr + bytes > xe->mmio.size))
+	if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
 		return -EINVAL;
 
 	/*
@@ -482,7 +482,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_MMIO_WRITE) {
 		switch (bits_flag) {
 		case DRM_XE_MMIO_32BIT:
-			if (XE_IOCTL_ERR(xe, args->value > U32_MAX)) {
+			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
 				ret = -EINVAL;
 				goto exit;
 			}
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9acbb27dfcab..4b7869596ba8 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -60,12 +60,12 @@ static int query_engines(struct xe_device *xe,
 	if (query->size == 0) {
 		query->size = size;
 		return 0;
-	} else if (XE_IOCTL_ERR(xe, query->size != size)) {
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
 		return -EINVAL;
 	}
 
 	hw_engine_info = kmalloc(size, GFP_KERNEL);
-	if (XE_IOCTL_ERR(xe, !hw_engine_info))
+	if (XE_IOCTL_DBG(xe, !hw_engine_info))
 		return -ENOMEM;
 
 	for_each_gt(gt, xe, gt_id)
@@ -114,12 +114,12 @@ static int query_memory_usage(struct xe_device *xe,
 	if (query->size == 0) {
 		query->size = size;
 		return 0;
-	} else if (XE_IOCTL_ERR(xe, query->size != size)) {
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
 		return -EINVAL;
 	}
 
 	usage = kzalloc(size, GFP_KERNEL);
-	if (XE_IOCTL_ERR(xe, !usage))
+	if (XE_IOCTL_DBG(xe, !usage))
 		return -ENOMEM;
 
 	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
@@ -177,12 +177,12 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (query->size == 0) {
 		query->size = size;
 		return 0;
-	} else if (XE_IOCTL_ERR(xe, query->size != size)) {
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
 		return -EINVAL;
 	}
 
 	config = kzalloc(size, GFP_KERNEL);
-	if (XE_IOCTL_ERR(xe, !config))
+	if (XE_IOCTL_DBG(xe, !config))
 		return -ENOMEM;
 
 	config->num_params = num_params;
@@ -226,12 +226,12 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (query->size == 0) {
 		query->size = size;
 		return 0;
-	} else if (XE_IOCTL_ERR(xe, query->size != size)) {
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
 		return -EINVAL;
 	}
 
 	gts = kzalloc(size, GFP_KERNEL);
-	if (XE_IOCTL_ERR(xe, !gts))
+	if (XE_IOCTL_DBG(xe, !gts))
 		return -ENOMEM;
 
 	gts->num_gt = xe->info.gt_count;
@@ -273,12 +273,12 @@ static int query_hwconfig(struct xe_device *xe,
 	if (query->size == 0) {
 		query->size = size;
 		return 0;
-	} else if (XE_IOCTL_ERR(xe, query->size != size)) {
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
 		return -EINVAL;
 	}
 
 	hwconfig = kzalloc(size, GFP_KERNEL);
-	if (XE_IOCTL_ERR(xe, !hwconfig))
+	if (XE_IOCTL_DBG(xe, !hwconfig))
 		return -ENOMEM;
 
 	xe_device_mem_access_get(xe);
@@ -332,7 +332,7 @@ static int query_gt_topology(struct xe_device *xe,
 	if (query->size == 0) {
 		query->size = size;
 		return 0;
-	} else if (XE_IOCTL_ERR(xe, query->size != size)) {
+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
 		return -EINVAL;
 	}
 
@@ -380,15 +380,15 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_xe_device_query *query = data;
 	u32 idx;
 
-	if (XE_IOCTL_ERR(xe, query->extensions) ||
-	    XE_IOCTL_ERR(xe, query->reserved[0] || query->reserved[1]))
+	if (XE_IOCTL_DBG(xe, query->extensions) ||
+	    XE_IOCTL_DBG(xe, query->reserved[0] || query->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
+	if (XE_IOCTL_DBG(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
 		return -EINVAL;
 
 	idx = array_index_nospec(query->query, ARRAY_SIZE(xe_query_funcs));
-	if (XE_IOCTL_ERR(xe, !xe_query_funcs[idx]))
+	if (XE_IOCTL_DBG(xe, !xe_query_funcs[idx]))
 		return -EINVAL;
 
 	return xe_query_funcs[idx](xe, query);
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 7786b908a3fd..9fcd7802ba30 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -110,44 +110,44 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, sync_in.flags &
+	if (XE_IOCTL_DBG(xe, sync_in.flags &
 			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)) ||
-	    XE_IOCTL_ERR(xe, sync_in.pad) ||
-	    XE_IOCTL_ERR(xe, sync_in.reserved[0] || sync_in.reserved[1]))
+	    XE_IOCTL_DBG(xe, sync_in.pad) ||
+	    XE_IOCTL_DBG(xe, sync_in.reserved[0] || sync_in.reserved[1]))
 		return -EINVAL;
 
 	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
 	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
 	case DRM_XE_SYNC_SYNCOBJ:
-		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
+		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
 			return -EOPNOTSUPP;
 
-		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
+		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
 			return -EINVAL;
 
 		sync->syncobj = drm_syncobj_find(xef->drm, sync_in.handle);
-		if (XE_IOCTL_ERR(xe, !sync->syncobj))
+		if (XE_IOCTL_DBG(xe, !sync->syncobj))
 			return -ENOENT;
 
 		if (!signal) {
 			sync->fence = drm_syncobj_fence_get(sync->syncobj);
-			if (XE_IOCTL_ERR(xe, !sync->fence))
+			if (XE_IOCTL_DBG(xe, !sync->fence))
 				return -EINVAL;
 		}
 		break;
 
 	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
-		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
+		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
 			return -EOPNOTSUPP;
 
-		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
+		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
 			return -EINVAL;
 
-		if (XE_IOCTL_ERR(xe, sync_in.timeline_value == 0))
+		if (XE_IOCTL_DBG(xe, sync_in.timeline_value == 0))
 			return -EINVAL;
 
 		sync->syncobj = drm_syncobj_find(xef->drm, sync_in.handle);
-		if (XE_IOCTL_ERR(xe, !sync->syncobj))
+		if (XE_IOCTL_DBG(xe, !sync->syncobj))
 			return -ENOENT;
 
 		if (signal) {
@@ -156,7 +156,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 				return -ENOMEM;
 		} else {
 			sync->fence = drm_syncobj_fence_get(sync->syncobj);
-			if (XE_IOCTL_ERR(xe, !sync->fence))
+			if (XE_IOCTL_DBG(xe, !sync->fence))
 				return -EINVAL;
 
 			err = dma_fence_chain_find_seqno(&sync->fence,
@@ -167,15 +167,15 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		break;
 
 	case DRM_XE_SYNC_DMA_BUF:
-		if (XE_IOCTL_ERR(xe, "TODO"))
+		if (XE_IOCTL_DBG(xe, "TODO"))
 			return -EINVAL;
 		break;
 
 	case DRM_XE_SYNC_USER_FENCE:
-		if (XE_IOCTL_ERR(xe, !signal))
+		if (XE_IOCTL_DBG(xe, !signal))
 			return -EOPNOTSUPP;
 
-		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
+		if (XE_IOCTL_DBG(xe, sync_in.addr & 0x7))
 			return -EINVAL;
 
 		if (exec) {
@@ -183,7 +183,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		} else {
 			sync->ufence = user_fence_create(xe, sync_in.addr,
 							 sync_in.timeline_value);
-			if (XE_IOCTL_ERR(xe, !sync->ufence))
+			if (XE_IOCTL_DBG(xe, !sync->ufence))
 				return -ENOMEM;
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dbff75a9087b..6bdd7b79f90b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1827,13 +1827,13 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
 					u64 value)
 {
-	if (XE_IOCTL_ERR(xe, !value))
+	if (XE_IOCTL_DBG(xe, !value))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
+	if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
 		return -EOPNOTSUPP;
 
-	if (XE_IOCTL_ERR(xe, vm->async_ops.error_capture.addr))
+	if (XE_IOCTL_DBG(xe, vm->async_ops.error_capture.addr))
 		return -EOPNOTSUPP;
 
 	vm->async_ops.error_capture.mm = current->mm;
@@ -1859,13 +1859,13 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
 	int err;
 
 	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_ERR(xe, err))
+	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, ext.property >=
+	if (XE_IOCTL_DBG(xe, ext.property >=
 			 ARRAY_SIZE(vm_set_property_funcs)) ||
-	    XE_IOCTL_ERR(xe, ext.pad) ||
-	    XE_IOCTL_ERR(xe, ext.reserved[0] || ext.reserved[1]))
+	    XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.reserved[0] || ext.reserved[1]))
 		return -EINVAL;
 
 	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
@@ -1886,20 +1886,20 @@ static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
 	struct xe_user_extension ext;
 	int err;
 
-	if (XE_IOCTL_ERR(xe, ext_number >= MAX_USER_EXTENSIONS))
+	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
 		return -E2BIG;
 
 	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_ERR(xe, err))
+	if (XE_IOCTL_DBG(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, ext.pad) ||
-	    XE_IOCTL_ERR(xe, ext.name >=
+	if (XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.name >=
 			 ARRAY_SIZE(vm_user_extension_funcs)))
 		return -EINVAL;
 
 	err = vm_user_extension_funcs[ext.name](xe, vm, extensions);
-	if (XE_IOCTL_ERR(xe, err))
+	if (XE_IOCTL_DBG(xe, err))
 		return err;
 
 	if (ext.next_extension)
@@ -1925,29 +1925,29 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	int err;
 	u32 flags = 0;
 
-	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
+	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
 			 xe_device_in_non_fault_mode(xe)))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, !(args->flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
+	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
 			 xe_device_in_fault_mode(xe)))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
 			 !xe->info.supports_usm))
 		return -EINVAL;
 
@@ -1966,7 +1966,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	if (args->extensions) {
 		err = vm_user_extensions(xe, vm, args->extensions, 0);
-		if (XE_IOCTL_ERR(xe, err)) {
+		if (XE_IOCTL_DBG(xe, err)) {
 			xe_vm_close_and_put(vm);
 			return err;
 		}
@@ -2012,15 +2012,15 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	struct xe_vm *vm;
 	int err = 0;
 
-	if (XE_IOCTL_ERR(xe, args->pad) ||
-	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->pad) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	mutex_lock(&xef->vm.lock);
 	vm = xa_load(&xef->vm.xa, args->vm_id);
-	if (XE_IOCTL_ERR(xe, !vm))
+	if (XE_IOCTL_DBG(xe, !vm))
 		err = -ENOENT;
-	else if (XE_IOCTL_ERR(xe, vm->preempt.num_engines))
+	else if (XE_IOCTL_DBG(xe, vm->preempt.num_engines))
 		err = -EBUSY;
 	else
 		xa_erase(&xef->vm.xa, args->vm_id);
@@ -2560,14 +2560,14 @@ static int __vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 	case XE_VM_BIND_OP_MAP:
 	case XE_VM_BIND_OP_MAP_USERPTR:
 		vma = xe_vm_find_overlapping_vma(vm, &lookup);
-		if (XE_IOCTL_ERR(xe, vma))
+		if (XE_IOCTL_DBG(xe, vma))
 			return -EBUSY;
 		break;
 	case XE_VM_BIND_OP_UNMAP:
 	case XE_VM_BIND_OP_PREFETCH:
 		vma = xe_vm_find_overlapping_vma(vm, &lookup);
-		if (XE_IOCTL_ERR(xe, !vma) ||
-		    XE_IOCTL_ERR(xe, (vma->start != addr ||
+		if (XE_IOCTL_DBG(xe, !vma) ||
+		    XE_IOCTL_DBG(xe, (vma->start != addr ||
 				 vma->end != addr + range - 1) && !async))
 			return -EINVAL;
 		break;
@@ -2937,11 +2937,11 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int err;
 	int i;
 
-	if (XE_IOCTL_ERR(xe, args->extensions) ||
-	    XE_IOCTL_ERR(xe, args->pad || args->pad2) ||
-	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]) ||
-	    XE_IOCTL_ERR(xe, !args->num_binds) ||
-	    XE_IOCTL_ERR(xe, args->num_binds > MAX_BINDS))
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
+	    XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]) ||
+	    XE_IOCTL_DBG(xe, !args->num_binds) ||
+	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
 		return -EINVAL;
 
 	if (args->num_binds > 1) {
@@ -2956,7 +2956,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		err = __copy_from_user(*bind_ops, bind_user,
 				       sizeof(struct drm_xe_vm_bind_op) *
 				       args->num_binds);
-		if (XE_IOCTL_ERR(xe, err)) {
+		if (XE_IOCTL_DBG(xe, err)) {
 			err = -EFAULT;
 			goto free_bind_ops;
 		}
@@ -2973,8 +2973,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u32 region = (*bind_ops)[i].region;
 		bool is_null = op &  XE_VM_BIND_FLAG_NULL;
 
-		if (XE_IOCTL_ERR(xe, (*bind_ops)[i].pad) ||
-		    XE_IOCTL_ERR(xe, (*bind_ops)[i].reserved[0] ||
+		if (XE_IOCTL_DBG(xe, (*bind_ops)[i].pad) ||
+		    XE_IOCTL_DBG(xe, (*bind_ops)[i].reserved[0] ||
 				     (*bind_ops)[i].reserved[1])) {
 			err = -EINVAL;
 			goto free_bind_ops;
@@ -2982,60 +2982,60 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		if (i == 0) {
 			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
-		} else if (XE_IOCTL_ERR(xe, !*async) ||
-			   XE_IOCTL_ERR(xe, !(op & XE_VM_BIND_FLAG_ASYNC)) ||
-			   XE_IOCTL_ERR(xe, VM_BIND_OP(op) ==
+		} else if (XE_IOCTL_DBG(xe, !*async) ||
+			   XE_IOCTL_DBG(xe, !(op & XE_VM_BIND_FLAG_ASYNC)) ||
+			   XE_IOCTL_DBG(xe, VM_BIND_OP(op) ==
 					XE_VM_BIND_OP_RESTART)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
-		if (XE_IOCTL_ERR(xe, !*async &&
+		if (XE_IOCTL_DBG(xe, !*async &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
-		if (XE_IOCTL_ERR(xe, !*async &&
+		if (XE_IOCTL_DBG(xe, !*async &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
-		if (XE_IOCTL_ERR(xe, VM_BIND_OP(op) >
+		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
 				 XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_ERR(xe, op & ~SUPPORTED_FLAGS) ||
-		    XE_IOCTL_ERR(xe, obj && is_null) ||
-		    XE_IOCTL_ERR(xe, obj_offset && is_null) ||
-		    XE_IOCTL_ERR(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
+		    XE_IOCTL_DBG(xe, op & ~SUPPORTED_FLAGS) ||
+		    XE_IOCTL_DBG(xe, obj && is_null) ||
+		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
+		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
 				 is_null) ||
-		    XE_IOCTL_ERR(xe, !obj &&
+		    XE_IOCTL_DBG(xe, !obj &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP &&
 				 !is_null) ||
-		    XE_IOCTL_ERR(xe, !obj &&
+		    XE_IOCTL_DBG(xe, !obj &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
-		    XE_IOCTL_ERR(xe, addr &&
+		    XE_IOCTL_DBG(xe, addr &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
-		    XE_IOCTL_ERR(xe, range &&
+		    XE_IOCTL_DBG(xe, range &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
-		    XE_IOCTL_ERR(xe, obj &&
+		    XE_IOCTL_DBG(xe, obj &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR) ||
-		    XE_IOCTL_ERR(xe, obj &&
+		    XE_IOCTL_DBG(xe, obj &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_ERR(xe, region &&
+		    XE_IOCTL_DBG(xe, region &&
 				 VM_BIND_OP(op) != XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_ERR(xe, !(BIT(region) &
+		    XE_IOCTL_DBG(xe, !(BIT(region) &
 				       xe->info.mem_region_mask)) ||
-		    XE_IOCTL_ERR(xe, obj &&
+		    XE_IOCTL_DBG(xe, obj &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
-		if (XE_IOCTL_ERR(xe, obj_offset & ~PAGE_MASK) ||
-		    XE_IOCTL_ERR(xe, addr & ~PAGE_MASK) ||
-		    XE_IOCTL_ERR(xe, range & ~PAGE_MASK) ||
-		    XE_IOCTL_ERR(xe, !range && VM_BIND_OP(op) !=
+		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
+		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
+		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
+		    XE_IOCTL_DBG(xe, !range && VM_BIND_OP(op) !=
 				 XE_VM_BIND_OP_RESTART &&
 				 VM_BIND_OP(op) != XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
@@ -3073,12 +3073,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		return err;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
-	if (XE_IOCTL_ERR(xe, !vm)) {
+	if (XE_IOCTL_DBG(xe, !vm)) {
 		err = -EINVAL;
 		goto free_objs;
 	}
 
-	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
+	if (XE_IOCTL_DBG(xe, xe_vm_is_closed(vm))) {
 		drm_err(dev, "VM closed while we began looking up?\n");
 		err = -ENOENT;
 		goto put_vm;
@@ -3086,22 +3086,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (args->engine_id) {
 		e = xe_engine_lookup(xef, args->engine_id);
-		if (XE_IOCTL_ERR(xe, !e)) {
+		if (XE_IOCTL_DBG(xe, !e)) {
 			err = -ENOENT;
 			goto put_vm;
 		}
-		if (XE_IOCTL_ERR(xe, !(e->flags & ENGINE_FLAG_VM))) {
+		if (XE_IOCTL_DBG(xe, !(e->flags & ENGINE_FLAG_VM))) {
 			err = -EINVAL;
 			goto put_engine;
 		}
 	}
 
 	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
-		if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
+		if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
 			err = -EOPNOTSUPP;
-		if (XE_IOCTL_ERR(xe, !err && args->num_syncs))
+		if (XE_IOCTL_DBG(xe, !err && args->num_syncs))
 			err = EINVAL;
-		if (XE_IOCTL_ERR(xe, !err && !vm->async_ops.error))
+		if (XE_IOCTL_DBG(xe, !err && !vm->async_ops.error))
 			err = -EPROTO;
 
 		if (!err) {
@@ -3120,7 +3120,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto put_engine;
 	}
 
-	if (XE_IOCTL_ERR(xe, !vm->async_ops.error &&
+	if (XE_IOCTL_DBG(xe, !vm->async_ops.error &&
 			 async != !!(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS))) {
 		err = -EOPNOTSUPP;
 		goto put_engine;
@@ -3130,8 +3130,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
 
-		if (XE_IOCTL_ERR(xe, range > vm->size) ||
-		    XE_IOCTL_ERR(xe, addr > vm->size - range)) {
+		if (XE_IOCTL_DBG(xe, range > vm->size) ||
+		    XE_IOCTL_DBG(xe, addr > vm->size - range)) {
 			err = -EINVAL;
 			goto put_engine;
 		}
@@ -3139,7 +3139,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (bind_ops[i].tile_mask) {
 			u64 valid_tiles = BIT(xe->info.tile_count) - 1;
 
-			if (XE_IOCTL_ERR(xe, bind_ops[i].tile_mask &
+			if (XE_IOCTL_DBG(xe, bind_ops[i].tile_mask &
 					 ~valid_tiles)) {
 				err = -EINVAL;
 				goto put_engine;
@@ -3170,24 +3170,24 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			continue;
 
 		gem_obj = drm_gem_object_lookup(file, obj);
-		if (XE_IOCTL_ERR(xe, !gem_obj)) {
+		if (XE_IOCTL_DBG(xe, !gem_obj)) {
 			err = -ENOENT;
 			goto put_obj;
 		}
 		bos[i] = gem_to_xe_bo(gem_obj);
 
-		if (XE_IOCTL_ERR(xe, range > bos[i]->size) ||
-		    XE_IOCTL_ERR(xe, obj_offset >
+		if (XE_IOCTL_DBG(xe, range > bos[i]->size) ||
+		    XE_IOCTL_DBG(xe, obj_offset >
 				 bos[i]->size - range)) {
 			err = -EINVAL;
 			goto put_obj;
 		}
 
 		if (bos[i]->flags & XE_BO_INTERNAL_64K) {
-			if (XE_IOCTL_ERR(xe, obj_offset &
+			if (XE_IOCTL_DBG(xe, obj_offset &
 					 XE_64K_PAGE_MASK) ||
-			    XE_IOCTL_ERR(xe, addr & XE_64K_PAGE_MASK) ||
-			    XE_IOCTL_ERR(xe, range & XE_64K_PAGE_MASK)) {
+			    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
+			    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
 				err = -EINVAL;
 				goto put_obj;
 			}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 0f5eef337037..b6a484be5fe8 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -19,10 +19,10 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
 {
 	int i, err;
 
-	if (XE_IOCTL_ERR(xe, value > XE_MEM_REGION_CLASS_VRAM))
+	if (XE_IOCTL_DBG(xe, value > XE_MEM_REGION_CLASS_VRAM))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, value == XE_MEM_REGION_CLASS_VRAM &&
+	if (XE_IOCTL_DBG(xe, value == XE_MEM_REGION_CLASS_VRAM &&
 			 !xe->info.is_dgfx))
 		return -EINVAL;
 
@@ -48,7 +48,7 @@ static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
 {
 	int i, err;
 
-	if (XE_IOCTL_ERR(xe, value > xe->info.tile_count))
+	if (XE_IOCTL_DBG(xe, value > xe->info.tile_count))
 		return -EINVAL;
 
 	for (i = 0; i < num_vmas; ++i) {
@@ -77,14 +77,14 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
 	u32 gt_id = upper_32_bits(value);
 	u32 mem_class = lower_32_bits(value);
 
-	if (XE_IOCTL_ERR(xe, mem_class > XE_MEM_REGION_CLASS_VRAM))
+	if (XE_IOCTL_DBG(xe, mem_class > XE_MEM_REGION_CLASS_VRAM))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, mem_class == XE_MEM_REGION_CLASS_VRAM &&
+	if (XE_IOCTL_DBG(xe, mem_class == XE_MEM_REGION_CLASS_VRAM &&
 			 !xe->info.is_dgfx))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, gt_id > xe->info.tile_count))
+	if (XE_IOCTL_DBG(xe, gt_id > xe->info.tile_count))
 		return -EINVAL;
 
 	for (i = 0; i < num_vmas; ++i) {
@@ -115,7 +115,7 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
 		struct ww_acquire_ctx ww;
 
 		bo = vmas[i]->bo;
-		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
+		if (XE_IOCTL_DBG(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
 			return -EINVAL;
 
 		err = xe_bo_lock(bo, &ww, 0, true);
@@ -146,7 +146,7 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
 		struct ww_acquire_ctx ww;
 
 		bo = vmas[i]->bo;
-		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
+		if (XE_IOCTL_DBG(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
 				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
 			return -EINVAL;
 
@@ -165,10 +165,10 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
 {
 	int i, err;
 
-	if (XE_IOCTL_ERR(xe, value > DRM_XE_VMA_PRIORITY_HIGH))
+	if (XE_IOCTL_DBG(xe, value > DRM_XE_VMA_PRIORITY_HIGH))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, value == DRM_XE_VMA_PRIORITY_HIGH &&
+	if (XE_IOCTL_DBG(xe, value == DRM_XE_VMA_PRIORITY_HIGH &&
 			 !capable(CAP_SYS_NICE)))
 		return -EPERM;
 
@@ -301,24 +301,24 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 	struct xe_vma **vmas = NULL;
 	int num_vmas = 0, err = 0, idx;
 
-	if (XE_IOCTL_ERR(xe, args->extensions) ||
-	    XE_IOCTL_ERR(xe, args->pad || args->pad2) ||
-	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
+	    XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->property > ARRAY_SIZE(madvise_funcs)))
+	if (XE_IOCTL_DBG(xe, args->property > ARRAY_SIZE(madvise_funcs)))
 		return -EINVAL;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
-	if (XE_IOCTL_ERR(xe, !vm))
+	if (XE_IOCTL_DBG(xe, !vm))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
+	if (XE_IOCTL_DBG(xe, xe_vm_is_closed(vm))) {
 		err = -ENOENT;
 		goto put_vm;
 	}
 
-	if (XE_IOCTL_ERR(xe, !xe_vm_in_fault_mode(vm))) {
+	if (XE_IOCTL_DBG(xe, !xe_vm_in_fault_mode(vm))) {
 		err = -EINVAL;
 		goto put_vm;
 	}
@@ -326,15 +326,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 	down_read(&vm->lock);
 
 	vmas = get_vmas(vm, &num_vmas, args->addr, args->range);
-	if (XE_IOCTL_ERR(xe, err))
+	if (XE_IOCTL_DBG(xe, err))
 		goto unlock_vm;
 
-	if (XE_IOCTL_ERR(xe, !vmas)) {
+	if (XE_IOCTL_DBG(xe, !vmas)) {
 		err = -ENOMEM;
 		goto unlock_vm;
 	}
 
-	if (XE_IOCTL_ERR(xe, !num_vmas)) {
+	if (XE_IOCTL_DBG(xe, !num_vmas)) {
 		err = -EINVAL;
 		goto unlock_vm;
 	}
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index c4420c0dbf9c..c4202df1d4f0 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -117,51 +117,51 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	unsigned long timeout;
 	ktime_t start;
 
-	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
-	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_FLAGS))
+	if (XE_IOCTL_DBG(xe, args->flags & ~VALID_FLAGS))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->op > MAX_OP))
+	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, no_engines &&
+	if (XE_IOCTL_DBG(xe, no_engines &&
 			 (args->num_engines || args->instances)))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, !no_engines && !args->num_engines))
+	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, !(args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR) &&
+	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR) &&
 			 addr & 0x7))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
+	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
 		return -EINVAL;
 
 	if (!no_engines) {
 		err = copy_from_user(eci, user_eci,
 				     sizeof(struct drm_xe_engine_class_instance) *
 			     args->num_engines);
-		if (XE_IOCTL_ERR(xe, err))
+		if (XE_IOCTL_DBG(xe, err))
 			return -EFAULT;
 
-		if (XE_IOCTL_ERR(xe, check_hw_engines(xe, eci,
+		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
 						      args->num_engines)))
 			return -EINVAL;
 	}
 
 	if (args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR) {
-		if (XE_IOCTL_ERR(xe, args->vm_id >> 32))
+		if (XE_IOCTL_DBG(xe, args->vm_id >> 32))
 			return -EINVAL;
 
 		vm = xe_vm_lookup(to_xe_file(file), args->vm_id);
-		if (XE_IOCTL_ERR(xe, !vm))
+		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
 
-		if (XE_IOCTL_ERR(xe, !vm->async_ops.error_capture.addr)) {
+		if (XE_IOCTL_DBG(xe, !vm->async_ops.error_capture.addr)) {
 			xe_vm_put(vm);
 			return -EOPNOTSUPP;
 		}
@@ -226,9 +226,9 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			args->timeout = 0;
 	}
 
-	if (XE_IOCTL_ERR(xe, err < 0))
+	if (XE_IOCTL_DBG(xe, err < 0))
 		return err;
-	else if (XE_IOCTL_ERR(xe, !timeout))
+	else if (XE_IOCTL_DBG(xe, !timeout))
 		return -ETIME;
 
 	return 0;
-- 
2.34.1

