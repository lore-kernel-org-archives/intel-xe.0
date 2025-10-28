Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524CECCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 21:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E65910E66C;
	Tue, 28 Oct 2025 21:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iatscc2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6B110E66A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761686211; x=1793222211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b6UuJEjvbYzIw/gXVG3cmgZOvzB0hV0ncyPMc6UCh6s=;
 b=Iatscc2Wl6oUM/LkQxInAk06qlMTHy/8ENbSbw/92lJQXyXsXyfl0nkB
 9NFDaHCWtKMCl7z5jUjdT8Z9DGCZaaiFeMFCcCZHkAhHy9Wn9TqR8Zs1j
 M8UyEn6S2iNUyP1W9r5Vf7PoVdEQepSWlTMg3H0PhCjDxm/LuAjLRG2nW
 L+sbv18rRpK7L9083wlwzIFKJfrPnLzZIbmgfGYD2i0FS/eb8r+VVwC+/
 HpV51OUoDe2pFMlb5lCMswCaFy4OVS+qX8+zNbkgTtmiE02WPZioLvSP9
 Nqz9Z9dZ+IXuA/VypAPOorrg7UmiIUeQPKmIl9uYTKPzf8FL2gj8QSgO9 Q==;
X-CSE-ConnectionGUID: SoNcZ7VuRp6WLrujYic88g==
X-CSE-MsgGUID: YZBMQRe/QVi5PZHV1Az7lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63894449"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63894449"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 14:16:51 -0700
X-CSE-ConnectionGUID: JJgwSTxER9eFOsU8HlL99w==
X-CSE-MsgGUID: 50zixfAQTCCLWL6FdUMrIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="185801974"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 14:16:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: ilpo.jarvinen@linux.intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] CI: test PCI rebar changes
Date: Tue, 28 Oct 2025 14:16:13 -0700
Message-ID: <20251028211613.3228940-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.51.0
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

Test patches from Ilpo for PCI rebar:

b4 shazam -P1-6 20251028173551.22578-7-ilpo.jarvinen@linux.intel.com
... solve conflicts and squash.

For xe CI tests only, not intended for review/merge.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c |  24 --------
 drivers/pci/iov.c            |  15 ++---
 drivers/pci/pci-sysfs.c      |  15 +----
 drivers/pci/pci.c            |   4 ++
 drivers/pci/pci.h            |   8 +--
 drivers/pci/setup-bus.c      | 115 +++++++++++++++++++++++++----------
 drivers/pci/setup-res.c      |  30 +++------
 7 files changed, 103 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b62a96f8ef9eb..bed62ecdbc527 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -27,36 +27,12 @@
 
 #define BAR_SIZE_SHIFT 20
 
-/*
- * Release all the BARs that could influence/block LMEMBAR resizing, i.e.
- * assigned IORESOURCE_MEM_64 BARs
- */
-static void release_bars(struct pci_dev *pdev)
-{
-	struct resource *res;
-	int i;
-
-	pci_dev_for_each_resource(pdev, res, i) {
-		/* Resource already un-assigned, do not reset it */
-		if (!res->parent)
-			continue;
-
-		/* No need to release unrelated BARs */
-		if (!(res->flags & IORESOURCE_MEM_64))
-			continue;
-
-		pci_release_resource(pdev, i);
-	}
-}
-
 static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int bar_size = pci_rebar_bytes_to_size(size);
 	int ret;
 
-	release_bars(pdev);
-
 	ret = pci_resize_resource(pdev, resno, bar_size);
 	if (ret) {
 		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 77dee43b78583..04b675e909630 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -158,8 +158,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
-void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
-			       resource_size_t size)
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno, int size)
 {
 	if (!pci_resource_is_iov(resno)) {
 		pci_warn(dev, "%s is not an IOV resource\n",
@@ -167,7 +166,8 @@ void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
 		return;
 	}
 
-	dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)] = size;
+	resno = pci_resource_num_to_vf_bar(resno);
+	dev->sriov->barsz[resno] = pci_rebar_size_to_bytes(size);
 }
 
 bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
