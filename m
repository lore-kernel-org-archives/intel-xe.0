Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29766FA1FC9
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 15:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD27989233;
	Wed, 22 Apr 2026 15:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONy/jXIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E1489233
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776873041; x=1808409041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uASeF4JlemQbsgMxyHiS5ie6prKn1jR4FFdsOVSSj3U=;
 b=ONy/jXIzXVFmRqWLO8F9OZI3MFWX9r/qnra1tynZx0cjBffqJ7Gt4wTj
 gxIS6B9SYEpSSCt1PL/c9wyE8MBLCioKa/MJgCzSSN1sqR3wymhALQ3UX
 OI4QlfUCFPOniGKNeiBdkMGs84RzzLc/FkF9lrOAASogIlE+WnSeaj1Pr
 CtKkLnrEjPW94iKpiGKpJT9NQg9NFopZLKH90oR8TJjATBaHvFXe9A3M0
 3veXzKNWSM50n1+bOuh+9JaHflrDY4HWrp6RyCaRFqF7oEYsICjxXtZOy
 1Lw0RZXBJLD/PTv0pDCrH5VP5TWFCF3FzhGD8Uzl84ALB7ZlTDmSEkqO+ Q==;
X-CSE-ConnectionGUID: NhN5CzywTs+7PQaxDvjoMA==
X-CSE-MsgGUID: gfcNLtJmR5aVJrEhK1J1Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81692995"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="81692995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:50:41 -0700
X-CSE-ConnectionGUID: qSDw0udtSP2eb9l2hiQGVg==
X-CSE-MsgGUID: KYp721ihSYeIDOoqV5DPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="270505424"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa001.jf.intel.com with ESMTP; 22 Apr 2026 08:50:39 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH] drm/xe/mcr: Remove unused xe_gt_mcr_steering_info_to_dss_id()
Date: Wed, 22 Apr 2026 15:50:25 +0000
Message-Id: <20260422155025.3660484-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

The function xe_gt_mcr_steering_info_to_dss_id() has had no callers
since commit fa597710be6e ("drm/xe/guc: Cache DSS info when creating
capture register list") which removed the only call site in
xe_guc_capture.c. Remove the dead function and its declaration.

No functional change.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 13 -------------
 drivers/gpu/drm/xe/xe_gt_mcr.h |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 7c6f039c880d..4bbe052d6d68 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -430,19 +430,6 @@ void xe_gt_mcr_get_dss_steering(const struct xe_gt *gt, unsigned int dss, u16 *g
 	*instance = dss % gt->steering_dss_per_grp;
 }
 
-/**
- * xe_gt_mcr_steering_info_to_dss_id - Get DSS ID from group/instance steering
- * @gt: GT structure
- * @group: steering group ID
- * @instance: steering instance ID
- *
- * Return: the converted DSS id.
- */
-u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 instance)
-{
-	return group * dss_per_group(gt) + instance;
-}
-
 static void init_steering_dss(struct xe_gt *gt)
 {
 	gt->steering_dss_per_grp = dss_per_group(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 283a1c9770e2..2be9419b8acc 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -33,7 +33,6 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_mcr_get_dss_steering(const struct xe_gt *gt,
 				unsigned int dss, u16 *group, u16 *instance);
-u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 instance);
 
 /*
  * Loop over each DSS and determine the group and instance IDs that
-- 
2.43.0

