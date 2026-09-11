Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BC9C88E4C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4777210F558;
	Fri, 11 Sep 2026 08:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkOB4VEt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6943B10F555;
 Fri, 11 Sep 2026 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789113920; x=1820649920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rbwyIKRqHMiIDJ0Zp9azr+oQ/tgyiSXszp5vYBu8eRk=;
 b=RkOB4VEtmFEWTDdpsJ/tEvj4lVqu0hZNbkh7NHmHWQaeV4rPMZjyyX0x
 Mf5MLpD3hi08TLLRM/3WNRc0xLLO+8jXiZrUE2gSxLubHzFF+CmOrBHfr
 k9jmvWzImUM+HphmPvBadnV2jgaSmE11oqaTXTrG9yLQyf23QtTm8t+DX
 8R2wMUb+v0dTdOrSTZtEbBsZoqpw+HWgU+46AmnZfqmBGvQ2tNofl5PVg
 e1oEnU4JmkNsKiS42kfqh29NAgpkjOlObQkRqKLm00BgN0xX5c8pHqY3I
 WajwaUfA+MSon2jryUrSdVOAeQRnb49Le+RGLseAh7GemEQCgPM17AqVI w==;
X-CSE-ConnectionGUID: fJKZN/6kTjKO5BELvatiyA==
X-CSE-MsgGUID: L7WwQVedTcOHI09k9wn2wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101094735"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101094735"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:20 -0700
X-CSE-ConnectionGUID: 22QzHlosTwel9nycBFVHow==
X-CSE-MsgGUID: wOVzmyVAT2S61FvBSL/J9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295333701"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:17 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v5 03/10] drm/xe/pm: avoid reclaim when arming PME wakeup
Date: Fri, 11 Sep 2026 11:04:41 +0300
Message-ID: <20260911080448.778316-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911080448.778316-1-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
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
 drivers/gpu/drm/xe/xe_pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5cb9c140461b..ffad4ae171a0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1385,10 +1385,13 @@ static int xe_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	unsigned int flags;
 	int err;
 
+	flags = memalloc_noreclaim_save();
 	xe->pme.enabled = xe->pme.capable && !xe->d3cold.allowed &&
 			  pci_enable_wake(pdev, PCI_D3hot, true) == 0;
+	memalloc_noreclaim_restore(flags);
 
 	/*
 	 * We hold an additional reference to the runtime PM to keep PF in D0
@@ -1402,7 +1405,9 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	err = xe_pm_runtime_suspend(xe);
 	if (err) {
 		if (xe->pme.enabled) {
+			flags = memalloc_noreclaim_save();
 			pci_enable_wake(pdev, PCI_D3hot, false);
+			memalloc_noreclaim_restore(flags);
 			xe->pme.enabled = false;
 		}
 
-- 
2.43.0

