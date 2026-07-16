Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AE3C44515
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 15:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB9210E3AD;
	Thu, 16 Jul 2026 15:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2DcOXQT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8846310E273
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784217078; x=1815753078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v5Adl+cUqzGv3N/f3o/3q3e5V9SEniPEYHpxqGYy8no=;
 b=P2DcOXQTtX70JmcdwZtylJHO3GtUabmZjLlmjL7zncS7JmAtLCxCR4Dq
 3mL6003Xke6PArUmCkHfw/ljXYYTByLLIqmrvaCkpYwF78RySvOeR2HRh
 oInZRi6csARpQYPrT/l6Zwsy3I6bj3WMDjuaUBcuN6vQ2oyH1eNldd+lK
 i2lIhbciMkysZJiQwYyHbGFdhVKzWX3YUQAL2uEQh0VqlZQy3oHgwnuWP
 D8o+ObEssE1l7sfuIIOAGuMyJhPR0DlojEAAmmPbnHfauCwm1/ETB95Bb
 NPXjh8ioXn2YcQXn0xzKvjjRdLCbZtWYKa3bYb7W79zriPP73+qEx5sNW A==;
X-CSE-ConnectionGUID: QR9WfK+zQlm+eM2gqD8pnA==
X-CSE-MsgGUID: IOLYf2kBSsS4Gq7R9PG5iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84659651"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84659651"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:51:17 -0700
X-CSE-ConnectionGUID: TM7cxqWTRkel+QC7sKcg4w==
X-CSE-MsgGUID: PGHDQDkZTAa/osQLEek2xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="256590481"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by orviesa007.jf.intel.com with ESMTP; 16 Jul 2026 08:51:17 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: julia.filipchuk@intel.com, matthew.brost@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Thu, 16 Jul 2026 11:51:14 -0400
Message-Id: <20260716155114.1427366-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716155114.1427366-1-zhanjun.dong@intel.com>
References: <20260716155114.1427366-1-zhanjun.dong@intel.com>
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

Replace the raw ascii85 dumps of GuC log snapshots with a
zstd-compressed ascii85 stream and reuse the same helper for CTB
snapshot output.

Use zstd streaming with default level-3 parameters and an estimated
source size of 0 so the compression workspace stays bounded even for
multi-megabyte logs.

Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
GuC log and CTB dumps are compressed with ZSTD. This allows users to
choose between reduced dump sizes or lower memory usage.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/Kconfig                |  15 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c            |  19 +--
 drivers/gpu/drm/xe/xe_guc_ct.h            |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.c           | 162 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h           |   9 +-
 kernel/build64-debug/Makefile             |   3 +
 kernel/build64-debug/scripts/basic/fixdep | Bin 0 -> 16936 bytes
 8 files changed, 187 insertions(+), 29 deletions(-)
 create mode 100644 kernel/build64-debug/Makefile
 create mode 100755 kernel/build64-debug/scripts/basic/fixdep

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
index fe70c0fd85c5..19314184798c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -2135,11 +2135,12 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
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
@@ -2153,11 +2154,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
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
@@ -2191,9 +2191,10 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 {
 	struct xe_guc_ct_snapshot *snapshot;
+	struct xe_gt *gt = ct_to_gt(ct);
 
 	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
-	xe_guc_ct_snapshot_print(snapshot, p);
+	xe_guc_ct_snapshot_print(snapshot, p, gt);
 	xe_guc_ct_snapshot_free(snapshot);
 }
 
@@ -2291,10 +2292,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
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
index 767365a33dee..2005d1a0cd6c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -10,6 +10,7 @@
 
 struct drm_printer;
 struct xe_device;
+struct xe_gt;
 
 int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
 int xe_guc_ct_init(struct xe_guc_ct *ct);
@@ -24,7 +25,8 @@ void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
 struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
-void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p,
+			      struct xe_gt *gt);
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 538d4df0f7aa..d0325c4f7b86 100644
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
@@ -225,16 +228,149 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
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
+	/* Compression disabled, output uncompressed data directly */
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
@@ -248,16 +384,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
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
@@ -598,12 +727,13 @@ void xe_guc_log_print_dmesg(struct xe_guc_log *log)
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
diff --git a/kernel/build64-debug/Makefile b/kernel/build64-debug/Makefile
new file mode 100644
index 000000000000..17a57c3449d1
--- /dev/null
+++ b/kernel/build64-debug/Makefile
@@ -0,0 +1,3 @@
+# Automatically generated by /home/zhanjun/pgm/drm-tip/Makefile: don't edit
+export KBUILD_OUTPUT = /home/zhanjun/pgm/drm-tip/kernel/build64-debug
+include /home/zhanjun/pgm/drm-tip/Makefile
diff --git a/kernel/build64-debug/scripts/basic/fixdep b/kernel/build64-debug/scripts/basic/fixdep
new file mode 100755
index 0000000000000000000000000000000000000000..241424346b88f1ea262563eeb65c17e19cb82c4a
GIT binary patch
literal 16936
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

literal 0
HcmV?d00001

-- 
2.34.1

