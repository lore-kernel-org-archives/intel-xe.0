Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A7FC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 14:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA27410E885;
	Fri,  1 Aug 2025 14:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8QGP3sS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D33510E863
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 14:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754058514; x=1785594514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zkpwCoRX7U0NZueBqr1m2YEdTFkITo5khZytQedV43A=;
 b=C8QGP3sS1fPPJ9KKP5GUX6Y+BHdQaExmE46jmYV3fOjqCFPeDjlbJYLj
 g4BatTcPv01umT9qmA1ZNYh67Qw4t7zPFG6lrYksdZDgkwu7rNAHSn/uV
 zbnVoy5kwuKVE3QUS1RL4cxrpI1uxTFcjcReHvrcZlEwM1O/7txO3C9MG
 55tyn4oAiLhyIi5RFv0MdKGBYheoUNlKOfrX1l9WXNBakqxqOdZMbT2DD
 St0o/XoROUKIlcRF/VY4/Ey0JnWyUPxsxo14vT8PnomaGztXhWLvvXxO2
 vx3taz7ZmT89Wcct/blHf1Bq8Jq5sIrII8flF2lzdEWbunWZL3o2a7Dof A==;
X-CSE-ConnectionGUID: aSz8tjorRYmJcj9xiu71Hw==
X-CSE-MsgGUID: 3CABSUJ3R1O9e8sQyAMdCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55466015"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55466015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:28:34 -0700
X-CSE-ConnectionGUID: H5YU2R3EQJa4h0k0x46A7g==
X-CSE-MsgGUID: Gb740+NhRFWCYXwAvclnyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162858531"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:28:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v2 1/3] drm/xe/pf: Disable PF restart worker on device removal
Date: Fri,  1 Aug 2025 16:28:20 +0200
Message-ID: <20250801142822.180530-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801142822.180530-1-michal.wajdeczko@intel.com>
References: <20250801142822.180530-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
v2: add asserts in pf_{init|fini}_workers (Piotr)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 32 ++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 35489fa81825..2ea81d81c0ae 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -47,9 +47,16 @@ static int pf_alloc_metadata(struct xe_gt *gt)
 
 static void pf_init_workers(struct xe_gt *gt)
 {
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	INIT_WORK(&gt->sriov.pf.workers.restart, pf_worker_restart_func);
 }
 
+static void pf_fini_workers(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	disable_work_sync(&gt->sriov.pf.workers.restart);
+}
+
 /**
  * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
  * @gt: the &xe_gt to initialize
@@ -79,6 +86,21 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
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
@@ -95,7 +117,15 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
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

