Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44830CCA462
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 23:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D9310E08E;
	Thu, 15 Oct 2026 23:17:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A22010E08E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 23:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792106260; x=1823642260;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wO6tu9xw5C0VoHZdYFL8pH6ejHAgo+8+oUF5eCxRRqk=;
 b=LnfeKRLe7yOmCo+td7lTKK8G6GteF5IAswDCVV3cdvf6Jda2PnGPAEYA
 lq0zM42Ux1zWiHRYx1cBQNG2v4sixOOKuraVLGrGocZGAUY+TDJ4zUf8g
 6xY4fKYePL0kmBMhy4tZ2qzwVXXMf96Vp7MrhjLw9/BMoXczlQXB7tftn
 qq3PWu/KHKM7SYjhvzdKOmF/1JSQkbmdD0+zWFx7c8kjMktKqnlKSk7+h
 IhAnf1R+Ol17HEwk3OmBt1Rq2PYF1dCyJAQ2Ge84sxMCmpMO+IJhQXNWn
 5XQ8632mq9YlJRCYGl6biRlCNUuz0WY7pdu7o6tWBlEFTz6XNnb6vI8py g==;
X-CSE-ConnectionGUID: VmQYwzGTSWqZFQZjSvopGw==
X-CSE-MsgGUID: Xb+pJJ70RYqQGR4OPPAnVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="903810"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="903810"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 16:17:40 -0700
X-CSE-ConnectionGUID: frCdjc1TRdC3fkyz9ZHiLg==
X-CSE-MsgGUID: l6vC4VEPTq+XvUkn2hyA7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1718211"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 16:17:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add a minimum age gate to the shrinker
Date: Thu, 15 Oct 2026 16:17:33 -0700
Message-Id: <20261015231733.624746-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Backing up a BO costs a GPU blit plus a page copy, and if the BO is part
of an active working set it is faulted straight back in on the next exec.
Evicting a BO that was used moments ago is therefore almost always a
loss, yet the shrinker currently has no notion of recency beyond LRU
order.

Timestamp BOs on their last use: on a successful move into TT in
xe_bo_move(), and on the exec LRU bump in xe_vm_bump_lru(). Private BOs
are bulk moved with their VM, so stamp the VM there and take the later
of the BO and VM stamps for user BOs private to a VM. External objects
are stamped individually.

Add a per-device shrinker_min_age_ms sysfs attribute, defaulting to
CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS (0, disabled). While set, the shrinker
won't back up BOs younger than the delay:

- xe_shrinker_count() snoops the first shrinkable BO on each TT-backed
  LRU using the trylocked reserved walker, as the tt may be torn down
  while the BO is still on the LRU. If all are young it reports only
  purgeable pages.
- The backup walk stops at the first young BO, as the LRU is roughly age
  ordered, and serves as a backstop for the count sample.

The gate is hard and applies at every reclaim priority. A working set
kept younger than the delay is never backed up and can lead to OOM. This
is deliberate: some users prefer risking OOM over thrashing a hot working
set, which is also why it is off by default.

Purgeable objects are never gated, nor are BOs in XE_PL_SYSTEM: those are
not GPU mapped, so not part of a working set, and are stamped again when
moved back to TT for use.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile   |  14 +++
 drivers/gpu/drm/xe/xe_bo.c           |  42 ++++++++
 drivers/gpu/drm/xe/xe_bo.h           |   2 +
 drivers/gpu/drm/xe/xe_bo_types.h     |   7 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c |  48 +++++++++
 drivers/gpu/drm/xe/xe_shrinker.c     | 145 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_shrinker.h     |   3 +
 drivers/gpu/drm/xe/xe_vm.c           |   9 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   7 ++
 9 files changed, 266 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index e07517d120e0..0e68ad4f06a4 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -74,3 +74,17 @@ config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
 	  to apply to applicable user. For elevated user, all above MIN
 	  and MAX values will apply when this configuration is enable to
 	  apply limitation. By default limitation is applied.
