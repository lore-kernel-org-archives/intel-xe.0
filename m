Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45E0C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 05:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E1010E7C1;
	Thu,  5 Jun 2025 05:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLvfV7kE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D3710E893
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 05:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749102321; x=1780638321;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w+7fyCetZN6e6k9kuFFMrf3dXxwR0IEAOTMjuc3dhGw=;
 b=dLvfV7kElvBREqEEbqOvgmxrt6SuPPRbM03cm1xAQYygm5qpFwB9n3nH
 RgpNQCIPWGhiPmjbTnzJTOhKphL5j+CWGzc4GXIKR/hN5MVzOL5x7sHoC
 zZOnfBnB037i+ivnKoY30V5K+BkCYnM28zodY5oZbVy4y+wFYvfgSdhM+
 ttwwulB3ZFxfUy97Qtv63U/n3OwlBGXBFNqKybmKbCXHoX89k1S4UixIj
 UnFc651WOF+WcrZgDTan78sjHqHFvVMblxvbHRtZbeDfr/GMo2Er6pLBm
 bV9AP3e46dLlojLJCAbkPlInG8lJ/NpVXhFs1AYB7BgcueI6IFBL7UppC A==;
X-CSE-ConnectionGUID: 3U4Gp6bWTr2YB/yI6u67AA==
X-CSE-MsgGUID: 5ah3aUbRRdSBrhzmVgsTHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50320655"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="50320655"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 22:45:20 -0700
X-CSE-ConnectionGUID: t5LzkX7PRrmE5EhKgeKJ3g==
X-CSE-MsgGUID: okKDuGcTQOmDpe4ckL63KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145367984"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 22:45:20 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] Revert "drm/xe/display: use xe->display to decide whether to
 do anything"
Date: Wed,  4 Jun 2025 22:42:47 -0700
Message-ID: <20250605054247.386633-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.49.0
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

This reverts commit 5a9f299f956ef9764f56044cfca7aafa23cea1d1.

The following crash/regression was seen with the reverted commit
on a specific BMG SKU with no display capabilities:

[  115.582833] BUG: kernel NULL pointer dereference, address: 00000000000005d0
[  115.589775] #PF: supervisor write access in kernel mode
[  115.594976] #PF: error_code(0x0002) - not-present page
[  115.600088] PGD 0 P4D 0
[  115.602617] Oops: Oops: 0002 [#1] SMP
[  115.606267] CPU: 14 UID: 0 PID: 1547 Comm: kworker/14:3 Tainted: G 	U      E       6.15.0-local+ #62 PREEMPT(voluntary)
[  115.617332] Tainted: [U]=USER, [E]=UNSIGNED_MODULE
[  115.622100] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPEMI1.R00.3471.D49.2401260852 01/26/2024
[  115.635314] Workqueue: pm pm_runtime_work
[  115.639309] RIP: 0010:_raw_spin_lock+0x17/0x30
[  115.662382] RSP: 0018:ffffd13f82e7bc30 EFLAGS: 00010246
[  115.667581] RAX: 0000000000000000 RBX: ffff8be919076000 RCX: 0000000000000002
[  115.674675] RDX: 0000000000000001 RSI: 000000000000004b RDI: 00000000000005d0
[  115.681775] RBP: ffffd13f82e7bc60 R08: ffffd13f82e7bb00 R09: ffff8beb0c1b06c0
[  115.688869] R10: ffff8be7c034f4c0 R11: fefefefefefefeff R12: fffffffffffffff0
[  115.695965] R13: ffff8be9190762e8 R14: ffff8be919077798 R15: 00000000000005d0
[  115.703062] FS:  0000000000000000(0000) GS:ffff8beb552b6000(0000) knlGS:0000000000000000
[  115.711106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  115.716826] CR2: 00000000000005d0 CR3: 000000024c68d002 CR4: 0000000000f72ef0
[  115.723921] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  115.731015] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[  115.738113] PKRU: 55555554
[  115.740816] Call Trace:
[  115.743258]  <TASK>
[  115.745363]  ? xe_display_flush_cleanup_work+0x92/0x120 [xe]
[  115.751102]  xe_display_pm_runtime_suspend+0x42/0x80 [xe]
[  115.756542]  xe_pm_runtime_suspend+0x11b/0x1b0 [xe]
[  115.761463]  xe_pci_runtime_suspend+0x23/0xd0 [xe]
[  115.766291]  pci_pm_runtime_suspend+0x6b/0x1a0
[  115.770717]  ? pci_pm_thaw_noirq+0xa0/0xa0
[  115.774797]  __rpm_callback+0x48/0x1e0
[  115.778531]  ? pci_pm_thaw_noirq+0xa0/0xa0
[  115.782614]  rpm_callback+0x66/0x70
[  115.786090]  ? pci_pm_thaw_noirq+0xa0/0xa0
[  115.790173]  rpm_suspend+0xe1/0x5e0
[  115.793647]  ? psi_task_switch+0xb8/0x200
[  115.797643]  ? finish_task_switch.isra.0+0x8d/0x270
[  115.802502]  pm_runtime_work+0xa6/0xc0
[  115.806238]  process_one_work+0x186/0x350
[  115.810234]  worker_thread+0x33a/0x480
[  115.813968]  ? process_one_work+0x350/0x350
[  115.818132]  kthread+0x10c/0x220
[  115.821350]  ? kthreads_online_cpu+0x120/0x120
[  115.825774]  ret_from_fork+0x3a/0x60
[  115.829339]  ? kthreads_online_cpu+0x120/0x120
[  115.833768]  ret_from_fork_asm+0x11/0x20
[  115.829339]  ? kthreads_online_cpu+0x120/0x120
[  115.833768]  ret_from_fork_asm+0x11/0x20
[  115.837680]  </TASK>
[  115.839907]  acpi_tad(E) drm(E)
[  115.931629] CR2: 00000000000005d0
[  115.934935] ---[ end trace 0000000000000000 ]---
[  115.939531] RIP: 0010:_raw_spin_lock+0x17/0x30

