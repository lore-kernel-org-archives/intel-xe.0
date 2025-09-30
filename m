Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E23CAC5B8
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 23:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1E110E611;
	Tue, 30 Sep 2025 23:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GT3YbG5K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BF510E2E4
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 23:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759275341; x=1790811341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a2XZLJuNJIVFGcj+CBRSm+b5iaNQa8KMSfu3efIKKII=;
 b=GT3YbG5K+ggmm9EmVcjYJc/KKObTxhyTT7A4fE06S65dYywi8QnC6yJU
 PFsv3wwkCseXBxh44mnG4S8SNMiRBPctfV/OaFCmVtKpzqac+rxE8EP16
 0AZNzOK248pj/v8vDNkkyH1QfGKUI2FPMAEFkTLJjLYQxrlZXTnW0LxKD
 2w5OgBcZekxtf3feahfozD3HJMY5QtkldUOXQmYNm/WvkANigaydohV4q
 SxHJ3u161lU7VMhd5c9bzjnBjouFditm70PLTKFZFwUQWy871Adqf6Bke
 nB/Udd9k0eipOS/b+apXzzMN/lKuyZKDEhjVY47LtnvulYIiTYCmPFrQh Q==;
X-CSE-ConnectionGUID: AZubcaL0TE+a2/M/o/Bm2g==
X-CSE-MsgGUID: D/7tby42T5iGvA2/vmsHzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72646739"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72646739"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:41 -0700
X-CSE-ConnectionGUID: b27GAvtARFabdolmfGBnkA==
X-CSE-MsgGUID: FDN+POFqS/qal+1h1ozcFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="177775524"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/6] drm/xe/pf: Split VF FLR processing function
Date: Wed,  1 Oct 2025 01:35:23 +0200
Message-ID: <20250930233525.201263-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930233525.201263-1-michal.wajdeczko@intel.com>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
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

On multi-GT platforms (like PTL) we may want to run VF FLR on each
GuC (render and media) in parallel. Split our FLR function to allow
to wait for GT VF FLR completion separately.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 26 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h |  1 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c    |  5 ++++
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 90fb69b0e041..491918d6b93b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -1173,11 +1173,31 @@ static void pf_enter_vf_flr_guc_done(struct xe_gt *gt, unsigned int vfid)
  */
 int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
 {
-	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_FLR_WIP);
-	int err;
-
 	pf_enter_vf_flr_wip(gt, vfid);
 
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_wait_flr() - Wait for a VF FLR to complete.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_wait_flr(struct xe_gt *gt, unsigned int vfid)
+{
+	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_FLR_WIP);
+	int err;
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED))
+		return -EIO;
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP))
+		return 0;
+
 	err = pf_wait_vf_wip_done(gt, vfid, timeout);
 	if (err) {
 		xe_gt_sriov_notice(gt, "VF%u FLR didn't finish in %u ms (%pe)\n",
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index c85e64f099cc..fd256866f628 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -18,6 +18,7 @@ int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_wait_flr(struct xe_gt *gt, unsigned int vfid);
 
 #ifdef CONFIG_PCI_IOV
 int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index fdadd4fbe985..e1c54a8feb07 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -113,5 +113,10 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
 		result = result ? -EUCLEAN : err;
 	}
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_wait_flr(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
 	return result;
 }
-- 
2.47.1

