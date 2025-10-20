Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295C2CCD1A7
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88FB10E4AE;
	Mon, 20 Oct 2025 18:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msja0paS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C01610E4AD
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984672; x=1792520672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Ag3wAmbkjocl6B88J3cwcGoytXpz3kyccqo4F6DkGU=;
 b=msja0paSpUxumU+M87ungtN5J0wW7yzIupGsMi3Ry72ibcR7erb51Fkq
 JOIbhmrj90tJ5Hul6Umr1JrDrEn8ogo0SUybaortdfAxqxnxjetY/3bl8
 w883HDGR0yOQ/qLDryRplRvZ/0qXi4xcEBDJp/2YCe2x85Va3OuYr/Um6
 3xvvO0sWs93yIvDaDuihtDF+Q2oA4IBxk9iwbE73WvY8bXJfc7feQvpNa
 qkH+r2yEODeeM2ulIvVSJb2kEs4Un1CNNDiaiGcaBlTvi1uBV2iZl9nb7
 AnAhmQ0i1PmBVJ2ID4o+9pDj4d8mzD2O5q1MNsH/++AiklCbIZVOGg64T Q==;
X-CSE-ConnectionGUID: EEPZm6lOT967JTv5OKakFA==
X-CSE-MsgGUID: u3+yXJnzQSaCbfbl3WL3dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013053"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013053"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:32 -0700
X-CSE-ConnectionGUID: ptUaPAymRZCzUlkmX+p8xA==
X-CSE-MsgGUID: lOkg9rDeTpulTnp3deTkSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802074"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 01/14] drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
Date: Mon, 20 Oct 2025 20:24:01 +0200
Message-ID: <20251020182414.576-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020182414.576-1-michal.wajdeczko@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
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

We already have some SR-IOV specific knobs exposed as debugfs
files to allow low level tuning of the SR-IOV configurations,
but those files are mainly for the use by the developers and
debugfs might not be available on the production builds.

Start building dedicated sysfs sub-tree under xe device, where
in upcoming patches we will add selected attributes that will
help provision and manage PF and all VFs:

  /sys/bus/pci/drivers/xe/BDF/
  ├── sriov_admin/
      ├── pf/
      ├── vf1/
      ├── vf2/
      :
      └── vfN/

Add all required data types and helper macros that will be used
by upcoming patches to define actual attributes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c       |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 295 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h |  13 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h |  11 +
 5 files changed, 325 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 82c6b3d29676..e84811783115 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -178,6 +178,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf_debugfs.o \
 	xe_sriov_pf_provision.o \
 	xe_sriov_pf_service.o \
+	xe_sriov_pf_sysfs.o \
 	xe_tile_sriov_pf_debugfs.o
 
 # include helpers for tests even when XE is built-in
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index bc1ab9ee31d9..b8af93eb5b5f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -16,6 +16,7 @@
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_service.h"
+#include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
 
 static unsigned int wanted_max_vfs(struct xe_device *xe)
@@ -128,6 +129,10 @@ int xe_sriov_pf_init_late(struct xe_device *xe)
 			return err;
 	}
 
