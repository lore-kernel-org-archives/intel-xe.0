Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648BFC3ABBE
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 02:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227DA10E107;
	Wed,  7 May 2025 02:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bffVdaS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D5310E107
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 02:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746584634; x=1778120634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GABIwWL2XDMmxkhKk5kEl6fixAitu2rcCCJunI5isck=;
 b=bffVdaS+SIbdxaPkXvTgFp8qBLugqKKpUf7lqQGK/cHwg5nsqWa1+z89
 ueNNjqnC9Z15UpUEa2Wo73DXIWkwf4DxzX9Qt/5LtMlwriFGELM2nYwlt
 FQ0lEPykRHtDnq8P7vFKAfKQteAapnDHkX7pjvwpJoYzLFom2fqUDoWwT
 tMf3j9g6+3h/ScqJerQGhrtzjiOUmakFApVsLVI8xZJmtw2RW0YX5a1j4
 oklehsPlKrZMX6dB6iMrH3T0Y6J4FggWAXWOxsAI+KNdGu2+mC7Fa2TXK
 JCyXoI/BSDu8MR/T8V8TPAOwcrc/hSgHocdp6UqBTdLwCDCx/zq6WwKP3 A==;
X-CSE-ConnectionGUID: H8dN0xkWReWfDXL5VRsK0A==
X-CSE-MsgGUID: YMqXZGjTQeWcMDnskVbFPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58947762"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="58947762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 19:23:46 -0700
X-CSE-ConnectionGUID: eZ4SFLAMSHesDguuK5XmvA==
X-CSE-MsgGUID: BhbkkYsLSRGyUagKsHYqQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="172999881"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa001.jf.intel.com with ESMTP; 06 May 2025 19:23:44 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Release force wake first then runtime power
Date: Wed,  7 May 2025 02:23:02 +0000
Message-Id: <20250507022302.2187527-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

xe_force_wake_get() is dependent on xe_pm_runtime_get(), so for
the release path, xe_force_wake_put() should be called first then
xe_pm_runtime_put().
Combine the error path and normal path together with goto.

Fixes: 85d547608ef5 ("drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return")
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index a88076e9cc7d..119a55bb7580 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -92,22 +92,23 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	unsigned int fw_ref;
+	int ret = 0;
 
 	xe_pm_runtime_get(xe);
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		xe_pm_runtime_put(xe);
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
-		return -ETIMEDOUT;
+		ret = -ETIMEDOUT;
+		goto fw_put;
 	}
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, p);
 
+fw_put:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(xe);
 
-	return 0;
+	return ret;
 }
 
 static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
-- 
2.25.1

