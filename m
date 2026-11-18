Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C3B606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c1xdsCt+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD38311207E;
	Wed, 18 Nov 2026 22:21:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5A6112081
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795040502; x=1826576502;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=S6q4CoHx00wX9ayNpHzhHf1RM3dQTEKLx+xiO1g8tN4=;
 b=c1xdsCt++CpidC39Jfd4AHxhAhakcblQrtmqcgMK7ATa6b7j3G6f24sh
 XRlRPuwhFFdgZauzSYUi9i8MJJOnH+0Xy7qnlKHDUvc2So0oY4yxMofDd
 9LGjRqp8135WzOxjwpWsu3W5U2RAZ4wPFOrs8M7gPO1azJ2J5he+APlq3
 3fQSVZ4LORh8lQJPuG7WN/7FP2+JZbqDJSBVyRLvbC09tmw8Q2Pj3gH71
 VwPSGd1EApa1jwgfQLEFlXzryf+NGgYOSPa4bIlKIbpABisYcQaXrFFag
 rVJmCtbnXLDCsuD2MKBJcHcBxnyUvbH9sYxml+y4rVEIlSAha15au5yLL w==;
X-CSE-ConnectionGUID: UoZPsb/1TFasUVhM510t/Q==
X-CSE-MsgGUID: hWzPL6gpQbmLoeXWWxU/bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3758166"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3758166"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:21:36 -0800
X-CSE-ConnectionGUID: xuTiafxsQJmWAgv4pweWyg==
X-CSE-MsgGUID: 5kamJ2kQQ3yLr0fW5f5f0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10508337"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:21:36 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v18 02/19] platform/x86/intel/pmt: Use the pre-populated
 header info for crashlog
Date: Wed, 18 Nov 2026 14:21:29 -0800
Message-ID: <20261118222127.3550266-23-michael.j.ruhl@intel.com>
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

Discovery data is pre-populated.

Use the data for crashlog probe.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d7018b495217..f7c391d145ff 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -27,10 +27,10 @@
 #define CRASH_TYPE_OOBMSM	1
 
 /* Crashlog Discovery Header */
-#define CONTROL_OFFSET		0x0
-#define GUID_OFFSET		0x4
-#define BASE_OFFSET		0x8
-#define SIZE_OFFSET		0xC
+#define STATUS_IDX		0
+#define GUID_IDX		1
+#define BASE_IDX		2
+#define SIZE_IDX		3
 #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
 #define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
 #define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
@@ -208,10 +208,10 @@ static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
 
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
 {
-	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 *disc_header = entry->disc_header;
 
-	*crash_type = GET_TYPE(discovery_header);
-	*version = GET_VERSION(discovery_header);
+	*crash_type = GET_TYPE(disc_header[STATUS_IDX]);
+	*version = GET_VERSION(disc_header[STATUS_IDX]);
 
 	/*
 	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
@@ -608,15 +608,15 @@ static int pmt_crashlog_pre_decode(struct intel_vsec_device *ivdev,
 static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 				      struct device *dev)
 {
-	void __iomem *disc_table = entry->disc_table;
 	struct intel_pmt_header *header = &entry->header;
+	u32 *disc_header = entry->disc_header;
 
-	header->access_type = GET_ACCESS(readl(disc_table));
-	header->guid = readl(disc_table + GUID_OFFSET);
-	header->base_offset = readl(disc_table + BASE_OFFSET);
+	header->access_type = GET_ACCESS(disc_header[STATUS_IDX]);
+	header->guid = disc_header[GUID_IDX];
+	header->base_offset = disc_header[BASE_IDX];
 
 	/* Size is measured in DWORDS, but accessor returns bytes */
-	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
+	header->size = GET_SIZE(disc_header[SIZE_IDX]);
 
 	return 0;
 }
-- 
2.43.0

