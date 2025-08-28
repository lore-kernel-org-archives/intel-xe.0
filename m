Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC30CCA0FFF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 17:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FFC10EA6D;
	Thu, 28 Aug 2025 17:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ktpl7vHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAE110EA66
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756402922; x=1787938922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/Qp4S3GMcaFFTY5CXHFmznJl6kOftRbmkLWCFVnhTs=;
 b=Ktpl7vHyvkv4H4NtzdO19RStGrgY7s5o3FPpWaUKvGuq6qZKIA2owDc0
 019GKa+mxm9cG6qALKRwgq2aCQaoi3JWhwT4gc9WAVp5sgeNqm6mXCo0A
 YTEiFtgjw+1jRXNyAmVRWyJrKZfgJHvl3Wr0gX3J+ASy31lYNqEJuYp4e
 FLYek2FNU/FPc7vpX7WR4hJxC1YlEK6Qb1uh0yg/vCaYmZ65V8q8TrgMo
 BUgFX+v/yZbjVbO6QQZgYKIyUxOLNGha7Rz8zKeYRyj8ohvUVhOvAS0ed
 IETpO67JgCG61QJQwIWPI0EuCMSjJXkKuk4/a1aJf2lGpl52tEK8bX7IY A==;
X-CSE-ConnectionGUID: TOvZdQT6STyeBCyzT2WLYg==
X-CSE-MsgGUID: Mptqs4bMQu2g2YM1dCHaTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84085136"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="84085136"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:42:02 -0700
X-CSE-ConnectionGUID: xvpKIx69QxKCKeB2UOG55Q==
X-CSE-MsgGUID: lWZfp8H9R8q3Y8sZ2zhXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="207317139"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa001.jf.intel.com with ESMTP; 28 Aug 2025 10:42:02 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v7 6/6] drm/xe/guc: Add new debugfs entry for lfd format output
Date: Thu, 28 Aug 2025 13:41:59 -0400
Message-Id: <20250828174159.1232994-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828174159.1232994-1-zhanjun.dong@intel.com>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_log.c     | 18 +++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
 3 files changed, 23 insertions(+), 3 deletions(-)

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
index 589975904153..21c464f2f14c 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -568,9 +568,7 @@ xe_guc_log_add_crash_dump(struct drm_printer *p, struct xe_guc_log_snapshot *sna
 	return size;
 }
 
-void
-xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
-void
+static void
 xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
 {
 	struct guc_lfd_file_header header;
@@ -635,6 +633,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
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

