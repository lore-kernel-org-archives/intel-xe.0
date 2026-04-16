Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26A6F8A173
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 13:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DD310E1D7;
	Thu, 16 Apr 2026 13:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tz7Rh9f+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D6410E1D7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776345543; x=1807881543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yjaBnJdA1pI66hLdZD6E+Q1+RnvrexXh7MRGhrCZ3PY=;
 b=Tz7Rh9f+m2jK7Gr2AOrzjWy3hzYAYH4Bhj4WlV8oAkjRe2uRx3yqoitd
 Vp+p/D7WBVyv/skiboRCh4/+A+JXvyHlgyFKXWaQe81MyHZPTVl2dDvUp
 2+HiHJpx7maN1vQHXzFiWUXdI+eW21bqHrCqi9Y/o+LeEY8Y5lAkwkTBD
 qjLCCyPancu5StpIYaXr3rBSliFizcTP+cvanno8KZJYIK7QEqwrrBFsy
 ZbkTTuWZFCYVDb1mHoyajh5luE2SdL/sGVF3vmlrme7N22X/gMS6JiBWJ
 Y6T2ISiSOjtlSjXt3Qah5WOM2dHOLPiPszZUMn2t4/IGGlvKuXhnBnN4p w==;
X-CSE-ConnectionGUID: 41h37RfOQlGCY6pLIiAMSA==
X-CSE-MsgGUID: Ta4RKVGMQNy9bPE1ierZyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94749590"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="94749590"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 06:19:03 -0700
X-CSE-ConnectionGUID: PE7R74QqTzOi1Vs8stF7yQ==
X-CSE-MsgGUID: czsDY+QeTwmRz33IIZDrvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="253976306"
Received: from lslusarc-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.16.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 06:19:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Fix VF's scheduling priority reporting
Date: Thu, 16 Apr 2026 15:18:31 +0200
Message-ID: <20260416131831.7302-1-michal.wajdeczko@intel.com>
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

When preparing number of impacted VFs parameter for the reporting
helper function, we wrongly ended with adding +1 (representing PF)
twice, since local variable total_vfs was already adjusted. This
resulted in printing a message that was referring to an invalid VF:

 [] xe ... [drm] PF: Enabled 2 of 24 VFs
 [] xe ... [drm] PF: Tile0: GT0: PF..VF25 provisioned with 0(low) scheduling priority

Fix variable initialization and adjust the loop accordingly.

Fixes: fbbf73a81b84 ("drm/xe/pf: Force new VFs prorities only once")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index e112aa148dab..2c9b85b84b1b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2626,14 +2626,14 @@ u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid
  */
 void xe_gt_sriov_pf_config_force_sched_priority_locked(struct xe_gt *gt, u32 priority)
 {
-	unsigned int total_vfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt);
+	unsigned int total_vfs = xe_gt_sriov_pf_get_totalvfs(gt);
 	struct xe_gt_sriov_config *config;
 	unsigned int n;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	for (n = 0; n < total_vfs; n++) {
+	for (n = 0; n <= total_vfs; n++) {
 		config = pf_pick_vf_config(gt, VFID(n));
 		config->sched_priority = priority;
 	}
-- 
2.47.1

