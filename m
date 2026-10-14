Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E084CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 08:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7FD10FBE4;
	Wed, 14 Oct 2026 08:00:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDF410FBC2;
 Wed, 14 Oct 2026 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791964802; x=1823500802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cPt41m+Rt5fgEeKAEmT+n2EtLjuhFgdJ3Di5ONmyxcw=;
 b=nqTXmc6jLZsSjxTASGhUWlRogS8zyC7KcfUcNbmnA8chRt4HbVIKoHLt
 kDyuKso7y2+BbJRLvhWgMIg0ANzRTGEISK+PtZ4CttP7YwZiJoIDiNlAl
 LVAGnY7p3pnKUudQH1A0QBy+P32bW9N+utPtGHeG7aA+mqrr/bpTLTXlb
 5Q4hxP7hyMJL8MPjQ6sCL6B9sXyAoa7/fjm9JOFjDbGBfdTTJ8GCXUCiL
 gFZjx6y8634pkzGWLi9+6AmGo2/VjDxDALhAuah8F4584xxa9VglOebsL
 bIKuiPHAu7FQYFYuaP/sGUrCGE4KJHa+ApKV4dQtWaclTNsnZT01QkUDb w==;
X-CSE-ConnectionGUID: Y1t6KdjcT4WjykzaFZ9Mbg==
X-CSE-MsgGUID: Bnf03di4QryrYbM50zREQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="706523"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="706523"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 01:00:02 -0700
X-CSE-ConnectionGUID: hyIjvgE6QWyErtjTbmJycA==
X-CSE-MsgGUID: H0aFAjRiTL6cqH0FeNMtCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1716910"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 01:00:00 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v5 1/1] drm/i915/gmbus: Add bit-banging debugfs control
Date: Wed, 14 Oct 2026 13:29:55 +0530
Message-ID: <20261014075956.2104356-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014075956.2104356-1-ramanaidu.naladala@intel.com>
References: <20261014075956.2104356-1-ramanaidu.naladala@intel.com>
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

Add a connector debugfs interface to enable or disable I2C
bit-banging for Intel GMBUS adapters.

v1: Address below review comments: (Jani Nikula)
    - Remove HDMI-specific EDID read path changes.
    - Control bit-banging directly from debugfs via intel_gmbus_force_bit()

v2: Address below review comments: (Jani Nikula)
    - Remove superfluous newline.
    - Move debugfs bit-banging state from struct intel_connector to struct
      intel_gmbus as debugfs_force_bit.
    - Make intel_gmbus_is_adapter() static.
    - Fold NULL adapter check into intel_gmbus_is_adapter().
    - Remove unused intel_gmbus_is_adapter() declaration from header.

v3: Protect debugfs_force_bit and force_bit updates with
    gmbus.mutex. (Ankit, sashiko)

v4: Fix checkpatch issues and address review nitpicks. (Ankit)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  |  2 +
 drivers/gpu/drm/i915/display/intel_gmbus.c    | 86 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gmbus.h    |  2 +
 3 files changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3e302f23f247..b8fd65414990 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -40,6 +40,7 @@
 #include "intel_fb.h"
 #include "intel_fbc.h"
 #include "intel_fbdev.h"
+#include "intel_gmbus.h"
 #include "intel_hdcp.h"
 #include "intel_hdmi.h"
 #include "intel_hotplug.h"
@@ -1327,6 +1328,7 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
 	if (!root)
 		return;
 
