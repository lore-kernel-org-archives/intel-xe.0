Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D06CCFA19
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D5910EB7F;
	Fri,  7 Nov 2025 18:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8+/FWRx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65ABD10EB83
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VuxEc+k/BJZmGJd72AcKi8gySpfIMGYLM6eW78fbhWI=;
 b=E8+/FWRxIMasxUuN/RBK70d9eT4gP+OZxfn9uFo3a0IUkVCv+RMrrO3u
 3aogfVIgwnJb4oj+HslNBwyX9HGyWSISaUTv9j5mWJkKPUYHl2Yhsh4qj
 S0B2j3RR8WkKqBlpZsdQXQVvlhiXZcBw04dVy3oWs6Ux+rvoe9rR+RLlI
 U95rIzAfOAzF0FP5uS7D+Q0rl4ugD8CxtFtXUdmLTsR03JrzIAlTvBSAv
 6bwHpCV46PftuiZv73JQbIHD+tXB6xgYsUWil34wD3HY6dFuSNQ7N9ogu
 bkbJymMbUbr9u6xqid6zcXUeZb79DNMwZ4uNrPSMC8i6VnkS6sqK+e/AZ w==;
X-CSE-ConnectionGUID: 7zv8JPV7RY20sHr6SrU7lQ==
X-CSE-MsgGUID: WRNp+EnqQn65zuDpplG34Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733159"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733159"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
X-CSE-ConnectionGUID: Pa0Tri89SoiayZQBothwEg==
X-CSE-MsgGUID: HNSnWF5vQpqEJbMH2jrm2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271227"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 25/33] drm/xe/reg_sr: Use scope-based forcewake
Date: Fri,  7 Nov 2025 10:13:41 -0800
Message-ID: <20251107181315.631642-60-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Use scope-based forcewake to slightly simplify the reg_sr code.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index c155880646d4..328ce3a17af6 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -168,7 +168,6 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 {
 	struct xe_reg_sr_entry *entry;
 	unsigned long reg;
-	struct xe_force_wake_ref fw_ref;
 
 	if (xa_empty(&sr->xa))
 		return;
@@ -178,20 +177,14 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 
 	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_force_wake;
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
+		return;
+	}
 
 	xa_for_each(&sr->xa, reg, entry)
 		apply_one_mmio(gt, entry);
-
-	xe_force_wake_put(fw_ref);
-
-	return;
-
-err_force_wake:
-	xe_force_wake_put(fw_ref);
-	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
 }
 
 /**
-- 
2.51.1

