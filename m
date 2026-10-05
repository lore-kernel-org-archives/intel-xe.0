Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FCBCA6001
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 19:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAD710EE4D;
	Mon,  5 Oct 2026 19:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JS1mmAJG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA46E10E1F6
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791227176; x=1822763176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DHXJxS8vz6ClpDxZaZzZmytxaAmHK+kfsXXsmDIkrCY=;
 b=JS1mmAJGArsiZdLZd64Pc/caV/Qk4y6kpBb4GuiZeyrnUATHbD20D+eM
 D8Dhp+q2zVHn7noYsWn2bP1gS0iHPM2VTCkYK3v0orvrD1IMcPKIhpm1d
 G2NRQUGdRdlCwNFbiy9H5SpLBo+lnwLnuTjn7AK6QfYeoP7xdGGVa8JOh
 7eEqx74CIoYP+ySiJGDkxLKfXYo59Db4+jDb4jOnSwXkX0Nt1ifHtRqU5
 2HRvDINvhiG+C2bTzFzG8Nr1XKKKdiQ4Xyn8eTgxu4DdgaUp2OqAZDX9J
 BSRNdtcJyQrFioMoBf0N+8brcI+uLOAz/+m8AZKq+1bsCvjbyPruCbTaz A==;
X-CSE-ConnectionGUID: Tbqwwe2NQ2i6t+MLKk7+4g==
X-CSE-MsgGUID: XF58jqC9TzOHxyuBdTjVfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102578421"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="102578421"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:15 -0700
X-CSE-ConnectionGUID: cUd6Vf6LTDqcRParBfeBig==
X-CSE-MsgGUID: CRqBGsmXSKqZ31mS42fgHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274690870"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:16 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 06/15] drm/xe: Sort xe_config_device fields
Date: Mon,  5 Oct 2026 19:06:16 +0000
Message-ID: <20261005190611.332940-23-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005190611.332940-17-stuart.summers@intel.com>
References: <20261005190611.332940-17-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

As we're planning more configfs entries over time, let's add
some sorting rules to make sure this stays clean and easy to
manage. Sorting first by type and then name for readability.

The documentation block is sorted alphabetically by attribute
name instead, since there is no type information to group by
there.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: LLM
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 1338 +++++++++++++++---------------
 drivers/gpu/drm/xe/xe_configfs.h |   32 +-
 2 files changed, 692 insertions(+), 678 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index a16e2f48b01a..4a92a6f22311 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -58,12 +58,15 @@
  *	│   └── ...
  *	:
  *	└── 0000:03:00.0
- *	    ├── survivability_mode
- *	    ├── gt_types_allowed
+ *	    ├── ctx_restore_mid_bb
+ *	    ├── ctx_restore_post_bb
+ *	    ├── enable_multi_queue
+ *	    ├── enable_psmi
+ *	    ├── enable_vram_page_offline
  *	    ├── engines_allowed
+ *	    ├── gt_types_allowed
  *	    ├── migrate_ulls_period_ms
- *	    ├── enable_psmi
- *	    └── enable_vram_page_offline
+ *	    └── survivability_mode
  *
  * After configuring the attributes as per next section, the device can be
  * probed with::
@@ -75,55 +78,93 @@
  * Configure Attributes
  * ====================
  *
- * Survivability mode:
- * -------------------
+ * Context restore BB
+ * ------------------
  *
- * Enable survivability mode on supported cards. This is a bitmap; bit 0
- * enables survivability mode and is currently the only bit defined, so the
- * only accepted values remain 0 and 1. This setting only takes effect when
- * probing the device. Example to enable it::
+ * Allow to execute a batch buffer during any context switches. When the
+ * GPU is restoring the context, it executes additional commands. It's useful
+ * for testing additional workarounds and validating certain HW behaviors: it's
+ * not intended for normal execution and will taint the kernel with TAINT_TEST
+ * when used.
  *
- *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
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
+ *
+ * Commands are saved per engine class: all instances of that class will execute
+ * those commands during context switch. The instruction, dword arguments,
+ * addresses and values are in hex format like in the examples below.
+ *
+ * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
+ *    normal context restore::
+ *
+ *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
+ *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
+ *
+ * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
+ *    beginning of the context restore::
+ *
+ *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
+ *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
+
+ * #. Load certain values in a couple of registers (it can be used as a simpler
+ *    alternative to the `cmd`) action::
+ *
+ *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
+ *	rcs reg 4F100 DEADBEEF
+ *	rcs reg 4F104 FFFFFFFF
+ *	EOF
+ *
+ *    .. note::
+ *
+ *       When using multiple lines, make sure to use a command that is
+ *       implemented with a single write syscall, like HEREDOC.
+ *
+ * Currently this is implemented only for post and mid context restore and
+ * these attributes can only be set before binding to the device.
+ *
+ * Enable multi-queue
+ * ------------------
+ *
+ * Multi-queue support on the device is enabled by default where the
+ * hardware supports it. Writing 0 force-disables multi-queue support:
+ * multi-queue exec-queue group creation via ioctl is refused, and the
+ * GuC feature is disabled::
+ *
+ *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_multi_queue
  *
  * This attribute can only be set before binding to the device.
  *
- * Examples:
+ * PSMI
+ * ----
  *
- * Allow both primary and media GTs to be initialized and used.  This matches
- * the driver's default behavior::
+ * Enable extra debugging capabilities to trace engine execution. Only useful
+ * during early platform enabling and requires additional hardware connected.
+ * Once it's enabled, additionals WAs are added and runtime configuration is
+ * done via debugfs. Example to enable it::
  *
