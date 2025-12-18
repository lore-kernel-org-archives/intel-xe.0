Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ADDD711CC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 22:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA47510EBC0;
	Thu, 18 Dec 2025 22:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNAKas9J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E9610EBCF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 22:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766097548; x=1797633548;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zrNp5G2z2U1rRfhDkuCqL//kgKP26HzoYX4edRChg3U=;
 b=fNAKas9JXfnngSLcBSdwFUya78Ocoq/UvLLyCrMUu2o07xBfcaOE0n+Q
 7LtwU8o+TrfcOwaexjtH8DIWbw3tjKNuo558i1YyqMXzrHcBQ4sVXELTl
 pLM2FIxRu1tPxTf239pyPeBcfTH2nYEf3JC0Cw/lbJUtEaMmownOK59XR
 bCuZDqNzvCbb3F4j/nVmAHrCQhUyFvYECT2/EIirl56nZaCGAaAUPYf+o
 P3fxypUzmpgl00qqsnC8pdu5Ex9NmkNn+SrzxJjZEvMUkqWiLRoxNo6ji
 67XfhMRLWXJ6lXjiU8RlY4wN51lHE/QdkDi7TnP37D6WCSzwbMfv46QXX g==;
X-CSE-ConnectionGUID: Z6zQ3/kLRXSjW6+NnnJvzw==
X-CSE-MsgGUID: MnmtV6meSJ+RZ5GVFU/MhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71910911"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="71910911"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:39:08 -0800
X-CSE-ConnectionGUID: Yn5w3E8RQX2zbAla6NdL4g==
X-CSE-MsgGUID: i7OcCeA7T7293wRabHFJPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199176849"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:39:08 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 10/12] drm/xe/pf: Add functions to set exec quantums for each
 group
Date: Thu, 18 Dec 2025 14:38:56 -0800
Message-ID: <20251218223846.1146344-24-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218223846.1146344-14-daniele.ceraolospurio@intel.com>
References: <20251218223846.1146344-14-daniele.ceraolospurio@intel.com>
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
we provide fewer values than the max number of groups (8), the GuC will
set the remaining ones to 0 (infinity).

