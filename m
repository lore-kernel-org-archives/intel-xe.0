Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72019CA0EC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3471A10E978;
	Fri,  8 Aug 2025 17:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VISvDJvX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165A110E965
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674211; x=1786210211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N+AMcx3eYSrS9ZU1qacor2JC/xYRGF1vmtOjRgNaPG4=;
 b=VISvDJvX59J9jdYG6HPyki908IOKPbr1W/FeiEZsEvxbJYI1fmqAUIlJ
 p7Y338UnP2TWGw74HeqD1bIUefVBozFD3QAU6xlp1vAPb5Y8pXQT26usN
 s8lJoKTQxxakuJW/5siFEyBQ09m22xH2ERZsKXO3a4ruBziVqalAxMRpL
 waz5EDV0PgKmv0unI9RckgORTyM7sngnUwlcDUtt9+E5gdqtl1LdX1z+C
 Cb4FGoYcu37HiD6DDBgzfZ8dntF27ib1zyLy4jacImO/f0adFLRk6cfPl
 xWisKqLnCnKK7COvdTEjeDVGLJllNnjlIvxWcFipLclr6ssfqtzbTNpcs A==;
X-CSE-ConnectionGUID: 5tYQeiZTRZ6n5uwTn/Z6DQ==
X-CSE-MsgGUID: B3ZCU/xKRR6MhC3Iepchow==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109825"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109825"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: +MDihLB+SnmKUTBullJo3Q==
X-CSE-MsgGUID: fhe1my5zTCyJb0EMuxw4Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387422"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v3 09/13] drm/xe/configfs: Block runtime attribute changes
Date: Fri,  8 Aug 2025 10:29:52 -0700
Message-ID: <20250808-psmi-v3-9-a111e9f1e4b7@intel.com>
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

Although it's possible to change the attributes in runtime, they have no
effect after the driver is already bound to the device. Check for that
and return -EBUSY in that case.

This should help users understand what's going on when the behavior is
not changing even if the value from the configfs is "right", but it got
to that state too late.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 4c2d4ff6a70f5..489c5c67001dc 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -54,6 +54,8 @@
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
  *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
  *
+ * This attribute can only be set before binding to the device.
+ *
  * Allowed engines:
  * ----------------
  *
@@ -78,6 +80,8 @@
  * available for migrations, but it's disabled. This is intended for debugging
  * purposes only.
  *
+ * This attribute can only be set before binding to the device.
+ *
  * PSMI
  * ----
  *
@@ -88,6 +92,8 @@
  *
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
  *
+ * This attribute can only be set before binding to the device.
+ *
  * Remove devices
  * ==============
  *
@@ -148,6 +154,29 @@ static struct xe_config_device *to_xe_config_device(struct config_item *item)
 	return &to_xe_config_group_device(item)->config;
 }
 
+static bool is_bound(struct xe_config_group_device *dev)
+{
+	unsigned int domain, bus, slot, function;
+	struct pci_dev *pdev;
+	const char *name;
+	bool ret;
+
+	lockdep_assert_held(&dev->lock);
+
+	name = dev->group.cg_item.ci_name;
+	if (sscanf(name, "%x:%x:%x.%x", &domain, &bus, &slot, &function) != 4)
+		return false;
+
+	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
+	if (!pdev)
+		return false;
+
+	ret = pci_get_drvdata(pdev);
+	pci_dev_put(pdev);
+
+	return ret;
+}
+
 static ssize_t survivability_mode_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -166,6 +195,9 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 		return ret;
 
 	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
 	dev->config.survivability_mode = survivability_mode;
 
 	return len;
@@ -249,6 +281,9 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	}
 
 	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
 	dev->config.engines_allowed = val;
 
 	return len;
@@ -272,6 +307,9 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
 		return ret;
 
 	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
 	dev->config.enable_psmi = val;
 
 	return len;

-- 
2.50.1

