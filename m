Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97597CCF2D6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 09:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE8710E4D5;
	Mon, 19 Oct 2026 09:57:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC8810E4D5
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792403851; x=1823939851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5MKFj3loOirohxrkW+EMMut8VHfPLw2IYyUZSb7eqOY=;
 b=BaKe8r5fH7KGVU8U9WrfoU/9rMSxL8K0cguQDei6hk3UWr+kKz9CuC2V
 Vtpl6dXZCA/7BnQXJ3j2ItmIWUjNweBAYWMb0raXJcxQu6mMS5LeIDlfg
 c1mCfGyFPFWh8ntoyOvGOeQBf04PPHTDfnAzfa4I8OjznfTlAtcSqHYQt
 c0Lw9KB3tLjGTt5DKcoM/fnzi8Er39SSoaBS5ZGLokW2yjxQ+l8qmUCFL
 hk8GG8dyizCQiXX23g9BQCV40SjkCEqtZqFa9AVBbILOYag8+/fPhPPQh
 dUqogB8X/rygyc4j4PLjL3cWHLppvWKzQ6Bt3b8DzVEzNDq94m1u9n5sY g==;
X-CSE-ConnectionGUID: BxdkO+TdTfKMaHkhtcJRwA==
X-CSE-MsgGUID: G5isdzO6RuqJ2ndYNeArEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1095002"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1095002"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 02:57:31 -0700
X-CSE-ConnectionGUID: 3ZQB48k8ROOzaleSTuibRw==
X-CSE-MsgGUID: M18W5t4TTBClpDVRDJVUEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2553650"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.14])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 02:57:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v5 3/4] drm/xe: Split the bo shrinker into purgeable and
 non-purgeable shrinkers
Date: Mon, 19 Oct 2026 11:56:54 +0200
Message-ID: <20261019095655.3501-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019095655.3501-1-thomas.hellstrom@linux.intel.com>
References: <20261019095655.3501-1-thomas.hellstrom@linux.intel.com>
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

Purgeable objects are reclaimed by simply discarding their pages, with
no writeback required. They are therefore much cheaper to shrink than
regular shrinkable (non-purgeable) objects, whose reclaim may need to
wait for the GPU or write dirty compressed contents back to a backup
store, and whose contents need to be read back on next use.

Split the single xe_shrinker into two independent struct shrinker
instances registered against the shrinker core, sharing the same
underlying accounting (shrinkable_pages, purgeable_pages,
populated_tts) and locking:

 - A purgeable shrinker, whose count_objects() reports only
   purgeable_pages, and whose scan_objects() only purges objects.

 - A non-purgeable (shrinkable) shrinker, whose count_objects()
   reports the shrinkable page count (capped by backup availability)
   and whose scan_objects() shrinks non-purgeable objects, and also
   purges any purgeable objects it encounters, waking the device via
   runtime PM as needed.

Express the cost difference to the shrinker core through the seeks
value: the purgeable shrinker keeps DEFAULT_SEEKS, while the
non-purgeable shrinker uses a higher value, 8 by default. The core
scales each shrinker's scan target inversely with seeks, so purgeable
objects receive proportionally more reclaim pressure than non-purgeable
ones, without one shrinker's behaviour depending on the other's state.

To allow tuning, the default non-purgeable seeks value is set by
CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS, and can be changed at
runtime through the per-device shrinker_non_purgeable_seeks sysfs
attribute. Valid values are 1 to 64. Zero is rejected, since the
shrinker core treats it specially.

The standalone purge walk relies on the LRU walk skipping
non-purgeable objects, for which xe_bo_shrink() returns -EBUSY,
rather than aborting.

v3:
- Patch introduced. (Matt Brost)

v4:
- The purge walk aborting at the first non-purgeable object is now
  fixed by a separate, preceding patch. (Sashiko)

