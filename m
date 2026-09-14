Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF2FC88E7B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 19:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA4B10F1AD;
	Mon, 14 Sep 2026 19:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAKnzACL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321DE10F1C9;
 Mon, 14 Sep 2026 19:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789415280; x=1820951280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0/UAuCZVpK2dphfme56kH/+eqwrBfN9CrlhD1LOgvvw=;
 b=iAKnzACLwwqIfdL7V7EmH3EbnfO6Vg55+NwqTqw3mQKv7TTIUbVJNkZb
 niSNmac8gEFFmf0ccSiArY8tseAM/XFlmynRqut9Sx0lFdovGxsXl3nOi
 9gM/+mDp5A55PraAV4wY5IAzZqJfdqJAXanRGqchiQkS/Ls54WDZ8Ji2B
 6ohd5pZCdwT17UNemyndYwCmf6Bw5iLdPp34ZsBPzlIp8CIPPFRPgKpKg
 eX8COhxLpghR6MbmjnP4eqksrrczK0jk5JYNDACwtCaAsd5bXfMqscQpc
 lH5OjBUQSoMotPusISt5nogcBheKzXIfGJX8LIiofTaT7u4gVXc8MtiAO Q==;
X-CSE-ConnectionGUID: XWHjACyQQuqVjOejMV8ssg==
X-CSE-MsgGUID: F6/Ot2yVTf+zwdr/Vtn1DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92284848"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92284848"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 12:48:00 -0700
X-CSE-ConnectionGUID: CH68lcTvRXyHeo2r6b1PJA==
X-CSE-MsgGUID: J7WWvlFVQ0Wiyug9vRfstA==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 12:47:58 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v6 3/7] drm/xe/pm: avoid reclaim when arming PME wakeup
Date: Mon, 14 Sep 2026 22:47:33 +0300
Message-ID: <20260914194737.272679-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914194737.272679-1-vinod.govindapillai@intel.com>
References: <20260914194737.272679-1-vinod.govindapillai@intel.com>
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
index e7e6b5a7d738..2fa051579c0b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1385,11 +1385,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
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
 
@@ -1405,7 +1408,10 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	err = xe_pm_runtime_suspend(xe);
 	if (err) {
 		if (xe_pm_pme_enabled(xe)) {
+			flags = memalloc_noreclaim_save();
 			pci_enable_wake(pdev, PCI_D3hot, false);
+			memalloc_noreclaim_restore(flags);
+
 			xe_pm_update_pme_enabled(xe, false);
 		}
 
-- 
2.43.0

