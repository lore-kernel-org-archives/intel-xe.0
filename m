Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4FAC5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 20:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD86C10E87E;
	Fri, 30 May 2025 20:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PH2AwgGI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C0410E87A
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 20:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748637264; x=1780173264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K3FdjElLYKZq6JaUYsUYJ5Vc/wp2u0acHhjHGWcZw94=;
 b=PH2AwgGI5C6N79h6CWo3ZqNZxsSvS59RQXSQ3A5pG8/O/Vot37Vfs2vB
 JnxEVvjZKNrAe/Gf8vDAMEyVh5281dUzfM/raIiFyuWyHRTgeZVlT0F+g
 sIxq3zOvWlCowqcJuuX/Kn7MAwyr/0YU8X5Ja+NyjBy4vez2CWh/JtIG5
 U4xkrZSHci6b92fw8jre/wzhkQ7+40jgO3iA52Zbostkl9sTyrDAWuJzn
 oVTqbSWFF3gzWQnKTk97LkNCgLroGKNlWHA5kTukNIWdDsSWNI7M2urpg
 mj8QXqSDLPtmIrakcVh3Jci9zhmk2gcs6uveesUhXLfuFFP+yutC2qq2M Q==;
X-CSE-ConnectionGUID: bXcBcnFBRze2V5E6GQScDw==
X-CSE-MsgGUID: BvFneS8cQ7a+DKx64Ib5Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405777"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="54405777"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 13:34:24 -0700
X-CSE-ConnectionGUID: Mm6ymq2FT5mm0soDhRTJgw==
X-CSE-MsgGUID: SbzVKRsxTbOOmphR/llPIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="149246660"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.23])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 13:34:22 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 04/10] platform/x86/intel: refactor endpoint usage
Date: Fri, 30 May 2025 16:33:41 -0400
Message-ID: <20250530203356.190234-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530203356.190234-1-michael.j.ruhl@intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
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

The use of an endpoint has introduced a dependency
in all class/pmt drivers to have an endpoint allocated.

The telemetry driver has this allocation, the crashlog
does not.

The current usage is very telemetry focused, but should
be common code.

With this in mind, rename the struct telemetry_endpoint
to struct class_endpoint. Refactor the common endpoint
code to be in the class.c module.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmc/core.c       |  3 +-
 drivers/platform/x86/intel/pmc/core.h       |  4 +-
 drivers/platform/x86/intel/pmc/core_ssram.c |  2 +-
 drivers/platform/x86/intel/pmt/class.c      | 45 ++++++++++++++++++
 drivers/platform/x86/intel/pmt/class.h      | 21 +++++++--
 drivers/platform/x86/intel/pmt/telemetry.c  | 51 ++++-----------------
 drivers/platform/x86/intel/pmt/telemetry.h  | 23 ++++------
 7 files changed, 84 insertions(+), 65 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 7a1d11f2914f..805f56665d1d 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -29,6 +29,7 @@
 #include <asm/tsc.h>
 
 #include "core.h"
+#include "../pmt/class.h"
 #include "../pmt/telemetry.h"
 
 /* Maximum number of modes supported by platfoms that has low power mode capability */
@@ -1198,7 +1199,7 @@ int get_primary_reg_base(struct pmc *pmc)
 
 void pmc_core_punit_pmt_init(struct pmc_dev *pmcdev, u32 guid)
 {
-	struct telem_endpoint *ep;
+	struct class_endpoint *ep;
 	struct pci_dev *pcidev;
 
 	pcidev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(10, 0));
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index 945a1c440cca..1c12ea7c3ce3 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -16,7 +16,7 @@
 #include <linux/bits.h>
 #include <linux/platform_device.h>
 
-struct telem_endpoint;
+struct class_endpoint;
 
 #define SLP_S0_RES_COUNTER_MASK			GENMASK(31, 0)
 
@@ -432,7 +432,7 @@ struct pmc_dev {
 
 	bool has_die_c6;
 	u32 die_c6_offset;
-	struct telem_endpoint *punit_ep;
+	struct class_endpoint *punit_ep;
 	struct pmc_info *regmap_list;
 };
 
diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platform/x86/intel/pmc/core_ssram.c
index 739569803017..3e670fc380a5 100644
--- a/drivers/platform/x86/intel/pmc/core_ssram.c
+++ b/drivers/platform/x86/intel/pmc/core_ssram.c
@@ -42,7 +42,7 @@ static u32 pmc_core_find_guid(struct pmc_info *list, const struct pmc_reg_map *m
 
 static int pmc_core_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc)
 {
-	struct telem_endpoint *ep;
+	struct class_endpoint *ep;
 	const u8 *lpm_indices;
 	int num_maps, mode_offset = 0;
 	int ret, mode;
diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 7233b654bbad..bba552131bc2 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -76,6 +76,47 @@ int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid
 }
 EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, "INTEL_PMT");
 
+/* Called when all users unregister and the device is removed */
+static void pmt_class_ep_release(struct kref *kref)
+{
+	struct class_endpoint *ep;
+
+	ep = container_of(kref, struct class_endpoint, kref);
+	kfree(ep);
+}
+
+void intel_pmt_release_endpoint(struct class_endpoint *ep)
+{
+	kref_put(&ep->kref, pmt_class_ep_release);
+}
+EXPORT_SYMBOL_NS_GPL(intel_pmt_release_endpoint, "INTEL_PMT");
+
+int intel_pmt_add_endpoint(struct intel_vsec_device *ivdev,
+			   struct intel_pmt_entry *entry)
+{
+	struct class_endpoint *ep;
+
+	ep = kzalloc(sizeof(*ep), GFP_KERNEL);
+	if (!ep)
+		return -ENOMEM;
+
+	ep->pcidev = ivdev->pcidev;
+	ep->header.access_type = entry->header.access_type;
+	ep->header.guid = entry->header.guid;
+	ep->header.base_offset = entry->header.base_offset;
+	ep->header.size = entry->header.size;
+	ep->base = entry->base;
+	ep->present = true;
+	ep->cb = ivdev->priv_data;
+
+	/* Endpoint lifetimes are managed by kref, not devres */
+	kref_init(&ep->kref);
+
+	entry->ep = ep;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(intel_pmt_add_endpoint, "INTEL_PMT");
 /*
  * sysfs
  */
@@ -97,6 +138,10 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 	if (count > entry->size - off)
 		count = entry->size - off;
 
+	/* verify endpoint is available */
+	if (!entry->ep)
+		return -ENODEV;
+
 	count = pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry->header.guid, buf,
 				    entry->base, off, count);
 
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index b2006d57779d..d2d8f9e31c9d 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -9,8 +9,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 
-#include "telemetry.h"
-
 /* PMT access types */
 #define ACCESS_BARID		2
 #define ACCESS_LOCAL		3
@@ -19,11 +17,19 @@
 #define GET_BIR(v)		((v) & GENMASK(2, 0))
 #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
 
+struct kref;
 struct pci_dev;
 
