Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0273BC87FCD
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 01:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2FA10E867;
	Thu, 24 Jul 2025 01:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1w2xv3e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768C010E7DD
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 01:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753319084; x=1784855084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ax2XXXqKV9TRjqhdjEoQp7GILXYbqmKvmR7sCtAytPw=;
 b=k1w2xv3elUu44Sc0U0JVACFWiBhloNUkZS118NS4q/3MCPP9+Vlw9QDV
 Ws6bPT465+31stOvlqqwSgFZNzQ8KJS+kGjjGrWmDxmBsRwHPW6GrWX1Y
 hg35fyIalQBnuuFHTrWmD7LBFEmd3SguFLPAca325zU+B27ZOXt6pPWZm
 N1b4sQpEXw58+ZwVQ5gsqT89FQb+Dr/IaGU7k64bo4voaPuwLEh4dZPwi
 gyhhl8Kb6YTO8WMQWGWwMqKxVZY7pkXTifPqHI5ZUrY5VP6ad1ExuvGSZ
 tQYkDEH4PRz6+xH3q5hIiYkKWtQCTKzzFpmXj5s5ar83twNBZQY8I7RPL g==;
X-CSE-ConnectionGUID: WrLVrhziTIGUPLPKyqYOvw==
X-CSE-MsgGUID: X8vs8K+oQmmGEhFaYBkxhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55766487"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55766487"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:43 -0700
X-CSE-ConnectionGUID: j6YeaMlqSgGGtPFt2tLgCw==
X-CSE-MsgGUID: SYJYhOmoTQK2aApCzWO9Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="160106445"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 7/7] drm/xe/configfs: Allow to enable PSMI
Date: Wed, 23 Jul 2025 18:04:28 -0700
Message-ID: <20250723-psmi-v2-7-84a04b5a3c04@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
References: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
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
 drivers/gpu/drm/xe/xe_configfs.c | 57 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  2 +-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index e5bdfcf6185ff..4f06f04fb8917 100644
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
@@ -89,6 +99,7 @@ struct xe_config_device {
 	struct config_group group;
 
 	bool survivability_mode;
+	bool enable_psmi;
 	u64 engines_allowed;
 
 	/* protects attributes */
@@ -226,12 +237,38 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	return len;
 }
 
+static ssize_t enable_psmi_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->enable_psmi);
+}
+
+static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
+
+	mutex_lock(&dev->lock);
+	dev->enable_psmi = val;
+	mutex_unlock(&dev->lock);
+
+	return len;
+}
+
 CONFIGFS_ATTR(, survivability_mode);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, enable_psmi);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_survivability_mode,
 	&attr_engines_allowed,
+	&attr_enable_psmi,
 	NULL,
 };
 
@@ -377,6 +414,26 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
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
+	struct xe_config_device *dev = configfs_find_group(pdev);
+	bool ret;
+
+	if (!dev)
+		return false;
+
+	ret = dev->enable_psmi;
+	config_item_put(&dev->group.cg_item);
+
+	return ret;
+}
+
 int __init xe_configfs_init(void)
 {
 	struct config_group *root = &xe_configfs.su_group;
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

