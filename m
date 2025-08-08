Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A54C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 15:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31DE10E964;
	Fri,  8 Aug 2025 15:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kd52ta+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A93910E964
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754667422; x=1786203422;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9gfk2fvUxlXKuZO/69x1C7M2Li4eL+8PFHjp9oQQAqQ=;
 b=Kd52ta+HKuM/GCkBf5kgmqrPiGGLO+2YfoEqA4uqfA3iPb4vF4n86m+6
 lIymMmCPts/amv+0YsuBG4ladg/BuDXioE6/kCzDmwO8Ho8lsdjU+/b2q
 pqMpo6BeanHGM7ZL81pzBnbQm4hxhqzQm5NDVGlP0l+I2B+5A+4I8tkOM
 84wcBLzG+JRKVQHCNcQQ4cq4uhgTutTfCaGvPdKzsCXASurJTPruhh7jC
 H+sQUcI0eUdPAM70TH+aKsmKRfM73+jpzb6paJhuqm8jsatGExfLDo6Nw
 Z1tXRWuLRkrvMNcsh6tmMZcSR6vw/TcGfAva471urZJwGswg0gZn1CuX2 w==;
X-CSE-ConnectionGUID: O22JF+OAQ1WiGgQJxTe/Yg==
X-CSE-MsgGUID: KOLg1eQASfKXdfsMPV6b1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="44609266"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="44609266"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 08:37:01 -0700
X-CSE-ConnectionGUID: GuWYMupVSp2wO25si6W1BA==
X-CSE-MsgGUID: EfzU9BjBRS+WC1+VUNTABg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165725387"
Received: from dut136arlu.fm.intel.com ([10.105.23.75])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 08:37:01 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, raag.jadav@intel.com,
 stuartsummers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Date: Fri,  8 Aug 2025 15:36:56 +0000
Message-Id: <20250808153656.67098-1-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
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

There are two registered filled in when reading data from
pcode besides the mailbox itself. Currently we allow a NULL
value for the second of these two (data1) and assume the first
is defined. However many of the routines that are calling
this function assume that pcode will ignore the value being
passed in and so leave that first value (data0) defined but
uninitialized. To be safe, make sure this value is always
initialized to something (0 generally) in the event pcode
behavior changes and starts using this value.

Signed-off-by: stuartsummers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 8 ++++----
 drivers/gpu/drm/xe/xe_hwmon.c        | 8 ++++----
 drivers/gpu/drm/xe/xe_vram_freq.c    | 4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index bd9015761aa0..6ee422594b56 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -76,7 +76,7 @@ lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, c
 {
 	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
 	struct xe_tile *root = xe_device_get_root_tile(xe);
-	u32 cap, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
+	u32 cap = 0, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
 	u16 major = 0, minor = 0, hotfix = 0, build = 0;
 	int ret;
 
@@ -115,7 +115,7 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
 {
 	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
 	struct xe_tile *root = xe_device_get_root_tile(xe);
-	u32 cap, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
+	u32 cap = 0, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
 	u16 major = 0, minor = 0, hotfix = 0, build = 0;
 	int ret;
 
@@ -153,7 +153,7 @@ static int late_bind_create_files(struct device *dev)
 {
 	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
 	struct xe_tile *root = xe_device_get_root_tile(xe);
-	u32 cap;
+	u32 cap = 0;
 	int ret;
 
 	xe_pm_runtime_get(xe);
@@ -186,7 +186,7 @@ static void late_bind_remove_files(struct device *dev)
 {
 	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
 	struct xe_tile *root = xe_device_get_root_tile(xe);
-	u32 cap;
+	u32 cap = 0;
 	int ret;
 
 	xe_pm_runtime_get(xe);
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index f08fc4377d25..17a324e9de82 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -179,7 +179,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 					  u32 clr, u32 set)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
-	u32 val0, val1;
+	u32 val0 = 0, val1 = 0;
 	int ret = 0;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
@@ -719,7 +719,7 @@ static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
 					 long *value, u32 scale_factor)
 {
 	int ret;
-	u32 uval;
+	u32 uval = 0;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -889,7 +889,7 @@ xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 static umode_t
 xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int channel)
 {
-	u32 uval;
+	u32 uval = 0;
 
 	/* hwmon sysfs attribute of current available only for package */
 	if (channel != CHANNEL_PKG)
@@ -991,7 +991,7 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static umode_t
 xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
-	u32 uval;
+	u32 uval = 0;
 
 	if (!hwmon->xe->info.has_fan_control)
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index b26e26d73dae..17bc84da4cdc 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -34,7 +34,7 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
 	struct xe_tile *tile = dev_to_tile(dev);
-	u32 val, mbox;
+	u32 val = 0, mbox;
 	int err;
 
 	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
@@ -56,7 +56,7 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
 	struct xe_tile *tile = dev_to_tile(dev);
-	u32 val, mbox;
+	u32 val = 0, mbox;
 	int err;
 
 	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
-- 
2.34.1

