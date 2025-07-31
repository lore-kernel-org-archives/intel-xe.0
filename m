Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9603DC87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D24C10E3A2;
	Thu, 31 Jul 2025 19:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqt/vIST";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546DB10E7DE
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753990443; x=1785526443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PcyArffXZhTStmvzIpaX2aRmFcE3C5LDLWVwIevS8aw=;
 b=dqt/vISTSoD/tG3xq4fEzXDeLvKoG/PGd4PQfowS2eADlsIZSVuoFlFy
 wd0i3stiiH3K0jZe7FN0uwv8YIU7sx48D2u/2LS3QKBx589ZrCeHfBC3D
 mGHP16kumoc2QrzVyRpMYT8Za7SVE4cDOy/rzf1lvZ16xSlELc817b9VI
 eloEq+YA3VMyxtUM4PRiL333iXbLCYOULjSwYxR+E0Bi0zXXb+NGk09rh
 tjPIYEGmN+xrSnj23VrNdOrA/G+kaD/smcmYwFKiWpKDVYjcePCOqS2kH
 UOMNCWY8J5v3a7G+1t4HRv9Y7vmlUK8ZgMV+9VUdukLtfCSyp9Dxau/lR Q==;
X-CSE-ConnectionGUID: z69jv9VETmq254eL5N/4BQ==
X-CSE-MsgGUID: GzPlxDboTumYRa0HzDScoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55395027"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55395027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:34:03 -0700
X-CSE-ConnectionGUID: 2yahteeiSmSIcd4z/MaL0A==
X-CSE-MsgGUID: HwIOz3/tTpeuMhTNhLGhzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194333988"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:34:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 07/11] drm/xe/configfs: Reintroduce struct xe_config_device
Date: Thu, 31 Jul 2025 21:33:35 +0200
Message-ID: <20250731193339.179829-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731193339.179829-1-michal.wajdeczko@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
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

This time it will hold just pure configuration parameters, without
any configfs related stuff. This will help us define defaults data
without wasting space for unneeded data.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/xe_configfs.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index acdee616d118..7ad9fc65e21d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -88,8 +88,10 @@
 struct xe_config_group_device {
 	struct config_group group;
 
-	bool survivability_mode;
-	u64 engines_allowed;
+	struct xe_config_device {
+		bool survivability_mode;
+		u64 engines_allowed;
+	} config;
 
 	/* protects attributes */
 	struct mutex lock;
@@ -118,9 +120,14 @@ static struct xe_config_group_device *to_xe_config_group_device(struct config_it
 	return container_of(to_config_group(item), struct xe_config_group_device, group);
 }
 
+static struct xe_config_device *to_xe_config_device(struct config_item *item)
+{
+	return &to_xe_config_group_device(item)->config;
+}
+
 static ssize_t survivability_mode_show(struct config_item *item, char *page)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_device *dev = to_xe_config_device(item);
 
 	return sprintf(page, "%d\n", dev->survivability_mode);
 }
@@ -136,7 +143,7 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 		return ret;
 
 	mutex_lock(&dev->lock);
-	dev->survivability_mode = survivability_mode;
+	dev->config.survivability_mode = survivability_mode;
 	mutex_unlock(&dev->lock);
 
 	return len;
@@ -144,7 +151,7 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 
 static ssize_t engines_allowed_show(struct config_item *item, char *page)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_device *dev = to_xe_config_device(item);
 	char *p = page;
 
 	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
@@ -220,7 +227,7 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	}
 
 	mutex_lock(&dev->lock);
-	dev->engines_allowed = val;
+	dev->config.engines_allowed = val;
 	mutex_unlock(&dev->lock);
 
 	return len;
@@ -282,7 +289,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 		return ERR_PTR(-ENOMEM);
 
 	/* Default values */
-	dev->engines_allowed = U64_MAX;
+	dev->config.engines_allowed = U64_MAX;
 
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
 
@@ -340,7 +347,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	if (!dev)
 		return false;
 
-	mode = dev->survivability_mode;
+	mode = dev->config.survivability_mode;
 	config_group_put(&dev->group);
 
 	return mode;
@@ -361,7 +368,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 		return;
 
 	mutex_lock(&dev->lock);
-	dev->survivability_mode = 0;
+	dev->config.survivability_mode = 0;
 	mutex_unlock(&dev->lock);
 
 	config_group_put(&dev->group);
@@ -384,7 +391,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	if (!dev)
 		return U64_MAX;
 
-	engines_allowed = dev->engines_allowed;
+	engines_allowed = dev->config.engines_allowed;
 	config_group_put(&dev->group);
 
 	return engines_allowed;
-- 
2.47.1

