Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649BAD116E4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218D810E735;
	Thu, 27 Nov 2025 01:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xuu8Mc4B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5447410E720
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 01:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764207930; x=1795743930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=slFU2teo3NtmdMcWT7hdaZrEzrWV1KrMjuEvsh9OLcY=;
 b=Xuu8Mc4BeM4/0E7nStOh95sVZqmP95vjCzerdJCWh/cYsQbf+bm8V7OZ
 C88lScz2J2b3XhfCI5pn7g73dF7F2+eB2L3wZvzvK7XoeoHKGIyGkOS3J
 d8fvMd7bjL/71zWNffKZ2DUHbNfyLzHRVW0HgJ34pL/gCQUvZ7fk+malB
 +WQZFz/yCIegf/gwZ18NidmDTmUNVkU4aAbGzK6ZPDLxGOyATJQTuiymz
 4AwXNla/Eiknq7rXK0RfJBYKeEQoFLMMK7/VoLkO1SWPSbD48UEioQZV1
 FXdhXwBa7ayfkKKNkbrTducwLvk/khRTOBH3N7krJykoh69sAf1vD02b5 A==;
X-CSE-ConnectionGUID: G7YDrPsrTwu2ZOhhJRwN8Q==
X-CSE-MsgGUID: miSDaLCSQdmqOi0KbKpLIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70114860"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70114860"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:26 -0800
X-CSE-ConnectionGUID: QYzWgpopS5W/CbVgD4854w==
X-CSE-MsgGUID: vzNAycCGTgSbXaH5RJe1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192753413"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:26 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 08/10] drm/xe/sriov: Add functions to set exec quantums for
 each group
Date: Wed, 26 Nov 2025 17:45:14 -0800
Message-ID: <20251127014507.2323746-20-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
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

The GuC has a new dedicated KLV to set the EQs for the groups. The GuC
always sets the EQs for all the groups (even the ones not enabled). If
we provide fewer values than the max number of grops (8), the GuC will
set the remaining ones to 0.

Based on this, we offer 2 ways of setting the EQs:

1) provide a list of EQs, which is passed straight to the GuC. This will
   cause the GuC to use zero for any missing value as mentioned above
2) provide a single EQ for a specific group. In this case we send all 8
   EQs to the GuC, using the current values for the groups which are not
   being updated.

