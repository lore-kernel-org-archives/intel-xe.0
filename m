Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64393CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 19:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBB510E275;
	Mon, 11 May 2026 19:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/0SNl4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F20410E582
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778528968; x=1810064968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+9o/grOwsk/lHZVNW6HLDNNJrnS3FURNhTr/+3E7kts=;
 b=K/0SNl4lxBEVICplpZu9dLMRPZBWM5ftW0GiY9P0EY399sEiv5DWvwW1
 nyLv3tGiIlXCLSado0HQoLx9GGda/ESchnfTA6uWy/sc1IrePDc7BrV7A
 A83HvbHOhJNhs6FgP526Pd1iXmUD+c+cpBdwS6aGnlQLxFgRn+9/4t3M1
 PXLkpmG8jW5zv9xxtZAa6f1eXnl7LNEDF7w679OzlclXaR5gZNpZV4fX2
 EE6yS1W/kUDefT68j6ijPhQFox07g4RGEft3tvTkYOWAhGJ0ng1CqqEDQ
 p7iBJVuFre6Cug/VFiSP9b+mLwDmUOE7xq+wK3x1LlYvZrnbwh5szMBFL g==;
X-CSE-ConnectionGUID: MYodGzjrRuiiAKERepe4PA==
X-CSE-MsgGUID: ++mseB6uS22pPcmAc5AQgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79609907"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79609907"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 12:49:27 -0700
X-CSE-ConnectionGUID: kAXY3SZ7Tbu7wFJh0n8ScQ==
X-CSE-MsgGUID: 9JcxWr2DS0mSrlcswnQZ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="242550363"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa005.jf.intel.com with ESMTP; 11 May 2026 12:49:27 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 1/3] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Mon, 11 May 2026 15:49:22 -0400
Message-Id: <20260511194924.2016315-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511194924.2016315-1-zhanjun.dong@intel.com>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
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

Select ZSTD_COMPRESS in DRM_XE so the xe module pulls in the zstd
compressor when built.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/Kconfig      |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c  |   9 ++-
 drivers/gpu/drm/xe/xe_guc_log.c | 110 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_log.h |   3 +
 4 files changed, 106 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..a6fbd7233c09 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -33,6 +33,8 @@ config DRM_XE
 	select ACPI_WMI if X86 && ACPI
 	select SYNC_FILE
 	select CRC32
+	select ZSTD_COMPRESS
+	select ZSTD_DECOMPRESS
 	select SND_HDA_I915 if SND_HDA_CORE
 	select CEC_CORE if CEC_NOTIFIER
 	select VMAP_PFN
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 21e0dad9a481..d1f2fd597ebd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -2112,11 +2112,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_printf(p, "\tg2h outstanding: %d\n",
 			   snapshot->g2h_outstanding);
 
-		if (snapshot->ctb) {
-			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
-			xe_print_blob_ascii85(p, "[CTB].data", '\n',
-					      snapshot->ctb, 0, snapshot->ctb_size);
-		}
+		if (snapshot->ctb)
+			xe_guc_print_blob_zstd(p, "[CTB]", "[CTB].data",
+					       &snapshot->ctb, 1,
+					       snapshot->ctb_size, snapshot->ctb_size);
 	} else {
 		drm_puts(p, "CT disabled\n");
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 538d4df0f7aa..abcafce0349a 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -6,6 +6,7 @@
 #include "xe_guc_log.h"
 
 #include <linux/fault-inject.h>
+#include <linux/zstd.h>
 
 #include <linux/utsname.h>
 #include <drm/drm_managed.h>
@@ -225,6 +226,99 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
 	return snapshot;
 }
 
+/**
+ * xe_guc_print_blob_zstd - Compress binary data with zstd streaming and emit it as ascii85
+ * @p: drm_printer for output
+ * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
+ * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
+ * @chunks: array of pointers to source data chunks
+ * @num_chunks: number of elements in @chunks
+ * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
+ * @total_size: total uncompressed byte count across all chunks
+ *
+ * Compresses @total_size bytes using zstd level-3 streaming compression and
+ * prints the result via @p using ascii85 encoding.  On failure the function
+ * returns without printing the data blob.
+ */
+void xe_guc_print_blob_zstd(struct drm_printer *p, const char *length_label,
+			    const char *data_label, void **chunks, int num_chunks,
+			    size_t chunk_size, size_t total_size)
+{
+	zstd_parameters params;
+	zstd_cstream *cstream;
+	zstd_out_buffer outbuf;
+	size_t wksp_size, dst_size;
+	size_t remain;
+	void *wksp;
+	size_t ret;
+	char *dst;
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
+		return;
+
+	dst_size = zstd_compress_bound(total_size);
+	dst = kvzalloc(dst_size, GFP_KERNEL);
+	if (!dst)
+		goto err_wksp;
+
+	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
+	if (!cstream) {
+		pr_err("xe_guc: failed to init zstd cstream\n");
+		goto err_dst;
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
+				pr_err("xe_guc: zstd_compress_stream failed: %s\n",
+				       zstd_get_error_name(ret));
+				goto err_dst;
+			}
+		}
+		remain -= size;
+	}
+
+	do {
+		ret = zstd_end_stream(cstream, &outbuf);
+		if (zstd_is_error(ret)) {
+			pr_err("xe_guc: zstd_end_stream failed: %s\n",
+			       zstd_get_error_name(ret));
+			goto err_dst;
+		}
+	} while (ret > 0 && outbuf.pos < outbuf.size);
+
+	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
+		   length_label, total_size, outbuf.pos);
+	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
+			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
+
+err_dst:
+	kvfree(dst);
+err_wksp:
+	kvfree(wksp);
+}
+
 /**
  * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
  * @snapshot: a snapshot of the GuC log
@@ -232,9 +326,6 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
  */
 void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
 {
-	size_t remain;
-	int i;
-
 	if (!snapshot) {
 		drm_printf(p, "GuC log snapshot not allocated!\n");
 		return;
@@ -248,16 +339,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
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
+	xe_guc_print_blob_zstd(p, "[LOG]", "[LOG].data",
+			       snapshot->copy, snapshot->num_chunks,
+			       GUC_LOG_CHUNK_SIZE, snapshot->size);
 }
 
 static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 4649a260755e..d231def50692 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -59,6 +59,9 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
 void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
 void xe_guc_log_print_dmesg(struct xe_guc_log *log);
 struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
+void xe_guc_print_blob_zstd(struct drm_printer *p, const char *length_label,
+			    const char *data_label, void **chunks, int num_chunks,
+			    size_t chunk_size, size_t total_size);
 void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
 void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
 
-- 
2.34.1

