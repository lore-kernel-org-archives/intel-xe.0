Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040CDC369A9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 15:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E1C10E9FD;
	Thu, 10 Apr 2025 15:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RN1YKduO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA6710E9F9
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744300736; x=1775836736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1GiyQyU/CIIC4jjmmyANt6C0KEfcDq3uDcBOPyeJWVk=;
 b=RN1YKduOg8iLn5TFr7GRiQlp+V45RQTgBywEHU+80Jwq2rt6cX6pTeX7
 rgODi7pBldy7v1S3CH9nyg5InfKh4i5kAPlEL39fuo0lLyuH7QQbLFmsC
 0/jxhSpTEbvCpoO8nstZyMDxj+LoHZMWSFUyHuXfTb5O1+piXqCOuftKA
 luXq8JziodMuBsQmzAFZgKWJcv4/erXCa2TUyO5mdHrfaXYbn9jEmSPa4
 s4GKkWRD7Xq0Bnjy4ZYvuHjd2woA/7k0CxrmvxxNKjfswX//mAY2EwjiA
 /wgkuiYAnRQgVU/UhCGBsJbkk7izswrljgQ1EO0/kQHJcYrhlmCkTkO0S A==;
X-CSE-ConnectionGUID: OFqGoPqyShuiomS+XP4dOA==
X-CSE-MsgGUID: LO1pkKQSTp+HslJPqHGu1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56810518"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56810518"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 08:58:55 -0700
X-CSE-ConnectionGUID: sTw+yPnOR1GYdBQ06nIjUQ==
X-CSE-MsgGUID: KkmIcRdGRHuyCr30s9nbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129487182"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 10 Apr 2025 08:58:55 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 2/4] drm/xe/guc: Add new debugfs entry for lfd format output
Date: Thu, 10 Apr 2025 08:58:51 -0700
Message-Id: <20250410155853.574830-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410155853.574830-1-zhanjun.dong@intel.com>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.c     | 34 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
 3 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index c569ff456e74..6449c9a69b8a 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -48,6 +48,19 @@ static int guc_log(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int guc_log_lfd(struct seq_file *m, void *data)
+{
+	struct xe_guc *guc = node_to_guc(m->private);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_pm_runtime_get(xe);
+	xe_guc_log_print_lfd(&guc->log, &p);
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
 static int guc_log_dmesg(struct seq_file *m, void *data)
 {
 	struct xe_guc *guc = node_to_guc(m->private);
@@ -89,6 +102,7 @@ static int guc_pc(struct seq_file *m, void *data)
 static const struct drm_info_list debugfs_list[] = {
 	{"guc_info", guc_info, 0},
 	{"guc_log", guc_log, 0},
+	{"guc_log_lfd", guc_log_lfd, 0},
 	{"guc_log_dmesg", guc_log_dmesg, 0},
 	{"guc_ctb", guc_ctb, 0},
 	{"guc_pc", guc_pc, 0},
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 38039c411387..df849a0ee7e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -216,6 +216,26 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	}
 }
 
+static void
+xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
+			      struct xe_guc_log *log)
+{
+	size_t remain;
+	int i;
+
+	if (!snapshot)
+		return;
+
+	remain = snapshot->size;
+	for (i = 0; i < snapshot->num_chunks; i++) {
+		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
+
+		/* To be add: Output snapshot in LFD format */
+
+		remain -= size;
+	}
+}
+
 /**
  * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
  * @log: GuC log structure
@@ -251,6 +271,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
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

