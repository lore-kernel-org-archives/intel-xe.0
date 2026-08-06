Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A60C56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 13:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D2510F1D4;
	Thu,  6 Aug 2026 13:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/N4nN91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AFD10E285
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786024715; x=1817560715;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/DNrqYihL9uslF5Ki/DFLsOqE52ARtW4/jbMD5aotOk=;
 b=n/N4nN91XzoEjdS2A0Qdbe9Y9RegSmjZi75AcIGAePfUuf/cuXT6QsNO
 6VW4E/g8ZY+VJMYIzAJFTWfDHfY3iOhIt+yZGdRXT/63ad2wrK1q2fGAR
 34P7a8foyKVeLSLj8eOCZtxffAeH3hF1zPQxT48mEJGSfVw3T3VJKBuyt
 xnnJVLagTVXv18Pyr9su8w1Z/zp7PJ03W+Po1sW3s57bAG9MM5/rrDsIF
 hnbTcyQ1Z9yXk1zxebVdtvi+ChxNQcMsKjJXufRRxiSBRYVXRI9QDsWV3
 0TL4CCP89CORxrbKc+ewfR2fXDdyvo0qG+IECLl2UY0LQwAFBoyJaHtYN w==;
X-CSE-ConnectionGUID: JZFhIy2qQ4eV5b9c1aK2vg==
X-CSE-MsgGUID: ic9GuzscRRiLVIRx744moA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89141318"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="89141318"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 06:58:35 -0700
X-CSE-ConnectionGUID: 4bmq4bRaTF6ZaKL6Qpxgcg==
X-CSE-MsgGUID: PI57R5nmQfCfnL0KXev7Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="265594911"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 06:58:34 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH 2/7] platform/x86/intel/pmt: Add register access callbacks
Date: Thu,  6 Aug 2026 06:58:22 -0700
Message-ID: <20260806135820.1422040-11-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
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

Some HW does not have direct MMIO access to PMT control and data
features.

Augment the current callback infrastructure (data access) to allow
a registered driver to customize read/write access to the control
paths for PMT usage.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 39 +++++++++++++++++++++--
 include/linux/intel_vsec.h                | 12 +++++++
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index f936daf99e4d..033c736e1bc8 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -129,7 +129,19 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
 	const struct crashlog_control *control = &crashlog->info->control;
 	struct intel_pmt_entry *entry = &crashlog->entry;
-	u32 reg = readl(entry->disc_table + control->offset);
+	u32 guid = entry->header.guid;
+	u32 reg;
+	int err;
+
+	if (entry->cb->read_reg) {
+		err = entry->cb->read_reg(entry->dev, guid, &reg, control->offset);
+		if (err) {
+			pr_err("%s: failed to read reg: %d\n", __func__, err);
+			return;
+		}
+	} else {
+		reg = readl(entry->disc_table + control->offset);
+	}
 
 	reg &= ~control->trigger_mask;
 
@@ -138,14 +150,35 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 	else
 		reg &= ~bit;
 
-	writel(reg, entry->disc_table + control->offset);
+	if (entry->cb->write_reg) {
+		err = entry->cb->write_reg(entry->dev, guid, reg, control->offset);
+		if (err) {
+			pr_err("%s: failed to write reg: %d\n", __func__, err);
+			return;
+		}
+	} else {
+		writel(reg, entry->disc_table + control->offset);
+	}
 }
 
 /* Read the status register and see if the specified @bit is set */
 static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
 {
 	const struct crashlog_status *status = &crashlog->info->status;
-	u32 reg = readl(crashlog->entry.disc_table + status->offset);
+	struct intel_pmt_entry *entry = &crashlog->entry;
+	u32 guid = entry->header.guid;
+	u32 reg;
+	int err;
+
+	if (entry->cb->read_reg) {
+		err = entry->cb->read_reg(entry->dev, guid, &reg, status->offset);
+		if (err) {
+			pr_err("%s: failed to read reg: %d\n", __func__, err);
+			return false;
+		}
+	} else {
+		reg = readl(crashlog->entry.disc_table + status->offset);
+	}
 
 	return !!(reg & bit);
 }
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 843cda8f8644..3ef218cd610f 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -94,9 +94,21 @@ enum intel_vsec_quirks {
  * * data:  buffer for the data to be copied
  * * off:   offset into the requested buffer
  * * count: size of buffer
+ * @read_reg: when specified called by client driver to read PMT state
+ * * dev:      device reference for the callback's use
+ * * guid:     ID of data to acccss
+ * * reg_data: register data
+ * * off:      offset of register to read
+ * @write_reg: when specified called by client driver to write PMT state
+ * * dev:      device reference for the callback's use
+ * * guid:     ID of data to acccss
+ * * reg_data: register data
+ * * off:      offset of register to write
  */
 struct pmt_callbacks {
 	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
+	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
+	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
 };
 
 struct vsec_feature_dependency {
-- 
2.43.0

