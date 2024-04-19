Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28132C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 12:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EB610FEB1;
	Fri, 19 Apr 2024 12:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVFPnwEp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABD710FEAC
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713530161; x=1745066161;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cXwqNBqBlIaI6AbQ7ge+nPHRRYJHtZKw4X7KR/NFIKo=;
 b=GVFPnwEpGw3UHo9vzet2EtpHaTZPMlKJr11ByIN2l5PCyJrMQyNk/AZ+
 5UF2CZpb7JL6rQgoIHPqcA8uOaR+uZPLb5caYIRerm5dV3dg5OBFqL6AA
 bvP4XwJiFQXsumMjADRcifY/weKuPSeB9lcA6QF8KWFrj9pAoVLV6/+Fd
 JVn5cbYlVka2aGZmQxHJKEst1U7lieGA3OrRTuYsvU+wYv13c0sNdQYFH
 r0J2KcNVL4ufTAHmZOdoyAh4ESJjhvGDTTqEoV3poD8ZnLF8JLP8h1Uvr
 YquSi5O7IClTtaLkpyvOozwkgBrLLLUPDRQvd+yjGzxe52dAU+Lf9DzYJ A==;
X-CSE-ConnectionGUID: Ey3Y+2EDTUOviAoX2b7Nsw==
X-CSE-MsgGUID: 7FxHWpJlSJmcMwrZ7cIFuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12918895"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12918895"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:36:01 -0700
X-CSE-ConnectionGUID: y5vsrxeaRsuStyPfncZEmw==
X-CSE-MsgGUID: LtK0MNB7RIWeGTndkeNtVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23185877"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.63.117])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:36:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/pf: Clamp maximum execution quantum to 100s
Date: Fri, 19 Apr 2024 14:35:43 +0200
Message-Id: <20240419123543.270-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240419123543.270-1-michal.wajdeczko@intel.com>
References: <20240419123543.270-1-michal.wajdeczko@intel.com>
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

GuC is silently clamping values of the execution quantum and
preemption timeout KLVs to 100s. Perform explicit clamping on the
driver side as later there is no way to read back values used by
the firmware and we shouldn't mislead the user about actual values
being used when we print them in dmesg or debugfs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 0f5614877770..82d402030b9e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -187,14 +187,20 @@ static int pf_push_vf_cfg_dbs(struct xe_gt *gt, unsigned int vfid, u32 begin, u3
 	return pf_push_vf_cfg_klvs(gt, vfid, 2, klvs, ARRAY_SIZE(klvs));
 }
 
-static int pf_push_vf_cfg_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum)
+static int pf_push_vf_cfg_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 *exec_quantum)
 {
-	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY, exec_quantum);
+	/* GuC will silently clamp values exceeding max */
+	*exec_quantum = min_t(u32, *exec_quantum, GUC_KLV_VF_CFG_EXEC_QUANTUM_MAX_VALUE);
+
+	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY, *exec_quantum);
 }
 
-static int pf_push_vf_cfg_preempt_timeout(struct xe_gt *gt, unsigned int vfid, u32 preempt_timeout)
+static int pf_push_vf_cfg_preempt_timeout(struct xe_gt *gt, unsigned int vfid, u32 *preempt_timeout)
 {
-	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY, preempt_timeout);
+	/* GuC will silently clamp values exceeding max */
+	*preempt_timeout = min_t(u32, *preempt_timeout, GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_MAX_VALUE);
+
+	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY, *preempt_timeout);
 }
 
 static int pf_push_vf_cfg_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
@@ -1604,7 +1610,7 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 	int err;
 
-	err = pf_push_vf_cfg_exec_quantum(gt, vfid, exec_quantum);
+	err = pf_push_vf_cfg_exec_quantum(gt, vfid, &exec_quantum);
 	if (unlikely(err))
 		return err;
 
@@ -1674,7 +1680,7 @@ static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 	int err;
 
-	err = pf_push_vf_cfg_preempt_timeout(gt, vfid, preempt_timeout);
+	err = pf_push_vf_cfg_preempt_timeout(gt, vfid, &preempt_timeout);
 	if (unlikely(err))
 		return err;
 
-- 
2.43.0

