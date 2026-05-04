Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5204FCD3427
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D712510E183;
	Mon,  4 May 2026 04:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XW9cwyYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B74010E183
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869832; x=1809405832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W7uiP2Os5KEr85Wkbg65b5DXWQ2q716nnXthngvnm/Q=;
 b=XW9cwyYdr4bIBbiuRyW9NkbAtuv6CG+FsL+6pMdjF4RtWw/RYUXYLrpO
 k8Lf89PpS+UhWiuFrDjZnjLHjhHo+epnIm3i7q+SDbtg6ob8FUHwOEzHx
 ZHxlvVMCyDp6hABqFPLtFAtRV+3BOdju44a/9AjDp8i5+9b51N4EKGyCQ
 IT0RGiK0tWPA5aNFcAyTxFGrvTtn1nIqlM+2wI+Sm51zXYrO8AlxafElZ
 wG6Kb1Y6OGupq6HNgGyQPWCK8wOVc7eD5EBbFfxIgJGF73Obkx1NrOa8L
 79xkxke2Mng36gJTYRceLXM4tKNftgnKpzFrRO3AfvI+kJUz8f6Ls5pSy Q==;
X-CSE-ConnectionGUID: gLb1iQ1JSqagKcErJmm6Eg==
X-CSE-MsgGUID: +ZLnjfxVQwmwAmxTXVYbOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96293555"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96293555"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:51 -0700
X-CSE-ConnectionGUID: xY9Kb7InQmes1WMYqrMuPw==
X-CSE-MsgGUID: +oCtEmVJQVucBEMWRR0PiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="232773668"
Received: from dut4435arlh.fm.intel.com ([10.105.8.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:50 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 3/9] drm/xe: Split out configfs data structures
Date: Mon,  4 May 2026 04:43:40 +0000
Message-ID: <20260504044348.209625-4-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504044348.209625-1-stuart.summers@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
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

Split the configfs data structures into their own _types.h file.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-4.7
---
 drivers/gpu/drm/xe/xe_configfs.c       | 85 +++++++-------------------
 drivers/gpu/drm/xe/xe_configfs_types.h | 59 ++++++++++++++++++
 2 files changed, 80 insertions(+), 64 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 1e134057fae8..12b7fe65446d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/ctype.h>
 #include <linux/configfs.h>
 #include <linux/cleanup.h>
 #include <linux/find.h>
@@ -15,12 +14,10 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
+#include "xe_configfs_types.h"
 #include "xe_defaults.h"
 #include "xe_gt_types.h"
-#include "xe_hw_engine_types.h"
 #include "xe_module.h"
-#include "xe_pci_types.h"
-#include "xe_sriov_types.h"
 
 /**
  * DOC: Xe Configfs
@@ -245,36 +242,6 @@
  *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
  */
 
-/* Similar to struct xe_bb, but not tied to HW (yet) */
-struct wa_bb {
-	u32 *cs;
-	u32 len; /* in dwords */
-};
-
-struct xe_config_group_device {
-	struct config_group group;
-	struct config_group sriov;
-
-	struct xe_config_device {
-		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
-		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
-		bool enable_psmi;
-		bool enable_survivability_mode;
-		u64 engines_allowed;
-		u64 gt_types_allowed;
-		struct {
-			bool admin_only_pf;
-			unsigned int max_vfs;
-		} sriov;
-	} config;
-
-	/* protects attributes */
-	struct mutex lock;
-	/* matching descriptor */
-	const struct xe_device_desc *desc;
-	/* tentative SR-IOV mode */
-	enum xe_sriov_mode mode;
-};
 
 static const struct xe_config_device device_defaults = {
 	.enable_psmi = false,
@@ -322,16 +289,6 @@ static const struct {
 	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
 };
 
-static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
-{
-	return container_of(to_config_group(item), struct xe_config_group_device, group);
-}
-
-static struct xe_config_device *to_xe_config_device(struct config_item *item)
-{
-	return &to_xe_config_group_device(item)->config;
-}
-
 static bool is_bound(struct xe_config_group_device *dev)
 {
 	unsigned int domain, bus, slot, function;
@@ -359,7 +316,7 @@ static bool is_bound(struct xe_config_group_device *dev)
 
 static ssize_t enable_survivability_mode_show(struct config_item *item, char *page)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
+	struct xe_config_device *dev = xe_configfs_to_device(item);
 
 	return sprintf(page, "%d\n", dev->enable_survivability_mode);
 }
@@ -367,7 +324,7 @@ static ssize_t enable_survivability_mode_show(struct config_item *item, char *pa
 static ssize_t enable_survivability_mode_store(struct config_item *item, const char *page,
 					       size_t len)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 	bool enable_survivability_mode;
 	int ret;
 
@@ -386,7 +343,7 @@ static ssize_t enable_survivability_mode_store(struct config_item *item, const c
 
 static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
+	struct xe_config_device *dev = xe_configfs_to_device(item);
 	char *p = page;
 
 	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
@@ -399,7 +356,7 @@ static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
 static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
 				      size_t len)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
 	char *p = buf;
 	u64 typemask = 0;
@@ -437,7 +394,7 @@ static ssize_t gt_types_allowed_store(struct config_item *item, const char *page
 
 static ssize_t engines_allowed_show(struct config_item *item, char *page)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
+	struct xe_config_device *dev = xe_configfs_to_device(item);
 	char *p = page;
 
 	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
@@ -529,7 +486,7 @@ static int parse_engine(const char *s, const char *end_chars, u64 *mask,
 static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 				     size_t len)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 	ssize_t patternlen, p;
 	u64 mask, val = 0;
 
@@ -552,14 +509,14 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 
 static ssize_t enable_psmi_show(struct config_item *item, char *page)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
+	struct xe_config_device *dev = xe_configfs_to_device(item);
 
 	return sprintf(page, "%d\n", dev->enable_psmi);
 }
 
 static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 	bool val;
 	int ret;
 
@@ -634,14 +591,14 @@ static ssize_t wa_bb_show(struct xe_config_group_device *dev,
 
 static ssize_t ctx_restore_mid_bb_show(struct config_item *item, char *page)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 
 	return wa_bb_show(dev, dev->config.ctx_restore_mid_bb, page, SZ_4K);
 }
 
 static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 
 	return wa_bb_show(dev, dev->config.ctx_restore_post_bb, page, SZ_4K);
 }
@@ -798,7 +755,7 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
 static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
 					const char *data, size_t sz)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 
 	return wa_bb_store(dev->config.ctx_restore_mid_bb, dev, data, sz);
 }
