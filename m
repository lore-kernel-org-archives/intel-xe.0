Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE25EC3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 14:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A932D10EAF2;
	Fri, 16 May 2025 14:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mC4vvRfL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E521110EAF2
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747406799; x=1778942799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4OyCE/yW93SKxOFwsDjXt21eHuPZdYk00VF4Qs6Mf90=;
 b=mC4vvRfLz3FrcoIYHXOKEIQmA4HaFM8bt/Wcai+DnLfU+F4HS93UkTz6
 hU2lodZIxE+qPzKCGJtuZwliiCHFdmxJfhZ8Kh5yOC3u+xSa8dMsxcGE9
 RYI7jiBbxM6SZkaWe401D6UJGEt5ZuUwBOVy9MWjbWvISKjzh4pYLQXkq
 O0Rqwq5noUQ1fs1i0FmF7jk5m4RT+HFjDLmG7No6zshjpVSCrSz00z5e6
 1yeuYScl+E6zUru9GO5spwviXAGaJN5gTNtzkLtOSsyjKRfW+l8WofCSt
 +gGYjICPZygraVvXr9qTz1+1Lb1iT6Zoxdui7PZqCVxLDiT9hsIgl4K0r Q==;
X-CSE-ConnectionGUID: tlLuFgWhSi6onqAR8zxpbw==
X-CSE-MsgGUID: njIH9FsJTkqEW92Q+6Sjfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49307584"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49307584"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 07:46:39 -0700
X-CSE-ConnectionGUID: 6rAnSuiAT4qUWfAdT9SYnw==
X-CSE-MsgGUID: DrktJPkTSg2EBoLnPzMyiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169755544"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.225])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 07:46:38 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: linux-platform-driver-x86@linux-kbuild-tools.org,
 intel-xe@lists.freedesktop.org, david.e.box@intel.com,
 rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 2/4] platform/x86/intel/pmt: update to bit access
Date: Fri, 16 May 2025 10:46:17 -0400
Message-ID: <20250516144619.210413-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516144619.210413-1-michael.j.ruhl@intel.com>
References: <20250516144619.210413-1-michael.j.ruhl@intel.com>
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

The current usage of BIT offsets limits adding new
functionality to the crashlog register access.

Update the bit mask #defines to use a bit defined
structure.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 116 +++++++++++++++-------
 1 file changed, 79 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 952bfe341f53..dba7e7c1585d 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -22,29 +22,12 @@
 /* Crashlog discovery header types */
 #define CRASH_TYPE_OOBMSM	1
 
-/* Control Flags */
-#define CRASHLOG_FLAG_DISABLE		BIT(28)
-
-/*
- * Bits 29 and 30 control the state of bit 31.
- *
- * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captured.
- * Bit 30 will immediately trigger a crashlog to be generated, setting bit 31.
- * Bit 31 is the read-only status with a 1 indicating log is complete.
- */
-#define CRASHLOG_FLAG_TRIGGER_CLEAR	BIT(29)
-#define CRASHLOG_FLAG_TRIGGER_EXECUTE	BIT(30)
-#define CRASHLOG_FLAG_TRIGGER_COMPLETE	BIT(31)
-#define CRASHLOG_FLAG_TRIGGER_MASK	GENMASK(31, 28)
-
 /* Crashlog Discovery Header */
 #define CONTROL_OFFSET		0x0
 #define GUID_OFFSET		0x4
 #define BASE_OFFSET		0x8
 #define SIZE_OFFSET		0xC
 #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
-#define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
-#define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
 /* size is in bytes */
 #define GET_SIZE(v)		((v) * sizeof(u32))
 
@@ -54,6 +37,39 @@ struct crashlog_entry {
 	struct mutex			control_mutex;
 };
 
