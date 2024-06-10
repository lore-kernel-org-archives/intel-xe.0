Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ECAC27C5F
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 22:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC04210E3EC;
	Mon, 10 Jun 2024 22:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKJ/6c5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCE610E33D
 for <Intel-Xe@lists.freedesktop.org>; Mon, 10 Jun 2024 22:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718060203; x=1749596203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJ0MUXAzsDbZWgKbRDw0Zr0Te5VksCYSlPswN00i0GI=;
 b=gKJ/6c5yEuHolvpooY0ynd98CG3s4OIgtbckMPNcs1AyoxVOYGS0u5S9
 qqK8W7fL2ZTeeGLBUd7c2mhLkyDgMRIYCt+Sv8dUl88QrW9sX1DPJuz23
 kmVXur+WvMo52deGQRspF8MeMYoLCsogjCAPda2evLNqt6yL4ZrUQOsb+
 smxfDEZqM+N54hffOVuPWH6svA9w4YxKTzAGZh18529qKqxiNOmd6uHpu
 o4NM3KobhQy2OotSWAPgLotTDxsOFTiO6B60+Oo7ITLf+G20qKcgVTJeD
 ygjRBaIZTwaXsKhOnyKLhTvPXWAKhhnUkhysW590q7l8rUm3Qufv16F4D g==;
X-CSE-ConnectionGUID: sex8Jui9ScucW7gob0EC8g==
X-CSE-MsgGUID: 4LSYPq7pR0OaUyRHqjQX7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25409022"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25409022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 15:56:41 -0700
X-CSE-ConnectionGUID: MTtJmpmtRy2riZft3MoBYw==
X-CSE-MsgGUID: YxEyVLW5So28nqPa8f36dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39784065"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2024 15:56:41 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 3/7] drm/xe/guc: Use a two stage dump for GuC logs and add
 more info
Date: Mon, 10 Jun 2024 15:56:36 -0700
Message-ID: <20240610225640.2100465-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610225640.2100465-1-John.C.Harrison@Intel.com>
References: <20240610225640.2100465-1-John.C.Harrison@Intel.com>
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
be in a resticted context) and then dump it out later (from a regular
context such as a worker function or a sysfs file handler).

Also add a bunch of other useful pieces of information that can help
(or are fundamentally required!) to decode and parse the log.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |   1 +
 drivers/gpu/drm/xe/xe_guc_log.c       | 150 ++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_log.h       |   6 ++
 drivers/gpu/drm/xe/xe_guc_log_types.h |  29 +++++
 4 files changed, 155 insertions(+), 31 deletions(-)

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
index a35309926271..a35d3cc0c369 100644
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
@@ -108,62 +116,142 @@ static void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
 
 #define GUC_LOG_CHUNK_SIZE	SZ_2M
 
-void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic)
+struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
 {
-	struct xe_device *xe = log_to_xe(log);
-	size_t size, remain;
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
-	size = log->bo->size;
-	num_chunks = (size + GUC_LOG_CHUNK_SIZE - 1) / GUC_LOG_CHUNK_SIZE;
+	snapshot->size = log->bo->size;
+	snapshot->num_chunks = (snapshot->size + GUC_LOG_CHUNK_SIZE - 1) / GUC_LOG_CHUNK_SIZE;
 
-	copy = kcalloc(num_chunks, sizeof(*copy), atomic ? GFP_ATOMIC : GFP_KERNEL);
-	if (!copy) {
-		drm_printf(p, "Failed to allocate array x%d", num_chunks);
-		return;
-	}
+	snapshot->copy = kcalloc(snapshot->num_chunks, sizeof(*snapshot->copy),
+				 atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (!snapshot->copy)
+		goto fail_snap;
 
-	remain = size;
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
 
-	remain = size;
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
 
-	remain = size;
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
index 5149b492c3b8..6e4d0b369c19 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -9,6 +9,7 @@
 #include "xe_guc_log_types.h"
 
 struct drm_printer;
+struct xe_device;
 
 #if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
 #define CRASH_BUFFER_SIZE       SZ_1M
@@ -38,6 +39,11 @@ struct drm_printer;
 
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic);
+struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic);
+struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
+void xe_guc_log_snapshot_print(struct xe_device *xe, struct xe_guc_log_snapshot *snapshot,
+			       struct drm_printer *p, bool atomic);
+void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
 
 static inline u32
 xe_guc_log_get_level(struct xe_guc_log *log)
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index 125080d138a7..e3a6a44c2f18 100644
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
+	/** @num_chunks: Number of chunks withint @copy */
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

