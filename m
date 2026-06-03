Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8227ECD6E60
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 16:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BE8112123;
	Wed,  3 Jun 2026 16:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jogXQaPV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F374D112122
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780505494; x=1812041494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vT4Tbqb8a5GbS55KOUolWT7y4SYzLryhT5YZw5LMWyI=;
 b=jogXQaPVniv8eGXeZo18HCJvSXjJfbrksqMaQwiB8hOja+VrUVNwb+aH
 irpWxs+cfwwa1SQf5KaaGOXgymEAf3Z383P3s+gYjEObSXJrjsJEgzPeE
 4MTf+HaCj85KOy3uFYu1y8LZlaJMreM1nfAZdb6mLadCGHT1nfbZuquHr
 dEIqWeabsE+aaUxoBv2PDAm6p3xLGeUJNdUZf5FK8jvp3rJI/plfBalo/
 hxqbre7pOJkaLbwO/oxWuzo5dtSxDzkyxNE7mm3pQu64WLS9cTTvcs8XK
 bv4Oz32kObaCqMdpcJtDQpN0F98DLaNvVrB/ZIyVXczCA2S7vLGoA2qQo w==;
X-CSE-ConnectionGUID: CAT1QSggTJm8LoSshyi5gg==
X-CSE-MsgGUID: T4zM2+l+R4OXvoaOaDw0rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81449076"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81449076"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:34 -0700
X-CSE-ConnectionGUID: FIih/V0BRlqgpfYuhtzbpg==
X-CSE-MsgGUID: l/csUAg3SgaoLBYF+SYnqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="239817903"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.195])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
Date: Wed,  3 Jun 2026 17:51:01 +0100
Message-ID: <20260603165052.183465-20-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603165052.183465-12-matthew.auld@intel.com>
References: <20260603165052.183465-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When host PF writes the logical configuration for the GUC PAGING engine,
the VF is meant to query it, and mirror it. Size of N means we have
paging logical index range [0, N-1], with N fewer normal copy engines.

Agreement is that PF will only spawn PAGING engines on NVL-S+, so this
should be zero on older platforms, where we should simply fall back to
the old behaviour.

v2 (Sashiko):
  - We can't call use the guc_has_paging_engine() this early in the VF
    code. With that just unconditionally do the query, if the GuC is new
    enough and take the value as-is. With that drop the -1 special case and
    just let the upper layers figure out the rest.
v3:
  - Also update xe_guc_klv_key_to_string. (Michal)
  - Add kernel-doc for xe_gt_sriov_vf_paging_engines(), plus other
    tweaks. (Michal)
  - Update with final GuC version.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 47 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  2 +
 drivers/gpu/drm/xe/xe_hw_engine.c         | 30 ++++++++++++++-
 6 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 644f5a4226d7..753c049d2fc8 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -52,6 +52,12 @@
  * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
  *      Tells the driver whether scheduler groups are enabled or not.
  *      Requires GuC ABI 1.26+
+ *
+ * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
+ *      Tells the driver the paging engine configuration.
+ *      Paging engine logical instances are guaranteed to be dense starting at
+ *      index 0.
+ *      Requires GuC ABI 1.36+
  */
 
 #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
@@ -60,6 +66,9 @@
 #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
 #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
 
+#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY	0x3003u
+#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN	1u
+
 /**
  * DOC: GuC Self Config KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 0cd9d77f3351..0a11e63f470b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -658,6 +658,33 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
 	return 0;
 }
 
+static int vf_cache_num_paging_engines(struct xe_gt *gt)
+{
+	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_uc_fw_version guc_version;
+	u32 value = 0;
+	int err;
+
+	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 36, 0))
+		return 0;
+
+	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
+					    &value);
+	if (unlikely(err)) {
+		xe_gt_sriov_err(gt,
+				"Failed to obtain the number of paging instances (%pe)\n",
+				ERR_PTR(err));
+		return err;
+	}
+
+	gt->sriov.vf.runtime.num_paging_engine_instances = value;
+
+	xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
+	return err;
+}
+
 /**
  * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
  * @gt: the &xe_gt
@@ -694,6 +721,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
 	if (has_gmdid(xe))
 		vf_cache_gmdid(gt);
 
+	err = vf_cache_num_paging_engines(gt);
+	if (unlikely(err))
+		return err;
+
 	return 0;
 }
 
@@ -731,6 +762,22 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.num_ctxs;
 }
 
+/**
+ * xe_gt_sriov_vf_paging_engines - Query the number of paging engine instances
+ * @gt: the &xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: number of GuC paging engine instances configured by the PF.
+ */
+u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+
+	return gt->sriov.vf.runtime.num_paging_engine_instances;
+}
+
 static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
 {
 	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 79878f21b1da..d171a8242a34 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
 bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
+u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 80562ffadb16..21cb9bc1a341 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
 		/** @regs.value: register value. */
 		u32 value;
 	} *regs;
+	/**
+	 * @num_paging_engine_instances: number of configured paging engines.
+	 */
+	u32 num_paging_engine_instances;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 97600edda837..be992b8da9a1 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -24,6 +24,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
 	/* GuC Global Config KLVs */
 	case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
 		return "group_scheduling_available";
+	case GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY:
+		return "num_paging_engine_instances";
 	/* VGT POLICY keys */
 	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
 		return "sched_if_idle";
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4d7cb8b54b4b..8c5c6d4bca08 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -650,7 +650,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	return err;
 }
 
-static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
+static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	unsigned int num_copy_engines = 0, num_paging_engines = 0;
@@ -667,6 +667,27 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 	if (num_copy_engines && xe->info.has_usm)
 		num_paging_engines = 1;
 
+	if (IS_SRIOV_VF(xe)) {
+		u32 vf_num_paging_engines;
+
+		/*
+		 * PF could in theory reserve multiple paging engines, which
+		 * internally the submission/scheduling backend can load balance
+		 * from. Not something we currently expect, but we are at the
+		 * mercy of the PF, so we just need try our best to mirror the
+		 * paging configuration.
+		 */
+		vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
+		if (xe->info.platform >= XE_NOVALAKE_S)
+			num_paging_engines = vf_num_paging_engines;
+		else
+			/* This should only be non-zero on NVL-S+ */
+			xe_gt_assert(gt, !vf_num_paging_engines);
+	}
+
+	if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
+		return -EINVAL;
+
 	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
 
 	/* FIXME: Doing a simple logical mapping that works for most hardware */
@@ -688,6 +709,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 			}
 		}
 	}
+
+	return 0;
 }
 
 static void read_media_fuses(struct xe_gt *gt)
@@ -906,7 +929,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
 			return err;
 	}
 
-	hw_engine_setup_logical_and_paging_mapping(gt);
+	err = hw_engine_setup_logical_and_paging_mapping(gt);
+	if (err)
+		return err;
+
 	err = xe_hw_engine_setup_groups(gt);
 	if (err)
 		return err;
-- 
2.54.0