+
+config DRM_XE_SHRINKER_MIN_AGE_MS
+	int "Default minimum BO age before shrinker backup (ms)"
+	default 0
+	range 0 1000000
+	help
+	  Default for the per-device shrinker_min_age_ms sysfs attribute. The
+	  shrinker won't back up a BO that was moved into TT, or bumped on the
+	  LRU by an exec, less than this many milliseconds ago. BOs already
+	  evicted to system memory are not part of a working set and are
+	  never protected. This applies at every reclaim priority: a working
+	  set kept younger than this is never backed up and can cause OOM.
+	  Only set if that risk is preferred over thrashing a hot working
+	  set. 0 disables.
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 12e523c61c1f..914a9949e6e1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1313,9 +1313,51 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		xe_tt_unmap_sg(xe, ttm_bo->ttm);
 	}
 
+	if (!ret && ttm_bo->resource && ttm_bo->resource->mem_type == XE_PL_TT)
+		WRITE_ONCE(bo->lru_stamp, jiffies);
+
 	return ret;
 }
 
+/**
+ * xe_bo_shrink_too_young() - Whether a BO was used too recently to shrink
+ * @bo: The TTM buffer object, reserved by the caller.
+ * @min_age: Minimum age in jiffies. 0 disables the check.
+ *
+ * The age is taken from the later of the BO's own &xe_bo.lru_stamp and, for
+ * user BOs private to a VM, the VM's &xe_vm.lru_stamp. Purgeable and non-xe
+ * BOs are never considered young since dropping them is cheap. Neither are
+ * BOs in XE_PL_SYSTEM: they are not GPU mapped, hence not part of a working
+ * set, and must be moved back to TT, refreshing the stamp, before use.
+ *
+ * Return: true if @bo was touched less than @min_age jiffies ago.
+ */
+bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned long min_age)
+{
+	struct xe_ttm_tt *xe_tt;
+	struct xe_bo *xe_bo;
+	unsigned long stamp;
+
+	if (!min_age || !bo->ttm || !xe_bo_is_xe_bo(bo) ||
+	    bo->resource->mem_type == XE_PL_SYSTEM)
+		return false;
+
+	xe_tt = container_of(bo->ttm, struct xe_ttm_tt, ttm);
+	if (xe_tt->purgeable)
+		return false;
+
+	xe_bo = ttm_to_xe_bo(bo);
+	stamp = READ_ONCE(xe_bo->lru_stamp);
+	if (xe_bo->vm && xe_bo_is_user(xe_bo)) {
+		unsigned long vm_stamp = READ_ONCE(xe_bo->vm->lru_stamp);
+
+		if (!stamp || time_after(vm_stamp, stamp))
+			stamp = vm_stamp;
+	}
+
+	return stamp && time_before(jiffies, stamp + min_age);
+}
+
 static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
 			       struct ttm_buffer_object *bo,
 			       unsigned long *scanned)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 77b3a02e9b8e..927642adfc21 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -623,6 +623,8 @@ struct xe_bo_shrink_flags {
 	u32 writeback : 1;
 };
 
+bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned long min_age);
+
 long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 8ec4a01a0092..a5f0435df718 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -43,6 +43,13 @@ struct xe_bo {
 	u32 flags;
 	/** @vm: VM this BO is attached to, for extobj this will be NULL */
 	struct xe_vm *vm;
+	/**
+	 * @lru_stamp: jiffies at the last move into TT or, for external
+	 * objects, the last exec LRU bump. Private BOs are additionally
+	 * covered by &xe_vm.lru_stamp. Consulted by the shrinker's minimum
+	 * age gate. Accessed with READ_ONCE()/WRITE_ONCE().
+	 */
+	unsigned long lru_stamp;
 	/**
 	 * @q: Queue this BO is attached to, mostly for LRC BO, NULL otherwise.
 	 * Protected by the BO dma_resv: readers must hold it across both the
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 18783a286a83..799397755f57 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -15,6 +15,7 @@
 #include "xe_pcode_api.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
+#include "xe_shrinker.h"
 
 /**
  * DOC: Xe device sysfs
@@ -31,6 +32,12 @@
  *
  * lb_voltage_regulator_version - Voltage regulator version provisioned by late
  * binding. Exposed only if supported by the device.
+ *
+ * shrinker_min_age_ms - Report/change the minimum time, in ms, since a BO was
+ * last moved to TT or bumped on the LRU by an exec before the shrinker may
+ * back it up. BOs evicted to system memory are never protected. Defaults to
+ * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, 0 disables. This applies at every
+ * reclaim priority, so a non-zero value can lead to OOM.
  */
 
 static ssize_t
@@ -75,6 +82,43 @@ static const struct attribute_group vram_attr_group = {
 	.attrs = vram_attrs,
 };
 
+static ssize_t
+shrinker_min_age_ms_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+
+	return sysfs_emit(buf, "%u\n", xe_shrinker_min_age_ms(xe->mem.shrinker));
+}
+
+static ssize_t
+shrinker_min_age_ms_store(struct device *dev, struct device_attribute *attr,
+			  const char *buff, size_t count)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	unsigned int ms;
+	int ret;
+
+	ret = kstrtouint(buff, 0, &ms);
+	if (ret)
+		return ret;
+
+	xe_shrinker_set_min_age_ms(xe->mem.shrinker, ms);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(shrinker_min_age_ms);
+
+static struct attribute *shrinker_attrs[] = {
+	&dev_attr_shrinker_min_age_ms.attr,
+	NULL
+};
+
+static const struct attribute_group shrinker_attr_group = {
+	.attrs = shrinker_attrs,
+};
+
 static ssize_t
 lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -299,6 +343,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
 	struct device *dev = xe->drm.dev;
 	int ret;
 
