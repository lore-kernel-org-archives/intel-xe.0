Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EF3C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 17:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B517810E9DB;
	Mon, 29 Jun 2026 17:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9uG8DBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3280710E9D6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 17:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782753762; x=1814289762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xhbQWBauMh4Ay4l/lmycsVdaaERhGTHp58Lwx05RH4=;
 b=I9uG8DBxyCklrqt2TFT/OQitd6syQlIdotJaLTGwkzKnxQeycvDW0oQp
 WYuxtzvl1NryC96kTOrJxfpFf2A94oXA5PIz9wQs4jtcreHjA31E7MzT2
 SmZyzpgdpVPNHPH/6ujM1Xe15wC1h3INtFv8d2j7Ulprq14iswf9gXUSl
 daIGuQX1yCAIY5Tre7zGUqsMO8iMhEZvtP4ARqDemUf6CufZD8UH9IOrk
 ScLA1Rfz16ldS5Yp9ZKGyi3eYxmNzL5CbkOgZZIuhAyTXAXot4jxJ6oG8
 f01yyhSqhZCr+esUqfTw7yi+hD/1SiWGjoORsPfOFmSvX3O5PvhT0YcY/ w==;
X-CSE-ConnectionGUID: EJCY6/9NTCCTd8aTYyFPwQ==
X-CSE-MsgGUID: YrkbGpjgTGOPD83i9xO5GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94947221"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="94947221"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 10:22:41 -0700
X-CSE-ConnectionGUID: HpwyPKBnSa6jNr6QwpuURg==
X-CSE-MsgGUID: jNPgMZ4ASuCeB1JjiRScXg==
X-ExtLoop1: 1
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by fmviesa003.fm.intel.com with ESMTP; 29 Jun 2026 10:22:41 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Mon, 29 Jun 2026 13:22:39 -0400
Message-Id: <20260629172239.2377117-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629172239.2377117-1-zhanjun.dong@intel.com>
References: <20260629172239.2377117-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/Kconfig          |  16 +++
 drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
 drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
 6 files changed, 184 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..3af15a0c14f7 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -33,6 +33,8 @@ config DRM_XE
 	select ACPI_WMI if X86 && ACPI
 	select SYNC_FILE
 	select CRC32
+	select ZSTD_COMPRESS if DRM_XE_COMPRESS_DUMP
+	select ZSTD_DECOMPRESS if DRM_XE_COMPRESS_DUMP
 	select SND_HDA_I915 if SND_HDA_CORE
 	select CEC_CORE if CEC_NOTIFIER
 	select VMAP_PFN
@@ -101,6 +103,20 @@ config DRM_XE_PAGEMAP
 
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
index 21e0dad9a481..4cedbcdb831e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -2094,11 +2094,12 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
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
@@ -2112,11 +2113,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
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
@@ -2150,9 +2150,10 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 {
 	struct xe_guc_ct_snapshot *snapshot;
+	struct xe_gt *gt = ct_to_gt(ct);
 
 	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
-	xe_guc_ct_snapshot_print(snapshot, p);
+	xe_guc_ct_snapshot_print(snapshot, p, gt);
 	xe_guc_ct_snapshot_free(snapshot);
 }
 
@@ -2250,10 +2251,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
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
index 538d4df0f7aa..d20be1a064f1 100644
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
+			if (zstd_is_error(ret)) {
+				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
+					  zstd_get_error_name(ret));
+				goto err;
+			}
+		}
+		remain -= size;
+	}
+
+	do {
+		ret = zstd_end_stream(cstream, &outbuf);
+		if (zstd_is_error(ret)) {
+			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
+				  zstd_get_error_name(ret));
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
2.34.1

