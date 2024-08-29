Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B83CA0EC6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 22:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D077E10E79A;
	Thu, 29 Aug 2024 22:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmQLr63b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D87C10E799
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 22:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724969189; x=1756505189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2LpxLKIdEZQJU2qGkvRCeVFl/EYQpP30A+N5QcnQ10o=;
 b=ZmQLr63bTBHshd9GkLJHVeMEspE/lP98UIp2Z2GZcgtJfn8xX0mLRCCm
 OwEpOv9z4eRXPxSlVP+/8sfK0KFK1buRXHwZx1JWy0sHszjrA+/NjiScj
 MIn0icOAbm/kLaFZxG3l16GFw+WuQoSrAYKJaUznKCO8Tu9DRhxxFPIUd
 PcRRq60BnRb1wC15/jr/B0aLpFSZwJ09ZKqOQt0BpVSUTYOIobd4L1ufn
 wt2WDbTiQYVQBGEhU64SLykxK7XgbtirS1ldBidVRvX64Ct7wppBCj9qI
 qPqvFINrtaDRF4ThImDU3JbjAbvchS6rLeHm2MNitXJLvti+yQBsBC00+ A==;
X-CSE-ConnectionGUID: sM6UruB+Tje1FrQN05pARQ==
X-CSE-MsgGUID: BeTQpdIaRbmepJwEcxb8yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23737582"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23737582"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 15:06:28 -0700
X-CSE-ConnectionGUID: 4a4tes1BTDGUnvcBAtDKLg==
X-CSE-MsgGUID: mpwXItwlQvq0239VCkWPxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63555969"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 15:06:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 1/2] drm/xe/pcode: Treat pcode as per-tile rather than per-GT
Date: Thu, 29 Aug 2024 15:06:21 -0700
Message-ID: <20240829220619.789159-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240829220619.789159-4-matthew.d.roper@intel.com>
References: <20240829220619.789159-4-matthew.d.roper@intel.com>
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

There's only one instance of the pcode per tile, and for GT-related
accesses both the primary and media GT share the same register
interface.  Since Xe was using per-GT locking, the pcode mutex wasn't
actually protecting everything that it should since concurrent accesses
related to a tile's primary GT and media GT were possible.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
One somewhat worrying design that this highlights is that
xe_pcode_init_min_freq_table is getting called from each GT's SLPC
initialization with different frequency values.  But since there's
really only a single shared pcode interface to the hardware, this
effectively means the media GT values seem to be clobbering the values
previously set by the primary GT.  We'll need to look closer at that as
a followup; this patch doesn't attempt to change that (mis?)behavior.

 .../drm/xe/compat-i915-headers/intel_pcode.h  |   8 +-
 .../drm/xe/compat-i915-headers/intel_uncore.h |   7 ++
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +
 drivers/gpu/drm/xe/xe_gt.c                    |   2 -
 drivers/gpu/drm/xe/xe_gt_types.h              |   6 -
 drivers/gpu/drm/xe/xe_guc_pc.c                |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                 |   4 +-
 drivers/gpu/drm/xe/xe_pcode.c                 | 104 +++++++++---------
 drivers/gpu/drm/xe/xe_pcode.h                 |  16 +--
 drivers/gpu/drm/xe/xe_tile.c                  |   3 +
 drivers/gpu/drm/xe/xe_vram_freq.c             |   6 +-
 11 files changed, 85 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
