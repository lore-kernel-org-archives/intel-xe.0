Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905C606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HUyrCRtd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A22110E027;
	Tue, 20 Oct 2026 17:51:06 +0000 (UTC)
Received: from mgamail.intel.com (unknown [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627A810E027
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 17:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792518660; x=1824054660;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=11BauN4xrhLiKvbFpzBmvUuJhujRnbzg/GP7VGeQjH0=;
 b=HUyrCRtd2NxEMrObVlsuwKPRf374OlszbBzrS38jqxBaJITGqjEj8SYi
 dTOlmnvwmKsR9QZcMZCyF5mQRc8avPI5wXgUJVvB0Q6o5STTaWPCmJpvg
 x4EEcOF9UpAMWoCuhIu6CDdPd50NRWMjFxYLWnMEZ0mFERJkbzqPVgQDP
 /QJj0J2NIKwKHf+3ZphjXtO4y51NSxTShKySGT7uA2crYKZKktVNBlMxS
 zw1d9Sz6OutDFewqRFCztcH+j35XcWuC5BTvzsFd8FPUYeOO2NAjR7UjR
 Se4Lu1mFRx4BXYElcdje0Nzpw1xG2DWNkQZ58KucP7E7mQIXC/lE5nvKH Q==;
X-CSE-ConnectionGUID: QaAyz/qMS7C1pE3AZH7xKw==
X-CSE-MsgGUID: XJ/SmXNYTXiiy3Fns/RORw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1103179"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1103179"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 10:50:50 -0700
X-CSE-ConnectionGUID: jUVSreyCRHyFHI1I/mAoTg==
X-CSE-MsgGUID: FIDzy2vMQQSKYvf+Kh6e+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2778546"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 10:50:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Add a minimum age gate to the shrinker
Date: Tue, 20 Oct 2026 10:50:45 -0700
Message-Id: <20261020175045.843524-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Backing up a BO costs a GPU blit plus a page copy, and if the BO is part
of an active working set it is faulted straight back in on the next exec.
Evicting a BO that was used moments ago is therefore almost always a
loss, yet the shrinker has no notion of recency beyond LRU order.

Timestamp BOs on their last LRU bump: on a successful move into TT in
xe_bo_move(), which now also bumps the LRU, and on the exec bump in
xe_vm_bump_lru(). Private BOs are bulk moved with their VM, so stamp the
VM there and take the later of the BO and VM stamps.

Add a per-device shrinker_min_age_ms sysfs attribute, defaulting to
CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS (0, disabled). While set, the shrinker
won't back up BOs younger than the delay: xe_shrinker_count() snoops the
first shrinkable BO on each TT-backed LRU and reports nothing if all are
young, and the backup walk stops at the first young BO as a backstop.

The gate is hard and applies at every reclaim priority, so a working set
kept younger than the delay is never backed up and can lead to OOM. This
is deliberate, and why it is off by default. Purgeable objects are never
gated, nor are BOs in XE_PL_SYSTEM: those are not GPU mapped, hence not
part of a working set.

Assisted-by: LLM
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---

v2:
 - Trim commit message (Thomas)
 - Add LRU move helper which sets lru_timestamp (Thomas)
 - Use LRU move helper in xe_bo_move (Thomas)
 - Only do too young walk if num_pages != 0 (Thomas)
---
 drivers/gpu/drm/xe/Kconfig.profile   |  15 +++
 drivers/gpu/drm/xe/xe_bo.c           |  71 +++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           |   5 +
 drivers/gpu/drm/xe/xe_bo_types.h     |   8 ++
 drivers/gpu/drm/xe/xe_device_sysfs.c |  35 +++++++
 drivers/gpu/drm/xe/xe_shrinker.c     | 149 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_shrinker.h     |   3 +
 drivers/gpu/drm/xe/xe_vm.c           |   4 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   7 ++
 9 files changed, 285 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 23045ed2aa94..dd3985e502b8 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -74,6 +74,7 @@ config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
 	  to apply to applicable user. For elevated user, all above MIN
 	  and MAX values will apply when this configuration is enable to
 	  apply limitation. By default limitation is applied.
+
 config DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS
 	int "Default seeks value of the non-purgeable bo shrinker"
 	default 8
@@ -86,3 +87,17 @@ config DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS
 	  reclaim pressure on non-purgeable buffer objects, which need
 	  GPU idling and writeback to be reclaimed, in favour of purgeable
 	  ones and other kernel caches.
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
index 1b74331b15ec..59a42c3282f7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1313,9 +1313,80 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		xe_tt_unmap_sg(xe, ttm_bo->ttm);
 	}
 
+	if (!ret && ttm_bo->resource && ttm_bo->resource->mem_type == XE_PL_TT)
+		xe_bo_bump_lru(bo);
+
 	return ret;
 }
 
