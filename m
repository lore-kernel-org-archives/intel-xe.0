Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBA9606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 11:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ck8DBhXD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5A910FBC8;
	Wed, 25 Nov 2026 11:46:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0061E10FBBC;
 Wed, 25 Nov 2026 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795607204; x=1827143204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DmwZApHOdmw8dkH0RgZhiTPDtSluGqOst798GvMREog=;
 b=ck8DBhXDNPt43T5BdxAYeXL+njQbNSEjW6VmEJr37U0Hv8OBHzS4FpGn
 EresYttj5vd+yeVj6ltm8HyyGJZpMz93p0uIy1DwbnwRRDGjV/Ub/M/rI
 qOOSFddcxVKYP3XSS7J4h8E8EGOnkcf+EBLnDMGOfBPKE/3pv7DYmP0cK
 xPJDGYs4NjmLfu6bCSYo0uP01bvliEN/iOwUs/980qiYuXoArcWaTSwG4
 7pNxjpmKKaQRFfQl7VNZEkQT1Iis1VENVoL6neIe774sCM/AfDhanp+G+
 6LxPfATawFvgvu5454MO07EQnouY52CAu0BdcYvYx+eng0/8x/K8kQN8R w==;
X-CSE-ConnectionGUID: IwHS52ROS/GIskaNPRM/wQ==
X-CSE-MsgGUID: 2bg+eClqQH+kNjCUXjxgbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4358426"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4358426"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:46:43 -0800
X-CSE-ConnectionGUID: OsRfx3tmTE6DdECKEYhqOQ==
X-CSE-MsgGUID: gb0WbnhfS5azqDMKSkFTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12167820"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:46:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 1/6] drm/i915/gmbus: move debugfs stuff at the end of the
 file
Date: Wed, 25 Nov 2026 13:46:30 +0200
Message-ID: <aea3a014dcae0666a6336c075db34914dfc8ca57.1795607055.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795607055.git.jani.nikula@intel.com>
References: <cover.1795607055.git.jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Basically everywhere the debugfs scaffolding is at the end of the file,
as it invariably uses functions that come first. Follow suit in gmbus.

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 154 ++++++++++-----------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index d43c81d362e6..70784e7dae2a 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -898,83 +898,6 @@ static bool intel_gmbus_is_adapter(struct intel_connector *connector)
 	return adapter && adapter->algo == &gmbus_algorithm;
 }
 
-static int intel_force_bit_banging_show(struct seq_file *m, void *data)
-{
-	struct intel_connector *connector = m->private;
-	struct intel_gmbus *bus = container_of(connector->base.ddc,
-					       struct intel_gmbus, adapter);
-	struct intel_display *display = bus->display;
-	bool force_bit_banging;
-
-	mutex_lock(&display->gmbus.mutex);
-	force_bit_banging = bus->debugfs_force_bit;
-	mutex_unlock(&display->gmbus.mutex);
-
-	seq_printf(m, "%u\n", force_bit_banging);
-
-	return 0;
-}
-
-static ssize_t intel_force_bit_banging_write(struct file *file,
-					     const char __user *ubuf,
-					     size_t len, loff_t *offp)
-{
-	struct seq_file *m = file->private_data;
-	struct intel_connector *connector = m->private;
-	struct intel_gmbus *bus = container_of(connector->base.ddc,
-					       struct intel_gmbus, adapter);
-	struct intel_display *display = bus->display;
-	bool force_bit_banging;
-	bool changed = false;
-	u32 force_bit = 0;
-	int ret;
-
-	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
-	if (ret)
-		return ret;
-
-	mutex_lock(&display->gmbus.mutex);
-	if (force_bit_banging != bus->debugfs_force_bit) {
-		bus->force_bit += force_bit_banging ? 1 : -1;
-		force_bit = bus->force_bit;
-		bus->debugfs_force_bit = force_bit_banging;
-		changed = true;
-	}
-	mutex_unlock(&display->gmbus.mutex);
-
-	if (changed)
-		drm_dbg_kms(display->drm,
-			    "%sabling bit-banging on %s. force bit now %d\n",
-			    force_bit_banging ? "en" : "dis",
-			    connector->base.ddc->name, force_bit);
-
-	*offp += len;
-
-	return len;
-}
-
-static int intel_force_bit_banging_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, intel_force_bit_banging_show, inode->i_private);
-}
-
-static const struct file_operations intel_force_bit_banging_fops = {
-	.owner = THIS_MODULE,
-	.open = intel_force_bit_banging_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-	.write = intel_force_bit_banging_write,
-};
-
-void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
-{
-	if (intel_gmbus_is_adapter(connector))
-		debugfs_create_file("intel_force_bit_banging", 0644,
-				    connector->base.debugfs_entry, connector,
-				    &intel_force_bit_banging_fops);
-}
-
 static void gmbus_lock_bus(struct i2c_adapter *adapter,
 			   unsigned int flags)
 {
@@ -1144,3 +1067,80 @@ void intel_gmbus_irq_handler(struct intel_display *display)
 {
 	wake_up_all(&display->gmbus.wait_queue);
 }
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
-- 
2.47.3

