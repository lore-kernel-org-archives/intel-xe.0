Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E20E81A2B
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 14:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1536210E18A;
	Mon, 16 Feb 2026 14:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0zrCg2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC35A10E18A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771253567; x=1802789567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W4lzPX8keUsp2UDmp5jEhASZVBCVqbrweII3i6SMCi4=;
 b=I0zrCg2dqRzYZb/hvWkb24GYzyrr4dne9Eu/g1L8SWIzCJx6+uy7+Xn6
 ejM/Mr9JblwWgLB3qMX0elyc3ORy03RruW4iGD/gNBuesmx0PZivEm6av
 8Ahf2SanQVmqOVr2Ym+XmMEE4rxzUTtDJWFc76epLswInkBQjvs2ZmlBQ
 4zYDO+FAfWyRH0edV9Cw6rxhjmlNLZp8A/IIVhMmS+G7jRjbAFs8D+inZ
 zbuAoGZ7XzcLSsmfySWk3wWLALVCLoVQxA3OUNNYuKypA1GsowufigGAu
 63Af62dA4WsJorJvaO1Ypc/ihe/ZJfSoviE1emKlSBzx3LnahDWpGIfze g==;
X-CSE-ConnectionGUID: E+p1daBXTJWP4tQb9E8U3Q==
X-CSE-MsgGUID: wgnBQ4Z6Qv6NXeZGH9HerQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="82663100"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="82663100"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:52:46 -0800
X-CSE-ConnectionGUID: G12OomQ1T6G0+e/H8e6AEw==
X-CSE-MsgGUID: mYTVW677T3i1OSmPysWiEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="211961486"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:52:43 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com
Subject: [PATCH v2 2/4] drm/xe/sysctrl: Add sysctrl debugfs infrastructure
Date: Mon, 16 Feb 2026 06:52:34 -0800
Message-ID: <20260216145232.3942399-8-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216145232.3942399-6-anoop.c.vijay@intel.com>
References: <20260216145232.3942399-6-anoop.c.vijay@intel.com>
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
 drivers/gpu/drm/xe/xe_debugfs.c         |  5 +++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c | 27 ++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h | 14 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h   | 58 +++++++++++++++++++++++++
 5 files changed, 105 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ee9e12dd744c..e04a3351aef5 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -123,6 +123,7 @@ xe-y += xe_bb.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_sysctrl.o \
+	xe_sysctrl_debugfs.o \
 	xe_sysctrl_mailbox.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..4c78e7b5734e 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -26,6 +26,8 @@
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_debugfs.h"
 #include "xe_tile_debugfs.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
@@ -581,4 +583,7 @@ void xe_debugfs_register(struct xe_device *xe)
 		xe_sriov_pf_debugfs_register(xe, root);
 	else if (IS_SRIOV_VF(xe))
 		xe_sriov_vf_debugfs_register(xe, root);
+
+	if (xe->info.has_sysctrl)
+		xe_sysctrl_debugfs_register(&xe->sc, root);
 }
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
index 000000000000..a393eaa42404
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
+#endif /* _XE_SYSCTRL_DEBUGFS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index d4a362564925..ede945a33ea3 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -10,6 +10,56 @@
 #include <linux/types.h>
 
 struct xe_mmio;
+struct dentry;
+
+/**
+ * enum xe_sysctrl_resp_len_type - Classification of response length semantics
+ * @XE_SYSCTRL_RESP_LEN_NONE:      No response (length is zero)
+ * @XE_SYSCTRL_RESP_LEN_FIXED:     Response length is a fixed, known value
+ * @XE_SYSCTRL_RESP_LEN_MATCH_CMD: Response length matches the input command length
+ * @XE_SYSCTRL_RESP_LEN_USER_CFG:  Response length is variable, set by user/config
+ */
+enum xe_sysctrl_resp_len_type {
+	XE_SYSCTRL_RESP_LEN_NONE,
+	XE_SYSCTRL_RESP_LEN_FIXED,
+	XE_SYSCTRL_RESP_LEN_MATCH_CMD,
+	XE_SYSCTRL_RESP_LEN_USER_CFG,
+};
+
+/**
+ * struct xe_sysctrl_debugfs_entry - Debugfs entry for sysctrl command
+ */
+struct xe_sysctrl_debugfs_entry {
+	/** @sc: Back pointer to parent sysctrl instance */
+	struct xe_sysctrl *sc;
+
+	/** @name: Command name for debugfs file */
+	const char *name;
+
+	/** @group: Command group ID */
+	u8 group;
+
+	/** @command: Command ID within group */
+	u8 command;
+
+	/** @resp_len_type: Response length determination policy */
+	enum xe_sysctrl_resp_len_type resp_len_type;
+
+	/** @fixed_resp_len: Fixed response length (for RESP_LEN_FIXED mode) */
+	size_t fixed_resp_len;
+
+	/** @user_resp_len: User-specified response length (for RESP_LEN_USER_CFG mode) */
+	size_t user_resp_len;
+
+	/** @response_buf: Response data buffer */
+	u8 response_buf[1024];
+
+	/** @response_len: Actual response length from firmware */
+	size_t response_len;
+
+	/** @status: Last command result */
+	int status;
+};
 
 /**
  * struct xe_sysctrl - System Controller driver context
@@ -28,6 +78,14 @@ struct xe_sysctrl {
 	 * messages to help distinguish message boundaries.
 	 */
 	bool phase_bit;
+
+	/**
+	 * @debugfs: Debugfs entries
+	 */
+	struct {
+		/** @root: Root debugfs directory */
+		struct dentry *root;
+	} debugfs;
 };
 
 #endif /* _XE_SYSCTRL_TYPES_H_ */
-- 
2.43.0

