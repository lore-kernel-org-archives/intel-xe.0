Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57848C87FCE
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C45010E317;
	Sun, 27 Jul 2025 17:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECPcNM51";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA5C10E317
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636826; x=1785172826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C0/AcC4YuUNOt1MqDQjcxxjjassNqtD32kuCHY4bUwU=;
 b=ECPcNM51aKh41f2FKI5ycTKuQzEIkMHEYlNGOhD7dGGuhQ1pYM6hrdQ0
 GL3M9Ewl63oxBGKVjc8r+5Hk483tzhpHqAwaim9xJCSsyK+1ETzC6vXU0
 Hl8fe1ute07tKQ7RtrDXHXMkyVGMqJq6bsGKvBfkU7ABBCrKvvv514O7V
 c4BJXoiJSDPWdxHJHlVn1B84bceZKgaJ0wpq8xLdBoB+MImnmmr8tx4aU
 vQngigrBTOChyMPr+CDHNgK3+qwvYoqzkLvHSP7hiNliA3XWqOawlm6UG
 hKuvCYo8myx8huM6u/xSwz1aDKaMSz6XCsEP6w9xxQagWdp78ueoq2kHp g==;
X-CSE-ConnectionGUID: 7MCIbDN6SNeC/CWfHN3OhA==
X-CSE-MsgGUID: 5vZZG6iIRXafk7yoSfnTVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046730"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046730"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:26 -0700
X-CSE-ConnectionGUID: JIPrD70WTyKbjUVYUqMlRg==
X-CSE-MsgGUID: Wse8gXT6SuSuguvsXZnIPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556831"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 05/11] drm/xe/configfs: Rename struct xe_config_device
Date: Sun, 27 Jul 2025 19:20:02 +0200
Message-ID: <20250727172009.587-6-michal.wajdeczko@intel.com>
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

Rename it to struct xe_config_group_device to better match its
purpose. It will also help us to reintroduce in the upcoming patch
the same struct name but this time to hold only configuration data.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index e32517afae58..edd52b8f0543 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -89,7 +89,7 @@
  * Use xe_configfs.su_mutex (also accessible from group.cg_subsys->su_mutex)
  * to protect configuration data.
  */
-struct xe_config_device {
+struct xe_config_group_device {
 	struct config_group group;
 
 	bool survivability_mode;
@@ -114,21 +114,21 @@ static const struct engine_info engine_info[] = {
 	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
 };
 
-static struct xe_config_device *to_xe_config_device(struct config_item *item)
+static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
 {
-	return container_of(to_config_group(item), struct xe_config_device, group);
+	return container_of(to_config_group(item), struct xe_config_group_device, group);
 }
 
 static ssize_t survivability_mode_show(struct config_item *item, char *page)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 
 	return sprintf(page, "%d\n", dev->survivability_mode);
 }
 
 static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 	bool survivability_mode;
 	int ret;
 
@@ -144,7 +144,7 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 
 static ssize_t engines_allowed_show(struct config_item *item, char *page)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 	char *p = page;
 
 	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
@@ -199,7 +199,7 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
 static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 				     size_t len)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 	size_t patternlen, p;
 	u64 mask, val = 0;
 
@@ -236,7 +236,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 
 static void xe_config_device_release(struct config_item *item)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 
 	kfree(dev);
 }
@@ -255,7 +255,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 							const char *name)
 {
 	unsigned int domain, bus, slot, function;
-	struct xe_config_device *dev;
+	struct xe_config_group_device *dev;
 	struct pci_dev *pdev;
 	char canonical[16];
 	int ret;
@@ -305,7 +305,7 @@ static struct configfs_subsystem xe_configfs = {
 	},
 };
 
-static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
+static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
 {
 	guard(mutex)(&xe_configfs.su_mutex);
 	struct config_item *item;
@@ -314,7 +314,7 @@ static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
 	if (!item)
 		return NULL;
 
-	return to_xe_config_device(item);
+	return to_xe_config_group_device(item);
 }
 
 /**
@@ -328,7 +328,7 @@ static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
  */
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 {
-	struct xe_config_device *dev = configfs_find_group(pdev);
+	struct xe_config_group_device *dev = configfs_find_group(pdev);
 	bool mode;
 
 	if (!dev)
@@ -349,7 +349,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
  */
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 {
-	struct xe_config_device *dev = configfs_find_group(pdev);
+	struct xe_config_group_device *dev = configfs_find_group(pdev);
 
 	if (!dev)
 		return;
@@ -371,7 +371,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
  */
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 {
-	struct xe_config_device *dev = configfs_find_group(pdev);
+	struct xe_config_group_device *dev = configfs_find_group(pdev);
 	u64 engines_allowed;
 
 	if (!dev)
-- 
2.47.1