index 0c47661bdc6a..a473aa6697d0 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
@@ -13,7 +13,7 @@ static inline int
 snb_pcode_write_timeout(struct intel_uncore *uncore, u32 mbox, u32 val,
 			int fast_timeout_us, int slow_timeout_ms)
 {
-	return xe_pcode_write_timeout(__compat_uncore_to_gt(uncore), mbox, val,
+	return xe_pcode_write_timeout(__compat_uncore_to_tile(uncore), mbox, val,
 				      slow_timeout_ms ?: 1);
 }
 
@@ -21,13 +21,13 @@ static inline int
 snb_pcode_write(struct intel_uncore *uncore, u32 mbox, u32 val)
 {
 
-	return xe_pcode_write(__compat_uncore_to_gt(uncore), mbox, val);
+	return xe_pcode_write(__compat_uncore_to_tile(uncore), mbox, val);
 }
 
 static inline int
 snb_pcode_read(struct intel_uncore *uncore, u32 mbox, u32 *val, u32 *val1)
 {
-	return xe_pcode_read(__compat_uncore_to_gt(uncore), mbox, val, val1);
+	return xe_pcode_read(__compat_uncore_to_tile(uncore), mbox, val, val1);
 }
 
 static inline int
@@ -35,7 +35,7 @@ skl_pcode_request(struct intel_uncore *uncore, u32 mbox,
 		  u32 request, u32 reply_mask, u32 reply,
 		  int timeout_base_ms)
 {
-	return xe_pcode_request(__compat_uncore_to_gt(uncore), mbox, request, reply_mask, reply,
+	return xe_pcode_request(__compat_uncore_to_tile(uncore), mbox, request, reply_mask, reply,
 				timeout_base_ms);
 }
 
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index 083c4da2ea41..eb5b5f0e4bd9 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -17,6 +17,13 @@ static inline struct xe_gt *__compat_uncore_to_gt(struct intel_uncore *uncore)
 	return xe_root_mmio_gt(xe);
 }
 
+static inline struct xe_tile *__compat_uncore_to_tile(struct intel_uncore *uncore)
+{
+	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
+
+	return xe_device_get_root_tile(xe);
+}
+
 static inline u32 intel_uncore_read(struct intel_uncore *uncore,
 				    i915_reg_t i915_reg)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e73fb0c23932..ec7eb7811126 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -208,6 +208,12 @@ struct xe_tile {
 		} vf;
 	} sriov;
 
+	/** @pcode: tile's PCODE */
+	struct {
+		/** @pcode.lock: protecting tile's PCODE mailbox data */
+		struct mutex lock;
+	} pcode;
+
 	/** @migrate: Migration helper for vram blits and clearing */
 	struct xe_migrate *migrate;
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1bb66db47265..f82b3e8ac5c8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -48,7 +48,6 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_pat.h"
-#include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_mocs.h"
 #include "xe_reg_sr.h"
@@ -388,7 +387,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_tuning_process_gt(gt);
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
-	xe_pcode_init(gt);
 	spin_lock_init(&gt->global_invl_lock);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 31946d7fe701..3d1c51de0268 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -329,12 +329,6 @@ struct xe_gt {
 	/** @eclass: per hardware engine class interface on the GT */
 	struct xe_hw_engine_class_intf  eclass[XE_ENGINE_CLASS_MAX];
 
-	/** @pcode: GT's PCODE */
-	struct {
-		/** @pcode.lock: protecting GT's PCODE mailbox data */
-		struct mutex lock;
-	} pcode;
-
 	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
 	struct kobject *sysfs;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index def503abeed5..034b29984d5e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -915,7 +915,7 @@ static void pc_init_pcode_freq(struct xe_guc_pc *pc)
 	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
 	u32 max = DIV_ROUND_CLOSEST(pc->rp0_freq, GT_FREQUENCY_MULTIPLIER);
 
-	XE_WARN_ON(xe_pcode_init_min_freq_table(pc_to_gt(pc), min, max));
+	XE_WARN_ON(xe_pcode_init_min_freq_table(gt_to_tile(pc_to_gt(pc)), min, max));
 }
 
 static int pc_init_freqs(struct xe_guc_pc *pc)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 1faeca70900e..98e3ec08279e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -441,14 +441,14 @@ static int xe_hwmon_pcode_read_i1(struct xe_gt *gt, u32 *uval)
 	if (gt_to_xe(gt)->info.platform == XE_DG2)
 		return -ENXIO;
 
