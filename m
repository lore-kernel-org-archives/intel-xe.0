Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A665DCCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB7610E4AD;
	Mon, 20 Oct 2025 18:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7120zuY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68B210E4B2
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984682; x=1792520682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qaD1WJMhlso86dEo5RsO2o7+ugt5fiNbSmVWxzjIU0g=;
 b=W7120zuYxncuEikUSWTPQtyRbbj3eHxYHMiwPAIwEPCkS6D4/Eb1EC7d
 At8jAcqG/u+PHbBeb7t1P3yVhdm/IhKImVy6GMiFQrRglVgxZQXZQDxLB
 DEcBsAMWBhS53HTupl3f1ukoFoxnCZsqr8L3lsv7TrNzkOeOZhpBWcpCj
 ARTf88W3r3nzkwTia/A59sUpyxgxaZYjZtiJ3aBfW1CMByqqq0vVQe4/l
 GyjEka+S2ATQ5nZASsf2skWvnPiJfa7vxgb1lZGtEVzdCnLPCkczaZblz
 GvK0r4BTC6WZPZPmor/r7K61s+5m1RAloXRJLcrDc+WaT0LJOkHo+8Fvq g==;
X-CSE-ConnectionGUID: Q8/PcFFETGa2qyVFNeLy9w==
X-CSE-MsgGUID: JC9iLk/IQ4OStY3wojFcDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013069"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013069"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:42 -0700
X-CSE-ConnectionGUID: /PTTti3fQFqBsmMAaxV0Ng==
X-CSE-MsgGUID: LR9lszMxSbmxOUXA1bvoZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802128"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 06/14] drm/xe/pf: Add functions to bulk provision EQ/PT
Date: Mon, 20 Oct 2025 20:24:06 +0200
Message-ID: <20251020182414.576-7-michal.wajdeczko@intel.com>
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

We already have functions to configure EQ/PT for single VF across
all tiles/GTs. Now add helper functions that will do that for all
VFs (and the PF) at once.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 52 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |  2 +
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index f2e14103c9aa..44c52c7e241f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -153,6 +153,32 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
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
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_bulk_set_exec_quantum(gt, eq);
+		result = result ?: err;
+	}
+
+	return result;
+}
+
 /**
  * xe_sriov_pf_provision_apply_vf_eq() - Change VF's execution quantum.
  * @xe: the PF &xe_device
@@ -211,6 +237,32 @@ int xe_sriov_pf_provision_query_vf_eq(struct xe_device *xe, unsigned int vfid, u
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
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_bulk_set_preempt_timeout(gt, pt);
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