+/**
+ * xe_bo_bump_lru_locked() - Bump a BO on the LRU and stamp its last use
+ * @bo: The buffer object, reserved by the caller.
+ *
+ * Move @bo to the tail of its LRU, or of its bulk move if it belongs to one,
+ * and record the time for the shrinker's minimum age gate. The caller must
+ * hold the device LRU lock.
+ */
+void xe_bo_bump_lru_locked(struct xe_bo *bo)
+{
+	WRITE_ONCE(bo->lru_stamp, jiffies);
+	ttm_bo_move_to_lru_tail(&bo->ttm);
+}
+
+/**
+ * xe_bo_bump_lru() - Bump a BO on the LRU and stamp its last use
+ * @bo: The buffer object, reserved by the caller.
+ *
+ * Like xe_bo_bump_lru_locked(), but takes the device LRU lock.
+ */
+void xe_bo_bump_lru(struct xe_bo *bo)
+{
+	spinlock_t *lru_lock = &xe_bo_device(bo)->ttm.lru_lock;
+
+	spin_lock(lru_lock);
+	xe_bo_bump_lru_locked(bo);
+	spin_unlock(lru_lock);
+}
+
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
index 77b3a02e9b8e..ac54545f158d 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -623,6 +623,11 @@ struct xe_bo_shrink_flags {
 	u32 writeback : 1;
 };
 
