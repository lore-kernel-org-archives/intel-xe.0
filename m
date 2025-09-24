Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6677CAC5B2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8DA10E6A0;
	Wed, 24 Sep 2025 01:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKaXB2HY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCD510E692
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676570; x=1790212570;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aOhbwbzaYXqrXi/0dE/MAqPDFf913a1R6MYKv2mRzAg=;
 b=BKaXB2HYK2wmw0e4VD9QFFW8IAk6pW4zbOJrV7zsbPgoZHeUeMQVXK87
 sZzghPcPL9lydXfJvVC7vCtEDKn+lWapJFJZL/MZ5LUrXXo3FDKRl6Mo8
 /LPl5Dldhl6Ne3HZFrbkRRUa1M6A8qCB52YcXSaeUZgf5rRthYwlf8T13
 WC2HV38GoblD0dNsMMDzG6gwn/9vAl+fzvTDvj2u2ZMj5V4bjozeuZeLG
 tru9mjCJ4cV5IViD8OigE1XRov/q5OZwgMsYcUfCAc5ccQOH/PXEOW4lN
 3R9IyTG4iodNmoe8cu5/xuSllDjpdG/jESXC9Ydo/QhqG7iSHXL7Urma2 Q==;
X-CSE-ConnectionGUID: z7BaxPNUT5akxAxAl8USCg==
X-CSE-MsgGUID: 6yxkcpCzRwS5KWN4z7u7oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908262"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:09 -0700
X-CSE-ConnectionGUID: 4LwlvHzJSouzjCvNBRivGA==
X-CSE-MsgGUID: LYombslKRryUwOLMU7ZFKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841796"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 16/34] drm/xe/vf: Teardown VF post migration worker on
 driver unload
Date: Tue, 23 Sep 2025 18:15:43 -0700
Message-Id: <20250924011601.888293-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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

Be cautious and ensure the VF post-migration worker is not running
during driver unload.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 +++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 807fdced0228..4eaffad6ebcf 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -811,7 +811,8 @@ static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
 
 	spin_lock(&gt->sriov.vf.migration.lock);
 
-	if (!gt->sriov.vf.migration.recovery_queued) {
+	if (!gt->sriov.vf.migration.recovery_queued ||
+	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
 
@@ -1280,6 +1281,17 @@ static void migration_worker_func(struct work_struct *w)
 	vf_post_migration_recovery(gt);
 }
 
+static void vf_migration_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	spin_lock_irq(&gt->sriov.vf.migration.lock);
+	gt->sriov.vf.migration.recovery_teardown = true;
+	spin_unlock_irq(&gt->sriov.vf.migration.lock);
+
+	cancel_work_sync(&gt->sriov.vf.migration.worker);
+}
+
 /**
  * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
  * @gt: the &xe_gt
@@ -1308,7 +1320,8 @@ int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
 	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
 		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
 
-	return 0;
+	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm,
+					vf_migration_fini, gt);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 61484c7c9a36..beb9978336bb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -59,10 +59,12 @@ struct xe_gt_sriov_vf_runtime {
 struct xe_gt_sriov_vf_migration {
 	/** @migration: VF migration recovery worker */
 	struct work_struct worker;
-	/** @lock: Protects recovery_queued */
+	/** @lock: Protects recovery_queued, teardown */
 	spinlock_t lock;
 	/** @lrc_wa_bb: Scratch memory for LRC WA BB in recovery */
 	void *lrc_wa_bb;
+	/** @recovery_teardown: VF post migration recovery is being torn down */
+	bool recovery_teardown;
 	/** @recovery_queued: VF post migration recovery in queued */
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
-- 
2.34.1

