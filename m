Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3746C1061B1E
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E915210E80D;
	Mon, 30 Mar 2026 20:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekIJ7NWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542AC10E807
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903274; x=1806439274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z7/d4+EAMSONgbKlMfERqpaq7bRMUH4tiQ3tOEL0oOY=;
 b=ekIJ7NWHW+3sEE/YQW85DEA56LPKOq011CCtuj3IpWwOxKWA5K8SwcQF
 N4BkLUq5QlOwARZWLdrPFUshMq5Sy6gy85tSjDub/Z5Aju81xVtFeh5a7
 JCIkf7FXGUUjg20bjmYvKdsUluXSbpbGkAgeTuY7tdVMCji6R2bgMTX8b
 fQwoIzXEJNZm5a712SBFPF+NwhbIrh3Qb90/v33y44SUUjgiviX3b2ndb
 CV5RcqiuL4J74Qe6DkI2UTnHB9fD3SKzRWg+mEiGLjJWGg3tFUsgEr7jb
 r+eRK4DhOyXnH0xjChbhM5k0EfuNfxmSGJ3hDlYmhvvde6JUb+dHT37pu Q==;
X-CSE-ConnectionGUID: hFfVdsleQgGmxoAW4D7xWQ==
X-CSE-MsgGUID: xOTx9gTIRQOYOJEos7MgOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923718"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923718"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:14 -0700
X-CSE-ConnectionGUID: DjtGpftTR8KWDKA34+ju/A==
X-CSE-MsgGUID: Ip8NI5g7S3mdQtPLnG0WaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329462"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:13 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 13/13] drm/xe/pf: Perform fair scheduling auto-provisioning
Date: Mon, 30 Mar 2026 22:40:44 +0200
Message-ID: <20260330204046.567-14-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330204046.567-1-michal.wajdeczko@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

Default VF scheduling configuration is the same as for the PF and
includes unlimited execution quantum (EQ) and unlimited preemption
timeout (PT). While this setup gives the most flexibility it does
not protect the PF or VFs from other VF that could constantly submit
workloads without any gaps that would let GuC do a VF-switch.

To avoid that, do some trivial auto-provisioning and configure PF
and all VFs with 16ms EQ and PT. This setup should allow GuC to
perform a full round-robin with up to 63 VFs within 2s, which in
turn should match expectations from most of the VMs using VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 85 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c |  2 +
 3 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 7f85d6629fec..a2babef5e5f0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2661,6 +2661,91 @@ static bool pf_non_default_sched(struct xe_gt *gt, unsigned int vfid)
 	       custom_sched_priority(gt, pf_get_sched_priority(gt, vfid));
 }
 
+static void __pf_show_provisioned_sched(struct xe_gt *gt, unsigned int first_vf,
+					unsigned int num_vfs, bool provisioned)
+{
+	__pf_show_provisioned(gt, first_vf, num_vfs, provisioned,
+			      pf_get_exec_quantum, NULL, "EQ");
+	__pf_show_provisioned(gt, first_vf, num_vfs, provisioned,
+			      pf_get_preempt_timeout, NULL, "PT");
+
+	/* we only care about non-default priorities */
+	if (provisioned)
+		__pf_show_provisioned(gt, first_vf, num_vfs, true,
+				      pf_get_sched_priority, NULL, "PRIORITY");
+}
+
+static void pf_show_all_provisioned_sched(struct xe_gt *gt)
+{
+	__pf_show_provisioned_sched(gt, PFID, 1 + xe_gt_sriov_pf_get_totalvfs(gt), true);
+}
+
+static void pf_show_unprovisioned_sched(struct xe_gt *gt, unsigned int num_vfs)
+{
+	__pf_show_provisioned_sched(gt, PFID, 1 + num_vfs, false);
+}
+
+static bool pf_needs_provision_sched(struct xe_gt *gt, unsigned int num_vfs)
+{
+	unsigned int vfid;
+
+	for (vfid = PFID; vfid < PFID + num_vfs; vfid++) {
+		if (pf_non_default_sched(gt, vfid)) {
+			pf_show_all_provisioned_sched(gt);
+			pf_show_unprovisioned_sched(gt, num_vfs);
+			return false;
+		}
+	}
+
+	pf_show_all_provisioned_sched(gt);
+	return true;
+}
+
+/* With 16ms EQ/PT GuC should be able to handle up to 63 VFs within 2s */
+#define XE_FAIR_EXEC_QUANTUM_MS		16
+#define XE_FAIR_PREEMPT_TIMEOUT_US	16000
+#define XE_FAIR_SCHED_PRIORITY		GUC_SCHED_PRIORITY_LOW
+#define XE_ADMIN_PF_SCHED_PRIORITY	GUC_SCHED_PRIORITY_HIGH
+
+/**
+ * xe_gt_sriov_pf_config_set_fair_sched() - Provision PF and VFs with fair scheduling.
+ * @gt: the &xe_gt
+ * @num_vfs: number of VFs to provision (can't be 0)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
+{
+	int result = 0;
+	int err;
+
+	xe_gt_assert(gt, num_vfs);
+	xe_gt_assert(gt, XE_FAIR_EXEC_QUANTUM_MS);
+	xe_gt_assert(gt, XE_FAIR_PREEMPT_TIMEOUT_US);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	if (!pf_needs_provision_sched(gt, num_vfs))
+		return 0;
+
+	err = pf_bulk_set_exec_quantum(gt, XE_FAIR_EXEC_QUANTUM_MS, PFID, 1 + num_vfs);
+	result = result ?: err;
+	err = pf_bulk_set_preempt_timeout(gt, XE_FAIR_PREEMPT_TIMEOUT_US, PFID, 1 + num_vfs);
+	result = result ?: err;
+
+	xe_gt_assert(gt, XE_FAIR_SCHED_PRIORITY == GUC_SCHED_PRIORITY_LOW);
+	xe_gt_assert(gt, !xe_gt_sriov_pf_policy_get_sched_if_idle_locked(gt));
+
+	if (xe_sriov_pf_admin_only(gt_to_xe(gt))) {
+		err = pf_provision_sched_priority(gt, PFID, XE_ADMIN_PF_SCHED_PRIORITY);
+		result = result ?: err;
+	}
+
+	return result;
+}
+
 static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
 				  enum xe_guc_klv_threshold_index index, u32 value)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index e9314f0a9b4e..2ec62c12ad5c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -78,6 +78,7 @@ u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
 					enum xe_guc_klv_threshold_index index, u32 value);
 
+int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
 int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index e11874d689fa..0ec7ea83f12a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -41,6 +41,8 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
 	int err;
 
 	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_set_fair_sched(gt, num_vfs);
+		result = result ?: err;
 		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
 		result = result ?: err;
 	}
-- 
2.47.1

