Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDDB606A32D
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 00:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ERTTqxvM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74471132A9;
	Sat,  7 Nov 2026 00:01:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3082010E032
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Nov 2026 00:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794009666; x=1825545666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8YP5U0oaSKoP9WymEUU/j47e9GSFyp7emjrdb6JEzz0=;
 b=ERTTqxvMVBZ+r3wb9LZralcJ8uaLr/P8VozszjfuF6e3+PSDvfxVcxFG
 s+Jdpbe83ecTDT8m3Osk6FmF4Ry0SXHZ1S+HPmNUsmydjSU5VI07DxWv3
 XqFmgRMkygF86Ri2LbZHXUbRHJfxQmg17Up7KeyzdkO8ay0xBmqsCWW3M
 J5LbLIdlQGeEDzuTAwc3w7xYSeGVsp2aowm9ZeDXVd/Zg98Wh5v8C7ATI
 3+cRHJcKekIhKyYJl1ZKJ9XgQBQmY/MplgkSqGT7y8Dc0PpOh7EwbhpiD
 nxkfYPpx2Tujs8vbIPoXtw3CDPzV3x38IVvF5FCxIQT8wgjUVm+MmWD+a g==;
X-CSE-ConnectionGUID: 0KRk6+24S5CAHafvl0TNYg==
X-CSE-MsgGUID: mZ3kV+oDRFyQruvr6e9TUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2730118"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2730118"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 16:01:05 -0800
X-CSE-ConnectionGUID: fH6gv9rZRf2aR27VUuAxwg==
X-CSE-MsgGUID: iZNn3Z4GTtK7kDrEe+VUfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="9170414"
Received: from miryad.jf.intel.com ([10.54.30.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 16:01:05 -0800
From: Carlos Santa <carlos.santa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Carlos Santa <carlos.santa@intel.com>
Subject: drm/xe/guc: Use vzalloc for GuC log snapshot capture
Date: Fri,  6 Nov 2026 15:48:06 -0800
Message-ID: <20261106234806.704033-1-carlos.santa@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When capturing a devcoredump following a GPU engine hang,
xe_guc_log_snapshot_alloc() attempts to break the log into 2MB (SZ_2M)
chunks using kmalloc() under GFP_ATOMIC:

  kworker/u32:4: page allocation failure: order:9, mode:0x40820(GFP_ATOMIC|__GFP_COMP)
  Call Trace:
   <TASK>
   warn_alloc+0x143/0x210
   __alloc_frozen_pages_noprof+0x112c/0x2050
   __kmalloc_noprof+0x40c/0x670
   xe_guc_log_snapshot_capture+0xff/0x360 [xe]
   xe_devcoredump+0x22e/0x340 [xe]
   guc_exec_queue_timedout_job+0x6de/0xbe0 [xe]
   drm_sched_job_timedout+0xec/0x1c0 [gpu_sched]
   process_scheduled_works+0x218/0x6d0
   worker_thread+0x188/0x3e0

An order-9 GFP_ATOMIC allocation requires 512 physically contiguous pages
and strictly forbids direct reclaim and compaction. Under severe memory
fragmentation—even when hundreds of megabytes of free order-0 pages
remain—this allocation fails consistently. Consequently, the devcoredump
is generated with a missing GuC log snapshot, losing critical telemetry
needed for post-mortem hang analysis.

Neither caller of xe_guc_log_snapshot_capture() (devcoredump and debugfs)
runs in an interrupt or atomic context. Devcoredump executes from the DRM
scheduler timeout worker (process context) and already relies on
sleepable GFP_KERNEL allocations throughout. Furthermore, the GuC log
snapshot buffer is purely a temporary CPU staging buffer formatted via
xe_print_blob_ascii85() for sysfs reads; it is never accessed by GPU DMA,
meaning physical contiguity is completely unnecessary.

Drop the artificial atomic constraint, remove the high-order chunking
and pointer array machinery, and allocate the snapshot buffer using
vzalloc().

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: LLM
Signed-off-by: Carlos Santa <carlos.santa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c       | 88 +++++----------------------
 drivers/gpu/drm/xe/xe_guc_log_types.h |  2 +-
 2 files changed, 16 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 80d80393b05d..89dbb238becf 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -11,6 +11,7 @@
 #endif
 
 #include <linux/utsname.h>
+#include <linux/vmalloc.h>
 #include <drm/drm_managed.h>
 
 #include "abi/guc_lfd_abi.h"
@@ -114,48 +115,22 @@ log_to_xe(struct xe_guc_log *log)
 	return gt_to_xe(log_to_gt(log));
 }
 
-static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
+static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log)
 {
 	struct xe_guc_log_snapshot *snapshot;
-	size_t remain;
-	int i;
 
-	snapshot = kzalloc_obj(*snapshot, atomic ? GFP_ATOMIC : GFP_KERNEL);
+	snapshot = kzalloc(sizeof(*snapshot), GFP_KERNEL);
 	if (!snapshot)
 		return NULL;
 
-	/*
-	 * NB: kmalloc has a hard limit well below the maximum GuC log buffer size.
-	 * Also, can't use vmalloc as might be called from atomic context. So need
-	 * to break the buffer up into smaller chunks that can be allocated.
-	 */
 	snapshot->size = xe_bo_size(log->bo);
-	snapshot->num_chunks = DIV_ROUND_UP(snapshot->size, GUC_LOG_CHUNK_SIZE);
-
-	snapshot->copy = kzalloc_objs(*snapshot->copy, snapshot->num_chunks,
-				      atomic ? GFP_ATOMIC : GFP_KERNEL);
-	if (!snapshot->copy)
-		goto fail_snap;
-
-	remain = snapshot->size;
-	for (i = 0; i < snapshot->num_chunks; i++) {
-		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
-
-		snapshot->copy[i] = kmalloc(size, atomic ? GFP_ATOMIC : GFP_KERNEL);
-		if (!snapshot->copy[i])
-			goto fail_copy;
-		remain -= size;
+	snapshot->data = vzalloc(snapshot->size);
+	if (!snapshot->data) {
+		kfree(snapshot);
+		return NULL;
 	}
 
 	return snapshot;
-
-fail_copy:
-	for (i = 0; i < snapshot->num_chunks; i++)
-		kfree(snapshot->copy[i]);
-	kfree(snapshot->copy);
-fail_snap:
-	kfree(snapshot);
-	return NULL;
 }
 
 /**
@@ -167,17 +142,10 @@ static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *
  */
 void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
 {
-	int i;
-
 	if (!snapshot)
 		return;
 
-	if (snapshot->copy) {
-		for (i = 0; i < snapshot->num_chunks; i++)
-			kfree(snapshot->copy[i]);
-		kfree(snapshot->copy);
-	}
-
+	vfree(snapshot->data);
 	xe_guc_dump_cache_fini(&snapshot->dump_cache);
 	kfree(snapshot);
 }
@@ -202,19 +170,10 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 	if (!log->bo)
 		return NULL;
 
-	snapshot = xe_guc_log_snapshot_alloc(log, atomic);
+	snapshot = xe_guc_log_snapshot_alloc(log);
 	if (!snapshot)
 		return NULL;
-
-	remain = snapshot->size;
-	for (i = 0; i < snapshot->num_chunks; i++) {
-		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
-
-		xe_map_memcpy_from(xe, snapshot->copy[i], &log->bo->vmap,
-				   i * GUC_LOG_CHUNK_SIZE, size);
-		remain -= size;
-	}
-
+	xe_map_memcpy_from(xe, snapshot->data, &log->bo->vmap, 0, snapshot->size);
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		snapshot->stamp = ~0ULL;
@@ -445,8 +404,8 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	drm_printf(p, "Log level: %u\n", snapshot->level);
 
 	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
-			  snapshot->copy, snapshot->num_chunks,
-			  GUC_LOG_CHUNK_SIZE, snapshot->size,
+			  &snapshot->data, 1,
+			  snapshot->size, snapshot->size,
 			  &snapshot->dump_cache);
 }
 
