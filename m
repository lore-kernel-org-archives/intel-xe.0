Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90F6EE8010
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 14:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2242410E8DB;
	Fri,  8 Sep 2023 14:42:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE6010E8DA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 14:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694184171; x=1725720171;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=A/9bkNtpmOGyWzc86lEXc0TyqRhYzp/e70ulljZvzDc=;
 b=mW8fT5CO8DHZYxs00Q89mLop7g7nsOAMdCfKcqgoqVFJLRor3Lh00tc/
 b4pU0EZqhrRKQxiVqD3Be2sorhKDgNKbgnf7ZJ1lOnzyfWRgYDT1qO6ma
 7CZEQw/j6bkDCELUSBQpbEwa2mRvdV0ndtaaixvSQvYdL9pqfy+WA6KjJ
 Ch/Qm8KHRWm7ZQhIug8++osoiuCAUrQew9+NhNcquiNWza2PpryVBK+YJ
 JGKv/EiHQpZbJIFwzCD6LuINILA5lui28PPEhzquDhi7VVJsH8EoYhhJo
 d0BRYzO7Zpa9SL0YES5NljbObApLyKh/Geyq0FSj+Pdlot/SBBvCRnQN6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375041954"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="375041954"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 07:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692278276"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692278276"
Received: from dinahclx-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.213.169.125])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 07:42:50 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 11:42:35 -0300
Message-ID: <20230908144235.33628-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908144235.33628-1-gustavo.sousa@intel.com>
References: <20230908144235.33628-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] fixup! drm/xe/display: Implement display
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Finalizer counterparts of display initializers are registered with
drmm_add_action_or_reset(). Since there are no other explicit users of
them outside of xe_display.c, let's turn them into static functions.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c |  6 +++---
 drivers/gpu/drm/xe/xe_display.h | 15 +--------------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index a453946ad108..3d15d3ac431f 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -132,7 +132,7 @@ int xe_display_create(struct xe_device *xe)
 	return 0;
 }
 
-void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
+static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
@@ -164,7 +164,7 @@ int xe_display_init_nommio(struct xe_device *xe)
 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
 }
 
-void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
+static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
@@ -204,7 +204,7 @@ int xe_display_init_noirq(struct xe_device *xe)
 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noirq, NULL);
 }
 
-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
+static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 9e29de012df7..71e0bd27f1eb 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -20,13 +20,8 @@ int xe_display_create(struct xe_device *xe);
 void xe_display_info_init(struct xe_device *xe);
 
 int xe_display_init_nommio(struct xe_device *xe);
-void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
-
 int xe_display_init_noirq(struct xe_device *xe);
-void xe_display_fini_noirq(struct drm_device *dev, void *dummy);
-
 int xe_display_init_noaccel(struct xe_device *xe);
-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy);
 
 int xe_display_init(struct xe_device *xe);
 void xe_display_unlink(struct xe_device *xe);
@@ -60,17 +55,9 @@ static inline void xe_display_info_init(struct xe_device *xe) { }
 static inline int
 xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
 
-static inline int
-xe_display_init_nommio(struct xe_device *xe) { return 0; }
-static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {}
-
+static inline int xe_display_init_nommio(struct xe_device *xe) { return 0; }
 static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
-
-static inline void
-xe_display_fini_noirq(struct drm_device *dev, void *dummy) {}
-
 static inline int xe_display_init_noaccel(struct xe_device *xe) { return 0; }
-static inline void xe_display_fini_noaccel(struct drm_device *dev, void *dummy) {}
 
 static inline int xe_display_init(struct xe_device *xe) { return 0; }
 static inline void xe_display_unlink(struct xe_device *xe) {}
-- 
2.41.0

