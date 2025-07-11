Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BECC83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 19:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80A610EAAE;
	Fri, 11 Jul 2025 19:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAfWfx3A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F5710EAB6
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 19:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752262411; x=1783798411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=il1PDzwmTo04HNIx1r68l7rlgcQRjJmg7PPdEcMloKY=;
 b=ZAfWfx3AcItwDgslkbs1RvsHt6a+lClKkUQqpovIZ5CE0hgYi5HPi6pW
 Eckb/vqBhiWEtxxgfaiFt90qFD7FLsHSM4gNUTh6Wddv+UIqMuF2rbv2n
 /OSIs2R/kVPrREISi+C2HUoxgmVpfL8tRVT2cSXZnxhCzWy6aqxHvxt/T
 8MTvp0BUuBubvyIdJymIG0vwL/iUd7k4wqOK/pVDsozDamnXkPCxIPA3o
 VxEKY6AcCc/0ik8ntJ4Y/ieAMy5A/3liRISwAQwJXOS8HrX3fIkzj0bci
 Wl0DB4L66cBNHTfZAuOOGn+AOp6IaA+LZGk2Fo8jA4wjqwNe3fpQbVnhZ A==;
X-CSE-ConnectionGUID: kbJIODOeR6mLWCt58/S/aQ==
X-CSE-MsgGUID: L2r3cJkxTZGIvFz0Z5PbCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54651033"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54651033"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:31 -0700
X-CSE-ConnectionGUID: M7EtNH6CRfChwgbJwJgrzw==
X-CSE-MsgGUID: /yc2NuQMRgSXUV6ED6V33A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160461991"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 1/6] drm/xe/pf: Prepare to stop SR-IOV support prior GT
 reset
Date: Fri, 11 Jul 2025 21:33:11 +0200
Message-Id: <20250711193316.1920-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250711193316.1920-1-michal.wajdeczko@intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
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

As part of the resume or GT reset, the PF driver schedules work
which is then used to complete restarting of the SR-IOV support,
including resending to the GuC configurations of provisioned VFs.

However, in case of short delay between those two actions, which
could be seen by triggering a GT reset on the suspened device:

 $ echo 1 > /sys/kernel/debug/dri/0000:00:02.0/gt0/force_reset

this PF worker might be still busy, which lead to errors due to
just stopped or disabled GuC CTB communication:

 [ ] xe 0000:00:02.0: [drm:xe_gt_resume [xe]] GT0: resumed
 [ ] xe 0000:00:02.0: [drm] GT0: trying reset from force_reset_show [xe]
 [ ] xe 0000:00:02.0: [drm] GT0: reset queued
 [ ] xe 0000:00:02.0: [drm] GT0: reset started
 [ ] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel stopped
 [ ] xe 0000:00:02.0: [drm:guc_ct_send_recv [xe]] GT0: H2G request 0x5503 canceled!
 [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF1 12 config KLVs (-ECANCELED)
 [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF1 configuration (-ECANCELED)
 [ ] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel disabled
 [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF2 12 config KLVs (-ENODEV)
 [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF2 configuration (-ENODEV)
 [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to push 2 of 2 VFs configurations
 [ ] xe 0000:00:02.0: [drm:pf_worker_restart_func [xe]] GT0: PF: restart completed

While this VFs reprovisioning will be successful during next spin
of the worker, to avoid those errors, make sure to cancel restart
worker if we are about to trigger next reset.

Fixes: 411220808cee ("drm/xe/pf: Restart VFs provisioning after GT reset")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c          |  3 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h |  5 +++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index af03e19ef9be..58fe2c4168b0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -835,6 +835,9 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_out;
 	}
 
+	if (IS_SRIOV_PF(gt_to_xe(gt)))
+		xe_gt_sriov_pf_stop_prepare(gt);
+
 	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
 	xe_gt_pagefault_reset(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index c08efca6420e..35489fa81825 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -172,6 +172,25 @@ void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid)
 	pf_clear_vf_scratch_regs(gt, vfid);
 }
 
+static void pf_cancel_restart(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	if (cancel_work_sync(&gt->sriov.pf.workers.restart))
+		xe_gt_sriov_dbg_verbose(gt, "pending restart canceled!\n");
+}
+
+/**
+ * xe_gt_sriov_pf_stop_prepare() - Prepare to stop SR-IOV support.
+ * @gt: the &xe_gt
+ *
+ * This function can only be called on the PF.
+ */
+void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt)
+{
+	pf_cancel_restart(gt);
+}
+
 static void pf_restart(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index f474509411c0..e2b2ff8132dc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -13,6 +13,7 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
 int xe_gt_sriov_pf_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
 void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
+void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
 void xe_gt_sriov_pf_restart(struct xe_gt *gt);
 #else
 static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
@@ -29,6 +30,10 @@ static inline void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
 {
 }
 
+static inline void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt)
+{
+}
+
 static inline void xe_gt_sriov_pf_restart(struct xe_gt *gt)
 {
 }
-- 
2.47.1

