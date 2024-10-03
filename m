Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1254FCF854C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 00:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B468E10E356;
	Thu,  3 Oct 2024 00:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7K1y3z0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2077A10E0D8
 for <Intel-Xe@lists.freedesktop.org>; Thu,  3 Oct 2024 00:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727916373; x=1759452373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AuO3pfeTjx+88vof+stJChDzV0/S1Mz4R4jkE7bP+To=;
 b=O7K1y3z0XynNZ6/zWZuB0V/VuPPDQ+NnmUm6tVSeVWG0VXDVv6oHiYW0
 tAoCke7lPa8mX7ZL6gw8iATlQbWU9gLIkthJEPTERB3LNPh8kRln451oA
 ZzLUy8R+7FUZeVb+p+wFf5FGfJbRIZB3wRp1X0fOdjG61bkHNnXHh+Wh9
 xwrlf4YMc8xeqM4amXgFMh41PQQbtL//A2OphuM4YKlV17/o157WPrdxM
 yg4blKm5Fx+hJhK6JGYa8YyoCrMe9tYpiJHOT4yecoB+pdBHzsXaR08F3
 BFwhsNFGvqMTpim1uP10zxoxNiQItl7Ts8RIoL1vRLa/sYcL44RHetkqi A==;
X-CSE-ConnectionGUID: MsUCPJaHSHC5njsm78u5fg==
X-CSE-MsgGUID: YsCwmjgNSRq8qxAXcWZhjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38460025"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="38460025"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:46:13 -0700
X-CSE-ConnectionGUID: k//bshAKSUu69eouj5JwnQ==
X-CSE-MsgGUID: qPBjVZkGRdG0jIQy81VeTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="97514747"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 02 Oct 2024 17:46:12 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v9 06/11] drm/xe/guc: Use a two stage dump for GuC logs and
 add more info
Date: Wed,  2 Oct 2024 17:46:06 -0700
Message-ID: <20241003004611.2323493-7-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
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
v3: Move chunking code to this patch as it makes the deltas simpler.
Fix a bunch of kerneldoc issues.
v4: Move the CS frequency out of the coredump snapshot function into
the debugfs only code (as that info is already part of the main
devcoredump). Add a header to the debugfs log to match the one in the
devcoredump to aid processing by a unified tool. Add forcewake to the
GuC timestamp read so it actually works.
v6: Add colon to GuC version string (review feedback by Julia F).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |   1 +
 drivers/gpu/drm/xe/xe_guc_log.c       | 178 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h       |   4 +
 drivers/gpu/drm/xe/xe_guc_log_types.h |  27 ++++
 4 files changed, 195 insertions(+), 15 deletions(-)

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
index be47780ec2a7..24564624e91e 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -6,15 +6,23 @@
 #include "xe_guc_log.h"
 
 #include <drm/drm_managed.h>
-#include <linux/vmalloc.h>
 
+#include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
+#include "xe_force_wake.h"
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
@@ -52,35 +60,175 @@ static size_t guc_log_size(void)
 		CAPTURE_BUFFER_SIZE;
 }
 
