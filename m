Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A194C79F87
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C3010E57C;
	Fri,  4 Sep 2026 18:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="We/rPeA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C422810E57D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788546305; x=1820082305;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=K+7N+eyYCakclv4eLqzUQZSRPz+ClcRF/qU44GyuiB8=;
 b=We/rPeA94TQDCnBjkNOjpZf16WB+IQWjlJM8rpIS05W9hUv8P5hVCgPY
 k3BOjKp4AQnwXkpYuFUU9DswmEjERGDLFOuSGSZ1j4iqC8A1R43uqxcs9
 gHdeTKJ5JS5mEQUqtrF3jgDeXGuOaNn3t98HoJyvE822FiFUg6hjb+RNz
 c/dcNpsuIJLg/eSVGcHoQiSOZUxCZdIS1tEJN5LUcrVuIBOxvvTMkUC57
 tGYW2FWuJOMdzih7WLPsvHGpAT6zCyb3yEigfhxZi6flkd0/xheB9VSKZ
 WW0vXbE+Hw23kGUez/yBaGClkKm/k21q6VIwj5d2cANtmXctwxkQvb+Fu Q==;
X-CSE-ConnectionGUID: /yUkVjOQQ7KQW5/eD7cf+A==
X-CSE-MsgGUID: EZRV0ceXQrOCHV6u5KS84Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88932192"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="88932192"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:25:04 -0700
X-CSE-ConnectionGUID: j7aEyPw4QvyTwpVID38j1Q==
X-CSE-MsgGUID: yibn45kjSFO7ZfprEDFFsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="294992462"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:25:04 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v6 03/18] platform/x86/intel/pmt: refactor rc with a return
 value
Date: Fri,  4 Sep 2026 11:24:53 -0700
Message-ID: <20260904182451.1164868-23-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
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
index 831cff743803..b6540f3a9a17 100644
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
+	bool disabled;
+	int ret;
 
-	return sprintf(buf, "%d\n", enabled);
+	ret = pmt_crashlog_disabled(crashlog, &disabled);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", !disabled);
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