+void xe_bo_bump_lru_locked(struct xe_bo *bo);
+void xe_bo_bump_lru(struct xe_bo *bo);
+
+bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned long min_age);
+
 long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 8ec4a01a0092..12064540e55b 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -43,6 +43,14 @@ struct xe_bo {
 	u32 flags;
 	/** @vm: VM this BO is attached to, for extobj this will be NULL */
 	struct xe_vm *vm;
+	/**
+	 * @lru_stamp: jiffies at the last LRU bump, done on a move into TT
+	 * and, for external objects, at exec time. Private BOs are
+	 * additionally covered by &xe_vm.lru_stamp. Consulted by the
+	 * shrinker's minimum age gate. Accessed with
+	 * READ_ONCE()/WRITE_ONCE().
+	 */
+	unsigned long lru_stamp;
 	/**
 	 * @q: Queue this BO is attached to, mostly for LRC BO, NULL otherwise.
 	 * Protected by the BO dma_resv: readers must hold it across both the
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index ff5d25dd867c..26b1f71ed522 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -38,6 +38,12 @@
  * reclaimed by the shrinker. Higher values reduce reclaim pressure on
  * non-purgeable buffer objects. Valid values are 1 to 64. Defaults to
  * CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS.
+ *
+ * shrinker_min_age_ms - Report/change the minimum time, in ms, since a BO was
+ * last moved to TT or bumped on the LRU by an exec before the shrinker may
+ * back it up. BOs evicted to system memory are never protected. Defaults to
+ * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, 0 disables. This applies at every
+ * reclaim priority, so a non-zero value can lead to OOM.
  */
 
 static ssize_t
@@ -331,8 +337,37 @@ shrinker_non_purgeable_seeks_store(struct device *dev,
 
 static DEVICE_ATTR_RW(shrinker_non_purgeable_seeks);
 
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
 static struct attribute *shrinker_attrs[] = {
 	&dev_attr_shrinker_non_purgeable_seeks.attr,
+	&dev_attr_shrinker_min_age_ms.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 772dab9b3ed7..8e863ee5a96e 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -39,6 +39,8 @@
  * @shrink: Pointer to the mm shrinker handling non-purgeable (shrinkable) objects.
  * @purge_shrink: Pointer to the mm shrinker handling purgeable objects.
  * @pm_worker: Worker to wake up the device if required.
+ * @min_age_ms: Minimum BO age before backup, in ms. 0 disables. Defaults to
+ * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, overridable through sysfs.
  */
 struct xe_shrinker {
 	struct xe_device *xe;
@@ -50,6 +52,7 @@ struct xe_shrinker {
 	struct shrinker *shrink;
 	struct shrinker *purge_shrink;
 	struct work_struct pm_worker;
+	unsigned int min_age_ms;
 };
 
 static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
@@ -104,6 +107,7 @@ static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker, bool runtim
 static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
 			      struct ttm_operation_ctx *ctx,
 			      const struct xe_bo_shrink_flags flags,
+			      unsigned long min_age, bool *young,
 			      unsigned long to_scan, unsigned long *scanned,
 			      unsigned long *freed)
 {
@@ -136,6 +140,16 @@ static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
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
 			/* Like the TTM LRU walk, skip bos we can't shrink now. */
 			if (lret == -EBUSY)
@@ -168,35 +182,117 @@ static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
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
+ * A BO's age is taken from the last time it was bumped on the LRU: a move
+ * into TT (xe_bo_move()) or an exec (xe_vm_bump_lru()). For BOs private to
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
 xe_shrinker_count_purgeable(struct shrinker *shrink, struct shrink_control *sc)
 {
@@ -236,7 +332,7 @@ static unsigned long
 xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
 	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
-	unsigned long num_pages;
+	unsigned long num_pages, min_age;
 	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
 
 	if (!can_backup)
@@ -260,6 +356,10 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 
 	write_unlock(&shrinker->lock);
 
+	min_age = xe_shrinker_min_age(shrinker);
+	if (num_pages && min_age && xe_shrinker_lru_young(shrinker, min_age))
+		return SHRINK_EMPTY;
+
 	return num_pages ? num_pages : SHRINK_EMPTY;
 }
 
@@ -294,7 +394,8 @@ static unsigned long xe_shrinker_scan_purgeable(struct shrinker *shrink,
 		.purge = true,
 	};
 
-	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned, &freed);
+	xe_shrinker_walk(shrinker, &ctx, shrink_flags, 0, nr_to_scan, &nr_scanned,
+			 &freed);
 
 	sc->nr_scanned = nr_scanned;
 
@@ -319,7 +420,9 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 	/* Might need runtime PM to access backed-up or CCS-compressed data. */
 	runtime_pm = xe_shrinker_runtime_pm_get(shrinker);
 
-	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned, &freed);
+	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
+			 xe_shrinker_min_age(shrinker), nr_to_scan, &nr_scanned,
+			 &freed);
 
 	sc->nr_scanned = nr_scanned;
 	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
@@ -384,6 +487,29 @@ int xe_shrinker_set_non_purgeable_seeks(struct xe_shrinker *shrinker,
 	return 0;
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
@@ -412,6 +538,7 @@ int xe_shrinker_create(struct xe_device *xe)
 
 	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
 	shrinker->xe = xe;
+	shrinker->min_age_ms = CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS;
 	rwlock_init(&shrinker->lock);
 
 	shrinker->purge_shrink->count_objects = xe_shrinker_count_purgeable;
diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
index 4b3c73689619..586d7772bd58 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.h
+++ b/drivers/gpu/drm/xe/xe_shrinker.h
@@ -18,4 +18,7 @@ int xe_shrinker_non_purgeable_seeks(struct xe_shrinker *shrinker);
 int xe_shrinker_set_non_purgeable_seeks(struct xe_shrinker *shrinker,
 					unsigned int seeks);
 
+unsigned int xe_shrinker_min_age_ms(struct xe_shrinker *shrinker);
+void xe_shrinker_set_min_age_ms(struct xe_shrinker *shrinker, unsigned int ms);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d6294d53dee6..0679aed1f51a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -456,13 +456,15 @@ void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
 	spinlock_t *lru_lock = &vm->xe->ttm.lru_lock;
 	struct drm_gem_object *obj;
 
+	WRITE_ONCE(vm->lru_stamp, jiffies);
+
 	spin_lock(lru_lock);
 	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
 	drm_exec_for_each_locked_object(exec, obj) {
 		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
 			continue;
 
-		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)->ttm);
+		xe_bo_bump_lru_locked(gem_to_xe_bo(obj));
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

