Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BA3D3B7EA
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0300D10E318;
	Sat,  6 Dec 2025 23:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xetuljvu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4987910E313
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 23:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765062258; x=1796598258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H+eYwX1cLh0FdGZwZY6npSz5Nv60wX2uUFcxAnXNBxg=;
 b=XetuljvuqtsawomlZK1TiWpxf+SfpJbJjcQXXmCn2vOPu5U/jibLJUb2
 hBABobxR2QZw79WNGoZgNuCU42GFwRZqFTLGuKyRMpP9Rn9xv6teOW//a
 x+XktQgLsyaFDtee7NLN0fWIE55vLoJGAarJ81HzEb3Zi4nuBh9XDJAkb
 /Ho011esGezU8kEliR7dZY3RetIbRLcaoIRqVlaB002rbzjoLV6XihLmP
 K1EOnqtV3yxdUsLAvUOT5gvztSwVK8dpCRczzWXQ5XeJcNpI9Un/4AT0X
 1Cjs1f8mpn/tLWH6A9JtBnRdnxRzVePn5oXczbZjf6Lfq9OZ6PgcbQvb1 A==;
X-CSE-ConnectionGUID: m+7fFszjRbO6vGcYw5muBA==
X-CSE-MsgGUID: iHXF7hU0QOq937vUg6UzhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78411695"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="78411695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:18 -0800
X-CSE-ConnectionGUID: S3kHuxbeQI6T2/YJ3VahEw==
X-CSE-MsgGUID: nrHSO9uDTwubecnUh/k7TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200045552"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:18 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 10/11] drm/xe/sriov: Add functions to set preempt timeouts
 for each group
Date: Sat,  6 Dec 2025 15:04:06 -0800
Message-ID: <20251206230356.3600292-23-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
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

The KLV to set the preemption timeout for each groups works the exact
same way as the one for the exec quantums, so we add similar functions.