- *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
  *
- * Allow only the primary GT of each tile to be initialized and used,
- * effectively disabling the media GT if it exists on the platform::
+ * This attribute can only be set before binding to the device.
  *
- *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ * Enable VRAM page offline:
+ * -------------------------
  *
- * Allow only the media GT of each tile to be initialized and used,
- * effectively disabling the primary GT.  **This configuration will cause
- * device probe failure on all current platforms, but may be allowed on
- * igpu platforms in the future**::
+ *  0, n, N, false - Disable vram page offline (Logging only)
+ *  1, y, Y, true  - Enable vram page offline (Offlining is active - default)
  *
- *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ *  Example to disable VRAM offline::
  *
- * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
- * **This configuration will cause device probe failure on all current
- * platforms, but may be allowed on igpu platforms in the future**::
+ *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_vram_page_offline
  *
- *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
+ * This attribute can only be set on CRI before binding to the device.
  *
  * Allowed engines:
  * ----------------
@@ -151,81 +192,69 @@
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
- * Enable VRAM page offline:
- * -------------------------
- *
- *  0, n, N, false - Disable vram page offline (Logging only)
- *  1, y, Y, true  - Enable vram page offline (Offlining is active - default)
- *
- *  Example to disable VRAM offline::
- *
- *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_vram_page_offline
+ * Examples:
  *
- * This attribute can only be set on CRI before binding to the device.
+ * Allow both primary and media GTs to be initialized and used.  This matches
+ * the driver's default behavior::
  *
- * Context restore BB
- * ------------------
+ *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- * Allow to execute a batch buffer during any context switches. When the
- * GPU is restoring the context, it executes additional commands. It's useful
- * for testing additional workarounds and validating certain HW behaviors: it's
- * not intended for normal execution and will taint the kernel with TAINT_TEST
- * when used.
+ * Allow only the primary GT of each tile to be initialized and used,
+ * effectively disabling the media GT if it exists on the platform::
  *
- * The syntax allows to pass straight instructions to be executed by the engine
- * in a batch buffer or set specific registers.
+ *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- * #. Generic instruction::
+ * Allow only the media GT of each tile to be initialized and used,
+ * effectively disabling the primary GT.  **This configuration will cause
+ * device probe failure on all current platforms, but may be allowed on
+ * igpu platforms in the future**::
  *
- *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
+ *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- * #. Simple register setting::
+ * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
+ * **This configuration will cause device probe failure on all current
+ * platforms, but may be allowed on igpu platforms in the future**::
  *
- *	<engine-class> reg <address> <value>
+ *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- * Commands are saved per engine class: all instances of that class will execute
- * those commands during context switch. The instruction, dword arguments,
- * addresses and values are in hex format like in the examples below.
+ * Migrate ULLS Period (ms)
+ * ------------------------
  *
- * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
- *    normal context restore::
+ * Migrate ULLS period, in milliseconds. This is the delay between entering
+ * migrate ULLS (a continuously running batch) and exiting it. Migrate ULLS is
+ * currently entered during page faults and SVM prefetch operations. Default 5,
+ * zero indicates ULLS is disabled.
  *
- *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
- *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
+ * How to disable migration ULLS:
  *
- * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
- *    beginning of the context restore::
+ *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/migrate_ulls_period_ms
  *
- *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
- *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
-
- * #. Load certain values in a couple of registers (it can be used as a simpler
- *    alternative to the `cmd`) action::
+ * This attribute can only be set before binding to the device.
  *
- *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
- *	rcs reg 4F100 DEADBEEF
- *	rcs reg 4F104 FFFFFFFF
- *	EOF
+ * Survivability mode:
+ * -------------------
  *
- *    .. note::
+ * Enable survivability mode on supported cards. This is a bitmap; bit 0
+ * enables survivability mode and is currently the only bit defined, so the
+ * only accepted values remain 0 and 1. This setting only takes effect when
+ * probing the device. Example to enable it::
  *
- *       When using multiple lines, make sure to use a command that is
- *       implemented with a single write syscall, like HEREDOC.
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
  *
- * Currently this is implemented only for post and mid context restore and
- * these attributes can only be set before binding to the device.
+ * This attribute can only be set before binding to the device.
  *
  * Max SR-IOV Virtual Functions
  * ----------------------------
@@ -253,32 +282,6 @@
  *
  * This setting only takes effect when probing the device.
  *
- * Enable multi-queue
- * ------------------
- *
- * Multi-queue support on the device is enabled by default where the
- * hardware supports it. Writing 0 force-disables multi-queue support:
- * multi-queue exec-queue group creation via ioctl is refused, and the
- * GuC feature is disabled::
- *
- *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_multi_queue
- *
- * This attribute can only be set before binding to the device.
- *
- * Migrate ULLS Period (ms)
- * ------------------------
- *
- * Migrate ULLS period, in milliseconds. This is the delay between entering
- * migrate ULLS (a continuously running batch) and exiting it. Migrate ULLS is
- * currently entered during page faults and SVM prefetch operations. Default 5,
- * zero indicates ULLS is disabled.
- *
- * How to disable migration ULLS:
- *
- *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/migrate_ulls_period_ms
- *
- * This attribute can only be set before binding to the device.
- *
  * Remove devices
  * ==============
  *
