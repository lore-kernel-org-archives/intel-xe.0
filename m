Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0E9C624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B810110E6E8;
	Mon, 31 Aug 2026 08:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmqtcrBp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F34010E6EC
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788163533; x=1819699533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h12gIiEwCvLADHm1O2HWE4Z3N/3NhjLsvGyJwY0F0Gw=;
 b=bmqtcrBpbmVt0xe0aYmrKzP9ZcAoRL7FCtSGQrrlK1G6N3QqQPlkCSBZ
 e1B/o0+SpaiSqdZ0eFwI5jKXnix1heZb4l9GzrhFyI7wiPDr7P5IKwGtD
 mZF4I/UOpc0r1nRhTGElSAafMQUWEA3C2ixulAaNgZ51HvakW7ZKilzc1
 uZr+RDYgtCr77IOebAYkRWig0ujBp153v7sYOwRWcrhuGoSp+rbzFw1M8
 Ax4MHUirGMTvbf/U05WeIPs/NXiXwNyJGJdYJ0K69k7gne/pmu+e9BqWl
 M9m8IU7A2yUsu0ays866W+2Qly3oQ6M1wwKus24eIgLfxA7hqq/Sx4Ubl w==;
X-CSE-ConnectionGUID: FK/9+7waQIeYmfINaUZlGw==
X-CSE-MsgGUID: mZ9bfJFbTEikwd1gMY7Ymw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92251041"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92251041"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:05:33 -0700
X-CSE-ConnectionGUID: Qcb0+GQ5Sg6jMVgIwiPsFw==
X-CSE-MsgGUID: OMU4ds+7RluocePye9SlbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="268172177"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:05:30 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 4/4] drm/xe/gt: Report GT reset failure using SIGID
Date: Mon, 31 Aug 2026 13:35:07 +0530
Message-ID: <20260831080507.2364687-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831080507.2364687-1-arvind.yadav@intel.com>
References: <20260831080507.2364687-1-arvind.yadav@intel.com>
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

Route the GT reset failure log through the structured SIGID logging helper.

Failure to complete the full graphics reset means GT reset did not finish
as expected. Use the GT component, which maps to XE_SIGID_GT_TDR, and pass
the reset errno value to the helper.

Also update the message to describe the actual failure. The driver does not
clear GRDOM_FULL directly; the reset should complete and clear it within
the timeout.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
v5:
 - Kept this patch limited to the GT reset failure path. (Michal)
 - Improved the GRDOM_FULL failure message to describe that full graphics
   reset did not complete. (Michal)

 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6805e0d3bf21..f06fc78af11c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -824,8 +824,8 @@ static int do_gt_reset(struct xe_gt *gt)
 	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
 	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
 	if (err)
-		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
-			  ERR_PTR(err));
+		xe_log_err(gt, GT, err,
+			   "full graphics reset not completed in %u ms\n", 5000);
 
 	xe_gsc_wa_14015076503(gt, false);
 
-- 
2.43.0

