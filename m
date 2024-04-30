Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBB7C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 23:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CE7112803;
	Tue, 30 Apr 2024 23:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HL4OpMin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07519112F76
 for <Intel-Xe@lists.freedesktop.org>; Tue, 30 Apr 2024 23:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714520081; x=1746056081;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l55bQJwIRnCfG01z/AKbzwmIpQH7bFpE9UYJg4VmhJc=;
 b=HL4OpMin256G/1GTzw/jMMNc72S6/lHf1kI4PBJVxFiChnrrHJq8RiJ9
 xApFSlqKSRD06ZKp7iIAo4jvtxUs7yEXY2ivM+eV2Bnqm2sZmfeWDv6k+
 79i2XaplTf7BzN2VP7hryeRNBRzSKAA4jIKjVc/zye9xnkWYSS4uMkz5A
 ouYD3iIwZkNJdJDeIPDVl/QpdBb+o96Q/PoEXzGLPlkc+zgM7e4y68kox
 oNU8OXPhpi7qmKgb6Z2YfiRR7x/l5x96yLBFkbz8w6IakrUH2c3+1z4y9
 uQ5frIDZKGjqOAAg0SUAQhiqFpl98kBo4vL2vo+EHNFXe2M15r5ljlGKI A==;
X-CSE-ConnectionGUID: j3g9D5SERTCwMbycEM1mYw==
X-CSE-MsgGUID: 8raBMAunRziT5yir7E1+8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10115386"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="10115386"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 16:34:37 -0700
X-CSE-ConnectionGUID: KpG5GO/ER7mJtOCFsrNYRg==
X-CSE-MsgGUID: lm/Mih8qQsKw2vwabMVPRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="26634497"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2024 16:34:36 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Improve robustness of GuC log dumping to dmesg
Date: Tue, 30 Apr 2024 16:34:36 -0700
Message-ID: <20240430233436.2838165-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
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

There is a debug mechanism for dumping the GuC log as an ASCII hex
stream via dmesg. This is extremely useful for situations where it is
not possibe to query the log from debugfs (self tests, bugs that cause
the driver to fail to load, system hangs, etc.). However, dumping via
dmesg is not the most reliable. The dmesg buffer is limited in size,
can be rate limited and a simple hex stream is hard to parse by tools.

So add extra information to the dump to make it more robust and
parsable. This includes adding start and end tags to delimit the dump,
using longer lines to reduce the per line overhead, adding a rolling
count to check for missing lines and interleaved concurrent dumps and
adding other important information such as the GuC version number and
timestamp offset.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  1 +
 drivers/gpu/drm/xe/xe_guc_log.c       | 78 ++++++++++++++++++++++-----
 2 files changed, 66 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 11682e675e0f..45fb3707fabe 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -82,6 +82,7 @@
 #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
 #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
 #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
+#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
 
 #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
 #define   GUC_SEND_TRIGGER			REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index a37ee3419428..ea269efd9c21 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -7,10 +7,19 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_map.h"
+#include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pm.h"
+
+static struct xe_guc *
+log_to_guc(struct xe_guc_log *log)
+{
+	return container_of(log, struct xe_guc, log);
+}
 
 static struct xe_gt *
 log_to_gt(struct xe_guc_log *log)
@@ -49,32 +58,75 @@ static size_t guc_log_size(void)
 		CAPTURE_BUFFER_SIZE;
 }
 
+#define BYTES_PER_WORD		sizeof(u32)
+#define WORDS_PER_DUMP		8
+#define DUMPS_PER_LINE		4
+#define LINES_PER_READ		4
+#define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
+
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 {
+	static int g_count;
+	struct xe_uc_fw_version *ver = &log_to_guc(log)->fw.versions.found[XE_UC_FW_VER_RELEASE];
 	struct xe_device *xe = log_to_xe(log);
 	size_t size;
-	int i, j;
+	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
+	int l_count = g_count++;
+	int line = 0;
+	int i, j, k;
+	u64 ktime;
+	u32 stamp;
 
 	xe_assert(xe, log->bo);
 
 	size = log->bo->size;
 
-#define DW_PER_READ		128
-	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
-	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
-		u32 read[DW_PER_READ];
+	drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
+		   l_count, line++, __builtin_return_address(0));
+
+	drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u\n",
+		   l_count, line++, ver->major, ver->minor, ver->patch);
+
+	ktime = ktime_get_boottime_ns();
+	drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX [%llu]\n",
+		   l_count, line++, ktime, ktime);
 
-		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
-				   DW_PER_READ * sizeof(u32));
-#define DW_PER_PRINT		4
-		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
-			u32 *print = read + j * DW_PER_PRINT;
+	xe_pm_runtime_get(xe);
+	stamp = xe_mmio_read32(log_to_gt(log), GUC_PMTIMESTAMP);
+	xe_pm_runtime_put(xe);
+	drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
+		   l_count, line++, stamp, stamp);
 
-			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
-				   *(print + 0), *(print + 1),
-				   *(print + 2), *(print + 3));
+	drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
+		   l_count, line++, log_to_gt(log)->info.reference_clock);
+
+	xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
+	for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
+		u32 read[WORDS_PER_READ];
+
+		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * BYTES_PER_WORD,
+				   WORDS_PER_READ * BYTES_PER_WORD);
+
+		for (j = 0; j < WORDS_PER_READ; ) {
+			u32 done = 0;
+
+			for (k = 0; k < DUMPS_PER_LINE; k++) {
+				line_buff[done++] = ' ';
+				done += hex_dump_to_buffer(read + j,
+							   sizeof(*read) * (WORDS_PER_READ - j),
+							   WORDS_PER_DUMP * BYTES_PER_WORD,
+							   BYTES_PER_WORD,
+							   line_buff + done,
+							   sizeof(line_buff) - done,
+							   false);
+				j += WORDS_PER_DUMP;
+			}
+
+			drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, line_buff);
 		}
 	}
+
+	drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
 }
 
 int xe_guc_log_init(struct xe_guc_log *log)
-- 
2.43.2