-	return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
+	return xe_pcode_read(gt_to_tile(gt), PCODE_MBOX(PCODE_POWER_SETUP,
 			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
 			     uval, NULL);
 }
 
 static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
 {
-	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
+	return xe_pcode_write(gt_to_tile(gt), PCODE_MBOX(PCODE_POWER_SETUP,
 			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
 			      (uval & POWER_SETUP_I1_DATA_MASK));
 }
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 9c4eefdf6642..7397d556996a 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -12,7 +12,6 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
-#include "xe_gt.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 
@@ -30,7 +29,7 @@
  * - PCODE for display operations
  */
 
-static int pcode_mailbox_status(struct xe_gt *gt)
+static int pcode_mailbox_status(struct xe_tile *tile)
 {
 	u32 err;
 	static const struct pcode_err_decode err_decode[] = {
@@ -45,9 +44,9 @@ static int pcode_mailbox_status(struct xe_gt *gt)
 		[PCODE_ERROR_MASK] = {-EPROTO, "Unknown"},
 	};
 
-	err = xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_ERROR_MASK;
+	err = xe_mmio_read32(tile->primary_gt, PCODE_MAILBOX) & PCODE_ERROR_MASK;
 	if (err) {
-		drm_err(&gt_to_xe(gt)->drm, "PCODE Mailbox failed: %d %s", err,
+		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
 			err_decode[err].str ?: "Unknown");
 		return err_decode[err].errno ?: -EPROTO;
 	}
@@ -55,84 +54,85 @@ static int pcode_mailbox_status(struct xe_gt *gt)
 	return 0;
 }
 
-static int __pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
+static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
 			      unsigned int timeout_ms, bool return_data,
 			      bool atomic)
 {
+	struct xe_gt *mmio = tile->primary_gt;
 	int err;
 
-	if (gt_to_xe(gt)->info.skip_pcode)
+	if (tile_to_xe(tile)->info.skip_pcode)
 		return 0;
 
-	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
+	if ((xe_mmio_read32(mmio, PCODE_MAILBOX) & PCODE_READY) != 0)
 		return -EAGAIN;
 
-	xe_mmio_write32(gt, PCODE_DATA0, *data0);
-	xe_mmio_write32(gt, PCODE_DATA1, data1 ? *data1 : 0);
-	xe_mmio_write32(gt, PCODE_MAILBOX, PCODE_READY | mbox);
+	xe_mmio_write32(mmio, PCODE_DATA0, *data0);
+	xe_mmio_write32(mmio, PCODE_DATA1, data1 ? *data1 : 0);
+	xe_mmio_write32(mmio, PCODE_MAILBOX, PCODE_READY | mbox);
 
-	err = xe_mmio_wait32(gt, PCODE_MAILBOX, PCODE_READY, 0,
+	err = xe_mmio_wait32(mmio, PCODE_MAILBOX, PCODE_READY, 0,
 			     timeout_ms * USEC_PER_MSEC, NULL, atomic);
 	if (err)
 		return err;
 
 	if (return_data) {
-		*data0 = xe_mmio_read32(gt, PCODE_DATA0);
+		*data0 = xe_mmio_read32(mmio, PCODE_DATA0);
 		if (data1)
-			*data1 = xe_mmio_read32(gt, PCODE_DATA1);
+			*data1 = xe_mmio_read32(mmio, PCODE_DATA1);
 	}
 
-	return pcode_mailbox_status(gt);
+	return pcode_mailbox_status(tile);
 }
 
-static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
+static int pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
 			    unsigned int timeout_ms, bool return_data,
 			    bool atomic)
 {
-	if (gt_to_xe(gt)->info.skip_pcode)
+	if (tile_to_xe(tile)->info.skip_pcode)
 		return 0;
 
-	lockdep_assert_held(&gt->pcode.lock);
+	lockdep_assert_held(&tile->pcode.lock);
 
-	return __pcode_mailbox_rw(gt, mbox, data0, data1, timeout_ms, return_data, atomic);
+	return __pcode_mailbox_rw(tile, mbox, data0, data1, timeout_ms, return_data, atomic);
 }
 
-int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 data, int timeout)
+int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout)
 {
 	int err;
 
-	mutex_lock(&gt->pcode.lock);
-	err = pcode_mailbox_rw(gt, mbox, &data, NULL, timeout, false, false);
-	mutex_unlock(&gt->pcode.lock);
+	mutex_lock(&tile->pcode.lock);
+	err = pcode_mailbox_rw(tile, mbox, &data, NULL, timeout, false, false);
+	mutex_unlock(&tile->pcode.lock);
 
 	return err;
 }
 