@@ -297,15 +300,20 @@ struct xe_config_group_device {
 	struct config_group group;
 	struct config_group sriov;
 
+	/*
+	 * Fields sorted by type (largest first) then name: struct arrays,
+	 * u64, u32/unsigned int, u8, bool, sub-structs last. Within each
+	 * type, entries are sorted alphabetically.
+	 */
 	struct xe_config_device {
-		u64 gt_types_allowed;
+		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
+		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		u64 engines_allowed;
+		u64 gt_types_allowed;
 		u32 migrate_ulls_period_ms;
-		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
-		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		u8 survivability_mode;
-		bool enable_psmi;
 		bool enable_multi_queue;
+		bool enable_psmi;
 		bool enable_vram_page_offline;
 		struct {
 			unsigned int max_vfs;
@@ -322,12 +330,12 @@ struct xe_config_group_device {
 };
 
 static const struct xe_config_device device_defaults = {
-	.gt_types_allowed = U64_MAX,
 	.engines_allowed = U64_MAX,
+	.gt_types_allowed = U64_MAX,
 	.migrate_ulls_period_ms = 5,
 	.survivability_mode = 0,
-	.enable_psmi = false,
 	.enable_multi_queue = true,
+	.enable_psmi = false,
 	.enable_vram_page_offline = true,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
@@ -405,84 +413,345 @@ static bool is_bound(struct xe_config_group_device *dev)
 	return ret;
 }
 
-static ssize_t survivability_mode_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = to_xe_config_device(item);
-
-	return sprintf(page, "%u\n", dev->survivability_mode);
-}
-
-static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	u8 survivability_mode;
-	int ret;
-
-	ret = kstrtou8(page, 0, &survivability_mode);
-	if (ret)
-		return ret;
+static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev);
 
-	if (survivability_mode & ~XE_CONFIGFS_SURVIVABILITY_MASK)
+/**
+ * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
+ * @pdev: pci device
+ * @class: hw engine class
+ * @cs: destination buffer for the batch, or NULL to only query the length
+ * @max_len: capacity of @cs, in dwords
+ *
+ * Copy the configured batch into @cs while holding the configfs lock, so the
+ * caller never gets a pointer to storage owned by the configfs group.
+ *
+ * Return: Number of dwords used in the mid_ctx_restore setting in configfs, or
+ * -ENOSPC if it does not fit in @max_len
+ */
+ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+					   enum xe_engine_class class,
+					   u32 *cs, size_t max_len)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	ssize_t len;
+
+	if (!dev)
+		return 0;
+
+	scoped_guard(mutex, &dev->lock) {
+		len = dev->config.ctx_restore_mid_bb[class].len;
+		if (cs && len) {
+			if (len > max_len)
+				len = -ENOSPC;
+			else
+				memcpy(cs, dev->config.ctx_restore_mid_bb[class].cs,
+				       len * sizeof(u32));
+		}
+	}
+	config_group_put(&dev->group);
+
+	return len;
+}
+
+/**
+ * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
+ * @pdev: pci device
+ * @class: hw engine class
+ * @cs: destination buffer for the batch, or NULL to only query the length
+ * @max_len: capacity of @cs, in dwords
+ *
+ * Copy the configured batch into @cs while holding the configfs lock, so the
+ * caller never gets a pointer to storage owned by the configfs group.
+ *
+ * Return: Number of dwords used in the post_ctx_restore setting in configfs, or
+ * -ENOSPC if it does not fit in @max_len
+ */
+ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+					    enum xe_engine_class class,
+					    u32 *cs, size_t max_len)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	ssize_t len;
+
+	if (!dev)
+		return 0;
+
+	scoped_guard(mutex, &dev->lock) {
+		len = dev->config.ctx_restore_post_bb[class].len;
+		if (cs && len) {
+			if (len > max_len)
+				len = -ENOSPC;
+			else
+				memcpy(cs, dev->config.ctx_restore_post_bb[class].cs,
+				       len * sizeof(u32));
+		}
+	}
+	config_group_put(&dev->group);
+
+	return len;
+}
+
+static bool wa_bb_read_advance(bool dereference, char **p,
+			       const char *append, size_t len,
+			       size_t *max_size)
+{
+	if (dereference) {
+		if (len >= *max_size)
+			return false;
+		*max_size -= len;
+		if (append)
+			memcpy(*p, append, len);
+	}
+
+	*p += len;
+
+	return true;
+}
+
+static ssize_t wa_bb_show(struct xe_config_group_device *dev,
+			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
+			  char *data, size_t sz)
+{
+	char *p = data;
+
+	guard(mutex)(&dev->lock);
+
+	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		enum xe_engine_class ec = engine_info[i].engine_class;
+		size_t len;
+
+		if (!wa_bb[ec].len)
+			continue;
+
+		len = snprintf(p, sz, "%s:", engine_info[i].cls);
+		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
+			return -ENOBUFS;
+
+		for (size_t j = 0; j < wa_bb[ec].len; j++) {
+			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);
+			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
+				return -ENOBUFS;
+		}
+
+		if (!wa_bb_read_advance(data, &p, "\n", 1, &sz))
+			return -ENOBUFS;
+	}
+
+	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
+		return -ENOBUFS;
+
+	/* Reserve one more to match check for '\0' */
+	if (!data)
+		p++;
+
+	return p - data;
+}
+
+static ssize_t ctx_restore_mid_bb_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return wa_bb_show(dev, dev->config.ctx_restore_mid_bb, page, SZ_4K);
+}
+
+static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return wa_bb_show(dev, dev->config.ctx_restore_post_bb, page, SZ_4K);
+}
+
+static void wa_bb_append(struct wa_bb *wa_bb, u32 val)
+{
+	if (wa_bb->cs)
+		wa_bb->cs[wa_bb->len] = val;
+
+	wa_bb->len++;
+}
+
+static ssize_t parse_hex(const char *line, u32 *pval)
+{
+	char numstr[12];
+	const char *p;
+	ssize_t numlen;
+
+	p = line + strspn(line, " \t");
+	if (!*p || *p == '\n')
+		return 0;
+
+	numlen = strcspn(p, " \t\n");
+	if (!numlen || numlen >= sizeof(numstr) - 1)
+		return -EINVAL;
+
+	memcpy(numstr, p, numlen);
+	numstr[numlen] = '\0';
+	p += numlen;
+
+	if (kstrtou32(numstr, 16, pval))
 		return -EINVAL;
 
+	return p - line;
+}
+
+static int parse_engine(const char *s, const char *end_chars, u64 *mask,
+			const struct engine_info **pinfo);
+
+/*
+ * Parse lines with the format
+ *
+ *	<engine-class> cmd <u32> <u32...>
+ *	<engine-class> reg <u32_addr> <u32_val>
+ *
+ * and optionally save them in @wa_bb[i].cs is non-NULL.
+ *
+ * Return the number of dwords parsed.
+ */
+static ssize_t parse_wa_bb_lines(const char *lines,
+				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
+{
+	ssize_t dwords = 0, ret;
+	const char *p;
+
+	/*
+	 * Each iteration consumes at least the engine class token if it doesn't
+	 * error out, so the loop always makes progress without advancing @p.
+	 */
+	for (p = lines; *p;) {
+		const struct engine_info *info = NULL;
+		u32 val, val2;
+
+		/* Also allow empty lines */
+		p += strspn(p, " \t\n");
+		if (!*p)
+			break;
+
+		ret = parse_engine(p, " \t\n", NULL, &info);
+		if (ret < 0)
+			return ret;
+
+		p += ret;
+		p += strspn(p, " \t");
+
+		if (str_has_prefix(p, "cmd")) {
+			for (p += strlen("cmd"); *p;) {
+				ret = parse_hex(p, &val);
+				if (ret < 0)
+					return -EINVAL;
+				if (!ret)
+					break;
+
+				p += ret;
+				dwords++;
+				wa_bb_append(&wa_bb[info->engine_class], val);
+			}
+		} else if (str_has_prefix(p, "reg")) {
+			p += strlen("reg");
+			ret = parse_hex(p, &val);
+			if (ret <= 0)
+				return -EINVAL;
+
+			p += ret;
+			ret = parse_hex(p, &val2);
+			if (ret <= 0)
+				return -EINVAL;
+
+			p += ret;
+			dwords += 3;
+			wa_bb_append(&wa_bb[info->engine_class],
+				     MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1));
+			wa_bb_append(&wa_bb[info->engine_class], val);
+			wa_bb_append(&wa_bb[info->engine_class], val2);
+		} else {
+			return -EINVAL;
+		}
+	}
+
+	return dwords;
+}
+
+static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
+			   struct xe_config_group_device *dev,
+			   const char *page, size_t len)
+{
+	/* tmp_wa_bb must match wa_bb's size */
+	struct wa_bb tmp_wa_bb[XE_ENGINE_CLASS_MAX] = { };
+	ssize_t count, class;
+	u32 *tmp;
+
+	/* 1. Count dwords - wa_bb[i].cs is NULL for all classes */
+	count = parse_wa_bb_lines(page, tmp_wa_bb);
+	if (count < 0)
+		return count;
+
 	guard(mutex)(&dev->lock);
+
 	if (is_bound(dev))
 		return -EBUSY;
 
-	dev->config.survivability_mode = survivability_mode;
+	/*
+	 * 2. Allocate a u32 array and set the pointers to the right positions
+	 * according to the length of each class' wa_bb
+	 */
+	tmp = krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
 
-	return len;
-}
+	if (!count) {
+		memset(wa_bb, 0, sizeof(tmp_wa_bb));
+		return len;
+	}
 
