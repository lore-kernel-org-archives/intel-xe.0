Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E80CCF9F2
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24FE10E64A;
	Tue, 28 Oct 2025 17:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHZYqRSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8358610E643
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674343; x=1793210343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=86Q0o4bgkHAQijISYz29aXicqKVPTSWo9Jh1OiKRzp0=;
 b=GHZYqRSbwpE7iWSpc+SJM3O53/boihYocqJrMAAkY5tvtMMsLAbz4Z+C
 bz9tmtz5buAXjueh+d6iZ6yFS13bg1e+mfWqDWpwYW62nZR+SEImU386y
 Ge90jLBID59YZotgzMp+AX1ITTLaF3KRGD5wnz+cDHPoHw+J6jKFgX3jX
 SD13VwaOeI7hHzTj+/E/dpJB+Sy9LQCeAJhlRVh81I904Yc3FTGQe4FzN
 BAXhKmgkSPtnPcwRRE9zcr/KdHrWGiK0OCBKVUTjeoObcJ5cjtZTnm4XH
 LwsDB/1iQ/EoCXycG+9JgwFFoikOfFZqWtSV7N+rXXpSul6P8IptKvlzg A==;
X-CSE-ConnectionGUID: JVfKtwwjTA+nP0e48XQLXg==
X-CSE-MsgGUID: na6anrCCTfW9b5/2Oqq9Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687843"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:03 -0700
X-CSE-ConnectionGUID: LRtuAWPmT3mC467cC4N/1A==
X-CSE-MsgGUID: Y4nihRg6TR6fXgQCUDyuHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469395"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 09/17] drm/xe/pf: Add functions to bulk provision EQ/PT
Date: Tue, 28 Oct 2025 18:58:23 +0100
Message-ID: <20251028175832.184534-10-michal.wajdeczko@intel.com>
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

We already have functions to configure EQ/PT for single VF across
all tiles/GTs. Now add helper functions that will do that for all
VFs (and the PF) at once.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> #v1
---
v2: use single lock to avoid races (Lucas)
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 56 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |  2 +
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index c5b3a6aa67f4..6a4cb3d5494a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -153,6 +153,34 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
 	return 0;
 }
 
+/**
+ * xe_sriov_pf_provision_bulk_apply_eq() - Change execution quantum for all VFs and PF.
+ * @xe: the PF &xe_device
+ * @eq: execution quantum in [ms] to set
+ *
+ * Change execution quantum (EQ) provisioning on all tiles/GTs.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_bulk_apply_eq(struct xe_device *xe, u32 eq)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(gt, eq);
+		result = result ?: err;
+	}
+
+	return result;
+}
+
 /**
  * xe_sriov_pf_provision_apply_vf_eq() - Change VF's execution quantum.
  * @xe: the PF &xe_device
@@ -215,6 +243,34 @@ int xe_sriov_pf_provision_query_vf_eq(struct xe_device *xe, unsigned int vfid, u
 	return !count ? -ENODATA : 0;
 }
 
+/**
+ * xe_sriov_pf_provision_bulk_apply_pt() - Change preemption timeout for all VFs and PF.
+ * @xe: the PF &xe_device
+ * @pt: preemption timeout in [us] to set
+ *
+ * Change preemption timeout (PT) provisioning on all tiles/GTs.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_bulk_apply_pt(struct xe_device *xe, u32 pt)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(gt, pt);
+		result = result ?: err;
+	}
+
+	return result;
+}
+
 /**
  * xe_sriov_pf_provision_apply_vf_pt() - Change VF's preemption timeout.
  * @xe: the PF &xe_device
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
index cb81b5880930..aa8a95b1c0be 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
@@ -12,9 +12,11 @@
 
 struct xe_device;
 
+int xe_sriov_pf_provision_bulk_apply_eq(struct xe_device *xe, u32 eq);
 int xe_sriov_pf_provision_apply_vf_eq(struct xe_device *xe, unsigned int vfid, u32 eq);
 int xe_sriov_pf_provision_query_vf_eq(struct xe_device *xe, unsigned int vfid, u32 *eq);
 
+int xe_sriov_pf_provision_bulk_apply_pt(struct xe_device *xe, u32 pt);
 int xe_sriov_pf_provision_apply_vf_pt(struct xe_device *xe, unsigned int vfid, u32 pt);
 int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u32 *pt);
 
-- 
2.47.1