+	err = xe_sriov_pf_sysfs_init(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
new file mode 100644
index 000000000000..91962155f80b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <drm/drm_managed.h>
+
+#include "xe_assert.h"
+#include "xe_sriov.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_sysfs.h"
+#include "xe_sriov_printk.h"
+
+/*
+ * /sys/bus/pci/drivers/xe/BDF/
+ * :
+ * ├── sriov_admin/
+ *     ├── ...
+ *     ├── pf/
+ *     │   ├── ...
+ *     │   └── ...
+ *     ├── vf1/
+ *     │   ├── ...
+ *     │   └── ...
+ *     ├── vf2/
+ *     :
+ *     └── vfN/
+ */
+
+struct xe_sriov_kobj {
+	struct kobject base;
+	struct xe_device *xe;
+	unsigned int vfid;
+};
+#define to_xe_sriov_kobj(p) container_of_const((p), struct xe_sriov_kobj, base)
+
+struct xe_sriov_dev_attr {
+	struct attribute attr;
+	ssize_t (*show)(struct xe_device *xe, char *buf);
+	ssize_t (*store)(struct xe_device *xe, const char *buf, size_t count);
+};
+#define to_xe_sriov_dev_attr(p) container_of_const((p), struct xe_sriov_dev_attr, attr)
+
+#define XE_SRIOV_DEV_ATTR(NAME) \
+struct xe_sriov_dev_attr xe_sriov_dev_attr_##NAME = \
+	__ATTR(NAME, 0644, xe_sriov_dev_attr_##NAME##_show, xe_sriov_dev_attr_##NAME##_store)
+
+#define XE_SRIOV_DEV_ATTR_RO(NAME) \
+struct xe_sriov_dev_attr xe_sriov_dev_attr_##NAME = \
+	__ATTR(NAME, 0444, xe_sriov_dev_attr_##NAME##_show, NULL)
+
+#define XE_SRIOV_DEV_ATTR_WO(NAME) \
+struct xe_sriov_dev_attr xe_sriov_dev_attr_##NAME = \
+	__ATTR(NAME, 0200, NULL, xe_sriov_dev_attr_##NAME##_store)
+
+struct xe_sriov_vf_attr {
+	struct attribute attr;
+	ssize_t (*show)(struct xe_device *xe, unsigned int vfid, char *buf);
+	ssize_t (*store)(struct xe_device *xe, unsigned int vfid, const char *buf, size_t count);
+};
+#define to_xe_sriov_vf_attr(p) container_of_const((p), struct xe_sriov_vf_attr, attr)
+
+#define XE_SRIOV_VF_ATTR(NAME) \
+struct xe_sriov_vf_attr xe_sriov_vf_attr_##NAME = \
+	__ATTR(NAME, 0644, xe_sriov_vf_attr_##NAME##_show, xe_sriov_vf_attr_##NAME##_store)
+
+#define XE_SRIOV_VF_ATTR_RO(NAME) \
+struct xe_sriov_vf_attr xe_sriov_vf_attr_##NAME = \
+	__ATTR(NAME, 0444, xe_sriov_vf_attr_##NAME##_show, NULL)
+
+#define XE_SRIOV_VF_ATTR_WO(NAME) \
+struct xe_sriov_vf_attr xe_sriov_vf_attr_##NAME = \
+	__ATTR(NAME, 0200, NULL, xe_sriov_vf_attr_##NAME##_store)
+
+/* device level attributes go here */
+
+static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
+	NULL
+};
+
+/* and VF-level attributes go here */
+
+static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
+	NULL
+};
+
+/* no user serviceable parts below */
+
+static struct kobject *new_xe_sriov_kobj(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_kobj *vkobj;
+
+	xe_sriov_pf_assert_vfid(xe, vfid);
+
+	vkobj = kzalloc(sizeof(*vkobj), GFP_KERNEL);
+	if (!vkobj)
+		return NULL;
+
+	vkobj->xe = xe;
+	vkobj->vfid = vfid;
+	return &vkobj->base;
+}
+
+static void release_xe_sriov_kobj(struct kobject *kobj)
+{
+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
+
+	kfree(vkobj);
+}
+
+static ssize_t xe_sriov_dev_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
+{
+	struct xe_sriov_dev_attr *vattr  = to_xe_sriov_dev_attr(attr);
+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
+	struct xe_device *xe = vkobj->xe;
+
+	if (!vattr->show) {
+		xe_sriov_dbg(xe, "attribute '%s' was not intended to be %s\n",
+			     attr->name, "readable");
+		return -EPERM;
+	}
+	return vattr->show(xe, buf);
+}
+
+static ssize_t xe_sriov_dev_attr_store(struct kobject *kobj, struct attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct xe_sriov_dev_attr *vattr = to_xe_sriov_dev_attr(attr);
+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
+	struct xe_device *xe = vkobj->xe;
+
+	if (!vattr->store) {
+		xe_sriov_dbg(xe, "attribute '%s' was not intended to be %s\n",
+			     attr->name, "writable");
+		return -EPERM;
+	}
+	return vattr->store(xe, buf, count);
+}
+
+static ssize_t xe_sriov_vf_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
+{
+	struct xe_sriov_vf_attr *vattr = to_xe_sriov_vf_attr(attr);
+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
+	struct xe_device *xe = vkobj->xe;
+	unsigned int vfid = vkobj->vfid;
+
+	xe_sriov_pf_assert_vfid(xe, vfid);
+
+	if (!vattr->show) {
+		xe_sriov_dbg(xe, "attribute '%s' was not intended to be %s\n",
+			     attr->name, "readable");
+		return -EPERM;
+	}
+	return vattr->show(xe, vfid, buf);
+}
+
+static ssize_t xe_sriov_vf_attr_store(struct kobject *kobj, struct attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct xe_sriov_vf_attr *vattr = to_xe_sriov_vf_attr(attr);
+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
+	struct xe_device *xe = vkobj->xe;
+	unsigned int vfid = vkobj->vfid;
+
+	xe_sriov_pf_assert_vfid(xe, vfid);
+
+	if (!vattr->store) {
+		xe_sriov_dbg(xe, "attribute '%s' was not intended to be %s\n",
+			     attr->name, "writable");
+		return -EPERM;
+	}
+	return vattr->store(xe, vfid, buf, count);
+}
+
+static const struct sysfs_ops xe_sriov_dev_sysfs_ops = {
+	.show = xe_sriov_dev_attr_show,
+	.store = xe_sriov_dev_attr_store,
+};
+
+static const struct sysfs_ops xe_sriov_vf_sysfs_ops = {
+	.show = xe_sriov_vf_attr_show,
+	.store = xe_sriov_vf_attr_store,
+};
+
+static const struct kobj_type xe_sriov_dev_ktype = {
+	.release = release_xe_sriov_kobj,
+	.sysfs_ops = &xe_sriov_dev_sysfs_ops,
+	.default_groups = xe_sriov_dev_attr_groups,
+};
+
+static const struct kobj_type xe_sriov_vf_ktype = {
+	.release = release_xe_sriov_kobj,
+	.sysfs_ops = &xe_sriov_vf_sysfs_ops,
+	.default_groups = xe_sriov_vf_attr_groups,
+};
+
+static int pf_sysfs_error(struct xe_device *xe, int err, const char *what)
+{
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
+		xe_sriov_dbg(xe, "Failed to setup sysfs %s (%pe)\n", what, ERR_PTR(err));
+	return err;
+}
+
+static void action_put_kobject(void *arg)
+{
+	struct kobject *kobj = arg;
+
+	kobject_put(kobj);
+}
+
+static int pf_setup_root(struct xe_device *xe)
+{
+	struct kobject *parent = &xe->drm.dev->kobj;
+	struct kobject *root;
+	int err;
+
+	root = new_xe_sriov_kobj(xe, PFID);
+	if (!root)
+		return pf_sysfs_error(xe, -ENOMEM, "root obj");
+
+	err = devm_add_action_or_reset(xe->drm.dev, action_put_kobject, root);
+	if (err)
+		return pf_sysfs_error(xe, err, "root action");
+
+	err = kobject_init_and_add(root, &xe_sriov_dev_ktype, parent, "sriov_admin");
+	if (err)
+		return pf_sysfs_error(xe, err, "root init");
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, !xe->sriov.pf.sysfs.root);
+	xe->sriov.pf.sysfs.root = root;
+	return 0;
+}
+
+static int pf_setup_tree(struct xe_device *xe)
+{
+	unsigned int totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	struct kobject *root, *kobj;
+	unsigned int n;
+	int err;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	root = xe->sriov.pf.sysfs.root;
+
+	for (n = 0; n <= totalvfs; n++) {
+		kobj = new_xe_sriov_kobj(xe, VFID(n));
+		if (!kobj)
+			return pf_sysfs_error(xe, -ENOMEM, "tree obj");
+
+		err = devm_add_action_or_reset(xe->drm.dev, action_put_kobject, root);
+		if (err)
+			return pf_sysfs_error(xe, err, "tree action");
+
+		if (n)
+			err = kobject_init_and_add(kobj, &xe_sriov_vf_ktype,
+						   root, "vf%u", n);
+		else
+			err = kobject_init_and_add(kobj, &xe_sriov_vf_ktype,
+						   root, "pf");
+		if (err)
+			return pf_sysfs_error(xe, err, "tree init");
+
+		xe_assert(xe, !xe->sriov.pf.vfs[n].kobj);
+		xe->sriov.pf.vfs[n].kobj = kobj;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_sysfs_init() - Setup PF's SR-IOV sysfs tree.
+ * @xe: the PF &xe_device to setup sysfs
+ *
+ * This function will create additional nodes that will represent PF and VFs
+ * devices, each populated with SR-IOV Xe specific attributes.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_sysfs_init(struct xe_device *xe)
+{
+	int err;
+
+	err = pf_setup_root(xe);
+	if (err)
+		return err;
+
+	err = pf_setup_tree(xe);
+	if (err)
+		return err;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
new file mode 100644
index 000000000000..1e6698cc29d3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_SYSFS_H_
+#define _XE_SRIOV_PF_SYSFS_H_
+
+struct xe_device;
+
+int xe_sriov_pf_sysfs_init(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index c753cd59aed2..b3cd9797194b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -12,10 +12,15 @@
 #include "xe_sriov_pf_provision_types.h"
 #include "xe_sriov_pf_service_types.h"
 
+struct kobject;
+
 /**
  * struct xe_sriov_metadata - per-VF device level metadata
  */
 struct xe_sriov_metadata {
+	/** @kobj: kobject representing VF in PF's SR-IOV sysfs tree. */
+	struct kobject *kobj;
+
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_sriov_pf_service_version version;
 };
@@ -42,6 +47,12 @@ struct xe_device_pf {
 	/** @service: device level service data. */
 	struct xe_sriov_pf_service service;
 
+	/** @sysfs: device level sysfs data. */
+	struct {
+		/** @sysfs.root: the root kobject for all SR-IOV entries in sysfs. */
+		struct kobject *root;
+	} sysfs;
+
 	/** @vfs: metadata for all VFs. */
 	struct xe_sriov_metadata *vfs;
 };
-- 
2.47.1

