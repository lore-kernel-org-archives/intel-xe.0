Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DB3C2A09B
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 14:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0968310E36A;
	Fri,  7 Aug 2026 14:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcKGjtZP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904AD10E41C
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786114599; x=1817650599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MbUBBXvkmoZWScFZ/cb7B63SKAB7LfIVI/wzKEenYWY=;
 b=RcKGjtZPxoGppQ/Jb2EDocpjNa02j722/cNYbDe45d/4Sw37NkNqc2BB
 1qP3h2g6Lio38JyO/mcpzPUv692I0Yp/GuEYtOYFvUxYqmmzcz2s69hqi
 Go7NJaiqzZD07fObWpKUzu0iAf4zTh9XXvyjQ7ihpqeBlA6Dnnhz5ffiH
 kdupNqRrRZbvQdtv+PTQh2uCL6ffz1VySTkqR/PkdWwcc2zdIG6k6h4UU
 3hSoNyIP6fjf7gW46GYPOqcKMTzuWVjeO/ZoxJJSMzDWXuw99bbA8umvF
 quzpzghkCbC/dgv8vOypdsh4ceqV20uzhR3NAwwE0LVagUEzjVLPTQHTV A==;
X-CSE-ConnectionGUID: Y4VGNFmERJKp3NF7jMmgjA==
X-CSE-MsgGUID: qEc+2imqSnSSuUwMnJRJfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90604297"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="90604297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 07:56:36 -0700
X-CSE-ConnectionGUID: wzfnS+RYRk2CCtcgdQqZQg==
X-CSE-MsgGUID: cEdPiDYoQrGXdYLExr4y3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258116214"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 07:56:32 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v3 2/4] drm/xe/sysctrl: Add sysctrl debugfs infrastructure
Date: Fri,  7 Aug 2026 07:56:23 -0700
Message-ID: <20260807145621.2938848-8-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add basic debugfs support for sysctrl. This patch adds necessary
types and registration hooks.

Changes:
- Add debugfs structure to xe_sysctrl_types.h
- Add xe_sysctrl_debugfs.h header
- Add xe_sysctrl_debugfs_register() stub
- Wire up sysctrl debugfs registration

No functional changes, debugfs directory created but empty.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/Makefile             |  1 +
 drivers/gpu/drm/xe/xe_debugfs.c         |  5 +++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c | 27 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h | 14 +++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h   |  7 +++++++
 5 files changed, 54 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 44ed055439d4..f083451608ff 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -127,6 +127,7 @@ xe-y += xe_bb.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_sysctrl.o \
+	xe_sysctrl_debugfs.o \
 	xe_sysctrl_event.o \
 	xe_sysctrl_mailbox.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8de78cd0aa03..666290d83bfe 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -30,6 +30,8 @@
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_debugfs.h"
 #include "xe_tile_debugfs.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
@@ -770,6 +772,9 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	xe_fault_inject_debugfs_register(xe, root);
 
+	if (xe->info.has_sysctrl)
+		xe_sysctrl_debugfs_register(&xe->sc, root);
+
 	if (IS_SRIOV_PF(xe))
 		xe_sriov_pf_debugfs_register(xe, root);
 	else if (IS_SRIOV_VF(xe))
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
new file mode 100644
index 000000000000..0238ff093831
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+
+#include "xe_device.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_debugfs.h"
+#include "xe_sysctrl_types.h"
+
+/**
+ * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
+ * @sc: xe_sysctrl instance
+ * @parent: parent debugfs directory
+ */
+void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
+{
+	struct dentry *root;
+
+	root = debugfs_create_dir("sc", parent);
+	if (IS_ERR(root))
+		return;
+
+	sc->debugfs.root = root;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
new file mode 100644
index 000000000000..d1414ac3562e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_DEBUGFS_H_
+#define _XE_SYSCTRL_DEBUGFS_H_
+
+struct dentry;
+struct xe_sysctrl;
+
+void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 66ba24f43017..d50a35fefb7a 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -11,6 +11,7 @@
 #include <linux/workqueue_types.h>
 
 struct xe_mmio;
+struct dentry;
 
 /**
  * struct xe_sysctrl - System Controller driver context
@@ -34,6 +35,12 @@ struct xe_sysctrl {
 
 	/** @event_lock: Mutex protecting pending events */
 	struct mutex event_lock;
+
+	/** @debugfs: Debugfs entries */
+	struct {
+		/** @debugfs.root: Root debugfs directory */
+		struct dentry *root;
+	} debugfs;
 };
 
 #endif
-- 
2.43.0

