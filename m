Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA58C25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 21:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99E110E600;
	Fri, 10 May 2024 21:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnpPj4BJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EDC10E3CA
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 21:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715374806; x=1746910806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FUGOQNbi7RpwStQO9ETxlkLagIqpW+rjTcIzjiNY+5g=;
 b=gnpPj4BJltGEu4grwQB4aO64rlGOHsUKK6NpmuD5PeLHOk/hr3Zj7u1T
 yuW5WRrjK0CmeV3Vd3Td/tTDOipu1xbY2wITYxyKgAtSNuDNUchlhBS6v
 3E+3H2rYuAq1raEGZzG260X9sbz3qVSq6eNpOo5tv/OX2sX4saoaPT5uT
 nMKOG5YduFEhfnLHZLbvP2/yWgpxWcTFJ90f3XEVbJ3Pe/Zf/xOuwdCvm
 hxZ6nKUqkFy4+7X3roH+K6mtrsgXfaBSr6oSZdjyjJ0btzSCri3pHnF+r
 Pod42VaBaHn9tamblGglOr1tghlwVjVIg87HK+FAg7q5tJq467GqaAjJm A==;
X-CSE-ConnectionGUID: eJlM46+oQGiut4XlfcInTQ==
X-CSE-MsgGUID: 0zaDbl0YSXmRvR/+KSCGFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22048288"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22048288"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:06 -0700
X-CSE-ConnectionGUID: 3yd8LPN0S+6+k/9eqhsTBw==
X-CSE-MsgGUID: 2RLrZRp+ROaakdyM+tO35A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34604068"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:06 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: david.e.box@linux.intel.com
Subject: [PATCH 3/6] platform/x86/intel/pmt: Add support to use provided read
 callbacks
Date: Fri, 10 May 2024 16:59:35 -0400
Message-ID: <20240510205948.904409-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510205948.904409-1-michael.j.ruhl@intel.com>
References: <20240510205948.904409-1-michael.j.ruhl@intel.com>
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

From: "David E. Box" <david.e.box@linux.intel.com>

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 28 +++++++++++++++++-----
 drivers/platform/x86/intel/pmt/class.h     |  8 +++++--
 drivers/platform/x86/intel/pmt/telemetry.c | 10 ++++----
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index d7939b28e937..62e36dd89137 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -58,6 +58,24 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
 	return count;
 }
 
+void pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
+			 void __iomem *addr, u32 count)
+{
+	if (cb && cb->read_telem) {
+		count = cb->read_telem(pdev, guid, buf, count);
+		return;
+	}
+
+	if (guid == GUID_SPR_PUNIT) {
+		/* PUNIT on SPR only supports aligned 64-bit read */
+		count = pmt_memcpy64_fromio(buf, addr, count);
+		return;
+	}
+
+	memcpy_fromio(buf, addr, count);
+}
+EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, INTEL_PMT);
+
 /*
  * sysfs
  */
@@ -79,11 +97,8 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 	if (count > entry->size - off)
 		count = entry->size - off;
 
-	if (entry->guid == GUID_SPR_PUNIT)
-		/* PUNIT on SPR only supports aligned 64-bit read */
-		count = pmt_memcpy64_fromio(buf, entry->base + off, count);
-	else
-		memcpy_fromio(buf, entry->base + off, count);
+	pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry->header.guid, buf,
+			    entry->base + off, count);
 
 	return count;
 }
@@ -239,6 +254,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
 
 	entry->guid = header->guid;
 	entry->size = header->size;
+	entry->cb = ivdev->priv_data;
 
 	return 0;
 }
@@ -300,7 +316,7 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 		goto fail_ioremap;
 
 	if (ns->pmt_add_endpoint) {
-		ret = ns->pmt_add_endpoint(entry, ivdev->pcidev);
+		ret = ns->pmt_add_endpoint(ivdev, entry);
 		if (ret)
 			goto fail_add_endpoint;
 	}
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index d6f9ccaf28c8..5032c5244eb4 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -24,6 +24,7 @@ struct pci_dev;
 struct telem_endpoint {
 	struct pci_dev		*pcidev;
 	struct telem_header	header;
+	struct pmt_callbacks	*cb;
 	void __iomem		*base;
 	bool			present;
 	struct kref		kref;
@@ -43,6 +44,7 @@ struct intel_pmt_entry {
 	struct kobject		*kobj;
 	void __iomem		*disc_table;
 	void __iomem		*base;
+	struct pmt_callbacks	*cb;
 	unsigned long		base_addr;
 	size_t			size;
 	u32			guid;
@@ -55,10 +57,12 @@ struct intel_pmt_namespace {
 	const struct attribute_group *attr_grp;
 	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
 				 struct device *dev);
-	int (*pmt_add_endpoint)(struct intel_pmt_entry *entry,
-				struct pci_dev *pdev);
+	int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
+				struct intel_pmt_entry *entry);
 };
 
+void pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
+			 void __iomem *addr, u32 count);
 bool intel_pmt_is_early_client_hw(struct device *dev);
 int intel_pmt_dev_create(struct intel_pmt_entry *entry,
 			 struct intel_pmt_namespace *ns,
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 3478f891ea0b..c9feac859e57 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -93,8 +93,8 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 	return 0;
 }
 
-static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
-				  struct pci_dev *pdev)
+static int pmt_telem_add_endpoint(struct intel_vsec_device *ivdev,
+				  struct intel_pmt_entry *entry)
 {
 	struct telem_endpoint *ep;
 
@@ -104,13 +104,14 @@ static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
 		return -ENOMEM;
 
 	ep = entry->ep;
-	ep->pcidev = pdev;
+	ep->pcidev = ivdev->pcidev;
 	ep->header.access_type = entry->header.access_type;
 	ep->header.guid = entry->header.guid;
 	ep->header.base_offset = entry->header.base_offset;
 	ep->header.size = entry->header.size;
 	ep->base = entry->base;
 	ep->present = true;
+	ep->cb = ivdev->priv_data;
 
 	kref_init(&ep->kref);
 
@@ -218,7 +219,8 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
 	if (offset + NUM_BYTES_QWORD(count) > size)
 		return -EINVAL;
 
-	memcpy_fromio(data, ep->base + offset, NUM_BYTES_QWORD(count));
+	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base + offset,
+			    NUM_BYTES_QWORD(count));
 
 	return ep->present ? 0 : -EPIPE;
 }
-- 
2.44.0

