Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C52E9129E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 14:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A652910E90F;
	Thu,  5 Feb 2026 14:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+RzmKc2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9A810E8FC;
 Thu,  5 Feb 2026 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770303297; x=1801839297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VOtC9yywSwXjs07U2adrKo/FdamwCBYFHG9/q7UtDqU=;
 b=l+RzmKc2kr1Q6IwWbzi4THE+eURbO7Ryb11GZ4VmvhQTbRVQ11tpaTx+
 3dlkXNVmW2RY9UuY/xCN2Wp/igdtgFqamMKN6nFYr/APLCMAyTC/B767Q
 tGRBxmHet16Y8040fTpqq8Ge8MbfZuxYQI96yoveaqaN/IwOtxB92aVBY
 3Q3CvTcIA1OZooO7qIp6wx5Uvu5tOwiDgXmd6SSM4jV0U7IOJyKWlf9vm
 Iocif3u9ahdVcUYopuk1d4EwCmiZ+7yCWgLz1copXWIpWvj1swKWxyA9i
 mH2cq3ahvgwaIocMCdPZQn6NWJGUn3s3hI7wN1us5QOQtNLi6LbkQ61w6 A==;
X-CSE-ConnectionGUID: F1I7L3opSzmakHFnFSM64w==
X-CSE-MsgGUID: DHGADhd2RtqQPtLgU30SPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="89083606"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="89083606"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:54:57 -0800
X-CSE-ConnectionGUID: 3Vbmwj1mRfylR5LJhi8T/A==
X-CSE-MsgGUID: EYtwclAWQqeCq3QTGA2w4A==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.76])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:54:53 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v5 3/6] lib/igt_device_scan: Include PCIe bridge
 upstream port if available
Date: Thu,  5 Feb 2026 15:51:52 +0100
Message-ID: <20260205145427.1338534-11-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205145427.1338534-8-janusz.krzysztofik@linux.intel.com>
References: <20260205145427.1338534-8-janusz.krzysztofik@linux.intel.com>
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

Users of Intel discrete graphics adapters are confused with fake
information on PCIe link bandwidth (speed and size) of their GPU devices
reported by sysfs and userspace tools, including our lsgpu utility.  In
order for the lsgpu to show correct link bandwidth information, we need to
identify an upstream port of a PCIe bridge that sits on the GPU card and
get that information from that port.

Since the tool uses our udev based igt_device_scan library for identifying
GPU devices and printing their properties and attributes, modifications
that we need apply to that library.

When scanning for DRM devices and their PCI parents, the lsgpu utility
requests collection of all their attributes.  When running in this mode,
also try to collect information about upstream ports of PCIe bridges of
discrete GPU devices.  Once collected, the lsgpu utility will show that
information automatically while listing the devices.

While IGT tests are using libpciaccess library for processing PCI devices,
that library requires careful handling in order to avoid collisions among
multiple call sites potentially using it.  That protection is implemented
in igt_device with help of IGT exit handlers. That requires linking with
full igt_core library code, while the lsgpu tool now depends neither on
igt_device nor on igt_core.  To keep that independence, implement the new
code around libpci.  With that approach, refactoring of IGT use of either
libpciaccess or igt_device_scan is avoided.  As an additional benefit,
there is no need to re-implement some functionality, already provided by
libpci function pci_find_cap(), which has no equivalent in libpciaccess.

v5: Address PCI_HEADER_TYPE_MASK missing from <linux/pci_regs.h> in CI,
  - add libpci to docker files.
v4: Replace 0x7f constant with PCI_HEADER_TYPE_MASK symbol (Krzysztof).
v3: Fix incorrect use of ffs(),
  - fix bridge link attribute printing suppressed with DEVTYPE_DISCRETE,
  - in commit description, elaborate more on reasons for using libpci.
