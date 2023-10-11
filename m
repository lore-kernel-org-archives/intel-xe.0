Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5530CD6E6E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C8910E84F;
	Wed, 11 Oct 2023 13:59:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F3710E83F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032786; x=1728568786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vmhaCpgwxg9befW2zmiwFO2JoLFGwzfGD8FDpbBy25E=;
 b=eDcczwi0I6PC4wdNLaLTELAut8FpFVKcjhPPf3ZAluf4AksUx3Nf61Qa
 V5dKtz8gEwDvuHXHbEnlSXiQ1GwNDtuolR/2kc8/MS3pG/Gyz1af6DYRA
 DBfutOXRRBJH6ucQvxbRntSgeT0Rc7T0MxXsGgTAov9hZ7f7wreYVyacb
 mzyQsDq4dRjm23PAzFhlknjUUBar402jtSRyY4RN3uT05lPp0rRz6xcBs
 bgdgx6RQQ++R7cUZ4m3/ZOYSeaUt0d5qRk6iJhU6o/8lEDjsCzqn+mSvy
 isEBWo070lpIMCXbqdXPfnPuvJlxv6b6zDQLZL4V5/7w+sLBjS/Rp74Lu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156241"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156241"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829079"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829079"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:45 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:17 +0000
Message-Id: <20231011135926.7-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 08/17] drm/xe/uapi: Add missing DRM_ prefix in
 uAPI constants
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Most constants defined in xe_drm.h use DRM_XE_ as prefix which is
helpful to identify the name space. Make this systematic and add
this prefix where it was missing.

v2:
- fix vertical alignment of define values
- remove double DRM_ in some variables (José Roberto de Souza)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         |  14 +--
 drivers/gpu/drm/xe/xe_exec_queue.c |  20 ++---
 drivers/gpu/drm/xe/xe_gt.c         |   2 +-
 drivers/gpu/drm/xe/xe_pmu.c        |  20 ++---
 drivers/gpu/drm/xe/xe_query.c      |  38 ++++----
 drivers/gpu/drm/xe/xe_vm.c         |  54 +++++------
 drivers/gpu/drm/xe/xe_vm_doc.h     |  12 +--
 drivers/gpu/drm/xe/xe_vm_madvise.c |   8 +-
 include/uapi/drm/xe_drm.h          | 140 ++++++++++++++---------------
 9 files changed, 154 insertions(+), 154 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..5b9f07838061 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -208,7 +208,7 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 
 	/* The order of placements should indicate preferred location */
 
-	if (bo->props.preferred_mem_class == XE_MEM_REGION_CLASS_SYSMEM) {
+	if (bo->props.preferred_mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM) {
 		try_add_system(bo, places, bo_flags, &c);
 		try_add_vram(xe, bo, places, bo_flags, &c);
 	} else {
@@ -1773,9 +1773,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->flags &
-			 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
-			   XE_GEM_CREATE_FLAG_SCANOUT |
-			   XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
+			 ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
+			   DRM_XE_GEM_CREATE_FLAG_SCANOUT |
+			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
 			   xe->info.mem_region_mask)))
 		return -EINVAL;
 
@@ -1795,15 +1795,15 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
 		return -EINVAL;
 
-	if (args->flags & XE_GEM_CREATE_FLAG_DEFER_BACKING)
+	if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
 		bo_flags |= XE_BO_DEFER_BACKING;
 
-	if (args->flags & XE_GEM_CREATE_FLAG_SCANOUT)
+	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
 		bo_flags |= XE_BO_SCANOUT_BIT;
 
 	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
 
