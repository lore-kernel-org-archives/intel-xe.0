Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56010CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 21:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1282810F1C8;
	Tue, 13 Oct 2026 21:47:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C8A10E95E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 21:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791928038; x=1823464038;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=m95LLsHBQ78AC97Lldj5ShhaCO7QJZuKyUoMD3w9rHM=;
 b=i/7X081P+1tnrxLhzlFY4Y2M5QYk30kXXSkKBuJGBIVKIPUzZimFEXoQ
 U+ZNUlgFnEjjxJ5xiLu+v/etuSU4lp0ewaGjnmr+lQYxapsFoBc6CL1Bc
 eQ2GgTA1GDSsTiVI/GumdMHhC+zHhFxNqw+ycEVKHtiKq3VhKVL/nkf2F
 jm7GbmBUhY5bNR3Y8SY0HfQYTEKGDoOpMaXXOH3hXbrjyWIHNI5qswX+z
 EnLp/gY6WA9RJa3Bev6sMYqINnDfxUfHSonwgwyQczzVVVJC5m54Lb/2f
 ijJzSBrkw7KMwvge5mcMzJtTKqdCIcdvwpxnKVQVuIQ2Z41PvR0nSlabw w==;
X-CSE-ConnectionGUID: 3QwS9dNVSNezDSKnP5McJA==
X-CSE-MsgGUID: XdfIjYMRTGmYPSY7PEEYKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="565905"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="565905"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 14:47:07 -0700
X-CSE-ConnectionGUID: AzZcudFySJWgmFlV97t0Bw==
X-CSE-MsgGUID: LXOZ/ALsR5e67Rj5K1QfEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1629826"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 14:47:08 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v12 02/21] platform/x86/intel/pmt: refactor rmw with a return
 value
Date: Tue, 13 Oct 2026 14:46:55 -0700
Message-ID: <20261013214655.3502964-25-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
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

Refactor pmt_crashlog_rwm() with a return value.

Update all necessary usage to use the return code.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 90 ++++++++++++-----------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index f936daf99e4d..831cff743803 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -125,7 +125,7 @@ struct pmt_crashlog_priv {
  */
 
 /* Read, modify, write the control register, setting or clearing @bit based on @set */
-static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
+static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
 	const struct crashlog_control *control = &crashlog->info->control;
 	struct intel_pmt_entry *entry = &crashlog->entry;
@@ -139,6 +139,8 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 		reg &= ~bit;
 
 	writel(reg, entry->disc_table + control->offset);
+
+	return 0;
 }
 
 /* Read the status register and see if the specified @bit is set */
@@ -181,20 +183,20 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_typ
 	return false;
 }
 
-static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
-				     bool disable)
+static int pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
+				    bool disable)
 {
-	pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
+	return pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
 }
 
-static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
+static int pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, true);
+	return pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, true);
 }
 
-static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
+static int pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
+	return pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
 }
 
 static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
@@ -207,9 +209,9 @@ static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
 	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
 }
 
-static void pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
+static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
+	return pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
 }
 
 static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
@@ -222,9 +224,9 @@ static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
 	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
 }
 
-static void pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
+static int pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
+	return pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
 }
 
 /*
@@ -245,13 +247,13 @@ clear_store(struct device *dev, struct device_attribute *attr,
 {
 	struct crashlog_entry *crashlog;
 	bool clear;
-	int result;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
 
-	result = kstrtobool(buf, &clear);
-	if (result)
-		return result;
+	ret = kstrtobool(buf, &clear);
+	if (ret)
+		return ret;
 
 	/* set bit only */
 	if (!clear)
@@ -259,9 +261,9 @@ clear_store(struct device *dev, struct device_attribute *attr,
 
 	guard(mutex)(&crashlog->control_mutex);
 
-	pmt_crashlog_set_clear(crashlog);
+	ret = pmt_crashlog_set_clear(crashlog);
 
-	return count;
+	return ret ?: count;
 }
 static DEVICE_ATTR_RW(clear);
 
@@ -280,13 +282,13 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
 {
 	struct crashlog_entry *crashlog;
 	bool consumed;
-	int result;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
 
-	result = kstrtobool(buf, &consumed);
-	if (result)
-		return result;
+	ret = kstrtobool(buf, &consumed);
+	if (ret)
+		return ret;
 
 	/* set bit only */
 	if (!consumed)
@@ -300,9 +302,9 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
 	if (!pmt_crashlog_complete(crashlog))
 		return -EEXIST;
 
-	pmt_crashlog_set_consumed(crashlog);
+	ret = pmt_crashlog_set_consumed(crashlog);
 
-	return count;
+	return ret ?: count;
 }
 static DEVICE_ATTR_RW(consumed);
 
@@ -321,19 +323,19 @@ enable_store(struct device *dev, struct device_attribute *attr,
 {
 	struct crashlog_entry *crashlog;
 	bool enabled;
-	int result;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
 
-	result = kstrtobool(buf, &enabled);
-	if (result)
-		return result;
+	ret = kstrtobool(buf, &enabled);
+	if (ret)
+		return ret;
 
 	guard(mutex)(&crashlog->control_mutex);
 
-	pmt_crashlog_set_disable(crashlog, !enabled);
+	ret = pmt_crashlog_set_disable(crashlog, !enabled);
 
-	return count;
+	return ret ?: count;
 }
 static DEVICE_ATTR_RW(enable);
 
@@ -362,13 +364,13 @@ rearm_store(struct device *dev, struct device_attribute *attr, const char *buf,
 {
 	struct crashlog_entry *crashlog;
 	bool rearm;
-	int result;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
 
-	result = kstrtobool(buf, &rearm);
-	if (result)
-		return result;
+	ret = kstrtobool(buf, &rearm);
+	if (ret)
+		return ret;
 
 	/* set only */
 	if (!rearm)
@@ -376,9 +378,9 @@ rearm_store(struct device *dev, struct device_attribute *attr, const char *buf,
 
 	guard(mutex)(&crashlog->control_mutex);
 
-	pmt_crashlog_set_rearm(crashlog);
+	ret = pmt_crashlog_set_rearm(crashlog);
 
-	return count;
+	return ret ?: count;
 }
 static DEVICE_ATTR_RW(rearm);
 
@@ -400,13 +402,13 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 {
 	struct crashlog_entry *crashlog;
 	bool trigger;
-	int result;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
 
-	result = kstrtobool(buf, &trigger);
-	if (result)
-		return result;
+	ret = kstrtobool(buf, &trigger);
+	if (ret)
+		return ret;
 
 	guard(mutex)(&crashlog->control_mutex);
 
@@ -415,17 +417,17 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 		return -EBUSY;
 
 	if (!trigger) {
-		pmt_crashlog_set_clear(crashlog);
-		return count;
+		ret = pmt_crashlog_set_clear(crashlog);
+		return ret ?: count;
 	}
 
 	/* we cannot trigger a new crash if one is still pending */
 	if (pmt_crashlog_complete(crashlog))
 		return -EEXIST;
 
-	pmt_crashlog_set_execute(crashlog);
+	ret = pmt_crashlog_set_execute(crashlog);
 
-	return count;
+	return ret ?: count;
 }
 static DEVICE_ATTR_RW(trigger);
 
-- 
2.43.0

