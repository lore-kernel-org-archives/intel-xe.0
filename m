Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE53CCD1AA
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D23210E4B1;
	Mon, 20 Oct 2025 18:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4WEIfS7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C5510E4AF
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984679; x=1792520679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dtZvhI9bIVpEaWBryXUS8d9opYVWt4K1COQDOkqQdlE=;
 b=K4WEIfS75nyUlOYPpxya0aTdKyNwhhIZP7n8fppEXs3nUANPHRWw5qSr
 QspBwYMY8dD2cQkY8fyQrwPoDimN0g1ylquMU7IFCAVo8ao8kr7qYgi6y
 8jbhWrkVVbVBBfT6vyiWnmSYPk2BMzIKwcmG8TOfocix/eU4jA+oU0vUx
 dxPT6OjbAsRNyS8lr5qcW8Yx7x5IdXf8FXN2gK6UxKfAOySrUbkJdtiFi
 7bd+PZg2JT9FrPUcLA2a93HNs5potBt0y92NF5cjuCCAvNUOk+fgtaOfq
 XhCUrBuMQf2fbjx1inNRQblPQYIhW3FrxlNb3JS9WbW2zhzp9z27BDCcM Q==;
X-CSE-ConnectionGUID: tvd6ZEFRRXiZBMvhwJRPTA==
X-CSE-MsgGUID: 9F0kbPpdSPucUyAWOaCujw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013064"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013064"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:39 -0700
X-CSE-ConnectionGUID: WU7keqhfSd+HvC33rfUrhQ==
X-CSE-MsgGUID: wYmBlhp/R+ucFGz7BT9Hgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802119"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 05/14] drm/xe/pf: Add functions to bulk configure EQ/PT on GT
Date: Mon, 20 Oct 2025 20:24:05 +0200
Message-ID: <20251020182414.576-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020182414.576-1-michal.wajdeczko@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 56 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 +
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 0a591b86d94e..99d5fb68174c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1778,6 +1778,34 @@ u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 	return exec_quantum;
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_exec_quantum() - Configure execution quantum for PF and VFs.
+ * @gt: the &xe_gt to configure
+ * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_exec_quantum(struct xe_gt *gt, u32 exec_quantum)
+{
+	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
+	unsigned int n;
+	int err = 0;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	for (n = 0; n <= totalvfs; n++) {
+		err = pf_provision_exec_quantum(gt, VFID(n), exec_quantum);
+		if (err)
+			break;
+	}
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_config_bulk_set_u32_done(gt, 0, 1 + totalvfs, exec_quantum,
+					   xe_gt_sriov_pf_config_get_exec_quantum,
+					   "execution quantum", exec_quantum_unit, n, err);
+}
+
 static const char *preempt_timeout_unit(u32 preempt_timeout)
 {
 	return preempt_timeout ? "us" : "(infinity)";
@@ -1849,6 +1877,34 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
 	return preempt_timeout;
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_preempt_timeout() - Configure preemption timeout for PF and VFs.
+ * @gt: the &xe_gt to configure
+ * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_preempt_timeout(struct xe_gt *gt, u32 preempt_timeout)
+{
+	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
+	unsigned int n;
+	int err = 0;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	for (n = 0; n <= totalvfs; n++) {
+		err = pf_provision_preempt_timeout(gt, VFID(n), preempt_timeout);
+		if (err)
+			break;
+	}
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_config_bulk_set_u32_done(gt, 0, 1 + totalvfs, preempt_timeout,
+					   xe_gt_sriov_pf_config_get_preempt_timeout,
+					   "preemption timeout", preempt_timeout_unit, n, err);
+}
+
 static const char *sched_priority_unit(u32 priority)
 {
 	return priority == GUC_SCHED_PRIORITY_LOW ? "(low)" :
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 513e6512a575..de1e31077c8e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -39,10 +39,12 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, uns
 
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
+int xe_gt_sriov_pf_config_bulk_set_exec_quantum(struct xe_gt *gt, u32 exec_quantum);
 
 u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 					      u32 preempt_timeout);
+int xe_gt_sriov_pf_config_bulk_set_preempt_timeout(struct xe_gt *gt, u32 preempt_timeout);
 
 u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
-- 
2.47.1