v5:
- Make the non-purgeable seeks value tunable through Kconfig and
  sysfs. (Matt Brost)

Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile   |  12 +++
 drivers/gpu/drm/xe/xe_device_sysfs.c |  50 +++++++++
 drivers/gpu/drm/xe/xe_shrinker.c     | 147 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_shrinker.h     |   4 +
 4 files changed, 172 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index e07517d120e0..23045ed2aa94 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -74,3 +74,15 @@ config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
 	  to apply to applicable user. For elevated user, all above MIN
 	  and MAX values will apply when this configuration is enable to
 	  apply limitation. By default limitation is applied.
+config DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS
+	int "Default seeks value of the non-purgeable bo shrinker"
+	default 8
+	range 1 64
+	help
+	  Default for the per-device shrinker_non_purgeable_seeks sysfs
+	  attribute. This is the cost, as reported to the core shrinker, of
+	  recreating non-purgeable buffer objects relative to purgeable
+	  ones, which use DEFAULT_SEEKS (2). Higher values reduce memory
+	  reclaim pressure on non-purgeable buffer objects, which need
+	  GPU idling and writeback to be reclaimed, in favour of purgeable
+	  ones and other kernel caches.
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 18783a286a83..ff5d25dd867c 100644
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
+ * shrinker_non_purgeable_seeks - Report/change the cost, relative to
+ * purgeable buffer objects, of recreating non-purgeable buffer objects
+ * reclaimed by the shrinker. Higher values reduce reclaim pressure on
+ * non-purgeable buffer objects. Valid values are 1 to 64. Defaults to
+ * CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS.
  */
 
 static ssize_t
@@ -294,11 +301,54 @@ static const struct attribute_group device_uid_attr_group = {
 	.attrs = device_uid_attrs,
 };
 
+static ssize_t
+shrinker_non_purgeable_seeks_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+
+	return sysfs_emit(buf, "%d\n",
+			  xe_shrinker_non_purgeable_seeks(xe->mem.shrinker));
+}
+
+static ssize_t
+shrinker_non_purgeable_seeks_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	unsigned int seeks;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &seeks);
+	if (ret)
+		return ret;
+
+	ret = xe_shrinker_set_non_purgeable_seeks(xe->mem.shrinker, seeks);
+
+	return ret ?: count;
+}
+
+static DEVICE_ATTR_RW(shrinker_non_purgeable_seeks);
+
+static struct attribute *shrinker_attrs[] = {
+	&dev_attr_shrinker_non_purgeable_seeks.attr,
+	NULL
+};
+
+static const struct attribute_group shrinker_attr_group = {
+	.attrs = shrinker_attrs,
+};
+
 int xe_device_sysfs_init(struct xe_device *xe)
 {
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
index 378022c37a57..39aa0fad8c24 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -14,6 +14,19 @@
 #include "xe_pm.h"
 #include "xe_shrinker.h"
 
+/*
+ * Reclaiming non-purgeable objects requires GPU idling and writeback to a
+ * backup store, and restoring them requires reading the contents back.
+ * Tell the shrinker core they're costlier to recreate than purgeable
+ * objects, which use DEFAULT_SEEKS, so that purgeable objects are
+ * preferentially reclaimed. The default is
+ * CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS, overridable through sysfs.
+ * Zero is disallowed, since the shrinker core treats it specially and
+ * reads the value unlocked.
+ */
+#define XE_SHRINKER_NON_PURGEABLE_SEEKS_MIN 1
+#define XE_SHRINKER_NON_PURGEABLE_SEEKS_MAX 64
+
 /**
  * struct xe_shrinker - per-device shrinker
  * @xe: Back pointer to the device.
@@ -21,7 +34,8 @@
  * @shrinkable_pages: Number of pages that are currently shrinkable.
  * @purgeable_pages: Number of pages that are currently purgeable.
  * @populated_tts: Number of populated ttm_tts currently shrinkable or purgeable.
- * @shrink: Pointer to the mm shrinker.
+ * @shrink: Pointer to the mm shrinker handling non-purgeable (shrinkable) objects.
+ * @purge_shrink: Pointer to the mm shrinker handling purgeable objects.
  * @pm_worker: Worker to wake up the device if required.
  */
 struct xe_shrinker {
@@ -31,6 +45,7 @@ struct xe_shrinker {
 	long purgeable_pages;
 	long populated_tts;
 	struct shrinker *shrink;
+	struct shrinker *purge_shrink;
 	struct work_struct pm_worker;
 };
 
@@ -179,6 +194,19 @@ static int xe_shrinker_walk(struct xe_shrinker *shrinker,
 	return ret;
 }
 
+static unsigned long
+xe_shrinker_count_purgeable(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	unsigned long num_pages;
+
+	read_lock(&shrinker->lock);
+	num_pages = shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	return num_pages ? num_pages : SHRINK_EMPTY;
+}
+
 static unsigned long
 xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
@@ -194,7 +222,6 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 	else
 		num_pages = 0;
 
-	num_pages += shrinker->purgeable_pages;
 	read_unlock(&shrinker->lock);
 
 	return num_pages ? num_pages : SHRINK_EMPTY;
@@ -207,8 +234,7 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
  * If bo shrinking needs an rpm reference and we don't have it (yet),
  * that bo will be skipped anyway.
  */
-static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
-				       unsigned long nr_to_scan, bool can_backup)
+static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker)
 {
 	struct xe_device *xe = shrinker->xe;
 
@@ -216,63 +242,52 @@ static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
 	    !ttm_backup_bytes_avail())
 		return false;
 
