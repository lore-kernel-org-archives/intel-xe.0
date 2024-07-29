Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10249C52D1D
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 23:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D550210E444;
	Mon, 29 Jul 2024 23:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwLTz3Iu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481FD10E3CE
 for <Intel-Xe@lists.freedesktop.org>; Mon, 29 Jul 2024 23:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722295075; x=1753831075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WqPyiApqO577Tg3ls1n0hfLA6J6atkyGRxKoMT2w2Aw=;
 b=JwLTz3IutAKoL+t6Wq64iUA+hQ6Cbx/Ee2fGsqyQ91d5GkO/4aZKlW4j
 JSO9LbsYzKtcbSv0Q5SK/x4KT/0ev0+CrGT2JZocJTQlS04mfKxqE5tV/
 v6A07aJHdpdeZCBYUZsECwSy+BcU2W3y7MX8oJoVUG7uEKayv7nHkUKvo
 KMOSK1SXNiV+/3lnpvFoaEWiJcvhZ/m/jDiv6zOdDv6QcPVQuM2emqJgr
 9S33nMiXXF6Cu0ElcDf4s5b5rAAWR/vjoMgHcUR9LuIo5gyijXYhrjXY3
 KAnQrBNMZjhTT1KxZcg7XHBPP7lu5/MQVu/5ov/h3yA2ak4R/C4srIzaZ w==;
X-CSE-ConnectionGUID: W/Exns5wQe6f3Fm8wYmg+g==
X-CSE-MsgGUID: ToMFFiJsRg+Z4KFhoFXcSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19966922"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="19966922"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 16:17:54 -0700
X-CSE-ConnectionGUID: rTW2+0sZSvGVssZ2rBcy9Q==
X-CSE-MsgGUID: fFYDxm0FRe24FfwT84yvuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="54103539"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa009.jf.intel.com with ESMTP; 29 Jul 2024 16:17:54 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 3/8] drm/xe/guc: Use a two stage dump for GuC logs and add
 more info
Date: Mon, 29 Jul 2024 16:17:47 -0700
Message-ID: <20240729231753.3101070-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Split the GuC log dump into a two stage snapshot and print mechanism.
This allows the log to be captured at the point of an error (which may
be in a restricted context) and then dump it out later (from a regular
context such as a worker function or a sysfs file handler).

Also add a bunch of other useful pieces of information that can help
(or are fundamentally required!) to decode and parse the log.

v2: Add kerneldoc and fix a couple of comment typos - review feedback
from Michal W.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |   1 +
 drivers/gpu/drm/xe/xe_guc_log.c       | 185 ++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_log.h       |   5 +
 drivers/gpu/drm/xe/xe_guc_log_types.h |  29 ++++
 4 files changed, 183 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index a5fd14307f94..b27b73680c12 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -84,6 +84,7 @@
 #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
 #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
 #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
+#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
 
 #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
 #define   GUC_SEND_TRIGGER			REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 6e0f36c4b5f6..b6ee019cd886 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -7,12 +7,20 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_map.h"
+#include "xe_mmio.h"
 #include "xe_module.h"
 