Note that the new KLV can be used even when groups are disabled (as the
GuC always consider group0 to be active), so we can use it when encoding
the SRIOV config.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |  14 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 165 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   5 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c    |   2 +
 4 files changed, 181 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 60758c034bf7..dc753c317ae0 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -395,6 +395,16 @@ enum  {
  *      groups and cause the latter to be turned off when registered with the
  *      GuC, this config allows the PF to set a threshold for multi-LRC context
  *      registrations by VFs to monitor their behavior.
+ *
+ * _`GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM' : 0x8A0E
+ *      This config sets the VFs-execution-quantum for each scheduling group in
+ *      milliseconds. The driver must provide an array of values, with each of
+ *      them matching the respective group index (first value goes to group 0,
+ *      second to group 1, etc). The setting of group values follows the same
+ *      behavior and rules as setting via GUC_KLV_VF_CFG_EXEC_QUANTUM. Note that
+ *      the GuC always sets the EQ for all groups (even the non-enabled ones),
+ *      so if we provide fewer values than the max the GuC will use 0 for the
+ *      remaining groups. This KLV is available starting from GuC 70.53.0.
  */
 
 #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
@@ -456,6 +466,10 @@ enum  {
 #define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
 #define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
 
+#define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY		0x8a0e
+#define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_MIN_LEN	1u
+#define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_MAX_LEN	GUC_MAX_SCHED_GROUPS
+
 /*
  * Workaround keys:
  */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3e36a3c479a0..c663f349b437 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -195,6 +195,25 @@ static int pf_push_vf_cfg_dbs(struct xe_gt *gt, unsigned int vfid, u32 begin, u3
 	return pf_push_vf_cfg_klvs(gt, vfid, 2, klvs, ARRAY_SIZE(klvs));
 }
 
+static int pf_push_vf_grp_cfg_u32(struct xe_gt *gt, unsigned int vfid,
+				  u16 key, const u32 *values, u32 count)
+{
+	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, GUC_KLV_LEN_MIN + GUC_MAX_SCHED_GROUPS);
+	u32 *klv;
+
+	xe_gt_assert(gt, count && count <= GUC_MAX_SCHED_GROUPS);
+
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
+
+	klv = xe_guc_buf_cpu_ptr(buf);
+
+	klv[0] = FIELD_PREP(GUC_KLV_0_KEY, key) | FIELD_PREP(GUC_KLV_0_LEN, count);
+	memcpy(&klv[1], values, count * sizeof(u32));
+
+	return pf_push_vf_buf_klvs(gt, vfid, 1, buf, GUC_KLV_LEN_MIN + count);
+}
+
 static int pf_push_vf_cfg_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 *exec_quantum)
 {
 	/* GuC will silently clamp values exceeding max */
@@ -268,6 +287,32 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
 	return encode_ggtt(cfg, node->base.start, node->base.size, details);
 }
 
+static u32 encode_config_sched(struct xe_gt *gt, u32 *cfg, u32 n,
+			       const struct xe_gt_sriov_config *config)
+{
+	int i;
+
+	if (xe_sriov_gt_pf_policy_has_multi_group_modes(gt)) {
+		BUILD_BUG_ON(ARRAY_SIZE(config->exec_quantum) >
+			     GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_MAX_LEN);
+
+		cfg[n++] = PREP_GUC_KLV_CONST(GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY,
+					      ARRAY_SIZE(config->exec_quantum));
+		for (i = 0; i < ARRAY_SIZE(config->exec_quantum); i++)
+			cfg[n++] = config->exec_quantum[i];
+
+		/* TODO: add group preempt timeout setting */
+	} else {
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
+		cfg[n++] = config->exec_quantum[0];
+
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
+		cfg[n++] = config->preempt_timeout[0];
+	}
+
+	return n;
+}
+
 /* Return: number of configuration dwords written */
 static u32 encode_config(struct xe_gt *gt, u32 *cfg, const struct xe_gt_sriov_config *config,
 			 bool details)
@@ -298,11 +343,7 @@ static u32 encode_config(struct xe_gt *gt, u32 *cfg, const struct xe_gt_sriov_co
 		cfg[n++] = upper_32_bits(xe_bo_size(config->lmem_obj));
 	}
 
-	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
-	cfg[n++] = config->exec_quantum[0];
-
-	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
-	cfg[n++] = config->preempt_timeout[0];
+	n = encode_config_sched(gt, cfg, n, config);
 
 #define encode_threshold_config(TAG, NAME, VER...) ({					\
 	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER)) {		\
@@ -976,6 +1017,33 @@ static int pf_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u32 value
 	return 0;
 }
 
+static char *to_group_name(const char *what, u8 group, char *buf, size_t size)
+{
+	snprintf(buf, size, "group%u%s%s", group, what ? " " : "", what ?: "");
+	return buf;
+}
+
+static int
+pf_groups_cfg_set_u32_done(struct xe_gt *gt, unsigned int vfid, u32 *values, u32 count,
+			   void (*get_actual)(struct xe_gt *, unsigned int, u32 *, u32),
+			   const char *what, const char *(*unit)(u32), int err)
+{
+	u32 actual[GUC_MAX_SCHED_GROUPS];
+	char group_name[32];
+	u8 g;
+
+	xe_gt_assert(gt, count <= ARRAY_SIZE(actual));
+
+	get_actual(gt, vfid, actual, count);
+
+	for (g = 0; g < count; g++)
+		pf_config_set_u32_done(gt, vfid, values[g], actual[g],
+				       to_group_name(what, g, group_name, sizeof(group_name)),
+				       unit, err);
+
+	return err;
+}
+
 /**
  * xe_gt_sriov_pf_config_set_ctxs - Configure GuC contexts IDs quota for the VF.
  * @gt: the &xe_gt
@@ -1983,6 +2051,88 @@ int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exe
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
+	 * quantum for groups not in the klv payload
+	 */
+	for (i = 0; i < ARRAY_SIZE(config->exec_quantum); i++) {
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
+	u32 count = min_t(u32, max_count, ARRAY_SIZE(config->exec_quantum));
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
+	return pf_groups_cfg_set_u32_done(gt, vfid, exec_quantums, count,
+					  pf_get_groups_exec_quantums,
+					  "execution quantum",
+					  exec_quantum_unit, err);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_groups_exec_quantums() - Get PF/VF sched groups EQs
+ * @gt: the &xe_gt
+ * @vfid: the PF or VF identifier
+ * @exec_quantums: array in which to store the execution quantums values
+ * @count: maximum number of entries to store
+ *
+ * This function can only be called on PF.
+ */
+void xe_gt_sriov_pf_config_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
+						    u32 *exec_quantums, u32 count)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	xe_gt_assert(gt, count <= GUC_MAX_SCHED_GROUPS);
+
+	pf_get_groups_exec_quantums(gt, vfid, exec_quantums, count);
+}
+
 static const char *preempt_timeout_unit(u32 preempt_timeout)
 {
 	return preempt_timeout ? "us" : "(infinity)";
@@ -2557,6 +2707,11 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
 			return -EBADMSG;
 		return pf_provision_exec_quantum(gt, vfid, value[0]);
 
+	case GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY:
+		if (len > GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_MAX_LEN)
+			return -EBADMSG;
+		return pf_provision_groups_exec_quantums(gt, vfid, value, len);
+
 	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
 		if (len != GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN)
 			return -EBADMSG;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 4975730423d7..aaed1f490da8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -46,6 +46,11 @@ int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int
 						  u32 exec_quantum);
 int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum);
 
+void xe_gt_sriov_pf_config_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
+						    u32 *exec_quantum, u32 max_count);
+int xe_gt_sriov_pf_config_set_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
+						   u32 *exec_quantum, u32 count);
+
 u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 					      u32 preempt_timeout);
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index dd504b77cb17..b696a21f87e8 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -56,6 +56,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
 		return "begin_ctx_id";
 	case GUC_KLV_VF_CFG_SCHED_PRIORITY_KEY:
 		return "sched_priority";
+	case GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY:
+		return "sched_groups_exec_quantum";
 
 	/* VF CFG threshold keys */
 #define define_threshold_key_to_string_case(TAG, NAME, ...)	\
-- 
2.43.0