@@ -1340,7 +1340,6 @@ EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
 int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
 {
 	u32 sizes;
-	int ret;
 
 	if (!pci_resource_is_iov(resno))
 		return -EINVAL;
@@ -1355,13 +1354,7 @@ int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
 	if (!(sizes & BIT(size)))
 		return -EINVAL;
 
-	ret = pci_rebar_set_size(dev, resno, size);
-	if (ret)
-		return ret;
-
-	pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
-
-	return 0;
+	return pci_rebar_set_size(dev, resno, size);
 }
 EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
 
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 9d6f74bd95f8c..caffd20abb9f6 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1599,18 +1599,13 @@ static ssize_t __resource_resize_store(struct device *dev, int n,
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pci_bus *bus = pdev->bus;
-	struct resource *b_win, *res;
 	unsigned long size;
-	int ret, i;
+	int ret;
 	u16 cmd;
 
 	if (kstrtoul(buf, 0, &size) < 0)
 		return -EINVAL;
 
-	b_win = pbus_select_window(bus, pci_resource_n(pdev, n));
-	if (!b_win)
-		return -EINVAL;
-
 	device_lock(dev);
 	if (dev->driver || pci_num_vf(pdev)) {
 		ret = -EBUSY;
@@ -1632,14 +1627,6 @@ static ssize_t __resource_resize_store(struct device *dev, int n,
 
 	pci_remove_resource_files(pdev);
 
-	pci_dev_for_each_resource(pdev, res, i) {
-		if (i >= PCI_BRIDGE_RESOURCES)
-			break;
-
-		if (b_win == pbus_select_window(bus, res))
-			pci_release_resource(pdev, i);
-	}
-
 	ret = pci_resize_resource(pdev, n, size);
 
 	pci_assign_unassigned_bus_resources(bus);
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b14dd064006cc..7dfc58b0e55ef 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3803,6 +3803,10 @@ int pci_rebar_set_size(struct pci_dev *pdev, int bar, int size)
 	ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
 	ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
 	pci_write_config_dword(pdev, pos + PCI_REBAR_CTRL, ctrl);
+
+	if (pci_resource_is_iov(bar))
+		pci_iov_resource_set_size(pdev, bar, size);
+
 	return 0;
 }
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4492b809094b5..d22e595b38916 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -421,8 +421,9 @@ enum pci_bar_type {
 struct device *pci_get_host_bridge_device(struct pci_dev *dev);
 void pci_put_host_bridge_device(struct device *dev);
 
+void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int size);
+int pci_do_resource_release_and_resize(struct pci_dev *dev, int resno, int size);
 unsigned int pci_rescan_bus_bridge_resize(struct pci_dev *bridge);
-int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res);
 int __must_check pci_reassign_resource(struct pci_dev *dev, int i, resource_size_t add_size, resource_size_t align);
 
 int pci_configure_extended_tags(struct pci_dev *dev, void *ign);
@@ -808,8 +809,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
-void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
-			       resource_size_t size);
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno, int size);
 bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
 static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
 {
@@ -851,7 +851,7 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 	return 0;
 }
 static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
