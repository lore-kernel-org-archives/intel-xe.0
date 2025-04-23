Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1F4C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 21:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F9A10E283;
	Wed, 23 Apr 2025 21:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIh86mD6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300DD10E2CA
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 21:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745445506; x=1776981506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oT3z42HP+24O/u5kLFmruC5aWlPlPnOW/ZAt+mjWCaI=;
 b=YIh86mD6a+6aAX+vXPFul1s7TAyXKRqZibwFxfnPnlcUM4ai3ir413ii
 4zzn1vdmkudAzjAu9c3pLOxPAYbeGaCk8I9ResVCnTSA5l3xVWYY+k6nb
 BKWsRjbUNlFbYsHZWyugyrr35WVjDqg4bDBURAu3L33kviqakJscQhdKb
 9FhlwQv3mVhEiYVhEJZoCCr8CyGsCk1RE+CiehyzMNQWI/qnvcuRHiR7C
 Xn+eFF7fUqVW17b0adE1K/Td2tIOInIf0QDJrWN0b4ghQ6hiVF9Q1LLB0
 K/a5g6VIjjnDhVs03fXjsn5OkT5jhDZNb3Lx4nRbKEMY2AvJSI+fNUam1 w==;
X-CSE-ConnectionGUID: IoyGiqT1QYKOedAx39ALng==
X-CSE-MsgGUID: tK2RzCswTKej6TNTgFtF7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47073115"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47073115"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 14:58:23 -0700
X-CSE-ConnectionGUID: mpEH4dVXRVi+lRSYHZGj7Q==
X-CSE-MsgGUID: js7W1iq+QBiIGAXhVpcmWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="136507651"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 14:58:23 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 3/6] drm/xe/guc: Add new debugfs entry for lfd format output
Date: Wed, 23 Apr 2025 14:58:18 -0700
Message-Id: <20250423215821.3078428-4-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423215821.3078428-1-zhanjun.dong@intel.com>
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
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

Add new debugfs entry "guc_log_lfd", prepared for output guc log
in LFD(Log Format Descriptors) format.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c |  7 ++++
 drivers/gpu/drm/xe/xe_guc_log.c     | 52 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
 3 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index f33013f8a0f3..a441c5775ca3 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -85,6 +85,12 @@ static int guc_log(struct xe_guc *guc, struct drm_printer *p)
 	return 0;
 }
 
+static int guc_log_lfd(struct xe_guc *guc, struct drm_printer *p)
+{
+	xe_guc_log_print_lfd(&guc->log, p);
+	return 0;
+}
+
 static int guc_log_dmesg(struct xe_guc *guc, struct drm_printer *p)
 {
 	xe_guc_log_print_dmesg(&guc->log);
@@ -116,6 +122,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
+	{ "guc_log_lfd", .show = guc_debugfs_show, .data = guc_log_lfd },
 	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
 	{ "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 38039c411387..e362e407f6d5 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "abi/guc_log_lfd_abi.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
@@ -19,6 +20,14 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 
+static const struct guc_logfile_header default_guc_logfile_header = {
+	.magic = LFD_DRIVER_KEY_STREAMING,
+	.version.dw0 = FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_MINOR_VERSION,
+					GUC_LOG_FILE_FORMAT_VERSION_MINOR) |
+		       FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_MAJOR_VERSION,
+					GUC_LOG_FILE_FORMAT_VERSION_MAJOR)
+};
+
 static struct xe_guc *
 log_to_guc(struct xe_guc_log *log)
 {
@@ -216,6 +225,35 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+static void
+xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
+			      struct xe_guc_log *log)
+{
+	char *lfd_buf;
+	int index;
+
+	if (!snapshot || !snapshot->size)
+		return;
+
+	/* Alloc lfd buffer in fixed size */
+	lfd_buf = kzalloc(GUC_LOG_CHUNK_SIZE, GFP_KERNEL);
+	if (!lfd_buf) {
+		index = -ENOMEM;
+		goto lfd_out;
+	}
+
+	/* Fill LFD file header */
+	memcpy(lfd_buf, &default_guc_logfile_header, sizeof(default_guc_logfile_header));
+	index = offsetof(struct guc_logfile_header, lfd_stream);
+	xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, (size_t)index);
+
+lfd_out:
+	drm_printf(p, "\n");
+	if (index < 0)
+		drm_printf(p, "ERROR: Out of memory\n");
+	kfree(lfd_buf);
+}
+
 /**
  * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
  * @log: GuC log structure
@@ -251,6 +289,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 	xe_guc_log_snapshot_free(snapshot);
 }
 
+/**
+ * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful location
+ * @log: GuC log structure
+ * @p: the printer object to output to
+ */
+void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
+{
+	struct xe_guc_log_snapshot *snapshot;
+
+	snapshot = xe_guc_log_snapshot_capture(log, false);
+	xe_guc_log_snapshot_print_lfd(snapshot, p, log);
+	xe_guc_log_snapshot_free(snapshot);
+}
+
 int xe_guc_log_init(struct xe_guc_log *log)
 {
 	struct xe_device *xe = log_to_xe(log);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 5b896f5fafaf..37ff4d11e6cf 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -40,6 +40,7 @@ struct xe_device;
 
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
+void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
 void xe_guc_log_print_dmesg(struct xe_guc_log *log);
 struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
 void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
-- 
2.34.1