-	if (args->flags & XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
+	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
 		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
 			return -EINVAL;
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index dd61c4267e24..98f9d4cd9cc5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -403,14 +403,14 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     u64 value, bool create);
 
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
-	[XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
-	[XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
-	[XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
-	[XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
-	[XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
-	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
-	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
-	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY] = exec_queue_set_acc_granularity,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY] = exec_queue_set_acc_granularity,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -442,7 +442,7 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
 					       bool create);
 
 static const xe_exec_queue_set_property_fn exec_queue_user_extension_funcs[] = {
-	[XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
+	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
 };
 
 #define MAX_USER_EXTENSIONS	16
@@ -761,7 +761,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	switch (args->property) {
-	case XE_EXEC_QUEUE_GET_PROPERTY_BAN:
+	case DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN:
 		args->value = !!(q->flags & EXEC_QUEUE_FLAG_BANNED);
 		ret = 0;
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 68cd9a7ee087..aa7c19a4bbc4 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -534,7 +534,7 @@ static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_id, u8 gt_i
 {
 	char *reset_event[4];
 
-	reset_event[0] = XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
+	reset_event[0] = DRM_XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
 	reset_event[1] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
 	reset_event[2] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
 	reset_event[3] = NULL;
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index abfc0b3aeac4..8378ca3007d9 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -114,17 +114,17 @@ config_status(struct xe_device *xe, u64 config)
 		return -ENOENT;
 
 	switch (config_counter(config)) {
-	case XE_PMU_INTERRUPTS(0):
+	case DRM_XE_PMU_INTERRUPTS(0):
 		if (gt_id)
 			return -ENOENT;
 		break;
-	case XE_PMU_RENDER_GROUP_BUSY(0):
-	case XE_PMU_COPY_GROUP_BUSY(0):
-	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
+	case DRM_XE_PMU_RENDER_GROUP_BUSY(0):
+	case DRM_XE_PMU_COPY_GROUP_BUSY(0):
+	case DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
 		if (gt->info.type == XE_GT_TYPE_MEDIA)
 			return -ENOENT;
 		break;
-	case XE_PMU_MEDIA_GROUP_BUSY(0):
+	case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
 		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
 			return -ENOENT;
 		break;
@@ -185,13 +185,13 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	u64 val;
 
 	switch (config_counter(config)) {
-	case XE_PMU_INTERRUPTS(0):
+	case DRM_XE_PMU_INTERRUPTS(0):
 		val = READ_ONCE(pmu->irq_count);
 		break;
-	case XE_PMU_RENDER_GROUP_BUSY(0):
-	case XE_PMU_COPY_GROUP_BUSY(0):
-	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
-	case XE_PMU_MEDIA_GROUP_BUSY(0):
+	case DRM_XE_PMU_RENDER_GROUP_BUSY(0):
+	case DRM_XE_PMU_COPY_GROUP_BUSY(0):
+	case DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
+	case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
 		val = engine_group_busyness_read(gt, config);
 		break;
 	default:
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5365331e452c..ab9c061784c7 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -261,7 +261,7 @@ static int query_memory_usage(struct xe_device *xe,
 		return -ENOMEM;
 
 	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
-	usage->regions[0].mem_class = XE_MEM_REGION_CLASS_SYSMEM;
+	usage->regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
 	usage->regions[0].instance = 0;
 	usage->regions[0].min_page_size = PAGE_SIZE;
 	usage->regions[0].total_size = man->size << PAGE_SHIFT;
@@ -273,7 +273,7 @@ static int query_memory_usage(struct xe_device *xe,
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man) {
 			usage->regions[usage->num_regions].mem_class =
-				XE_MEM_REGION_CLASS_VRAM;
+				DRM_XE_MEM_REGION_CLASS_VRAM;
 			usage->regions[usage->num_regions].instance =
 				usage->num_regions;
 			usage->regions[usage->num_regions].min_page_size =
@@ -305,7 +305,7 @@ static int query_memory_usage(struct xe_device *xe,
 
 static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 {
-#define XE_QUERY_CONFIG_NUM_PARAM	(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
+#define XE_QUERY_CONFIG_NUM_PARAM	(DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	size_t size =
 		sizeof(struct drm_xe_query_config)
 		+ XE_QUERY_CONFIG_NUM_PARAM * sizeof(u64);
@@ -324,18 +324,18 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (!config)
 		return -ENOMEM;
 
-	config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
+	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
-		config->info[XE_QUERY_CONFIG_FLAGS] =
-			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
-	config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT] =
+		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
+			DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
+	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
-	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
-	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
-	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
+	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
+	config->info[DRM_XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
+	config->info[DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT] =
 		hweight_long(xe->info.mem_region_mask);
-	config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
+	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
 		xe_exec_queue_device_get_max_priority(xe);
 
 	if (copy_to_user(query_ptr, config, size)) {
@@ -371,11 +371,11 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 	gt_list->num_gt = xe->info.gt_count;
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
-			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MEDIA;
+			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
 		else if (gt_to_tile(gt)->id > 0)
-			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_REMOTE;
+			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_REMOTE;
 		else
-			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MAIN;
+			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
 		gt_list->gt_list[id].gt_id = gt->info.id;
 		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
@@ -473,21 +473,21 @@ static int query_gt_topology(struct xe_device *xe,
 	for_each_gt(gt, xe, id) {
 		topo.gt_id = id;
 
-		topo.type = XE_TOPO_DSS_GEOMETRY;
+		topo.type = DRM_XE_TOPO_DSS_GEOMETRY;
 		query_ptr = copy_mask(query_ptr, &topo,
 				      gt->fuse_topo.g_dss_mask,
 				      sizeof(gt->fuse_topo.g_dss_mask));
 		if (IS_ERR(query_ptr))
 			return PTR_ERR(query_ptr);
 
-		topo.type = XE_TOPO_DSS_COMPUTE;
+		topo.type = DRM_XE_TOPO_DSS_COMPUTE;
 		query_ptr = copy_mask(query_ptr, &topo,
 				      gt->fuse_topo.c_dss_mask,
 				      sizeof(gt->fuse_topo.c_dss_mask));
 		if (IS_ERR(query_ptr))
 			return PTR_ERR(query_ptr);
 
-		topo.type = XE_TOPO_EU_PER_DSS;
+		topo.type = DRM_XE_TOPO_EU_PER_DSS;
 		query_ptr = copy_mask(query_ptr, &topo,
 				      gt->fuse_topo.eu_mask_per_dss,
 				      sizeof(gt->fuse_topo.eu_mask_per_dss));
@@ -519,7 +519,7 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 		return -EINVAL;
 
 	switch (resp.uc_type) {
-	case XE_QUERY_UC_TYPE_GUC: {
+	case DRM_XE_QUERY_UC_TYPE_GUC: {
 		struct xe_guc *guc = &xe->tiles[0].primary_gt->uc.guc;
 
 		resp.major_ver = guc->submission_state.version.major;
@@ -528,7 +528,7 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 		resp.branch_ver = 0;
 		break;
 	}
-	case XE_QUERY_UC_TYPE_HUC: {
+	case DRM_XE_QUERY_UC_TYPE_HUC: {
 		struct xe_huc *huc = &xe->tiles[0].primary_gt->uc.huc;
 
 		resp.major_ver = huc->fw.major_ver_found;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 971206264d94..8758d2d140df 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2176,8 +2176,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	       (ULL)bo_offset_or_userptr);
 
 	switch (operation) {
-	case XE_VM_BIND_OP_MAP:
-	case XE_VM_BIND_OP_MAP_USERPTR:
+	case DRM_XE_VM_BIND_OP_MAP:
+	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
 		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
 						  obj, bo_offset_or_userptr);
 		if (IS_ERR(ops))
@@ -2188,13 +2188,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
 			op->tile_mask = tile_mask;
 			op->map.immediate =
-				flags & XE_VM_BIND_FLAG_IMMEDIATE;
+				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
 			op->map.read_only =
-				flags & XE_VM_BIND_FLAG_READONLY;
-			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
+				flags & DRM_XE_VM_BIND_FLAG_READONLY;
+			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 		}
 		break;
-	case XE_VM_BIND_OP_UNMAP:
+	case DRM_XE_VM_BIND_OP_UNMAP:
 		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
 		if (IS_ERR(ops))
 			return ops;
@@ -2205,7 +2205,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->tile_mask = tile_mask;
 		}
 		break;
-	case XE_VM_BIND_OP_PREFETCH:
+	case DRM_XE_VM_BIND_OP_PREFETCH:
 		ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
 		if (IS_ERR(ops))
 			return ops;
@@ -2217,7 +2217,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->prefetch.region = region;
 		}
 		break;
-	case XE_VM_BIND_OP_UNMAP_ALL:
+	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
 		xe_assert(vm->xe, bo);
 
 		err = xe_bo_lock(bo, true);
@@ -2810,13 +2810,13 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 #ifdef TEST_VM_ASYNC_OPS_ERROR
 #define SUPPORTED_FLAGS	\
-	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
-	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
-	 XE_VM_BIND_FLAG_NULL | 0xffff)
+	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_ASYNC | \
+	 DRM_XE_VM_BIND_FLAG_READONLY | DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
+	 DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
 #else
 #define SUPPORTED_FLAGS	\
-	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
-	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | \
+	(DRM_XE_VM_BIND_FLAG_ASYNC | DRM_XE_VM_BIND_FLAG_READONLY | \
+	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
 	 0xffff)
 #endif
 #define XE_64K_PAGE_MASK 0xffffull
@@ -2864,45 +2864,45 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u32 obj = (*bind_ops)[i].obj;
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 region = (*bind_ops)[i].region;
-		bool is_null = flags & XE_VM_BIND_FLAG_NULL;
+		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 
 		if (i == 0) {
-			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
+			*async = !!(flags & DRM_XE_VM_BIND_FLAG_ASYNC);
 			if (XE_IOCTL_DBG(xe, !*async && args->num_syncs)) {
 				err = -EINVAL;
 				goto free_bind_ops;
 			}
 		} else if (XE_IOCTL_DBG(xe, *async !=
-					!!(flags & XE_VM_BIND_FLAG_ASYNC))) {
+					!!(flags & DRM_XE_VM_BIND_FLAG_ASYNC))) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
-		if (XE_IOCTL_DBG(xe, op > XE_VM_BIND_OP_PREFETCH) ||
+		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
 		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
-		    XE_IOCTL_DBG(xe, op != XE_VM_BIND_OP_MAP &&
+		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
 				 is_null) ||
 		    XE_IOCTL_DBG(xe, !obj &&
-				 op == XE_VM_BIND_OP_MAP &&
+				 op == DRM_XE_VM_BIND_OP_MAP &&
 				 !is_null) ||
 		    XE_IOCTL_DBG(xe, !obj &&
-				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, addr &&
-				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, range &&
-				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 op == XE_VM_BIND_OP_MAP_USERPTR) ||
+				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 op == XE_VM_BIND_OP_PREFETCH) ||
+				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, region &&
-				 op != XE_VM_BIND_OP_PREFETCH) ||
+				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, !(BIT(region) &
 				       xe->info.mem_region_mask)) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 op == XE_VM_BIND_OP_UNMAP)) {
+				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
@@ -2911,7 +2911,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, !range &&
-				 op != XE_VM_BIND_OP_UNMAP_ALL)) {
+				 op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm_doc.h b/drivers/gpu/drm/xe/xe_vm_doc.h
index b1b2dc4a6089..516f4dc97223 100644
--- a/drivers/gpu/drm/xe/xe_vm_doc.h
+++ b/drivers/gpu/drm/xe/xe_vm_doc.h
@@ -32,9 +32,9 @@
  * Operations
  * ----------
  *
- * XE_VM_BIND_OP_MAP		- Create mapping for a BO
- * XE_VM_BIND_OP_UNMAP		- Destroy mapping for a BO / userptr
- * XE_VM_BIND_OP_MAP_USERPTR	- Create mapping for userptr
+ * DRM_XE_VM_BIND_OP_MAP		- Create mapping for a BO
+ * DRM_XE_VM_BIND_OP_UNMAP		- Destroy mapping for a BO / userptr
+ * DRM_XE_VM_BIND_OP_MAP_USERPTR	- Create mapping for userptr
  *
  * Implementation details
  * ~~~~~~~~~~~~~~~~~~~~~~
@@ -113,7 +113,7 @@
  * VM uses to report errors to. The ufence wait interface can be used to wait on
  * a VM going into an error state. Once an error is reported the VM's async
  * worker is paused. While the VM's async worker is paused sync,
- * XE_VM_BIND_OP_UNMAP operations are allowed (this can free memory). Once the
+ * DRM_XE_VM_BIND_OP_UNMAP operations are allowed (this can free memory). Once the
  * uses believe the error state is fixed, the async worker can be resumed via
  * XE_VM_BIND_OP_RESTART operation. When VM async bind work is restarted, the
  * first operation processed is the operation that caused the original error.
@@ -193,7 +193,7 @@
  * In a VM is in fault mode (TODO: link to fault mode), new bind operations that
  * create mappings are by default are deferred to the page fault handler (first
  * use). This behavior can be overriden by setting the flag
- * XE_VM_BIND_FLAG_IMMEDIATE which indicates to creating the mapping
+ * DRM_XE_VM_BIND_FLAG_IMMEDIATE which indicates to creating the mapping
  * immediately.
  *
  * User pointer
@@ -322,7 +322,7 @@
  *
  * By default, on a faulting VM binds just allocate the VMA and the actual
  * updating of the page tables is defered to the page fault handler. This
- * behavior can be overridden by setting the flag XE_VM_BIND_FLAG_IMMEDIATE in
+ * behavior can be overridden by setting the flag DRM_XE_VM_BIND_FLAG_IMMEDIATE in
  * the VM bind which will then do the bind immediately.
  *
  * Page fault handler
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 0ef7d483d050..72d051ecac5c 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -19,10 +19,10 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
 {
 	int i, err;
 
-	if (XE_IOCTL_DBG(xe, value > XE_MEM_REGION_CLASS_VRAM))
+	if (XE_IOCTL_DBG(xe, value > DRM_XE_MEM_REGION_CLASS_VRAM))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, value == XE_MEM_REGION_CLASS_VRAM &&
+	if (XE_IOCTL_DBG(xe, value == DRM_XE_MEM_REGION_CLASS_VRAM &&
 			 !xe->info.is_dgfx))
 		return -EINVAL;
 
@@ -75,10 +75,10 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
 	u32 gt_id = upper_32_bits(value);
 	u32 mem_class = lower_32_bits(value);
 
-	if (XE_IOCTL_DBG(xe, mem_class > XE_MEM_REGION_CLASS_VRAM))
+	if (XE_IOCTL_DBG(xe, mem_class > DRM_XE_MEM_REGION_CLASS_VRAM))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, mem_class == XE_MEM_REGION_CLASS_VRAM &&
+	if (XE_IOCTL_DBG(xe, mem_class == DRM_XE_MEM_REGION_CLASS_VRAM &&
 			 !xe->info.is_dgfx))
 		return -EINVAL;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b3dcd7c6f2e5..6a6f47d329c2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -19,12 +19,12 @@ extern "C" {
 /**
  * DOC: uevent generated by xe on it's pci node.
  *
- * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
+ * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
  * fails. The value supplied with the event is always "NEEDS_RESET".
  * Additional information supplied is tile id and gt id of the gt unit for
  * which reset has failed.
  */
-#define XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
+#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
 
 /**
  * struct xe_user_extension - Base class for defining a chain of extensions
@@ -103,8 +103,8 @@ struct xe_user_extension {
 #define DRM_XE_VM_CREATE		0x03
 #define DRM_XE_VM_DESTROY		0x04
 #define DRM_XE_VM_BIND			0x05
-#define DRM_XE_EXEC_QUEUE_CREATE		0x06
-#define DRM_XE_EXEC_QUEUE_DESTROY		0x07
+#define DRM_XE_EXEC_QUEUE_CREATE	0x06
+#define DRM_XE_EXEC_QUEUE_DESTROY	0x07
 #define DRM_XE_EXEC			0x08
 #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
@@ -150,14 +150,14 @@ struct drm_xe_engine_class_instance {
  * enum drm_xe_memory_class - Supported memory classes.
  */
 enum drm_xe_memory_class {
-	/** @XE_MEM_REGION_CLASS_SYSMEM: Represents system memory. */
-	XE_MEM_REGION_CLASS_SYSMEM = 0,
+	/** @DRM_XE_MEM_REGION_CLASS_SYSMEM: Represents system memory. */
+	DRM_XE_MEM_REGION_CLASS_SYSMEM = 0,
 	/**
-	 * @XE_MEM_REGION_CLASS_VRAM: On discrete platforms, this
+	 * @DRM_XE_MEM_REGION_CLASS_VRAM: On discrete platforms, this
 	 * represents the memory that is local to the device, which we
 	 * call VRAM. Not valid on integrated platforms.
 	 */
-	XE_MEM_REGION_CLASS_VRAM
+	DRM_XE_MEM_REGION_CLASS_VRAM
 };
 
 /**
@@ -217,7 +217,7 @@ struct drm_xe_query_mem_region {
 	 * always equal the @total_size, since all of it will be CPU
 	 * accessible.
 	 *
-	 * Note this is only tracked for XE_MEM_REGION_CLASS_VRAM
+	 * Note this is only tracked for DRM_XE_MEM_REGION_CLASS_VRAM
 	 * regions (for other types the value here will always equal
 	 * zero).
 	 */
@@ -229,7 +229,7 @@ struct drm_xe_query_mem_region {
 	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
 	 * accounting. Without this the value here will always equal
 	 * zero.  Note this is only currently tracked for
-	 * XE_MEM_REGION_CLASS_VRAM regions (for other types the value
+	 * DRM_XE_MEM_REGION_CLASS_VRAM regions (for other types the value
 	 * here will always be zero).
 	 */
 	__u64 cpu_visible_used;
@@ -322,36 +322,36 @@ struct drm_xe_query_config {
 	 * Device ID (lower 16 bits) and the device revision (next
 	 * 8 bits)
 	 */
-#define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
+#define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID		0
 	/*
 	 * Flags describing the device configuration, see list below
 	 */
-#define XE_QUERY_CONFIG_FLAGS			1
+#define DRM_XE_QUERY_CONFIG_FLAGS			1
 	/*
 	 * Flag is set if the device has usable VRAM
 	 */
-	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM	(0x1 << 0)
 	/*
 	 * Minimal memory alignment required by this device,
 	 * typically SZ_4K or SZ_64K
 	 */
-#define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
+#define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 	/*
 	 * Maximum bits of a virtual address
 	 */
-#define XE_QUERY_CONFIG_VA_BITS			3
+#define DRM_XE_QUERY_CONFIG_VA_BITS			3
 	/*
 	 * Total number of GTs for the entire device
 	 */
-#define XE_QUERY_CONFIG_GT_COUNT		4
+#define DRM_XE_QUERY_CONFIG_GT_COUNT			4
 	/*
 	 * Total number of accessible memory regions
 	 */
-#define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
+#define DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT		5
 	/*
 	 * Value of the highest available exec queue priority
 	 */
-#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
@@ -365,9 +365,9 @@ struct drm_xe_query_config {
  * implementing graphics and/or media operations.
  */
 struct drm_xe_query_gt {
-#define XE_QUERY_GT_TYPE_MAIN		0
-#define XE_QUERY_GT_TYPE_REMOTE		1
-#define XE_QUERY_GT_TYPE_MEDIA		2
+#define DRM_XE_QUERY_GT_TYPE_MAIN		0
+#define DRM_XE_QUERY_GT_TYPE_REMOTE		1
+#define DRM_XE_QUERY_GT_TYPE_MEDIA		2
 	/** @type: GT type: Main, Remote, or Media */
 	__u16 type;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
@@ -432,7 +432,7 @@ struct drm_xe_query_topology_mask {
 	 *   DSS_GEOMETRY    ff ff ff ff 00 00 00 00
 	 * means 32 DSS are available for geometry.
 	 */
-#define XE_TOPO_DSS_GEOMETRY	(1 << 0)
+#define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
 	/*
 	 * To query the mask of Dual Sub Slices (DSS) available for compute
 	 * operations. For example a query response containing the following
@@ -440,7 +440,7 @@ struct drm_xe_query_topology_mask {
 	 *   DSS_COMPUTE    ff ff ff ff 00 00 00 00
 	 * means 32 DSS are available for compute.
 	 */
-#define XE_TOPO_DSS_COMPUTE	(1 << 1)
+#define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
 	/*
 	 * To query the mask of Execution Units (EU) available per Dual Sub
 	 * Slices (DSS). For example a query response containing the following
@@ -448,7 +448,7 @@ struct drm_xe_query_topology_mask {
 	 *   EU_PER_DSS    ff ff 00 00 00 00 00 00
 	 * means each DSS has 16 EU.
 	 */
-#define XE_TOPO_EU_PER_DSS	(1 << 2)
+#define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
 	/** @type: type of mask */
 	__u16 type;
 
@@ -467,8 +467,8 @@ struct drm_xe_query_topology_mask {
  */
 struct drm_xe_query_uc_fw_version {
 	/** @uc: The micro-controller type to query firmware version */
-#define XE_QUERY_UC_TYPE_GUC 0
-#define XE_QUERY_UC_TYPE_HUC 1
+#define DRM_XE_QUERY_UC_TYPE_GUC	0
+#define DRM_XE_QUERY_UC_TYPE_HUC	1
 	__u16 uc_type;
 
 	/** @pad: MBZ */
@@ -572,8 +572,8 @@ struct drm_xe_gem_create {
 	 */
 	__u64 size;
 
-#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
-#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
+#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(0x1 << 24)
+#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(0x1 << 25)
 /*
  * When using VRAM as a possible placement, ensure that the corresponding VRAM
  * allocation will always use the CPU accessible part of VRAM. This is important
@@ -589,7 +589,7 @@ struct drm_xe_gem_create {
  * display surfaces, therefore the kernel requires setting this flag for such
  * objects, otherwise an error is thrown on small-bar systems.
  */
-#define XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
+#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
@@ -656,14 +656,14 @@ struct drm_xe_ext_set_property {
 };
 
 struct drm_xe_vm_create {
-#define XE_VM_EXTENSION_SET_PROPERTY	0
+#define DRM_XE_VM_EXTENSION_SET_PROPERTY	0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
-#define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
-#define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
-#define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
+#define DRM_XE_VM_CREATE_SCRATCH_PAGE		(0x1 << 0)
+#define DRM_XE_VM_CREATE_COMPUTE_MODE		(0x1 << 1)
+#define DRM_XE_VM_CREATE_ASYNC_DEFAULT		(0x1 << 2)
+#define DRM_XE_VM_CREATE_FAULT_MODE		(0x1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -722,29 +722,29 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u64 tile_mask;
 
-#define XE_VM_BIND_OP_MAP		0x0
-#define XE_VM_BIND_OP_UNMAP		0x1
-#define XE_VM_BIND_OP_MAP_USERPTR	0x2
-#define XE_VM_BIND_OP_UNMAP_ALL		0x3
-#define XE_VM_BIND_OP_PREFETCH		0x4
+#define DRM_XE_VM_BIND_OP_MAP		0x0
+#define DRM_XE_VM_BIND_OP_UNMAP		0x1
+#define DRM_XE_VM_BIND_OP_MAP_USERPTR	0x2
+#define DRM_XE_VM_BIND_OP_UNMAP_ALL	0x3
+#define DRM_XE_VM_BIND_OP_PREFETCH	0x4
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
-#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 1)
+#define DRM_XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
+#define DRM_XE_VM_BIND_FLAG_ASYNC	(0x1 << 1)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than deferring the MAP to the page fault handler.
 	 */
-#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
 	/*
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
-	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
+	 * the future, the NULL flags will only be valid for DRM_XE_VM_BIND_OP_MAP
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
-#define XE_VM_BIND_FLAG_NULL		(0x1 << 3)
+#define DRM_XE_VM_BIND_FLAG_NULL	(0x1 << 3)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -811,14 +811,14 @@ struct drm_xe_exec_queue_set_property {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
 
-#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
-#define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
-#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		7
 	/** @property: property to set */
 	__u32 property;
 
@@ -830,7 +830,7 @@ struct drm_xe_exec_queue_set_property {
 };
 
 struct drm_xe_exec_queue_create {
-#define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
+#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -869,7 +869,7 @@ struct drm_xe_exec_queue_get_property {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
 
-#define XE_EXEC_QUEUE_GET_PROPERTY_BAN			0
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN	0
 	/** @property: property to get */
 	__u32 property;
 
@@ -1058,8 +1058,8 @@ struct drm_xe_vm_madvise {
 	 * For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum
 	 * drm_xe_memory_class.
 	 */
-#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS	0
-#define DRM_XE_VM_MADVISE_PREFERRED_GT		1
+#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS		0
+#define DRM_XE_VM_MADVISE_PREFERRED_GT			1
 	/*
 	 * In this case lower 32 bits are mem class, upper 32 are GT.
 	 * Combination provides a single IOCTL plus migrate VMA to preferred
@@ -1070,25 +1070,25 @@ struct drm_xe_vm_madvise {
 	 * The CPU will do atomic memory operations to this VMA. Must be set on
 	 * some devices for atomics to behave correctly.
 	 */
-#define DRM_XE_VM_MADVISE_CPU_ATOMIC		3
+#define DRM_XE_VM_MADVISE_CPU_ATOMIC			3
 	/*
 	 * The device will do atomic memory operations to this VMA. Must be set
 	 * on some devices for atomics to behave correctly.
 	 */
-#define DRM_XE_VM_MADVISE_DEVICE_ATOMIC		4
+#define DRM_XE_VM_MADVISE_DEVICE_ATOMIC			4
 	/*
 	 * Priority WRT to eviction (moving from preferred memory location due
 	 * to memory pressure). The lower the priority, the more likely to be
 	 * evicted.
 	 */
-#define DRM_XE_VM_MADVISE_PRIORITY		5
-#define		DRM_XE_VMA_PRIORITY_LOW		0
+#define DRM_XE_VM_MADVISE_PRIORITY			5
+#define		DRM_XE_VMA_PRIORITY_LOW			0
 		/* Default */
-#define		DRM_XE_VMA_PRIORITY_NORMAL	1
+#define		DRM_XE_VMA_PRIORITY_NORMAL		1
 		/* Must be user with elevated privileges */
-#define		DRM_XE_VMA_PRIORITY_HIGH	2
+#define		DRM_XE_VMA_PRIORITY_HIGH		2
 	/* Pin the VMA in memory, must be user with elevated privileges */
-#define DRM_XE_VM_MADVISE_PIN			6
+#define DRM_XE_VM_MADVISE_PIN				6
 	/** @property: property to set */
 	__u32 property;
 
@@ -1109,7 +1109,7 @@ struct drm_xe_vm_madvise {
  * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
  * particular event.
  *
- * For example to open the XE_PMU_INTERRUPTS(0):
+ * For example to open the DRM_XE_PMU_INTERRUPTS(0):
  *
  * .. code-block:: C
  *
@@ -1123,7 +1123,7 @@ struct drm_xe_vm_madvise {
  *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
  *	attr.use_clockid = 1;
  *	attr.clockid = CLOCK_MONOTONIC;
- *	attr.config = XE_PMU_INTERRUPTS(0);
+ *	attr.config = DRM_XE_PMU_INTERRUPTS(0);
  *
  *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
  */
@@ -1136,11 +1136,11 @@ struct drm_xe_vm_madvise {
 #define ___XE_PMU_OTHER(gt, x) \
 	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
 
-#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
-#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
-#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
-#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
-#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
+#define DRM_XE_PMU_INTERRUPTS(gt)		___XE_PMU_OTHER(gt, 0)
+#define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 1)
+#define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
+#define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
+#define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
 
 #if defined(__cplusplus)
 }
-- 
2.34.1

