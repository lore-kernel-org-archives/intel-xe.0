Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB75C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 08:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508D310E52B;
	Thu,  3 Sep 2026 08:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWXlNI3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8310E52B;
 Thu,  3 Sep 2026 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788422686; x=1819958686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oja8beg8zJeVzJyrAwIb5lAQJcg48KPjLae8kK8LPFQ=;
 b=dWXlNI3hpWPvSzYj4ObDH9h+CNWjaxuIKfhU5lwMlJlwnt5EaxUgyYnV
 R0mahjPgjA8PhwkYQM5QG+2Zs1JgyAswukuIxqVl7Q92LPQciMZz2aFVZ
 bsys3oFXryDvuthLZIzsbR84pNBshW3qyO560ne4QwTPXZeU+FwJWgE/x
 rhpLaEHvvmjrMN8LcyJ9q3RLP6em7auEXR+6IJ3d1TidJ0dfLdImYn3e9
 BwsG3m5lNz6ZraUsa+06kfj0eOXoGd8OBCyUL322aBeaJjPP6TvtRojls
 68nHMstSTeQEAjT/JxbbsuMaNEK+men2g6VoczJzm2b803f+kwTnVKiQR g==;
X-CSE-ConnectionGUID: noBQhogWQNm4ZpmYixIjCw==
X-CSE-MsgGUID: zB6Tz5bEQ3akEeaV7DVFPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88919221"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88919221"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 01:04:46 -0700
X-CSE-ConnectionGUID: UvEZ2UDwQbGjU3pIilbYCA==
X-CSE-MsgGUID: hnvCDMWxQwiwzVEhZjPFAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266397396"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.156])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 01:04:43 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v2 5/5] drm/xe/pm: handle the PME capability and runtime pm
 routines
Date: Thu,  3 Sep 2026 11:04:10 +0300
Message-ID: <20260903080410.489411-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903080410.489411-1-vinod.govindapillai@intel.com>
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

During the runtime suspend, check if device is capable of wakeup
from PME. If yes update the helper so that IRQ reset and HPD
polling can be handled accordingly. For PME capable devices,
HPD related IRQs are not reset during runtime suspend and
do not start polling for HPDs every 10s. Instead PME can be
generated from HPDs and corresponding runtime resume calls
can be invoked by PME.

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 10 ++++++++++
 drivers/gpu/drm/xe/display/xe_display.h |  4 ++++
 drivers/gpu/drm/xe/xe_pci.c             | 16 +++++++++++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 7b25c0814674..ff4a74c5c763 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -236,6 +236,16 @@ void xe_display_irq_postinstall(struct xe_device *xe)
 	intel_display_irq_postinstall(display);
 }
 
+void xe_display_set_pme_capable(struct xe_device *xe, bool pme_from_hpd)
+{
+	struct intel_display *display = xe->display;
+
+	if (!xe->info.probe_display)
+		return;
+
+	intel_hpd_set_pme_capable(display, pme_from_hpd);
+}
+
 static bool suspend_to_idle(void)
 {
 #if IS_ENABLED(CONFIG_ACPI_SLEEP)
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 0babb50bfc77..a77a8fa1d802 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -37,6 +37,8 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe);
 
+void xe_display_set_pme_capable(struct xe_device *xe, bool pme_from_hpd);
+
 void xe_display_pm_suspend(struct xe_device *xe);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
@@ -75,6 +77,8 @@ static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
 
+static inline void xe_display_set_pme_capable(struct xe_device *xe, bool pme_from_hpd) {}
+
 static inline void xe_display_pm_suspend(struct xe_device *xe) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f8e16aefd2f8..46a33956c5b4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1385,6 +1385,8 @@ static int xe_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	pci_power_t state = xe->d3cold.allowed ? PCI_D3cold : PCI_D3hot;
+	bool pme_capable = pci_enable_wake(pdev, state, true) == 0;
 	int err;
 
 	/*
@@ -1396,9 +1398,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	xe_assert(xe, !IS_SRIOV_VF(xe));
 	xe_assert(xe, !pci_num_vf(pdev));
 
+	xe_display_set_pme_capable(xe, pme_capable);
+
 	err = xe_pm_runtime_suspend(xe);
-	if (err)
+	if (err) {
+		if (pme_capable) {
+			pci_enable_wake(pdev, state, false);
+			xe_display_set_pme_capable(xe, false);
+		}
+
 		return err;
+	}
 
 	pci_save_state(pdev);
 
@@ -1419,12 +1429,16 @@ static int xe_pci_runtime_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	pci_power_t state = xe->d3cold.allowed ? PCI_D3cold : PCI_D3hot;
 	int err;
 
 	err = pci_set_power_state(pdev, PCI_D0);
 	if (err)
 		return err;
 
+	pci_enable_wake(pdev, state, false);
+	xe_display_set_pme_capable(xe, false);
+
 	pci_restore_state(pdev);
 
 	if (xe->d3cold.allowed) {
-- 
2.43.0