@@ -806,7 +763,7 @@ static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
 static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 					 const char *data, size_t sz)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 
 	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
 }
@@ -830,7 +787,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 
 static void xe_config_device_release(struct config_item *item)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 
 	mutex_destroy(&dev->lock);
 
@@ -846,7 +803,7 @@ static struct configfs_item_operations xe_config_device_ops = {
 static bool xe_config_device_is_visible(struct config_item *item,
 					struct configfs_attribute *attr, int n)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 
 	if (attr == &attr_enable_survivability_mode) {
 		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
@@ -869,7 +826,7 @@ static const struct config_item_type xe_config_device_type = {
 
 static ssize_t sriov_max_vfs_show(struct config_item *item, char *page)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item->ci_parent);
 
 	guard(mutex)(&dev->lock);
 
@@ -881,7 +838,7 @@ static ssize_t sriov_max_vfs_show(struct config_item *item, char *page)
 
 static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, size_t len)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item->ci_parent);
 	unsigned int max_vfs;
 	int ret;
 
@@ -903,7 +860,7 @@ static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, s
 
 static ssize_t sriov_admin_only_pf_show(struct config_item *item, char *page)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item->ci_parent);
 
 	guard(mutex)(&dev->lock);
 
@@ -912,7 +869,7 @@ static ssize_t sriov_admin_only_pf_show(struct config_item *item, char *page)
 
 static ssize_t sriov_admin_only_pf_store(struct config_item *item, const char *page, size_t len)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item->ci_parent);
 	bool admin_only_pf;
 	int ret;
 
@@ -941,7 +898,7 @@ static struct configfs_attribute *xe_config_sriov_attrs[] = {
 static bool xe_config_sriov_is_visible(struct config_item *item,
 				       struct configfs_attribute *attr, int n)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item->ci_parent);
 
 	if (attr == &sriov_attr_max_vfs && dev->mode != XE_SRIOV_MODE_PF)
 		return false;
@@ -1084,7 +1041,7 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
 	if (!item)
 		return NULL;
 
-	return to_xe_config_group_device(item);
+	return xe_configfs_to_group_device(item);
 }
 
 static void dump_custom_dev_config(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
new file mode 100644
index 000000000000..935097aafa96
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#ifndef _XE_CONFIGFS_TYPES_H_
+#define _XE_CONFIGFS_TYPES_H_
+
+#include <linux/configfs.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#include "xe_hw_engine_types.h"
+#include "xe_pci_types.h"
+#include "xe_sriov_types.h"
+
+struct config_item;
+
+/* Similar to struct xe_bb, but not tied to HW (yet) */
+struct wa_bb {
+	u32 *cs;
+	u32 len; /* in dwords */
+};
+
+struct xe_config_group_device {
+	struct config_group group;
+	struct config_group sriov;
+
+	struct xe_config_device {
+		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
+		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
+		bool enable_psmi;
+		bool enable_survivability_mode;
+		u64 engines_allowed;
+		u64 gt_types_allowed;
+		struct {
+			bool admin_only_pf;
+			unsigned int max_vfs;
+		} sriov;
+	} config;
+
+	/* protects attributes */
+	struct mutex lock;
+	/* matching descriptor */
+	const struct xe_device_desc *desc;
+	/* tentative SR-IOV mode */
+	enum xe_sriov_mode mode;
+};
+
+static inline struct xe_config_group_device *xe_configfs_to_group_device(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct xe_config_group_device, group);
+}
+
+static inline struct xe_config_device *xe_configfs_to_device(struct config_item *item)
+{
+	return &xe_configfs_to_group_device(item)->config;
+}
+
+#endif /* _XE_CONFIGFS_TYPES_H_ */
-- 
2.43.0