+	ret = devm_device_add_group(dev, &shrinker_attr_group);
+	if (ret)
+		return ret;
+
 	if (xe->d3cold.capable) {
 		ret = devm_device_add_group(dev, &vram_attr_group);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index deb4378c1ec1..f0bc026bd642 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -22,6 +22,8 @@
  * @purgeable_pages: Number of pages that are currently purgeable.
  * @shrink: Pointer to the mm shrinker.
  * @pm_worker: Worker to wake up the device if required.
+ * @min_age_ms: Minimum BO age before backup, in ms. 0 disables. Defaults to
+ * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, overridable through sysfs.
  */
 struct xe_shrinker {
 	struct xe_device *xe;
@@ -30,6 +32,7 @@ struct xe_shrinker {
 	long purgeable_pages;
 	struct shrinker *shrink;
 	struct work_struct pm_worker;
+	unsigned int min_age_ms;
 };
 
 static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
@@ -80,6 +83,7 @@ static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker, bool runtim
 static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
 			      struct ttm_operation_ctx *ctx,
 			      const struct xe_bo_shrink_flags flags,
+			      unsigned long min_age, bool *young,
 			      unsigned long to_scan, unsigned long *scanned,
 			      unsigned long *freed)
 {
@@ -112,6 +116,16 @@ static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
 			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
 				continue;
 
+			/*
+			 * The LRU is roughly age ordered, so everything past
+			 * the first young BO is most likely young too. Stop
+			 * here.
+			 */
+			if (xe_bo_shrink_too_young(ttm_bo, min_age)) {
+				*young = true;
+				goto out;
+			}
+
 			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
 			if (lret < 0) {
 				ret = lret;
@@ -141,42 +155,128 @@ static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
 static int xe_shrinker_walk(struct xe_shrinker *shrinker,
 			    struct ttm_operation_ctx *ctx,
 			    const struct xe_bo_shrink_flags flags,
+			    unsigned long min_age,
 			    unsigned long to_scan, unsigned long *scanned,
 			    unsigned long *freed)
 {
 	bool no_wait_gpu = true;
 	struct xe_bo_shrink_flags save_flags = flags;
+	bool young = false;
 	int ret;
 
 	swap(no_wait_gpu, ctx->no_wait_gpu);
 	save_flags.writeback = false;
-	ret = __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned,
-				 freed);
+	ret = __xe_shrinker_walk(shrinker, ctx, save_flags, min_age, &young,
+				 to_scan, scanned, freed);
 	swap(no_wait_gpu, ctx->no_wait_gpu);
-	if (ret || *scanned >= to_scan)
+	if (ret || young || *scanned >= to_scan)
 		return ret;
 
 	if (!ctx->no_wait_gpu) {
-		ret = __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned,
-					 freed);
-		if (ret || *scanned >= to_scan)
+		ret = __xe_shrinker_walk(shrinker, ctx, save_flags, min_age,
+					 &young, to_scan, scanned, freed);
+		if (ret || young || *scanned >= to_scan)
 			return ret;
 	}
 
 	if (flags.writeback)
-		ret = __xe_shrinker_walk(shrinker, ctx, flags, to_scan, scanned,
-					 freed);
+		ret = __xe_shrinker_walk(shrinker, ctx, flags, min_age, &young,
+					 to_scan, scanned, freed);
 
 	return ret;
 }
 
+/**
+ * DOC: Shrinker minimum age
+ *
+ * The per-device shrinker_min_age_ms sysfs attribute, defaulting to
+ * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, protects recently used BOs from backup.
+ * A BO's age is taken from the last time it moved into TT (xe_bo_move()) or,
+ * at exec time, was bumped on the LRU (xe_vm_bump_lru()). For BOs private to
+ * a VM the VM-wide stamp is used, matching the LRU bulk move. BOs in
+ * XE_PL_SYSTEM are never young: they are not GPU mapped, so not part of a
+ * working set, and will be stamped again when moved back to TT for use.
+ *
+ * xe_shrinker_count() snoops the first shrinkable BO on each TT-backed LRU.
+ * If all of them are young, it doesn't report shrinkable pages, so vmscan
+ * only asks for purgeable ones. A shrinkable BO in XE_PL_SYSTEM therefore
+ * always lets count report. The backup walk in xe_shrinker_scan() stops
+ * at the first young BO, since the LRU is roughly age ordered, as a backstop
+ * since the count snoop is only a sample. Purgeable BOs are never gated.
+ *
+ * The gate is hard and applies at every reclaim priority. A working set kept
+ * younger than the delay is never backed up, which can lead to OOM. This is
+ * intended for users who prefer that risk over thrashing a hot working set,
+ * hence it is disabled by default.
+ */
+static unsigned long xe_shrinker_min_age(struct xe_shrinker *shrinker)
+{
+	unsigned int ms = READ_ONCE(shrinker->min_age_ms);
+
+	return ms ? msecs_to_jiffies(ms) : 0;
+}
+
+/* Max shrink-unsuitable BOs to skip per LRU before giving up the snoop. */
+#define XE_SHRINKER_SNOOP_MAX	16
+
+/*
+ * Whether the first shrinkable BO on every TT-backed LRU is younger than
+ * @min_age. BOs are trylocked through the reserved LRU walker since their
+ * tt may be torn down while still on the LRU. Contended BOs are skipped by
+ * the walker. If no verdict can be reached within the snoop budget, report
+ * not young and leave it to the scan side check.
+ */
+static bool xe_shrinker_lru_young(struct xe_shrinker *shrinker,
+				  unsigned long min_age)
+{
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = false,
+	};
+	struct xe_device *xe = shrinker->xe;
+	unsigned int mem_type;
+
+	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT; ++mem_type) {
+		struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
+		struct ttm_bo_lru_cursor curs;
+		struct ttm_buffer_object *ttm_bo;
+		struct ttm_lru_walk_arg arg = {
+			.ctx = &ctx,
+			.trylock_only = true,
+		};
+		unsigned int budget = XE_SHRINKER_SNOOP_MAX;
+
+		if (!man || !man->use_tt)
+			continue;
+
+		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
+			if (!ttm_bo_shrink_suitable(ttm_bo, &ctx)) {
+				if (!--budget)
+					return false;
+				continue;
+			}
+
+			if (!xe_bo_shrink_too_young(ttm_bo, min_age))
+				return false;
+
+			break;
+		}
+	}
+
+	return true;
+}
+
 static unsigned long
 xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
 	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
