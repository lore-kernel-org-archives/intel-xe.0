Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EBFCCF9F2
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5A610E645;
	Tue, 28 Oct 2025 17:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxbWCL9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6821710E643
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674337; x=1793210337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qyaDZIC08cYWSqQJcPmt1/ovVAToaoFNU8Jdcdxqrog=;
 b=DxbWCL9th8+VeMx6jP13YplTIWSXUiXWegYeEm7kP/LJLH6ATiAe2odx
 ot/0PqfDXlWpogBdYIRilNHZsHOlne4k1+Ee1pSsUmr5gE8gP5qCDsXTl
 SQhz/SkizrFnR8w3me4W0dCT3GBiQFDtkRE+KBNt3yZXfulyOmEYQyRtH
 dYut6c9OKDzoz7+n6cfzoYjJ48JN2qTVVKMhBHUtGY3Szx3eKoYarPhLi
 rM6Fb7OE4BTMCWmaQllNvCkxggXXkI4FRrZBRvh6WgCypibaqAV65R1vJ
 KmXHcIdrd4HFgPb+osKRmHCIZkThVG3jlfddScl8eZ9J6umdesKjETZC0 g==;
X-CSE-ConnectionGUID: Way8mWYdTsuk3ELusA8gHQ==
X-CSE-MsgGUID: KM6tpvIFTJ2nLHgnIcP3kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687834"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:58:57 -0700
X-CSE-ConnectionGUID: 7lhO4FDhQSiZ649nd1PWOQ==
X-CSE-MsgGUID: hcEBe7q6SXqeXmuhCVKrBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469357"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:58:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 05/17] drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
Date: Tue, 28 Oct 2025 18:58:19 +0100
Message-ID: <20251028175832.184534-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175832.184534-1-michal.wajdeczko@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
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

On current platforms, in SR-IOV virtualization, the GPU is shared
between VFs on the time-slice basis. The 'execution quantum' (EQ)
and 'preemption timeout' (PT) are two main scheduling parameters
that could be set individually per each VF.

Add EQ/PT read-write attributes for the PF and all VFs.

By exposing those two parameters over sysfs, the admin can change
their default values (infinity) and let the GuC scheduler enforce
that settings.

 /sys/bus/pci/drivers/xe/BDF/
 ├── sriov_admin/
     ├── pf/
     │   └── profile
     │       ├── exec_quantum_ms	[RW] unsigned integer
     │       └── preempt_timeout_us	[RW] unsigned integer
     ├── vf1/
     │   └── profile
     │       ├── exec_quantum_ms	[RW] unsigned integer
     │       └── preempt_timeout_us	[RW] unsigned integer

Writing 0 to these files will set infinity EQ/PT for the VF on all
tiles/GTs. This is a default value. Writing non-zero integers to
these files will change EQ/PT to new value (in their respective
units: msec or usec).

Reading from these files will return EQ/PT as previously set on
all tiles/GTs. In case of inconsistent values detected, due to
errors or low-level configuration done using debugfs, -EUCLEAN
error will be returned.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: apply EQ/PT under single lock (Lucas)
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 124 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   8 ++
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c     |  54 ++++++++-
 3 files changed, 184 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 663fb0c045e9..c5b3a6aa67f4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -152,3 +152,127 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
 	xe->sriov.pf.provision.mode = mode;
 	return 0;
 }
