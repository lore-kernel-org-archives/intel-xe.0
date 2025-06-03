Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679FBC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 17:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F5310E0AA;
	Tue,  3 Jun 2025 17:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMAVsxZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF7910E0AA
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 17:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748973193; x=1780509193;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=InC5Zo7ZdSrxxFKODxyMs74dGKPS64Y3GFRnB1lQyUQ=;
 b=UMAVsxZdJg+9GUvATWLvCVgO6P7b5fLhPwioipRiw1ejGwYstqZZ1wq6
 ChdZAKIFfnny5GNewmjB+p1IoJ2SVdDByUug6KpTSEL9RzYSE9JhtGX7X
 nqo15yLuuHb09mh/bwWe1F9UaGjGE7/GU45OpvWjuaPGYlvOHX4Ptj49E
 wGJHPk7oqkd20+NQoEIG56JkKB4LnQOppz3+UieoW9bkQ1MrMzbHSnsi5
 r6EI/tOK+ZqqmUSf2bfBQZ5Zz018X+iFcETkD1HgiILCqhBY6L9JPJuH8
 ga319wUUulK8My3g2oc97vpC41yFoP/yqMpjH6zwOOeMEjrDOM7+Z0IxA Q==;
X-CSE-ConnectionGUID: 68aDlGp9SPeiNiZoQRX4Hw==
X-CSE-MsgGUID: Zc0vi6qvTn+ZAkekWNKeeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="73559947"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="73559947"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:53:13 -0700
X-CSE-ConnectionGUID: NabkHIL3SFuJzqB2FioB/Q==
X-CSE-MsgGUID: Tm+pF9npSVepHrEL2jMXXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149706957"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:53:11 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Make debugfs guc_log_dmesg attribute write-only
Date: Tue,  3 Jun 2025 19:53:02 +0200
Message-Id: <20250603175302.593-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Ocassionally we want to dump a GuC log into the dmesg, but current
implementation is based on the drm debugfs API and was triggering
dump on the read operation.  Expose guc_log_dmesg attribute as
write-only using pure debugfs API to make dump requests explicit.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 43 ++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 0b102ab46c4d..eb6124d02d53 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -5,6 +5,8 @@
 
 #include "xe_guc_debugfs.h"
 
+#include <linux/debugfs.h>
+
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
@@ -85,12 +87,6 @@ static int guc_log(struct xe_guc *guc, struct drm_printer *p)
 	return 0;
 }
 
-static int guc_log_dmesg(struct xe_guc *guc, struct drm_printer *p)
-{
-	xe_guc_log_print_dmesg(&guc->log);
-	return 0;
-}
-
 static int guc_ctb(struct xe_guc *guc, struct drm_printer *p)
 {
 	xe_guc_ct_print(&guc->ct, p, true);
@@ -121,9 +117,39 @@ static const struct drm_info_list slpc_debugfs_list[] = {
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
-	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
 };
 
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── uc
+ *      │   │   ├── guc_log_dmesg
+ */
+static ssize_t guc_log_dmesg_write(struct file *file,
+				   const char __user *userbuf,
+				   size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct xe_guc *guc = s->private;
+	bool yes;
+	int ret;
+
+	if (*ppos)
+		return -EINVAL;
+	ret = kstrtobool_from_user(userbuf, count, &yes);
+	if (ret < 0)
+		return ret;
+	if (yes)
+		xe_guc_log_print_dmesg(&guc->log);
+	return count;
+}
+
+static int guc_log_dmesg_show(struct seq_file *s, void *unused)
+{
+	return 0;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(guc_log_dmesg);
+
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 {
 	struct xe_device *xe =  guc_to_xe(guc);
@@ -142,5 +168,8 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 			drm_debugfs_create_files(slpc_debugfs_list,
 						 ARRAY_SIZE(slpc_debugfs_list),
 						 parent, minor);
+
+		debugfs_create_file("guc_log_dmesg", 0200, parent,
+				    guc, &guc_log_dmesg_fops);
 	}
 }
-- 
2.47.1

