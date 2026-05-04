Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C09CD3439
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD9910E374;
	Mon,  4 May 2026 04:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JP7cq6hv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064AF10E183
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869833; x=1809405833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tw749+7VtIQ/j82mE/G+qxMGxWC+tzKRMR7X4lOU80Y=;
 b=JP7cq6hviuLmDAYAxlwADuGinR25z3Tgu7/rssOanudTsv+yPiSR+foC
 onZ1aCOHP/v2AdLd99ydR0VyzY3SO1gMiBa2hG32+rboKqJ+9nIC3FzU/
 xcKJwPDrqIxx3hTJ7WXFpKxirzOoD2Vb8BiIQaonGV0679lhw6CBLRt4N
 UEP4j3+ycED6Ls+ozirDYxah7Bs9yGtx2z7CDQlrKmf/KDlECOmiWc3J9
 v5QADWbqHcaM5EnnCqN9ZY32vyKjynSv0Kmd0O9J1OIXM02EyivveBI+G
 4mkvewFNQhhBoubguAfXAjz+nOrxfvcsfY4xvmx+73O4+EUt9YtRClUEr A==;
X-CSE-ConnectionGUID: C4r7XBBhRmmh6ilA0a3i4Q==
X-CSE-MsgGUID: FZRtscEbRiGJyChrgo+JHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96293558"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96293558"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:51 -0700
X-CSE-ConnectionGUID: /0Lj6JEmR8aVOx4+A/tjHw==
X-CSE-MsgGUID: nw+n3Gp+Qfe9ez/327BYng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="232773665"
Received: from dut4435arlh.fm.intel.com ([10.105.8.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:50 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/9] drm/xe: Sort xe_config_device fields and defaults
 alphabetically
Date: Mon,  4 May 2026 04:43:39 +0000
Message-ID: <20260504044348.209625-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504044348.209625-1-stuart.summers@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
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

Sort the fields in struct xe_config_device and the corresponding
device_defaults initializer in alphabetical order. Non-SRIOV fields
come first (alphabetically), followed by the SRIOV sub-struct with
its own fields in alphabetical order. Also sort the PRI_CUSTOM_ATTR
calls in dump_custom_dev_config() to match and the documentation for
each of the fields.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-4.7
---
 drivers/gpu/drm/xe/xe_configfs.c | 192 +++++++++++++++----------------
 1 file changed, 96 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 69abc69ec0f3..1e134057fae8 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -73,53 +73,79 @@
  * Configure Attributes
  * ====================
  *
- * Survivability mode:
- * -------------------
+ * Context restore BB
+ * ------------------
  *
- * Enable survivability mode on supported cards. This setting only takes
- * effect when probing the device. Example to enable it::
+ * Allow to execute a batch buffer during any context switches. When the
+ * GPU is restoring the context, it executes additional commands. It's useful
+ * for testing additional workarounds and validating certain HW behaviors: it's
+ * not intended for normal execution and will taint the kernel with TAINT_TEST
+ * when used.
  *
- *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_survivability_mode
+ * The syntax allows to pass straight instructions to be executed by the engine
+ * in a batch buffer or set specific registers.
  *
- * This attribute can only be set before binding to the device.
+ * #. Generic instruction::
  *
- * Allowed GT types:
- * -----------------
+ *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
  *
- * Allow only specific types of GTs to be detected and initialized by the
- * driver.  Any combination of GT types can be enabled/disabled, although
- * some settings will cause the device to fail to probe.
+ * #. Simple register setting::
  *
- * Writes support both comma- and newline-separated input format. Reads
- * will always return one GT type per line. "primary" and "media" are the
- * GT type names supported by this interface.
+ *	<engine-class> reg <address> <value>
  *
- * This attribute can only be set before binding to the device.
+ * Commands are saved per engine class: all instances of that class will execute
+ * those commands during context switch. The instruction, dword arguments,
+ * addresses and values are in hex format like in the examples below.
  *
- * Examples:
+ * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
+ *    normal context restore::
  *
- * Allow both primary and media GTs to be initialized and used.  This matches
- * the driver's default behavior::
+ *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
+ *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
  *
- *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
+ *    beginning of the context restore::
  *
- * Allow only the primary GT of each tile to be initialized and used,
- * effectively disabling the media GT if it exists on the platform::
+ *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
+ *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
+
+ * #. Load certain values in a couple of registers (it can be used as a simpler
+ *    alternative to the `cmd`) action::
  *
- *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
+ *	rcs reg 4F100 DEADBEEF
+ *	rcs reg 4F104 FFFFFFFF
+ *	EOF
  *
- * Allow only the media GT of each tile to be initialized and used,
- * effectively disabling the primary GT.  **This configuration will cause
- * device probe failure on all current platforms, but may be allowed on
- * igpu platforms in the future**::
+ *    .. note::
  *
- *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ *       When using multiple lines, make sure to use a command that is
+ *       implemented with a single write syscall, like HEREDOC.
  *
- * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
- * **This configuration will cause device probe failure on all current
- * platforms, but may be allowed on igpu platforms in the future**::
+ * Currently this is implemented only for post and mid context restore and
+ * these attributes can only be set before binding to the device.
  *
