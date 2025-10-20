Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5486FCCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145E410E4B0;
	Mon, 20 Oct 2025 18:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLxog5pG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1206210E4AF
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984676; x=1792520676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qWok5kdQQHmr8xGeeDZDe1WzMNe8Fak5jgm/aZj/Sd4=;
 b=MLxog5pGHfMEhZ3csawHlcU9l1tEX24IFtiTDQQ8FazUZ03DUQHOwqZI
 YjX2cuenEbpLCXrvXm4H3sUYDTuviM74MzlWsEND2q2tO/IlbJwc+nIRH
 w0pZ2rdSA8KnG98QoWG1honTjWKNorilEh1HCseMUea8xpuFxjc8s3b+H
 PeF4cfXOdYwAwuH/gxr+OVEw8zdxNbwSfMY3lJ0tfqeO8I5ZQIAGFkbNZ
 YrDweBHjsUc4CUe07xx9b7RpcImQS/5DsyeVM7Pd1O6tx2wKq+gsnTEh8
 mpiI6qm8gnx/JQ2bAr/TzY01WZ5nXgku3we+7wkn21M+9B9MA6BBSq0cI w==;
X-CSE-ConnectionGUID: QSrmipsMToi/Hv7V3EUQVQ==
X-CSE-MsgGUID: Nx7DPClKTZuC8PhtLp36Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013059"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:36 -0700
X-CSE-ConnectionGUID: jS22GER5QcCwaPMV2ZDSrg==
X-CSE-MsgGUID: 77hHqLk2Qry52WtXQyKHoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802099"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 03/14] drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
Date: Mon, 20 Oct 2025 20:24:03 +0200
Message-ID: <20251020182414.576-4-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 116 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   8 ++
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c     |  54 +++++++++-
 3 files changed, 176 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 663fb0c045e9..f2e14103c9aa 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -152,3 +152,119 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
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
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_set_exec_quantum(gt, vfid, eq);
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
+	for_each_gt(gt, xe, id) {
+		value = xe_gt_sriov_pf_config_get_exec_quantum(gt, vfid);
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
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_set_preempt_timeout(gt, vfid, pt);
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
+	for_each_gt(gt, xe, id) {
+		value = xe_gt_sriov_pf_config_get_preempt_timeout(gt, vfid);
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
index 15072779be7d..d5ad7aa7a899 100644
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

