Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A3ACA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE9510E8BD;
	Wed, 27 Aug 2025 20:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5AUP2ek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2970710E8B9
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756326975; x=1787862975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x5g9UJ6y1wvIFJsxiOM5OQ5kpmpb1ItCwnXYzhh0UZE=;
 b=S5AUP2ekcAVz7yQgqv5PKocOQzjM9fIWVnAN7/k8hJ4e6FfQB2EDwhP0
 8rvQmRle5lj/fHi0uxLKQhZmZZdYuPwwkY503gYmkxAwLHUP6pHLVEku9
 MwVQY6KdfkYKuB2KCJQAjFJWgYMyTyeIG/1SPtM+kjHTm3+2ozd1ZJU+q
 j+1XORu9NR7EgTj5IfUUBx7MboNq/sBjopyUYs4SpDtCN1NSG5hTRRY6l
 bYqCwsgpeoxBGW5Qqb1oom0jpitDpvPYX5p1EZARuCI8Y/yl7tAJUb8Ob
 MEqdM8v0r+lViyaonlTZaKo1wnCxtp3UIGyvgkQnSUz0DxOecSXyVt/Wx Q==;
X-CSE-ConnectionGUID: TwThf0METXSThdL3DmnNMg==
X-CSE-MsgGUID: EFE7LPB5R36W4gJEqYrkfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62425794"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62425794"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:36:14 -0700
X-CSE-ConnectionGUID: dUSN/PeKT/2sFsWfUop5HQ==
X-CSE-MsgGUID: gdVfgb+9Qj2LuwMD6IAo0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="200827925"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:36:14 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v6 1/3] drm/xe: Add error_injectable define
Date: Wed, 27 Aug 2025 20:36:14 +0000
Message-ID: <20250827203612.119748-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827203612.119748-5-jonathan.cavitt@intel.com>
References: <20250827203612.119748-5-jonathan.cavitt@intel.com>
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

Add a declaration for the function attribute "error_injectable", which
appends noinline to functions tagged with ALLOW_ERROR_INJECTION only if
CONFIG_FUNCTION_ERROR_INJECTION is enabled.

error_injectable is a function attribute that is applied to
all functions that have ALLOW_ERROR_INJECTION enabled.  This
is necessary to ensure the compiler doesn't optimize the
target function into an inline function, as inline functions
cannot be injected with faults.  Adding the noinline attribute
prevents this issue, but it's not necessary to prevent inlining
if error injection is disabled, so error_injectable is only set
to noinline if error injection is enabled.

It's likely the case that not all functions with error
injection enabled need this additional security, but to be safe
(and for the sake of consistency), it's applied to all
ALLOW_ERROR_INJECTION functions.

v2:
- Move error_injectable from error-injection.h to xe_macros.h
  (Michal)
- Reformat function attribute application to minimize diff size (Brost)

v3: (Michal)
- Improve explanation for error_injectable
- Update Michal's name

v4: (Michal)
- Simplify comment

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c                |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c            |  2 ++
 drivers/gpu/drm/xe/xe_ggtt.c                  |  1 +
 drivers/gpu/drm/xe/xe_guc.c                   |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c               |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c                | 20 +++++--------------
 drivers/gpu/drm/xe/xe_guc_log.c               |  1 +
 drivers/gpu/drm/xe/xe_guc_relay.c             |  1 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine_group.c       |  1 +
 drivers/gpu/drm/xe/xe_macros.h                | 13 ++++++++++++
 drivers/gpu/drm/xe/xe_mmio.c                  |  1 +
 drivers/gpu/drm/xe/xe_oa.c                    |  1 +
 drivers/gpu/drm/xe/xe_pcode.c                 |  2 ++
 drivers/gpu/drm/xe/xe_pm.c                    |  1 +
 drivers/gpu/drm/xe/xe_pt.c                    |  3 +++
 drivers/gpu/drm/xe/xe_sriov.c                 |  2 ++
 drivers/gpu/drm/xe/xe_sync.c                  |  1 +
 drivers/gpu/drm/xe/xe_tile.c                  |  1 +
 drivers/gpu/drm/xe/xe_tuning.c                |  2 ++
 drivers/gpu/drm/xe/xe_uc_fw.c                 |  1 +
 drivers/gpu/drm/xe/xe_vm.c                    |  5 +++++
 drivers/gpu/drm/xe/xe_wa.c                    |  2 ++
 drivers/gpu/drm/xe/xe_wopcm.c                 |  1 +
 24 files changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9e4773a17ef8..8525e07cb676 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -417,6 +417,7 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+error_injectable
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
@@ -634,6 +635,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
 	return !!val;
 }
 
