Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE594CE7A9D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 20:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B00810E08F;
	Thu,  5 Sep 2024 20:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gS2MTzfK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F9A10E01F
 for <Intel-Xe@lists.freedesktop.org>; Thu,  5 Sep 2024 20:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725569476; x=1757105476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sA5RoOjBfUssWzkJAIPXwtL8XX3S9Utr1zmfRsrHK3c=;
 b=gS2MTzfKOTMfQN7+fyJwRBvC5o4lGuPeaoHWAcQzzw1/krqfF7O6tmjI
 Yt/4BfBo+b9Tc3MaCNL4B2ID2Xt0wYOJdWr/RMuXo/Ijfh4e6H8G2E0Tm
 aYPTim0XbTWkY7CHcOTw9lETy3c/A9Njfvl3+A0enPG4K2ogFfcyb+9Gs
 GWIptRLUK+opQERRr32iTWVBMo5PIFXxbeGoN4EZSDdeiRzciVuLCoF51
 1Gv4EL3s7pmCsNAtF4mHYOPnIRJCmiA07/+SjxFU9aR2ioh4uknaeH8wP
 TeJq/OROBfvYKaB4gJQy1XP6MPhcbNJrbUnHU1QCJN3MI6O9CIxtmJCVF Q==;
X-CSE-ConnectionGUID: VDSG0YvEQY+dJMzb8pgxkw==
X-CSE-MsgGUID: sLf4NUBNTtWB4sg4uFd/jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34982280"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="34982280"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 13:51:07 -0700
X-CSE-ConnectionGUID: wTgS63qFRZmvV1rjcK8nGg==
X-CSE-MsgGUID: Rdv/qfGASUu4CD+Co56ANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="66486753"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 05 Sep 2024 13:51:06 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper function
Date: Thu,  5 Sep 2024 13:50:58 -0700
Message-ID: <20240905205106.1063091-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
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

v2: Add a prefix to the output string. Fix memory allocation bug.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 86 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++
 2 files changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index c4c656dee18e..5e2e93ad773c 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -6,6 +6,7 @@
 #include "xe_devcoredump.h"
 #include "xe_devcoredump_types.h"
 
+#include <linux/ascii85.h>
 #include <linux/devcoredump.h>
 #include <generated/utsrelease.h>
 
@@ -312,3 +313,88 @@ int xe_devcoredump_init(struct xe_device *xe)
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
+ * @prefix: optional prefix to add to output string
+ * @blob: the Binary Large OBject to dump out
+ * @offset: offset in bytes to skip from the front of the BLOB, must be a multiple of sizeof(u32)
+ * @size: the size in bytes of the BLOB, must be a multiple of sizeof(u32)
+ */
+void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
+			   const void *blob, size_t offset, size_t size)
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
+	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
+	if (IS_ERR_OR_NULL(line_buff)) {
+		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
+		return;
+	}
+
+	blob32 += offset / sizeof(*blob32);
+	size /= sizeof(*blob32);
+
+	if (prefix) {
+		strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN - MIN_SPACE - 3);
+		line_pos = strlen(line_buff);
+
+		line_buff[line_pos++] = ':';
+		line_buff[line_pos++] = ' ';
+	}
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
index e2fa65ce0932..a4eebc285fc8 100644
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
 
@@ -23,4 +26,7 @@ static inline int xe_devcoredump_init(struct xe_device *xe)
 }
 #endif
 
+void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
+			   const void *blob, size_t offset, size_t size);
+
 #endif
-- 
2.46.0

