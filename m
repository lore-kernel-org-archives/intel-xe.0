Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AD7E77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 10:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E710010E5FB;
	Mon,  6 Jan 2025 10:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYwQWBL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A6110E5FB
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736157981; x=1767693981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GkMahvUICVCqhzhIZ3g9saFMPtO8KusTK1jCNTWIOpA=;
 b=IYwQWBL1++mws06L92i201eDY0BdU++MCeBrxQYJ4W+ZEA8QELtVyWad
 PmbhfJWsUaO0+QQKSQVI2vP9BBdJajwLofWTXC+IMWedmfKw/lMeJsfh1
 /ALI1pS6YSTfOwbc8z696Qve/QCeu1GiaABF1ua+uSslU8A2YEV7BLcJa
 gUqRTHg5Gq/w2SV5FPb6WyG9q/91Q8f2Mrijq3DVc+LGNr6qU8RnN/9On
 7XKiu761Emf4VyOmBD3jHo94LpmWl1V4ZCZQKDmP6HbBxYct7ht8xw51C
 itaMZBTDf4lzYHz78zc6DVr/wdRu0vYY1Z5gsb7MGjgsZ4F12KR8+HC6F g==;
X-CSE-ConnectionGUID: jJMlAOKDSPSbOzrPF2xjnA==
X-CSE-MsgGUID: l1ptgS6ERriCZPI9aeZzWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36179032"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="36179032"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 02:06:21 -0800
X-CSE-ConnectionGUID: pKOfEQBMSVSiRFAJtK0y1w==
X-CSE-MsgGUID: b8QrYGp4RXukojKsjrrCzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="107460678"
Received: from nitin-super-server.iind.intel.com ([10.145.169.70])
 by orviesa003.jf.intel.com with ESMTP; 06 Jan 2025 02:06:19 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, andi.shyti@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1 1/1] drm/xe: Fix all typos in xe
Date: Mon,  6 Jan 2025 15:56:46 +0530
Message-Id: <20250106102646.1400146-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250106102646.1400146-1-nitin.r.gote@intel.com>
References: <20250106102646.1400146-1-nitin.r.gote@intel.com>
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

fix all typos in files of xe, reported by codespell tool.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug           | 4 ++--
 drivers/gpu/drm/xe/abi/guc_capture_abi.h   | 2 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h      | 6 +++---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h      | 2 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c         | 2 +-
 drivers/gpu/drm/xe/xe_bb.c                 | 2 +-
 drivers/gpu/drm/xe/xe_bo.c                 | 8 ++++----
 drivers/gpu/drm/xe/xe_bo_doc.h             | 2 +-
 drivers/gpu/drm/xe/xe_devcoredump.c        | 2 +-
 drivers/gpu/drm/xe/xe_device.c             | 2 +-
 drivers/gpu/drm/xe/xe_drm_client.c         | 2 +-
 drivers/gpu/drm/xe/xe_exec.c               | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 2 +-
 drivers/gpu/drm/xe/xe_gt.h                 | 2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c             | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 drivers/gpu/drm/xe/xe_guc_capture.c        | 2 +-
 drivers/gpu/drm/xe/xe_guc_capture_types.h  | 4 ++--
 drivers/gpu/drm/xe/xe_guc_ct.c             | 4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c         | 2 +-
 drivers/gpu/drm/xe/xe_hmm.c                | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c            | 2 +-
 drivers/gpu/drm/xe/xe_pci.c                | 4 ++--
 drivers/gpu/drm/xe/xe_pcode.c              | 2 +-
 drivers/gpu/drm/xe/xe_pm.c                 | 2 +-
 drivers/gpu/drm/xe/xe_pt.c                 | 2 +-
 drivers/gpu/drm/xe/xe_rtp.h                | 4 ++--
 drivers/gpu/drm/xe/xe_uc_fw_types.h        | 2 +-
 drivers/gpu/drm/xe/xe_vm.c                 | 4 ++--
 29 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 2de0de41b8dd..0d749ed44878 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -66,7 +66,7 @@ config DRM_XE_DEBUG_MEM
 	bool "Enable passing SYS/VRAM addresses to user space"
 	default n
 	help
