Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24818CE8E91
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 16:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CDA10E2B0;
	Thu, 24 Oct 2024 16:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8+Gk3ww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19B010E2B0
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 16:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729786782; x=1761322782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6OUkwDX0M9iUZGyc8zPz7lLpglgJfv+KiViLnzznaJY=;
 b=G8+Gk3wwnhkz9m3BlGsYd41DJ8t5nDJCfJDLFeuijP8PMjLmc0gZf5MW
 s79MOfmZF2yRMEgyKh799fQrpCnzszEWbG6IspyORm77VJn0cnopQasyy
 2bzozpZXW6CFRqgwHVFswIYEqNUf0ScHfWLvhnqzTDmfFhY+PY/O6NoCx
 NIo13FbWFMkna0H0QFP6AuRdr//4gu6z3PJR09IDYdpviNyco4unV6a+a
 R91cezInSdAZOn2aLwzuUoebNLY8nX/kZUmcjFKdW/EYZStGrFuwDMeoK
 c33KlUhbkhtJZM1XCMfckSyPDuffFdtL2zWhvFXZs8giGneSrTp7RV1FY A==;
X-CSE-ConnectionGUID: Fs1NezcWR8uYAmE3V3bNaQ==
X-CSE-MsgGUID: vRVsFvNxRcW+t7u20mQY0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29647179"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="29647179"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:19:41 -0700
X-CSE-ConnectionGUID: ul3jS55+RFaKSwzWm55/YQ==
X-CSE-MsgGUID: ixDRgPNNRImtitJOSmyK8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="118101194"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:19:39 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
Date: Thu, 24 Oct 2024 17:37:39 +0200
Message-ID: <20241024153739.994688-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Flush the g2h worker explicitly if TLB timeout happens which is
observed on LNL and that points to the recent scheduling issue with
E-cores on LNL.

This is similar to the recent fix:
commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
response timeout") and should be removed once there is E core
scheduling fix.

v2: Add platform check(Himal)

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.11+
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 773de1f08db9..5aba6ed950b7 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -6,6 +6,7 @@
 #include "xe_gt_tlb_invalidation.h"
 
 #include "abi/guc_actions_abi.h"
+#include "compat-i915-headers/i915_drv.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -72,6 +73,16 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 
+	/*
+	 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
+	 * in case of g2h response timeout")
+	 *
+	 * TODO: Drop this change once workqueue scheduling delay issue is
+	 * fixed on LNL Hybrid CPU.
+	 */
+	if (IS_LUNARLAKE(xe))
+		flush_work(&gt->uc.guc.ct.g2h_worker);
+
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
-- 
2.46.0

