Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EC9D111A8
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 17:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AC610E838;
	Thu, 27 Nov 2025 17:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eI2lZEp9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F66510E838
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764263283; x=1795799283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ptRxsW/59eW6cfGe2DyHKLz74flEyDNblsjcj+FOW3c=;
 b=eI2lZEp9ZMEwaXrSAJQtvj30gtlZKoWnsHB7g3BmDWzR96yDXHXBU2z4
 wAt/7n97QxccKmO4CtnTul3N5s1HxCywcaKvQTtNOxdJ0BLFCztov3uKt
 J2ItbnznjGqLHozHh3VtP8mKMeZiQTs1IWzT2X3VNxgjFNiufxyBUtx+4
 RRnspJAeaVUMLYhFsJ72Oyj46tSZrZQ8bh/gwBOoy5zufceBvZ5RzSPh6
 k85FN+5KzbesDDaE/1eubQgIz+1Yr3FJuj+oXpQEqvXfGnG4h4/jN/hJr
 RonJ+FNNKldJlwFbOHFvTrih0WMV2Ru2S5c+W8d9aX13gpyliiMj+As7B Q==;
X-CSE-ConnectionGUID: 1fZoP0/uTmacQmm94Npheg==
X-CSE-MsgGUID: 1EqTFKAQQaO6liHNbTaBQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66344056"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66344056"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:08:02 -0800
X-CSE-ConnectionGUID: cyGe55JRSYyHW4+yCsrBDA==
X-CSE-MsgGUID: T+tCQQTPRuqIxDydpfTYRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="230554379"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa001.jf.intel.com with ESMTP; 27 Nov 2025 09:08:02 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v8 6/6] drm/xe/guc: Add new debugfs entry for lfd format output
Date: Thu, 27 Nov 2025 12:07:59 -0500
Message-Id: <20251127170759.2620994-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127170759.2620994-1-zhanjun.dong@intel.com>
References: <20251127170759.2620994-1-zhanjun.dong@intel.com>
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
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c |  7 +++++++
 drivers/gpu/drm/xe/xe_guc_log.c     | 18 +++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index efaca259d3e8..23827e87450f 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -81,6 +81,12 @@ static int guc_log(struct xe_guc *guc, struct drm_printer *p)
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
@@ -117,6 +123,7 @@ static const struct drm_info_list slpc_debugfs_list[] = {
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
+	{ "guc_log_lfd", .show = guc_debugfs_show, .data = guc_log_lfd },
 	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 40c9e812e9d5..d7473b9673bb 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -542,9 +542,7 @@ xe_guc_log_add_crash_dump(struct drm_printer *p, struct xe_guc_log_snapshot *sna
 	return size;
 }
 
-void
-xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
-void
+static void
 xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
 {
 	struct guc_lfd_file_header header;
@@ -609,6 +607,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 	xe_guc_log_snapshot_free(snapshot);
 }
 
+/**
+ * xe_guc_log_print_lfd - dump a copy of the GuC log in LFD format
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
index 0bd5e89d75e0..1b05bb60c1c7 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -52,6 +52,7 @@ struct xe_device;
 
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
+void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
 void xe_guc_log_print_dmesg(struct xe_guc_log *log);
 struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
 void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
-- 
2.34.1

