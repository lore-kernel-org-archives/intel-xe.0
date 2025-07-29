Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E200C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421B510E618;
	Tue, 29 Jul 2025 11:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHS2SBmp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BC310E618
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753789355; x=1785325355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cb/joj6rQDMyn09bif90pr+HR9JDIbAxNcxUzqF1B7E=;
 b=mHS2SBmpg/9I6ssaFRSNax1d2G/wvzCJshDPhb/WZJ9O9IVO5x7CdEUM
 uX7OLhTypeURThPIeiQlS8eUvdABo4eO/3qjPBsZfmRmFnbaPu7ONeolS
 mav2nqFExjJaalJzPUwrBkigjRdMNUAGtgS/qXvKbvdva1fw3S+aullsC
 3ftnIMq39GMJ9v1aktccK34KtQoL1Aguzo3RebHwt10L1lajSXsXctYTd
 blkbmCsb82BDxlo9GVwbH2Iza9QKDW036AfIAJJz0VvDzYMohz2i/Rat+
 ljmwmSFlqripD92kyTAuAYgss3zEIsiX5+CRfv1JWnA6j0AAfZe0xtER+ A==;
X-CSE-ConnectionGUID: tHtcVnbRS2ekDwss9t5AVA==
X-CSE-MsgGUID: kjqQqCGwQHiDqFcgGj2eZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55755586"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55755586"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:35 -0700
X-CSE-ConnectionGUID: 7c6DBry+TI+G9X8RrmAL8g==
X-CSE-MsgGUID: 7J9TVzFsQCCX9mx/Jr/PnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161946912"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 05/11] drm/xe/configfs: Rename struct xe_config_device
Date: Tue, 29 Jul 2025 13:42:09 +0200
Message-ID: <20250729114215.177586-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729114215.177586-1-michal.wajdeczko@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/xe_configfs.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 6aa0531bcf76..d69b5f248e59 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -85,7 +85,7 @@
  *	rmdir /sys/kernel/config/xe/0000:03:00.0/
  */
 
-struct xe_config_device {
+struct xe_config_group_device {
 	struct config_group group;
 
 	bool survivability_mode;
@@ -113,21 +113,21 @@ static const struct engine_info engine_info[] = {
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
 
@@ -237,7 +237,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 
 static void xe_config_device_release(struct config_item *item)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 
 	mutex_destroy(&dev->lock);
 	kfree(dev);
@@ -257,7 +257,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 							const char *name)
 {
 	unsigned int domain, bus, slot, function;
-	struct xe_config_device *dev;
+	struct xe_config_group_device *dev;
 	struct pci_dev *pdev;
 	char canonical[16];
 	int ret;
@@ -309,7 +309,7 @@ static struct configfs_subsystem xe_configfs = {
 	},
 };
 
-static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
+static struct xe_config_group_device *configfs_find_group(struct pci_dev *pdev)
 {
 	struct config_item *item;
 
@@ -320,7 +320,7 @@ static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
 	if (!item)
 		return NULL;
 
-	return to_xe_config_device(item);
+	return to_xe_config_group_device(item);
 }
 
 /**
@@ -334,7 +334,7 @@ static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
  */
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 {
-	struct xe_config_device *dev = configfs_find_group(pdev);
+	struct xe_config_group_device *dev = configfs_find_group(pdev);
 	bool mode;
 
 	if (!dev)
@@ -355,7 +355,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
  */
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 {
-	struct xe_config_device *dev = configfs_find_group(pdev);
+	struct xe_config_group_device *dev = configfs_find_group(pdev);
 
 	if (!dev)
 		return;
@@ -378,7 +378,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
  */
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 {
-	struct xe_config_device *dev = configfs_find_group(pdev);
+	struct xe_config_group_device *dev = configfs_find_group(pdev);
 	u64 engines_allowed;
 
 	if (!dev)
-- 
2.47.1

