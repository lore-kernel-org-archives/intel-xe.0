Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB810C88E73
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 20:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E7010F23A;
	Mon, 14 Sep 2026 20:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZCDWGb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0601010F23F;
 Mon, 14 Sep 2026 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789418458; x=1820954458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mZDtN3wru3Gt8DKkxxxQaXUh2mzzD1AaYC58ngMlMyo=;
 b=SZCDWGb3ylBisAYytntYa/mVRTavKnYaHHTqVYQNBi2E6IGLPzBbjCTp
 +H97i8E3q/ApJ1Ydp7IPK8Lu+MwZYKXvSLWNP2WDO5KGNONLH09nIE3BG
 2X4jRcS+OqIHLJeYHpHwRjPPw5ok4I3ITTftKaJtozsQDyd93TjiUEh36
 zRfBbkG3JBaf4JiVoXOc2TcPg0giYULVSRnkMdECOtAJClD41FNl9m3Dk
 D6qMA5mWyG/HdU9pD/q0CAratZ39DqnDKMX/INHbJVF8EQh4Jgya1PXaI
 JNeZOnuUw13PWjmsVKkAiVJnaULReep6MyheSbWiyrDQ14ZoFR80xqPrL A==;
X-CSE-ConnectionGUID: cWz/+93JQzWp3HJfgjFHvA==
X-CSE-MsgGUID: udfx2IO7Q1+pmF2ckfzV/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107288132"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107288132"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:40:58 -0700
X-CSE-ConnectionGUID: KtYZgfIARmyT3fOqKz/slw==
X-CSE-MsgGUID: LkzFFwQATRqb+s8Y+Qa+7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270113273"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:40:56 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v7 3/7] drm/xe/pm: avoid reclaim when arming PME wakeup
Date: Mon, 14 Sep 2026 23:40:30 +0300
Message-ID: <20260914204034.309566-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914204034.309566-1-vinod.govindapillai@intel.com>
References: <20260914204034.309566-1-vinod.govindapillai@intel.com>
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

pci_enable_wake() evaluates ACPI methods and allocates with GFP_KERNEL.
xe's shrinker calls xe_pm_runtime_get() and blocks until the runtime
suspend transition completes, so fs_reclaim sits above the runtime PM
lockmap (primed in xe_pm_runtime_lockdep_prime()). An allocation that
enters reclaim from the suspend path can therefore deadlock against a
task already holding fs_reclaim and waiting on that transition.

Wrap the call in memalloc_noreclaim_save()/restore() so the allocation
is satisfied from reserves and never enters reclaim.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3e7ee67c46f9..ddea264b16fd 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1384,11 +1384,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	unsigned int flags;
 	bool pme_enabled;
 	int err;
 
+	flags = memalloc_noreclaim_save();
 	pme_enabled = xe->pme.capable && !xe->d3cold.allowed &&
 		      pci_enable_wake(pdev, PCI_D3hot, true) == 0;
+	memalloc_noreclaim_restore(flags);
 
 	xe_pm_update_pme_enabled(xe, pme_enabled);
 
@@ -1404,7 +1407,10 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	err = xe_pm_runtime_suspend(xe);
 	if (err) {
 		if (pme_enabled) {
+			flags = memalloc_noreclaim_save();
 			pci_enable_wake(pdev, PCI_D3hot, false);
+			memalloc_noreclaim_restore(flags);
+
 			xe_pm_update_pme_enabled(xe, false);
 		}
 
-- 
2.43.0

