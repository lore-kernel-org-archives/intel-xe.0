Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD179CA601D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 16:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789E910E04E;
	Fri,  9 Oct 2026 16:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmhRBUgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F29A10E04E
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791563589; x=1823099589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JxPD07mg+Biz6Cn2NlmX07G+x7gkvPDpPPEkOTg4R5M=;
 b=fmhRBUggwzkUTFRJEjGF/uFYxrGlebj+zT0vXn3PWlpSzJjtrDCQ090p
 NwhF9JufYfaZhIrTWQpWHaWg9y5J2CBlebD7SSZeGHM4HEFX+urEgQI8P
 ZBOZZGv+sF/Er3AKG3gfGk9Njzt4tjC5SXrMJLkMg6iyY3+QwkEFZL1NS
 9JxGPDgHYrk2tJf8D4n6LK5AjUzigWwymTyT3dJKoFScSs5JBNmjPi8lv
 jc8EgLCOTCpZ8ran/bXzVd2Q8TumL0ao2urt25PZgetrzlxIfK04UrAHT
 SWvfXRsclHl9gNsdhTGxB9C5wqngjCR85x7YmB6qdTkCFGYaAiaI9LWB9 g==;
X-CSE-ConnectionGUID: 4n/SH6kmTLybKgL1sJZy3w==
X-CSE-MsgGUID: gpV4vSwmToapf4GYAExPag==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="254361"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="254361"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 09:33:09 -0700
X-CSE-ConnectionGUID: CAOeL+HDRgi1jRT+0SVBUQ==
X-CSE-MsgGUID: hsTNSziJSrG6MLzNOkBR+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="279057"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 09:33:07 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Date: Fri,  9 Oct 2026 22:12:42 +0530
Message-ID: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

The kernel crashes when unloading the xe driver on CRI:

 Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73
 RIP: 0010:platform_device_release+0x80/0x90
 Call Trace:
  device_release+0x44/0xa0
  kobject_put+0x9b/0x250
  put_device+0x13/0x30
  platform_device_unregister+0x29/0x40
  xe_i2c_remove+0x80/0xa0 [xe]
  devm_action_release+0x16/0x30
  release_nodes+0x3d/0x140
  devres_release_all+0x96/0xd0

This started after commit 0f485f88656af ("drm/xe/i2c: use
device_create_managed_software_node()"), which attaches a managed
software node to a platform device created with platform_device_alloc().

Comment above the device_create_managed_software_node function cautions
that the software node created by it should not be shared or reused as
the lifetime of the node is linked to the device.

But the DesignWare i2c driver which creates an adapter device as a child
of the platform device reuses the software node as its fwnode.
(device_set_node() in i2c_dw_probe()).

During module unbind, when the adapter device is deleted, it drops the
reference count for the software node and frees the software node.
Later when the platform device is removed, it tries to dereference the
software node pointer and results in use-after-free.

Instead of managed software node use a static struct software_node
passed through platform_device_info.swnode to
platform_device_register_full().
But we have a blocker which doesn't allow to use
platform_device_register_full() simply.

Currently the driver is using the two step alloc/add sequence while
creating the platform device so that i2c->pdev is set before
platform_device_add(), because xe_i2c_notifier() needs i2c->dev and it
can run before platform_device_register_full() returns.

We can fix it by removing the dependency on i2c->dev in
xe_i2c_notifier(). It is using it to match against the right adapter.
Instead of using the device, use its parent to match.

Fixes: 0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 45 +++++++++++++------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index b82caaff80d7b..c54a2375f07ef 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -55,6 +55,10 @@ static const struct property_entry xe_i2c_adapter_properties[] = {
 	{ }
 };
 
+static const struct software_node xe_i2c_adapter_node = {
+	.properties = xe_i2c_adapter_properties,
+};
+
 static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
 {
 	u32 *val = ep;
@@ -98,7 +102,7 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
 	struct device *dev = data;
 
 	if (action == BUS_NOTIFY_ADD_DEVICE &&
-	    adapter && dev->parent == &i2c->pdev->dev) {
+	    adapter && dev->parent && dev->parent->parent == i2c->drm_dev) {
 		i2c->adapter = adapter;
 		schedule_work(&i2c->work);
 		return NOTIFY_OK;
@@ -110,41 +114,22 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
 static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 {
 	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
+	struct platform_device_info info = {
+		.parent = i2c->drm_dev,
+		.name = adapter_name,
+		.swnode = &xe_i2c_adapter_node,
+	};
 	struct platform_device *pdev;
-	int ret;
-	u32 id;
-
-	id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
-
-	/*
-	 * Not using platform_device_register_full() here because we don't have
-	 * a handle to the platform_device before it returns. xe_i2c_notifier()
-	 * uses that handle, but it may be called before
-	 * platform_device_register_full() is done.
-	 */
-	pdev = platform_device_alloc(adapter_name, id);
-	if (!pdev)
-		return -ENOMEM;
 
-	ret = device_create_managed_software_node(&pdev->dev,
-						  xe_i2c_adapter_properties,
-						  NULL);
-	if (ret)
-		goto err_pdev_put;
+	info.id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
 
-	pdev->dev.parent = i2c->drm_dev;
-	i2c->pdev = pdev;
+	pdev = platform_device_register_full(&info);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
-	ret = platform_device_add(pdev);
-	if (ret)
-		goto err_pdev_put;
+	i2c->pdev = pdev;
 
 	return 0;
-
-err_pdev_put:
-	platform_device_put(pdev);
-
-	return ret;
 }
 
 static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
-- 
2.43.0