-struct telem_endpoint {
+struct class_header {
+	u8	access_type;
+	u16	size;
+	u32	guid;
+	u32	base_offset;
+};
+
+struct class_endpoint {
 	struct pci_dev		*pcidev;
-	struct telem_header	header;
+	struct class_header	header;
 	struct pmt_callbacks	*cb;
 	void __iomem		*base;
 	bool			present;
@@ -38,7 +44,7 @@ struct intel_pmt_header {
 };
 
 struct intel_pmt_entry {
-	struct telem_endpoint	*ep;
+	struct class_endpoint	*ep;
 	struct intel_pmt_header	header;
 	struct bin_attribute	pmt_bin_attr;
 	struct kobject		*kobj;
@@ -69,4 +75,9 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry,
 			 struct intel_vsec_device *dev, int idx);
 void intel_pmt_dev_destroy(struct intel_pmt_entry *entry,
 			   struct intel_pmt_namespace *ns);
+
+int intel_pmt_add_endpoint(struct intel_vsec_device *ivdev,
+			   struct intel_pmt_entry *entry);
+void intel_pmt_release_endpoint(struct class_endpoint *ep);
+
 #endif
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index ac3a9bdf5601..27d09867e6a3 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -18,6 +18,7 @@
 #include <linux/overflow.h>
 
 #include "class.h"
+#include "telemetry.h"
 
 #define TELEM_SIZE_OFFSET	0x0
 #define TELEM_GUID_OFFSET	0x4
@@ -93,48 +94,14 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 	return 0;
 }
 
-static int pmt_telem_add_endpoint(struct intel_vsec_device *ivdev,
-				  struct intel_pmt_entry *entry)
-{
-	struct telem_endpoint *ep;
-
-	/* Endpoint lifetimes are managed by kref, not devres */
-	entry->ep = kzalloc(sizeof(*(entry->ep)), GFP_KERNEL);
-	if (!entry->ep)
-		return -ENOMEM;
-
-	ep = entry->ep;
-	ep->pcidev = ivdev->pcidev;
-	ep->header.access_type = entry->header.access_type;
-	ep->header.guid = entry->header.guid;
-	ep->header.base_offset = entry->header.base_offset;
-	ep->header.size = entry->header.size;
-	ep->base = entry->base;
-	ep->present = true;
-	ep->cb = ivdev->priv_data;
-
-	kref_init(&ep->kref);
-
-	return 0;
-}
-
 static DEFINE_XARRAY_ALLOC(telem_array);
 static struct intel_pmt_namespace pmt_telem_ns = {
 	.name = "telem",
 	.xa = &telem_array,
 	.pmt_header_decode = pmt_telem_header_decode,
-	.pmt_add_endpoint = pmt_telem_add_endpoint,
+	.pmt_add_endpoint = intel_pmt_add_endpoint,
 };
 
-/* Called when all users unregister and the device is removed */
-static void pmt_telem_ep_release(struct kref *kref)
-{
-	struct telem_endpoint *ep;
-
-	ep = container_of(kref, struct telem_endpoint, kref);
-	kfree(ep);
-}
-
 unsigned long pmt_telem_get_next_endpoint(unsigned long start)
 {
 	struct intel_pmt_entry *entry;
@@ -155,7 +122,7 @@ unsigned long pmt_telem_get_next_endpoint(unsigned long start)
 }
 EXPORT_SYMBOL_NS_GPL(pmt_telem_get_next_endpoint, "INTEL_PMT_TELEMETRY");
 
-struct telem_endpoint *pmt_telem_register_endpoint(int devid)
+struct class_endpoint *pmt_telem_register_endpoint(int devid)
 {
 	struct intel_pmt_entry *entry;
 	unsigned long index = devid;
@@ -174,9 +141,9 @@ struct telem_endpoint *pmt_telem_register_endpoint(int devid)
 }
 EXPORT_SYMBOL_NS_GPL(pmt_telem_register_endpoint, "INTEL_PMT_TELEMETRY");
 
-void pmt_telem_unregister_endpoint(struct telem_endpoint *ep)
+void pmt_telem_unregister_endpoint(struct class_endpoint *ep)
 {
-	kref_put(&ep->kref, pmt_telem_ep_release);
+	intel_pmt_release_endpoint(ep);
 }
 EXPORT_SYMBOL_NS_GPL(pmt_telem_unregister_endpoint, "INTEL_PMT_TELEMETRY");
 
@@ -206,7 +173,7 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info)
 }
 EXPORT_SYMBOL_NS_GPL(pmt_telem_get_endpoint_info, "INTEL_PMT_TELEMETRY");
 
-int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
+int pmt_telem_read(struct class_endpoint *ep, u32 id, u64 *data, u32 count)
 {
 	u32 offset, size;
 
@@ -226,7 +193,7 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
 }
 EXPORT_SYMBOL_NS_GPL(pmt_telem_read, "INTEL_PMT_TELEMETRY");
 
