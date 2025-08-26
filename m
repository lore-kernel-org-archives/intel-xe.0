Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB6BCA0FE7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 15:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1826510E685;
	Tue, 26 Aug 2025 15:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dR20jMUY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2732A10E685
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 15:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756222353; x=1787758353;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kP8ULZchFRclhl5XtHZnTr7W9ZyZc2qb+G4ObYa6BnE=;
 b=dR20jMUYyR14raBzTxjIwRX06QtQqnmo2cIJhHvU74hHtpnlRSn374vi
 25aq3GQbPKVTmnZjjZcK7fRxmQa9oaZF2Wa92K2J+6hgJ0CdhwUnZyXPl
 50NZtEvjyAUdUS9gdWPSqEqyb2GF3T5n/iKqiJ8LBDOeTAe08OuKOwQH5
 GyRYmnoCfX68xm7xREtLpubwLoXC2CvX7Fvjw2nxQt9fenppTxaQII7b4
 QO8b5nn9sQ/5MZB1fQO7yilET0ZHR8A/omXVbXJzc5y0OtWhWAxJq2dNM
 jg9MVMdYcEgBxohAvRr+kplnWoLzI1LbHGBVJUF1bEqudE6WStC8H7syI g==;
X-CSE-ConnectionGUID: c1VI0fBSTTy1NmVEDs/2oQ==
X-CSE-MsgGUID: ob7geMI+T8WfGx/d0V8IjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="83867342"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="83867342"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 08:32:33 -0700
X-CSE-ConnectionGUID: L2TA/XHyQ7qxhBTP/Nvp1w==
X-CSE-MsgGUID: CVEkrE2DRGGj07jAXltEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169535727"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 08:32:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [CI] drm/xe/configfs: Block runtime attribute changes
Date: Tue, 26 Aug 2025 08:32:11 -0700
Message-ID: <20250826153210.3068808-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.50.1
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

Although it's possible to change the attributes in runtime, they have no
effect after the driver is already bound to the device. Check for that
and return -EBUSY in that case.

This should help users understand what's going on when the behavior is
not changing even if the value from the configfs is "right", but it got
to that state too late.

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
- Add dbg message when it's already bound (Riana)
---
 drivers/gpu/drm/xe/xe_configfs.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 29a12d02443d9..1025d3979b066 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -75,6 +75,8 @@
  *
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
  *
+ * This attribute can only be set before binding to the device.
+ *
  * Allowed engines:
  * ----------------
  *
@@ -99,6 +101,8 @@
  * available for migrations, but it's disabled. This is intended for debugging
  * purposes only.
  *
+ * This attribute can only be set before binding to the device.
+ *
  * PSMI
  * ----
  *
@@ -109,6 +113,8 @@
  *
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
  *
+ * This attribute can only be set before binding to the device.
+ *
  * Remove devices
  * ==============
  *
@@ -169,6 +175,32 @@ static struct xe_config_device *to_xe_config_device(struct config_item *item)
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
+	if (ret)
+		pci_dbg(pdev, "Already bound to driver\n");
+
+	return ret;
+}
+
 static ssize_t survivability_mode_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -187,6 +219,9 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 		return ret;
 
 	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
 	dev->config.survivability_mode = survivability_mode;
 
 	return len;
@@ -270,6 +305,9 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	}
 
 	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
 	dev->config.engines_allowed = val;
 
 	return len;
@@ -293,6 +331,9 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
 		return ret;
 
 	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
 	dev->config.enable_psmi = val;
 
 	return len;
-- 
2.50.1