+struct type1_ver0_base {
+	u32 access_type:	4;  /* ro     0:3  */
+	u32 crash_type:		4;  /* ro     4:7  */
+	u32 count:		8;  /* ro     8:15 */
+	u32 version:		4;  /* ro    16:19 */
+	u32 rsvd:		8;  /* ro    20:27 */
+	u32 disable:		1;  /* rw    28:28 */
+	/*
+	 * Bits 29 and 30 control the state of bit 31.
+	 *
+	 * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captured.
+	 * Bit 30 will immediately trigger a crashlog to be generated, setting bit 31.
+	 * Bit 31 is the read-only status with a 1 indicating log is complete.
+	 */
+	u32 clear:		1;  /* rw    29:29 */
+	u32 manual:		1;  /* rw/1s 30:30 */
+	u32 complete:		1;  /* ro/v  31:31 */
+};
+
+struct crashlog_status {
+	union {
+		struct type1_ver0_base stat;
+		u32 status;
+	};
+};
+
+struct crashlog_control {
+	union {
+		struct type1_ver0_base ctrl;
+		u32 control;
+	};
+};
+
 struct pmt_crashlog_priv {
 	int			num_entries;
 	struct crashlog_entry	entry[];
@@ -64,27 +80,34 @@ struct pmt_crashlog_priv {
  */
 static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	struct crashlog_status status = {
+		.status = readl(entry->disc_table + CONTROL_OFFSET),
+	};
 
 	/* return current value of the crashlog complete flag */
-	return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
+	return status.stat.complete;
+
 }
 
 static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	struct crashlog_status status = {
+		.status = readl(entry->disc_table + CONTROL_OFFSET),
+	};
 
 	/* return current value of the crashlog disabled flag */
-	return !!(control & CRASHLOG_FLAG_DISABLE);
+	return status.stat.disable;
 }
 
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
 {
-	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
+	struct crashlog_control discovery_header = {
+		.control = readl(entry->disc_table + CONTROL_OFFSET),
+	};
 	u32 crash_type, version;
 
-	crash_type = GET_TYPE(discovery_header);
-	version = GET_VERSION(discovery_header);
+	crash_type = discovery_header.ctrl.crash_type;
+	version = discovery_header.ctrl.version;
 
 	/*
 	 * Currently we only recognize OOBMSM version 0 devices.
@@ -96,37 +119,53 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
 static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
 				     bool disable)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	struct crashlog_control control = {
+		.control = readl(entry->disc_table + CONTROL_OFFSET),
+	};
 
 	/* clear trigger bits so we are only modifying disable flag */
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
+	control.ctrl.clear = 0;
+	control.ctrl.manual = 0;
+	control.ctrl.complete = 0;
 
 	if (disable)
-		control |= CRASHLOG_FLAG_DISABLE;
+		control.ctrl.disable = 1;
 	else
-		control &= ~CRASHLOG_FLAG_DISABLE;
+		control.ctrl.disable = 0;
 
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	writel(control.control, entry->disc_table + CONTROL_OFFSET);
 }
 
 static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	struct crashlog_control control = {
+		.control = readl(entry->disc_table + CONTROL_OFFSET),
+	};
 
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_CLEAR;
+	/* clear trigger bits so we are only modifying disable flag */
+	control.ctrl.disable = 0;
+	control.ctrl.manual = 0;
+	control.ctrl.complete = 0;
 
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	control.ctrl.clear = 1;
+
+	writel(control.control, entry->disc_table + CONTROL_OFFSET);
 }
 
 static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	struct crashlog_control control = {
+		.control = readl(entry->disc_table + CONTROL_OFFSET),
+	};
+
+	/* clear trigger bits so we are only modifying disable flag */
+	control.ctrl.disable = 0;
+	control.ctrl.clear = 0;
+	control.ctrl.complete = 0;
 
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_EXECUTE;
+	control.ctrl.manual = 1;
 
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	writel(control.control, entry->disc_table + CONTROL_OFFSET);
 }
 
 /*
@@ -304,6 +343,9 @@ static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
 	size_t size;
 	int i, ret;
 
+	BUILD_BUG_ON(sizeof(struct crashlog_control) != sizeof(u32));
+	BUILD_BUG_ON(sizeof(struct crashlog_status) != sizeof(u32));
+
 	size = struct_size(priv, entry, intel_vsec_dev->num_resources);
 	priv = devm_kzalloc(&auxdev->dev, size, GFP_KERNEL);
 	if (!priv)
-- 
2.49.0

