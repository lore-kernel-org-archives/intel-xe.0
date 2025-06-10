Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1F1C677C4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 21:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344D210E341;
	Tue, 10 Jun 2025 21:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsQ6tXj3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8935D10E5DB
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 21:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749589982; x=1781125982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7lrNU6ZN5/1r/0My0oqWAsIliru9Sjsu0w1PJgUVbqI=;
 b=KsQ6tXj3lfmGeWBOFjkMj6WQ0IgCzy5WCDFeeyP2B3HDoeEHsp6sy2r9
 jSGtelUmJO896FeyQiDic1fRZHrE2IALNsNtxguWSNcHx8VvhIDWbhrZJ
 2WJdOdD4DaDgtdG1nT/6KsW0LCqeHFmPozgNIk5UYnHLB8YfeIvERgVct
 GrHdfBvLmc44i6vG3VIQO9dIf+3w4dJynpW4Ha6o8LE3SuW20yL6sTSR2
 Aa0ZkBXaKOg3M+w5XajevcAdQQgpH0/9C9dEN+v5NGmXuGQ4TuNjgKWBu
 /6bffe55WWZgMpl6Wp7nlv7yk4S4fZLP7mTOsQkiirzOC5lTGY0Qi/TkJ A==;
X-CSE-ConnectionGUID: VPml08JUTISis/UrDFFemw==
X-CSE-MsgGUID: gHVJ2mTfSRmJdXrGhzg0AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51816960"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="51816960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 14:13:01 -0700
X-CSE-ConnectionGUID: lOvF3rB3To6kPSUvBjX3rA==
X-CSE-MsgGUID: GPC6sbGoQ7Cpsg6cOJjGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="146939865"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.220.88])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 14:12:59 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v4 08/10] platform/x86/intel/pmt: add register access helpers
Date: Tue, 10 Jun 2025 17:12:23 -0400
Message-ID: <20250610211225.1085901-9-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
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
index 99f0e85f2de6..e11865686f2a 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -63,20 +63,40 @@ struct pmt_crashlog_priv {
 /*
  * I/O
  */
-static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
+#define SET	true
+#define CLEAR	false
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
@@ -97,37 +117,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
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

