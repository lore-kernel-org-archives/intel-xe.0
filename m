Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA33C98327
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 23:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7395710F7E3;
	Thu, 24 Sep 2026 23:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdbDZGEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E2810E767
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 23:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790290883; x=1821826883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TCD+PRq6odGSwKQbowl7EGHkVogieKD4iMy0ADlscMU=;
 b=hdbDZGEGgbthd6JZrRk7sJCwHaGrg4U6XxFB0MkMsDm51H9aEqee8OvM
 SU4rIy6nXlWU6ywCeBEVM2mql7dkM3pjbROqoSxwYLGUCoIT6wavzdWJ4
 /4MU5uwUr/2qJI1t0DElDlL87GtlkXjHwq4q6rOBCDiyrC167Eu3p3ScI
 nGH0SseG8qUk1jp8U9E0D+MTTa2u4RZ1NxAsW3lcLoQB7NhSoWZ3FGGr6
 usxqKIB5IOx5inoLdx+DtsOOYTMFDA7pBKpvUrXmW5L2xu5+YcnxQ3Kzi
 ULPrOPbNKPGE+rTslEaS+JyhoMBXYLLk1gTXm/Jn0pFvLBezzo0Bd2EKW A==;
X-CSE-ConnectionGUID: aT4FL5u1TqqhEJ5FrkA0pA==
X-CSE-MsgGUID: LwG5z3l9QH2Law9t7Q2wxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90120168"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90120168"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:22 -0700
X-CSE-ConnectionGUID: vNgC3vnTTqGT9d5iqoc9Ww==
X-CSE-MsgGUID: 9Y9fMk0wTaqcMDAEZ+Uh0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="270651589"
Received: from dut4435arlh.fm.intel.com ([10.105.8.61])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:21 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 01/16] drm/xe: Guard configfs attribute reads in getters
Date: Thu, 24 Sep 2026 23:01:20 +0000
Message-ID: <20260924230120.389685-19-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924230120.389685-18-stuart.summers@intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
MIME-Version: 1.0
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

The configfs getters read dev->config members without holding dev->lock,
so a concurrent store can tear the value being returned. The store paths
and a few of the getters already take the lock; make it consistent by
wrapping every read of dev->config in the getters with a scoped_guard(),
covering the surrounding checks that consume those values as well.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-5
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index f5c828cf7e8f..9ff39ec8c07d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -1235,7 +1235,8 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.survivability_mode;
 
-	mode = dev->config.survivability_mode;
+	scoped_guard(mutex, &dev->lock)
+		mode = dev->config.survivability_mode;
 	config_group_put(&dev->group);
 
 	return mode;
@@ -1249,7 +1250,8 @@ static u64 get_gt_types_allowed(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.gt_types_allowed;
 
-	mask = dev->config.gt_types_allowed;
+	scoped_guard(mutex, &dev->lock)
+		mask = dev->config.gt_types_allowed;
 	config_group_put(&dev->group);
 
 	return mask;
@@ -1293,7 +1295,8 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.engines_allowed;
 
-	engines_allowed = dev->config.engines_allowed;
+	scoped_guard(mutex, &dev->lock)
+		engines_allowed = dev->config.engines_allowed;
 	config_group_put(&dev->group);
 
 	return engines_allowed;
@@ -1313,7 +1316,8 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	if (!dev)
 		return false;
 
-	ret = dev->config.enable_psmi;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_psmi;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1334,7 +1338,8 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
 	if (!dev)
 		return true;
 
-	ret = dev->config.enable_multi_queue;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_multi_queue;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1354,7 +1359,8 @@ bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.disable_vram_page_offline;
 
-	ret = dev->config.disable_vram_page_offline;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.disable_vram_page_offline;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1378,10 +1384,12 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 	if (!dev)
 		return 0;
 
-	if (cs)
-		*cs = dev->config.ctx_restore_mid_bb[class].cs;
+	scoped_guard(mutex, &dev->lock) {
+		if (cs)
+			*cs = dev->config.ctx_restore_mid_bb[class].cs;
 
-	len = dev->config.ctx_restore_mid_bb[class].len;
+		len = dev->config.ctx_restore_mid_bb[class].len;
+	}
 	config_group_put(&dev->group);
 
 	return len;
@@ -1405,8 +1413,10 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 	if (!dev)
 		return 0;
 
-	*cs = dev->config.ctx_restore_post_bb[class].cs;
-	len = dev->config.ctx_restore_post_bb[class].len;
+	scoped_guard(mutex, &dev->lock) {
+		*cs = dev->config.ctx_restore_post_bb[class].cs;
+		len = dev->config.ctx_restore_post_bb[class].len;
+	}
 	config_group_put(&dev->group);
 
 	return len;
-- 
2.43.0

