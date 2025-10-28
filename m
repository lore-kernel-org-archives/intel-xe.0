Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FA5CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C969310E641;
	Tue, 28 Oct 2025 17:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJK8qheL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C0310E643
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674355; x=1793210355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=et6hYVN340eTqOPSkSbYivbtX6mixPovmz7VBjy1sY0=;
 b=FJK8qheLHKKBh24TQHkoiKiSrf1XxsR1fFeFHTsZA1H5wTvl5teGq55E
 6ZDST7dWIUZj2Fq7lE1qIcaMSMxKH94N21J2bCShz9PEHI0ueIl3n4w+P
 VgGc5epneCo5RqVoYAq6qS49BePJUO05uRnYg6AeBp/ha5pbAybuk6sZM
 gd9+RqWtTresl9gDaZx+jiUvw25a0wpEqXLRGuBxEW2BIzESMn5Oa3EWi
 WOg7zxM7M5nihEcw0DVS3TkI0IedK9YOvr43DlM23C5scFXnAoy2Fysqw
 NVvwBuDFNBfcV5YVkYoy/jtIFcCRqXgtxrvn8Iv0QkA0fkf7rcK2qvJF7 Q==;
X-CSE-ConnectionGUID: 2W6WbYCKRziEi2h5E4YwCw==
X-CSE-MsgGUID: dOwnizvMRLKP6PmzUbI0Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687868"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687868"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:15 -0700
X-CSE-ConnectionGUID: pgwQlSnCTD62Xim2wbaSjQ==
X-CSE-MsgGUID: VmwwfxKTQpOyD68CaFXT4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469471"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 16/17] drm/xe/pf: Allow to stop and reset VF using sysfs
Date: Tue, 28 Oct 2025 18:58:30 +0100
Message-ID: <20251028175832.184534-17-michal.wajdeczko@intel.com>
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

It is expected that VFs activity will be monitored and in some
cases admin might want to silence specific VF without killing
the VM where it was attached.

Add write-only attribute to stop GuC scheduling at VFs level.

  /sys/bus/pci/drivers/xe/BDF/
  ├── sriov_admin/
      ├── vf1/
      │   └── stop		[WO] bool
      ├── vf2/
      │   └── stop		[WO] bool

Writing "1" or "y" (or whatever is recognized by the strtobool()
function) to this file will trigger the change of the VF state
to STOP (GuC will stop servicing the VF). To go back to a READY
state (to allow GuC to service this VF again) the VF FLR must be
triggered (which can be done by writing 1 to device/reset file).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: drop reset file (Rodrigo, Lucas)
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 49 ++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index 360b0ffd9cb4..3a8c488d183c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -13,6 +13,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
+#include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_sysfs.h"
@@ -52,6 +53,7 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
  *     ├── vf1/
  *     │   ├── ...
  *     │   ├── device -> ../../../BDF.1
+ *     │   ├── stop
  *     │   └── profile
  *     │       ├── exec_quantum_ms
  *     │       ├── preempt_timeout_us
@@ -291,8 +293,55 @@ static const struct attribute_group profile_vf_attr_group = {
 	.is_visible = profile_vf_attr_is_visible,
 };
 
+#define DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(NAME)					\
+											\
+static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,	\
+					       const char *buf, size_t count)		\
+{											\
+	bool yes;									\
+	int err;									\
+											\
+	if (!vfid)									\
+		return -EPERM;								\
+											\
+	err = kstrtobool(buf, &yes);							\
+	if (err)									\
+		return err;								\
+	if (!yes)									\
+		return count;								\
+											\
+	err = xe_sriov_pf_control_##NAME##_vf(xe, vfid);				\
+	return err ?: count;								\
+}											\
+											\
+static XE_SRIOV_VF_ATTR_WO(NAME)
+
+DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(stop);
+
+static struct attribute *control_vf_attrs[] = {
+	&xe_sriov_vf_attr_stop.attr,
+	NULL
+};
+
+static umode_t control_vf_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int index)
+{
+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
+
+	if (vkobj->vfid == PFID)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group control_vf_attr_group = {
+	.attrs = control_vf_attrs,
+	.is_visible = control_vf_attr_is_visible,
+};
+
 static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
 	&profile_vf_attr_group,
+	&control_vf_attr_group,
 	NULL
 };
 
-- 
2.47.1

