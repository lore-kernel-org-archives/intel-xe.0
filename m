Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B16C61DA3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 14:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7797510E329;
	Tue, 21 Feb 2023 14:52:36 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8508310E323
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676991154; x=1708527154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uIPQ+1JrJ2MdAXFgrl1cOzBwcPjqsr90SxibTS9D/Vk=;
 b=G1SXY2J/CiPWjuCS2RGqc9OeQoQ5I26p8baK9IvhvbVZNzGADi7SPPma
 q89bb/NmPcQEFwf55Bs3P1sotkO9VvU17i7tzPEnezcBxz7cRaqRaA7Uj
 kzPeEmXu+jAWp9NKGBNRnn8MOG/FYC5CPyCS3Y8Ot0rYBLjClQ6426KZl
 UJAmYVwIlaMdLaTmU0+NnKzm4BlN3Gy8Sv1ndKI0T0pHPE3ATI8V97COz
 VV8WoWPFCIA8rhhB9uJWS7/p9E38UeuRPlFd8PI5rAqcgYS/wJrCoiNft
 yGcUisW7ixrKFqLfoHYtNTDrDfvwNWNP9jHFxFWMvJO9Y4tsKr6Xgauyl Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="320781259"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="320781259"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 06:52:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="671676578"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="671676578"
Received: from tcollin2-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.163])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 06:52:32 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 14:52:21 +0000
Message-Id: <20230221145221.105361-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pm: give the core kernel its rpm ref back
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In local_pci_probe() the core kernel increments the rpm for the device,
just before calling into the probe hook. If the driver/device supports
runtime pm it is then meant to drop this ref during probe (like we do in
xe_pm_runtime_init()). However when removing the device we then also need
to give the reference back, otherwise the ref that is dropped in
pci_device_remove() will be unbalanced when for example unloading the
driver, leading to warnings like:

    [ 3808.596345] xe 0000:03:00.0: Runtime PM usage count underflow!

Fix this by incrementing the rpm ref when removing the device.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/193
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 drivers/gpu/drm/xe/xe_pm.c  | 7 +++++++
 drivers/gpu/drm/xe/xe_pm.h  | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 25598de3a1fc..85d337cd8fbe 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -441,6 +441,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
 		return;
 
 	xe_device_remove(xe);
+	xe_pm_runtime_fini(xe);
 	pci_set_drvdata(pdev, NULL);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 44c38e670587..73d81621d960 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -128,6 +128,13 @@ void xe_pm_runtime_init(struct xe_device *xe)
 	pm_runtime_put_autosuspend(dev);
 }
 
+void xe_pm_runtime_fini(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+
+	pm_runtime_get_sync(dev);
+}
+
 int xe_pm_runtime_suspend(struct xe_device *xe)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index b8c5f9558e26..6a885585f653 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -14,6 +14,7 @@ int xe_pm_suspend(struct xe_device *xe);
 int xe_pm_resume(struct xe_device *xe);
 
 void xe_pm_runtime_init(struct xe_device *xe);
+void xe_pm_runtime_fini(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 int xe_pm_runtime_get(struct xe_device *xe);
-- 
2.39.1