+error_injectable
 static int wait_for_lmem_ready(struct xe_device *xe)
 {
 	unsigned long timeout, start;
@@ -719,6 +721,7 @@ static int xe_device_vram_alloc(struct xe_device *xe)
  *
  * Return: 0 on success, error code on failure
  */
+error_injectable
 int xe_device_probe_early(struct xe_device *xe)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 063c89d981e5..1102ed690eb9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -199,6 +199,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	return err;
 }
 
+error_injectable
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
 					   u32 logical_mask, u16 width,
 					   struct xe_hw_engine *hwe, u32 flags,
@@ -282,6 +283,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
  *
  * Returns exec queue on success, ERR_PTR on failure
  */
+error_injectable
 struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 						struct xe_tile *tile,
 						u32 flags, u64 extensions)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 71c7690a92b3..f278a81792a5 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -256,6 +256,7 @@ static void dev_fini_ggtt(void *arg)
  *
  * Return: 0 on success or a negative error code on failure.
  */
+error_injectable
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 37d06c51180c..d2604bc0952d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1405,6 +1405,7 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
 }
 
+error_injectable
 int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			  u32 len, u32 *response_buf)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 5631722f34f5..5075c7bd2362 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -386,6 +386,7 @@ static int calculate_waklv_size(struct xe_guc_ads *ads)
 
 #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
 
+error_injectable
 int xe_guc_ads_init(struct xe_guc_ads *ads)
 {
 	struct xe_device *xe = ads_to_xe(ads);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 848065a25c44..2ec2cf622d21 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -213,6 +213,7 @@ static void primelockdep(struct xe_guc_ct *ct)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
+error_injectable
 int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
@@ -252,6 +253,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 }
 ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
 
+error_injectable
 int xe_guc_ct_init(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
@@ -1149,6 +1151,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
  *         DATA0 from `HXG Response`_ if &response_buffer was NULL, or
  *         a negative error code on failure.
  */
+error_injectable
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			u32 *response_buffer)
 {
@@ -2067,22 +2070,9 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 
-#ifdef CONFIG_FUNCTION_ERROR_INJECTION
-/*
- * This is a helper function which assists the driver in identifying if a fault
- * injection test is currently active, allowing it to reduce unnecessary debug
- * output. Typically, the function returns zero, but the fault injection
- * framework can alter this to return an error. Since faults are injected
- * through this function, it's important to ensure the compiler doesn't optimize
- * it into an inline function. To avoid such optimization, the 'noinline'
- * attribute is applied. Compiler optimizes the static function defined in the
- * header file as an inline function.
- */
-noinline int xe_is_injection_active(void) { return 0; }
-ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
-#else
+error_injectable
 int xe_is_injection_active(void) { return 0; }
-#endif
+ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
 
 static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index c01ccb35dc75..47973d914b2d 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -251,6 +251,7 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 	xe_guc_log_snapshot_free(snapshot);
 }
 
+error_injectable
 int xe_guc_log_init(struct xe_guc_log *log)
 {
 	struct xe_device *xe = log_to_xe(log);
diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index e5dc94f3e618..b2811de5b6a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -330,6 +330,7 @@ static void __fini_relay(struct drm_device *drm, void *arg)
  *
  * Return: 0 on success or a negative error code on failure.
  */
+error_injectable
 int xe_guc_relay_init(struct xe_guc_relay *relay)
 {
 	const int XE_RELAY_MEMPOOL_MIN_NUM = 1;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 640950172088..18a70f95f687 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -10,6 +10,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
+#include "xe_macros.h"
 #include "xe_pm.h"
 
 #define MAX_ENGINE_CLASS_NAME_LEN    16
@@ -580,6 +581,7 @@ static void hw_engine_class_defaults_fini(void *arg)
 	kobject_put(kobj);
 }
 
+error_injectable
 static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
 					   struct kobject *parent)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 58bee3ffe881..862237f4804d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -119,6 +119,7 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
  * Return: 0 on success,
  *	    -EINTR if the lock could not be acquired
  */
+error_injectable
 int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index 8a77c2423555..9bfb92ef95e4 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -19,4 +19,17 @@
 	cond__;								\
 })
 
+/*
+ * This function attribute should be used by all functions which are
+ * tagged as ALLOW_ERROR_INJECTION to ensure they will not be inlined
+ * by the compiler which would actually prevent an error injection.
+ *
+ * XXX: there is no regular "xe" prefix as we hope to promote this.
+ */
+#ifdef CONFIG_FUNCTION_ERROR_INJECTION
+#define error_injectable noinline
+#else
+#define error_injectable
+#endif
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ef6f3ea573a2..b65111702be1 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -90,6 +90,7 @@ static void mmio_fini(void *arg)
 	root_tile->mmio.regs = NULL;
 }
 
