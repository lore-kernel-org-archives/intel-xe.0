Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1234CD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 17:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC3610F109;
	Wed, 20 May 2026 17:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3OBh0lZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AF210F109
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779298211; x=1810834211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ikzSWpI6pmqdjgKUo9uD6Ot7mdmetek8Ige95NMJFrs=;
 b=O3OBh0lZa+E4pgv8MXD6MoUaS8jE8k0jsdQuSMlgL7eh2KnL4xBiLLq3
 0nQ0k8kcRxgCJra4t+tYaEuJT/ACkqejmxIXgn4z9vEKeTScfCZCo9ye/
 mcTGxx9Rh+oxgQmPYGHBuU9rl1u20Yf1c6uH+ffV34W8jwYGBt1jSRdY4
 kTEeaXk3LDAQXhINdvrK/fAZxab3zH6MhCS/3XBu053YKPp3qGBizDmtQ
 hT8m7u5PdWzsn/gH2rwD9oX9IMFz7/+e5kKS0O3DLUk1DDi8wRvHpePll
 vvMMIdEw0WQ+oT3dUuBSAzHre7hjTxrCZpvtttAHbslUqkNdnmNRr7Hj5 g==;
X-CSE-ConnectionGUID: 16dtwb5iSbqB496Hq/6fNA==
X-CSE-MsgGUID: rOwcUh/PTSGDBkqVSKWj+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="105667656"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="105667656"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:30:10 -0700
X-CSE-ConnectionGUID: w5L5tiFRRM+mvX8rHPFioQ==
X-CSE-MsgGUID: WVFfEBtOQ7WCHoENnLicXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="270598163"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.159])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:30:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
Date: Wed, 20 May 2026 18:28:55 +0100
Message-ID: <20260520172846.291708-20-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520172846.291708-12-matthew.auld@intel.com>
References: <20260520172846.291708-12-matthew.auld@intel.com>
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
the VF is meant to query it, and mirror it. Size of N, means we have
paging logical index range [0, N-1], with N fewer normal copy engines.

TODO: Check the final GuC ABI version before merging

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 46 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
 drivers/gpu/drm/xe/xe_hw_engine.c         | 15 ++++++++
 5 files changed, 76 insertions(+)

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
index 0cd9d77f3351..d4f6d6618636 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -658,6 +658,48 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
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
+	if (!xe_guc_has_paging_engine(guc)) {
+		/*
+		 * Zero could legit mean there is no special reserved paging
+		 * engine, so to avoid confusion use -1 as unknown/not supported
+		 */
+		xe_gt_sriov_dbg(gt, "num_paging_engines not supported\n");
+		gt->sriov.vf.runtime.num_paging_engine_instances = -1;
+		return 0;
+	}
+
+	err = guc_action_query_single_klv32(guc, UC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
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
@@ -694,6 +736,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
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
index 80562ffadb16..0f6725789f0f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -40,6 +40,11 @@ struct xe_gt_sriov_vf_runtime {
 		/** @regs.value: register value. */
 		u32 value;
 	} *regs;
+	/**
+	 * @num_paging_engine_instances: number of configured paging engines.
+	 * Value is -1 when unknown.
+	 */
+	u32 num_paging_engine_instances;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 77f882cd8ff8..d98e2cd86820 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -669,6 +669,21 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
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
+		if (vf_num_paging_engines != -1)
+			num_paging_engines = vf_num_paging_engines;
+	}
+
 	xe_gt_assert(gt, !(num_copy_engines || num_paging_engines) ||
 		     (num_paging_engines < num_copy_engines));
 
-- 
2.54.0

