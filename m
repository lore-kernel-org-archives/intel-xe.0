Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDB9CAC59F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FD810E815;
	Tue, 16 Sep 2025 21:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaAc5k+f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BA110E555
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758057364; x=1789593364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yoaCgG1jV2lMn/iJTGvAjGQZC8wta88UnQvjIocSaiw=;
 b=VaAc5k+fpt/hbi2/Tv7TQh57wXXck/20DJJIz0HHU55Raw+x5OnycWQz
 1UCYvKqQV3dSMi3BSUizxIe+e3L4P+JRX83p34sOvxTB71fW3hnE4oSyL
 nLiF8dhjsrEawz5H4NSBCebbOKTOqFknCLTTOIUNuYDuAYm0qyryG+no+
 ny8EdZA8nsMxdmtT3g1ITflqrp907ktmweePUBqz3CUlvj1rM/7vFypHb
 UXf2Dq3g8jftXllAxF+nMdWDXA45VoaUvcs/VHPshl3uuIg7Dy6VycrBG
 jv4GcUgVzcxuzV304e6piXXrfIhFE4OU8Rwywta72P57vArYvP9/976w1 A==;
X-CSE-ConnectionGUID: dJjiPCCISAm/r3TGPMZYEw==
X-CSE-MsgGUID: FPEoVHboRnK1CrNHO2yG2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="82949113"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="82949113"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
X-CSE-ConnectionGUID: mGs31okAR2yBWKrfElWGsg==
X-CSE-MsgGUID: 54SudHw1Slqx5g4KcGBTsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="175146079"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 7/7] drm/xe/configfs: Add mid context restore bb
Date: Tue, 16 Sep 2025 14:15:44 -0700
Message-ID: <20250916-wa-bb-cmds-v5-7-306bddbc15da@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Like done for post context restore, allow the user to add commands to
the middle of context restore, at the beginning of engine restore
commands.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 46 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 90bc5a4b5da71..640df5bee4579 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -126,13 +126,21 @@
  * not intended for normal execution and will taint the kernel with TAINT_TEST
  * when used.
  *
- * Currently this is implemented only for post context restore. Examples:
+ * Currently this is implemented only for post and mid context restore.
+ * Examples:
  *
- * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10::
+ * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
+ *    normal context restore::
  *
  *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
  *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
  *
+ * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
+ *    beginning of the context restore::
+ *
+ *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
+ *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
+
  * #. Load certain values in a couple of registers (it can be used as a simpler
  *    alternative to the `cmd`) action::
  *
@@ -146,7 +154,7 @@
  *       When using multiple lines, make sure to use a command that is
  *       implemented with a single write syscall, like HEREDOC.
  *
- * This attribute can only be set before binding to the device.
+ * These attributes can only be set before binding to the device.
  *
  * Remove devices
  * ==============
@@ -168,6 +176,7 @@ struct xe_config_group_device {
 	struct xe_config_device {
 		u64 engines_allowed;
 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
+		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
 		bool enable_psmi;
 	} config;
@@ -467,6 +476,13 @@ static ssize_t wa_bb_show(struct xe_config_group_device *dev,
 	return p - data;
 }
 
+static ssize_t ctx_restore_mid_bb_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return wa_bb_show(dev, dev->config.ctx_restore_mid_bb, page, SZ_4K);
+}
+
 static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
@@ -623,6 +639,14 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
 	return len;
 }
 
+static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
+					const char *data, size_t sz)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return wa_bb_store(dev->config.ctx_restore_mid_bb, dev, data, sz);
+}
+
 static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 					 const char *data, size_t sz)
 {
@@ -631,12 +655,14 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
 }
 
+CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
+	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
 	&attr_enable_psmi,
 	&attr_engines_allowed,
@@ -909,7 +935,19 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs)
 {
-	return 0;
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u32 len;
+
+	if (!dev)
+		return 0;
+
+	if (cs)
+		*cs = dev->config.ctx_restore_mid_bb[class].cs;
+
+	len = dev->config.ctx_restore_mid_bb[class].len;
+	config_group_put(&dev->group);
+
+	return len;
 }
 
 /**

-- 
2.50.1

