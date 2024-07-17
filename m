Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098D6C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED8610EAF0;
	Wed, 17 Jul 2024 13:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yy9zURUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB08610EAEE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221722; x=1752757722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pduuGZW549D6u8FMZLdBphbVCPnqS2GW3fZjr7VC+W0=;
 b=Yy9zURUeGiKL+zmHLz455QU6Tm8CBgVqiZ7kwBLGnhDDOZh5UlRnYES/
 4ntDWdtpTDm4DSHb1Q5r9IUeFPHNKO6y5VfBUejWpN2Cl6YucMUPMsCOd
 ER7VW8iuA9avvsbri0zwLuH66/n7A7f/GgM4bCg9rEzSDSHc0ODgMOQXx
 bfnBKTCPekpp7ICBJ9UQXoPFphC7HFsdXsPbfrXu8UsUyLGXeIUXxAsQ/
 yWxEyS8wbyDbFv1Be1GYwAoKsrc2l3As9rk22rWxMQ8CbAe3Us1D5pRv3
 CiMOS/kG+NiKtRnrM+yKkyjvBkvz+appuZpIVjcu2QIGN55Ai5OEyu1EZ w==;
X-CSE-ConnectionGUID: e571R4DuR+eMr/Z5al6nIQ==
X-CSE-MsgGUID: bCVlNU2TSre8x8DdUXEf6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18832046"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18832046"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:42 -0700
X-CSE-ConnectionGUID: z1ZAnYjAS/SnvNtIUkqZRQ==
X-CSE-MsgGUID: 9Shp1pmeSKqL0anIUBBxJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55531998"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:41 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 1/9] drm/xe/hw_engine_group: Introduce xe_hw_engine_group
Date: Wed, 17 Jul 2024 15:07:22 +0200
Message-ID: <20240717130821.1073379-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717130821.1073379-1-francois.dugast@intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
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

A xe_hw_engine_group is a group of hw engines. Two hw engines belong
to the same xe_hw_engine_group if one hw engine cannot make progress
while the other is stuck on a page fault.

Typically, hw engines of the same group share some resources such as
EUs. This depends on the hardware configuration of the platforms.

Currently all engines share EUs so for now only one group is created
and assigned to all hw engines.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 48 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 31 ++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 78b50d3a6501..f8df85d25617 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -431,6 +431,53 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
 }
 
+static struct xe_hw_engine_group *
+hw_engine_group_alloc(struct xe_device *xe)
+{
+	struct xe_hw_engine_group *group;
+
+	group = kzalloc(sizeof(*group), GFP_KERNEL);
+	init_rwsem(&group->mode_sem);
+	INIT_LIST_HEAD(&group->exec_queue_list);
+
+	return group;
+}
+
+static void
+hw_engine_setup_groups(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	/*
+	 * Current partitioning implies all engines share EUs therefore
+	 * belong to the same group, so create this group and assign it
+	 * to all engines.
+	 */
+	group_rcs_ccs = hw_engine_group_alloc(xe);
+	group_bcs = hw_engine_group_alloc(xe);
+	group_vcs_vecs = hw_engine_group_alloc(xe);
+	for_each_hw_engine(hwe, gt, id) {
+		switch (hwe->class) {
+		case XE_ENGINE_CLASS_COPY:
+			hwe->hw_engine_group = group_bcs;
+			break;
+		case XE_ENGINE_CLASS_RENDER:
+		case XE_ENGINE_CLASS_COMPUTE:
+			hwe->hw_engine_group = group_rcs_ccs;
+			break;
+		case XE_ENGINE_CLASS_VIDEO_DECODE:
+		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+			hwe->hw_engine_group = group_vcs_vecs;
+			break;
+		default:
+			drm_warn(&xe->drm, "hw engine class not handled");
+		}
+	}
+}
+
 static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 				 enum xe_hw_engine_id id)
 {
@@ -761,6 +808,7 @@ int xe_hw_engines_init(struct xe_gt *gt)
 	}
 
 	hw_engine_setup_logical_mapping(gt);
+	hw_engine_setup_groups(gt);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 70e6434f150d..c6f7bbcb2a41 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -100,6 +100,35 @@ struct xe_hw_engine_class_intf {
 	} sched_props, defaults;
 };
 
+/** enum xe_hw_engine_group_execution_mode - possible execution modes of a hw engine group */
+enum xe_hw_engine_group_execution_mode {
+	EXEC_MODE_LR,
+	EXEC_MODE_DMA_FENCE,
+};
+
+/**
+ * struct xe_hw_engine_group - Hardware engine group
+ *
+ * hw engines belong to the same group if they share hardware resources in
+ * a way that prevents them from making progress when one is stuck on a
+ * page fault.
+ */
+struct xe_hw_engine_group {
+	/** @exec_queue_list: list of exec queues attached to this xe_hw_engine_group */
+	struct list_head exec_queue_list;
+	/** @resume_work: worker to resume LR exec queues */
+	struct work_struct resume_work;
+	/** @resume_wq: workqueue to resume LR exec queues */
+	struct workqueue_struct *resume_wq;
+	/** @mode_sem: used to protect this group's hardware resources and
+	 * ensure mutual exclusion between execution only in LR mode
+	 * and execution only in DMA_FENCE mode
+	 */
+	struct rw_semaphore mode_sem;
+	/** @cur_mode: current execution mode of this hw engine group */
+	enum xe_hw_engine_group_execution_mode cur_mode;
+};
+
 /**
  * struct xe_hw_engine - Hardware engine
  *
@@ -150,6 +179,8 @@ struct xe_hw_engine {
 	struct xe_hw_engine_class_intf *eclass;
 	/** @oa_unit: oa unit for this hw engine */
 	struct xe_oa_unit *oa_unit;
+	/** @hw_engine_group: the group of hw engines this one belongs to */
+	struct xe_hw_engine_group *hw_engine_group;
 };
 
 /**
-- 
2.43.0

