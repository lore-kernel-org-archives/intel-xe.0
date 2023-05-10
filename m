Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92AAC7EE24
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 19:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5FC10E515;
	Wed, 10 May 2023 19:54:51 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D99810E513
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683748488; x=1715284488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+wfMUJyBiccvKDsKciv6TtZXTlylXGcxQHX1c3gkicE=;
 b=JlIjcax+qI0R5aTqaxXtfYhkZwCUwyzRUuvAO4qIngZL9GhIm+diRfVA
 pa7N7lmR5UXpDV9aBovFUUQo7jhYZmH15NgaT/qWGgJVim0nTCAUaVT18
 r+W9oOk509LRXRsTGKEUOwehCnlPCYzQFSx9Ja4QYOQrLmmfgIqWgZKEw
 FmeylBn3JlPDvxfpDomKhJLozUI/s/NX9xchkCdOhd3pX64BDFv2qNzWI
 az1WsptJEc24U2ED9kFlvUqZeBzX0RasUCPV+Np5qGzmWaFYmfRk9/7zG
 1b9oJ5qRgU8qjD2gMcwllRfGF3HbrpmVvcm9pGMH3HXTl990VhqOZwOl5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="350336273"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="350336273"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="730056884"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="730056884"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:54:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 12:54:21 -0700
Message-Id: <20230510195424.3045127-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510195424.3045127-1-lucas.demarchi@intel.com>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] fixup! drm/xe/display: Implement display
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

Remove a bunch of ; that shouldn't be there.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_display.h | 38 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index d1af8e3a5c0f..84c556111c91 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -56,36 +56,36 @@ xe_display_create(struct xe_device *xe) { return 0; }
 static inline void xe_display_info_init(struct xe_device *xe) { }
 
 static inline int
-xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; };
+xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
 
 static inline int
-xe_display_init_nommio(struct xe_device *xe) { return 0; };
-static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {};
+xe_display_init_nommio(struct xe_device *xe) { return 0; }
+static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {}
 
 static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
 
 static inline void
-xe_display_fini_noirq(struct drm_device *dev, void *dummy) {};
+xe_display_fini_noirq(struct drm_device *dev, void *dummy) {}
 
-static inline int xe_display_init_noaccel(struct xe_device *xe) { return 0; };
-static inline void xe_display_fini_noaccel(struct drm_device *dev, void *dummy) {};
+static inline int xe_display_init_noaccel(struct xe_device *xe) { return 0; }
+static inline void xe_display_fini_noaccel(struct drm_device *dev, void *dummy) {}
 
-static inline int xe_display_init(struct xe_device *xe) { return 0; };
-static inline void xe_display_unlink(struct xe_device *xe) {};
+static inline int xe_display_init(struct xe_device *xe) { return 0; }
+static inline void xe_display_unlink(struct xe_device *xe) {}
 
-static inline void xe_display_register(struct xe_device *xe) {};
-static inline void xe_display_unregister(struct xe_device *xe) {};
-static inline void xe_display_modset_driver_remove(struct xe_device *xe) {};
+static inline void xe_display_register(struct xe_device *xe) {}
+static inline void xe_display_unregister(struct xe_device *xe) {}
+static inline void xe_display_modset_driver_remove(struct xe_device *xe) {}
 
-static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {};
-static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {};
-static inline void xe_display_irq_reset(struct xe_device *xe) {};
-static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {};
+static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
+static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
+static inline void xe_display_irq_reset(struct xe_device *xe) {}
+static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
 
-static inline void xe_display_pm_suspend(struct xe_device *xe) {};
-static inline void xe_display_pm_suspend_late(struct xe_device *xe) {};
-static inline void xe_display_pm_resume_early(struct xe_device *xe) {};
-static inline void xe_display_pm_resume(struct xe_device *xe) {};
+static inline void xe_display_pm_suspend(struct xe_device *xe) {}
+static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
+static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
+static inline void xe_display_pm_resume(struct xe_device *xe) {}
 
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
-- 
2.40.1