-	  Pass object location trough uapi. Intended for extended
+	  Pass object location through uapi. Intended for extended
 	  testing and development only.
 
 	  Recommended for driver developers only.
@@ -104,5 +104,5 @@ config DRM_XE_USERPTR_INVAL_INJECT
          Choose this option when debugging error paths that
 	 are hit during checks for userptr invalidations.
 
-	 Recomended for driver developers only.
+	 Recommended for driver developers only.
 	 If in doubt, say "N".
diff --git a/drivers/gpu/drm/xe/abi/guc_capture_abi.h b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
index e7898edc6236..dd4117553739 100644
--- a/drivers/gpu/drm/xe/abi/guc_capture_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
@@ -25,7 +25,7 @@ enum guc_state_capture_type {
 
 #define GUC_STATE_CAPTURE_TYPE_MAX	(GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE + 1)
 
-/* Class indecies for capture_class and capture_instance arrays */
+/* Class indices for capture_class and capture_instance arrays */
 enum guc_capture_list_class_type {
 	GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
 	GUC_CAPTURE_LIST_CLASS_VIDEO = 1,
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 7dcb118e3d9f..d633f1c739e4 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -132,7 +132,7 @@ enum  {
  * _`GUC_KLV_VGT_POLICY_SCHED_IF_IDLE` : 0x8001
  *      This config sets whether strict scheduling is enabled whereby any VF
  *      that doesn’t have work to submit is still allocated a fixed execution
- *      time-slice to ensure active VFs execution is always consitent even
+ *      time-slice to ensure active VFs execution is always consistent even
  *      during other VF reprovisiong / rebooting events. Changing this KLV
  *      impacts all VFs and takes effect on the next VF-Switch event.
  *
@@ -207,7 +207,7 @@ enum  {
  *      of and this will never be perfectly-exact (accumulated nano-second
  *      granularity) since the GPUs clock time runs off a different crystal
  *      from the CPUs clock. Changing this KLV on a VF that is currently
- *      running a context wont take effect until a new context is scheduled in.
+ *      running a context won't take effect until a new context is scheduled in.
  *      That said, when the PF is changing this value from 0x0 to
  *      a non-zero value, it might never take effect if the VF is running an
  *      infinitely long compute or shader kernel. In such a scenario, the
@@ -227,7 +227,7 @@ enum  {
  *      HW is capable and this will never be perfectly-exact (accumulated
  *      nano-second granularity) since the GPUs clock time runs off a
  *      different crystal from the CPUs clock. Changing this KLV on a VF
- *      that is currently running a context wont take effect until a new
+ *      that is currently running a context won't take effect until a new
  *      context is scheduled in.
  *      That said, when the PF is changing this value from 0x0 to
  *      a non-zero value, it might never take effect if the VF is running an
diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 51fd40ffafcb..0eedd6c26b1b 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -13,7 +13,7 @@
 /**
  * struct xe_reg - Register definition
  *
- * Register defintion to be used by the individual register. Although the same
+ * Register definition to be used by the individual register. Although the same
  * definition is used for xe_reg and xe_reg_mcr, they use different internal
  * APIs for accesses.
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 6f9b7a266b41..d3f71d13eb81 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -58,7 +58,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 
 			mocs_dbg(gt, "reg_val=0x%x\n", reg_val);
 		} else {
-			/* Just re-use value read on previous iteration */
+			/* Just reuse value read on previous iteration */
 			reg_val >>= 16;
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index ef777dbdf4ec..9570672fce33 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -41,7 +41,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	/*
 	 * We need to allocate space for the requested number of dwords,
 	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
-	 * space to accomodate the platform-specific hardware prefetch
+	 * space to accommodate the platform-specific hardware prefetch
 	 * requirements.
 	 */
 	bb->bo = xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt->usm.bb_pool,
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e6c896ad5602..3f5391d416d4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -786,7 +786,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		 * / resume, some of the pinned memory is required for the
 		 * device to resume / use the GPU to move other evicted memory
 		 * (user memory) around. This likely could be optimized a bit
-		 * futher where we find the minimum set of pinned memory
+		 * further where we find the minimum set of pinned memory
 		 * required for resume but for simplity doing a memcpy for all
 		 * pinned memory.
 		 */
@@ -875,7 +875,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
  * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
  * @bo: The buffer object to move.
  *
- * On successful completion, the object memory will be moved to sytem memory.
+ * On successful completion, the object memory will be moved to system memory.
  *
  * This is needed to for special handling of pinned VRAM object during
  * suspend-resume.
@@ -1370,7 +1370,7 @@ static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 /**
  * xe_bo_alloc - Allocate storage for a struct xe_bo
  *
- * This funcition is intended to allocate storage to be used for input
+ * This function is intended to allocate storage to be used for input
  * to __xe_bo_create_locked(), in the case a pointer to the bo to be
  * created is needed before the call to __xe_bo_create_locked().
  * If __xe_bo_create_locked ends up never to be called, then the
@@ -2412,7 +2412,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
  * @force_alloc: Set force_alloc in ttm_operation_ctx
  *
  * On successful completion, the object memory will be moved to evict
- * placement. Ths function blocks until the object has been fully moved.
+ * placement. This function blocks until the object has been fully moved.
  *
  * Return: 0 on success. Negative error code on failure.
  */
diff --git a/drivers/gpu/drm/xe/xe_bo_doc.h b/drivers/gpu/drm/xe/xe_bo_doc.h
index f57d440cc95a..25a884c64bf1 100644
--- a/drivers/gpu/drm/xe/xe_bo_doc.h
+++ b/drivers/gpu/drm/xe/xe_bo_doc.h
@@ -41,7 +41,7 @@
  * created the BO can be mmap'd (via DRM_IOCTL_XE_GEM_MMAP_OFFSET) for user
  * access and it can be bound for GPU access (via DRM_IOCTL_XE_VM_BIND). All
  * user BOs are evictable and user BOs are never pinned by XE. The allocation of
- * the backing store can be defered from creation time until first use which is
+ * the backing store can be deferred from creation time until first use which is
  * either mmap, bind, or pagefault.
  *
  * Private BOs
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 6980304c8903..81dc7795c065 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -48,7 +48,7 @@
  *
  * **Coredump release**:
  *   After a coredump is generated, it stays in kernel memory until released by
- *   userpace by writing anything to it, or after an internal timer expires. The
+ *   userspace by writing anything to it, or after an internal timer expires. The
  *   exact timeout may vary and should not be relied upon. Example to release
  *   a coredump:
  *
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bf36e4fb4679..9d58c16c2dbf 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -999,7 +999,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
  *
- * This is a final state that can only be cleared with a mudule
+ * This is a final state that can only be cleared with a module
  * re-probe (unbind + bind).
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 7d55ad846bac..63f30b6df70b 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -385,7 +385,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
  * @p: The drm_printer ptr
  * @file: The drm_file ptr
  *
- * This is callabck for drm fdinfo interface. Register this callback
+ * This is callback for drm fdinfo interface. Register this callback
  * in drm driver ops for show_fdinfo.
  *
  * Return: void
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 31cca938956f..df8ce550deb4 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -33,7 +33,7 @@
  *
  * In XE we avoid all of this complication by not allowing a BO list to be
  * passed into an exec, using the dma-buf implicit sync uAPI, have binds as
- * seperate operations, and using the DRM scheduler to flow control the ring.
+ * separate operations, and using the DRM scheduler to flow control the ring.
  * Let's deep dive on each of these.
  *
  * We can get away from a BO list by forcing the user to use in / out fences on
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 05154f9de1a6..5fcb2b4c2c13 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -362,7 +362,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 
 	/*
 	 * So we don't need to worry about 64K GGTT layout when dealing with
-	 * scratch entires, rather keep the scratch page in system memory on
+	 * scratch entries, rather keep the scratch page in system memory on
 	 * platforms where 64K pages are needed for VRAM.
 	 */
 	flags = XE_BO_FLAG_PINNED;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 82b9b7f82fca..4e4e8e103419 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -37,7 +37,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
 
 /**
  * xe_gt_record_user_engines - save data related to engines available to
- * usersapce
+ * userspace
  * @gt: GT structure
  *
  * Walk the available HW engines from gt->info.engine_mask and calculate data
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 5013d674e17d..71485b96fc6f 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -371,7 +371,7 @@ void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group,
  * @group: steering group ID
  * @instance: steering instance ID
  *
- * Return: the coverted DSS id.
+ * Return: the converted DSS id.
  */
 u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 instance)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index bd621df3ab91..878e96281c03 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2161,7 +2161,7 @@ bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid)
  *
  * This function can only be called on PF.
  *
- * Return: mininum size of the buffer or the number of bytes saved,
+ * Return: minimum size of the buffer or the number of bytes saved,
  *         or a negative error code on failure.
  */
 ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 137571fae4ed..f6d523e4c5fe 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1955,7 +1955,7 @@ xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
 }
 
 /*
- * xe_guc_capture_put_matched_nodes - Cleanup macthed nodes
+ * xe_guc_capture_put_matched_nodes - Cleanup matched nodes
  * @guc: The GuC object
  *
  * Free matched node and all nodes with the equal guc_id from
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
index 2057125b1bfa..ca2d390ccbee 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
@@ -22,7 +22,7 @@ enum capture_register_data_type {
  * struct __guc_mmio_reg_descr - GuC mmio register descriptor
  *
  * xe_guc_capture module uses these structures to define a register
- * (offsets, names, flags,...) that are used at the ADS regisration
+ * (offsets, names, flags,...) that are used at the ADS registration
  * time as well as during runtime processing and reporting of error-
  * capture states generated by GuC just prior to engine reset events.
  */
@@ -48,7 +48,7 @@ struct __guc_mmio_reg_descr {
  *
  * xe_guc_capture module uses these structures to maintain static
  * tables (per unique platform) that consists of lists of registers
- * (offsets, names, flags,...) that are used at the ADS regisration
+ * (offsets, names, flags,...) that are used at the ADS registration
  * time as well as during runtime processing and reporting of error-
  * capture states generated by GuC just prior to engine reset events.
  */
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d33f3a11e61..8b65c5e959cc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -710,7 +710,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	--len;
 	++action;
 
-	/* Write H2G ensuring visable before descriptor update */
+	/* Write H2G ensuring visible before descriptor update */
 	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
 	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
 	xe_device_wmb(xe);
@@ -1383,7 +1383,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 		 * this function and nowhere else. Hence, they cannot be different
 		 * unless two g2h_read calls are running concurrently. Which is not
 		 * possible because it is guarded by ct->fast_lock. And yet, some
-		 * discrete platforms are reguarly hitting this error :(.
+		 * discrete platforms are regularly hitting this error :(.
 		 *
 		 * desc_head rolling backwards shouldn't cause any noticeable
 		 * problems - just a delay in GuC being allowed to proceed past that
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9c36329fe857..913c74d6e2ae 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1226,7 +1226,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	enable_scheduling(q);
 rearm:
 	/*
-	 * XXX: Ideally want to adjust timeout based on current exection time
+	 * XXX: Ideally want to adjust timeout based on current execution time
 	 * but there is not currently an easy way to do in DRM scheduler. With
 	 * some thought, do this in a follow up.
 	 */
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 2c32dc46f7d4..089834467880 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -159,7 +159,7 @@ void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
  * This function allocates the storage of the userptr sg table.
  * It is caller's responsibility to free it calling sg_free_table.
  *
- * returns: 0 for succuss; negative error no on failure
+ * returns: 0 for success; negative error no on failure
  */
 int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
 				  bool is_mm_mmap_locked)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1b97d90aadda..278bc96cf593 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1506,7 +1506,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
  * using the default engine for the updates, they will be performed in the
  * order they grab the job_mutex. If different engines are used, external
  * synchronization is needed for overlapping updates to maintain page-table
- * consistency. Note that the meaing of "overlapping" is that the updates
+ * consistency. Note that the meaning of "overlapping" is that the updates
  * touch the same page-table, which might be a higher-level page-directory.
  * If no pipelining is needed, then updates may be performed by the cpu.
  *
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7d146e3e8e21..ee9727f5fd47 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -495,7 +495,7 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 		 * least basic xe_gt and xe_guc initialization.
 		 *
 		 * Since to obtain the value of GMDID_MEDIA we need to use the
-		 * media GuC, temporarly tweak the gt type.
+		 * media GuC, temporarily tweak the gt type.
 		 */
 		xe_gt_assert(gt, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
 
@@ -786,7 +786,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
  * error injectable functions is proper handling of the error code by the
  * caller for recovery, which is always the case here. The second
  * requirement is that no state is changed before the first error return.
- * It is not strictly fullfilled for all initialization functions using the
+ * It is not strictly fulfilled for all initialization functions using the
  * ALLOW_ERROR_INJECTION() macro but this is acceptable because for those
  * error cases at probe time, the error code is simply propagated up by the
  * caller. Therefore there is no consequence on those specific callers when
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index d95d9835de42..9333ce776a6e 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -217,7 +217,7 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
  *
  * It returns 0 on success, and -ERROR number on failure, -EINVAL if max
  * frequency is higher then the minimal, and other errors directly translated
- * from the PCODE Error returs:
+ * from the PCODE Error returns:
  * - -ENXIO: "Illegal Command"
  * - -ETIMEDOUT: "Timed out"
  * - -EINVAL: "Illegal Data"
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c6e57af0144c..c9cc0c091dfd 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -391,7 +391,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
-	 * also checks and delets bo entry from user fault list.
+	 * also checks and deletes bo entry from user fault list.
 	 */
 	mutex_lock(&xe->mem_access.vram_userfault.lock);
 	list_for_each_entry_safe(bo, on,
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 65c3c1688710..1ddcc7e79a93 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -276,7 +276,7 @@ struct xe_pt_stage_bind_walk {
 	/* Also input, but is updated during the walk*/
 	/** @curs: The DMA address cursor. */
 	struct xe_res_cursor *curs;
-	/** @va_curs_start: The Virtual address coresponding to @curs->start */
+	/** @va_curs_start: The Virtual address corresponding to @curs->start */
 	u64 va_curs_start;
 
 	/* Output */
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 827d932b6908..986e588a7e8c 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -131,7 +131,7 @@ struct xe_reg_sr;
  * @ver_end__: Last graphics IP version to match
  *
  * Note that the range matching this rule is [ @ver_start__, @ver_end__ ], i.e.
- * inclusive on boths sides
+ * inclusive on both sides
  *
  * Refer to XE_RTP_RULES() for expected usage.
  */
@@ -169,7 +169,7 @@ struct xe_reg_sr;
  * @ver_end__: Last media IP version to match
  *
  * Note that the range matching this rule is [ @ver_start__, @ver_end__ ], i.e.
- * inclusive on boths sides
+ * inclusive on both sides
  *
  * Refer to XE_RTP_RULES() for expected usage.
  */
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 0d8caa0e7354..ad3b35a0e6eb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -92,7 +92,7 @@ struct xe_uc_fw {
 		const enum xe_uc_fw_status status;
 		/**
 		 * @__status: private firmware load status - only to be used
-		 * by firmware laoding code
+		 * by firmware loading code
 		 */
 		enum xe_uc_fw_status __status;
 	};
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b4a44e1ea167..690330352d4c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1024,7 +1024,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 
 		/*
 		 * Since userptr pages are not pinned, we can't remove
-		 * the notifer until we're sure the GPU is not accessing
+		 * the notifier until we're sure the GPU is not accessing
 		 * them anymore
 		 */
 		mmu_interval_notifier_remove(&userptr->notifier);
@@ -2107,7 +2107,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 			}
 		}
 
-		/* Adjust for partial unbind after removin VMA from VM */
+		/* Adjust for partial unbind after removing VMA from VM */
 		if (!err) {
 			op->base.remap.unmap->va->va.addr = op->remap.start;
 			op->base.remap.unmap->va->va.range = op->remap.range;
-- 
2.25.1