@@ -622,21 +581,7 @@ static void
 xe_guc_log_print_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
 			u32 from, u32 to)
 {
-	int chunk_from = from % GUC_LOG_CHUNK_SIZE;
-	int chunk_id = from / GUC_LOG_CHUNK_SIZE;
-	int to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
-	int chunk_to = to % GUC_LOG_CHUNK_SIZE;
-	int pos = from;
-
-	do {
-		size_t size = (to_chunk_id == chunk_id ? chunk_to : GUC_LOG_CHUNK_SIZE) -
-			      chunk_from;
-
-		lfd_output_binary(p, snapshot->copy[chunk_id] + chunk_from, size);
-		pos += size;
-		chunk_id++;
-		chunk_from = 0;
-	} while (pos < to);
+	lfd_output_binary(p, snapshot->data + from, to - from);
 }
 
 static inline int
@@ -693,7 +638,6 @@ xe_guc_log_add_crash_dump(struct drm_printer *p, struct xe_guc_log_snapshot *sna
 			  struct guc_lic_save *config)
 {
 	struct guc_log_buffer_entry_list *entry;
-	int chunk_from, chunk_id;
 	int from, to, i;
 	size_t size = 0;
 	u32 *buf32;
@@ -707,9 +651,7 @@ xe_guc_log_add_crash_dump(struct drm_printer *p, struct xe_guc_log_snapshot *sna
 	/* Check if crash dump section are all zero */
 	from = entry->offset;
 	to = entry->offset + entry->buf_size;
-	chunk_from = from % GUC_LOG_CHUNK_SIZE;
-	chunk_id = from / GUC_LOG_CHUNK_SIZE;
-	buf32 = snapshot->copy[chunk_id] + chunk_from;
+	buf32 = snapshot->data + from;
 
 	for (i = 0; i < entry->buf_size / sizeof(u32); i++)
 		if (buf32[i])
@@ -753,7 +695,7 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
 			  offsetof(struct guc_lfd_file_header, stream));
 
 	/* Output LFD stream */
-	xe_guc_log_load_lic(snapshot->copy[0], &config);
+	xe_guc_log_load_lic(snapshot->data, &config);
 	size = xe_guc_log_output_lfd_init(p, snapshot, &config);
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index a38e9619c95d..cb88712b9480 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -39,7 +39,7 @@ struct xe_guc_log_snapshot {
 	/** @size: Size in bytes of the @copy allocation */
 	size_t size;
 	/** @copy: Host memory copy of the log buffer for later dumping, split into chunks */
-	void **copy;
+	void *data;
 	/** @num_chunks: Number of chunks within @copy */
 	int num_chunks;
 	/** @ktime: Kernel time the snapshot was taken */
-- 
2.43.0