- *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ * PSMI
+ * ----
+ *
+ * Enable extra debugging capabilities to trace engine execution. Only useful
+ * during early platform enabling and requires additional hardware connected.
+ * Once it's enabled, additionals WAs are added and runtime configuration is
+ * done via debugfs. Example to enable it::
+ *
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
+ *
+ * This attribute can only be set before binding to the device.
+ *
+ * Survivability mode:
+ * -------------------
+ *
+ * Enable survivability mode on supported cards. This setting only takes
+ * effect when probing the device. Example to enable it::
+ *
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_survivability_mode
+ *
+ * This attribute can only be set before binding to the device.
  *
  * Allowed engines:
  * ----------------
@@ -147,69 +173,43 @@
  *
  * This attribute can only be set before binding to the device.
  *
- * PSMI
- * ----
+ * Allowed GT types:
+ * -----------------
  *
- * Enable extra debugging capabilities to trace engine execution. Only useful
- * during early platform enabling and requires additional hardware connected.
- * Once it's enabled, additionals WAs are added and runtime configuration is
- * done via debugfs. Example to enable it::
+ * Allow only specific types of GTs to be detected and initialized by the
+ * driver.  Any combination of GT types can be enabled/disabled, although
+ * some settings will cause the device to fail to probe.
  *
- *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
+ * Writes support both comma- and newline-separated input format. Reads
+ * will always return one GT type per line. "primary" and "media" are the
+ * GT type names supported by this interface.
  *
  * This attribute can only be set before binding to the device.
  *
- * Context restore BB
- * ------------------
- *
- * Allow to execute a batch buffer during any context switches. When the
- * GPU is restoring the context, it executes additional commands. It's useful
- * for testing additional workarounds and validating certain HW behaviors: it's
- * not intended for normal execution and will taint the kernel with TAINT_TEST
- * when used.
- *
- * The syntax allows to pass straight instructions to be executed by the engine
- * in a batch buffer or set specific registers.
- *
- * #. Generic instruction::
- *
- *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
- *
- * #. Simple register setting::
- *
- *	<engine-class> reg <address> <value>
- *
- * Commands are saved per engine class: all instances of that class will execute
- * those commands during context switch. The instruction, dword arguments,
- * addresses and values are in hex format like in the examples below.
+ * Examples:
  *
- * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
- *    normal context restore::
+ * Allow both primary and media GTs to be initialized and used.  This matches
+ * the driver's default behavior::
  *
- *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
- *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
+ *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
- *    beginning of the context restore::
+ * Allow only the primary GT of each tile to be initialized and used,
+ * effectively disabling the media GT if it exists on the platform::
  *
- *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
- *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
-
- * #. Load certain values in a couple of registers (it can be used as a simpler
- *    alternative to the `cmd`) action::
+ *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
- *	rcs reg 4F100 DEADBEEF
- *	rcs reg 4F104 FFFFFFFF
- *	EOF
+ * Allow only the media GT of each tile to be initialized and used,
+ * effectively disabling the primary GT.  **This configuration will cause
+ * device probe failure on all current platforms, but may be allowed on
+ * igpu platforms in the future**::
  *
- *    .. note::
+ *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- *       When using multiple lines, make sure to use a command that is
- *       implemented with a single write syscall, like HEREDOC.
+ * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
+ * **This configuration will cause device probe failure on all current
+ * platforms, but may be allowed on igpu platforms in the future**::
  *
- * Currently this is implemented only for post and mid context restore and
- * these attributes can only be set before binding to the device.
+ *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
  * Max SR-IOV Virtual Functions
  * ----------------------------
@@ -256,15 +256,15 @@ struct xe_config_group_device {
 	struct config_group sriov;
 
 	struct xe_config_device {
-		u64 gt_types_allowed;
-		u64 engines_allowed;
-		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
-		bool enable_survivability_mode;
+		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		bool enable_psmi;
+		bool enable_survivability_mode;
+		u64 engines_allowed;
+		u64 gt_types_allowed;
 		struct {
-			unsigned int max_vfs;
 			bool admin_only_pf;
+			unsigned int max_vfs;
 		} sriov;
 	} config;
 
@@ -277,13 +277,13 @@ struct xe_config_group_device {
 };
 
 static const struct xe_config_device device_defaults = {
-	.gt_types_allowed = U64_MAX,
-	.engines_allowed = U64_MAX,
-	.enable_survivability_mode = false,
 	.enable_psmi = false,
+	.enable_survivability_mode = false,
+	.engines_allowed = U64_MAX,
+	.gt_types_allowed = U64_MAX,
 	.sriov = {
-		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
+		.max_vfs = XE_DEFAULT_MAX_VFS,
 	},
 };
 
@@ -814,17 +814,17 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
+CONFIGFS_ATTR(, enable_survivability_mode);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
-CONFIGFS_ATTR(, enable_survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
 	&attr_enable_psmi,
+	&attr_enable_survivability_mode,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
-	&attr_enable_survivability_mode,
 	NULL,
 };
 
@@ -929,12 +929,12 @@ static ssize_t sriov_admin_only_pf_store(struct config_item *item, const char *p
 	return len;
 }
 
-CONFIGFS_ATTR(sriov_, max_vfs);
 CONFIGFS_ATTR(sriov_, admin_only_pf);
+CONFIGFS_ATTR(sriov_, max_vfs);
 
 static struct configfs_attribute *xe_config_sriov_attrs[] = {
-	&sriov_attr_max_vfs,
 	&sriov_attr_admin_only_pf,
+	&sriov_attr_max_vfs,
 	NULL,
 };
 
@@ -1096,10 +1096,10 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 				 dev->config.attr_); \
 	} while (0)
 
-	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
-	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", enable_survivability_mode);
+	PRI_CUSTOM_ATTR("%llx", engines_allowed);
+	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
-- 
2.43.0