v2: Drop unclear GET_REG_MASK macro (Sebastian),
  - reuse no longer needed variable containing PCI_HEADER_TYPE for storing
    PCI_EXP_FLAGS_TYPE,
  - maintain a single instance of struct pci_access throughout processing
    of the whole udev device list (Sebastian).

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10753
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 Dockerfile.build-debian-arm64   |  1 +
 Dockerfile.build-debian-armhf   |  1 +
 Dockerfile.build-debian-minimal |  1 +
 Dockerfile.build-fedora         |  1 +
 lib/igt_device_scan.c           | 88 +++++++++++++++++++++++++++++++--
 lib/meson.build                 |  2 +
 meson.build                     |  1 +
 7 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index cf0625ac72..c3643d70ea 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -23,6 +23,7 @@ RUN apt-get install -y \
 			zlib1g-dev:arm64 \
 			liblzma-dev:arm64 \
 			libcairo-dev:arm64 \
+			libpci-dev:arm64 \
 			libpixman-1-dev:arm64 \
 			libudev-dev:arm64 \
 			libgsl-dev:arm64 \
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index 58b5be82a4..605668441a 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -23,6 +23,7 @@ RUN apt-get install -y \
 			zlib1g-dev:armhf \
 			liblzma-dev:armhf \
 			libcairo-dev:armhf \
+			libpci-dev:armhf \
 			libpixman-1-dev:armhf \
 			libudev-dev:armhf \
 			libgsl-dev:armhf \
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index 3850fb43e5..808d2e32e7 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -14,6 +14,7 @@ RUN apt-get install -y \
 			zlib1g-dev \
 			liblzma-dev \
 			libcairo-dev \
+			libpci-dev \
 			libpixman-1-dev \
 			libudev-dev \
 			libxrandr-dev \
diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index 9399c0a7db..9dd7b73481 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -12,6 +12,7 @@ RUN dnf install -y \
 	'pkgconfig(pixman-1)' \
 	'pkgconfig(valgrind)' \
 	'pkgconfig(cairo)' \
+	'pkgconfig(libpci)' \
 	'pkgconfig(libudev)' \
 	'pkgconfig(glib-2.0)' \
 	'pkgconfig(gsl)' \
diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 11b3034639..9549850005 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -35,7 +35,13 @@
 #include <libudev.h>
 #ifdef __linux__
 #include <linux/limits.h>
+#include <linux/pci_regs.h>
 #endif
+#ifndef PCI_HEADER_TYPE_MASK
+/* Either not linux, or <linux/pci_regs.h> too old */
+#define PCI_HEADER_TYPE_MASK 0x7f
+#endif
+#include <pci/pci.h>
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <sys/types.h>
@@ -913,6 +919,26 @@ static struct igt_device *igt_device_from_syspath(const char *syspath)
 	return NULL;
 }
 
