Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D62ACDE015
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 11:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF28710F572;
	Fri, 26 Jun 2026 11:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gaN+vH42";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266FD10F572
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 11:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782472544; x=1814008544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IF3nqmLjNy9/27pn5zUD6GV14iNIcEJL9Un1pX0gEY=;
 b=gaN+vH42KJIUjYjRpvpW/9maHOl1DswXNKxz79vzaBrTjlvfoASQetSN
 4MgH30zxXx5BwHdqoX8HVesxfjYIWMMv/e11Pqig8m89vL37ho+e3Ve4Q
 pp/Tk64dqDbvTfXqcCLKTtD7CdxPhtZZytjAVlrFzBGn5yRv5bL9zdqeK
 vxR7W3QgfsWu+0CBAIWfS49sjz63arLRzTEmTS0VhK9VciyfHkufNDkHo
 a66ZadICvgDcJfRnhWXXvo1cskEx+i5ydeJsyP6qk5apAp1VsijvJlHC5
 CNJLaq2DzIzkczhQWABzfwkHOXpP0zxzvJiehudtRhWKk768Xt55gaX0V g==;
X-CSE-ConnectionGUID: nY/HSHq/QnqXT9pAdukGDw==
X-CSE-MsgGUID: LlGvlSIrQ6mmcvZgZseePw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100694995"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="100694995"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:44 -0700
X-CSE-ConnectionGUID: dVJru3i0SRGrain6Dc0Vsw==
X-CSE-MsgGUID: ai7vf0qWR9CI4NXLZi4Nbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="253214364"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.49])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 04:15:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
Date: Fri, 26 Jun 2026 12:15:29 +0100
Message-ID: <20260626111520.487997-20-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626111520.487997-12-matthew.auld@intel.com>
References: <20260626111520.487997-12-matthew.auld@intel.com>
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
v4:
  - Just fallback to manual reserve when vf reported paging engines is
    zero. Will revisit in the future.
v5 (Michal):
  - Convert the assert to a full abort if we ever see non-zero GuC
    paging engine count, on pre-nvl.
  - Move the VF hunk in guc_has_paging_engine() here.
  - Some small tweaks.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 47 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++
 drivers/gpu/drm/xe/xe_guc.c               |  6 +++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  2 +
 drivers/gpu/drm/xe/xe_hw_engine.c         | 32 ++++++++++++++-
 7 files changed, 99 insertions(+), 2 deletions(-)

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
index 0cd9d77f3351..37899fcf5b22 100644
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
+	return 0;
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
+ * xe_gt_sriov_vf_paging_engines - Return the number of paging engine instances
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
index 80562ffadb16..466f0abd9c28 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -29,6 +29,10 @@ struct xe_gt_sriov_vf_runtime {
 	u32 gmdid;
 	/** @uses_sched_groups: whether PF enabled sched groups or not. */
 	bool uses_sched_groups;
+	/**
+	 * @num_paging_engine_instances: number of configured paging engines.
+	 */
+	u32 num_paging_engine_instances;
 	/** @regs_size: size of runtime register array. */
 	u32 regs_size;
 	/** @num_regs: number of runtime registers in the array. */
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 847c4d74d169..244943843018 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1848,6 +1848,9 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
 
 bool xe_guc_has_paging_engine(struct xe_guc *guc)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
+
 	/*
 	 * On newer platforms the GuC now has a dedicated engine class for the
 	 * special PAGING engine, which is the driver reserved BCS engine used
@@ -1857,6 +1860,9 @@ bool xe_guc_has_paging_engine(struct xe_guc *guc)
 	 * need to respect.
 	 */
 
+	if (IS_SRIOV_VF(xe))
+		return xe_gt_sriov_vf_paging_engines(gt);
+
 	/* TODO: Have some way to query this from the GuC? */
 	return false;
 }
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
index 6ba548cc7949..d2c6b8645a62 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -660,7 +660,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	return err;
 }
 
-static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
+static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	unsigned int num_copy_engines = 0, num_paging_engines = 0;
@@ -677,6 +677,29 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
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
+		if (vf_num_paging_engines) {
+			/* This should only be non-zero on NVL-S+ */
+			if (xe_gt_WARN_ON(gt, xe->info.platform < XE_NOVALAKE_S))
+				return -EINVAL;
+
+			num_paging_engines = vf_num_paging_engines;
+		}
+	}
+
+	if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
+		return -EINVAL;
+
 	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
 
 	/* FIXME: Doing a simple logical mapping that works for most hardware */
@@ -698,6 +721,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
 			}
 		}
 	}
+
+	return 0;
 }
 
 static void read_media_fuses(struct xe_gt *gt)
@@ -916,7 +941,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
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