-static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = to_xe_config_device(item);
-	char *p = page;
+	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
+		tmp_wa_bb[class].cs = tmp + count;
+		count += tmp_wa_bb[class].len;
+		tmp_wa_bb[class].len = 0;
+	}
 
-	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
-		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
-			p += sprintf(p, "%s\n", gt_types[i].name);
+	/* 3. Parse wa_bb lines again, this time saving the values */
+	count = parse_wa_bb_lines(page, tmp_wa_bb);
+	if (count < 0)
+		return count;
 
-	return p - page;
+	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
+
+	return len;
 }
 
-static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
-				      size_t len)
+static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
+					const char *data, size_t sz)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
-	char *p = buf;
-	u64 typemask = 0;
 
-	if (!buf)
-		return -ENOMEM;
-
-	while (p) {
-		char *typename = strsep(&p, ",\n");
-		bool matched = false;
+	return wa_bb_store(dev->config.ctx_restore_mid_bb, dev, data, sz);
+}
 
-		if (typename[0] == '\0')
-			continue;
+static ssize_t ctx_restore_post_bb_store(struct config_item *item,
+					 const char *data, size_t sz)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 
-		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
-			if (strcmp(typename, gt_types[i].name) == 0) {
-				typemask |= BIT(gt_types[i].type);
-				matched = true;
-				break;
-			}
-		}
+	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
+}
 
