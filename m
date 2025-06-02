Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A04C5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 22:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3676F10E073;
	Mon,  2 Jun 2025 22:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AV2A0WhU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5DA10E073
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 22:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748902426; x=1780438426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZsI88m3dX1bMRCCrU0qYqP0Q84M2PVPxjajFlG1MJa0=;
 b=AV2A0WhUyanUXlIWMfCRxyCZizSObLlYPmrcI9Ole1epWJ4dwOdAZtGq
 wksIavqUIJ+2LiraRFa6Smo36mYiTmiTboiyWjQNvwV6Zq//95Xvg6xzb
 j2hslwIUfHj56K5VMKqCQI6xeSPzAc4/T3rH67VPpF9PIEIEoKdhYFQXq
 r+QW8g3WJyfuaJlts3GlGamb+HTkAMXjU7nYXPcy7C5S80QRRNvhNhdVZ
 74J3GdAamVX81DBKUjpntm3E9rrvyljiYr9RYPKY9lTek5FpupraLQDMQ
 b6pGz1Wo4TzMHJBy+Z0DqiEaASX0/qxZtQ48glByBaTHKDqzgEssjD23n g==;
X-CSE-ConnectionGUID: ao+z6l2vTEOs26JhK0dQQw==
X-CSE-MsgGUID: 3wKh4aOiQt2k0bys3pl0IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="76310247"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="76310247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 15:13:46 -0700
X-CSE-ConnectionGUID: +fXjnX3xQiuLi7QtHGhEKw==
X-CSE-MsgGUID: eReELDDQRLiILefkkb8sVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="145108594"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 15:13:46 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with no
 display
Date: Mon,  2 Jun 2025 15:11:18 -0700
Message-ID: <20250602221118.306395-1-vivek.kasireddy@intel.com>
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

Some SKUs (or variants) of BMG do not have display capabilities and
are intended to be used as compute-only devices. The Xe driver is
expected to work with such devices by probing/initializing all
other capabilities except display. However, the following crash is
seen when Xe tries to load:

[  115.582833] BUG: kernel NULL pointer dereference, address: 00000000000005d0
[  115.589775] #PF: supervisor write access in kernel mode
[  115.594976] #PF: error_code(0x0002) - not-present page
[  115.600088] PGD 0 P4D 0
[  115.602617] Oops: Oops: 0002 [#1] SMP
[  115.606267] CPU: 14 UID: 0 PID: 1547 Comm: kworker/14:3 Tainted: G     U      E       6.15.0-local+ #62 PREEMPT(voluntary)
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

Therefore, to fix this issue, we need to make intel_display_device_probe()
return NULL if it does not detect the presence of display and ensure
that its callers check for non-NULL display object before probing other
display related capabilities.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++---
 drivers/gpu/drm/i915/i915_driver.c                  | 4 ++--
 drivers/gpu/drm/i915/selftests/mock_gem_device.c    | 4 ++--
 drivers/gpu/drm/xe/display/xe_display.c             | 2 ++
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 1d8c2036d967..c9494cbf5ba7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1705,9 +1705,8 @@ struct intel_display *intel_display_device_probe(struct pci_dev *pdev)
 	return display;
 
 no_display:
-	DISPLAY_INFO(display) = &no_display;
-
-	return display;
+	kfree(display);
+	return NULL;
 }
 
 void intel_display_device_remove(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 3b0bda74697d..0bf8125aee8b 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -757,8 +757,8 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 	display = intel_display_device_probe(pdev);
 	if (IS_ERR(display))
 		return ERR_CAST(display);
-
-	i915->display = display;
+	if (display)
+		i915->display = display;
 
 	return i915;
 }
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index fb8751bd5df0..cb1928d52869 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -186,8 +186,8 @@ struct drm_i915_private *mock_gem_device(void)
 	display = intel_display_device_probe(pdev);
 	if (IS_ERR(display))
 		goto err_device;
-
-	i915->display = display;
+	if (display)
+		i915->display = display;
 
 	dev_pm_domain_set(&pdev->dev, &pm_domain);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 3f92bf51813e..027690e4992b 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -533,6 +533,8 @@ int xe_display_probe(struct xe_device *xe)
 	display = intel_display_device_probe(pdev);
 	if (IS_ERR(display))
 		return PTR_ERR(display);
+	if (!display)
+		goto no_display;
 
 	err = drmm_add_action_or_reset(&xe->drm, display_device_remove, display);
 	if (err)
-- 
2.49.0

