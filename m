Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0747C7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 20:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F9E10EA77;
	Fri, 27 Jun 2025 20:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxSr8p91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F6F10EA8F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751057038; x=1782593038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wBkjbUCNSGW54QhAPZZfv1IwvIXhc0dqbVMbvs3dJnY=;
 b=lxSr8p9108iKnlAbEYktQl9pX3KT/N9AgNfIKgt81c6oHCnTiMOZtvaP
 c6u90Nhi0EcQbt5ovb012f/6jvKkKhQ7bhgby7vyTW4KkmC/AQRv/RI5q
 EtuGB2ehc5be7Zsx+smOfJU/l61fnMEnaU8w6wDvvYVsUe0y8sE5PLbbY
 kWIdRdF8mCOGRr0pI/WoBVAjhMmsRmI1JWuau9AW+CWUTZl5jI0Km7msp
 seRuSE8UXxSbjAFln4yIjzZCXiMh2L5LRX5UjuUVbX+VS2PBpJ+GOMaHf
 xW0TcnyzOCHr8E+6LTXES/VfGpsGzAQZ+hjlLStAyLQe0SmRdEHp+ccG2 A==;
X-CSE-ConnectionGUID: YmvSUGmqQamMimPykTA5WQ==
X-CSE-MsgGUID: pWY8DmrJSiGJO3V5s1RWYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003232"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="41003232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 13:43:58 -0700
X-CSE-ConnectionGUID: JgaU3b5mTIuqXDa0QUTkiQ==
X-CSE-MsgGUID: pe9/Yc+RR5GHh3udiYnLoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="156939077"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.220.252])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 13:43:57 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v5 11/12] platform/x86/intel/pmt: use a version struct
Date: Fri, 27 Jun 2025 16:43:20 -0400
Message-ID: <20250627204321.521628-12-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204321.521628-1-michael.j.ruhl@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
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

In preparation for supporting multiple crashlog versions, use a struct
to keep bit offset info for the status and control bits.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 92 ++++++++++++++++-------
 1 file changed, 66 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 7975abb3c21b..d109f307f110 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -24,21 +24,6 @@
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
@@ -50,10 +35,63 @@
 /* size is in bytes */
 #define GET_SIZE(v)		((v) * sizeof(u32))
 
+/*
+ * Type 1 Version 0
+ * status and control registers are combined.
+ *
+ * Bits 29 and 30 control the state of bit 31.
+ * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captured.
+ * Bit 30 will immediately trigger a crashlog to be generated, setting bit 31.
+ * Bit 31 is the read-only status with a 1 indicating log is complete.
+ */
+#define TYPE1_VER0_STATUS_OFFSET	0x00
+#define TYPE1_VER0_CONTROL_OFFSET	0x00
+
+#define TYPE1_VER0_DISABLE		BIT(28)
+#define TYPE1_VER0_CLEAR		BIT(29)
+#define TYPE1_VER0_EXECUTE		BIT(30)
+#define TYPE1_VER0_COMPLETE		BIT(31)
+#define TYPE1_VER0_TRIGGER_MASK		GENMASK(31, 28)
+
+/* After offset, order alphabetically, not bit ordered */
+struct crashlog_status {
+	u32 offset;
+	u32 cleared;
+	u32 complete;
+	u32 disabled;
+};
+
+struct crashlog_control {
+	u32 offset;
+	u32 trigger_mask;
+	u32 clear;
+	u32 disable;
+	u32 manual;
+};
+
+struct crashlog_info {
+	struct crashlog_status status;
+	struct crashlog_control control;
+};
+
+static const struct crashlog_info crashlog_type1_ver0 = {
+	.status.offset = TYPE1_VER0_STATUS_OFFSET,
+	.status.cleared = TYPE1_VER0_CLEAR,
+	.status.complete = TYPE1_VER0_COMPLETE,
+	.status.disabled = TYPE1_VER0_DISABLE,
+
+	.control.offset = TYPE1_VER0_CONTROL_OFFSET,
+	.control.trigger_mask = TYPE1_VER0_TRIGGER_MASK,
+	.control.clear = TYPE1_VER0_CLEAR,
+	.control.disable = TYPE1_VER0_DISABLE,
+	.control.manual = TYPE1_VER0_EXECUTE,
+};
+
 struct crashlog_entry {
 	/* entry must be first member of struct */
 	struct intel_pmt_entry		entry;
 	struct mutex			control_mutex;
+	const struct crashlog_info	*info;
 };
 
 struct pmt_crashlog_priv {
@@ -70,24 +108,25 @@ struct pmt_crashlog_priv {
 /* read/modify/write */
 static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
+	const struct crashlog_control *control = &crashlog->info->control;
 	struct intel_pmt_entry *entry = &crashlog->entry;
-	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 reg = readl(entry->disc_table + control->offset);
 
-	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
+	reg &= ~control->trigger_mask;
 
 	if (set)
 		reg |= bit;
 	else
 		reg &= bit;
 
-	writel(reg, entry->disc_table + CONTROL_OFFSET);
+	writel(reg, entry->disc_table + control->offset);
 }
 
 /* read/check */
 static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
 {
-	struct intel_pmt_entry *entry = &crashlog->entry;
-	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+	const struct crashlog_status *status = &crashlog->info->status;
+	u32 reg = readl(crashlog->entry.disc_table + status->offset);
 
 	return !!(reg & bit);
 }
@@ -95,13 +134,13 @@ static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
 static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
 {
 	/* return current value of the crashlog complete flag */
-	return pmt_crashlog_rc(crashlog, CRASHLOG_FLAG_TRIGGER_COMPLETE);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete);
 }
 
 static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
 {
 	/* return current value of the crashlog disabled flag */
-	return pmt_crashlog_rc(crashlog, CRASHLOG_FLAG_DISABLE);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
 }
 
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
@@ -121,17 +160,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
 
 static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bool disable)
 {
-	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_DISABLE, disable);
+	pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
 }
 
 static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_BIT);
+	pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, CRASHLOG_SET_BIT);
 }
 
 static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SET_BIT);
+	pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, CRASHLOG_SET_BIT);
 }
 
 /*
@@ -235,9 +274,10 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	if (!pmt_crashlog_supported(entry))
 		return 1;
 
-	/* initialize control mutex */
+	/* initialize the crashlog struct */
 	crashlog = container_of(entry, struct crashlog_entry, entry);
 	mutex_init(&crashlog->control_mutex);
+	crashlog->info = &crashlog_type1_ver0;
 
 	header->access_type = GET_ACCESS(readl(disc_table));
 	header->guid = readl(disc_table + GUID_OFFSET);
-- 
2.49.0

