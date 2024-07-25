Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A99EC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 12:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118A110E7DE;
	Thu, 25 Jul 2024 12:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyw6Ykdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1C210E7DF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 12:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721910251; x=1753446251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wyN+6vlgHGDP8X6HQQjWIl85e1yzHPrW2QH2cE5m7Yo=;
 b=eyw6YkdteSW9RfgUytzWQMhU3bnRCyZwXRxh14BpqMIPkI94nVK3XHzC
 5+PowsieCmdyRlOBWes96JczAUEF5kqtkoGt9o7Hd6+0aRkAxi+R9PIDO
 w4vZoncoZoSOcZbIqOOHNdHQwLo69V8PxvpV6oZColGB5BRYYni+Uj4Mt
 ehKEoDpctrj1BaQX9p4VfjEq9Ig3HpEcQoOCh17WPbmgrCBdXI2hV/scg
 wAdeqXQFHlb6N/8SEwNZzg1pX63cW5IHwJz/BdaFdUzlV+mNBIHHqjLi3
 ECycJoZ9iLZnmWwsgaSHcXP04i4gLya9R0vcmVFfdZDZ07gvA2hq2QcXC A==;
X-CSE-ConnectionGUID: E/iYh4bKQEufhcg+WORiRA==
X-CSE-MsgGUID: OBiJZgdsTBqOqocKvBJ8ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19493181"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="19493181"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:24:11 -0700
X-CSE-ConnectionGUID: w/wxsjs1TRye9fEUjZkJUg==
X-CSE-MsgGUID: 0hQkctwTSemzT/TYqwNdUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="53153627"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:24:10 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 matthew.brost@intel.com, andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base adjust
Date: Thu, 25 Jul 2024 08:23:44 -0400
Message-ID: <20240725122346.4063913-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
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

DVSEC offsets are based on the endpoint BAR.  If an endpoint is
not available allow the offset information to be adjusted by the
parent driver.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.h     | 1 +
 drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
 drivers/platform/x86/intel/vsec.c          | 1 +
 include/linux/intel_vsec.h                 | 3 +++
 4 files changed, 14 insertions(+)

diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index a267ac964423..984cd40ee814 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -46,6 +46,7 @@ struct intel_pmt_entry {
 	void __iomem		*base;
 	struct pmt_callbacks	*cb;
 	unsigned long		base_addr;
+	s32			base_adjust;
 	size_t			size;
 	u32			guid;
 	int			devid;
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index c9feac859e57..88e4f1315097 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 	header->access_type = TELEM_ACCESS(readl(disc_table));
 	header->guid = readl(disc_table + TELEM_GUID_OFFSET);
 	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET);
+	if (entry->base_adjust) {
+		u32 new_base = header->base_offset + entry->base_adjust;
+
+		dev_dbg(dev, "Adjusting base offset from 0x%x to 0x%x\n",
+			header->base_offset, new_base);
+		header->base_offset = new_base;
+	}
 
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = TELEM_SIZE(readl(disc_table));
@@ -302,6 +309,8 @@ static int pmt_telem_probe(struct auxiliary_device *auxdev, const struct auxilia
 	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
 		struct intel_pmt_entry *entry = &priv->entry[priv->num_entries];
 
+		entry->base_adjust = intel_vsec_dev->base_adjust;
+
 		mutex_lock(&ep_lock);
 		ret = intel_pmt_dev_create(entry, &pmt_telem_ns, intel_vsec_dev, i);
 		mutex_unlock(&ep_lock);
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 7b5cc9993974..be079d62a7bc 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	intel_vsec_dev->num_resources = header->num_entries;
 	intel_vsec_dev->quirks = info->quirks;
 	intel_vsec_dev->base_addr = info->base_addr;
+	intel_vsec_dev->base_adjust = info->base_adjust;
 	intel_vsec_dev->priv_data = info->priv_data;
 
 	if (header->id == VSEC_ID_SDSI)
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 11ee185566c3..75d17fa10d05 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -88,6 +88,7 @@ struct pmt_callbacks {
  * @caps:      bitmask of PMT capabilities for the given headers
  * @quirks:    bitmask of VSEC device quirks
  * @base_addr: allow a base address to be specified (rather than derived)
+ * @base_adjust: allow adjustment to base offset information
  */
 struct intel_vsec_platform_info {
 	struct device *parent;
@@ -96,6 +97,7 @@ struct intel_vsec_platform_info {
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
+	s32 base_adjust;
 };
 
 /**
@@ -121,6 +123,7 @@ struct intel_vsec_device {
 	size_t priv_data_size;
 	unsigned long quirks;
 	u64 base_addr;
+	s32 base_adjust;
 };
 
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
-- 
2.44.0

