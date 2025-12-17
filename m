Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA199D637DF
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 01:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5371210E9BF;
	Wed, 17 Dec 2025 01:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYH5loJi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0762210E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 01:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765934800; x=1797470800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eX3xCILRSfAajxaxUmvbwL9GTcg7uoZrvC6Z/H6Q0E0=;
 b=MYH5loJiy6Q0MWgO9r5mTkc4rDMqeCRyTGGHxRc71u4i9Zrj3/asQfOj
 dhbKPB4JzxtfSrJwakEE9yqCS29Jz4E0VprZHKvB1H0ppIZS6sZjVpYCo
 OiSCIhSJptbXZaSEPB0QDJf6pl8+GCNM1mr471lCqRypXvZlupZh695i2
 zacPuCAhaH5XeVRb+USqNURZycGcaZXn5MpL4CM6VGeRSvJ0onRYIZtUy
 Wp4g2y0l7coYLXGp5kk/fu/mjZUZCJr+B/g1WtFEyt+Hk7FVTxHUKRqVD
 ++b45otM62I5mJRd292hcgwCEhB33kWh48MQ6ZqL3tdHF48YMLmseSVtG Q==;
X-CSE-ConnectionGUID: 6gMilRdpRZOQbeCQfCbTWg==
X-CSE-MsgGUID: 5+GdwzTSR+a9qPvXXFTfvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67903843"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67903843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:40 -0800
X-CSE-ConnectionGUID: 9f4+O/A7RcG266Mj5VP0/A==
X-CSE-MsgGUID: LkjH3rt9Rn6oMB6z5K8Zbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="202360627"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:39 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 07/13] drm/xe/vf: Check if scheduler groups are enabled
Date: Tue, 16 Dec 2025 17:26:27 -0800
Message-ID: <20251217012620.758252-22-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
References: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
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

VF can check if PF has enabled scheduler groups with a dedicated KLV
query. If scheduler groups are enabled, MLRC queue registrations are
forbidden.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com> #v3
---
v4: split from previous patch, add a check on the returned value for the
query (Michal)
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  7 +++
 drivers/gpu/drm/xe/xe_exec_queue.c        |  3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 67 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  3 +
 6 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index ac10cf3adbc1..39dee685a92c 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -48,11 +48,18 @@
  *      Refers to 32 bit architecture version as reported by the HW IP.
  *      This key is supported on MTL+ platforms only.
  *      Requires GuC ABI 1.2+.
+ *
+ * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
+ *      Tells the driver whether scheduler groups are enabled or not.
+ *      Requires GuC ABI 1.26+
  */
 
 #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
 #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
 
+#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
+#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
+
 /**
  * DOC: GuC Self Config KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c336dcd19020..0b9e074b022f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1114,6 +1114,9 @@ static bool has_sched_groups(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_sched_groups_enabled(gt))
 		return true;
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
+		return true;
+
 	return false;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index b8b391cfc8eb..d91c65dc3496 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -612,6 +612,52 @@ static void vf_cache_gmdid(struct xe_gt *gt)
 	gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
 }
 
+static int vf_query_sched_groups(struct xe_gt *gt)
+{
+	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_uc_fw_version guc_version;
+	u32 value = 0;
+	int err;
+
+	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 26, 0))
+		return 0;
+
+	err = guc_action_query_single_klv32(guc,
+					    GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
+					    &value);
+	if (unlikely(err)) {
+		xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
+				ERR_PTR(err));
+		return err;
+	}
+
+	/* valid values are 0 (disabled) and 1 (enabled) */
+	if (value > 1) {
+		xe_gt_sriov_err(gt, "Invalid sched groups status %u\n", value);
+		return -EPROTO;
+	}
+
+	xe_gt_sriov_dbg(gt, "sched groups %s\n", str_enabled_disabled(value));
+	return value;
+}
+
+static int vf_cache_sched_groups_status(struct xe_gt *gt)
+{
+	int ret;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	ret = vf_query_sched_groups(gt);
+	if (ret < 0)
+		return ret;
+
+	gt->sriov.vf.runtime.uses_sched_groups = ret;
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
  * @gt: the &xe_gt
@@ -641,12 +687,33 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	err = vf_cache_sched_groups_status(gt);
+	if (unlikely(err))
+		return err;
+
 	if (has_gmdid(xe))
 		vf_cache_gmdid(gt);
 
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_vf_sched_groups_enabled() - Check if PF has enabled multiple
+ * scheduler groups
+ * @gt: the &xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: true if shed groups were enabled, false otherwise.
+ */
+bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+
+	return gt->sriov.vf.runtime.uses_sched_groups;
+}
+
 /**
  * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index af40276790fa..7d97189c2d3d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -30,6 +30,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
+bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 510c33116fbd..9a6b5672d569 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
 struct xe_gt_sriov_vf_runtime {
 	/** @gmdid: cached value of the GDMID register. */
 	u32 gmdid;
+	/** @uses_sched_groups: whether PF enabled sched groups or not. */
+	bool uses_sched_groups;
 	/** @regs_size: size of runtime register array. */
 	u32 regs_size;
 	/** @num_regs: number of runtime registers in the array. */
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 1b08b443606e..dd504b77cb17 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -21,6 +21,9 @@
 const char *xe_guc_klv_key_to_string(u16 key)
 {
 	switch (key) {
+	/* GuC Global Config KLVs */
+	case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
+		return "group_scheduling_available";
 	/* VGT POLICY keys */
 	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
 		return "sched_if_idle";
-- 
2.43.0

