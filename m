Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77B2CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AFF10E649;
	Tue, 28 Oct 2025 17:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cO0bSi1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D300710E641
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674346; x=1793210346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FC/8mdKD/+J1ox+HDA2RsBsAwPIE6UysI5LNoyro2SA=;
 b=cO0bSi1elmOYcoBCMyOfBb3inYQaEJKqtaqyYEtqdRx7JbBmMbtNJGyA
 p/tWTZzewS55/0MuOxMwbVGuXHsLMGcQNSYJJnIZHkQUx5u9yrLd9cMOy
 R464GfgZppG1AHKsGFCvanMeoi/T3y2R2Z5IYZXYyqJRg+Je59+L9ilNH
 F9XGOxhJS5pyFZUmqyg6pBeelCvserpZP8MfdXRWpTblgZXSTNAo7Eb71
 pSiT6k1yDMF/kWTUh9qdk20oEpPjMt2KJr+CLR0AzxuV8YnjTSGySzgn6
 /OadADBla50LJnAKed+6I1aYenXGMPHQiZ8g8fxJvUcbIr3F2IjE2TCzf Q==;
X-CSE-ConnectionGUID: qWsp93fqTbGO7aiJwgTL4g==
X-CSE-MsgGUID: DyEpTYYHS7Gf1nsqioBzzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687848"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687848"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:06 -0700
X-CSE-ConnectionGUID: H58pezZ6QfameBKBuXb1zw==
X-CSE-MsgGUID: x+nRnuCvTW6ltgKIk4m24Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469410"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 11/17] drm/xe/pf: Add functions to provision scheduling
 priority
Date: Tue, 28 Oct 2025 18:58:25 +0100
Message-ID: <20251028175832.184534-12-michal.wajdeczko@intel.com>
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

We already have function to configure PF (or VF) scheduling priority
on a single GT, but we also need function that will cover all tiles
and GTs.

However, due to the current GuC FW limitation, we can't always rely
on per-GT function as it actually only works for the PF case. The
only way to change VFs scheduling priority is to use 'sched_if_idle'
policy KLV that will change priorities for all VFs (and the PF).

We will use these new functions in the upcoming patches.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: fix comments/commit message (Piotr)
    add missing include
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 93 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |  4 +
 2 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 6a4cb3d5494a..38915ea4f7c9 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -6,6 +6,7 @@
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
+#include "xe_gt_sriov_pf_policy.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_provision.h"
@@ -332,3 +333,95 @@ int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u
 
 	return !count ? -ENODATA : 0;
 }
+
+/**
+ * xe_sriov_pf_provision_bulk_apply_priority() - Change scheduling priority of all VFs and PF.
+ * @xe: the PF &xe_device
+ * @prio: scheduling priority to set
+ *
+ * Change the scheduling priority provisioning on all tiles/GTs.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio)
+{
+	bool sched_if_idle;
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	/*
+	 * Currently, priority changes that involves VFs are only allowed using
+	 * the 'sched_if_idle' policy KLV, so only LOW and NORMAL are supported.
+	 */
+	xe_assert(xe, prio < GUC_SCHED_PRIORITY_HIGH);
+	sched_if_idle = prio == GUC_SCHED_PRIORITY_NORMAL;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_policy_set_sched_if_idle(gt, sched_if_idle);
+		result = result ?: err;
+	}
+
+	return result;
+}
+
+/**
+ * xe_sriov_pf_provision_apply_vf_priority() - Change VF's scheduling priority.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier
+ * @prio: scheduling priority to set
+ *
+ * Change VF's scheduling priority provisioning on all tiles/GTs.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_apply_vf_priority(struct xe_device *xe, unsigned int vfid, u32 prio)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_set_sched_priority(gt, vfid, prio);
+		result = result ?: err;
+	}
+
+	return result;
+}
+
+/**
+ * xe_sriov_pf_provision_query_vf_priority() - Query VF's scheduling priority.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier
+ * @prio: placeholder for the returned scheduling priority
+ *
+ * Query VF's scheduling priority provisioning from all tiles/GTs.
+ * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int vfid, u32 *prio)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int count = 0;
+	u32 value;
+
+	for_each_gt(gt, xe, id) {
+		value = xe_gt_sriov_pf_config_get_sched_priority(gt, vfid);
+		if (!count++)
+			*prio = value;
+		else if (value != *prio)
+			return -EUCLEAN;
+	}
+
+	return !count ? -ENODATA : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
index aa8a95b1c0be..bccf23d51396 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
@@ -20,6 +20,10 @@ int xe_sriov_pf_provision_bulk_apply_pt(struct xe_device *xe, u32 pt);
 int xe_sriov_pf_provision_apply_vf_pt(struct xe_device *xe, unsigned int vfid, u32 pt);
 int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u32 *pt);
 
+int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio);
+int xe_sriov_pf_provision_apply_vf_priority(struct xe_device *xe, unsigned int vfid, u32 prio);
+int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int vfid, u32 *prio);
+
 int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
 int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
 
-- 
2.47.1

