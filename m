Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38B3CCFA00
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFB310EA66;
	Thu, 30 Oct 2025 22:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfHYFAcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B4A10EA62
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863063; x=1793399063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UWhND+rM5OC/1B5WLTW29+p+Zo6HE/mE70CejFsqblQ=;
 b=nfHYFAcH/7JvKonnAicwvzvWRCNBPWJ85lRZ9CJ4tQzzFXXY851WxAST
 biPUHfNZeCojkYmfWi+cIgcv3ypS+vX3YC79tHUmSfOsAirdkPxrF6Qqj
 SEXyvZNGUxn6gLkwSwLOOlDV78agJtxRtR4FAiy30hxGTN69nSkOruDeb
 yQuvGwD4GlJ9zq4Ug53mzKLmfCWpXzemAtr0TAfy0foQpW23/5itgBfuN
 8SXDQAq1CUW9uQcCdjAdLhr+AkgFMzWSha8447vZExOLSj1OPxF8Ohw5N
 ouFRL8ye6XCDM5AEI2Uj+pGImr9iBxsgV0va0UUZrKnnqDOgED2/kvoNW g==;
X-CSE-ConnectionGUID: y/eRxovuTJyDgljVLoZteg==
X-CSE-MsgGUID: AoawTIOtTayhEcLWJndzmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64059950"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64059950"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:22 -0700
X-CSE-ConnectionGUID: 8iMcw1yOStOLPiDqvVXD8g==
X-CSE-MsgGUID: wxwBXxcrTeSfcVUATZSWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185346473"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 09/17] drm/xe/pf: Add functions to bulk provision EQ/PT
Date: Thu, 30 Oct 2025 23:23:40 +0100
Message-ID: <20251030222348.186658-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030222348.186658-1-michal.wajdeczko@intel.com>
References: <20251030222348.186658-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: use single lock to avoid races (Lucas)
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 56 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |  2 +
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 8040747186d7..0f5bcc076b78 100644
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
@@ -226,6 +254,34 @@ int xe_sriov_pf_provision_query_vf_eq(struct xe_device *xe, unsigned int vfid, u
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

