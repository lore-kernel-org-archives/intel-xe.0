Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4247C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 17:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BC310E37C;
	Wed, 30 Jul 2025 17:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjHD93mY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D4310E222
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 17:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753897765; x=1785433765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6dF5HFjw3bMKyJRwl/QO1Gr5TBeSgAcYJ0dzOdmgsVI=;
 b=mjHD93mYCymeHY+j+GB31E61R63oeSyW7YnlCtdDWR4c3s1PRPRj8hX9
 jWLcRF3OIFLXyqR15xsjzPQC1OQzoyUAWqWvEoyl1gXQVGC5nA+ZKisTL
 RHqDnB3aONltLt8ZMmS/1VFwkN6967zFHvrb438//h3RmYrTj1Wzqa+m2
 mK9hHS0CuwR+BYgZUmxU4f3A4Z9VzjEd5Q7XA7me8ATwFbqUPZF0DbWPi
 XBtxoto/CKelkqJnhZZgDCNf3BnadtYmYE3yuJ7TVfRIox6uadY55UDTQ
 fkNV7BjGIeOAkCi7N0kQOSyAg0V2NatLLtJkHPPRWjRlTpbXGIvOJFn36 A==;
X-CSE-ConnectionGUID: dnlAZd2yTtupPnVmLCzRRA==
X-CSE-MsgGUID: oWk4fEyPSACHNmOa8AK0/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56297913"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56297913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 10:49:25 -0700
X-CSE-ConnectionGUID: 4f6G8X+RSVehiXl6UdTn/Q==
X-CSE-MsgGUID: sGZdYu0JTYqbILP4u+DwvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186744673"
Received: from jroznova-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.96.116])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 10:49:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device removal
Date: Wed, 30 Jul 2025 19:49:11 +0200
Message-ID: <20250730174913.178434-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730174913.178434-1-michal.wajdeczko@intel.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
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

We can't let restart worker run once device is removed, since other
data that it might want to access could be already released.
Explicitly disable worker as part of device cleanup action.

Fixes: a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning to worker")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 30 ++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 35489fa81825..2761319fdc26 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -50,6 +50,11 @@ static void pf_init_workers(struct xe_gt *gt)
 	INIT_WORK(&gt->sriov.pf.workers.restart, pf_worker_restart_func);
 }
 
+static void pf_fini_workers(struct xe_gt *gt)
+{
+	disable_work_sync(&gt->sriov.pf.workers.restart);
+}
+
 /**
  * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
  * @gt: the &xe_gt to initialize
@@ -79,6 +84,21 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 	return 0;
 }
 
+static void pf_fini_action(void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	pf_fini_workers(gt);
+}
+
+static int pf_init_late(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_gt_assert(gt, IS_SRIOV_PF(xe));
+	return devm_add_action_or_reset(xe->drm.dev, pf_fini_action, gt);
+}
+
 /**
  * xe_gt_sriov_pf_init - Prepare SR-IOV PF data structures on PF.
  * @gt: the &xe_gt to initialize
@@ -95,7 +115,15 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	return xe_gt_sriov_pf_migration_init(gt);
+	err = xe_gt_sriov_pf_migration_init(gt);
+	if (err)
+		return err;
+
+	err = pf_init_late(gt);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
-- 
2.47.1

