Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A381BC27C55
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 01:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FEE10E164;
	Tue, 11 Jun 2024 01:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECjLkQIF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69FA10E164
 for <Intel-Xe@lists.freedesktop.org>; Tue, 11 Jun 2024 01:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718068831; x=1749604831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=42hiM973W5iZlA2xTyhyMO7vcHcTE5Z2lTrSuTJyDog=;
 b=ECjLkQIF2FtSJLkUbHuzuAlHpi4su1kbPYmSFRzmNIDjL3MK3fr1mlP9
 P9zLUFKWwIrIDqFpE4YbB4u5jRY6rnnu1L6asK37Kz8tthrKq2tGEIHbm
 8JX9sfWg0irbNxLHjSYv1Xb1cVwRME3FXLulMohUEFOAebwjlkJSeXmhB
 uemETUfl2zfSSooZKgbUFZcVTCQGze/D1GVx2cH8efSQ8SHETj5Hu1AwF
 VPttRmh7qFf6AvTrC/eISojdB3dbfgE5taYKX3L/CS3hzkZtZhhUdU9aI
 qovwp5WeeYEBL0EaqLkq9swKD83o2gO1hlx4yrP2yiQ4UID07tr3N0gu2 Q==;
X-CSE-ConnectionGUID: NVNtTo4iSA23tEVmHgACPA==
X-CSE-MsgGUID: /kVSmPCQSVGgJ4KKfUY9tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18612245"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18612245"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 18:20:29 -0700
X-CSE-ConnectionGUID: FVkOyfm5RNWhBv+eT/GE+Q==
X-CSE-MsgGUID: cAsWxK9sQ+qndDB57Npy1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43684350"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2024 18:20:29 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 2/7] drm/xe/guc: Copy GuC log prior to dumping
Date: Mon, 10 Jun 2024 18:20:23 -0700
Message-ID: <20240611012028.2305024-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
References: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
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

Refactor the hexdump code into a separate function ready to be used
for dumps of other objects. Also change to dumping a host memory copy
rather than the live GPU buffer object. Doing so helps prevent
inconsistencies due to the log being updated as it is being dumped. It
also paves the way for decoupling the save from the print to allow
inclusion in error reports such as the devcoredump.

Switch to use the dedicated kernel hexdump helper rather than printf.
The helper makes it easier to print out much wider lines which can
dramatically reduce the total line count of the dump (useful when
dumping to dmesg).

Another issue with dumping such a large buffer is that it can be slow,
especially if dumping to dmesg over a serial port. So add a yield to
prevent the 'task has been stuck for 120s' kernel hang check feature
from firing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c |   2 +-
 drivers/gpu/drm/xe/xe_guc_log.c     | 119 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_log.h     |   2 +-
 3 files changed, 106 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index d3822cbea273..68f1f728c22c 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -41,7 +41,7 @@ static int guc_log(struct seq_file *m, void *data)
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	xe_pm_runtime_get(xe);
-	xe_guc_log_print(&guc->log, &p);
+	xe_guc_log_print(&guc->log, &p, false);
 	xe_pm_runtime_put(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a37ee3419428..a35309926271 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -9,6 +9,7 @@
 
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_map.h"
 #include "xe_module.h"
 
@@ -49,32 +50,120 @@ static size_t guc_log_size(void)
 		CAPTURE_BUFFER_SIZE;
 }
 
