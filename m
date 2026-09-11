Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94518C88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 18:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4161110E2A4;
	Fri, 11 Sep 2026 18:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIMJSAS2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7685510E51C
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 18:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789151588; x=1820687588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=prKlg5zBRIsL8F6Hy935KBZf0+rzq30c5dVnDkYqr3E=;
 b=JIMJSAS2+1+TTqf+gnLrojBv2hd2B7nUc7o1kbNNS/hdFAXsHk7pR9ZJ
 DwhacmbaNNx+ixe9GpXqt8qRJ52aJLQUTFq1NuSgPUEmKKnXHmAM4YlC+
 XEkIRdbWoMWeJJdSUSF4rrEDMkIn4qmzVcSJpJARuWi+V7NT5RLfwPv2g
 owZqOV5lqgDnOHKwWFvAy4DbaFRz5epMoLqAES6vtN0vTADIugh4+3SWg
 prAGVuX3iSP7MTz8LSPGA8i6y6fDw688NZ9fwEJddTkRT2BZebFakgNto
 tN5F+90LyqVuqwIeAaEfot+vTaKP4N6dfZNJOdFVdTi80ehIEDSKLN1Ri g==;
X-CSE-ConnectionGUID: X3JMu+K8S629cIu4aeozMQ==
X-CSE-MsgGUID: UpW50bBiT7uaKUZ4pJqJsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89383773"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89383773"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 11:33:08 -0700
X-CSE-ConnectionGUID: w32fPgjuSgq5C79vGMDBjw==
X-CSE-MsgGUID: UuXrKp1fRFOjkX8M3gHVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="275747979"
Received: from ncataldi-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 11:33:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/pf: Add _locked variant of the priority config
 function
Date: Fri, 11 Sep 2026 20:32:55 +0200
Message-ID: <20260911183257.14999-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911183257.14999-1-michal.wajdeczko@intel.com>
References: <20260911183257.14999-1-michal.wajdeczko@intel.com>
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

We will soon want to provision VFs in a single step, while already
holding the master mutex. Split existing function into two.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 30 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index be0a413ee17c..8de8f42ed4d0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2623,28 +2623,46 @@ static u32 pf_get_sched_priority(struct xe_gt *gt, unsigned int vfid)
 }
 
 /**
- * xe_gt_sriov_pf_config_set_sched_priority() - Configure scheduling priority.
+ * xe_gt_sriov_pf_config_set_sched_priority_locked() - Configure scheduling priority.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  * @priority: requested scheduling priority
  *
- * This function can only be called on PF.
+ * This function can only be called on PF with the master mutex hold.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority)
+int xe_gt_sriov_pf_config_set_sched_priority_locked(struct xe_gt *gt, unsigned int vfid,
+						    u32 priority)
 {
 	int err;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
 	err = pf_provision_sched_priority(gt, vfid, priority);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	return pf_config_set_u32_done(gt, vfid, priority,
-				      xe_gt_sriov_pf_config_get_sched_priority(gt, vfid),
+				      pf_get_sched_priority(gt, vfid),
 				      "scheduling priority", sched_priority_unit, err);
 }
 
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
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_set_sched_priority_locked(gt, vfid, priority);
+}
+
 /**
  * xe_gt_sriov_pf_config_get_sched_priority - Get VF's scheduling priority.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index a56e63f3660a..84246978d21e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -77,6 +77,8 @@ int xe_gt_sriov_pf_config_set_groups_preempt_timeouts(struct xe_gt *gt, unsigned
 
 u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
+int xe_gt_sriov_pf_config_set_sched_priority_locked(struct xe_gt *gt, unsigned int vfid,
+						    u32 priority);
 void xe_gt_sriov_pf_config_force_sched_priority_locked(struct xe_gt *gt, u32 priority);
 
 u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
-- 
2.47.1

