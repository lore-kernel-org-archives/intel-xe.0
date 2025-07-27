Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F6BC87FCF
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2575E10E3D4;
	Sun, 27 Jul 2025 17:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOWMKHyw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D3010E317
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636825; x=1785172825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YtAlZHQf5bm6nnfU8/WKNNEd3/AoLpseMCUJjVXCuEo=;
 b=OOWMKHywcRNbfYRZXFZUCO7qa+BnAfFIYk42MqhQrkF3XUnogJGSpvCi
 GyNqXn/qUDKtqfxms5mjdoW+PHuRg3adLK6bGA0Ne+gnrh3w0PpMCvqpz
 gJn08sPIZ34no9HHyfAR7MtJflWa52PxS2I/Eqzk8HIcvPrYU8inIC6/8
 OgEhVvAJ+lTsx0x/GJdOr40CrGxIHSs7JYlGBuutnqtm9j83i12kd7xqy
 mJ18lid3shhvzyFAZ8am2aeOF4wBDa0HugDDYKRu1wysy/2vnPb1oxyaL
 c1eLDQBcP2zCyNvqystb4N+ODd7s6Kswj2hqB1Zm8GhZLcxuiWxHDZdgT Q==;
X-CSE-ConnectionGUID: NGLyd7i2S52PeSUfsg7TPw==
X-CSE-MsgGUID: tNTBueguRmWWA/OVDOWpjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046726"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046726"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:24 -0700
X-CSE-ConnectionGUID: oYU6wD+bQiS49Iwh2L1QnQ==
X-CSE-MsgGUID: 691qoeRhSomdOWrYrVxLPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556827"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:23 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 04/11] drm/xe/configfs: Use mutex from xe_configfs subsystem
Date: Sun, 27 Jul 2025 19:20:01 +0200
Message-ID: <20250727172009.587-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727172009.587-1-michal.wajdeczko@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
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

It should be sufficient to protect all configuration parameters
using single mutex already defined inside xe_configfs subsystem.

While around, also convert code to use guard/scoped_guard classes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 6aa0531bcf76..e32517afae58 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -85,14 +85,15 @@
  *	rmdir /sys/kernel/config/xe/0000:03:00.0/
  */
 
+/*
+ * Use xe_configfs.su_mutex (also accessible from group.cg_subsys->su_mutex)
+ * to protect configuration data.
+ */
 struct xe_config_device {
 	struct config_group group;
 
 	bool survivability_mode;
 	u64 engines_allowed;
-
-	/* protects attributes */
-	struct mutex lock;
 };
 
 struct engine_info {
@@ -135,9 +136,8 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 	if (ret)
 		return ret;
 
-	mutex_lock(&dev->lock);
-	dev->survivability_mode = survivability_mode;
-	mutex_unlock(&dev->lock);
+	scoped_guard(mutex, &item->ci_group->cg_subsys->su_mutex)
+		dev->survivability_mode = survivability_mode;
 
 	return len;
 }
@@ -219,9 +219,8 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 		val |= mask;
 	}
 
-	mutex_lock(&dev->lock);
-	dev->engines_allowed = val;
-	mutex_unlock(&dev->lock);
+	scoped_guard(mutex, &item->ci_group->cg_subsys->su_mutex)
+		dev->engines_allowed = val;
 
 	return len;
 }
@@ -239,7 +238,6 @@ static void xe_config_device_release(struct config_item *item)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
 
-	mutex_destroy(&dev->lock);
 	kfree(dev);
 }
 
@@ -286,8 +284,6 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
 
-	mutex_init(&dev->lock);
-
 	return &dev->group;
 }
 
@@ -311,12 +307,10 @@ static struct configfs_subsystem xe_configfs = {
 
 static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
 {
+	guard(mutex)(&xe_configfs.su_mutex);
 	struct config_item *item;
 
-	mutex_lock(&xe_configfs.su_mutex);
 	item = config_group_find_item(&xe_configfs.su_group, pci_name(pdev));
-	mutex_unlock(&xe_configfs.su_mutex);
-
 	if (!item)
 		return NULL;
 
@@ -360,9 +354,8 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 	if (!dev)
 		return;
 
-	mutex_lock(&dev->lock);
-	dev->survivability_mode = 0;
-	mutex_unlock(&dev->lock);
+	scoped_guard(mutex, &xe_configfs.su_mutex)
+		dev->survivability_mode = 0;
 
 	config_item_put(&dev->group.cg_item);
 }
-- 
2.47.1

