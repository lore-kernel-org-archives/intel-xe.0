Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB368C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 18:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A6F10E33E;
	Thu,  5 Jun 2025 18:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fd1YMdPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA7310E87E
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 18:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749149145; x=1780685145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L2irlSV0PIy8hVXPkwuRiyhVKvG2wTolGZb2uaAA5rI=;
 b=fd1YMdPJaEGLM8pdKdqjpzsYgqMqYn+RUi4mLT38lQCa0DEd+4SXsF9X
 V/D6NLhc+YgLdabNyplFsxnfAG+XtLfq7TgEeVOEh+eLQ5HkmGBMvpAJW
 BcyjdWr+8sgpNaSNy4tHp+nb3R5TS8gOdjV2xKMaygjIJNr8hUCD1MiKx
 ChtjQLtQVh6d64PNFwucWsdpxJZnaS1+GrBCZ1XnYLcfrDIe2oKNRpIo5
 bUob472GZ4gXYZo+5mTxueISzfvomc2/G0OXg1YyEQU+JqCyG2CwKRAAx
 YBm2V4ElMyfrri3iHmjDMddG0P74Kspz2YqBrRovhJpDzT996IwjzZB+Z A==;
X-CSE-ConnectionGUID: gko+1tW1QVmbuLnZmJd+TQ==
X-CSE-MsgGUID: 1iqOiXiQReSGETg178dtKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916681"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="38916681"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:45:44 -0700
X-CSE-ConnectionGUID: MnVwybo8QuW5SAMIzluNRg==
X-CSE-MsgGUID: eKY6LNiqSA2MgPUDs1HZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="182782557"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.222.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:45:38 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v3 09/11] platform/x86/intel/pmt: add register access helpers
Date: Thu,  5 Jun 2025 14:44:42 -0400
Message-ID: <20250605184444.515556-10-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605184444.515556-1-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
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
 drivers/platform/x86/intel/pmt/crashlog.c | 58 +++++++++++------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 463b0ba4a842..318d7a21f00e 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -62,20 +62,40 @@ struct pmt_crashlog_priv {
 /*
  * I/O
  */
-static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
+#define SET     true
+#define CLEAR   false
+
+static void read_modify_write(struct intel_pmt_entry *entry, u32 bit, bool set)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+
+	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
+
+	if (set)
+		reg |= bit;
+	else
+		reg &= bit;
+
+	writel(reg, entry->disc_table + CONTROL_OFFSET);
+}
+
+static bool read_check(struct intel_pmt_entry *entry, u32 bit)
+{
+	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+
+	return !!(reg & bit);
+}
 
+static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
+{
 	/* return current value of the crashlog complete flag */
-	return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
+	return read_check(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
 }
 
 static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
 	/* return current value of the crashlog disabled flag */
-	return !!(control & CRASHLOG_FLAG_DISABLE);
+	return read_check(entry, CRASHLOG_FLAG_DISABLE);
 }
 
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
@@ -96,37 +116,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
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
+	read_modify_write(entry, CRASHLOG_FLAG_DISABLE, disable);
 }
 
 static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_CLEAR;
-
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, SET);
 }
 
 static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_EXECUTE;
-
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, SET);
 }
 
 /*
-- 
2.49.0

