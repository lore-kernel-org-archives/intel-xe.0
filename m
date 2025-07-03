Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D9AC83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 21:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D1A10E8F0;
	Thu,  3 Jul 2025 21:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aaQK9J07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EB210E8F0
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 21:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751577156; x=1783113156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ubRP7Vtlv4RufC41exjRm5ZbOBUMmSN5W1Lm6Hr76cg=;
 b=aaQK9J0723/58ifXNqLkWMbSMsFUkIfnlUMCxDKmOHkuxJiCDERvRMf3
 b5dF+gPD/yV5jsf9wGYwgkWuKUzVHE3/zfFJy6ZR+G1EDKoMSrtGi1LhR
 PJqBZZ2joAMN3BxalDyTyseuBYeAJiJW3qiJsoW2yyOk+NSqSXwYPYkaA
 XeuJ1rn8EW4R0PRq286jnQtBNvGJ0YosqTrMeXaBOgEjChSFtVICpsDym
 wXiTqjBRQz0JDnU/kqYCIRQKPxShaF61pEj5FoOZA5PVoDLYsjF/FvgAA
 o567csbi+Z3UPs0ghwyJ3bw0Q11Ja0Lu3b95Kt4JVVTMjSy4mG/rKOA+P g==;
X-CSE-ConnectionGUID: FGVefpP9T+CSo7O4lJM9/A==
X-CSE-MsgGUID: AaIdgzAIRFOoEi1Wa7IL2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79353047"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="79353047"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:12:36 -0700
X-CSE-ConnectionGUID: oYCHUHOwSQKTQpa8STA4TQ==
X-CSE-MsgGUID: +MMwzX64S++iZ6vgGCOQsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="154240112"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.97])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:12:34 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v6 09/12] platform/x86/intel/pmt: add register access helpers
Date: Thu,  3 Jul 2025 17:11:47 -0400
Message-ID: <20250703211150.135320-10-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703211150.135320-1-michael.j.ruhl@intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
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

The control register is used in a read/modify/write pattern.
The status register is used in a read/check bit pattern.

Add helpers to eliminate common code.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 60 ++++++++++++-----------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 23b3971da40a..888946a8ba46 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -64,20 +64,42 @@ struct pmt_crashlog_priv {
 /*
  * I/O
  */
-static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
+#define CRASHLOG_SET_BIT	true
+#define CRASHLOG_CLEAR_BIT	false
+
+/* read/modify/write */
+static void pmt_crashlog_rmw(struct intel_pmt_entry *entry, u32 bit, bool set)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+
+	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
+
+	if (set)
+		reg |= bit;
+	else
+		reg &= ~bit;
+
+	writel(reg, entry->disc_table + CONTROL_OFFSET);
+}
+
+/* read/check */
+static bool pmt_crashlog_rc(struct intel_pmt_entry *entry, u32 bit)
+{
+	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+
+	return !!(reg & bit);
+}
 
+static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
+{
 	/* return current value of the crashlog complete flag */
-	return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
+	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
 }
 
 static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
 	/* return current value of the crashlog disabled flag */
-	return !!(control & CRASHLOG_FLAG_DISABLE);
+	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_DISABLE);
 }
 
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
@@ -98,37 +120,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
 static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
 				     bool disable)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	/* clear trigger bits so we are only modifying disable flag */
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-
-	if (disable)
-		control |= CRASHLOG_FLAG_DISABLE;
-	else
-		control &= ~CRASHLOG_FLAG_DISABLE;
-
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_DISABLE, disable);
 }
 
 static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_CLEAR;
-
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_BIT);
 }
 
 static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_EXECUTE;
-
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SET_BIT);
 }
 
 /*
-- 
2.49.0

