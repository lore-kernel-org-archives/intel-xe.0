Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F5CC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9EB10E4C0;
	Tue, 15 Sep 2026 17:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E98U6wfI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2947710E383
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 17:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789494525; x=1821030525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tzrEOqE4zbDxcekAG+pOXTTjf+M8uiiW+I25gUieWLE=;
 b=E98U6wfITnf44QktFxRkgvwLB4SYzucDIz1enz5AAfihFX+Mm5iC75O0
 tWybrvC3Aj4DeRHXfjz8xfDFNbNZjKNTRQdTiZQpoxjCJ0gFvzMAeRUba
 kTaiCmY5vOt4iaPM/ThLuT0fXryaPpHSGN8RiaHBH1VW7ToRFzJsfasZL
 mW7TtXfL5ap3XkHQVrrbzjyXCQEOK+jsZMrpg5FqJMgcMvXTdCmCU5grM
 AGQ4WjNM6i8C1H2NOhi2+ldgDqfJhot8GnQub7i0s1xdbNOzWxgKfTcwM
 b2lk7YfWgMSxf+4QohFM1Wx0YJR2H2SPgsk9181wdzgFOCHSYrmoNs5eZ A==;
X-CSE-ConnectionGUID: SP7GLuqZT/iMcufijzkR0w==
X-CSE-MsgGUID: mNCIBHMARkataD/yrVUoXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107378788"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107378788"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:48:44 -0700
X-CSE-ConnectionGUID: nVYPFRCBR/+AUfyCCa3lXA==
X-CSE-MsgGUID: VFy7L/rUTZ+x2zfgxMQ/Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269814752"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2026 10:48:44 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 julia.filipchuk@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v9 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Tue, 15 Sep 2026 10:48:40 -0700
Message-ID: <20260915174840.531473-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
References: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
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

From: Zhanjun Dong <zhanjun.dong@intel.com>

With default settings, GuC log is 8MB in size and
dumping the log is time-consuming. In debugging scenarios,
dump-to-dmesg suffers truncation loss because CI's size limit is 2MB.
Additionally, if also forwarded to serial console, it takes several
minutes. In use-case of continuous error+log collection over extended
period, we pressure CI's allocated storage. Thus, compress the
GuC log data dump to address these issues and multiply any benefits
from a future upgrade in CI's size limits.

Replace the raw ascii85 dumps of GuC log snapshots with a
zstd-compressed ascii85 stream and reuse the same helper for CTB
snapshot output.

Use zstd streaming with the default compression level of 3 and an
estimated source size of 0 so the compression workspace stays bounded
even for multi-megabyte logs.

Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
GuC log and CTB dumps are compressed with ZSTD. This allows users to
choose between reduced dump sizes and lower memory usage.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig          |  15 +++
 drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
 drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
 6 files changed, 183 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..18a682a44b31 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -33,6 +33,7 @@ config DRM_XE
 	select ACPI_WMI if X86 && ACPI
 	select SYNC_FILE
 	select CRC32
+	select ZSTD_COMPRESS if DRM_XE_COMPRESS_DUMP
 	select SND_HDA_I915 if SND_HDA_CORE
 	select CEC_CORE if CEC_NOTIFIER
 	select VMAP_PFN
@@ -101,6 +102,20 @@ config DRM_XE_PAGEMAP
 
 	  If in doubt say "Y".
 
+config DRM_XE_COMPRESS_DUMP
+	bool "Enable ZSTD compression for error dumps"
+	depends on DRM_XE
+	default y
+	help
+	  Enable this option to compress GuC log and CTB dumps with ZSTD
+	  compression. This can significantly reduce the size of error dumps
+	  but requires additional memory for compression workspace.
+
+	  Disable this option if you want to save memory or prefer uncompressed
+	  error dumps for debugging.
+
+	  If in doubt say "Y".
+
 config DRM_XE_FORCE_PROBE
 	string "Force probe xe for selected Intel hardware IDs"
 	depends on DRM_XE
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 5f2b90b18f97..27473c25aad2 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -115,9 +115,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
 
 	drm_puts(&p, "\n**** GuC Log ****\n");
