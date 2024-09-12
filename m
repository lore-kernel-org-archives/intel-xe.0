Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACF5EED63F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD0E10EC12;
	Thu, 12 Sep 2024 18:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKU51Exg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5842510E02A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726166540; x=1757702540;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1FyhjEujvcHbnTpXOjI5J/XRQNsLRqw6RVYF/BcYzR4=;
 b=UKU51ExgO7pkAm0wW/43F8jRgzeOR8pFzf+ZAdeDYtIN+MHk6bFkt5Ho
 IpxrN7azb6ulJIeuODqBAD5FpXvx9fIxitoMqc6f7Eoo/4RunTqRKOAnw
 v46Jw/oDA+qJFPbyKDfwwSBUdknxZcN4zEn/ZXLv5FjD2iz46s5pYJhkR
 jSWDCJEPt9JUiqaRQ2fd15y7IlGZarzKBC0AGVpufpC0RNy7iK0O5E6SR
 lM0JXI+ZOdCVsYLzBx3l4ljisp6ZtLCnbqVvOcJtBpZDHIg/kaMriBc0d
 eJlVwo0M24auy1AVkKG92VdHUJZfD1TZcmpjCY1vTW9v96dYNJMFKY2/6 g==;
X-CSE-ConnectionGUID: d2IMI1YNQ4a5axUShKX+gA==
X-CSE-MsgGUID: e46ryXmSRlG438H07LxkDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36183408"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="36183408"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:42:19 -0700
X-CSE-ConnectionGUID: NeHZ+fcsRf6kOW1gQsQKSA==
X-CSE-MsgGUID: 8PJjBEB5QO6LWnMZ5L5GVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="72399411"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:42:18 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 michael.j.ruhl@intel.com
Subject: [PATCH v13 2/4] platform/x86/intel/vsec: Add PMT read callbacks
Date: Thu, 12 Sep 2024 14:42:07 -0400
Message-ID: <20240912184210.914612-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240912184210.914612-1-michael.j.ruhl@intel.com>
References: <20240912184210.914612-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Some PMT providers require device specific actions before their telemetry
can be read. Provide assignable PMT read callbacks to allow providers to
perform those actions.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c |  1 +
 include/linux/intel_vsec.h        | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 2b46807f868b..7b5cc9993974 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	intel_vsec_dev->num_resources = header->num_entries;
 	intel_vsec_dev->quirks = info->quirks;
 	intel_vsec_dev->base_addr = info->base_addr;
+	intel_vsec_dev->priv_data = info->priv_data;
 
 	if (header->id == VSEC_ID_SDSI)
 		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 6495e37c9079..11ee185566c3 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -67,10 +67,24 @@ enum intel_vsec_quirks {
 	VSEC_QUIRK_EARLY_HW     = BIT(4),
 };
 
+/**
+ * struct pmt_callbacks - Callback infrastructure for PMT devices
+ * ->read_telem() when specified, called by client driver to access PMT data (instead
+ * of direct copy).
+ * @pdev:  PCI device reference for the callback's use
+ * @guid:  ID of data to acccss
+ * @data:  buffer for the data to be copied
+ * @count: size of buffer
+ */
+struct pmt_callbacks {
+	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, u32 count);
+};
+
 /**
  * struct intel_vsec_platform_info - Platform specific data
  * @parent:    parent device in the auxbus chain
  * @headers:   list of headers to define the PMT client devices to create
+ * @priv_data: private data, usable by parent devices, currently a callback
  * @caps:      bitmask of PMT capabilities for the given headers
  * @quirks:    bitmask of VSEC device quirks
  * @base_addr: allow a base address to be specified (rather than derived)
@@ -78,6 +92,7 @@ enum intel_vsec_quirks {
 struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
+	void *priv_data;
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
-- 
2.44.0

