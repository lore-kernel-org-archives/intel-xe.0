Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA19C87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 14:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAFA10E889;
	Fri,  1 Aug 2025 14:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ou9OzlS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B006D10E88A
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754058518; x=1785594518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+py58vAoka7HDYGiuNrf6my1xFaY4IIRQNp+fzaknts=;
 b=Ou9OzlS5/A2tYqJjPZrztloJaL71DhiWR5d6yMiLEjzC1LaNYgcRJx9m
 S3fqcbBront2LM/7GguEIm/D/ODvaEPFF7CbXvcwyg8KR0oUnrjo4k4qj
 aIyXa7wXd7xriqXCesIw8zIqy6TRjtsPTq9xb0L9DUwDdBDw73D2e0S9l
 EBvKN7HSaV+osNiDyhhPfInrS9Gbh+hh4u//PI7QfW3c9wbCiKbGv1ftX
 TVtr6YZlvV3f3pvcMHVZCtVbis0i+eIKkpY2gZKlqmrdggV/gr74HSJzb
 bFxe0gGT1LNkdeIBvlqbHEixmSgzTTIvQueNhbRGyZ5AgO0fHRJvtzZvL Q==;
X-CSE-ConnectionGUID: u1Z6W0ccS8O3Pn8Ee6Mmww==
X-CSE-MsgGUID: Q8xyjLgUSNS0YDS2tHO/4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55466028"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55466028"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:28:38 -0700
X-CSE-ConnectionGUID: NypIfjguSBCHvebRMOyc8w==
X-CSE-MsgGUID: 8d8T+wOvTferjDlTdV3+5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162858550"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:28:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v2 3/3] drm/xe/pf: Don't resume device from restart worker
Date: Fri,  1 Aug 2025 16:28:22 +0200
Message-ID: <20250801142822.180530-4-michal.wajdeczko@intel.com>
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

The PF's restart worker shouldn't attempt to resume the device on
its own, since its goal is to finish PF and VFs reprovisioning on
the recently reset GuC. Take extra RPM reference while scheduling
a work and release it from the worker or when we cancel a work.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
v2: fix comments (Jonathan) and rebase
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index bdbd15f3afe3..c4dda87b47cc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -55,7 +55,12 @@ static void pf_init_workers(struct xe_gt *gt)
 static void pf_fini_workers(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	disable_work_sync(&gt->sriov.pf.workers.restart);
+
+	if (disable_work_sync(&gt->sriov.pf.workers.restart)) {
+		xe_gt_sriov_dbg_verbose(gt, "pending restart disabled!\n");
+		/* release an rpm reference taken on the worker's behalf */
+		xe_pm_runtime_put(gt_to_xe(gt));
+	}
 }
 
 /**
@@ -207,8 +212,11 @@ static void pf_cancel_restart(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 
-	if (cancel_work_sync(&gt->sriov.pf.workers.restart))
+	if (cancel_work_sync(&gt->sriov.pf.workers.restart)) {
 		xe_gt_sriov_dbg_verbose(gt, "pending restart canceled!\n");
+		/* release an rpm reference taken on the worker's behalf */
+		xe_pm_runtime_put(gt_to_xe(gt));
+	}
 }
 
 /**
@@ -226,9 +234,12 @@ static void pf_restart(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	xe_pm_runtime_get(xe);
+	xe_gt_assert(gt, !xe_pm_runtime_suspended(xe));
+
 	xe_gt_sriov_pf_config_restart(gt);
 	xe_gt_sriov_pf_control_restart(gt);
+
+	/* release an rpm reference taken on our behalf */
 	xe_pm_runtime_put(xe);
 
 	xe_gt_sriov_dbg(gt, "restart completed\n");
@@ -247,8 +258,13 @@ static void pf_queue_restart(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
-	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
+	/* take an rpm reference on behalf of the worker */
+	xe_pm_runtime_get_noresume(xe);
+
+	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart)) {
 		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
+		xe_pm_runtime_put(xe);
+	}
 }
 
 /**
-- 
2.47.1

