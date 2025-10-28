Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394EDCCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FD510E642;
	Tue, 28 Oct 2025 17:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHxXfWP6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675BD10E648
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674350; x=1793210350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zp2i6XO7uP8lyFRCOcRMT/BYTyIydlaazSL6pk/6akU=;
 b=HHxXfWP6g/kPk+Xvsj8e7kfjOuo8FNKgvbusIQCSfZVQmBC/3vdoLVQ8
 scwGB9zadGPjjryQ7ru0vwYPynZ/E6wuCq6SxRxAghWtASJ6W4AwdxMMC
 cz0hN80y0MVhwzMPvP8qezWSqhtA0jbbY/SOGrI+i3/yeUZ1tv0OaNd1X
 Y8iPlqMleioUiID6tG7jzRBSF0iyLPscOLAH4FUly1M8dFiFVtxnYHbip
 RVtH5C6SUD+pFzkdsfZG7L3nDXNVdgswlVCnZ/lQW5H2XWaDmrMgQypLy
 hj4aFHy6CI7jpaYijlNNRIMAwi+EGMEATOmK2Mxv1rxzJPOUk3xtj3oCx g==;
X-CSE-ConnectionGUID: wYFqDJnVSXOvObLRvl53Rw==
X-CSE-MsgGUID: YEcis1zqTK+L4wwsntnbRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687857"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687857"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:10 -0700
X-CSE-ConnectionGUID: 9JVBWKCsScuf668w5CuITw==
X-CSE-MsgGUID: KuIaODX9QymRV744hYYP9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469449"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 13/17] drm/xe/pf: Allow change PF scheduling priority using
 sysfs
Date: Tue, 28 Oct 2025 18:58:27 +0100
Message-ID: <20251028175832.184534-14-michal.wajdeczko@intel.com>
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

We have just added bulk change of the scheduling priority for all
VFs and PF, but that only allow to select LOW and NORMAL priority.

Add read-write attribute under PF to allow changing its priority
without impacting other VFs priority settings.

For completeness also add read-only attributes under VFs, to show
currently selected priority levels used by the VFs.

  /sys/bus/pci/drivers/xe/BDF/
  ├── sriov_admin/
      ├── pf/
      │   └── profile
      │       └── sched_priority	[RW] low, normal, high
      ├── vf1/
      │   └── profile
      │       └── sched_priority	[RO] low, normal

Writing "high" to the PF read-write attribute will change PF
priority on all tiles/GTs to HIGH (schedule function in the next
time-slice after current one completes and it has work). Writing
"low" or "normal" to change priority to LOW/NORMAL is supported.

When read, those files will display the current and available
scheduling priorities. The currently active priority level will
be enclosed in square brackets, default output will be like:

 $ grep . -h sriov_admin/{pf,vf1,vf2}/profile/sched_priority
 [low] normal high
 [low] normal
 [low] normal

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 82 +++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index 19724a28fb33..2e5dbf1bff76 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -17,6 +17,21 @@
 #include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
 
+static int emit_choice(char *buf, int choice, const char * const *array, size_t size)
+{
+	int pos = 0;
+	int n;
+
+	for (n = 0; n < size; n++) {
+		pos += sysfs_emit_at(buf, pos, "%s%s%s%s",
+				    n ? " " : "",
+				    n == choice ? "[" : "",
+				    array[n],
+				    n == choice ? "]" : "");
+	}
+	return pos + sysfs_emit_at(buf, pos, "\n");
+}
+
 /*
  * /sys/bus/pci/drivers/xe/BDF/
  * :
@@ -30,12 +45,14 @@
  *     │   ├── ...
  *     │   └── profile
  *     │       ├── exec_quantum_ms
- *     │       └── preempt_timeout_us
+ *     │       ├── preempt_timeout_us
+ *     │       └── sched_priority
  *     ├── vf1/
  *     │   ├── ...
  *     │   └── profile
  *     │       ├── exec_quantum_ms
- *     │       └── preempt_timeout_us
+ *     │       ├── preempt_timeout_us
+ *     │       └── sched_priority
  *     ├── vf2/
  *     :
  *     └── vfN/
@@ -115,6 +132,12 @@ static const char * const sched_priority_names[] = {
 	[GUC_SCHED_PRIORITY_HIGH] = "high",
 };
 
+static bool sched_priority_change_allowed(unsigned int vfid)
+{
+	/* As of today GuC FW allows to selectively change only the PF priority. */
+	return vfid == PFID;
+}
+
 static bool sched_priority_high_allowed(unsigned int vfid)
 {
 	/* As of today GuC FW allows to select 'high' priority only for the PF. */
@@ -199,15 +222,70 @@ static XE_SRIOV_VF_ATTR(NAME)
 DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
 DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
 
+static ssize_t xe_sriov_vf_attr_sched_priority_show(struct xe_device *xe, unsigned int vfid,
+						    char *buf)
+{
+	size_t num_priorities = ARRAY_SIZE(sched_priority_names);
+	u32 priority;
+	int err;
+
+	err = xe_sriov_pf_provision_query_vf_priority(xe, vfid, &priority);
+	if (err)
+		return err;
+
+	if (!sched_priority_high_allowed(vfid))
+		num_priorities--;
+
+	xe_assert(xe, priority < num_priorities);
+	return emit_choice(buf, priority, sched_priority_names, num_priorities);
+}
+
+static ssize_t xe_sriov_vf_attr_sched_priority_store(struct xe_device *xe, unsigned int vfid,
+						     const char *buf, size_t count)
+{
+	size_t num_priorities = ARRAY_SIZE(sched_priority_names);
+	int match;
+	int err;
+
+	if (!sched_priority_change_allowed(vfid))
+		return -EOPNOTSUPP;
+
+	if (!sched_priority_high_allowed(vfid))
+		num_priorities--;
+
+	match = __sysfs_match_string(sched_priority_names, num_priorities, buf);
+	if (match < 0)
+		return -EINVAL;
+
+	err = xe_sriov_pf_provision_apply_vf_priority(xe, vfid, match);
+	return err ?: count;
+}
+
+static XE_SRIOV_VF_ATTR(sched_priority);
+
 static struct attribute *profile_vf_attrs[] = {
 	&xe_sriov_vf_attr_exec_quantum_ms.attr,
 	&xe_sriov_vf_attr_preempt_timeout_us.attr,
+	&xe_sriov_vf_attr_sched_priority.attr,
 	NULL
 };
 
+static umode_t profile_vf_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int index)
+{
+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
+
+	if (attr == &xe_sriov_vf_attr_sched_priority.attr &&
+	    !sched_priority_change_allowed(vkobj->vfid))
+		return attr->mode & 0444;
+
+	return attr->mode;
+}
+
 static const struct attribute_group profile_vf_attr_group = {
 	.name = "profile",
 	.attrs = profile_vf_attrs,
+	.is_visible = profile_vf_attr_is_visible,
 };
 
 static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
-- 
2.47.1