-	xe_guc_log_snapshot_print(ss->guc.log, &p);
+	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
 	drm_puts(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
+	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
 
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5c4733da385c..10a8cf327036 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -2186,11 +2186,12 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
  * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
  * @snapshot: GuC CT snapshot object.
  * @p: drm_printer where it will be printed out.
+ * @gt: GT structure for error reporting
  *
  * This function prints out a given GuC CT snapshot object.
  */
 void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
-			      struct drm_printer *p)
+			      struct drm_printer *p, struct xe_gt *gt)
 {
 	if (!snapshot)
 		return;
@@ -2204,11 +2205,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_printf(p, "\tg2h outstanding: %d\n",
 			   snapshot->g2h_outstanding);
 
-		if (snapshot->ctb) {
-			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
-			xe_print_blob_ascii85(p, "[CTB].data", '\n',
-					      snapshot->ctb, 0, snapshot->ctb_size);
-		}
+		if (snapshot->ctb)
+			xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
+					  &snapshot->ctb, 1,
+					  snapshot->ctb_size, snapshot->ctb_size);
 	} else {
 		drm_puts(p, "CT disabled\n");
 	}
@@ -2242,9 +2242,10 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 {
 	struct xe_guc_ct_snapshot *snapshot;
+	struct xe_gt *gt = ct_to_gt(ct);
 
 	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
-	xe_guc_ct_snapshot_print(snapshot, p);
+	xe_guc_ct_snapshot_print(snapshot, p, gt);
 	xe_guc_ct_snapshot_free(snapshot);
 }
 
@@ -2342,10 +2343,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
 	drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
 
 	drm_puts(&lp, "**** GuC Log ****\n");
-	xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
+	xe_guc_log_snapshot_print(dead->snapshot_log, &lp, gt);
 
 	drm_puts(&lp, "**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
+	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp, gt);
 
 	drm_puts(&lp, "Done.\n");
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 3ddc665ab84a..f950d68a060a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -12,6 +12,7 @@
 
 struct drm_printer;
 struct xe_device;
+struct xe_gt;
 
 int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
 int xe_guc_ct_init(struct xe_guc_ct *ct);
@@ -26,7 +27,8 @@ void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
 struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
-void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p,
+			      struct xe_gt *gt);
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 538d4df0f7aa..aaeb0f76af30 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -6,6 +6,9 @@
 #include "xe_guc_log.h"
 
 #include <linux/fault-inject.h>
+#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
+#include <linux/zstd.h>
+#endif
 
 #include <linux/utsname.h>
 #include <drm/drm_managed.h>
@@ -225,16 +228,148 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 	return snapshot;
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
+static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
+					 const char *length_label, const char *data_label,
+					 void **chunks, int num_chunks,
+					 size_t chunk_size, size_t total_size)
+{
+	zstd_parameters params;
+	zstd_cstream *cstream;
+	zstd_out_buffer outbuf;
+	size_t wksp_size, dst_size;
+	size_t remain, ret;
+	void *wksp = NULL;
+	char *dst = NULL;
+	int i;
+
+	/*
+	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
+	 * (windowLog=18, 256KB window). Passing the full total_size would
+	 * cause zstd to inflate windowLog proportionally (e.g. windowLog=24
+	 * for a 19MB log), making the workspace tens of MB.  With 0, the
+	 * workspace stays ~1.5MB, well within kmalloc limits.
+	 */
+	params = zstd_get_params(3, 0);
+
+	wksp_size = zstd_cstream_workspace_bound(&params.cParams);
+	wksp = kvzalloc(wksp_size, GFP_KERNEL);
+	if (!wksp)
+		goto err;
+
+	dst_size = zstd_compress_bound(total_size);
+	dst = kvzalloc(dst_size, GFP_KERNEL);
+	if (!dst)
+		goto err;
+
+	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
+	if (!cstream) {
+		xe_gt_err(gt, "failed to init zstd cstream\n");
+		goto err;
+	}
+
+	outbuf.dst = dst;
+	outbuf.size = dst_size;
+	outbuf.pos = 0;
+
+	remain = total_size;
+	for (i = 0; i < num_chunks && remain; i++) {
+		size_t size = min(chunk_size, remain);
+		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
+
+		while (inbuf.pos < inbuf.size) {
+			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
+			if (ZSTD_isError(ret)) {
+				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
+					  ZSTD_getErrorName(ret));
+				goto err;
+			}
+		}
+		remain -= size;
+	}
+
+	do {
+		ret = zstd_end_stream(cstream, &outbuf);
+		if (ZSTD_isError(ret)) {
+			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
+				  ZSTD_getErrorName(ret));
+			goto err;
+		}
+	} while (ret > 0 && outbuf.pos < outbuf.size);
+
+	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
+		   length_label, total_size, outbuf.pos);
+	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
+			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
+	goto out;
+
+err:
+	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
+		   length_label, total_size);
+out:
+	kvfree(dst);
+	kvfree(wksp);
+}
+#endif
+
 /**
- * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
- * @snapshot: a snapshot of the GuC log
- * @p: the printer object to output to
+ * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
+ * @gt: GT structure for error reporting
+ * @p: drm_printer for output
+ * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
+ * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
+ * @chunks: array of pointers to source data chunks
+ * @num_chunks: number of elements in @chunks
+ * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
+ * @total_size: total uncompressed byte count across all chunks
+ *
+ * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
+ * zstd level-3 streaming compression and prints the result via @p using ascii85
+ * encoding. Otherwise, directly prints the uncompressed data.
+ * On failure the function returns without printing the data blob.
  */