-		if (!matched)
-			return -EINVAL;
-	}
+/**
+ * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
+ * @pdev: pci device
+ *
+ * Return: engine mask with allowed engines set in configfs
+ */
+u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u64 engines_allowed;
 
-	guard(mutex)(&dev->lock);
-	if (is_bound(dev))
-		return -EBUSY;
+	if (!dev)
+		return device_defaults.engines_allowed;
 
-	dev->config.gt_types_allowed = typemask;
+	scoped_guard(mutex, &dev->lock)
+		engines_allowed = dev->config.engines_allowed;
+	config_group_put(&dev->group);
 
-	return len;
+	return engines_allowed;
 }
 
 static ssize_t engines_allowed_show(struct config_item *item, char *page)
@@ -600,59 +869,117 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	return len;
 }
 
-static ssize_t enable_psmi_show(struct config_item *item, char *page)
+static u64 get_gt_types_allowed(struct pci_dev *pdev)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
-
-	return sprintf(page, "%d\n", dev->enable_psmi);
-}
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u64 mask;
 
-static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	bool val;
-	int ret;
+	if (!dev)
+		return device_defaults.gt_types_allowed;
 
-	ret = kstrtobool(page, &val);
-	if (ret)
-		return ret;
+	scoped_guard(mutex, &dev->lock)
+		mask = dev->config.gt_types_allowed;
+	config_group_put(&dev->group);
 
-	guard(mutex)(&dev->lock);
-	if (is_bound(dev))
-		return -EBUSY;
+	return mask;
+}
 
-	dev->config.enable_psmi = val;
+/**
+ * xe_configfs_primary_gt_allowed - determine whether primary GTs are supported
+ * @pdev: pci device
+ *
+ * Return: True if primary GTs are enabled, false if they have been disabled via
+ *     configfs.
+ */
+bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev)
+{
+	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MAIN);
+}
 
-	return len;
+/**
+ * xe_configfs_media_gt_allowed - determine whether media GTs are supported
+ * @pdev: pci device
+ *
+ * Return: True if the media GTs are enabled, false if they have been disabled
+ *     via configfs.
+ */
+bool xe_configfs_media_gt_allowed(struct pci_dev *pdev)
+{
+	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MEDIA);
 }
 
-static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
+static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
+	char *p = page;
 
-	return sprintf(page, "%d\n", dev->enable_multi_queue);
+	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
+		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
+			p += sprintf(p, "%s\n", gt_types[i].name);
+
+	return p - page;
 }
 
-static ssize_t enable_multi_queue_store(struct config_item *item, const char *page,
-					size_t len)
+static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
+				      size_t len)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	bool val;
-	int ret;
+	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
+	char *p = buf;
+	u64 typemask = 0;
 
-	ret = kstrtobool(page, &val);
-	if (ret)
-		return ret;
+	if (!buf)
+		return -ENOMEM;
+
+	while (p) {
+		char *typename = strsep(&p, ",\n");
+		bool matched = false;
+
+		if (typename[0] == '\0')
+			continue;
+
+		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
+			if (strcmp(typename, gt_types[i].name) == 0) {
+				typemask |= BIT(gt_types[i].type);
+				matched = true;
+				break;
+			}
+		}
+
+		if (!matched)
+			return -EINVAL;
+	}
 
 	guard(mutex)(&dev->lock);
 	if (is_bound(dev))
 		return -EBUSY;
 
-	dev->config.enable_multi_queue = val;
+	dev->config.gt_types_allowed = typemask;
 
 	return len;
 }
 
+/**
+ * xe_configfs_get_migrate_ulls_period_ms - get configfs migrate_ulls_period_ms setting
+ * @pdev: pci device
+ *
+ * Return: Migrate ULLS period in milliseconds (zero is disabled).
+ */
+u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u32 ret;
+
+	if (!dev)
+		return device_defaults.migrate_ulls_period_ms;
+
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.migrate_ulls_period_ms;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
 static ssize_t migrate_ulls_period_ms_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -680,292 +1007,220 @@ static ssize_t migrate_ulls_period_ms_store(struct config_item *item,
 	return len;
 }
 
-static ssize_t enable_vram_page_offline_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = to_xe_config_device(item);
-
-	return sprintf(page, "%s\n", str_yes_no(dev->enable_vram_page_offline));
-}
-
-static ssize_t enable_vram_page_offline_store(struct config_item *item,
-					      const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	bool val;
-	int ret;
-
-	ret = kstrtobool(page, &val);
-	if (ret)
-		return ret;
-
-	guard(mutex)(&dev->lock);
-	if (is_bound(dev))
-		return -EBUSY;
-
-	dev->config.enable_vram_page_offline = val;
-
-	return len;
-}
-
-static bool wa_bb_read_advance(bool dereference, char **p,
-			       const char *append, size_t len,
-			       size_t *max_size)
-{
-	if (dereference) {
-		if (len >= *max_size)
-			return false;
-		*max_size -= len;
-		if (append)
-			memcpy(*p, append, len);
-	}
-
-	*p += len;
-
-	return true;
-}
-
-static ssize_t wa_bb_show(struct xe_config_group_device *dev,
-			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
-			  char *data, size_t sz)
+/**
+ * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
+ * @pdev: pci device
+ *
+ * Return: survivability_mode attribute in configfs
+ */
+u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 {
-	char *p = data;
-
-	guard(mutex)(&dev->lock);
-
-	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
-		enum xe_engine_class ec = engine_info[i].engine_class;
-		size_t len;
-
-		if (!wa_bb[ec].len)
-			continue;
-
-		len = snprintf(p, sz, "%s:", engine_info[i].cls);
-		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
-			return -ENOBUFS;
-
-		for (size_t j = 0; j < wa_bb[ec].len; j++) {
-			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);
-			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
-				return -ENOBUFS;
-		}
-
-		if (!wa_bb_read_advance(data, &p, "\n", 1, &sz))
-			return -ENOBUFS;
-	}
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u8 mode;
 
