Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BBFC61DC6
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 22:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFA810EE3E;
	Wed, 26 Aug 2026 22:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mW1m+uEw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1DE10EE20;
 Wed, 26 Aug 2026 22:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787784846; x=1819320846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dxSGCG/G45K9pCVmqaGDhqOjSoiMI5JuENEYgXjYf3Q=;
 b=mW1m+uEw0Rp8637zIQs1pFhfTeKAiUFPdhiZzgkq6e7s9Fv/lJ7yERKm
 uMlIQnMHg67g4uLegW2AtxN0z+9nLiqLemAbZwtyx2aF2thT0759xTcFR
 8ylKi/J0szMKH9IVNUmRuH5fL8tR86KtCel2BJBZgAqg+QC6tlbiL44sh
 u2Fc0tnLAn7E7y2nAZleg4truHU/hxQBOhchfOO1gLG1ZRDT0CCDPyVk1
 i8YmNhwiFXohIQFzGjeGxlxSoHKP8KVWQSW+BzKNKQz2OnMtenAPr6g8/
 YNElQh358cdWfTw/PBLckJmNJAySwGQVUc4aQUO6oO/yBj+NX2hBBc01g g==;
X-CSE-ConnectionGUID: xJTQbSCqTXWresjl6jtWxw==
X-CSE-MsgGUID: Wi7MZJOXR8GLB2t+Cx5AGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87223499"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="87223499"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 15:54:06 -0700
X-CSE-ConnectionGUID: mMAUc5ZYQ6S7z5FRZjmimA==
X-CSE-MsgGUID: F3LiDpSRRa2Z7Y+2Iz1n+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="272946067"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 15:54:04 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com, pranay.samala@intel.com
Subject: [PATCH 3/4] drm/xe/pm: allow the device to signal PME from D3hot
Date: Thu, 27 Aug 2026 01:53:36 +0300
Message-ID: <20260826225338.804902-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826225338.804902-1-vinod.govindapillai@intel.com>
References: <20260826225338.804902-1-vinod.govindapillai@intel.com>
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

Make the device a usable wakeup source so it can raise PME while runtime
suspended to D3hot The PCI core marks endpoints wakeup-capable but leaves
them disabled, so pci_enable_wake() returns -EINVAL until the driver opts
in using devm_device_init_wakeup(). D3cold is excluded, as the device
loses power there and cannot signal at all.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 22 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.c  | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h  |  1 +
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c22b40045f7b..42c933390d0d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1217,6 +1217,10 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 
 	pci_set_master(pdev);
 
+	err = devm_device_init_wakeup(&pdev->dev);
+	if (err)
+		return err;
+
 	err = xe_probe_info_early(xe, desc, &probed_info);
 	if (err)
 		return err;
@@ -1381,6 +1385,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	bool pme_armed = false;
 	int err;
 
 	/*
@@ -1392,9 +1397,20 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	xe_assert(xe, !IS_SRIOV_VF(xe));
 	xe_assert(xe, !pci_num_vf(pdev));
 
-	err = xe_pm_runtime_suspend(xe, false);
-	if (err)
+	if (xe_pm_pme_capable(xe)) {
+		pme_armed = !pci_enable_wake(pdev, PCI_D3hot, true);
+		if (!pme_armed)
+			drm_warn(&xe->drm,
+				 "Failed to arm PME for D3hot: %d\n", err);
+	}
+
+	err = xe_pm_runtime_suspend(xe, pme_armed);
+	if (err) {
+		if (pme_armed)
+			pci_enable_wake(pdev, PCI_D3hot, false);
+
 		return err;
+	}
 
 	pci_save_state(pdev);
 
@@ -1421,6 +1437,8 @@ static int xe_pci_runtime_resume(struct device *dev)
 	if (err)
 		return err;
 
+	pci_enable_wake(pdev, PCI_D3hot, false);
+
 	pci_restore_state(pdev);
 
 	if (xe->d3cold.allowed) {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c3a53c5f8b33..e488bfa086ea 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -555,6 +555,31 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
 	return READ_ONCE(xe->pm_callback_task);
 }
 
+/**
+ * xe_pm_pme_capable - Can the device raise PME from runtime D3hot?
+ * @xe: xe device instance
+ *
+ * Only meaningful on the D3hot runtime suspend path: on D3cold the device
+ * loses power and cannot signal a hotplug. Honours the user-visible
+ * power/wakeup policy via device_may_wakeup(), so a user who disables
+ * wakeup falls back to the normal reset-and-poll behaviour rather than
+ * losing both mechanisms.
+ *
+ * Return: true if PME can be armed for D3hot.
+ */
+bool xe_pm_pme_capable(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	if (xe->d3cold.allowed)
+		return false;
+
+	if (!pci_pme_capable(pdev, PCI_D3hot))
+		return false;
+
+	return device_may_wakeup(&pdev->dev);
+}
+
 /**
  * xe_pm_runtime_suspended - Check if runtime_pm state is suspended
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 27455a8d2061..876afd5bebc6 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -23,6 +23,7 @@ void xe_pm_fini(struct xe_device *xe);
 bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe, bool pme_capable);
 int xe_pm_runtime_resume(struct xe_device *xe);
+bool xe_pm_pme_capable(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
-- 
2.43.0