+	intel_gmbus_connector_debugfs_add(connector);
 	intel_drrs_connector_debugfs_add(connector);
 	intel_hdcp_connector_debugfs_add(connector);
 	intel_pps_connector_debugfs_add(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index b6c63a466233..d43c81d362e6 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -27,6 +27,7 @@
  *	Chris Wilson <chris@chris-wilson.co.uk>
  */
 
+#include <linux/debugfs.h>
 #include <linux/export.h>
 #include <linux/i2c-algo-bit.h>
 #include <linux/i2c.h>
@@ -47,6 +48,7 @@ struct intel_gmbus {
 	struct i2c_adapter adapter;
 #define GMBUS_FORCE_BIT_RETRY (1U << 31)
 	u32 force_bit;
+	bool debugfs_force_bit;
 	u32 reg0;
 	intel_reg_t gpio_reg;
 	struct i2c_algo_bit_data bit_algo;
@@ -889,6 +891,90 @@ static const struct i2c_algorithm gmbus_algorithm = {
 	.functionality	= gmbus_func
 };
 
+static bool intel_gmbus_is_adapter(struct intel_connector *connector)
+{
+	struct i2c_adapter *adapter = connector->base.ddc;
+
+	return adapter && adapter->algo == &gmbus_algorithm;
+}
+
+static int intel_force_bit_banging_show(struct seq_file *m, void *data)
+{
+	struct intel_connector *connector = m->private;
+	struct intel_gmbus *bus = container_of(connector->base.ddc,
+					       struct intel_gmbus, adapter);
+	struct intel_display *display = bus->display;
+	bool force_bit_banging;
+
+	mutex_lock(&display->gmbus.mutex);
+	force_bit_banging = bus->debugfs_force_bit;
+	mutex_unlock(&display->gmbus.mutex);
+
+	seq_printf(m, "%u\n", force_bit_banging);
+
+	return 0;
+}
+
+static ssize_t intel_force_bit_banging_write(struct file *file,
+					     const char __user *ubuf,
+					     size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	struct intel_connector *connector = m->private;
+	struct intel_gmbus *bus = container_of(connector->base.ddc,
+					       struct intel_gmbus, adapter);
+	struct intel_display *display = bus->display;
+	bool force_bit_banging;
+	bool changed = false;
+	u32 force_bit = 0;
+	int ret;
+
+	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
+	if (ret)
+		return ret;
+
+	mutex_lock(&display->gmbus.mutex);
+	if (force_bit_banging != bus->debugfs_force_bit) {
+		bus->force_bit += force_bit_banging ? 1 : -1;
+		force_bit = bus->force_bit;
+		bus->debugfs_force_bit = force_bit_banging;
+		changed = true;
+	}
+	mutex_unlock(&display->gmbus.mutex);
+
+	if (changed)
+		drm_dbg_kms(display->drm,
+			    "%sabling bit-banging on %s. force bit now %d\n",
+			    force_bit_banging ? "en" : "dis",
+			    connector->base.ddc->name, force_bit);
+
+	*offp += len;
+
+	return len;
+}
+
+static int intel_force_bit_banging_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, intel_force_bit_banging_show, inode->i_private);
+}
+
+static const struct file_operations intel_force_bit_banging_fops = {
+	.owner = THIS_MODULE,
+	.open = intel_force_bit_banging_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.write = intel_force_bit_banging_write,
+};
+
+void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
+{
+	if (intel_gmbus_is_adapter(connector))
+		debugfs_create_file("intel_force_bit_banging", 0644,
+				    connector->base.debugfs_entry, connector,
+				    &intel_force_bit_banging_fops);
+}
+
 static void gmbus_lock_bus(struct i2c_adapter *adapter,
 			   unsigned int flags)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
index 5fdeab1aa794..5c03100ce46b 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.h
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct i2c_adapter;
+struct intel_connector;
 struct intel_display;
 
 #define GMBUS_PIN_DISABLED	0
@@ -41,6 +42,7 @@ int intel_gmbus_output_aksv(struct i2c_adapter *adapter);
 
 struct i2c_adapter *
 intel_gmbus_get_adapter(struct intel_display *display, unsigned int pin);
+void intel_gmbus_connector_debugfs_add(struct intel_connector *connector);
 void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit);
 bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter);
 void intel_gmbus_reset(struct intel_display *display);
-- 
2.43.0

