Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F24CA6004
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 17:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1312010E46C;
	Tue,  6 Oct 2026 17:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndijjTo4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB4D10F012
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 17:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791309094; x=1822845094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8i7+msvAd30FBTIsV/C56d97WXnJZ0o+HK7C7NMC3Ig=;
 b=ndijjTo488JBIPBM0G/90Y4aFAvY6daLqi+90ZPsN0fg8boJw7Q3JesL
 FcPEijPC3FXmX8UDfASWrizNXzyVcYgYE+i8hoXsqFAjAHGWVWcWTPl9i
 FYoKuZgXZ/CmapQvyJSa5b/+3CVi1jvudF1XkC4xD21vHO+JQcyviOe5+
 Nms807nwj30lAaKFkTvmrB0ZerbjlNzpQQZ5guETf6fZqJx6rQ9QzYR3I
 wvo7gGuWm5jVt/CDdX79fFOIBSKOw0paQc/LXtZKCOHQPXvWO3iuRLzHZ
 dNfq0E09P7SGmezg8+ecC3gSD1Qmux/s4rypiVXnmx/ZQU2JUggmh2kzh A==;
X-CSE-ConnectionGUID: vlWa2ha8QdqNI6/F9Kivrw==
X-CSE-MsgGUID: 6JZ7rrBjQT2tUXJvu/TC/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102588594"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="102588594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 10:51:32 -0700
X-CSE-ConnectionGUID: /uNvW+q3SwqItDAPwgv2IA==
X-CSE-MsgGUID: VOWy3kTgRZK1KlEv9j4MpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="273573417"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa009.fm.intel.com with ESMTP; 06 Oct 2026 10:51:31 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 julia.filipchuk@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v10 3/3] drm/xe/guc: Add dump_cache to optimize GuC CT/Log
 compression flow
Date: Tue,  6 Oct 2026 10:51:31 -0700
Message-ID: <20261006175129.3366784-8-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006175129.3366784-5-alan.previn.teres.alexis@intel.com>
References: <20261006175129.3366784-5-alan.previn.teres.alexis@intel.com>
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

During xe_devcoredump preparation, __xe_devcoredump_read is invoked
multiple times, the first time just to get the output size.
We should avoid time and energy waste of recompressing the
GuC-log-event buffer and GuC-CT buffers repeatedly.

Thus, add a dump_cache structure into GuC CT and log snapshot
structures to attempt and store a first pass at compressing
these buffers for reuse on subsequent calls to __xe_devcoredump_read.

Also, ensure any failure of the first compression attempt will still
fallback to store the raw dump without compression which is also
required when CONFIG_DRM_XE_COMPRESS_DUMP is not enabled.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_guc_ct.c        |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h  |  3 +
 drivers/gpu/drm/xe/xe_guc_log.c       | 96 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_log.h       |  4 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h | 20 ++++++
 5 files changed, 104 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 0d2464c72277..6e3e434fca93 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -2223,7 +2223,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		if (snapshot->ctb)
 			xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
 					  &snapshot->ctb, 1,
-					  snapshot->ctb_size, snapshot->ctb_size);
+					  snapshot->ctb_size, snapshot->ctb_size,
+					  &snapshot->dump_cache);
 	} else {
 		drm_puts(p, "CT disabled\n");
 	}
@@ -2241,6 +2242,7 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
 	if (!snapshot)
 		return;
 
+	xe_guc_dump_cache_fini(&snapshot->dump_cache);
 	kfree(snapshot->ctb);
 	kfree(snapshot);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index f88e588af0d3..5e33f9fd4cb0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -14,6 +14,7 @@
 #include <linux/xarray.h>
 
 #include "abi/guc_communication_ctb_abi.h"
+#include "xe_guc_log_types.h"
 
 struct xe_bo;
 
@@ -75,6 +76,8 @@ struct xe_guc_ct_snapshot {
 	size_t ctb_size;
 	/** @ctb: snapshot of the entire CTB */
 	void *ctb;
+	/** @dump_cache: compressed copy of @ctb, built on first print */
+	struct xe_guc_dump_cache dump_cache;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 47adaf70d5bf..90aeaccea596 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -178,6 +178,7 @@ void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
 		kfree(snapshot->copy);
 	}
 
+	xe_guc_dump_cache_fini(&snapshot->dump_cache);
 	kfree(snapshot);
 }
 
@@ -230,10 +231,9 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
-static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
-					 const char *length_label, const char *data_label,
-					 void **chunks, int num_chunks,
-					 size_t chunk_size, size_t total_size)
+static void xe_guc_compress_blob(struct xe_gt *gt, struct xe_guc_dump_cache *cache,
+				 void **chunks, int num_chunks,
+				 size_t chunk_size, size_t total_size)
 {
 	zstd_parameters params;
 	zstd_cstream *cstream;
@@ -244,6 +244,9 @@ static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p
 	char *dst = NULL;
 	int i;
 
+	/* One shot only: every later print replays whatever this pass produced. */
+	cache->attempted = true;
+
 	/*
 	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
 	 * (windowLog=18, 256KB window). Passing the full total_size would
@@ -286,6 +289,17 @@ static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p
 		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
 
 		while (inbuf.pos < inbuf.size) {
+			/*
+			 * zstd only guarantees forward progress while the output
+			 * buffer has room. zstd_compress_bound() sizes dst so that
+			 * a single frame always fits, but never risk spinning
+			 * forever in an error-dump path.
+			 */
+			if (outbuf.pos == outbuf.size) {
+				xe_gt_err(gt, "zstd output buffer exhausted\n");
+				goto err;
+			}
+
 			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
 			if (ZSTD_isError(ret)) {
 				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
@@ -296,30 +310,48 @@ static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p
 		remain -= size;
 	}
 
+	/*
+	 * zstd_end_stream() must be called until it returns 0, otherwise the
+	 * frame epilogue is missing and no decompressor will accept the result.
+	 * Running out of output before that happens is a hard error, not a
+	 * reason to stop.
+	 */
 	do {
+		if (outbuf.pos == outbuf.size) {
+			xe_gt_err(gt, "zstd output buffer exhausted\n");
+			goto err;
+		}
+
 		ret = zstd_end_stream(cstream, &outbuf);
 		if (ZSTD_isError(ret)) {
 			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
 				  ZSTD_getErrorName(ret));
 			goto err;
 		}
-	} while (ret > 0 && outbuf.pos < outbuf.size);
+	} while (ret);
 
