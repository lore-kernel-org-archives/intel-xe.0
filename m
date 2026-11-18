Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353B5606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Luca7+Cv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBCE112089;
	Wed, 18 Nov 2026 22:21:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F3F11207F
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795040498; x=1826576498;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uay/Cx0/k430084MsYY3VlYn1ElgrwCY9RQJnFYgDyE=;
 b=Luca7+CvISVPItMWKuqjV2WeP7UqIpT+Juxg4Kti5rvmCxg//Vvpq5+N
 txMPBjhOee6HMfpkS3cW1ExDkY8ufofGj3PtET9dcMsOWkGKauWTJGBHv
 Hy/96dLhxWU13pfEDVvsIBE88Ezc3YYOm9TwSsD/iMBIVKEJI/qelqXJX
 xYXBO01CXe8V/CNtuBz/Au8ofuxEEPFcwreRTphMZ5VMs+sGXTPc7MtuN
 gOZ/M9i4XAG/bQaptkeEcZUVYDAgL1VdFsPV01yzJ1D4aqz/GRjG3mkyI
 3eah25cbjlP4TBSn9+AthM8EXxVeckRTCS913rXG8arwy/pViPRl8vzcR Q==;
X-CSE-ConnectionGUID: nWBIUFZ7Tku8VneS87fDOQ==
X-CSE-MsgGUID: 8d6OELOcRBaVdaq+38kebw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3758163"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3758163"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:21:36 -0800
X-CSE-ConnectionGUID: SQQgjdywTW+YBaQXCphXSQ==
X-CSE-MsgGUID: NkYg0le3Tyix4tYJ9YQqmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10508333"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:21:36 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v18 01/19] platform/x86/intel/pmt: Introduce a callback for
 discovery data
Date: Wed, 18 Nov 2026 14:21:28 -0800
Message-ID: <20261118222127.3550266-22-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118222127.3550266-21-michael.j.ruhl@intel.com>
References: <20261118222127.3550266-21-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some devices require special handling to access discovery data.

Provide a callback to allow for the special handling.

Suggested-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c | 18 ++++++++++++------
 include/linux/intel_vsec.h             |  6 ++++++
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 2b11c4012f6a..601cdf68f0bc 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -466,12 +466,17 @@ static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
 	switch (ivdev->src) {
 	case INTEL_VSEC_DISC_PCI: {
 		struct resource *disc_res = &ivdev->resource[idx];
+		struct pmt_callbacks *cb = ivdev->priv_data;
 		void __iomem *disc_table;
+		int ret = 0;
 
 		disc_table = devm_ioremap_resource(dev, disc_res);
 		if (IS_ERR(disc_table))
 			return PTR_ERR(disc_table);
 
+		/* Used by crashlog driver */
+		entry->disc_table = disc_table;
+
 		/*
 		 * The mapped resource is sized by the namespace's DVSEC
 		 * entry_size (in dwords), which can be less than the default
@@ -480,13 +485,14 @@ static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
 		 * region.
 		 */
 		memset(entry->disc_header, 0, header_bytes);
-		memcpy_fromio(entry->disc_header, disc_table,
-			      min(header_bytes, resource_size(disc_res)));
-
-		/* Used by crashlog driver */
-		entry->disc_table = disc_table;
 
-		return 0;
+		if (cb && cb->read_discovery)
+			ret = cb->read_discovery(ivdev->dev, ivdev->cap_id, idx,
+						 entry->disc_header);
+		else
+			memcpy_fromio(entry->disc_header, disc_table,
+				      min(header_bytes, resource_size(disc_res)));
+		return ret;
 	}
 	case INTEL_VSEC_DISC_ACPI: {
 		memcpy(entry->disc_header, &ivdev->acpi_disc[idx][0], header_bytes);
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 8686e79c4f75..400231989b49 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -94,6 +94,11 @@ enum intel_vsec_quirks {
  * * data:  buffer for the data to be copied
  * * off:   offset into the requested buffer
  * * count: size of buffer
+ * @read_discovery: when specified called by client driver to read PMT discovery structs
+ * * dev:     device reference for the callback's use
+ * * cap_id: telem, crashlog, etc, ilog2 of VSEC_CAP value
+ * * idx:     element to access
+ * * disc_data:  buffer for the discovery data to be copied
  * @read_reg: when specified called by client driver to read PMT state
  * * dev:      device reference for the callback's use
  * * guid:     ID of data to access
@@ -107,6 +112,7 @@ enum intel_vsec_quirks {
  */
 struct pmt_callbacks {
 	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
+	int (*read_discovery)(struct device *dev, unsigned long cap_id, u32 idx, u32 *disc_data);
 	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
 	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
 };
-- 
2.43.0

