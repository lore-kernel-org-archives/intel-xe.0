Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BDBC83F3B
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 23:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA75610EA59;
	Fri, 18 Jul 2025 23:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JI6OZue0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CEB10EA4F
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 23:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752880346; x=1784416346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CAzk9efBK1CzalZ+fWnzUAkdAdOrJgHYZcG+uBr9fTg=;
 b=JI6OZue0CFqej9S71eBd3tFSkQDWOPzzmivKVbE4xfgpGD9NMsm3NcXw
 k80Zxn89Te71AiVwV8lRrzPf69Gh8olfzAYQZ7ap22+EAdEfht45pyx2u
 GP7ZCxUT5Mw1oKzk3Jhz4FljX7Grw26c6PDg4oHZNlfr8QJzaRqrAg7Gk
 UX+v8BPgLoHADglCdWAsQA+AYAqh+fDCTKUWGgTi3ofP5VCoIdUPKUBvv
 HBUWttay35gWEkc+aoyRHJHLqNmWJ60l9LxgBE2MajzynCpwkdcO7dI3b
 2PU6Jd85eac9ATjB1JfYXQlT/flrXGjVWotfEiZXvDZKmFsSbAxNjshLL w==;
X-CSE-ConnectionGUID: 2WO6f58GRuSHq4xpWnY7cw==
X-CSE-MsgGUID: u4zhVqQgRWeXMZ1JeyVPbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="58995569"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="58995569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 16:12:25 -0700
X-CSE-ConnectionGUID: +qZAoIcRTuaHoK50bEAqSg==
X-CSE-MsgGUID: PMQ7rNx4TS+ogVlUm5/HzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="163949099"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa005.jf.intel.com with ESMTP; 18 Jul 2025 16:12:24 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 3/6] drm/xe/guc: Add new debugfs entry for lfd format output
Date: Fri, 18 Jul 2025 19:12:20 -0400
Message-Id: <20250718231223.670188-4-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718231223.670188-1-zhanjun.dong@intel.com>
References: <20250718231223.670188-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_debugfs.c |  7 +++++++
 drivers/gpu/drm/xe/xe_guc_log.c     | 32 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 0b102ab46c4d..6cbc4240a3bd 100644
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
@@ -121,6 +127,7 @@ static const struct drm_info_list slpc_debugfs_list[] = {
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
+	{ "guc_log_lfd", .show = guc_debugfs_show, .data = guc_log_lfd },
 	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index c01ccb35dc75..d2256773aaf3 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "abi/guc_lfd_abi.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
@@ -19,6 +20,12 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 
+static const struct guc_lfd_file_header default_guc_lfd_file_header = {
+	.magic = GUC_LFD_DRIVER_KEY_STREAMING,
+	.version.dw0 = FIELD_PREP_CONST(GUC_LFD_VERSION_MINOR, GUC_LFD_FORMAT_VERSION_MINOR) |
+		       FIELD_PREP_CONST(GUC_LFD_VERSION_MAJOR, GUC_LFD_FORMAT_VERSION_MAJOR)
+};
+
 static struct xe_guc *
 log_to_guc(struct xe_guc_log *log)
 {
@@ -216,6 +223,17 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+static void
+xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
+{
+	if (!snapshot || !snapshot->size)
+		return;
+
+	/* Output LFD file header */
+	xe_print_blob_ascii85(p, "[LOG].data", 0, &default_guc_lfd_file_header, 0,
+			      offsetof(struct guc_lfd_file_header, lfd_stream));
+}
+
 /**
  * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
  * @log: GuC log structure
@@ -251,6 +269,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
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
+	xe_guc_log_snapshot_print_lfd(snapshot, p);
+	xe_guc_log_snapshot_free(snapshot);
+}
+
 int xe_guc_log_init(struct xe_guc_log *log)
 {
 	struct xe_device *xe = log_to_xe(log);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index f1e2b0be90a9..0f6299886010 100644
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