-	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
-		return -ENOBUFS;
+	if (!dev)
+		return device_defaults.survivability_mode;
 
-	/* Reserve one more to match check for '\0' */
-	if (!data)
-		p++;
+	scoped_guard(mutex, &dev->lock)
+		mode = dev->config.survivability_mode;
+	config_group_put(&dev->group);
 
-	return p - data;
+	return mode;
 }
 
-static ssize_t ctx_restore_mid_bb_show(struct config_item *item, char *page)
+static ssize_t survivability_mode_show(struct config_item *item, char *page)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_device *dev = to_xe_config_device(item);
 
-	return wa_bb_show(dev, dev->config.ctx_restore_mid_bb, page, SZ_4K);
+	return sprintf(page, "%u\n", dev->survivability_mode);
 }
 
-static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
+static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	u8 survivability_mode;
+	int ret;
 
-	return wa_bb_show(dev, dev->config.ctx_restore_post_bb, page, SZ_4K);
-}
+	ret = kstrtou8(page, 0, &survivability_mode);
+	if (ret)
+		return ret;
 
-static void wa_bb_append(struct wa_bb *wa_bb, u32 val)
-{
-	if (wa_bb->cs)
-		wa_bb->cs[wa_bb->len] = val;
+	if (survivability_mode & ~XE_CONFIGFS_SURVIVABILITY_MASK)
+		return -EINVAL;
 
-	wa_bb->len++;
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.survivability_mode = survivability_mode;
+
+	return len;
 }
 
-static ssize_t parse_hex(const char *line, u32 *pval)
+/**
+ * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
+ * @pdev: pci device
+ *
+ * Return: true if multi-queue is enabled for this device (the default),
+ * false if it has been force-disabled via configfs.
+ */
+bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
 {
-	char numstr[12];
-	const char *p;
-	ssize_t numlen;
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
 
-	p = line + strspn(line, " \t");
-	if (!*p || *p == '\n')
-		return 0;
+	if (!dev)
+		return true;
 
-	numlen = strcspn(p, " \t\n");
-	if (!numlen || numlen >= sizeof(numstr) - 1)
-		return -EINVAL;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_multi_queue;
+	config_group_put(&dev->group);
 
-	memcpy(numstr, p, numlen);
-	numstr[numlen] = '\0';
-	p += numlen;
+	return ret;
+}
 
-	if (kstrtou32(numstr, 16, pval))
-		return -EINVAL;
+static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
 
-	return p - line;
+	return sprintf(page, "%d\n", dev->enable_multi_queue);
 }
 
-/*
- * Parse lines with the format
- *
- *	<engine-class> cmd <u32> <u32...>
- *	<engine-class> reg <u32_addr> <u32_val>
- *
- * and optionally save them in @wa_bb[i].cs is non-NULL.
- *
- * Return the number of dwords parsed.
- */
-static ssize_t parse_wa_bb_lines(const char *lines,
-				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
+static ssize_t enable_multi_queue_store(struct config_item *item, const char *page,
+					size_t len)
 {
-	ssize_t dwords = 0, ret;
-	const char *p;
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
 
-	/*
-	 * Each iteration consumes at least the engine class token if it doesn't
-	 * error out, so the loop always makes progress without advancing @p.
-	 */
-	for (p = lines; *p;) {
-		const struct engine_info *info = NULL;
-		u32 val, val2;
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
 
-		/* Also allow empty lines */
-		p += strspn(p, " \t\n");
-		if (!*p)
-			break;
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
 
-		ret = parse_engine(p, " \t\n", NULL, &info);
-		if (ret < 0)
-			return ret;
+	dev->config.enable_multi_queue = val;
 
-		p += ret;
-		p += strspn(p, " \t");
+	return len;
+}
 
-		if (str_has_prefix(p, "cmd")) {
-			for (p += strlen("cmd"); *p;) {
-				ret = parse_hex(p, &val);
-				if (ret < 0)
-					return -EINVAL;
-				if (!ret)
-					break;
+/**
+ * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
+ * @pdev: pci device
+ *
+ * Return: enable_psmi setting in configfs
+ */
+bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
 
-				p += ret;
-				dwords++;
-				wa_bb_append(&wa_bb[info->engine_class], val);
-			}
-		} else if (str_has_prefix(p, "reg")) {
-			p += strlen("reg");
-			ret = parse_hex(p, &val);
-			if (ret <= 0)
-				return -EINVAL;
+	if (!dev)
+		return false;
 
-			p += ret;
-			ret = parse_hex(p, &val2);
-			if (ret <= 0)
-				return -EINVAL;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_psmi;
+	config_group_put(&dev->group);
 
-			p += ret;
-			dwords += 3;
-			wa_bb_append(&wa_bb[info->engine_class],
-				     MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1));
-			wa_bb_append(&wa_bb[info->engine_class], val);
-			wa_bb_append(&wa_bb[info->engine_class], val2);
-		} else {
-			return -EINVAL;
-		}
-	}
+	return ret;
+}
 
