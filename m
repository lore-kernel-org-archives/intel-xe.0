Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4216CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDCE10E644;
	Tue, 28 Oct 2025 17:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsnTDRsj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D8710E641
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674341; x=1793210341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e/xXjkxJosE9VQv6Hk3Wyh55+FesWCJg3gitnAJ8Ew8=;
 b=BsnTDRsjrMRJKQfN6t2/6TC/ObA2hrOkMErqoyyr8GKasP1OhWhjOVZ8
 EFYtgnsohbwvMS3UiCKLwIhdijuY8+takAGIlK1uPwY0tRdFwMdFJNsiH
 4M5PATJK4tb7ihbh+1SBdSXyizhCe8UEVG1yDGbZRAJqh1M6qBzwo0m2T
 XiQaRwHkujUwiEt8xs7DsybEQ4NLGAc0aqPvGfT/vgXXu+I82on1NUtOy
 TfRmvucYB2OM5WlJ0k6lt/A4LFs75GreF0eXLvbMQTR5u6zRcUd1X7Yxv
 LKEhOhA3T54VwH7MYM4vx50nHQPeo5U7Ewji0id5ma80+Eh3Nbco4wgcl w==;
X-CSE-ConnectionGUID: xfJuj/+YQ4+BNcmLeIiLQQ==
X-CSE-MsgGUID: ux8V5yTMQ+2sIVtHD61NGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687841"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687841"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:01 -0700
X-CSE-ConnectionGUID: mDhjcQlyQo62nypWsj4ylg==
X-CSE-MsgGUID: 3FqNEFNQRUaZ23VSbkW2nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469376"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:58:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 08/17] drm/xe/pf: Add functions to bulk configure EQ/PT on
 GT
Date: Tue, 28 Oct 2025 18:58:22 +0100
Message-ID: <20251028175832.184534-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175832.184534-1-michal.wajdeczko@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
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

We already have functions to bulk configure 'hard' resources like
GGTT, LMEM or GuC context/doorbells IDs. Now add functions for the
'soft' scheduling parameters, as we will need them soon in the
upcoming patches.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: add _locked variants instead
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 56 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 +
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6365d5f2ae98..56048cd79d15 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1810,6 +1810,34 @@ u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 	return pf_get_exec_quantum(gt, vfid);
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked() - Configure EQ for PF and VFs.
+ * @gt: the &xe_gt to configure
+ * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
+ *
+ * This function can only be called on PF with the master mutex hold.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum)
+{
+	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
+	unsigned int n;
+	int err = 0;
+
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	for (n = 0; n <= totalvfs; n++) {
+		err = pf_provision_exec_quantum(gt, VFID(n), exec_quantum);
+		if (err)
+			break;
+	}
+
+	return pf_config_bulk_set_u32_done(gt, 0, 1 + totalvfs, exec_quantum,
+					   pf_get_exec_quantum, "execution quantum",
+					   exec_quantum_unit, n, err);
+}
+
 static const char *preempt_timeout_unit(u32 preempt_timeout)
 {
 	return preempt_timeout ? "us" : "(infinity)";
@@ -1912,6 +1940,34 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
 	return pf_get_preempt_timeout(gt, vfid);
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked() - Configure PT for PF and VFs.
+ * @gt: the &xe_gt to configure
+ * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
+ *
+ * This function can only be called on PF with the master mutex hold.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32 preempt_timeout)
+{
+	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
+	unsigned int n;
+	int err = 0;
+
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	for (n = 0; n <= totalvfs; n++) {
+		err = pf_provision_preempt_timeout(gt, VFID(n), preempt_timeout);
+		if (err)
+			break;
+	}
+
+	return pf_config_bulk_set_u32_done(gt, 0, 1 + totalvfs, preempt_timeout,
+					   pf_get_preempt_timeout, "preemption timeout",
+					   preempt_timeout_unit, n, err);
+}
+
 static const char *sched_priority_unit(u32 priority)
 {
 	return priority == GUC_SCHED_PRIORITY_LOW ? "(low)" :
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 6bab5ad6c849..14d036790695 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -43,6 +43,7 @@ int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
 u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid,
 						  u32 exec_quantum);
+int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum);
 
 u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
@@ -51,6 +52,7 @@ int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfi
 u32 xe_gt_sriov_pf_config_get_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid,
 						     u32 preempt_timeout);
+int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32 preempt_timeout);
 
 u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
-- 
2.47.1

