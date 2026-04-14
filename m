Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2D2F9D0FA
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 22:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EED10E091;
	Tue, 14 Apr 2026 22:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nK74p0ct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53F710E091
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 22:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776204251; x=1807740251;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TaWLVQeEQHLx/Tl5ljFmKh4EfCilVj5hrKa2Ef/EbFw=;
 b=nK74p0ctQ9X1xD8uFpgQdhOObfxJBOll5IxdHQVjz91HJ8FJmjCV1GRo
 gFzPdsb+zzuAy+naUOAlg0M2cil4nikHIxYC9mlVSRIgn6Gp9jubfSp9D
 T3wYIVtLtFOUwmmhwh2a5seW35CAD0TIyIQQ3R8qutHNKsZN9zYTlQ/9I
 /0bqeqIobKW2zH8+gQIFGh6g0jsVDOJvr7um+21Q5Fqb0OWlRblWy2LcC
 spJif7+280SBqbO9Wpk+ZKwDpZDTxksDAgwGtrsfuoWK3XzxjW5W6iMtx
 pgabb+eeZKSCPWI6HvcpNDhk1XV208ajCv/+E4tmqSA2p32/WSG6uyMhJ g==;
X-CSE-ConnectionGUID: nnpwOz/PS7Ouc2VmZhEZ0g==
X-CSE-MsgGUID: WjApXdSpSdmGssNJjhJ2OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77080363"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77080363"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 15:04:10 -0700
X-CSE-ConnectionGUID: h4UKNMCPSNe1jkfxDL/GBw==
X-CSE-MsgGUID: b/GDQcx1S6yKi9U0JLRj9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253620730"
Received: from dut4086lnl.fm.intel.com ([10.105.10.150])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 15:04:10 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com,
	alex.zuo@intel.com
Subject: [PATCH] drm/xe/pf: Streamline fair scheduling error reporting
Date: Tue, 14 Apr 2026 22:04:10 +0000
Message-ID: <20260414220409.119614-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

The function xe_gt_sriov_pf_config_set_fair_sched returns the first
error result it encounters, or zero if the function succeeds.  The way
the function accomplishes this is by only overwriting the result value
if it is already zero.

The function checks this three times, but the first time it does this is
unnecessary because the result value defaults to zero, meaning the
result is always overwritten.  We can streamline this by just directly
assigning result to the return value of pf_bulk_set_exec_quantum instead
of assinging it to err, eliminating the superfluous check.  This also
means we don't need to initialize result separately from err.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index e112aa148dab..bb9811bc64d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2725,8 +2725,7 @@ static bool pf_needs_provision_sched(struct xe_gt *gt, unsigned int num_vfs)
  */
 int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
 {
-	int result = 0;
-	int err;
+	int result, err;
 
 	xe_gt_assert(gt, num_vfs);
 	xe_gt_assert(gt, XE_FAIR_EXEC_QUANTUM_MS);
@@ -2737,8 +2736,7 @@ int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
 	if (!pf_needs_provision_sched(gt, num_vfs))
 		return 0;
 
-	err = pf_bulk_set_exec_quantum(gt, XE_FAIR_EXEC_QUANTUM_MS, PFID, 1 + num_vfs);
-	result = result ?: err;
+	result = pf_bulk_set_exec_quantum(gt, XE_FAIR_EXEC_QUANTUM_MS, PFID, 1 + num_vfs);
 	err = pf_bulk_set_preempt_timeout(gt, XE_FAIR_PREEMPT_TIMEOUT_US, PFID, 1 + num_vfs);
 	result = result ?: err;
 
-- 
2.43.0

