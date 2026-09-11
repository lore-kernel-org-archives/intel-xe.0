Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3318C88E59
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 18:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4654210F6B5;
	Fri, 11 Sep 2026 18:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fh2eaN+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A838410F6AE
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 18:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789151589; x=1820687589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pr+CTGt2heYzvN4uypsPy/dpoZ0NXC4Y6XGboOGyi6s=;
 b=Fh2eaN+kDlW4YdQ4ShV6ccO9OwAME5Z5ikEJV/vggV3mrHG6+jPk5mIh
 Ph+XoxiVCskVpIpPN6AMTBhlXL3gW0jPOuAFaPEm4cZoHFEsDWrRKjMik
 MSz+acctBUAOq3X2Ug+vF2mP8SLrD7F1Wb2PiVcNlyBSyTV3wRg0pCOex
 RKlPO3NzbDpR5z7LRnFDcExGR3Srdna14eiH/2K/Zaw50S1Ti7RM1bVBF
 0NlBWhV8qjNZWbJenS5WAAyCQwUhZ9B1hXjhKSwxq1Y40jVPo8d0xz/vw
 mrtp2UNACYcDvkf8ASWF1Za8z/mFOY/3OnP57dnP42TQtfrALqoDzrfDy Q==;
X-CSE-ConnectionGUID: cMKO7aViR26ECzqc5tZrkw==
X-CSE-MsgGUID: IqIdwZnaQVu95q8f1gtzwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89383777"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89383777"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 11:33:09 -0700
X-CSE-ConnectionGUID: Qqj7HBffRH2/dFmBDas+3A==
X-CSE-MsgGUID: 4VFY/ZOMTlKTIYvpYor+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="275747988"
Received: from ncataldi-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 11:33:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Add _locked variant of the release config
 function
Date: Fri, 11 Sep 2026 20:32:56 +0200
Message-ID: <20260911183257.14999-3-michal.wajdeczko@intel.com>
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

We will soon want to unprovision all VFs in a single step, while
already holding the master mutex. Split existing function into two.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 8de8f42ed4d0..146981aedf5f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2932,26 +2932,26 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 }
 
 /**
- * xe_gt_sriov_pf_config_release - Release and reset VF configuration.
+ * xe_gt_sriov_pf_config_release_locked() - Release and reset VF configuration.
  * @gt: the &xe_gt
  * @vfid: the VF identifier (can't be PF)
  * @force: force configuration release
  *
+ * Note: The caller must hold the master PF mutex.
  * This function can only be called on PF.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force)
+int xe_gt_sriov_pf_config_release_locked(struct xe_gt *gt, unsigned int vfid, bool force)
 {
 	int err;
 
 	xe_gt_assert(gt, vfid);
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	err = pf_send_vf_cfg_reset(gt, vfid);
 	if (!err || force)
 		pf_release_vf_config(gt, vfid);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	if (unlikely(err)) {
 		xe_gt_sriov_notice(gt, "VF%u unprovisioning failed with error (%pe)%s\n",
@@ -2962,6 +2962,23 @@ int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool forc
 	return force ? 0 : err;
 }
 
+/**
+ * xe_gt_sriov_pf_config_release() - Release and reset VF configuration.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be PF)
+ * @force: force configuration release
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_release_locked(gt, vfid, force);
+}
+
 static void pf_sanitize_ggtt(struct xe_ggtt_node *ggtt_region, unsigned int vfid)
 {
 	if (ggtt_region)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 84246978d21e..d43da8599977 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -90,6 +90,7 @@ int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
 int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
 int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
+int xe_gt_sriov_pf_config_release_locked(struct xe_gt *gt, unsigned int vfid, bool force);
 int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh);
 
 ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size);
-- 
2.47.1