-void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
+void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
+		       const char *length_label, const char *data_label,
+		       void **chunks, int num_chunks,
+		       size_t chunk_size, size_t total_size)
 {
+#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
+	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
+				     chunks, num_chunks, chunk_size, total_size);
+#else
 	size_t remain;
 	int i;
 
+	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
+
+	/*
+	 * Print each chunk directly without merging into a single buffer.
+	 * xe_print_blob_ascii85() supports multiple calls - use suffix=0
+	 * for all but the last chunk to omit the newline between chunks.
+	 */
+	remain = total_size;
+	for (i = 0; i < num_chunks && remain; i++) {
+		size_t size = min(chunk_size, remain);
+		const char *prefix = i ? NULL : data_label;
+		/* Add suffix only on the last chunk */
+		char suffix = (remain == size) ? '\n' : 0;
+
+		xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
+				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
+		remain -= size;
+	}
+#endif
+}
+
+/**
+ * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
+ * @snapshot: a snapshot of the GuC log
+ * @p: the printer object to output to
+ * @gt: GT structure of the GuC log
+ */
+void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
+			       struct xe_gt *gt)
+{
 	if (!snapshot) {
 		drm_printf(p, "GuC log snapshot not allocated!\n");
 		return;
@@ -248,16 +383,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
 	drm_printf(p, "Log level: %u\n", snapshot->level);
 
-	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
-	remain = snapshot->size;
-	for (i = 0; i < snapshot->num_chunks; i++) {
-		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
-		const char *prefix = i ? NULL : "[LOG].data";
-		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
-
-		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
-		remain -= size;
-	}
+	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
+			  snapshot->copy, snapshot->num_chunks,
+			  GUC_LOG_CHUNK_SIZE, snapshot->size);
 }
 
 static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
@@ -598,12 +726,13 @@ void xe_guc_log_print_dmesg(struct xe_guc_log *log)
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 {
 	struct xe_guc_log_snapshot *snapshot;
+	struct xe_gt *gt = log_to_gt(log);
 
 	drm_printf(p, "**** GuC Log ****\n");
 
 	snapshot = xe_guc_log_snapshot_capture(log, false);
-	drm_printf(p, "CS reference clock: %u\n", log_to_gt(log)->info.reference_clock);
-	xe_guc_log_snapshot_print(snapshot, p);
+	drm_printf(p, "CS reference clock: %u\n", gt->info.reference_clock);
+	xe_guc_log_snapshot_print(snapshot, p, gt);
 	xe_guc_log_snapshot_free(snapshot);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 4649a260755e..3e97647ee8b5 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -11,6 +11,7 @@
 
 struct drm_printer;
 struct xe_device;
+struct xe_gt;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
 #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_16M
@@ -59,7 +60,13 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
 void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
 void xe_guc_log_print_dmesg(struct xe_guc_log *log);
 struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
-void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
+
+void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, const char *length_label,
+		       const char *data_label, void **chunks, int num_chunks,
+		       size_t chunk_size, size_t total_size);
+
+void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
+			       struct xe_gt *gt);
 void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
 
 static inline u32
-- 
2.43.0