Note that the new KLV can be used even when groups are disabled (as the
GuC always consider group0 to be active), so we can use it when encoding
the SRIOV config.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |  12 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 244 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   8 +
 drivers/gpu/drm/xe/xe_sriov.c              |  18 ++
 drivers/gpu/drm/xe/xe_sriov.h              |   1 +
 5 files changed, 266 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 48f47e26132d..a0763cc15518 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -383,6 +383,16 @@ enum  {
  * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
  *      This config sets the threshold for LRCA context registration when SRIOV
  *      scheduler groups are enabled.
+ *
+ * _`GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM' : 0x8A0E
+ *      This config sets the VFs-execution-quantum for each scheduling group in
+ *      milliseconds. The driver must provide an array of values, with each of
+ *      them matching the respective group index (first value goes to group 0,
+ *      second to group 1, etc). The setting of group values follows the same
+ *      behavior and rules as setting via GUC_KLV_VF_CFG_EXEC_QUANTUM. Note that
+ *      the GuC always sets the EQ for all groups (even the non-enabled ones),
+ *      so if we provide fewer values than the max the GuC will use 0 for the
+ *      remaining groups.
  */
 
 #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
@@ -444,6 +454,8 @@ enum  {
 #define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
 #define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
 
+#define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY	0x8a0e
+
 /*
  * Workaround keys:
  */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index eb547fedb6da..1bfb25bda432 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -195,6 +195,22 @@ static int pf_push_vf_cfg_dbs(struct xe_gt *gt, unsigned int vfid, u32 begin, u3
 	return pf_push_vf_cfg_klvs(gt, vfid, 2, klvs, ARRAY_SIZE(klvs));
 }
 
+static int pf_push_vf_grp_cfg_u32(struct xe_gt *gt, unsigned int vfid,
+				  u16 key, const u32 *values, u32 count)
+{
+	u32 klv[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT + 1];
+
+	if (!count)
+		return -ENODATA;
+	if (count > GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
+		return -E2BIG;
+
+	klv[0] = FIELD_PREP(GUC_KLV_0_KEY, key) | FIELD_PREP(GUC_KLV_0_LEN, count);
+	memcpy(&klv[1], values, count * sizeof(u32));
+
+	return pf_push_vf_cfg_klvs(gt, vfid, 1, klv, count + 1);
+}
+
 static int pf_push_vf_cfg_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 *exec_quantum)
 {
 	/* GuC will silently clamp values exceeding max */
@@ -269,9 +285,11 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
 }
 
 /* Return: number of configuration dwords written */
-static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
+static u32 encode_config(struct xe_gt *gt, u32 *cfg,
+			 const struct xe_gt_sriov_config *config, bool details)
 {
 	u32 n = 0;
+	int i;
 
 	n += encode_config_ggtt(cfg, config, details);
 
@@ -297,8 +315,15 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
 		cfg[n++] = upper_32_bits(xe_bo_size(config->lmem_obj));
 	}
 
-	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
-	cfg[n++] = config->exec_quantum[0];
+	if (xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)) {
+		cfg[n++] = PREP_GUC_KLV_CONST(GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY,
+					      GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
+		for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++)
+			cfg[n++] = config->exec_quantum[i];
+	} else {
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
+		cfg[n++] = config->exec_quantum[0];
+	}
 
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
 	cfg[n++] = config->preempt_timeout[0];
@@ -328,7 +353,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 		return -ENOBUFS;
 
 	cfg = xe_guc_buf_cpu_ptr(buf);
-	num_dwords = encode_config(cfg, config, true);
+	num_dwords = encode_config(gt, cfg, config, true);
 	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
 
 	if (xe_gt_is_media_type(gt)) {
@@ -952,6 +977,21 @@ static const char *spare_unit(u32 unused)
 	return " spare";
 }
 
+static void __set_u32_done(struct xe_gt *gt, const char *name, u32 value, u32 actual,
+			   const char *what, const char *(*unit)(u32), int err)
+{
+	if (unlikely(err)) {
+		xe_gt_sriov_notice(gt, "Failed to provision %s with %u%s %s (%pe)\n",
+				   name, value, unit(value), what, ERR_PTR(err));
+		xe_gt_sriov_info(gt, "%s provisioning remains at %u%s %s\n",
+				 name, actual, unit(actual), what);
+	} else {
+		/* the actual value may have changed during provisioning */
+		xe_gt_sriov_info(gt, "%s provisioned with %u%s %s\n",
+				 name, actual, unit(actual), what);
+	}
+}
+
 static int pf_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u32 value, u32 actual,
 				  const char *what, const char *(*unit)(u32), int err)
 {
@@ -959,18 +999,47 @@ static int pf_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u32 value
 
 	xe_sriov_function_name(vfid, name, sizeof(name));
 
-	if (unlikely(err)) {
-		xe_gt_sriov_notice(gt, "Failed to provision %s with %u%s %s (%pe)\n",
-				   name, value, unit(value), what, ERR_PTR(err));
-		xe_gt_sriov_info(gt, "%s provisioning remains at %u%s %s\n",
-				 name, actual, unit(actual), what);
-		return err;
+	__set_u32_done(gt, name, value, actual, what, unit, err);
+
+	return err;
+}
+
+static int pf_group_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u8 group,
+					u32 value, u32 actual, const char *what,
+					const char *(*unit)(u32), int err)
+{
+	char name[24];
+
+	xe_sriov_function_and_group_name(vfid, group, name, sizeof(name));
+
+	__set_u32_done(gt, name, value, actual, what, unit, err);
+
+	return err;
+}
+
+static int
+pf_groups_cfg_set_u32_array_done(struct xe_gt *gt, unsigned int vfid,
+				 u32 *values, u32 count,
+				 void (*get_actual)(struct xe_gt *, unsigned int, u32 *, u32),
+				 const char *what, const char *(*unit)(u32), int err)
+{
+	u32 actual[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
+	char name[24];
+	u8 g;
+
+	get_actual(gt, vfid, actual, count);
+
+	for (g = 0; g < count; g++) {
+		xe_sriov_function_and_group_name(vfid, g, name, sizeof(name));
+
+		__set_u32_done(gt, name, values[g], actual[g], what, unit, err);
 	}
 
-	/* the actual value may have changed during provisioning */
-	xe_gt_sriov_info(gt, "%s provisioned with %u%s %s\n",
-			 name, actual, unit(actual), what);
-	return 0;
+	if (!err && count < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
+		xe_gt_sriov_info(gt, "All remaining groups provisioned with 0%s %s\n",
+				 unit(0), what);
+
+	return err;
 }
 
 /**
@@ -1869,11 +1938,16 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
 	return 0;
 }
 
-static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
+static u32 pf_get_group_exec_quantum(struct xe_gt *gt, unsigned int vfid, u8 group)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 
-	return config->exec_quantum[0];
+	return config->exec_quantum[group];
+}
+
+static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_get_group_exec_quantum(gt, vfid, 0);
 }
 
 /**
@@ -1980,6 +2054,137 @@ int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exe
 					   exec_quantum_unit, n, err);
 }
 
+static int pf_provision_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
+					     const u32 *exec_quantums, u32 count)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	int err;
+	int i;
+
+	err = pf_push_vf_grp_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY,
+				     exec_quantums, count);
+	if (unlikely(err))
+		return err;
+
+	/*
+	 * GuC silently clamps values exceeding the max and zeroes out the
+	 * quantum for groups not in the array
+	 */
+	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++) {
+		if (i < count)
+			config->exec_quantum[i] = min_t(u32, exec_quantums[i],
+							GUC_KLV_VF_CFG_EXEC_QUANTUM_MAX_VALUE);
+		else
+			config->exec_quantum[i] = 0;
+	}
+
+	return 0;
+}
+
+static void pf_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
+					u32 *exec_quantums, u32 max_count)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	u32 count = min_t(u32, max_count, GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
+
+	memcpy(exec_quantums, config->exec_quantum, sizeof(u32) * count);
+}
+
+/**
+ * xe_gt_sriov_pf_config_set_groups_exec_quantums() - Configure PF/VF EQs for sched groups.
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ * @exec_quantums: array of requested EQs in milliseconds (0 is infinity)
+ * @count: number of entries in the array
+ *
+ * This function can only be called on PF.
+ * It will log the provisioned value or an error in case of the failure.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
+						   u32 *exec_quantums, u32 count)
+{
+	int err;
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	err = pf_provision_groups_exec_quantums(gt, vfid, exec_quantums, count);
+
+	return pf_groups_cfg_set_u32_array_done(gt, vfid, exec_quantums, count,
+						pf_get_groups_exec_quantums,
+						"execution quantum",
+						exec_quantum_unit, err);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_groups_exec_quantums - Get PF/VF sched groups EQs
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ * @exec_quantums: array in which to store the execution quantums values
+ * @max_count: maximum number of entries to store
+ *
+ * This function can only be called on PF.
+ */
+void xe_gt_sriov_pf_config_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
+						    u32 *exec_quantums, u32 max_count)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_get_groups_exec_quantums(gt, vfid, exec_quantums, max_count);
+}
+
+/**
+ * xe_gt_sriov_pf_config_set_group_exec_quantum - Configure PF/VF EQs for a sched group.
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ * @group: index of the group to configure
+ * @exec_quantum: requested EQs in milliseconds (0 is infinity)
+ *
+ * This function can only be called on PF.
+ * It will log the provisioned value or an error in case of the failure.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_group_exec_quantum(struct xe_gt *gt, unsigned int vfid,
+						 u8 group, u32 exec_quantum)
+{
+	u32 values[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
+	int err;
+
+	xe_gt_assert(gt, group < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	pf_get_groups_exec_quantums(gt, vfid, values, ARRAY_SIZE(values));
+	values[group] = exec_quantum;
+
+	err = pf_provision_groups_exec_quantums(gt, vfid, values, ARRAY_SIZE(values));
+
+	return pf_group_config_set_u32_done(gt, vfid, group, exec_quantum,
+					    pf_get_group_exec_quantum(gt, vfid, group),
+					    "execution quantum", exec_quantum_unit, err);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_group_exec_quantum - Get PF/VF EQ for a sched groups
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ * @group: index of the group for which to get the EQ
+ *
+ * This function can only be called on PF.
+ *
+ * Return: execution quantum in milliseconds (or 0 if infinity).
+ */
+u32 xe_gt_sriov_pf_config_get_group_exec_quantum(struct xe_gt *gt, unsigned int vfid, u8 group)
+{
+	xe_gt_assert(gt, group < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_get_group_exec_quantum(gt, vfid, group);
+}
+
 static const char *preempt_timeout_unit(u32 preempt_timeout)
 {
 	return preempt_timeout ? "us" : "(infinity)";
@@ -2527,7 +2732,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
 			ret = -ENOBUFS;
 		} else {
 			config = pf_pick_vf_config(gt, vfid);
-			ret = encode_config(buf, config, false) * sizeof(u32);
+			ret = encode_config(gt, buf, config, false) * sizeof(u32);
 		}
 	}
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
@@ -2554,6 +2759,11 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
 			return -EBADMSG;
 		return pf_provision_exec_quantum(gt, vfid, value[0]);
 
+	case GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY:
+		if (len > GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
+			return -EBADMSG;
+		return pf_provision_groups_exec_quantums(gt, vfid, value, len);
+
 	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
 		if (len != GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN)
 			return -EBADMSG;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 4975730423d7..aaf6bb824bc9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -46,6 +46,14 @@ int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int
 						  u32 exec_quantum);
 int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum);
 
+void xe_gt_sriov_pf_config_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
+						    u32 *exec_quantum, u32 max_count);
+int xe_gt_sriov_pf_config_set_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
+						   u32 *exec_quantum, u32 count);
+u32 xe_gt_sriov_pf_config_get_group_exec_quantum(struct xe_gt *gt, unsigned int vfid, u8 group);
+int xe_gt_sriov_pf_config_set_group_exec_quantum(struct xe_gt *gt, unsigned int vfid,
+						 u8 group, u32 exec_quantum);
+
 u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 					      u32 preempt_timeout);
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index ea411944609b..eecdd4aaf972 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -159,6 +159,24 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
 	return buf;
 }
 
+/**
+ * xe_sriov_function_and_group_name() - Get SR-IOV Function and group name.
+ * @n: the Function number (identifier) to get name of
+ * @n: the scheduling group to get name of
+ * @buf: the buffer to format to
+ * @size: size of the buffer (shall be at least 18 bytes)
+ *
+ * Return: formatted function name ("PF sched group%u" or "VF%u sched group%u").
+ */
+const char *xe_sriov_function_and_group_name(unsigned int n, u8 g, char *buf, size_t size)
+{
+	if (n)
+		snprintf(buf, size, "VF%u sched group%u", n, g);
+	else
+		snprintf(buf, size, "PF sched group%u", g);
+	return buf;
+}
+
 /**
  * xe_sriov_init_late() - SR-IOV late initialization functions.
  * @xe: the &xe_device to initialize
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 6db45df55615..df2b02cb97d0 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -14,6 +14,7 @@ struct drm_printer;
 
 const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
 const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
+const char *xe_sriov_function_and_group_name(unsigned int n, u8 g, char *buf, size_t size);
 
 void xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
-- 
2.43.0

