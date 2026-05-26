Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86290CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 14:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4389210E6AC;
	Tue, 26 May 2026 14:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6upbEc9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078FA10E6A7
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779805164; x=1811341164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OARi7yLKy+snYDrxn7Bxd5Q1EEQ2CUp7drTpTpFPEmc=;
 b=I6upbEc9OWdzIbHd+D0SSB/dtMru5UESW8VcH2xNDmy8Me3kzpCr2rxC
 6C114QoXdB7R1SXUaB6Eo2IvwgzZ9uuElGwHiUYyGf9uh/Z4aeBshokvU
 JlkooVw5ud8CYjqE1N+/ijmx4Vjok6wOWBQ5Pn8OeJByhv7+3YLtKSwYp
 +A003e/4Wb88h//OQOY4mJtND61aRWXbzb4NvNXfSKSaRLaKkj0mXwjpE
 i7cpbz+gGn4eacjkwdrTVYA08S2VgoeCZbt7vHD/B3JvHK9LKFuQnvAxv
 IPZY6DY7VRrXLXGfHXuRAsV3SqaB4kP6CS7zOOehlzXtC+vhdjgrQ2jBy A==;
X-CSE-ConnectionGUID: 5ZHGgzM9TOS7YSDVF81JLw==
X-CSE-MsgGUID: CSq9B5zfSyqn464b653oeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84505753"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84505753"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:24 -0700
X-CSE-ConnectionGUID: iUy2X6JAQgWgGOOJyJGfjA==
X-CSE-MsgGUID: 1qQvx3Z3Qda/viCCUf7sxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="247015757"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
Date: Tue, 26 May 2026 15:19:10 +0100
Message-ID: <20260526141901.62207-20-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526141901.62207-12-matthew.auld@intel.com>
References: <20260526141901.62207-12-matthew.auld@intel.com>
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

TODO: Check the final GuC ABI version before merging

v2 (Sashiko):
  - We can't call use the guc_has_paging_engine() this early in the VF
    code. With that just unconditionally do the query, if the GuC is new
    enough and take the value as-is. With that drop the -1 special case and
    just let the upper layers figure out the rest.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 +++
 drivers/gpu/drm/xe/xe_hw_engine.c         | 18 +++++++++++
 5 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 644f5a4226d7..608678f8b18c 100644
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
+ *      Requires GuC ABI 1.35.1+
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
index 0cd9d77f3351..5c1581c9e432 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -658,6 +658,41 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
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
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 35, 1))
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
+u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+
+	return gt->sriov.vf.runtime.num_paging_engine_instances;
+}
+
 /**
  * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
  * @gt: the &xe_gt
@@ -694,6 +729,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
 	if (has_gmdid(xe))
 		vf_cache_gmdid(gt);
 
+	err = vf_cache_num_paging_engines(gt);
+	if (unlikely(err))
+		return err;
+
 	return 0;
 }
 
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
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 980b87988972..62b966bde34f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -669,6 +669,24 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
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
 	if (XE_WARN_ON(!num_copy_engines && num_paging_engines ||
 		       num_paging_engines > num_copy_engines))
 		return -EINVAL;
-- 
2.54.0

