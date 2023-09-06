Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B05EE14D3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 21:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BF610E1F5;
	Wed,  6 Sep 2023 21:24:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CF010E71E
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 21:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694035441; x=1725571441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9W7/e8VR+G8gmDeOV018O/nAo1tyIM9VLKSAUKpwHBY=;
 b=iXsFQWWwH+lTUbtnKanEgfav5VWe0R+RWRtoqWgF2qkMWX4X1tr5MF2K
 V4qW2kOsvSkAxO9R2GH8yDxqHQHTD7IH5rm2eASCXxyoCmbCjznp5r7SE
 JltO6FDFrN3Cl0xQOuk9tZbqhNmMNLHEEMFmH9CuNoHaWW0dTtJ8tlcv4
 kxP7goNdtg0+IjRkT56CKjlX4cFG3s1tY4Lt8udXK6x9F7lFvXGUoDieH
 rl44+5DHJBvMrOehMwqsITE1498hXvDOr7l53UxeYzhEAviIEV0iS/r3k
 JQgPLRMfCbK9szStNNVbkXElrw9TBUYSIB3ky+zUAs2OzlZ0e5llE7U1V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362219241"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="362219241"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 14:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="884896775"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="884896775"
Received: from jeknudse-mobl4.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.212.96.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 14:23:48 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Sep 2023 18:23:33 -0300
Message-ID: <20230906212333.61119-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906212333.61119-1-gustavo.sousa@intel.com>
References: <20230906212333.61119-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/1] fixup! drm/xe/display: Implement display
 support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The function xe_display_driver_probe_defer() was supposed to return
-EPROBE_DEFER when not yet ready to continue the probing, but the
current implementation is actually returning 1 instead of the proper
value, which would probably keep the probe operation to be attempted
again.

Fix that by making xe_display_driver_probe_defer() return a boolean just
like intel_display_driver_probe_defer() and return -EPROBE_DEFER on the
caller if necessary.

v2:
  - Make xe_display_driver_probe_defer() return a boolean and return
    -EPROBE_DEFER on the caller. (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 4 ++--
 drivers/gpu/drm/xe/xe_display.h | 2 +-
 drivers/gpu/drm/xe/xe_pci.c     | 5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index a453946ad108..35a4b4cd179a 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -38,9 +38,9 @@
  *				   early on
  * @pdev: PCI device
  *
- * Returns: 0 if probe can continue, -EPROBE_DEFER otherwise
+ * Returns: true if probe needs to be deferred, false otherwise
  */
-int xe_display_driver_probe_defer(struct pci_dev *pdev)
+bool xe_display_driver_probe_defer(struct pci_dev *pdev)
 {
 	if (!enable_display)
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 9e29de012df7..2fa5b239d076 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -12,7 +12,7 @@ struct drm_driver;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 
-int xe_display_driver_probe_defer(struct pci_dev *pdev);
+bool xe_display_driver_probe_defer(struct pci_dev *pdev);
 void xe_display_driver_set_hooks(struct drm_driver *driver);
 
 int xe_display_create(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 24b16863bf3d..dc233a1226bd 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -677,9 +677,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENODEV;
 	}
 
-	err = xe_display_driver_probe_defer(pdev);
-	if (err)
-		return err;
+	if (xe_display_driver_probe_defer(pdev))
+		return -EPROBE_DEFER;
 
 	xe = xe_device_create(pdev, ent);
 	if (IS_ERR(xe))
-- 
2.41.0