-	return dwords;
+static ssize_t enable_psmi_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->enable_psmi);
 }
 
-static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
-			   struct xe_config_group_device *dev,
-			   const char *page, size_t len)
+static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
 {
-	/* tmp_wa_bb must match wa_bb's size */
-	struct wa_bb tmp_wa_bb[XE_ENGINE_CLASS_MAX] = { };
-	ssize_t count, class;
-	u32 *tmp;
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
 
-	/* 1. Count dwords - wa_bb[i].cs is NULL for all classes */
-	count = parse_wa_bb_lines(page, tmp_wa_bb);
-	if (count < 0)
-		return count;
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
 
 	guard(mutex)(&dev->lock);
-
 	if (is_bound(dev))
 		return -EBUSY;
 
-	/*
-	 * 2. Allocate a u32 array and set the pointers to the right positions
-	 * according to the length of each class' wa_bb
-	 */
-	tmp = krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
+	dev->config.enable_psmi = val;
 
-	if (!count) {
-		memset(wa_bb, 0, sizeof(tmp_wa_bb));
-		return len;
-	}
+	return len;
+}
 
-	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
-		tmp_wa_bb[class].cs = tmp + count;
-		count += tmp_wa_bb[class].len;
-		tmp_wa_bb[class].len = 0;
-	}
+/**
+ * xe_configfs_get_enable_vram_page_offline - get configfs enable_vram_page_offline setting
+ * @pdev: pci device
+ *
+ * Return: enable_vram_page_offline setting in configfs
+ */
+bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
 
-	/* 3. Parse wa_bb lines again, this time saving the values */
-	count = parse_wa_bb_lines(page, tmp_wa_bb);
-	if (count < 0)
-		return count;
+	if (!dev)
+		return device_defaults.enable_vram_page_offline;
 
-	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_vram_page_offline;
+	config_group_put(&dev->group);
 
-	return len;
+	return ret;
 }
 
-static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
-					const char *data, size_t sz)
+static ssize_t enable_vram_page_offline_show(struct config_item *item, char *page)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_device *dev = to_xe_config_device(item);
 
-	return wa_bb_store(dev->config.ctx_restore_mid_bb, dev, data, sz);
+	return sprintf(page, "%s\n", str_yes_no(dev->enable_vram_page_offline));
 }
 
-static ssize_t ctx_restore_post_bb_store(struct config_item *item,
-					 const char *data, size_t sz)
+static ssize_t enable_vram_page_offline_store(struct config_item *item,
+					      const char *page, size_t len)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
 
-	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.enable_vram_page_offline = val;
+
+	return len;
 }
 
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
-CONFIGFS_ATTR(, enable_multi_queue);
-CONFIGFS_ATTR(, migrate_ulls_period_ms);
-CONFIGFS_ATTR(, enable_psmi);
-CONFIGFS_ATTR(, enable_vram_page_offline);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
+CONFIGFS_ATTR(, migrate_ulls_period_ms);
 CONFIGFS_ATTR(, survivability_mode);
+CONFIGFS_ATTR(, enable_multi_queue);
+CONFIGFS_ATTR(, enable_psmi);
+CONFIGFS_ATTR(, enable_vram_page_offline);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
-	&attr_enable_multi_queue,
-	&attr_migrate_ulls_period_ms,
-	&attr_enable_psmi,
-	&attr_enable_vram_page_offline,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
+	&attr_migrate_ulls_period_ms,
 	&attr_survivability_mode,
+	&attr_enable_multi_queue,
+	&attr_enable_psmi,
+	&attr_enable_vram_page_offline,
 	NULL,
 };
 
@@ -1242,13 +1497,13 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 				 dev->config.attr_); \
 	} while (0)
 
-	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
+	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%u", migrate_ulls_period_ms);
+	PRI_CUSTOM_ATTR("%u", survivability_mode);
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", enable_vram_page_offline);
-	PRI_CUSTOM_ATTR("%u", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1277,247 +1532,6 @@ void xe_configfs_check_device(struct pci_dev *pdev)
 	config_group_put(&dev->group);
 }
 