-int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
+int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
 {
 	int err;
 
-	mutex_lock(&gt->pcode.lock);
-	err = pcode_mailbox_rw(gt, mbox, val, val1, 1, true, false);
-	mutex_unlock(&gt->pcode.lock);
+	mutex_lock(&tile->pcode.lock);
+	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false);
+	mutex_unlock(&tile->pcode.lock);
 
 	return err;
 }
 
-static int pcode_try_request(struct xe_gt *gt, u32 mbox,
+static int pcode_try_request(struct xe_tile *tile, u32 mbox,
 			     u32 request, u32 reply_mask, u32 reply,
 			     u32 *status, bool atomic, int timeout_us, bool locked)
 {
 	int slept, wait = 10;
 
-	xe_gt_assert(gt, timeout_us > 0);
+	xe_tile_assert(tile, timeout_us > 0);
 
 	for (slept = 0; slept < timeout_us; slept += wait) {
 		if (locked)
-			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
+			*status = pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
 						   atomic);
 		else
-			*status = __pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
+			*status = __pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
 						     atomic);
 		if ((*status == 0) && ((request & reply_mask) == reply))
 			return 0;
@@ -149,7 +149,7 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
 
 /**
  * xe_pcode_request - send PCODE request until acknowledgment
- * @gt: gt
+ * @tile: tile
  * @mbox: PCODE mailbox ID the request is targeted for
  * @request: request ID
  * @reply_mask: mask used to check for request acknowledgment
@@ -166,17 +166,17 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
  * Returns 0 on success, %-ETIMEDOUT in case of a timeout, <0 in case of some
  * other error as reported by PCODE.
  */
-int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
-		      u32 reply_mask, u32 reply, int timeout_base_ms)
+int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
+		     u32 reply_mask, u32 reply, int timeout_base_ms)
 {
 	u32 status;
 	int ret;
 
-	xe_gt_assert(gt, timeout_base_ms <= 3);
+	xe_tile_assert(tile, timeout_base_ms <= 3);
 
-	mutex_lock(&gt->pcode.lock);
+	mutex_lock(&tile->pcode.lock);
 
-	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
+	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
 				false, timeout_base_ms * 1000, true);
 	if (!ret)
 		goto out;
@@ -191,20 +191,20 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 	 * requests, and for any quirks of the PCODE firmware that delays
 	 * the request completion.
 	 */
-	drm_err(&gt_to_xe(gt)->drm,
+	drm_err(&tile_to_xe(tile)->drm,
 		"PCODE timeout, retrying with preemption disabled\n");
 	preempt_disable();
-	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
+	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
 				true, 50 * 1000, true);
 	preempt_enable();
 
 out:
-	mutex_unlock(&gt->pcode.lock);
+	mutex_unlock(&tile->pcode.lock);
 	return status ? status : ret;
 }
 /**
  * xe_pcode_init_min_freq_table - Initialize PCODE's QOS frequency table
- * @gt: gt instance
+ * @tile: tile instance
  * @min_gt_freq: Minimal (RPn) GT frequency in units of 50MHz.
  * @max_gt_freq: Maximal (RP0) GT frequency in units of 50MHz.
  *
@@ -227,30 +227,30 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
  * - -EACCES, "PCODE Rejected"
  * - -EPROTO, "Unknown"
  */