v2: drop the option of setting a single group, minor updates (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h      | 13 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 95 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  5 ++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c    |  2 +
 4 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index f8c7bc4d110a..d605c31aae6c 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -400,6 +400,16 @@ enum  {
  *      the GuC always sets the EQ for all groups (even the non-enabled ones),
  *      so if we provide fewer values than the max the GuC will use 0 for the
  *      remaining groups.
+ *
+ * _`GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT' : 0x8A0F
+ *      This config sets the VFs-preemption-timeout for each scheduling group in
+ *      microseconds. The driver must provide an array of values, with each of
+ *      them matching the respective group index (first value goes to group 0,
+ *      second to group 1, etc). The setting of group values follows the same
+ *      behavior and rules as setting via GUC_KLV_VF_CFG_PREEMPT_TIMEOUT. Note
+ *      that the GuC always sets the EQ for all groups (even the non-enabled
+ *      ones), so if we provide fewer values than the max the GuC will use 0 for
+ *      the remaining groups.
  */
 
 #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
@@ -465,6 +475,9 @@ enum  {
 #define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_MIN_LEN	1u
 #define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_MAX_LEN	8u
 
+#define GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_KEY		0x8a0f
+#define GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MIN_LEN	1u
+#define GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MAX_LEN	8u
 /*
  * Workaround keys:
  */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index ac3583594603..57f32b6c7814 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -295,13 +295,18 @@ static u32 encode_config_sched(struct xe_gt *gt, u32 *cfg, u32 n,
 	if (xe_sriov_gt_pf_policy_has_multi_group_modes(gt)) {
 		BUILD_BUG_ON(ARRAY_SIZE(config->exec_quantum) >
 			     GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_MAX_LEN);
+		BUILD_BUG_ON(ARRAY_SIZE(config->preempt_timeout) >
+			     GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MAX_LEN);
 
 		cfg[n++] = PREP_GUC_KLV_CONST(GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY,
 					      ARRAY_SIZE(config->exec_quantum));
 		for (i = 0; i < ARRAY_SIZE(config->exec_quantum); i++)
 			cfg[n++] = config->exec_quantum[i];
 
-		/* TODO: add group preempt timeout setting */
+		cfg[n++] = PREP_GUC_KLV_CONST(GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_KEY,
+					      ARRAY_SIZE(config->preempt_timeout));
+		for (i = 0; i < ARRAY_SIZE(config->preempt_timeout); i++)
+			cfg[n++] = config->preempt_timeout[i];
 	} else {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
 		cfg[n++] = config->exec_quantum[0];
@@ -2265,6 +2270,89 @@ int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32
 					   preempt_timeout_unit, n, err);
 }
 
+static int pf_provision_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
+						const u32 *preempt_timeouts, u32 count)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	int err;
+	int i;
+
+	err = pf_push_vf_grp_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_KEY,
+				     preempt_timeouts, count);
+	if (unlikely(err))
+		return err;
+
+	/*
+	 * GuC silently clamps values exceeding the max and zeroes out the
+	 * quantum for groups not in the klv payload
+	 */
+	for (i = 0; i < ARRAY_SIZE(config->preempt_timeout); i++) {
+		if (i < count)
+			config->preempt_timeout[i] =
+				min_t(u32, preempt_timeouts[i],
+				      GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_MAX_VALUE);
+		else
+			config->preempt_timeout[i] = 0;
+	}
+
+	return 0;
+}
+
+static void pf_get_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
+					   u32 *preempt_timeouts, u32 max_count)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	u32 count = min_t(u32, max_count, ARRAY_SIZE(config->preempt_timeout));
+
+	memcpy(preempt_timeouts, config->preempt_timeout, sizeof(u32) * count);
+}
+
+/**
+ * xe_gt_sriov_pf_config_set_groups_preempt_timeouts() - Configure PF/VF PTs for sched groups.
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ * @preempt_timeouts: array of requested PTs in microseconds (0 is infinity)
+ * @count: number of entries in the array
+ *
+ * This function can only be called on PF.
+ * It will log the provisioned value or an error in case of the failure.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
+						      u32 *preempt_timeouts, u32 count)
+{
+	int err;
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	err = pf_provision_groups_preempt_timeouts(gt, vfid, preempt_timeouts, count);
+
+	return pf_groups_cfg_set_u32_done(gt, vfid, preempt_timeouts, count,
+					  pf_get_groups_preempt_timeouts,
+					  "preempt_timeout",
+					  preempt_timeout_unit, err);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_groups_preempt_timeouts - Get PF/VF sched groups PTs
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ * @preempt_timeouts: array in which to store the preemption timeouts values
+ * @count: maximum number of entries to store
+ *
+ * This function can only be called on PF.
+ */
+void xe_gt_sriov_pf_config_get_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
+						       u32 *preempt_timeouts, u32 count)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	xe_gt_assert(gt, count <= GUC_MAX_SCHED_GROUPS);
+
+	pf_get_groups_preempt_timeouts(gt, vfid, preempt_timeouts, count);
+}
+
 static const char *sched_priority_unit(u32 priority)
 {
 	return priority == GUC_SCHED_PRIORITY_LOW ? "(low)" :
@@ -2712,6 +2800,11 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
 			return -EBADMSG;
 		return pf_provision_groups_exec_quantums(gt, vfid, value, len);
 
+	case GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_KEY:
+		if (len > GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MAX_LEN)
+			return -EBADMSG;
+		return pf_provision_groups_preempt_timeouts(gt, vfid, value, len);
+
 	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
 		if (len != GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN)
 			return -EBADMSG;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index aaed1f490da8..3c6c8b6655af 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -60,6 +60,11 @@ int xe_gt_sriov_pf_config_set_preempt_timeout_locked(struct xe_gt *gt, unsigned
 						     u32 preempt_timeout);
 int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32 preempt_timeout);
 
+void xe_gt_sriov_pf_config_get_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
+						       u32 *preempt_timeout, u32 max_count);
+int xe_gt_sriov_pf_config_set_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
+						      u32 *preempt_timeout, u32 count);
+
 u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index b696a21f87e8..97600edda837 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -58,6 +58,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
 		return "sched_priority";
 	case GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY:
 		return "sched_groups_exec_quantum";
+	case GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_KEY:
+		return "sched_groups_preempt_timeout";
 
 	/* VF CFG threshold keys */
 #define define_threshold_key_to_string_case(TAG, NAME, ...)	\
-- 
2.43.0

