Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3458D29FBB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 15:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13B810E71B;
	Wed,  6 Nov 2024 15:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5MHfGm/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C361B10E70F
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730905993; x=1762441993;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aV5ysLMpRqIhAf/nl0CQqQyWtKVjXotfHGLXFfUHqWc=;
 b=Z5MHfGm/pAZ+PODmTwBv1YwALkbekZaLoyXPl0QG7EzF4jRoYsmyoo8W
 H8Twd1K47J8yyN3Mg0gODIfahGnMHsskUM3+TzBSK4RV0/AHgVukqGuMA
 YlOdhg0DXZbIVP9d9o9doV9gefTqUTnPaSqP4lk60eBm7x1ZmwKiPuY4z
 4t2wJ4TUN9K97/85C3b0X69trGX+VMD7Nf7v1tlizvle06u8KM/Tz7wcs
 /ln4zv8vJDPeQoCydD+uZp1NlZtfL7ZdASN+hnisohcT67UxTeYzWZMem
 0q9YaEINj6436Bth5DylJmFy6usi2GBKx1rumbdYaLIXTi2abcJ3SB39S w==;
X-CSE-ConnectionGUID: +NKNz90WTQm/+DZbXt8D2A==
X-CSE-MsgGUID: XWQOJJl5QX6ZbhjYu20JDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30867683"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30867683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:13 -0800
X-CSE-ConnectionGUID: V6PsDPGPR5+hti8vm/jBJw==
X-CSE-MsgGUID: DH0uqZODS3mF1kN0omCzow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84136790"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 3/5] drm/xe/pf: Add functions to configure VF scheduling
 priority
Date: Wed,  6 Nov 2024 16:12:59 +0100
Message-Id: <20241106151301.2079-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241106151301.2079-1-michal.wajdeczko@intel.com>
References: <20241106151301.2079-1-michal.wajdeczko@intel.com>
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

Add functions to configure PF or VF scheduling priority using the
VF_CFG_SCHED_PRIORITY KLV.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: s/prority/sched_priority (Michal)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 76 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |  3 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  2 +
 3 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 192643d63d22..8d84d2a9ab1e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -207,6 +207,11 @@ static int pf_push_vf_cfg_preempt_timeout(struct xe_gt *gt, unsigned int vfid, u
 	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY, *preempt_timeout);
 }
 
+static int pf_push_vf_cfg_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority)
+{
+	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_SCHED_PRIORITY_KEY, priority);
+}
+
 static int pf_push_vf_cfg_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 {
 	return pf_push_vf_cfg_u64(gt, vfid, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, size);
@@ -1767,6 +1772,77 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
 	return preempt_timeout;
 }
 
+static const char *sched_priority_unit(u32 priority)
+{
+	return priority == GUC_SCHED_PRIORITY_LOW ? "(low)" :
+		priority == GUC_SCHED_PRIORITY_NORMAL ? "(normal)" :
+		priority == GUC_SCHED_PRIORITY_HIGH ? "(high)" :
+		"(?)";
+}
+
+static int pf_provision_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	int err;
+
+	err = pf_push_vf_cfg_sched_priority(gt, vfid, priority);
+	if (unlikely(err))
+		return err;
+
+	config->sched_priority = priority;
+	return 0;
+}
+
+static int pf_get_sched_priority(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+
+	return config->sched_priority;
+}
+
+/**
+ * xe_gt_sriov_pf_config_set_sched_priority() - Configure scheduling priority.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @priority: requested scheduling priority
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority)
+{
+	int err;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	err = pf_provision_sched_priority(gt, vfid, priority);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_config_set_u32_done(gt, vfid, priority,
+				      xe_gt_sriov_pf_config_get_sched_priority(gt, vfid),
+				      "scheduling priority", sched_priority_unit, err);
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_sched_priority - Get VF's scheduling priority.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function can only be called on PF.
+ *
+ * Return: VF's (or PF's) scheduling priority.
+ */
+u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid)
+{
+	u32 priority;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	priority = pf_get_sched_priority(gt, vfid);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return priority;
+}
+
 static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 0c55aa40a1a7..f894e9d4abba 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -44,6 +44,9 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
 int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 					      u32 preempt_timeout);
 
+u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
+
 u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
 					enum xe_guc_klv_threshold_index index);
 int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index 2d3b73d78f14..686c7b3b6d7a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -33,6 +33,8 @@ struct xe_gt_sriov_config {
 	u32 exec_quantum;
 	/** @preempt_timeout: preemption timeout in microseconds. */
 	u32 preempt_timeout;
+	/** @sched_priority: scheduling priority. */
+	u32 sched_priority;
 	/** @thresholds: GuC thresholds for adverse events notifications. */
 	u32 thresholds[XE_GUC_KLV_NUM_THRESHOLDS];
 };
-- 
2.43.0

