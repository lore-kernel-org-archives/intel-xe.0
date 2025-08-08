Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7172FCA0EC2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222B410E969;
	Fri,  8 Aug 2025 17:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaWmMyMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC26410E969
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674211; x=1786210211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NBcwbgfXg4F9NoSkB9DwCRtMCIzkkw4AuFA7bVPzmgU=;
 b=GaWmMyMcpZyWkX8MEDASI2D/5riDDA3Vy1FYnKpOLGhT4722WvQd21YN
 zvQjTJ1qDTA5Xyj5rAzD38cha2W8qfc12+wMP3z7Ew3ooDpIxtSYXVtbA
 bLqSY2IGUSiVCToW/QwE7RjLWlXVbreVnLvdp8JnzK6mPruSGTKWcKazV
 3T7Aooy+mU/+wGBsJN7HC0QNBYXZ1pgfMCWslwJzXdX/VL3tftjUxy6wr
 1dVlETCpRj3q9esX9oNUeWvfq95aA73i7BqHOPqbCA5CJdmI236Ypm70r
 ZzeePPgvOMBzmNPnr6DUZ9bDbjn8Ti6kxpwDVDkQ/bX9DxVxmnzJdTxfI w==;
X-CSE-ConnectionGUID: b3v4h7DrTQumgQ7vG0quMg==
X-CSE-MsgGUID: tgnaEfdMRR2VQKH54sYaCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109823"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109823"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: 8wUSDhElQTGDodikgS1b1w==
X-CSE-MsgGUID: bHlPqyaaRou9a9dW6WXBsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387416"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 07/13] drm/xe/configfs: Allow to enable PSMI
Date: Fri,  8 Aug 2025 10:29:50 -0700
Message-ID: <20250808-psmi-v3-7-a111e9f1e4b7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

Now that additional WAs are in place and it's possible to allocate
buffers through debugfs, add the configfs attribute to turn PSMI on.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 66 +++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_configfs.h |  2 +-
 2 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 17b1d6ae1ff6a..8cf6b1375b7d4 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -77,6 +77,16 @@
  * available for migrations, but it's disabled. This is intended for debugging
  * purposes only.
  *
+ * PSMI
+ * ----
+ *
+ * Enable extra debugging capabilities to trace engine execution. Only useful
+ * during early platform enabling and requiring additional hardware connected.
+ * Once it's enabled, additionals WAs are added and runtime configuration is
+ * done via debugfs. Example to enable it::
+ *
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
+ *
  * Remove devices
  * ==============
  *
@@ -89,8 +99,9 @@ struct xe_config_group_device {
 	struct config_group group;
 
 	struct xe_config_device {
-		bool survivability_mode;
 		u64 engines_allowed;
+		bool survivability_mode;
+		bool enable_psmi;
 	} config;
 
 	/* protects attributes */
@@ -98,8 +109,9 @@ struct xe_config_group_device {
 };
 
 static const struct xe_config_device device_defaults = {
-	.survivability_mode = false,
 	.engines_allowed = U64_MAX,
+	.survivability_mode = false,
+	.enable_psmi = false,
 };
 
 static void set_device_defaults(struct xe_config_device *config)
@@ -243,12 +255,38 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	return len;
 }
 
-CONFIGFS_ATTR(, survivability_mode);
+static ssize_t enable_psmi_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return sprintf(page, "%d\n", dev->config.enable_psmi);
+}
+
+static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
+
+	mutex_lock(&dev->lock);
+	dev->config.enable_psmi = val;
+	mutex_unlock(&dev->lock);
+
+	return len;
+}
+
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, survivability_mode);
+CONFIGFS_ATTR(, enable_psmi);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
-	&attr_survivability_mode,
 	&attr_engines_allowed,
+	&attr_survivability_mode,
+	&attr_enable_psmi,
 	NULL,
 };
 
@@ -443,6 +481,26 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	return engines_allowed;
 }
 
+/**
+ * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
+ * @pdev: pci device
+ *
+ * Return: enable_psmi setting in configfs
+ */
+bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
+
+	if (!dev)
+		return false;
+
+	ret = dev->config.enable_psmi;
+	config_item_put(&dev->group.cg_item);
+
+	return ret;
+}
+
 int __init xe_configfs_init(void)
 {
 	int ret;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index c14588b86e833..603dd7796c8b2 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -16,7 +16,7 @@ void xe_configfs_exit(void);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
-static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }

-- 
2.50.1

