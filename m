Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDF5C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 21:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E823910E5FA;
	Fri, 10 May 2024 21:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOlIcpU7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E99310E5FA
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 21:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715374807; x=1746910807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PdZ1wL9iDaT9U7CahvnVa+QZ8nrD6u6BYnJFXd4MTnA=;
 b=QOlIcpU7lQkgpiN7/roNDlWWsBn6V2ezbRz5pL2nWJWAFjTi+u7WJcfr
 9Unm002ghGG58zNNdDuDtnF5WT+Q6Tq4+Iz0Mxxxb3GzmvVOx6Y3QY7lW
 /X4jQf7nkUNi5BTAs58Cdb/Oqnovp/6VCMj9Vx8hRygC/xySio5iYdHGm
 gJRy/BQcvrMOshu6fXqGsbVfNEkXBkv53VakHXTZx/FWctpwcz5ZfvJyf
 V4Nrlqrq11/aGAWLseHelEfv9El86TmNeo5iuAyiyY2oHEx6nDPiWQRQB
 yyYHHWcV3CmvEIXiFMB5Fz2szvF/EkDJU6KESD7OfzWsiO0CD4L0rwLFk A==;
X-CSE-ConnectionGUID: /e8D8FQPRCKbqcMHbakvpA==
X-CSE-MsgGUID: cRanjO45RZqBGXCQH9nt2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22048290"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22048290"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:07 -0700
X-CSE-ConnectionGUID: Pf7BZcq5RZKXdEWY8oyZoA==
X-CSE-MsgGUID: Cfnmv9iiRIekqzi/ArxsRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34604080"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 14:00:07 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: david.e.box@linux.intel.com, "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 4/6] platform/x86/intel/pmt: Add quirk for BAR0 offset
 adjustment
Date: Fri, 10 May 2024 16:59:36 -0400
Message-ID: <20240510205948.904409-5-michael.j.ruhl@intel.com>
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

The offset for the discovery table is based on the P2SB bar.
If this bar is not available, the parent driver may need to
adjust the offset,

Add a quirk to allow for this adjustment.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 3 +++
 drivers/platform/x86/intel/pmt/telemetry.c | 2 +-
 drivers/platform/x86/intel/vsec.c          | 2 +-
 include/linux/intel_vsec.h                 | 3 +++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 62e36dd89137..957cf74234da 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -349,6 +349,9 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespa
 	if (IS_ERR(entry->disc_table))
 		return PTR_ERR(entry->disc_table);
 
+	if (intel_vsec_dev->quirks & VSEC_QUIRK_P2SB_OFFSET)
+		entry->base_addr = intel_vsec_dev->base_addr;
+
 	ret = ns->pmt_header_decode(entry, dev);
 	if (ret)
 		return ret;
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index c9feac859e57..7be9f9746363 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -77,7 +77,7 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 
 	header->access_type = TELEM_ACCESS(readl(disc_table));
 	header->guid = readl(disc_table + TELEM_GUID_OFFSET);
-	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET);
+	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET) + entry->base_addr;
 
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = TELEM_SIZE(readl(disc_table));
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 5378da9354b6..5a0dfc21eb0f 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -185,7 +185,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
 		header->offset >>= TABLE_OFFSET_SHIFT;
 
-	if (info->base_addr)
+	if (!(quirks & VSEC_QUIRK_P2SB_OFFSET) && info->base_addr)
 		base_addr = info->base_addr;
 	else
 		base_addr = pdev->resource[header->tbir].start;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 04f915a1ba0b..68e3a42040e8 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -65,6 +65,9 @@ enum intel_vsec_quirks {
 
 	/* Platforms requiring quirk in the auxiliary driver */
 	VSEC_QUIRK_EARLY_HW     = BIT(4),
+
+	/* Broken P2SB access work around */
+	VSEC_QUIRK_P2SB_OFFSET  = BIT(5),
 };
 
 struct pmt_callbacks {
-- 
2.44.0