-int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
+int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 				 u32 max_gt_freq)
 {
 	int ret;
 	u32 freq;
 
-	if (!gt_to_xe(gt)->info.has_llc)
+	if (!tile_to_xe(tile)->info.has_llc)
 		return 0;
 
 	if (max_gt_freq <= min_gt_freq)
 		return -EINVAL;
 
-	mutex_lock(&gt->pcode.lock);
+	mutex_lock(&tile->pcode.lock);
 	for (freq = min_gt_freq; freq <= max_gt_freq; freq++) {
 		u32 data = freq << PCODE_FREQ_RING_RATIO_SHIFT | freq;
 
-		ret = pcode_mailbox_rw(gt, PCODE_WRITE_MIN_FREQ_TABLE,
+		ret = pcode_mailbox_rw(tile, PCODE_WRITE_MIN_FREQ_TABLE,
 				       &data, NULL, 1, false, false);
 		if (ret)
 			goto unlock;
 	}
 
 unlock:
-	mutex_unlock(&gt->pcode.lock);
+	mutex_unlock(&tile->pcode.lock);
 	return ret;
 }
 
@@ -270,7 +270,7 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
 int xe_pcode_ready(struct xe_device *xe, bool locked)
 {
 	u32 status, request = DGFX_GET_INIT_STATUS;
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	int timeout_us = 180000000; /* 3 min */
 	int ret;
 
@@ -281,15 +281,15 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 		return 0;
 
 	if (locked)
-		mutex_lock(&gt->pcode.lock);
+		mutex_lock(&tile->pcode.lock);
 
-	ret = pcode_try_request(gt, DGFX_PCODE_STATUS, request,
+	ret = pcode_try_request(tile, DGFX_PCODE_STATUS, request,
 				DGFX_INIT_STATUS_COMPLETE,
 				DGFX_INIT_STATUS_COMPLETE,
 				&status, false, timeout_us, locked);
 
 	if (locked)
-		mutex_unlock(&gt->pcode.lock);
+		mutex_unlock(&tile->pcode.lock);
 
 	if (ret)
 		drm_err(&xe->drm,
@@ -300,14 +300,14 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 
 /**
  * xe_pcode_init: initialize components of PCODE
- * @gt: gt instance
+ * @tile: tile instance
  *
  * This function initializes the xe_pcode component.
  * To be called once only during probe.
  */
-void xe_pcode_init(struct xe_gt *gt)
+void xe_pcode_init(struct xe_tile *tile)
 {
-	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
+	drmm_mutex_init(&tile_to_xe(tile)->drm, &tile->pcode.lock);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 3f54c6d2a57d..ba33991d72a7 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -7,21 +7,21 @@
 #define _XE_PCODE_H_
 
 #include <linux/types.h>
-struct xe_gt;
+struct xe_tile;
 struct xe_device;
 
-void xe_pcode_init(struct xe_gt *gt);
+void xe_pcode_init(struct xe_tile *tile);
 int xe_pcode_probe_early(struct xe_device *xe);
 int xe_pcode_ready(struct xe_device *xe, bool locked);
-int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
+int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 				 u32 max_gt_freq);
-int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
-int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
+int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
+int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
-#define xe_pcode_write(gt, mbox, val) \
-	xe_pcode_write_timeout(gt, mbox, val, 1)
+#define xe_pcode_write(tile, mbox, val) \
+	xe_pcode_write_timeout(tile, mbox, val, 1)
 
-int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
+int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 		     u32 reply_mask, u32 reply, int timeout_ms);
 
 #define PCODE_MBOX(mbcmd, param1, param2)\
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 15ea0a942f67..dda5268507d8 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -9,6 +9,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_migrate.h"
+#include "xe_pcode.h"
 #include "xe_sa.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
@@ -124,6 +125,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 	if (IS_ERR(tile->primary_gt))
 		return PTR_ERR(tile->primary_gt);
 
+	xe_pcode_init(tile);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 99ff95e408e0..b26e26d73dae 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -34,7 +34,6 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
 	struct xe_tile *tile = dev_to_tile(dev);
-	struct xe_gt *gt = tile->primary_gt;
 	u32 val, mbox;
 	int err;
 
@@ -42,7 +41,7 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
 		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
 		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
 
-	err = xe_pcode_read(gt, mbox, &val, NULL);
+	err = xe_pcode_read(tile, mbox, &val, NULL);
 	if (err)
 		return err;
 
@@ -57,7 +56,6 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
 	struct xe_tile *tile = dev_to_tile(dev);
-	struct xe_gt *gt = tile->primary_gt;
 	u32 val, mbox;
 	int err;
 
@@ -65,7 +63,7 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
 		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
 		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
 
-	err = xe_pcode_read(gt, mbox, &val, NULL);
+	err = xe_pcode_read(tile, mbox, &val, NULL);
 	if (err)
 		return err;
 
-- 
2.45.2

