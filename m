Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DB7C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 15:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAD910E87D;
	Thu, 25 Jul 2024 15:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLEYSaqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFB710E87D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721920916; x=1753456916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zNlRNF30dPxfdpgBAox6Kwb33NmDjX3xm6xs+KFkzQA=;
 b=fLEYSaqTtTNM30d2qs1/dXhN5iFbljehZek8PNsgcQH93Iex8uGbt2LW
 aeDMtBznjUYH+qpZfvub1N4UKCytHOnzYzJ8Q3N3i4874jfnS4Xes33MR
 M7GDlyYKjWTVHRHoqYKaSOdVDXzxObDOKMVWnDI3/PjElotz+exGjnxBi
 obW25+6KH48Ha3q3sm6aBw/USH0KBKlM33Jb7pqWoYxP0yOYwaxm90vjp
 lvxjSC00jgOIZU+6WA63jErwA3RTbo7AsMBRmpYUU0TfLo1UJJGVMTgQS
 hkXBzJ4sRlY/IXyIFHZHmzQkBwY9bPQZNNlMMHt0cRFRg4bPpFrDYUZDT Q==;
X-CSE-ConnectionGUID: prj5wEp4Sx6OWn+2s+rvmQ==
X-CSE-MsgGUID: moXnsWgmRNiY9R5WF+Wm1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="42198063"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="42198063"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 08:21:55 -0700
X-CSE-ConnectionGUID: 9G0klsfYQAqAP0Z3K79h3w==
X-CSE-MsgGUID: GgNrEHRIThWEEK6iGJUkew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52646739"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 08:21:54 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [RFC PATCH 1/2] drm/xe: Implement APIs for measuring various events
Date: Thu, 25 Jul 2024 17:05:44 +0200
Message-ID: <20240725150550.13085-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240725150550.13085-1-nirmoy.das@intel.com>
References: <20240725150550.13085-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
Content-Type: text/plain; charset=a
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

Introduces a set of APIs for tracking and managing events.
This currently only supports counters.

This can be conditionally enabled with the CONFIG_DRM_XE_STATS
config option.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug |  11 +++
 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_stats.c    | 145 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_stats.h    |  66 ++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_stats.c
 create mode 100644 drivers/gpu/drm/xe/xe_stats.h

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index bc177368af6c..4db6d707c1af 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
 
 	 Recomended for driver developers only.
 	 If in doubt, say "N".
