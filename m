Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B30C98324
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 15:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F6910F66D;
	Thu, 24 Sep 2026 15:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXNqDtJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F3210F66D;
 Thu, 24 Sep 2026 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790263695; x=1821799695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z4pKwRAEqAIPW1BqGIY6MyFYQpzrOaxF03jLZ5Eftfo=;
 b=ZXNqDtJ9Jc0Sd7DqocMe7WMK1vxAPWISPfAtfEAVl4onYsK8ErcWJ2io
 X8u5UYCIf2aS+u26peqEHNaMhHSMUqUgl2IG0tnoDkc3iMEGgUAGLg9+j
 eH1EOAgp6PenIQ4x2+3/oj6AkcvvHxem1CvRH2Fr9X3ipeLjj7TEAPYOx
 0+2VmYLELw5hgNz/0qbqhmK8JkWt4ts8jhzVbwGSAp4wqcz+LlMgyRhhH
 Dm+qggktYq7ioDrpJbztIq9wtP343jxcnMIXgmGWZ4OOFvqMITWgsJhvQ
 VEttF6BUbwKvZDKcGowjhBlxhc7BXQiXBZsQvaWoRsQcVGWAUDvJ3/ZVj w==;
X-CSE-ConnectionGUID: AyfAPaMgRKusV4CQACq0kQ==
X-CSE-MsgGUID: nxOp4cXwR++DWPP+HPPf6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90903147"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90903147"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 08:28:15 -0700
X-CSE-ConnectionGUID: UtvIXKtyRo+20Dst1Qc2kQ==
X-CSE-MsgGUID: C9hkwQQAQNa5bHec2Yovqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="274158683"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:28:14 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v2 1/1] drm/i915/gmbus: Add bit-banging debugfs control
Date: Thu, 24 Sep 2026 20:58:12 +0530
Message-ID: <20260924152812.439986-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924152812.439986-1-ramanaidu.naladala@intel.com>
References: <20260924152812.439986-1-ramanaidu.naladala@intel.com>
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

Assisted-by: OpenAI Codex:GPT-5
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  |  3 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_gmbus.c    | 61 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gmbus.h    |  3 +
 4 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3e302f23f247..74f065175a72 100644
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
@@ -1327,6 +1328,8 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
 	if (!root)
 		return;
 
+	intel_gmbus_connector_debugfs_add(connector);
+
 	intel_drrs_connector_debugfs_add(connector);
 	intel_hdcp_connector_debugfs_add(connector);
 	intel_pps_connector_debugfs_add(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 79f30660c2b6..5cef2582c361 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -558,6 +558,7 @@ struct intel_connector {
 	u8 polled;
 
 	int force_joined_pipes;
+	bool force_bit_banging;
 
 	struct {
 		struct drm_dp_aux *dsc_decompression_aux;
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 60a70dea5d85..38d6d1148399 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -27,6 +27,7 @@
  *	Chris Wilson <chris@chris-wilson.co.uk>
  */
 
+#include <linux/debugfs.h>
 #include <linux/export.h>
 #include <linux/i2c-algo-bit.h>
 #include <linux/i2c.h>
@@ -871,6 +872,66 @@ static const struct i2c_algorithm gmbus_algorithm = {
 	.functionality	= gmbus_func
 };
 
+bool intel_gmbus_is_adapter(struct i2c_adapter *adapter)
+{
+	return adapter->algo == &gmbus_algorithm;
+}
+
+static int intel_force_bit_banging_show(struct seq_file *m, void *data)
+{
+	struct intel_connector *connector = m->private;
+
+	seq_printf(m, "%u\n", connector->force_bit_banging);
+
+	return 0;
+}
+
+static ssize_t intel_force_bit_banging_write(struct file *file,
+						     const char __user *ubuf,
+						     size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	struct intel_connector *connector = m->private;
+	bool force_bit_banging;
+	int ret;
+
+	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
+	if (ret)
+		return ret;
+
+	if (force_bit_banging != connector->force_bit_banging) {
+		intel_gmbus_force_bit(connector->base.ddc, force_bit_banging);
+		connector->force_bit_banging = force_bit_banging;
+	}
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
+	if (connector->base.ddc &&
+	    intel_gmbus_is_adapter(connector->base.ddc))
+		debugfs_create_file("intel_force_bit_banging", 0644,
+				    connector->base.debugfs_entry, connector,
+				    &intel_force_bit_banging_fops);
+}
+
 static void gmbus_lock_bus(struct i2c_adapter *adapter,
 			   unsigned int flags)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
index 5fdeab1aa794..968f8cb42821 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.h
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct i2c_adapter;
+struct intel_connector;
 struct intel_display;
 
 #define GMBUS_PIN_DISABLED	0
@@ -41,6 +42,8 @@ int intel_gmbus_output_aksv(struct i2c_adapter *adapter);
 
 struct i2c_adapter *
 intel_gmbus_get_adapter(struct intel_display *display, unsigned int pin);
+bool intel_gmbus_is_adapter(struct i2c_adapter *adapter);
+void intel_gmbus_connector_debugfs_add(struct intel_connector *connector);
 void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit);
 bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter);
 void intel_gmbus_reset(struct intel_display *display);
-- 
2.43.0