-void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
+#define BYTES_PER_WORD		sizeof(u32)
+#define WORDS_PER_DUMP		8
+#define DUMPS_PER_LINE		4
+#define LINES_PER_READ		4
+#define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
+
+static void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
+			    struct drm_printer *p, bool atomic)
+{
+	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
+	const u32 *blob32 = (const u32 *)blob;
+	int i, j, k;
+
+	if (size % (WORDS_PER_READ * BYTES_PER_WORD)) {
+		u32 remain = size % (WORDS_PER_READ * BYTES_PER_WORD);
+
+		drm_err(&xe->drm, "Invalid size for hexdump: 0x%lX vs 0x%lX (%d * %ld) -> 0x%X\n",
+			size, WORDS_PER_READ * BYTES_PER_WORD,
+			WORDS_PER_READ, BYTES_PER_WORD, remain);
+
+		size -= remain;
+		if (!size)
+			return;
+	}
+
+	for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
+		const u32 *src = ((const u32 *)blob32) + i;
+
+		for (j = 0; j < WORDS_PER_READ; ) {
+			u32 done = 0;
+
+			for (k = 0; k < DUMPS_PER_LINE; k++) {
+				line_buff[done++] = ' ';
+				done += hex_dump_to_buffer(src + j,
+							   sizeof(*src) * (WORDS_PER_READ - j),
+							   WORDS_PER_DUMP * BYTES_PER_WORD,
+							   BYTES_PER_WORD,
+							   line_buff + done,
+							   sizeof(line_buff) - done,
+							   false);
+				j += WORDS_PER_DUMP;
+			}
+
+			drm_printf(p, "%s\n", line_buff);
+
+			/*
+			 * If spewing large amounts of data via a serial console,
+			 * this can be a very slow process. So be friendly and try
+			 * not to cause 'softlockup on CPU' problems.
+			 */
+			if (!atomic)
+				cond_resched();
+		}
+	}
+}
+
+#define GUC_LOG_CHUNK_SIZE	SZ_2M
+
+void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic)
 {
 	struct xe_device *xe = log_to_xe(log);
-	size_t size;
-	int i, j;
+	size_t size, remain;
+	void **copy;
+	int num_chunks, i;
 
 	xe_assert(xe, log->bo);
 
+	/*
+	 * NB: kmalloc has a hard limit well below the maximum GuC log buffer size.
+	 * Also, can't use vmalloc as might be called from atomic context. So need
+	 * to break the buffer up into smaller chunks that can be allocated.
+	 */
 	size = log->bo->size;
+	num_chunks = (size + GUC_LOG_CHUNK_SIZE - 1) / GUC_LOG_CHUNK_SIZE;
 
-#define DW_PER_READ		128
-	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
-	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
-		u32 read[DW_PER_READ];
+	copy = kcalloc(num_chunks, sizeof(*copy), atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (!copy) {
+		drm_printf(p, "Failed to allocate array x%d", num_chunks);
+		return;
+	}
 
-		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
-				   DW_PER_READ * sizeof(u32));
-#define DW_PER_PRINT		4
-		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
-			u32 *print = read + j * DW_PER_PRINT;
+	remain = size;
+	for (i = 0; i < num_chunks; i++) {
+		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
 
-			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
-				   *(print + 0), *(print + 1),
-				   *(print + 2), *(print + 3));
+		copy[i] = kmalloc(size, atomic ? GFP_ATOMIC : GFP_KERNEL);
+		if (!copy[i]) {
+			drm_printf(p, "Failed to allocate %ld at chunk %d of %d",
+				   size, i, num_chunks);
+			goto out;
 		}
+		remain -= size;
 	}
+
+	remain = size;
+	for (i = 0; i < num_chunks; i++) {
+		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
+
+		xe_map_memcpy_from(xe, copy[i], &log->bo->vmap, i * GUC_LOG_CHUNK_SIZE, size);
+		remain -= size;
+	}
+
+	remain = size;
+	for (i = 0; i < num_chunks; i++) {
+		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
+
+		xe_hexdump_blob(xe, copy[i], size, p, atomic);
+		remain -= size;
+	}
+
+out:
+	for (i = 0; i < num_chunks; i++)
+		kfree(copy[i]);
+	kfree(copy);
 }
 
 int xe_guc_log_init(struct xe_guc_log *log)
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 2d25ab28b4b3..5149b492c3b8 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -37,7 +37,7 @@ struct drm_printer;
 #define GUC_LOG_LEVEL_MAX GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
 
 int xe_guc_log_init(struct xe_guc_log *log);
-void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
+void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic);
 
 static inline u32
 xe_guc_log_get_level(struct xe_guc_log *log)
-- 
2.43.2

