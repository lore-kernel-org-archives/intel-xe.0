Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EA2CD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 18:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860F610E2B7;
	Thu,  7 May 2026 18:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBkLWTQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB18F10E2B7
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778177181; x=1809713181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YQ5YnvGMiA6OWYPitY8hIHWIDZ8Gc8qY7sCbB5p4xP0=;
 b=kBkLWTQnsK2W8TSMbKBAyQDw9gjabD+FBTdKXL+xWUhTkmqMH74TKGe9
 JdGnHKxCQCqvmnz1OEgjsoNrKrhfRPSnk7z4qGopPremDQ5lTGGXlPLx+
 +DIwKXCEfHegpWCrutwLPTsPzSTohiMnlYRnAkVVcxCt3GL35+OxS9zob
 Z8LWupT9lLIl+iZGcMWXQqAkOmFH2X/xg/hWdOuPg8cc0KtzF1WYLh/db
 jR+7BCtj6Hema/3Y6iMrCB6qnejYN39DlMaG2ETbiHDIPd2yRbPbt+tML
 E/cUuHjRlam6gNDB7kkyStWfhIClBlGK/Gtz+qQtYATNL2vkvL4T2bAz1 w==;
X-CSE-ConnectionGUID: bHSH6xgNR8yTJI8Dk6HNTg==
X-CSE-MsgGUID: ia9kslO6QsuKtuL8xcRn9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79325188"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79325188"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 11:06:21 -0700
X-CSE-ConnectionGUID: gyAMOn0EQgqZ1GXpwMOYgQ==
X-CSE-MsgGUID: QSpHd/OTQfONfOJ992qtFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="259968790"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa002.fm.intel.com with ESMTP; 07 May 2026 11:06:20 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 1/3] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Thu,  7 May 2026 14:06:16 -0400
Message-Id: <20260507180618.1420986-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507180618.1420986-1-zhanjun.dong@intel.com>
References: <20260507180618.1420986-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/Kconfig      |   1 +
 drivers/gpu/drm/xe/xe_guc_ct.c  |   9 ++-
 drivers/gpu/drm/xe/xe_guc_log.c | 110 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_log.h |   3 +
 4 files changed, 105 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..b160cb73c647 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -33,6 +33,7 @@ config DRM_XE
 	select ACPI_WMI if X86 && ACPI
 	select SYNC_FILE
 	select CRC32
+	select ZSTD_COMPRESS
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