-	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
-		   length_label, total_size, outbuf.pos);
-	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
-			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
-	goto out;
+	cache->data = dst;
+	cache->size = outbuf.pos;
+	kvfree(wksp);
+	return;
 
 err:
-	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
-		   length_label, total_size);
-out:
 	kvfree(dst);
 	kvfree(wksp);
 }
 #endif
 
+/**
+ * xe_guc_dump_cache_fini - release a dump blob's compression cache
+ * @cache: cache embedded in the snapshot being freed
+ */
+void xe_guc_dump_cache_fini(struct xe_guc_dump_cache *cache)
+{
+	kvfree(cache->data);
+	cache->data = NULL;
+	cache->size = 0;
+}
+
 /**
  * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
  * @gt: GT structure for error reporting
@@ -330,24 +362,46 @@ static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p
  * @num_chunks: number of elements in @chunks
  * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
  * @total_size: total uncompressed byte count across all chunks
+ * @cache: per-snapshot compression cache, zeroed at capture time
  *
  * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
  * zstd level-3 streaming compression and prints the result via @p using ascii85
  * encoding. Otherwise, directly prints the uncompressed data.
- * On failure the function returns without printing the data blob.
+ *
+ * The compressed blob is produced once and kept in @cache, because a snapshot
+ * is printed repeatedly: __xe_devcoredump_read() measures the output before
+ * emitting it, and re-emits it a chunk at a time. Compressing per pass would
+ * let the measured size and the emitted bytes disagree.
+ *
+ * If compression fails the raw data is printed instead, so the dump is never
+ * lost. @cache->attempted latches that decision, so every later pass makes the same
+ * choice and produces byte-identical output.
  */
 void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
 		       const char *length_label, const char *data_label,
 		       void **chunks, int num_chunks,
-		       size_t chunk_size, size_t total_size)
+		       size_t chunk_size, size_t total_size,
+		       struct xe_guc_dump_cache *cache __maybe_unused)
 {
-#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
-	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
-				     chunks, num_chunks, chunk_size, total_size);
-#else
 	size_t remain;
 	int i;
 
+#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
+	if (!cache->attempted)
+		xe_guc_compress_blob(gt, cache, chunks, num_chunks,
+				     chunk_size, total_size);
+
+	if (cache->data) {
+		drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
+			   length_label, total_size, cache->size);
+		xe_print_blob_ascii85(p, data_label, '\n', cache->data, 0,
+				      round_up(cache->size, sizeof(u32)));
+		return;
+	}
+
+	/* Compression failed - fallback to emit the blob uncompressed. */
+#endif
+
 	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
 
 	/*
@@ -366,7 +420,6 @@ void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
 				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
 		remain -= size;
 	}
-#endif
 }
 
 /**
@@ -393,7 +446,8 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 
 	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
 			  snapshot->copy, snapshot->num_chunks,
-			  GUC_LOG_CHUNK_SIZE, snapshot->size);
+			  GUC_LOG_CHUNK_SIZE, snapshot->size,
+			  &snapshot->dump_cache);
 }
 
 static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 3e97647ee8b5..bb6415271e5f 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -63,7 +63,9 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 
 void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, const char *length_label,
 		       const char *data_label, void **chunks, int num_chunks,
-		       size_t chunk_size, size_t total_size);
+		       size_t chunk_size, size_t total_size,
+		       struct xe_guc_dump_cache *cache);
+void xe_guc_dump_cache_fini(struct xe_guc_dump_cache *cache);
 
 void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
 			       struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index 02851b924aa4..a38e9619c95d 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -13,6 +13,24 @@
 
 struct xe_bo;
 
+/**
+ * struct xe_guc_dump_cache - cached compressed copy of a dump blob
+ *
+ * A snapshot is printed more than once: __xe_devcoredump_read() walks it first
+ * with a NULL buffer to measure the output size, then again - once per chunk -
+ * to fill the user buffer. Compressing on every pass would be both wasteful and
+ * unsafe, as any difference between the measured size and the emitted bytes
+ * corrupts the dump. So compress at most once and replay the result.
+ */
+struct xe_guc_dump_cache {
+	/** @data: compressed bytes, allocation padded up to a u32 boundary */
+	char *data;
+	/** @size: number of valid compressed bytes in @data */
+	size_t size;
+	/** @attempted: compression has been attempted; @data is final either way */
+	bool attempted;
+};
+
 /**
  * struct xe_guc_log_snapshot:
  * Capture of the GuC log plus various state useful for decoding the log
@@ -36,6 +54,8 @@ struct xe_guc_log_snapshot {
 	struct xe_uc_fw_version ver_want;
 	/** @path: Path of GuC firmware blob */
 	const char *path;
+	/** @dump_cache: compressed copy of @copy, built on first print */
+	struct xe_guc_dump_cache dump_cache;
 };
 
 /**
-- 
2.43.0

