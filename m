Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4F4C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 15:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF5110E28C;
	Wed, 26 Aug 2026 15:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/6x/Axp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4877510E28C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787757810; x=1819293810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/jP32RQU3Gz9YRlYzsuJU4oL/gsgBibJEi1sN2N12Z0=;
 b=f/6x/AxpnADacYxkeCT2Yfsj6v5KjgbdRvrV+bktO01fLook/syJ7w9M
 QWxEtSFg5DM6f7D1E4DxmZIUb8+T5eveHUpo5WlK++YXNd9nfbw6Y7LEB
 He0vRc3KrhXmuSUe4gFBaaU8HqBBfrj1GfcOqP03/IGA4YZlk3bBsGJEM
 T/DzXa85ok2uRhYIvk5U3O2TZAmbySBtHZZnMQhYqmh3BgX48ut1ThZeE
 RqgR6pkMNpU9Ncl6wijPNeVgF3nheUJrlLggl4PR9vDVIvCTghVL+99XQ
 eg8sZFJpQbHwMrplur0tqLEjzqYNm7jlx6IGhvkBjp9DMYToGv/LLHzjL g==;
X-CSE-ConnectionGUID: 26QCAxb7RImGwdQPpg9HIQ==
X-CSE-MsgGUID: YWbZiMPsQCijwKBex4BAxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88297393"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88297393"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:23:30 -0700
X-CSE-ConnectionGUID: dDd/fETmRaiL5eWHcEpQVQ==
X-CSE-MsgGUID: 1+V1XwLkRKGpU46YVGdMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271105073"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:23:28 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v1 1/2] drm/i915/hdmi: Add debugfs support to force EDID reads
 over GPIO
Date: Wed, 26 Aug 2026 20:53:34 +0530
Message-ID: <20260826152335.2822798-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826152335.2822798-1-ramanaidu.naladala@intel.com>
References: <20260826152335.2822798-1-ramanaidu.naladala@intel.com>
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

Add an i915_hdmi_force_bit_banging debugfs control for HDMI
connectors to allow EDID reads to be forced over GPIO bit-banging.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  |  1 +
 .../drm/i915/display/intel_display_types.h    |  3 ++
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 51 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.h     |  2 +
 4 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3e302f23f247..c991f224b4be 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1335,6 +1335,7 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
 	intel_dp_link_training_debugfs_add(connector);
 	intel_dp_link_caps_debugfs_add(connector);
 	intel_link_bw_connector_debugfs_add(connector);
+	intel_hdmi_connector_debugfs_add(connector);
 
 	if (DISPLAY_VER(display) >= 11 &&
 	    ((connector_type == DRM_MODE_CONNECTOR_DisplayPort && !connector->mst.dp) ||
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 20a07ea06b5e..58983e31c5ef 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1689,6 +1689,9 @@ struct intel_hdmi {
 	} dp_dual_mode;
 	struct intel_connector *attached_connector;
 	struct cec_notifier *cec_notifier;
+
+	/* Debugfs knob to force EDID reads over GPIO bit-banging. */
+	bool force_bit_banging;
 };
 
 struct intel_dp_mst_encoder;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9b637e38a1a5..38915f19d3e5 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -26,6 +26,7 @@
  *	Jesse Barnes <jesse.barnes@intel.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
@@ -3112,6 +3113,56 @@ void intel_infoframe_init(struct intel_digital_port *dig_port)
 	}
 }
 
+static int i915_hdmi_force_bit_banging_show(void *data, u64 *val)
+{
+	struct intel_connector *connector = to_intel_connector(data);
+
+	*val = READ_ONCE(intel_attached_hdmi(connector)->force_bit_banging);
+
+	return 0;
+}
+
+static int i915_hdmi_force_bit_banging_write(void *data, u64 val)
+{
+	struct intel_connector *connector = to_intel_connector(data);
+	struct intel_display *display = to_intel_display(connector);
+	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(connector);
+
+	if (val > 1)
+		return -EINVAL;
+
+	drm_dbg_kms(display->drm,
+		    "[CONNECTOR:%d:%s] %sabling forced GPIO bit-banging for EDID reads\n",
+		    connector->base.base.id, connector->base.name,
+		    val ? "en" : "dis");
+
+	WRITE_ONCE(intel_hdmi->force_bit_banging, val);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(i915_hdmi_force_bit_banging_fops,
+			 i915_hdmi_force_bit_banging_show,
+			 i915_hdmi_force_bit_banging_write, "%llu\n");
+
+/**
+ * intel_hdmi_connector_debugfs_add - add HDMI specific connector debugfs files
+ * @connector: pointer to a registered intel_connector
+ *
+ * Cleanup will be done by drm_connector_unregister() through a call to
+ * drm_debugfs_connector_remove().
+ */
+void intel_hdmi_connector_debugfs_add(struct intel_connector *connector)
+{
+	struct dentry *root = connector->base.debugfs_entry;
+
+	if (connector->base.connector_type != DRM_MODE_CONNECTOR_HDMIA &&
+	    connector->base.connector_type != DRM_MODE_CONNECTOR_HDMIB)
+		return;
+
+	debugfs_create_file("i915_hdmi_force_bit_banging", 0644, root,
+			    connector, &i915_hdmi_force_bit_banging_fops);
+}
+
 bool intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 			       struct intel_connector *intel_connector)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index c95ed37bcc0c..752cccf5ccee 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -78,4 +78,6 @@ void intel_hdmi_poll_for_scrambling_enable(const struct intel_crtc_state *crtc_s
 int intel_hdmi_sink_max_frl_rate(struct drm_connector *connector);
 int intel_hdmi_sink_dsc_max_frl_rate(struct drm_connector *connector);
 
+void intel_hdmi_connector_debugfs_add(struct intel_connector *connector);
+
 #endif /* __INTEL_HDMI_H__ */
-- 
2.43.0