+
+/**
+ * xe_sriov_pf_provision_apply_vf_eq() - Change VF's execution quantum.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier
+ * @eq: execution quantum in [ms] to set
+ *
+ * Change VF's execution quantum (EQ) provisioning on all tiles/GTs.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_apply_vf_eq(struct xe_device *xe, unsigned int vfid, u32 eq)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_set_exec_quantum_locked(gt, vfid, eq);
+		result = result ?: err;
+	}
+
+	return result;
+}
+
+/**
+ * xe_sriov_pf_provision_query_vf_eq() - Query VF's execution quantum.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier
+ * @eq: placeholder for the returned execution quantum in [ms]
+ *
+ * Query VF's execution quantum (EQ) provisioning from all tiles/GTs.
+ * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_query_vf_eq(struct xe_device *xe, unsigned int vfid, u32 *eq)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int count = 0;
+	u32 value;
+
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	for_each_gt(gt, xe, id) {
+		value = xe_gt_sriov_pf_config_get_exec_quantum_locked(gt, vfid);
+		if (!count++)
+			*eq = value;
+		else if (value != *eq)
+			return -EUCLEAN;
+	}
+
+	return !count ? -ENODATA : 0;
+}
+
+/**
+ * xe_sriov_pf_provision_apply_vf_pt() - Change VF's preemption timeout.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier
+ * @pt: preemption timeout in [us] to set
+ *
+ * Change VF's preemption timeout (PT) provisioning on all tiles/GTs.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_apply_vf_pt(struct xe_device *xe, unsigned int vfid, u32 pt)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_set_preempt_timeout_locked(gt, vfid, pt);
+		result = result ?: err;
+	}
+
+	return result;
+}
+
+/**
+ * xe_sriov_pf_provision_query_vf_pt() - Query VF's preemption timeout.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier
+ * @pt: placeholder for the returned preemption timeout in [us]
+ *
+ * Query VF's preemption timeout (PT) provisioning from all tiles/GTs.
+ * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u32 *pt)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int count = 0;
+	u32 value;
+
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	for_each_gt(gt, xe, id) {
+		value = xe_gt_sriov_pf_config_get_preempt_timeout_locked(gt, vfid);
+		if (!count++)
+			*pt = value;
+		else if (value != *pt)
+			return -EUCLEAN;
+	}
+
+	return !count ? -ENODATA : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
index cf3657a32e90..cb81b5880930 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
@@ -6,10 +6,18 @@
 #ifndef _XE_SRIOV_PF_PROVISION_H_
 #define _XE_SRIOV_PF_PROVISION_H_
 
+#include <linux/types.h>
+
 #include "xe_sriov_pf_provision_types.h"
 
 struct xe_device;
 
+int xe_sriov_pf_provision_apply_vf_eq(struct xe_device *xe, unsigned int vfid, u32 eq);
+int xe_sriov_pf_provision_query_vf_eq(struct xe_device *xe, unsigned int vfid, u32 *eq);
+
+int xe_sriov_pf_provision_apply_vf_pt(struct xe_device *xe, unsigned int vfid, u32 pt);
+int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u32 *pt);
+
 int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
 int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index 439a0cd02a86..f12d6752e9f1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -13,6 +13,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
 
@@ -23,10 +24,14 @@
  *     ├── ...
  *     ├── pf/
  *     │   ├── ...
- *     │   └── ...
+ *     │   └── profile
+ *     │       ├── exec_quantum_ms
+ *     │       └── preempt_timeout_us
  *     ├── vf1/
  *     │   ├── ...
- *     │   └── ...
+ *     │   └── profile
+ *     │       ├── exec_quantum_ms
+ *     │       └── preempt_timeout_us
  *     ├── vf2/
  *     :
  *     └── vfN/
@@ -85,7 +90,52 @@ static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
 
 /* and VF-level attributes go here */
 
+#define DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(NAME, ITEM, TYPE, FORMAT)		\
+static ssize_t xe_sriov_vf_attr_##NAME##_show(struct xe_device *xe, unsigned int vfid,	\
+					      char *buf)				\
+{											\
+	TYPE value = 0;									\
+	int err;									\
+											\
+	err = xe_sriov_pf_provision_query_vf_##ITEM(xe, vfid, &value);			\
+	if (err)									\
+		return err;								\
+											\
+	return sysfs_emit(buf, FORMAT, value);						\
+}											\
+											\
+static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,	\
+					       const char *buf, size_t count)		\
+{											\
+	TYPE value;									\
+	int err;									\
+											\
+	err = kstrto##TYPE(buf, 0, &value);						\
+	if (err)									\
+		return err;								\
+											\
+	err = xe_sriov_pf_provision_apply_vf_##ITEM(xe, vfid, value);			\
+	return err ?: count;								\
+}											\
+											\
+static XE_SRIOV_VF_ATTR(NAME)
+
+DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
+DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
+
+static struct attribute *profile_vf_attrs[] = {
+	&xe_sriov_vf_attr_exec_quantum_ms.attr,
+	&xe_sriov_vf_attr_preempt_timeout_us.attr,
+	NULL
+};
+
+static const struct attribute_group profile_vf_attr_group = {
+	.name = "profile",
+	.attrs = profile_vf_attrs,
+};
+
 static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
+	&profile_vf_attr_group,
 	NULL
 };
 
-- 
2.47.1