+#define GUC_LOG_CHUNK_SIZE	SZ_2M
+
+static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
+{
+	struct xe_guc_log_snapshot *snapshot;
+	size_t remain;
+	int i;
+
+	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (!snapshot)
+		return NULL;
+
+	/*
+	 * NB: kmalloc has a hard limit well below the maximum GuC log buffer size.
+	 * Also, can't use vmalloc as might be called from atomic context. So need
+	 * to break the buffer up into smaller chunks that can be allocated.
+	 */
+	snapshot->size = log->bo->size;
+	snapshot->num_chunks = DIV_ROUND_UP(snapshot->size, GUC_LOG_CHUNK_SIZE);
+
+	snapshot->copy = kcalloc(snapshot->num_chunks, sizeof(*snapshot->copy),
+				 atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (!snapshot->copy)
+		goto fail_snap;
+
+	remain = snapshot->size;
+	for (i = 0; i < snapshot->num_chunks; i++) {
+		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
+
+		snapshot->copy[i] = kmalloc(size, atomic ? GFP_ATOMIC : GFP_KERNEL);
+		if (!snapshot->copy[i])
+			goto fail_copy;
+		remain -= size;
+	}
+
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
 /**
- * xe_guc_log_print - dump a copy of the GuC log to some useful location
+ * xe_guc_log_snapshot_free - free a previously captured GuC log snapshot
+ * @snapshot: GuC log snapshot structure
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
  * @log: GuC log structure
- * @p: the printer object to output to
+ * @atomic: is the call inside an atomic section of some kind?
+ *
+ * Return: pointer to a newly allocated snapshot object or null if out of memory. Caller is
+ * responsible for calling xe_guc_log_snapshot_free when done with the snapshot.
  */
-void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
+struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic)
 {
+	struct xe_guc_log_snapshot *snapshot;
 	struct xe_device *xe = log_to_xe(log);
-	size_t size;
-	void *copy;
+	struct xe_guc *guc = log_to_guc(log);
+	struct xe_gt *gt = log_to_gt(log);
+	size_t remain;
+	int i, err;
 
 	if (!log->bo) {
-		drm_puts(p, "GuC log buffer not allocated");
-		return;
+		xe_gt_err(gt, "GuC log buffer not allocated\n");
+		return NULL;
+	}
+
+	snapshot = xe_guc_log_snapshot_alloc(log, atomic);
+	if (!snapshot) {
+		xe_gt_err(gt, "GuC log snapshot not allocated\n");
+		return NULL;
 	}
 
-	size = log->bo->size;
+	remain = snapshot->size;
+	for (i = 0; i < snapshot->num_chunks; i++) {
+		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
+
+		xe_map_memcpy_from(xe, snapshot->copy[i], &log->bo->vmap,
+				   i * GUC_LOG_CHUNK_SIZE, size);
+		remain -= size;
+	}
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err) {
+		snapshot->stamp = ~0;
+	} else {
+		snapshot->stamp = xe_mmio_read32(&gt->mmio, GUC_PMTIMESTAMP);
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	}
+	snapshot->ktime = ktime_get_boottime_ns();
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
+ * @snapshot: a snapshot of the GuC log
+ * @p: the printer object to output to
+ */
+void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
+{
+	size_t remain;
+	int i;
 
-	copy = vmalloc(size);
-	if (!copy) {
-		drm_printf(p, "Failed to allocate %zu", size);
+	if (!snapshot) {
+		drm_printf(p, "GuC log snapshot not allocated!\n");
 		return;
 	}
 
-	xe_map_memcpy_from(xe, copy, &log->bo->vmap, 0, size);
+	drm_printf(p, "GuC firmware: %s\n", snapshot->path);
+	drm_printf(p, "GuC version: %u.%u.%u (wanted %u.%u.%u)\n",
+		   snapshot->ver_found.major, snapshot->ver_found.minor, snapshot->ver_found.patch,
+		   snapshot->ver_want.major, snapshot->ver_want.minor, snapshot->ver_want.patch);
+	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", snapshot->ktime, snapshot->ktime);
+	drm_printf(p, "GuC timestamp: 0x%08X [%u]\n", snapshot->stamp, snapshot->stamp);
+	drm_printf(p, "Log level: %u\n", snapshot->level);
+
+	remain = snapshot->size;
+	for (i = 0; i < snapshot->num_chunks; i++) {
+		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
+
+		xe_print_blob_ascii85(p, i ? NULL : "Log data", snapshot->copy[i], 0, size);
+		remain -= size;
+	}
+}
+
+/**
+ * xe_guc_log_print - dump a copy of the GuC log to some useful location
+ * @log: GuC log structure
+ * @p: the printer object to output to
+ */
+void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
+{
+	struct xe_guc_log_snapshot *snapshot;
 
-	xe_print_blob_ascii85(p, "Log data", copy, 0, size);
+	drm_printf(p, "**** GuC Log ****\n");
 
-	vfree(copy);
+	snapshot = xe_guc_log_snapshot_capture(log, false);
+	drm_printf(p, "CS reference clock: %u\n", log_to_gt(log)->info.reference_clock);
+	xe_guc_log_snapshot_print(snapshot, p);
+	xe_guc_log_snapshot_free(snapshot);
 }
 
 int xe_guc_log_init(struct xe_guc_log *log)
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 2d25ab28b4b3..949d2c98343d 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -9,6 +9,7 @@
 #include "xe_guc_log_types.h"
 
 struct drm_printer;
+struct xe_device;
 
 #if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
 #define CRASH_BUFFER_SIZE       SZ_1M
@@ -38,6 +39,9 @@ struct drm_printer;
 
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
+struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
+void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
+void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
 
 static inline u32
 xe_guc_log_get_level(struct xe_guc_log *log)
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index 125080d138a7..962b9edbd9eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -8,8 +8,35 @@
 
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
2.46.0