-	if (!force) {
-		read_lock(&shrinker->lock);
-		force = (nr_to_scan > shrinker->purgeable_pages && can_backup);
-		read_unlock(&shrinker->lock);
-		if (!force)
-			return false;
-	}
-
 	return __xe_shrinker_runtime_pm_get(shrinker);
 }
 
-static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+static unsigned long xe_shrinker_scan_purgeable(struct shrinker *shrink,
+						struct shrink_control *sc)
 {
 	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
 		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
 	};
-	unsigned long nr_to_scan, nr_scanned = 0, freed = 0;
+	unsigned long nr_to_scan = sc->nr_to_scan, nr_scanned = 0, freed = 0;
 	struct xe_bo_shrink_flags shrink_flags = {
 		.purge = true,
-		/* Don't request writeback without __GFP_IO. */
-		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
 	};
-	bool runtime_pm;
-	bool purgeable;
-	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
-
-	nr_to_scan = sc->nr_to_scan;
-
-	read_lock(&shrinker->lock);
-	purgeable = !!shrinker->purgeable_pages;
-	read_unlock(&shrinker->lock);
-
-	/* Might need runtime PM. Try to wake early if it looks like it. */
-	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
 
-	if (purgeable && nr_scanned < nr_to_scan)
-		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
-				 nr_to_scan, &nr_scanned, &freed);
+	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
-	if (nr_scanned >= nr_to_scan || !can_backup)
-		goto out;
 
-	/* If we didn't wake before, try to do it now if needed. */
-	if (!runtime_pm)
-		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backup);
+	return nr_scanned ? freed : SHRINK_STOP;
+}
 
-	shrink_flags.purge = false;
+static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
+	};
+	unsigned long nr_to_scan = sc->nr_to_scan, nr_scanned = 0, freed = 0;
+	struct xe_bo_shrink_flags shrink_flags = {
+		.purge = false,
+		/* Don't request writeback without __GFP_IO. */
+		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
+	};
+	bool runtime_pm;
+
+	/* Might need runtime PM to access backed-up or CCS-compressed data. */
+	runtime_pm = xe_shrinker_runtime_pm_get(shrinker);
 
-	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
-			 nr_to_scan, &nr_scanned, &freed);
+	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
-out:
 	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
+
 	return nr_scanned ? freed : SHRINK_STOP;
 }
 
@@ -294,10 +309,45 @@ static void xe_shrinker_fini(struct drm_device *drm, void *arg)
 	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
 	xe_assert(shrinker->xe, !shrinker->populated_tts);
 	shrinker_free(shrinker->shrink);