We cannot yet use xe->display to determine whether display hardware
has been successfully probed/initialized or not. This is because
xe->display would not be set to NULL even with GPUs with no display
capabilities (e.g, GMD_ID_DISPLAY = 0). However, this might change
in the future as Xe and i915 code is unified to deal with no display
cases.

Therefore, for now we have to continue to rely on xe->info.probe_display
(which would be set to false with display-less GPUs) to decide
whether to invoke any display related functions or not.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 40 ++++++++++++-------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index eafe2f093a6c..e2e0771cf274 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -93,7 +93,7 @@ static void xe_display_fini_early(void *arg)
 	struct xe_device *xe = arg;
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_remove_nogem(display);
@@ -107,7 +107,7 @@ int xe_display_init_early(struct xe_device *xe)
 	struct intel_display *display = xe->display;
 	int err;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return 0;
 
 	/* Fake uncore lock */
@@ -163,7 +163,7 @@ int xe_display_init(struct xe_device *xe)
 	struct intel_display *display = xe->display;
 	int err;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return 0;
 
 	err = intel_display_driver_probe(display);
@@ -177,7 +177,7 @@ void xe_display_register(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_register(display);
@@ -188,7 +188,7 @@ void xe_display_unregister(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_power_domains_disable(display);
@@ -201,7 +201,7 @@ void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (master_ctl & DISPLAY_IRQ)
@@ -212,7 +212,7 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (gu_misc_iir & GU_MISC_GSE)
@@ -223,7 +223,7 @@ void xe_display_irq_reset(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	gen11_display_irq_reset(display);
@@ -233,7 +233,7 @@ void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (gt->info.id == XE_GT0)
@@ -274,7 +274,7 @@ static void xe_display_enable_d3cold(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	/*
@@ -297,7 +297,7 @@ static void xe_display_disable_d3cold(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_dmc_resume(display);
@@ -322,7 +322,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	struct intel_display *display = xe->display;
 	bool s2idle = suspend_to_idle();
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	/*
@@ -356,7 +356,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_power_domains_disable(display);
@@ -387,7 +387,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (xe->d3cold.allowed) {
@@ -403,7 +403,7 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
 	struct intel_display *display = xe->display;
 	bool s2idle = suspend_to_idle();
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_power_suspend_late(display, s2idle);
@@ -413,7 +413,7 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (xe->d3cold.allowed)
@@ -431,7 +431,7 @@ void xe_display_pm_shutdown_late(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	/*
@@ -446,7 +446,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_power_resume_early(display);
@@ -456,7 +456,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_dmc_resume(display);
@@ -491,7 +491,7 @@ void xe_display_pm_runtime_resume(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (xe->d3cold.allowed) {
-- 
2.49.0