-int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count)
+int pmt_telem_read32(struct class_endpoint *ep, u32 id, u32 *data, u32 count)
 {
 	u32 offset, size;
 
@@ -245,7 +212,7 @@ int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count)
 }
 EXPORT_SYMBOL_NS_GPL(pmt_telem_read32, "INTEL_PMT_TELEMETRY");
 
-struct telem_endpoint *
+struct class_endpoint *
 pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev, u32 guid, u16 pos)
 {
 	int devid = 0;
@@ -279,7 +246,7 @@ static void pmt_telem_remove(struct auxiliary_device *auxdev)
 	for (i = 0; i < priv->num_entries; i++) {
 		struct intel_pmt_entry *entry = &priv->entry[i];
 
-		kref_put(&entry->ep->kref, pmt_telem_ep_release);
+		pmt_telem_unregister_endpoint(entry->ep);
 		intel_pmt_dev_destroy(entry, &pmt_telem_ns);
 	}
 	mutex_unlock(&ep_lock);
diff --git a/drivers/platform/x86/intel/pmt/telemetry.h b/drivers/platform/x86/intel/pmt/telemetry.h
index d45af5512b4e..e987dd32a58a 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.h
+++ b/drivers/platform/x86/intel/pmt/telemetry.h
@@ -2,6 +2,8 @@
 #ifndef _TELEMETRY_H
 #define _TELEMETRY_H
 
+#include "class.h"
+
 /* Telemetry types */
 #define PMT_TELEM_TELEMETRY	0
 #define PMT_TELEM_CRASHLOG	1
@@ -9,16 +11,9 @@
 struct telem_endpoint;
 struct pci_dev;
 
-struct telem_header {
-	u8	access_type;
-	u16	size;
-	u32	guid;
-	u32	base_offset;
-};
-
 struct telem_endpoint_info {
 	struct pci_dev		*pdev;
-	struct telem_header	header;
+	struct class_header	header;
 };
 
 /**
@@ -47,7 +42,7 @@ unsigned long pmt_telem_get_next_endpoint(unsigned long start);
  * * endpoint    - On success returns pointer to the telemetry endpoint
  * * -ENXIO      - telemetry endpoint not found
  */
-struct telem_endpoint *pmt_telem_register_endpoint(int devid);
+struct class_endpoint *pmt_telem_register_endpoint(int devid);
 
 /**
  * pmt_telem_unregister_endpoint() - Unregister a telemetry endpoint
@@ -55,7 +50,7 @@ struct telem_endpoint *pmt_telem_register_endpoint(int devid);
  *
  * Decrements the kref usage counter for the endpoint.
  */
-void pmt_telem_unregister_endpoint(struct telem_endpoint *ep);
+void pmt_telem_unregister_endpoint(struct class_endpoint *ep);
 
 /**
  * pmt_telem_get_endpoint_info() - Get info for an endpoint from its devid
@@ -80,8 +75,8 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info);
  * * endpoint    - On success returns pointer to the telemetry endpoint
  * * -ENXIO      - telemetry endpoint not found
  */
-struct telem_endpoint *pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev,
-				u32 guid, u16 pos);
+struct class_endpoint *pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev,
+							    u32 guid, u16 pos);
 
 /**
  * pmt_telem_read() - Read qwords from counter sram using sample id
@@ -101,7 +96,7 @@ struct telem_endpoint *pmt_telem_find_and_register_endpoint(struct pci_dev *pcid
  * * -EPIPE      - The device was removed during the read. Data written
  *                 but should be considered invalid.
  */
-int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count);
+int pmt_telem_read(struct class_endpoint *ep, u32 id, u64 *data, u32 count);
 
 /**
  * pmt_telem_read32() - Read qwords from counter sram using sample id
@@ -121,6 +116,6 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count);
  * * -EPIPE      - The device was removed during the read. Data written
  *                 but should be considered invalid.
  */
-int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count);
+int pmt_telem_read32(struct class_endpoint *ep, u32 id, u32 *data, u32 count);
 
 #endif
-- 
2.49.0

