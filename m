Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21FACA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 12:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C7410E506;
	Mon, 28 Sep 2026 12:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qa8CB4+X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC2110E08D;
 Mon, 28 Sep 2026 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790597984; x=1822133984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o2A14tDEo1ogbxDv847rm+eD+ylo5VbLgV3k1o+ea6A=;
 b=Qa8CB4+XwI+EoWSp8YEZBtpqRhJSrA59aeszePuEDJoqSczMo35ySKbF
 aEO2LWFeURAcYZ6bt9JXmjIWew8dGOx4i/0naV2nW5mW73Fp0wqbkORJo
 N/medfFNRDDchX9lyV4E7ztfdAhQFnJILsDVRTj0+qk0I6eMcxTWkZLmM
 8RB5K4eVplovjKeUMGCigpuErLC01q6SfMEe8wWAdPRVZpvT8SQBsYCOW
 4VK2ZpliMeYV7wbhZOd1o0vg2cWFHEeGOMsTuAqPXJUNXLnog2HQbncwh
 fLOWNU9ubvt+rT39E2tek5qY1ts4os8Jk8ZkAHzJlQIR0xeThQPwWuKlD A==;
X-CSE-ConnectionGUID: yEhi8HrmSPubFh/9oI21xw==
X-CSE-MsgGUID: tSnRzcr3QKiRx8accoAmjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="102666275"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="102666275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:19:44 -0700
X-CSE-ConnectionGUID: JRZfRUapQFu1kzT2cQBQhQ==
X-CSE-MsgGUID: sFtlTpNRQ2Ox71vCiBKcUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="278854444"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:19:43 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v3 1/1] drm/i915/gmbus: Add bit-banging debugfs control
Date: Mon, 28 Sep 2026 17:49:40 +0530
Message-ID: <20260928121940.728102-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928121940.728102-1-ramanaidu.naladala@intel.com>
References: <20260928121940.728102-1-ramanaidu.naladala@intel.com>
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

Assisted-by: OpenAI Codex:GPT-5
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  |  2 +
 .../drm/i915/display/intel_display_types.h    |  1 -
 drivers/gpu/drm/i915/display/intel_gmbus.c    | 67 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gmbus.h    |  2 +
 4 files changed, 71 insertions(+), 1 deletion(-)

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
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 79f30660c2b6..1b8eb08d1096 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -558,7 +558,6 @@ struct intel_connector {
 	u8 polled;
 
 	int force_joined_pipes;
-
 	struct {
 		struct drm_dp_aux *dsc_decompression_aux;
 		u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE];
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 60a70dea5d85..be6d29508bea 100644
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
@@ -871,6 +873,71 @@ static const struct i2c_algorithm gmbus_algorithm = {
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
+
+	seq_printf(m, "%u\n", bus->debugfs_force_bit);
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
+	struct intel_gmbus *bus = container_of(connector->base.ddc,
+					       struct intel_gmbus, adapter);
+	bool force_bit_banging;
+	int ret;
+
+	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
+	if (ret)
+		return ret;
+
+	if (force_bit_banging != bus->debugfs_force_bit) {
+		intel_gmbus_force_bit(connector->base.ddc, force_bit_banging);
+		bus->debugfs_force_bit = force_bit_banging;
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

