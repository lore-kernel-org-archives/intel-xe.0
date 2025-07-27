Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C47C87FCC
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5547610E31E;
	Sun, 27 Jul 2025 17:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHBR3lTk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04A510E317
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636829; x=1785172829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AXErHASmPpWY3WzLsWhUWaULmyNb+Uimrg59ux9Iyk8=;
 b=eHBR3lTkbjldpECQ17S0xd7asT7aquRSWCVpXWEi7RAp8ywK7W/wiH4Z
 XIUhuuEa2rHge/xA+3AEO/X1Cm1XIyyGgr5zyoXA4BD/h2BkHmtP3sYdU
 aMhw1+LntkAtBZGOohM6QnPhJLIukkEFTzKHYiDsiog5LXGAE2lpmcbAc
 Selg651EltWwrsk0vaU9sSoWApbob6AD1EzR+TJIsnWSRUuFFSefla0k/
 /gon0IXKf6C0TOQAkpUOBVIKxJ4EJXeqiHig+xTfmdzdylwC36RRP0XNU
 /trIq5cpu79K7ZjKnwKMXTE7W+vdz6oUDZBIr8vpznPvnSKYfsaTAw0Jr A==;
X-CSE-ConnectionGUID: sDPxHFufT5ymrDizsQ3ceA==
X-CSE-MsgGUID: pxq0YAqhQvWutLgi5SmBBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046732"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046732"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:29 -0700
X-CSE-ConnectionGUID: XtSjc5zERfebHNj+OO2JCA==
X-CSE-MsgGUID: SJwsgD10QoWv7FL0RarXQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556837"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 07/11] drm/xe/configfs: Reintroduce struct xe_config_device
Date: Sun, 27 Jul 2025 19:20:04 +0200
Message-ID: <20250727172009.587-8-michal.wajdeczko@intel.com>
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

This time it will hold just pure configuration parameters, without
any configfs related stuff. This will help us define defaults data
without wasting space for unneeded data.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index f5a780b8bb80..a5f13dd779c7 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -92,8 +92,10 @@
 struct xe_config_group_device {
 	struct config_group group;
 
-	bool survivability_mode;
-	u64 engines_allowed;
+	struct xe_config_device {
+		bool survivability_mode;
+		u64 engines_allowed;
+	} config;
 };
 
 struct engine_info {
@@ -119,16 +121,21 @@ static struct xe_config_group_device *to_xe_config_group_device(struct config_it
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
 
 static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_device *dev = to_xe_config_device(item);
 	bool survivability_mode;
 	int ret;
 
@@ -144,7 +151,7 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 
 static ssize_t engines_allowed_show(struct config_item *item, char *page)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_device *dev = to_xe_config_device(item);
 	char *p = page;
 
 	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
@@ -199,7 +206,7 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
 static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 				     size_t len)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_device *dev = to_xe_config_device(item);
 	size_t patternlen, p;
 	u64 mask, val = 0;
 
@@ -280,7 +287,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 		return ERR_PTR(-ENOMEM);
 
 	/* Default values */
-	dev->engines_allowed = U64_MAX;
+	dev->config.engines_allowed = U64_MAX;
 
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
 
@@ -334,7 +341,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	if (!dev)
 		return false;
 
-	mode = dev->survivability_mode;
+	mode = dev->config.survivability_mode;
 	config_group_put(&dev->group);
 
 	return mode;
@@ -355,7 +362,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 		return;
 
 	scoped_guard(mutex, &xe_configfs.su_mutex)
-		dev->survivability_mode = 0;
+		dev->config.survivability_mode = 0;
 
 	config_group_put(&dev->group);
 }
@@ -377,7 +384,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	if (!dev)
 		return U64_MAX;
 
-	engines_allowed = dev->engines_allowed;
+	engines_allowed = dev->config.engines_allowed;
 	config_group_put(&dev->group);
 
 	return engines_allowed;
-- 
2.47.1

