Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6E5CA0EF2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17E710E4BC;
	Mon, 18 Aug 2025 17:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYPR6cpp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB7E10E4B4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755538704; x=1787074704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpmkrUnsJcg1ihcb6I8WYsmYOOoE8defTvU8wIs5X+Y=;
 b=kYPR6cppMuUa9P1VIT/uwkmg8gR6i4voPkALzZyfrGqLyhHSo84FsGmr
 jBJysbnNBXMVzjJs4e8tc66vFjMR7xvzkrTz3dU62Si084uBBBawFYq0b
 ld2CINEasEIe+VkOdWJMjQMmYZ4ltXva07sVXPLhpwzSwR2SDjPMnOoqJ
 xI8G+EYyocJWVpNZKwid/a5ih00Bp4jKownAu9/da/wXmM4EV/1BqkPLS
 GRlQCYnGMuto6/iIPmD81BCqWBeNmgPOK8utYPIKGeJZt5DHPExaVcOwl
 8OF707YFTwzP7jVhclBGp00siA3lVHGSX2DndsKDLzyi4aSkjRlW3QjlE g==;
X-CSE-ConnectionGUID: higCMbc1RoaWJAlAqXxB1g==
X-CSE-MsgGUID: +5qygEReTym35lLrUnapXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57918653"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57918653"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:24 -0700
X-CSE-ConnectionGUID: 1KgQG+m/RAeY3Q1q6WWT+g==
X-CSE-MsgGUID: 4NJG+22ETaiWj34T30+GlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172838878"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 07/13] drm/xe/configfs: Allow to enable PSMI
Date: Mon, 18 Aug 2025 10:37:32 -0700
Message-ID: <20250818-psmi-v4-7-a330783ce1c0@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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
v2:
- Define CONFIGFS_ATTR in alphabetical order (Riana)
- Use to_xe_config_device() (Riana)
- Fix typo in documentation (Riana)
---
 drivers/gpu/drm/xe/xe_configfs.c | 66 +++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_configfs.h |  2 +-
 2 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 17b1d6ae1ff6a..61376dfc74bb3 100644
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
+ * during early platform enabling and requires additional hardware connected.
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
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->enable_psmi);
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
+CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
-	&attr_survivability_mode,
+	&attr_enable_psmi,
 	&attr_engines_allowed,
+	&attr_survivability_mode,
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