+static struct xe_guc *
+log_to_guc(struct xe_guc_log *log)
+{
+	return container_of(log, struct xe_guc, log);
+}
+
 static struct xe_gt *
 log_to_gt(struct xe_guc_log *log)
 {
@@ -108,68 +116,171 @@ static void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
 
 #define GUC_LOG_CHUNK_SIZE	SZ_2M
 
-/**
- * xe_guc_log_print - dump a copy of the GuC log to some useful location
- * @log: GuC log structure
- * @p: the printer object to output to
- * @atomic: is the call inside an atomic section of some kind?
- */
-void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic)
+static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
 {
-	struct xe_device *xe = log_to_xe(log);
-	size_t total_size, remain;
-	void **copy;
-	int num_chunks, i;
+	struct xe_guc_log_snapshot *snapshot;
+	size_t remain;
+	int i;
 
-	xe_assert(xe, log->bo);
+	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (!snapshot)
+		return NULL;
 
 	/*
 	 * NB: kmalloc has a hard limit well below the maximum GuC log buffer size.
 	 * Also, can't use vmalloc as might be called from atomic context. So need
 	 * to break the buffer up into smaller chunks that can be allocated.
 	 */
-	total_size = log->bo->size;
-	num_chunks = DIV_ROUND_UP(total_size, GUC_LOG_CHUNK_SIZE);
+	snapshot->size = log->bo->size;
+	snapshot->num_chunks = DIV_ROUND_UP(snapshot->size, GUC_LOG_CHUNK_SIZE);
 
-	copy = kcalloc(num_chunks, sizeof(*copy), atomic ? GFP_ATOMIC : GFP_KERNEL);
-	if (!copy) {
-		drm_printf(p, "Failed to allocate array x%d", num_chunks);
-		return;
-	}
+	snapshot->copy = kcalloc(snapshot->num_chunks, sizeof(*snapshot->copy),
+				 atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (!snapshot->copy)
+		goto fail_snap;
 
-	remain = total_size;
-	for (i = 0; i < num_chunks; i++) {
+	remain = snapshot->size;
+	for (i = 0; i < snapshot->num_chunks; i++) {
 		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
 
-		copy[i] = kmalloc(size, atomic ? GFP_ATOMIC : GFP_KERNEL);
-		if (!copy[i]) {
-			drm_printf(p, "Failed to allocate %ld at chunk %d of %d",
-				   size, i, num_chunks);
-			goto out;
-		}
+		snapshot->copy[i] = kmalloc(size, atomic ? GFP_ATOMIC : GFP_KERNEL);
+		if (!snapshot->copy[i])
+			goto fail_copy;
 		remain -= size;
 	}
 
-	remain = total_size;
-	for (i = 0; i < num_chunks; i++) {
+	return snapshot;
+
+fail_copy:
+	for (i = 0; i < snapshot->num_chunks; i++)
+		kfree(snapshot->copy[i]);
+	kfree(snapshot->copy);
+fail_snap:
+	kfree(snapshot);
+	return NULL;
+}
+
+/**
+ * xe_guc_log_snapshot_free - free a previously captured GuC log snapshot
+ * @log: GuC log structure
+ * @atomic: is the call inside an atomic section of some kind?
+ *
+ * Return: pointer to a newly allocated snapshot object or null if out of memory. Caller is
+ * responsible for calling xe_guc_log_snapshot_free when done with the snapshot.
+ */
+void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
+{
+	int i;
+
+	if (!snapshot)
+		return;
+
+	if (!snapshot->copy) {
+		for (i = 0; i < snapshot->num_chunks; i++)
+			kfree(snapshot->copy[i]);
+		kfree(snapshot->copy);
+	}
+
+	kfree(snapshot);
+}
+
+/**
+ * xe_guc_log_snapshot_capture - create a new snapshot copy the GuC log for later dumping
+ * @log: GuC log structure
+ * @atomic: is the call inside an atomic section of some kind?
+ *
+ * Return: pointer to a newly allocated snapshot object or null if out of memory. Caller is
+ * responsible for calling xe_guc_log_snapshot_free when done with the snapshot.
+ */
+struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic)
+{
+	struct xe_guc_log_snapshot *snapshot;
+	struct xe_device *xe = log_to_xe(log);
+	struct xe_guc *guc = log_to_guc(log);
+	struct xe_gt *gt = log_to_gt(log);
+	size_t remain;
+	int i;
+
+	if (!log->bo) {
+		xe_gt_err(gt, "GuC log not allocated!\n");
+		return NULL;
+	}
+
+	snapshot = xe_guc_log_snapshot_alloc(log, atomic);
+	if (!snapshot) {
+		xe_gt_err(gt, "GuC log snapshot not allocated!\n");
+		return NULL;
+	}
+
+	remain = snapshot->size;
+	for (i = 0; i < snapshot->num_chunks; i++) {
 		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
 
-		xe_map_memcpy_from(xe, copy[i], &log->bo->vmap, i * GUC_LOG_CHUNK_SIZE, size);
+		xe_map_memcpy_from(xe, snapshot->copy[i], &log->bo->vmap,
+				   i * GUC_LOG_CHUNK_SIZE, size);
 		remain -= size;
 	}
 
-	remain = total_size;
-	for (i = 0; i < num_chunks; i++) {
+	snapshot->ktime = ktime_get_boottime_ns();
+	snapshot->stamp = xe_mmio_read32(gt, GUC_PMTIMESTAMP);
+	snapshot->ref_clk = gt->info.reference_clock;
+	snapshot->level = log->level;
+	snapshot->ver_found = guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
+	snapshot->ver_want = guc->fw.versions.wanted;
+	snapshot->path = guc->fw.path;
+
+	return snapshot;
+}
+
+/**
+ * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
+ * @xe: an Xe device structure
+ * @snapshot: a snapshot of the GuC log
+ * @p: the printer object to output to
+ * @atomic: is the call inside an atomic section of some kind?
+ */
+void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot *snapshot,
+			       struct drm_printer *p, bool atomic)
+{
+	size_t remain;
+	int i;
+
+	if (!snapshot) {
+		drm_printf(p, "GuC log snapshot not allocated!\n");
+		return;
+	}
+
+	drm_printf(p, "GuC version %u.%u.%u (wanted %u.%u.%u)\n",
+		   snapshot->ver_found.major, snapshot->ver_found.minor, snapshot->ver_found.patch,
+		   snapshot->ver_want.major, snapshot->ver_want.minor, snapshot->ver_want.patch);
+	drm_printf(p, "GuC firmware: %s\n", snapshot->path);
+	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", snapshot->ktime, snapshot->ktime);
+	drm_printf(p, "GuC timestamp: 0x%08X [%u]\n", snapshot->stamp, snapshot->stamp);
+	drm_printf(p, "CS timestamp frequency: %u Hz\n", snapshot->ref_clk);
+	drm_printf(p, "Log level: %u\n", snapshot->level);
+
+	remain = snapshot->size;
+	for (i = 0; i < snapshot->num_chunks; i++) {
 		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
 
-		xe_hexdump_blob(xe, copy[i], size, p, atomic);
+		xe_hexdump_blob(xe, snapshot->copy[i], size, p, atomic);
 		remain -= size;
 	}
+}
+
+/**
+ * xe_guc_log_print - dump a copy of the GuC log to some useful location
+ * @log: GuC log structure
+ * @p: the printer object to output to
+ * @atomic: is the call inside an atomic section of some kind?
+ */
+void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic)
+{
+	struct xe_guc_log_snapshot *snapshot;
 
-out:
-	for (i = 0; i < num_chunks; i++)
-		kfree(copy[i]);
-	kfree(copy);
+	snapshot = xe_guc_log_snapshot_capture(log, atomic);
+	xe_guc_log_snapshot_print(log_to_xe(log), snapshot, p, atomic);
+	xe_guc_log_snapshot_free(snapshot);
 }
 
 int xe_guc_log_init(struct xe_guc_log *log)
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 5149b492c3b8..88e47e9907ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -9,6 +9,7 @@
 #include "xe_guc_log_types.h"
 
 struct drm_printer;
+struct xe_device;
 
 #if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
 #define CRASH_BUFFER_SIZE       SZ_1M
@@ -38,6 +39,10 @@ struct drm_printer;
 
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic);
+struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
+void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot *snapshot,
+			       struct drm_printer *p, bool atomic);
+void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
 
 static inline u32
 xe_guc_log_get_level(struct xe_guc_log *log)
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index 125080d138a7..befc973c063a 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -8,8 +8,37 @@
 
 #include <linux/types.h>
 
+#include "xe_uc_fw_types.h"
+
 struct xe_bo;
 
+/**
+ * struct xe_guc_log_snapshot:
+ * Capture of the GuC log plus various state useful for decoding the log
+ */
+struct xe_guc_log_snapshot {
+	/** @size: Size in bytes of the @copy allocation */
+	size_t size;
+	/** @copy: Host memory copy of the log buffer for later dumping, split into chunks */
+	void **copy;
+	/** @num_chunks: Number of chunks within @copy */
+	int num_chunks;
+	/** @ktime: Kernel time the snapshot was taken */
+	u64 ktime;
+	/** @stamp: GuC timestamp at which the snapshot was taken */
+	u32 stamp;
+	/** @ref_clk: GuC timestamp frequency */
+	u32 ref_clk;
+	/** @level: GuC log verbosity level */
+	u32 level;
+	/** @ver_found: GuC firmware version */
+	struct xe_uc_fw_version ver_found;
+	/** @ver_want: GuC firmware version that driver expected */
+	struct xe_uc_fw_version ver_want;
+	/** @path: Path of GuC firmware blob */
+	const char *path;
+};
+
 /**
  * struct xe_guc_log - GuC log
  */
-- 
2.43.2

