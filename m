Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75334C7EE2F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 01:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E1B10E366;
	Thu,  2 Mar 2023 01:35:01 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C18010E35A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 01:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677720899; x=1709256899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wKReuNoluLsj1DgygZ2Ob/0ARtS9JMov2/ZYhfUrJ+0=;
 b=Ow9P35egJlMJp2LezXHwvxVGOflXBVHz/KKOU/USlk37s8o0qqa5og0t
 xpPUP+4fkFAvKa3vxbxTxJqXkBb5rfJ8UqwgSHYadA7yDyj85ReZFKvx/
 lAChtB3vD2iBEvtKjdocl0Uz8VluJDGLBKEv7+v0ERljzsKrdiZOFvsOg
 IVUhSdRIqOIrBvBgOlfENqUCTSo7mGCBYNlB6z94N26ANWKd95gDOMmqD
 nTq+d0X/xGjH2cq+AFsF3nqnpcOYFTiHRW2vPjAU2rcnbC+5WJfOF6sR5
 OZagJA/KpjEAqviRcaAOG40PU8BJu+rkhRbjFeDK878PPpsHcEUvrKdBP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397148699"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="397148699"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798635053"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="798635053"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 17:34:07 -0800
Message-Id: <20230302013411.3262608-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302013411.3262608-1-lucas.demarchi@intel.com>
References: <20230302013411.3262608-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/7] drm/xe/display: Rename and clarify
 xe_display_enable()
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
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rename xe_display_enable() so it doesn't appear that the IP is being
enabled at this point: it's very early in the initialization phase and
this is actually setting up the SW part in the DRM driver to be able do
drive display. While at it, add the kernel doc.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c  |  2 +-
 drivers/gpu/drm/xe/xe_display.c | 12 +++++++++++-
 drivers/gpu/drm/xe/xe_display.h |  5 ++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index afc6fd516f6f..8b0a6cd6fd65 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -169,7 +169,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	struct xe_device *xe;
 	int err;
 
-	err = xe_display_enable(pdev, &driver);
+	err = xe_display_set_driver_hooks(pdev, &driver);
 	if (err)
 		return ERR_PTR(err);
 
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 80fe181e5fd9..19c1f9945911 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -30,7 +30,17 @@
 
 /* Xe device functions */
 
-int xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver)
+/**
+ * xe_display_set_driver_hooks - set driver flags and hooks for display
+ * @pdev: PCI device
+ * @driver: DRM device driver
+ *
+ * Set features and function hooks in @driver that are needed for driving the
+ * display IP, when that is enabled.
+ *
+ * Returns: 0 on success
+ */
+int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver)
 {
 	if (!enable_display)
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 5c09962f4906..cc908d8a7cd9 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -12,7 +12,7 @@
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 
-int xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver);
+int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver);
 
 int xe_display_init_nommio(struct xe_device *xe);
 void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
@@ -43,6 +43,9 @@ void xe_display_pm_resume(struct xe_device *xe);
 
 #else
 
+static inline int
+xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
+
 static inline int
 xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; };
 
-- 
2.39.0

