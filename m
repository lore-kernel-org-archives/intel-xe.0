Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0A9E9A04C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 20:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D2510E627;
	Wed, 18 Feb 2026 20:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqZtYM2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C16710E627
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448188; x=1802984188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4vIIIf+0YQh/+UWdrzkyGW0t/TLCtGcpIkLbBNP7oic=;
 b=KqZtYM2ksgjGk7Ez0QSHKSba7YyKVuNL2Oa9abrzDeBr+QMJcJnSsEnU
 uZkTuvGYHHkJsZFRHYgr5WsOKEwQGeUKFq2IvCrtKRd1irWXpmTh2b9Ib
 1suQzMmcYYNojcLklgyXPkI3+96wBLx2+ecm97Eg18yubfovb9shgplBQ
 MI7RRBs5aezQVtj/yhhvPaDueihgPboOZVshBINm3wuPmQuFAAn5ENl0g
 7P42kZTNuB84uTh98Ln6c8KQw0bOjSXSn8ekDzAwf22Z1DhQsmF27+YrB
 b7aZ0hg8Fp00Vp1G4wbD22wgozUHks8nwJ//RNhzdUfbvI+8nQ2d97MQ0 g==;
X-CSE-ConnectionGUID: EdVWTQIMRlWJLKnfcyuESA==
X-CSE-MsgGUID: +5xwG88tTQOhhJTgfPabdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72710587"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72710587"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:28 -0800
X-CSE-ConnectionGUID: gboHyIF3SM+r0mWib5tDnA==
X-CSE-MsgGUID: Q4k2YY+QQEi4eWWsb6PXjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213548247"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.18.5])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:25 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 04/10] drm/xe/pf: Allow to change VFs VRAM quota using sysfs
Date: Wed, 18 Feb 2026 21:55:46 +0100
Message-ID: <20260218205553.3561-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218205553.3561-1-michal.wajdeczko@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
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

On current discrete platforms, PF will provision all VFs with a fair
amount of the VRAM (LMEM) during VFs enabling. However, in some cases
this automatic VRAM provisioning might be either non-reproducible or
sub-optimal. This could break VF's migration or impact performance.

Expose per-VF VRAM quota read-write sysfs attributes to allow admin
change default VRAM provisioning performed by the PF.

 /sys/bus/pci/drivers/xe/BDF/
 ├── sriov_admin/
     ├── .bulk_profile
     │   └── vram_quota                 [RW] unsigned integer
     ├── vf1/
     │   └── profile
     │       └── vram_quota             [RW] unsigned integer
     ├── vf2/
     │   └── profile
     │       └── vram_quota             [RW] unsigned integer

Above values represent total provisioned VRAM from all tiles where
VFs were assigned, and currently it's from all tiles always.

Note that changing VRAM provisioning is only possible when VF is
not running, otherwise GuC will complain. To make sure that given
VF is idle, triggering VF FLR might be needed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: allow VRAM change only if LMTT (Piotr)
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 31 ++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index 82a1055985ba..aa05c143a4d6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_assert.h"
+#include "xe_device.h"
 #include "xe_pci_sriov.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -44,7 +45,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
  *     ├── .bulk_profile
  *     │   ├── exec_quantum_ms
  *     │   ├── preempt_timeout_us
- *     │   └── sched_priority
+ *     │   ├── sched_priority
+ *     │   └── vram_quota
  *     ├── pf/
  *     │   ├── ...
  *     │   ├── device -> ../../../BDF
@@ -59,7 +61,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
  *     │   └── profile
  *     │       ├── exec_quantum_ms
  *     │       ├── preempt_timeout_us
- *     │       └── sched_priority
+ *     │       ├── sched_priority
+ *     │       └── vram_quota
  *     ├── vf2/
  *     :
  *     └── vfN/
@@ -132,6 +135,7 @@ static XE_SRIOV_DEV_ATTR_WO(NAME)
 
 DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
 DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
+DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(vram_quota, vram, u64);
 
 static const char * const sched_priority_names[] = {
 	[GUC_SCHED_PRIORITY_LOW] = "low",
@@ -181,12 +185,26 @@ static struct attribute *bulk_profile_dev_attrs[] = {
 	&xe_sriov_dev_attr_exec_quantum_ms.attr,
 	&xe_sriov_dev_attr_preempt_timeout_us.attr,
 	&xe_sriov_dev_attr_sched_priority.attr,
+	&xe_sriov_dev_attr_vram_quota.attr,
 	NULL
 };
 
+static umode_t profile_dev_attr_is_visible(struct kobject *kobj,
+					   struct attribute *attr, int index)
+{
+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
+
+	if (attr == &xe_sriov_dev_attr_vram_quota.attr &&
+	    !xe_device_has_lmtt(vkobj->xe))
+		return 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group bulk_profile_dev_attr_group = {
 	.name = ".bulk_profile",
 	.attrs = bulk_profile_dev_attrs,
+	.is_visible = profile_dev_attr_is_visible,
 };
 
 static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
@@ -228,6 +246,7 @@ static XE_SRIOV_VF_ATTR(NAME)
 
 DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
 DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
+DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(vram_quota, vram, u64, "%llu\n");
 
 static ssize_t xe_sriov_vf_attr_sched_priority_show(struct xe_device *xe, unsigned int vfid,
 						    char *buf)
@@ -274,6 +293,7 @@ static struct attribute *profile_vf_attrs[] = {
 	&xe_sriov_vf_attr_exec_quantum_ms.attr,
 	&xe_sriov_vf_attr_preempt_timeout_us.attr,
 	&xe_sriov_vf_attr_sched_priority.attr,
+	&xe_sriov_vf_attr_vram_quota.attr,
 	NULL
 };
 
@@ -286,6 +306,13 @@ static umode_t profile_vf_attr_is_visible(struct kobject *kobj,
 	    !sched_priority_change_allowed(vkobj->vfid))
 		return attr->mode & 0444;
 
+	if (attr == &xe_sriov_vf_attr_vram_quota.attr) {
+		if (!IS_DGFX(vkobj->xe) || vkobj->vfid == PFID)
+			return 0;
+		if (!xe_device_has_lmtt(vkobj->xe))
+			return attr->mode & 0444;
+	}
+
 	return attr->mode;
 }
 
-- 
2.47.1