+	shrinker_free(shrinker->purge_shrink);
 	flush_work(&shrinker->pm_worker);
 	kfree(shrinker);
 }
 
+/**
+ * xe_shrinker_non_purgeable_seeks() - Get the non-purgeable shrinker seeks
+ * @shrinker: Pointer to the struct xe_shrinker.
+ *
+ * Return: The seeks value of the non-purgeable shrinker.
+ */
+int xe_shrinker_non_purgeable_seeks(struct xe_shrinker *shrinker)
+{
+	return READ_ONCE(shrinker->shrink->seeks);
+}
+
+/**
+ * xe_shrinker_set_non_purgeable_seeks() - Set the non-purgeable shrinker seeks
+ * @shrinker: Pointer to the struct xe_shrinker.
+ * @seeks: The new seeks value.
+ *
+ * Set the cost of recreating non-purgeable objects relative to purgeable
+ * objects, which use DEFAULT_SEEKS. Higher values reduce reclaim pressure
+ * on non-purgeable objects.
+ *
+ * Return: %0 on success, -EINVAL if @seeks is out of range.
+ */
+int xe_shrinker_set_non_purgeable_seeks(struct xe_shrinker *shrinker,
+					unsigned int seeks)
+{
+	if (seeks < XE_SHRINKER_NON_PURGEABLE_SEEKS_MIN ||
+	    seeks > XE_SHRINKER_NON_PURGEABLE_SEEKS_MAX)
+		return -EINVAL;
+
+	WRITE_ONCE(shrinker->shrink->seeks, seeks);
+
+	return 0;
+}
+
 /**
  * xe_shrinker_create() - Create an xe per-device shrinker
  * @xe: Pointer to the xe device.
@@ -311,8 +361,15 @@ int xe_shrinker_create(struct xe_device *xe)
 	if (!shrinker)
 		return -ENOMEM;
 
-	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem:%s", xe->drm.unique);
+	shrinker->purge_shrink = shrinker_alloc(0, "drm-xe_gem-purgeable:%s", xe->drm.unique);
+	if (!shrinker->purge_shrink) {
+		kfree(shrinker);
+		return -ENOMEM;
+	}
+
+	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem-shrinkable:%s", xe->drm.unique);
 	if (!shrinker->shrink) {
+		shrinker_free(shrinker->purge_shrink);
 		kfree(shrinker);
 		return -ENOMEM;
 	}
@@ -320,10 +377,18 @@ int xe_shrinker_create(struct xe_device *xe)
 	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
 	shrinker->xe = xe;
 	rwlock_init(&shrinker->lock);
+
+	shrinker->purge_shrink->count_objects = xe_shrinker_count_purgeable;
+	shrinker->purge_shrink->scan_objects = xe_shrinker_scan_purgeable;
+	shrinker->purge_shrink->private_data = shrinker;
+	shrinker_register(shrinker->purge_shrink);
+
 	shrinker->shrink->count_objects = xe_shrinker_count;
 	shrinker->shrink->scan_objects = xe_shrinker_scan;
 	shrinker->shrink->private_data = shrinker;
+	shrinker->shrink->seeks = CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS;
 	shrinker_register(shrinker->shrink);
+
 	xe->mem.shrinker = shrinker;
 
 	return drmm_add_action_or_reset(&xe->drm, xe_shrinker_fini, shrinker);
diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
index 9c63e22b3b73..4b3c73689619 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.h
+++ b/drivers/gpu/drm/xe/xe_shrinker.h
@@ -14,4 +14,8 @@ void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long p
 
 int xe_shrinker_create(struct xe_device *xe);
 
+int xe_shrinker_non_purgeable_seeks(struct xe_shrinker *shrinker);
+int xe_shrinker_set_non_purgeable_seeks(struct xe_shrinker *shrinker,
+					unsigned int seeks);
+
 #endif
-- 
2.56.0