+
+config DRM_XE_STATS
+	bool "Enable XE statistics"
+	default n
+	help
+	  Choose this option to enable support for collecting and
+	  displaying XE statistics as debugfs.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1ff9602a52f6..c5d9ec22c6bf 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -117,6 +117,7 @@ xe-y += xe_bb.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
+xe-$(CONFIG_DRM_XE_STATS) += xe_stats.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_stats.c b/drivers/gpu/drm/xe/xe_stats.c
new file mode 100644
index 000000000000..1b8910900fd3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_stats.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+#include "xe_stats.h"
+
+#ifdef CONFIG_DRM_XE_STATS
+static struct xe_stats_entry *find_stats_entry(struct xe_stats *stats, const char *name)
+{
+	struct xe_stats_entry *stats_entry;
+
+	list_for_each_entry(stats_entry, &stats->entries, list) {
+		if (strcmp(stats_entry->name, name) == 0)
+			return stats_entry;
+	}
+
+	return NULL;
+}
+
+static int stats_show(struct seq_file *m, void *v)
+{
+	struct xe_stats_entry *entry = m->private;
+
+	if (entry && !entry->enabled)
+		return 0;
+
+	switch (entry->type) {
+	case XE_STATS_TYPE_COUNTER:
+		seq_printf(m, "%s: Counter value: %llu\n", entry->name,
+			   atomic64_read(&entry->data.counter.value));
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int stats_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, stats_show, inode->i_private);
+}
+
+static const struct file_operations stats_fops = {
+	.owner   = THIS_MODULE,
+	.open    = stats_open,
+	.read    = seq_read,
+	.release = single_release,
+};
+
+struct xe_stats *xe_stats_init(struct drm_device *drm, struct dentry *parent)
+{
+	struct xe_stats *stats;
+
+	stats = drmm_kzalloc(drm, sizeof(*stats), GFP_KERNEL);
+	if (!stats) {
+		drm_err(drm, "Failed to allocate memory for xe_stats\n");
+		return NULL;
+	}
+
+	stats->drm = drm;
+	INIT_LIST_HEAD(&stats->entries);
+
+	stats->debugfs_entry = debugfs_create_dir("stats", parent);
+	if (!stats->debugfs_entry) {
+		drm_err(drm, "Failed to create stats debugfs directory\n");
+		return NULL;
+	}
+
+	return stats;
+}
+
+void xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type)
+{
+	struct xe_stats_entry *entry;
+	struct dentry *debugfs_entry;
+
+	if (!stats || !name)
+		return;
+
+	entry = drmm_kzalloc(stats->drm, sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return;
+
+	entry->name = drmm_kstrdup(stats->drm, name, GFP_KERNEL);
+	if (!entry->name)
+		return;
+
+	entry->type = type;
+	entry->enabled = true;
+
+	switch (type) {
+	case XE_STATS_TYPE_COUNTER:
+		atomic64_set(&entry->data.counter.value, 0);
+		break;
+	default:
+		return;
+	}
+
+	list_add(&entry->list, &stats->entries);
+
+	debugfs_entry = debugfs_create_file(name, 0444, stats->debugfs_entry, entry, &stats_fops);
+	if (!debugfs_entry) {
+		drm_err(stats->drm, "Failed to create stats debugfs file for %s\n", name);
+		list_del(&entry->list);
+		return;
+	}
+
+	entry->dentry = debugfs_entry;
+}
+
+void xe_stats_increment_counter(struct xe_stats *stats, const char *name)
+{
+	struct xe_stats_entry *entry;
+
+	if (!stats || !name)
+		return;
+
+	entry = find_stats_entry(stats, name);
+	if (entry && entry->type == XE_STATS_TYPE_COUNTER && entry->enabled)
+		atomic64_inc(&entry->data.counter.value);
+}
+
+void xe_stats_decrement_counter(struct xe_stats *stats, const char *name)
+{
+	struct xe_stats_entry *entry;
+
+	if (!stats || !name)
+		return;
+
+	entry = find_stats_entry(stats, name);
+	if (entry && entry->type == XE_STATS_TYPE_COUNTER && entry->enabled)
+		atomic64_dec(&entry->data.counter.value);
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_stats.h b/drivers/gpu/drm/xe/xe_stats.h
new file mode 100644
index 000000000000..dba79ae28714
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_stats.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+#ifndef _XE_STATS_H_
+#define _XE_STATS_H_
+
+#include <linux/atomic.h>
+#include <linux/debugfs.h>
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <drm/drm_print.h>
+
+struct drm_device;
+
+enum xe_stats_type {
+	XE_STATS_TYPE_COUNTER,
+};
+
+#ifdef CONFIG_DRM_XE_STATS
+struct xe_stats_entry {
+	const char *name;
+	enum xe_stats_type type;
+	bool enabled;
+	union {
+		struct {
+			atomic64_t value;
+		} counter;
+	} data;
+	struct list_head list;
+	struct dentry *dentry;
+};
+
+struct xe_stats {
+	struct dentry *debugfs_entry;
+	struct list_head entries;
+	struct drm_device *drm;
+};
+
+struct xe_stats *xe_stats_init(struct drm_device *drm, struct dentry *parent);
+void xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type);
+void xe_stats_increment_counter(struct xe_stats *c, const char *name);
+void xe_stats_decrement_counter(struct xe_stats *stats, const char *name);
+
+#else /* CONFIG_DRM_XE_STATS not defined */
+struct xe_stats;
+
+static inline struct xe_stats *
+xe_stats_init(struct drm_device *drm, struct dentry *parent)
+{
+	return NULL;
+}
+
+static inline void
+xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type) { }
+static inline void
+xe_stats_increment_counter(struct xe_stats *stats, const char *name) { }
+static inline void
+xe_stats_decrement_counter(struct xe_stats *stats, const char *name) { }
+
+#endif /* CONFIG_DRM_XE_STATS */
+
+#endif /* _XE_STATS_H_ */
+
-- 
2.42.0