-/**
- * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
- * @pdev: pci device
- *
- * Return: survivability_mode attribute in configfs
- */
-u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	u8 mode;
-
-	if (!dev)
-		return device_defaults.survivability_mode;
-
-	scoped_guard(mutex, &dev->lock)
-		mode = dev->config.survivability_mode;
-	config_group_put(&dev->group);
-
-	return mode;
-}
-
-static u64 get_gt_types_allowed(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	u64 mask;
-
-	if (!dev)
-		return device_defaults.gt_types_allowed;
-
-	scoped_guard(mutex, &dev->lock)
-		mask = dev->config.gt_types_allowed;
-	config_group_put(&dev->group);
-
-	return mask;
-}
-
-/**
- * xe_configfs_primary_gt_allowed - determine whether primary GTs are supported
- * @pdev: pci device
- *
- * Return: True if primary GTs are enabled, false if they have been disabled via
- *     configfs.
- */
-bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev)
-{
-	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MAIN);
-}
-
-/**
- * xe_configfs_media_gt_allowed - determine whether media GTs are supported
- * @pdev: pci device
- *
- * Return: True if the media GTs are enabled, false if they have been disabled
- *     via configfs.
- */
-bool xe_configfs_media_gt_allowed(struct pci_dev *pdev)
-{
-	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MEDIA);
-}
-
-/**
- * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
- * @pdev: pci device
- *
- * Return: engine mask with allowed engines set in configfs
- */
-u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	u64 engines_allowed;
-
-	if (!dev)
-		return device_defaults.engines_allowed;
-
-	scoped_guard(mutex, &dev->lock)
-		engines_allowed = dev->config.engines_allowed;
-	config_group_put(&dev->group);
-
-	return engines_allowed;
-}
-
-/**
- * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
- * @pdev: pci device
- *
- * Return: enable_psmi setting in configfs
- */
-bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	bool ret;
-
-	if (!dev)
-		return false;
-
-	scoped_guard(mutex, &dev->lock)
-		ret = dev->config.enable_psmi;
-	config_group_put(&dev->group);
-
-	return ret;
-}
-
-/**
- * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
- * @pdev: pci device
- *
- * Return: true if multi-queue is enabled for this device (the default),
- * false if it has been force-disabled via configfs.
- */
-bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	bool ret;
-
-	if (!dev)
-		return true;
-
-	scoped_guard(mutex, &dev->lock)
-		ret = dev->config.enable_multi_queue;
-	config_group_put(&dev->group);
-
-	return ret;
-}
-
-/**
- * xe_configfs_get_migrate_ulls_period_ms - get configfs migrate_ulls_period_ms setting
- * @pdev: pci device
- *
- * Return: Migrate ULLS period in milliseconds (zero is disabled).
- */
-u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	u32 ret;
-
-	if (!dev)
-		return device_defaults.migrate_ulls_period_ms;
-
-	ret = dev->config.migrate_ulls_period_ms;
-	config_group_put(&dev->group);
-
-	return ret;
-}
-
-/**
- * xe_configfs_get_enable_vram_page_offline - get configfs enable_vram_page_offline setting
- * @pdev: pci device
- *
- * Return: enable_vram_page_offline setting in configfs
- */
-bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	bool ret;
-
-	if (!dev)
-		return device_defaults.enable_vram_page_offline;
-
-	scoped_guard(mutex, &dev->lock)
-		ret = dev->config.enable_vram_page_offline;
-	config_group_put(&dev->group);
-
-	return ret;
-}
-
-/**
- * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
- * @pdev: pci device
- * @class: hw engine class
- * @cs: destination buffer for the batch, or NULL to only query the length
- * @max_len: capacity of @cs, in dwords
- *
- * Copy the configured batch into @cs while holding the configfs lock, so the
- * caller never gets a pointer to storage owned by the configfs group.
- *
- * Return: Number of dwords used in the mid_ctx_restore setting in configfs, or
- * -ENOSPC if it does not fit in @max_len
- */
-ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
-					   enum xe_engine_class class,
-					   u32 *cs, size_t max_len)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	ssize_t len;
-
-	if (!dev)
-		return 0;
-
-	scoped_guard(mutex, &dev->lock) {
-		len = dev->config.ctx_restore_mid_bb[class].len;
-		if (cs && len) {
-			if (len > max_len)
-				len = -ENOSPC;
-			else
-				memcpy(cs, dev->config.ctx_restore_mid_bb[class].cs,
-				       len * sizeof(u32));
-		}
-	}
-	config_group_put(&dev->group);
-
-	return len;
-}
-
-/**
- * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
- * @pdev: pci device
- * @class: hw engine class
- * @cs: destination buffer for the batch, or NULL to only query the length
- * @max_len: capacity of @cs, in dwords
- *
- * Copy the configured batch into @cs while holding the configfs lock, so the
- * caller never gets a pointer to storage owned by the configfs group.
- *
- * Return: Number of dwords used in the post_ctx_restore setting in configfs, or
- * -ENOSPC if it does not fit in @max_len
- */
-ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
-					    enum xe_engine_class class,
-					    u32 *cs, size_t max_len)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	ssize_t len;
-
-	if (!dev)
-		return 0;
-
-	scoped_guard(mutex, &dev->lock) {
-		len = dev->config.ctx_restore_post_bb[class].len;
-		if (cs && len) {
-			if (len > max_len)
-				len = -ENOSPC;
-			else
-				memcpy(cs, dev->config.ctx_restore_post_bb[class].cs,
-				       len * sizeof(u32));
-		}
-	}
-	config_group_put(&dev->group);
-
-	return len;
-}
-
 #ifdef CONFIG_PCI_IOV
 /**
  * xe_configfs_admin_only_pf() - Get PF's operational mode.
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index a5c081fc1672..275086e50451 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -30,20 +30,20 @@ struct pci_dev;
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev);
-bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
-bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
-u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
-bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
-bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
-u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
-bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev);
 ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 					   enum xe_engine_class class,
 					   u32 *cs, size_t max_len);
 ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 					    enum xe_engine_class class,
 					    u32 *cs, size_t max_len);
+u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
+bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
+bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
+u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
+u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
+bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
@@ -52,20 +52,20 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
-static inline u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return 0; }
-static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
-static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
-static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
-static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
-static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
-static inline u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev) { return 5; }
-static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
 static inline ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 							 enum xe_engine_class class,
 							 u32 *cs, size_t max_len) { return 0; }
 static inline ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 							  enum xe_engine_class class,
 							  u32 *cs, size_t max_len) { return 0; }
+static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
+static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
+static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
+static inline u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev) { return 5; }
+static inline u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return 0; }
+static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
+static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
 #ifdef CONFIG_PCI_IOV
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
 {
-- 
2.43.0

