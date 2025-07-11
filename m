Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127D6C83F1D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 19:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB51810EAB5;
	Fri, 11 Jul 2025 19:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P79Njm4K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D5B10EAC3
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 19:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752262412; x=1783798412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9zgLNHZ717fSdKscf/gcxv3rvhJSmq1tpMjeQNO1HQc=;
 b=P79Njm4KyGzQNqFZ1NtNPGzRb3ZWA8pFsJXWEubUavnS+VYhWfv4Wkry
 ws47GgCK7PiGJNHT5wxD84xMoyrkXOy4Z789IpwZu3v+2UJ50ivhMNgm0
 y/utG8P7oYThs3ddMPrvvRakerMwKgrLrkiLX5fcBwth1W9E3EHsbdfR4
 fxADRJVDK63Q89z+1Eh0iC3EJeWwRmy23v5GaT2gjTFm+AlBZlIg0JlWj
 MNsG1VlDK5QiaS7/UnsTsiLy3Tivw+N7w0XHiph8zIBrQzorlMZJ8Y/i2
 Ikin1sxUJgnqrSvobI8pqq9QyGSkAj1Cur0JLlekGR/UCNARcB8GqoFt9 w==;
X-CSE-ConnectionGUID: mPQk46JZRkuW0R30oIbNAw==
X-CSE-MsgGUID: 4t1oJQqcR/yaWwXpZ3QhXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54651035"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54651035"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:32 -0700
X-CSE-ConnectionGUID: iijzbPasT4Gq8kXsSELPvQ==
X-CSE-MsgGUID: cVoPGMHQQKO8SmT8OID64A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160461994"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 2/6] drm/xe/pf: Resend PF provisioning after GT reset
Date: Fri, 11 Jul 2025 21:33:12 +0200
Message-Id: <20250711193316.1920-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250711193316.1920-1-michal.wajdeczko@intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
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

If we reload the GuC due to suspend/resume or GT reset then we
have to resend not only any VFs provisioning data, but also PF
configuration, like scheduling parameters (EQ, PT), as otherwise
GuC will continue to use default values.

Fixes: 411220808cee ("drm/xe/pf: Restart VFs provisioning after GT reset")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d0cf1d80be07..e84fd44c6598 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2366,6 +2366,21 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 	return err;
 }
 
+static int pf_push_self_config(struct xe_gt *gt)
+{
+	int err;
+
+	err = pf_push_full_vf_config(gt, PFID);
+	if (err) {
+		xe_gt_sriov_err(gt, "Failed to push self configuration (%pe)\n",
+				ERR_PTR(err));
+		return err;
+	}
+
+	xe_gt_sriov_dbg_verbose(gt, "self configuration completed\n");
+	return 0;
+}
+
 static void fini_config(void *arg)
 {
 	struct xe_gt *gt = arg;
@@ -2389,9 +2404,17 @@ static void fini_config(void *arg)
 int xe_gt_sriov_pf_config_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	err = pf_push_self_config(gt);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	if (err)
+		return err;
+
 	return devm_add_action_or_reset(xe->drm.dev, fini_config, gt);
 }
 
@@ -2409,6 +2432,10 @@ void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
 	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
 	unsigned int fail = 0, skip = 0;
 
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	pf_push_self_config(gt);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
 	for (n = 1; n <= total_vfs; n++) {
 		if (xe_gt_sriov_pf_config_is_empty(gt, n))
 			skip++;
-- 
2.47.1