-	unsigned long num_pages;
+	unsigned long num_pages, min_age;
 	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
 
+	min_age = can_backup ? xe_shrinker_min_age(shrinker) : 0;
+	if (min_age && xe_shrinker_lru_young(shrinker, min_age))
+		can_backup = false;
+
 	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
 	read_lock(&shrinker->lock);
 
@@ -245,7 +345,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
 
 	if (purgeable && nr_scanned < nr_to_scan)
-		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
+		xe_shrinker_walk(shrinker, &ctx, shrink_flags, 0,
 				 nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
@@ -259,6 +359,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 	shrink_flags.purge = false;
 
 	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
+			 xe_shrinker_min_age(shrinker),
 			 nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
@@ -288,6 +389,29 @@ static void xe_shrinker_fini(struct drm_device *drm, void *arg)
 	kfree(shrinker);
 }
 
+/**
+ * xe_shrinker_min_age_ms() - Get the shrinker minimum BO age
+ * @shrinker: Pointer to the struct xe_shrinker.
+ *
+ * Return: Minimum age, in ms, a BO must reach before it may be backed up.
+ */
+unsigned int xe_shrinker_min_age_ms(struct xe_shrinker *shrinker)
+{
+	return READ_ONCE(shrinker->min_age_ms);
+}
+
+/**
+ * xe_shrinker_set_min_age_ms() - Set the shrinker minimum BO age
+ * @shrinker: Pointer to the struct xe_shrinker.
+ * @ms: Minimum age, in ms. 0 disables the gate.
+ *
+ * See DOC: Shrinker minimum age. A non-zero value can lead to OOM.
+ */
+void xe_shrinker_set_min_age_ms(struct xe_shrinker *shrinker, unsigned int ms)
+{
+	WRITE_ONCE(shrinker->min_age_ms, ms);
+}
+
 /**
  * xe_shrinker_create() - Create an xe per-device shrinker
  * @xe: Pointer to the xe device.
@@ -309,6 +433,7 @@ int xe_shrinker_create(struct xe_device *xe)
 
 	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
 	shrinker->xe = xe;
+	shrinker->min_age_ms = CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS;
 	rwlock_init(&shrinker->lock);
 	shrinker->shrink->count_objects = xe_shrinker_count;
 	shrinker->shrink->scan_objects = xe_shrinker_scan;
diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
index 5132ae5192e1..a3b8b7dada09 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.h
+++ b/drivers/gpu/drm/xe/xe_shrinker.h
@@ -13,4 +13,7 @@ void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long p
 
 int xe_shrinker_create(struct xe_device *xe);
 
+unsigned int xe_shrinker_min_age_ms(struct xe_shrinker *shrinker);
+void xe_shrinker_set_min_age_ms(struct xe_shrinker *shrinker, unsigned int ms);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 095f762bbb6f..b569c1ababa3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -426,15 +426,22 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
 {
 	spinlock_t *lru_lock = &vm->xe->ttm.lru_lock;
+	unsigned long now = jiffies;
 	struct drm_gem_object *obj;
 
+	WRITE_ONCE(vm->lru_stamp, now);
+
 	spin_lock(lru_lock);
 	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
 	drm_exec_for_each_locked_object(exec, obj) {
+		struct xe_bo *bo;
+
 		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
 			continue;
 
-		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)->ttm);
+		bo = gem_to_xe_bo(obj);
+		WRITE_ONCE(bo->lru_stamp, now);
+		ttm_bo_move_to_lru_tail(&bo->ttm);
 		cond_resched_lock(lru_lock);
 	}
 	spin_unlock(lru_lock);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fb9305124679..a6dc7233b336 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -267,6 +267,13 @@ struct xe_vm {
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
 
+	/**
+	 * @lru_stamp: jiffies at the last xe_vm_bump_lru(). Covers the
+	 * VM's private BOs for the shrinker's minimum age gate.
+	 * Accessed with READ_ONCE()/WRITE_ONCE().
+	 */
+	unsigned long lru_stamp;
+
 	u64 size;
 
 	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
-- 
2.34.1

