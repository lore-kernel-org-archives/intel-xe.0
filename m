Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93567CCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D7910E4AE;
	Mon, 20 Oct 2025 18:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CE4BU4sd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BCC10E4AC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984686; x=1792520686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1zcXypHpI4t9YNVc82c9X+uk3EulpxPGlxl/SMvugZI=;
 b=CE4BU4sd3HhSHaa9v+WfVX2+WoBUaYbjRlgKpcKCk+PBScniFeGPfeX4
 mrb1nPnpspkXGni8Oz+Nj4ToAWHIaPr+JfizjfvYK5WvKgDFJj8AKrN0e
 dwjsRV8QNRTI8ilgrBrNDR2D3Kb3KaAfJ1RK5podbIdP5vaAG/9t32/YI
 UWHAvj42VbZ4C57IQMbU13eoKwhym+e9hrkucozC32wE9PKzPN1UZspJJ
 mAdjsfR1W1qavw/u9ogvRiSboeQpm1o0gygbiz+Ej0Snc2/W8jc36KoNe
 zXf+kZFFgrdNUXo84pgzSrgfPpMivyltGlmtk2shl0cMrGH8n5KRiylOH g==;
X-CSE-ConnectionGUID: 89rfb7AsSfC0ZGod9x+sQQ==
X-CSE-MsgGUID: 8ZgJvVHpRPaAYx8i55UC8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013075"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013075"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:46 -0700
X-CSE-ConnectionGUID: 5CVfYkShQJiJ1DFl9gsxIQ==
X-CSE-MsgGUID: cALWxVgATamq0NnEeIXGQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802137"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 08/14] drm/xe/pf: Add functions to provision scheduling
 priority
Date: Mon, 20 Oct 2025 20:24:08 +0200
Message-ID: <20251020182414.576-9-michal.wajdeczko@intel.com>
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

We already have function to configure PF (or VF) scheduling priority
on single GT, but we also need function that will cover all tiles/GTs.

However, due to the current GuC FW limitation, we can't always rely
on per-GT function as it actually only works for the PF case. The
only way to change VFs scheduling priority is to use 'sched_if_idle'
policy KLV that will change priorities for all VFs (and the PF).

We will all these new functions in the upcoming patches.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 92 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |  4 +
 2 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 44c52c7e241f..3a3806055616 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -320,3 +320,95 @@ int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u
 
 	return !count ? -ENODATA : 0;
 }
+
+/**
+ * xe_sriov_pf_provision_bulk_apply_priority() - Change scheduling priority of all VFs and PF.
+ * @xe: the PF &xe_device
+ * @prio: scheduling priority to set
+ *
+ * Change scheduling priority provisioning on all tiles/GTs.
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

