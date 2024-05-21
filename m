Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E84C25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 09:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE7410E968;
	Tue, 21 May 2024 09:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+/Drmnd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F08210E966
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 09:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716283542; x=1747819542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pJckJJUxMaI6Nna/EiwGz7WidUmvTRPV1GqmRo+jgbU=;
 b=D+/DrmndlbZ0XXS0oL9brm04BtN5yw7aN953Qx1CKFSk+3yKIHTO3r4a
 U6rxMU1j+pB66qs35gLvxKR8LD+Xn0u7KrPIorF9+Aj36XKRMK4p06pSj
 Q8vRWdW/wFebchlIt/efVIQzRwEnHvOgJDx/y8TLvZYG8md3RvN/ls2hV
 3KeUOaXDpY7f63Be8vcSGGovB+8Y9o07PkXjrJbNEmAPTxUJR4klIh/AX
 +nlms3GCxv1YmD4V4Gkv4j/RisOwi1T/5W5lrLMikAhQW2zU4WH0A7Fkx
 UJVTl8X0VE34TxtahP5uZxS1zZw6YNIiv/Zjcuej7hqkL/iC0UlnbQuHj w==;
X-CSE-ConnectionGUID: yOirUR4ATPqAoxZ6I90Slw==
X-CSE-MsgGUID: KPlE+KfzRJaAtuiMRR/6QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12310804"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12310804"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:25:42 -0700
X-CSE-ConnectionGUID: zlg2zGMbTc29eadEpaZxZw==
X-CSE-MsgGUID: ijKsjpSDQACJOqs0/CSrEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32758160"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:25:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 2/2] drm/xe/vf: Custom GuC initialization if VF
Date: Tue, 21 May 2024 11:25:18 +0200
Message-Id: <20240521092518.624-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240521092518.624-1-michal.wajdeczko@intel.com>
References: <20240521092518.624-1-michal.wajdeczko@intel.com>
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

The GuC firmware is loaded and initialized by the PF driver. Make
sure VF drivers only perform permitted operations. For submission
initialization, use number of GuC context IDs from self config.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
v2: only assert guc.major version (John)
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 ++
 drivers/gpu/drm/xe/xe_guc.c         | 40 +++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 378dde5ad4f9..bab3858b423e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -408,6 +408,23 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
+ * @gt: the &xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: number of GuC context IDs assigned to VF.
+ */
+u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
+
+	return gt->sriov.vf.self_config.num_ctxs;
+}
+
 static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
 {
 	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 997cb7541036..d6d37b193d17 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -16,6 +16,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 
+u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
+
 void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 807ad53449e4..cec709a908c3 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -295,6 +295,23 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 	return 0;
 }
 
+static int vf_guc_init(struct xe_guc *guc)
+{
+	int err;
+
+	xe_guc_comm_init_early(guc);
+
+	err = xe_guc_ct_init(&guc->ct);
+	if (err)
+		return err;
+
+	err = xe_guc_relay_init(&guc->relay);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -309,6 +326,13 @@ int xe_guc_init(struct xe_guc *guc)
 	if (!xe_uc_fw_is_enabled(&guc->fw))
 		return 0;
 
+	if (IS_SRIOV_VF(xe)) {
+		ret = vf_guc_init(guc);
+		if (ret)
+			goto out;
+		return 0;
+	}
+
 	ret = xe_guc_log_init(&guc->log);
 	if (ret)
 		goto out;
@@ -342,6 +366,19 @@ int xe_guc_init(struct xe_guc *guc)
 	return ret;
 }
 
+static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
+{
+	int err;
+
+	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	if (err)
+		return err;
+
+	/* XXX xe_guc_db_mgr_init not needed for now */
+
+	return 0;
+}
+
 /**
  * xe_guc_init_post_hwconfig - initialize GuC post hwconfig load
  * @guc: The GuC object
@@ -352,6 +389,9 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
 	int ret;
 
+	if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return vf_guc_init_post_hwconfig(guc);
+
 	ret = xe_guc_realloc_post_hwconfig(guc);
 	if (ret)
 		return ret;
-- 
2.43.0