+error_injectable
 int xe_mmio_probe_early(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a188bad172ad..7b060a95508c 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2225,6 +2225,7 @@ static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
 		xe_oa_is_valid_mux_addr(oa, addr);
 }
 
+error_injectable
 static struct xe_oa_reg *
 xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
 		 u32 __user *regs, u32 n_regs)
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 6a7ddb9005f9..36275d491b8a 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -13,6 +13,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 
@@ -331,6 +332,7 @@ void xe_pcode_init(struct xe_tile *tile)
  *
  * Returns 0 on success, error code otherwise
  */
+error_injectable
 int xe_pcode_probe_early(struct xe_device *xe)
 {
 	return xe_pcode_ready(xe, false);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a2e85030b7f4..663cc9c74570 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -273,6 +273,7 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 	pm_runtime_put(dev);
 }
 
+error_injectable
 int xe_pm_init_early(struct xe_device *xe)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c129048a9a09..e1b2da20b881 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -99,6 +99,7 @@ static void xe_pt_free(struct xe_pt *pt)
  * Return: A valid struct xe_pt pointer on success, Pointer error code on
  * error.
  */
+error_injectable
 struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 			   unsigned int level)
 {
@@ -2133,6 +2134,7 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
  *
  * Return: 0 on success, negative error code on error.
  */
+error_injectable
 int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 {
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
@@ -2374,6 +2376,7 @@ static struct xe_dep_scheduler *to_dep_scheduler(struct xe_exec_queue *q,
  *
  * Return: fence on success, negative ERR_PTR on error.
  */
+error_injectable
 struct dma_fence *
 xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 {
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 87911fb4eea7..f18fcf3ce0ee 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -11,6 +11,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
@@ -104,6 +105,7 @@ static void fini_sriov(struct drm_device *drm, void *arg)
  *
  * Return: 0 on success or a negative error code on failure.
  */
+error_injectable
 int xe_sriov_init(struct xe_device *xe)
 {
 	if (!IS_SRIOV(xe))
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 82872a51f098..24581804b66d 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -110,6 +110,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	kick_ufence(ufence, fence);
 }
 
+error_injectable
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d49ba3401963..5a2efdba0e12 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -138,6 +138,7 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
  *
  * Returns: 0 on success, negative error code on error.
  */
+error_injectable
 int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index a524170a04d0..5d3aa782839b 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -11,6 +11,7 @@
 
 #include "regs/xe_gt_regs.h"
 #include "xe_gt_types.h"
+#include "xe_macros.h"
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
 
@@ -148,6 +149,7 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
  *
  * Returns 0 for success, negative error code otherwise.
  */
+error_injectable
 int xe_tuning_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a236f1d37248..c6100d960e0d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -817,6 +817,7 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 	return err;
 }
 
+error_injectable
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3ff3c67aa79d..04e98c7e8935 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -220,6 +220,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
 	}
 }
 
+error_injectable
 int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
 	struct drm_gpuvm_exec vm_exec = {
@@ -781,6 +782,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
+error_injectable
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
@@ -1629,6 +1631,7 @@ static void vm_destroy_work_func(struct work_struct *w);
  *
  * Return: 0 on success, negative error code on error.
  */
+error_injectable
 static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
 				struct xe_vm *vm)
 {
@@ -2422,6 +2425,7 @@ static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
  * Create operations list from IOCTL arguments, setup operations fields so parse
  * and commit steps are decoupled from IOCTL arguments. This step can fail.
  */
+error_injectable
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			 struct xe_bo *bo, u64 bo_offset_or_userptr,
@@ -3432,6 +3436,7 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 	}
 }
 
+error_injectable
 static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 						   struct xe_vma_ops *vops)
 {
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 52c7df4c3afd..0e5a52d7b080 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -20,6 +20,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_types.h"
+#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
@@ -1011,6 +1012,7 @@ int xe_wa_device_init(struct xe_device *xe)
  *
  * Returns 0 for success, negative error code otherwise.
  */
+error_injectable
 int xe_wa_gt_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index ada0d0aa6b74..d8d269416b7f 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -196,6 +196,7 @@ u32 xe_wopcm_size(struct xe_device *xe)
  * size. It will fail the WOPCM init if any of these checks fail, so that the
  * following WOPCM registers setup and GuC firmware uploading would be aborted.
  */
+error_injectable
 int xe_wopcm_init(struct xe_wopcm *wopcm)
 {
 	struct xe_device *xe = wopcm_to_xe(wopcm);
-- 
2.43.0