-					     resource_size_t size) { }
+					     int size) { }
 static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
 {
 	return false;
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 4a8735b275e47..8da83b612c59d 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -2420,18 +2420,16 @@ EXPORT_SYMBOL_GPL(pci_assign_unassigned_bridge_resources);
  * release it when possible. If the bridge window contains assigned
  * resources, it cannot be released.
  */
-int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
+static int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res,
+					  struct list_head *saved)
 {
 	unsigned long type = res->flags;
 	struct pci_dev_resource *dev_res;
 	struct pci_dev *bridge;
-	LIST_HEAD(saved);
 	LIST_HEAD(added);
 	LIST_HEAD(failed);
 	unsigned int i;
-	int ret;
-
-	down_read(&pci_bus_sem);
+	int ret = 0;
 
 	while (!pci_is_root_bus(bus)) {
 		bridge = bus->self;
@@ -2443,9 +2441,9 @@ int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
 
 		/* Ignore BARs which are still in use */
 		if (!res->child) {
-			ret = add_to_list(&saved, bridge, res, 0, 0);
+			ret = add_to_list(saved, bridge, res, 0, 0);
 			if (ret)
-				goto cleanup;
+				return ret;
 
 			pci_release_resource(bridge, i);
 		} else {
@@ -2459,10 +2457,8 @@ int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
 		bus = bus->parent;
 	}
 
-	if (list_empty(&saved)) {
-		up_read(&pci_bus_sem);
+	if (!bridge)
 		return -ENOENT;
-	}
 
 	__pci_bus_size_bridges(bridge->subordinate, &added);
 	__pci_bridge_assign_resources(bridge, &added, &failed);
@@ -2470,49 +2466,102 @@ int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
 		free_list(&added);
 
 	if (!list_empty(&failed)) {
-		if (pci_required_resource_failed(&failed, type)) {
+		if (pci_required_resource_failed(&failed, type))
 			ret = -ENOSPC;
-			goto cleanup;
-		}
-		/* Only resources with unrelated types failed (again) */
 		free_list(&failed);
+		if (ret)
+			return ret;
+
+		/* Only resources with unrelated types failed (again) */
 	}
 
-	list_for_each_entry(dev_res, &saved, list) {
+	list_for_each_entry(dev_res, saved, list) {
+		struct pci_dev *dev = dev_res->dev;
+
 		/* Skip the bridge we just assigned resources for */
-		if (bridge == dev_res->dev)
+		if (bridge == dev)
+			continue;
+
+		if (!dev->subordinate)
 			continue;
 
-		bridge = dev_res->dev;
-		pci_setup_bridge(bridge->subordinate);
+		pci_setup_bridge(dev->subordinate);
 	}
 
-	free_list(&saved);
-	up_read(&pci_bus_sem);
 	return 0;
+}
 
-cleanup:
-	/* Restore size and flags */
-	list_for_each_entry(dev_res, &failed, list)
-		restore_dev_resource(dev_res);
-	free_list(&failed);
+int pci_do_resource_release_and_resize(struct pci_dev *pdev, int resno, int size)
+{
+	struct resource *res = pci_resource_n(pdev, resno);
+	struct pci_dev_resource *dev_res;
+	struct pci_bus *bus = pdev->bus;
+	struct resource *b_win, *r;
+	LIST_HEAD(saved);
+	unsigned int i;
+	int ret;
+
+	b_win = pbus_select_window(bus, res);
+	if (!b_win)
+		return -EINVAL;
+
+	pci_dev_for_each_resource(pdev, r, i) {
+		if (i >= PCI_BRIDGE_RESOURCES)
+			break;
+
+		if (b_win != pbus_select_window(bus, r))
+			continue;
+
+		ret = add_to_list(&saved, pdev, r, 0, 0);
+		if (ret)
+			goto restore;
+		pci_release_resource(pdev, i);
+	}
+
+	pci_resize_resource_set_size(pdev, resno, size);
+
+	if (!bus->self)
+		goto out;
+
+	guard(rwsem_read)(&pci_bus_sem);
+	ret = pbus_reassign_bridge_resources(bus, res, &saved);
+	if (ret)
+		goto restore;
+
+out:
+	free_list(&saved);
+	return ret;
 
+restore:
 	/* Revert to the old configuration */
 	list_for_each_entry(dev_res, &saved, list) {
 		struct resource *res = dev_res->res;
+		struct pci_dev *dev = dev_res->dev;
 
-		bridge = dev_res->dev;
-		i = pci_resource_num(bridge, res);
+		i = pci_resource_num(dev, res);
+
+		if (res->parent) {
+			release_child_resources(res);
+			pci_release_resource(dev, i);
+		}
 
 		restore_dev_resource(dev_res);
 
-		pci_claim_resource(bridge, i);
-		pci_setup_bridge(bridge->subordinate);
-	}
-	free_list(&saved);
-	up_read(&pci_bus_sem);
+		ret = pci_claim_resource(dev, i);
+		if (ret)
+			continue;
 
-	return ret;
+		if (i < PCI_BRIDGE_RESOURCES) {
+			const char *res_name = pci_resource_name(dev, i);
+
+			pci_update_resource(dev, i);
+			pci_info(dev, "%s %pR: old value restored\n",
+				 res_name, res);
+		}
+		if (dev->subordinate)
+			pci_setup_bridge(dev->subordinate);
+	}
+	goto out;
 }
 
 void pci_assign_unassigned_bus_resources(struct pci_bus *bus)
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c3ba4ccecd433..93c70f8a85523 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -444,23 +444,19 @@ static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev,
 	return cmd & PCI_COMMAND_MEMORY;
 }
 
-static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
-					 int size)
+void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int size)
 {
 	resource_size_t res_size = pci_rebar_size_to_bytes(size);
 	struct resource *res = pci_resource_n(dev, resno);
 
-	if (!pci_resource_is_iov(resno)) {
-		resource_set_size(res, res_size);
-	} else {
-		resource_set_size(res, res_size * pci_sriov_get_totalvfs(dev));
-		pci_iov_resource_set_size(dev, resno, res_size);
-	}
+	if (pci_resource_is_iov(resno))
+		res_size *= pci_sriov_get_totalvfs(dev);
+
+	resource_set_size(res, res_size);
 }
 
 int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 {
-	struct resource *res = pci_resource_n(dev, resno);
 	struct pci_host_bridge *host;
 	int old, ret;
 	u32 sizes;
@@ -470,10 +466,6 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (host->preserve_config)
 		return -ENOTSUPP;
 
-	/* Make sure the resource isn't assigned before resizing it. */
-	if (!(res->flags & IORESOURCE_UNSET))
-		return -EBUSY;
-
 	if (pci_resize_is_memory_decoding_enabled(dev, resno))
 		return -EBUSY;
 
@@ -492,19 +484,13 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (ret)
 		return ret;
 
-	pci_resize_resource_set_size(dev, resno, size);
-
-	/* Check if the new config works by trying to assign everything. */
-	if (dev->bus->self) {
-		ret = pbus_reassign_bridge_resources(dev->bus, res);
-		if (ret)
-			goto error_resize;
-	}
+	ret = pci_do_resource_release_and_resize(dev, resno, size);
+	if (ret)
+		goto error_resize;
 	return 0;
 
 error_resize:
 	pci_rebar_set_size(dev, resno, old);
-	pci_resize_resource_set_size(dev, resno, old);
 	return ret;
 }
 EXPORT_SYMBOL(pci_resize_resource);
-- 
2.51.0

