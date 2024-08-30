Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A42CA0EE7
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD3110E804;
	Fri, 30 Aug 2024 06:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yc4V9ibn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C255F10E7FD
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724998992; x=1756534992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NoLR4NSF0lCxynj27fZwwjS9J61+OXNbjhzutifNTog=;
 b=Yc4V9ibnv6uya1gRIW+1digNiHhxn60+uMlO5eLtQfF/KFlUORgizceQ
 9BRUhciMbSFENfdM55PSj+xnSU7SnRcj6J4zNJGpdZOGgsi06ZWi+2A0z
 pcIDGc6JvAEAv9fpmV2FmEABEwfuCNMVDAVvfvDBWYVjklUXuRuyyx/Js
 2gHyOxU2IVsGalKjK35CqDWAHKO7BLhNoKRhUoEurIAWz2f4XLUQwJdbe
 gIyzgbNEh5Kg5h7abk7OjZCu1jXK7Vk56cZdAacEk1aewrhvoOi/SX8Qf
 5ujA3Duzkf+N45//nn8NUPgX6ei9h0sxZO8LXDku3kpFxuY2vt67ZjD30 Q==;
X-CSE-ConnectionGUID: zAbwg9p7S66b4Kqz+G7WPA==
X-CSE-MsgGUID: 8107PpRkQnS3EbTKwwuiPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34245219"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="34245219"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:23:11 -0700
X-CSE-ConnectionGUID: V8Fit2rgSk2EPGlzOvHUug==
X-CSE-MsgGUID: 9getV2sHQ5KqntI+UE1LOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="87040565"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2024 23:23:11 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 2/9] drm/xe: Add ASCII85 dump helper function
Date: Thu, 29 Aug 2024 23:23:03 -0700
Message-ID: <20240830062310.3450387-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
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

There is a need to include the GuC log and other large binary objects
in core dumps and via dmesg. So add a helper for dumping to a printer
function via conversion to ASCII85 encoding.

Another issue with dumping such a large buffer is that it can be slow,
especially if dumping to dmesg over a serial port. So add a yield to
prevent the 'task has been stuck for 120s' kernel hang check feature
from firing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 76 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h |  5 ++
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index bdb76e834e4c..eec7b89ab48b 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -6,6 +6,7 @@
 #include "xe_devcoredump.h"
 #include "xe_devcoredump_types.h"
 
+#include <linux/ascii85.h>
 #include <linux/devcoredump.h>
 #include <generated/utsrelease.h>
 
@@ -310,3 +311,78 @@ int xe_devcoredump_init(struct xe_device *xe)
 }
 
 #endif
+
+/**
+ * xe_print_blob_ascii85 - print a BLOB to some useful location in ASCII85
+ *
+ * The output is split to multiple lines because some print targets, e.g. dmesg
+ * cannot handle arbitrarily long lines. Note also that printing to dmesg in
+ * piece-meal fashion is not possible, each separate call to drm_puts() has a
+ * line-feed automatically added! Therefore, the entire output line must be
+ * constructed in a local buffer first, then printed in one atomic output call.
+ *
+ * There is also a scheduler yield call to prevent the 'task has been stuck for
+ * 120s' kernel hang check feature from firing when printing to a slow target
+ * such as dmesg over a serial port.
+ *
+ * TODO: Add compression prior to the ASCII85 encoding to shrink huge buffers down.
+ *
+ * @p: the printer object to output to
+ * @blob: the Binary Large OBject to dump out
+ * @offset: offset in bytes to skip from the front of the BLOB, must be a multiple of sizeof(u32)
+ * @size: the size in bytes of the BLOB, must be a multiple of sizeof(u32)
+ */
+void xe_print_blob_ascii85(struct drm_printer *p, const void *blob, size_t offset, size_t size)
+{
+	const u32 *blob32 = (const u32 *)blob;
+	char buff[ASCII85_BUFSZ], *line_buff;
+	size_t line_pos = 0;
+
+#define DMESG_MAX_LINE_LEN	800
+#define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
+
+	if (size & 3)
+		drm_printf(p, "Size not word aligned: %zu", size);
+	if (offset & 3)
+		drm_printf(p, "Offset not word aligned: %zu", size);
+
+	line_buff = kzalloc(sizeof(DMESG_MAX_LINE_LEN), GFP_KERNEL);
+	if (IS_ERR(line_buff)) {
+		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
+		return;
+	}
+
+	blob32 += offset / sizeof(*blob32);
+	size /= sizeof(*blob32);
+
+	while (size--) {
+		u32 val = *(blob32++);
+
+		strscpy(line_buff + line_pos, ascii85_encode(val, buff),
+			DMESG_MAX_LINE_LEN - line_pos);
+		line_pos += strlen(line_buff + line_pos);
+
+		if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
+			line_buff[line_pos++] = '\n';
+			line_buff[line_pos++] = 0;
+
+			drm_puts(p, line_buff);
+
+			line_pos = 0;
+
+			/* Prevent 'stuck thread' time out errors */
+			cond_resched();
+		}
+	}
+
+	if (line_pos) {
+		line_buff[line_pos++] = '\n';
+		line_buff[line_pos++] = 0;
+
+		drm_puts(p, line_buff);
+	}
+
+	kfree(line_buff);
+
+#undef MIN_SPACE
+}
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index e2fa65ce0932..3f82188590ac 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -6,6 +6,9 @@
 #ifndef _XE_DEVCOREDUMP_H_
 #define _XE_DEVCOREDUMP_H_
 
+#include <linux/types.h>
+
+struct drm_printer;
 struct xe_device;
 struct xe_sched_job;
 
@@ -23,4 +26,6 @@ static inline int xe_devcoredump_init(struct xe_device *xe)
 }
 #endif
 
+void xe_print_blob_ascii85(struct drm_printer *p, const void *blob, size_t offset, size_t size);
+
 #endif
-- 
2.46.0