+static bool is_pcie_upstream_bridge(struct pci_dev *dev)
+{
+	struct pci_cap *pcie;
+	uint8_t type;
+
+	type = pci_read_byte(dev, PCI_HEADER_TYPE) & PCI_HEADER_TYPE_MASK;
+	if (type != PCI_HEADER_TYPE_BRIDGE)
+		return false;
+
+	pcie = pci_find_cap(dev, PCI_CAP_ID_EXP, PCI_CAP_NORMAL);
+	if (!pcie)
+		return false;
+
+	type = pci_read_word(dev, pcie->addr + PCI_EXP_FLAGS);
+	type &= PCI_EXP_FLAGS_TYPE;
+	type >>= ffs(PCI_EXP_FLAGS_TYPE) - 1;
+
+	return type == PCI_EXP_TYPE_UPSTREAM;
+}
+
 #define RETRIES_GET_DEVICE 5
 
 static struct igt_device *find_or_add_igt_device(struct udev *udev,
@@ -952,18 +978,52 @@ static struct igt_device *find_or_add_igt_device(struct udev *udev,
 	return idev;
 }
 
+static struct udev_device *get_pcie_upstream_bridge(struct udev *udev,
+						    struct udev_device *dev,
+						    struct pci_access *pacc)
+{
+	igt_assert(pacc);
+
+	for (dev = udev_device_get_parent(dev); dev; dev = udev_device_get_parent(dev)) {
+		struct pci_filter filter;
+		struct pci_dev *pci_dev;
+		const char *slot;
+
+		slot = udev_device_get_property_value(dev, "PCI_SLOT_NAME");
+		if (igt_debug_on(!slot))
+			continue;
+
+		pci_filter_init(pacc, &filter);
+		if (igt_debug_on(pci_filter_parse_slot(&filter, (char *)slot)))
+			continue;
+
+		pci_dev = pci_get_dev(pacc, filter.domain, filter.bus, filter.slot, filter.func);
+		if (igt_debug_on(!pci_dev))
+			continue;
+
+		if (is_pcie_upstream_bridge(pci_dev))
+			break;
+	}
+
+	return dev;
+}
+
 /*
  * For each drm igt_device add or update its parent igt_device to the array.
  * As card/render drm devices mostly have same parent (vkms is an exception)
  * link to it and update corresponding drm_card / drm_render fields.
+ *
+ * If collecting all attributes and the parent is a discrete GPU then also
+ * add or update its bridge's upstream port.
  */
 static void update_or_add_parent(struct udev *udev,
 				 struct udev_device *dev,
 				 struct igt_device *idev,
+				 struct pci_access *pacc,
 				 bool limit_attrs)
 {
-	struct udev_device *parent_dev;
-	struct igt_device *parent_idev;
+	struct igt_device *parent_idev, *bridge_idev;
+	struct udev_device *parent_dev, *bridge_dev;
 	const char *devname;
 
 	/*
@@ -983,6 +1043,19 @@ static void update_or_add_parent(struct udev *udev,
 		parent_idev->drm_render = strdup(devname);
 
 	idev->parent = parent_idev;
+
+	if (!pacc || parent_idev->dev_type != DEVTYPE_DISCRETE)
+		return;
+
+	bridge_dev = get_pcie_upstream_bridge(udev, parent_dev, pacc);
+	if (!bridge_dev)
+		return;
+
+	bridge_idev = find_or_add_igt_device(udev, bridge_dev, limit_attrs);
+	igt_assert(bridge_idev);
+
+	/* override DEVTYPE_INTEGRATED so link attributes won't be omitted */
+	bridge_idev->dev_type = DEVTYPE_ALL;
 }
 
 static struct igt_device *duplicate_device(struct igt_device *dev) {
@@ -1072,6 +1145,7 @@ static void scan_drm_devices(bool limit_attrs)
 	struct udev *udev;
 	struct udev_enumerate *enumerate;
 	struct udev_list_entry *devices, *dev_list_entry;
+	struct pci_access *pacc = NULL;
 	struct igt_device *dev;
 	int ret;
 
@@ -1095,6 +1169,12 @@ static void scan_drm_devices(bool limit_attrs)
 	if (!devices)
 		return;
 
+	/* prepare for upstream bridge port scan if called from lsgpu */
+	if (!limit_attrs) {
+		pacc = pci_alloc();
+		pci_init(pacc);
+	}
+
 	udev_list_entry_foreach(dev_list_entry, devices) {
 		const char *path;
 		struct udev_device *udev_dev;
@@ -1104,10 +1184,12 @@ static void scan_drm_devices(bool limit_attrs)
 		udev_dev = udev_device_new_from_syspath(udev, path);
 		idev = igt_device_new_from_udev(udev_dev, limit_attrs);
 		igt_list_add_tail(&idev->link, &igt_devs.all);
-		update_or_add_parent(udev, udev_dev, idev, limit_attrs);
+		update_or_add_parent(udev, udev_dev, idev, pacc, limit_attrs);
 
 		udev_device_unref(udev_dev);
 	}
+	if (pacc)
+		pci_cleanup(pacc);
 	udev_enumerate_unref(enumerate);
 	udev_unref(udev);
 
diff --git a/lib/meson.build b/lib/meson.build
index d851029e04..d4d2ffa127 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -141,6 +141,7 @@ lib_deps = [
 	libdrm,
 	libdw,
 	libkmod,
+	libpci,
 	libudev,
 	math,
 	pciaccess,
@@ -334,6 +335,7 @@ lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
 
 scan_dep = [
 	glib,
+	libpci,
 	libudev,
 ]
 
diff --git a/meson.build b/meson.build
index 4b2496c016..57849648a3 100644
--- a/meson.build
+++ b/meson.build
@@ -162,6 +162,7 @@ endif
 build_info += 'Valgrind annotations: @0@'.format(valgrind.found())
 
 cairo = dependency('cairo', version : '>1.12.0', required : true)
+libpci = dependency('libpci', required : true)
 libudev = dependency('libudev', required : true)
 glib = dependency('glib-2.0', required : true)
 
-- 
2.52.0

