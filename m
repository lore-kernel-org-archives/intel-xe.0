Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50B5C79F80
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A8510E52E;
	Thu,  3 Sep 2026 20:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxiwCkPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2D510E521
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 20:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788466219; x=1820002219;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NFw4jQFr2a1bS63+VD3zRA1YCw3/f1eTsasWVFXrtow=;
 b=YxiwCkPIp/BxQpifV3NKgaUxtPyJGUGpwLu2xZpWwtU2MFzgJJvHXmR7
 6nu5T6qS7qwa79UgyDhvaBemyOSnIDXiIRlSgp9J2IWzz+MXoxqTo9e70
 sk997Sj2OHcd0XlmWCfYRxeZtZH1OuAVNIC1MJcVbeicihMUQds8+A3EY
 zndHtFwbESWXKSmnsddwPUu6qMaIjI/7kK3MNXo3gvkttcRobucG6T2Lv
 i7DGRKFEQ1Fnd3dnmObrQSaLVmpGd7v8YPw6bBMITzKLasWANqULW7Udl
 JDRRB74L2HqUF1Hve8N4X6kPHvNZCi58t9lVzXCUaHD7nCe+czZh4czza A==;
X-CSE-ConnectionGUID: /survudIQX6bzYdGn7mF2w==
X-CSE-MsgGUID: e1U2oOM6RmuecMdlSOAa4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88994565"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88994565"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 13:10:19 -0700
X-CSE-ConnectionGUID: ihUDBnatRlCs420r2R8Pgg==
X-CSE-MsgGUID: ff/PZxgnTUO/OmQsYsPS5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="273348041"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 13:10:18 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v5 03/18] platform/x86/intel/pmt: refactor rc with a return
 value
Date: Thu,  3 Sep 2026 13:10:05 -0700
Message-ID: <20260903201002.1064889-23-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
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

Upcoming changes will include possible failures from HW accesses.

Refactor pmt_crashlog_rw() with a return value.

Update all necessary usage to use the return code.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 101 ++++++++++++++++------
 1 file changed, 74 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 831cff743803..808f2b695a7f 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -144,27 +144,29 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 }
 
 /* Read the status register and see if the specified @bit is set */
-static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
+static int pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit, bool *state)
 {
 	const struct crashlog_status *status = &crashlog->info->status;
 	u32 reg = readl(crashlog->entry.disc_table + status->offset);
 
-	return !!(reg & bit);
+	*state = !!(reg & bit);
+
+	return 0;
 }
 
-static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
+static int pmt_crashlog_complete(struct crashlog_entry *crashlog, bool *state)
 {
 	/* return current value of the crashlog complete flag */
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete, state);
 }
 
-static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
+static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
 {
 	/* return current value of the crashlog disabled flag */
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled, state);
 }
 
-static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
+static int pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
 {
 	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
 
@@ -199,14 +201,14 @@ static int pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 	return pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
 }
 
-static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
+static int pmt_crashlog_cleared(struct crashlog_entry *crashlog, bool *state)
 {
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared, state);
 }
 
-static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
+static int pmt_crashlog_consumed(struct crashlog_entry *crashlog, bool *state)
 {
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed, state);
 }
 
 static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
@@ -214,14 +216,14 @@ static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
 	return pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
 }
 
-static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
+static int pmt_crashlog_error(struct crashlog_entry *crashlog, bool *state)
 {
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.error);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.error, state);
 }
 
-static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
+static int pmt_crashlog_rearm(struct crashlog_entry *crashlog, bool *state)
 {
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed, state);
 }
 
 static int pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
@@ -236,7 +238,12 @@ static ssize_t
 clear_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
-	bool cleared = pmt_crashlog_cleared(crashlog);
+	bool cleared;
+	int ret;
+
+	ret = pmt_crashlog_cleared(crashlog, &cleared);
+	if (ret)
+		return ret;
 
 	return sysfs_emit(buf, "%d\n", cleared);
 }
@@ -271,7 +278,12 @@ static ssize_t
 consumed_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
-	bool consumed = pmt_crashlog_consumed(crashlog);
+	bool consumed;
+	int ret;
+
+	ret = pmt_crashlog_consumed(crashlog, &consumed);
+	if (ret)
+		return ret;
 
 	return sysfs_emit(buf, "%d\n", consumed);
 }
@@ -281,7 +293,9 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
 	       size_t count)
 {
 	struct crashlog_entry *crashlog;
+	bool complete;
 	bool consumed;
+	bool disabled;
 	int ret;
 
 	crashlog = dev_get_drvdata(dev);
@@ -296,10 +310,16 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
 
 	guard(mutex)(&crashlog->control_mutex);
 
-	if (pmt_crashlog_disabled(crashlog))
+	ret = pmt_crashlog_disabled(crashlog, &disabled);
+	if (ret)
+		return ret;
+	if (disabled)
 		return -EBUSY;
 
-	if (!pmt_crashlog_complete(crashlog))
+	ret = pmt_crashlog_complete(crashlog, &complete);
+	if (ret)
+		return ret;
+	if (!complete)
 		return -EEXIST;
 
 	ret = pmt_crashlog_set_consumed(crashlog);
@@ -312,9 +332,14 @@ static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
-	bool enabled = !pmt_crashlog_disabled(crashlog);
+	bool enabled;
+	int ret;
+
+	ret = pmt_crashlog_disabled(crashlog, &enabled);
+	if (ret)
+		return ret;
 
-	return sprintf(buf, "%d\n", enabled);
+	return sysfs_emit(buf, "%d\n", enabled);
 }
 
 static ssize_t
@@ -343,7 +368,12 @@ static ssize_t
 error_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
-	bool error = pmt_crashlog_error(crashlog);
+	bool error;
+	int ret;
+
+	ret = pmt_crashlog_error(crashlog, &error);
+	if (ret)
+		return ret;
 
 	return sysfs_emit(buf, "%d\n", error);
 }
@@ -353,7 +383,12 @@ static ssize_t
 rearm_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
-	int rearmed = pmt_crashlog_rearm(crashlog);
+	bool rearmed;
+	int ret;
+
+	ret = pmt_crashlog_rearm(crashlog, &rearmed);
+	if (ret)
+		return ret;
 
 	return sysfs_emit(buf, "%d\n", rearmed);
 }
@@ -389,11 +424,15 @@ trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog;
 	bool trigger;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
-	trigger = pmt_crashlog_complete(crashlog);
 
-	return sprintf(buf, "%d\n", trigger);
+	ret = pmt_crashlog_complete(crashlog, &trigger);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", trigger);
 }
 
 static ssize_t
@@ -401,6 +440,8 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	      const char *buf, size_t count)
 {
 	struct crashlog_entry *crashlog;
+	bool complete;
+	bool disabled;
 	bool trigger;
 	int ret;
 
@@ -413,7 +454,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	guard(mutex)(&crashlog->control_mutex);
 
 	/* if device is currently disabled, return busy */
-	if (pmt_crashlog_disabled(crashlog))
+	ret = pmt_crashlog_disabled(crashlog, &disabled);
+	if (ret)
+		return ret;
+	if (disabled)
 		return -EBUSY;
 
 	if (!trigger) {
@@ -422,7 +466,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	}
 
 	/* we cannot trigger a new crash if one is still pending */
-	if (pmt_crashlog_complete(crashlog))
+	ret = pmt_crashlog_complete(crashlog, &complete);
+	if (ret)
+		return ret;
+	if (complete)
 		return -EEXIST;
 
 	ret = pmt_crashlog_set_execute(crashlog);
-- 
2.43.0

