Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13163C98325
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 23:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704FF10E8C6;
	Thu, 24 Sep 2026 23:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsVniT6d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4536E10E796
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 23:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790290883; x=1821826883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mKVbWkp8bSQMUSOhiBvdrwDYhZPB0JM0XLUj4zIZrRA=;
 b=VsVniT6duusIelNjFXJamrJCKIbcKCHIb/XFUDpBKciPLTURWP8Z8pUa
 Mgk4N77BLdr7nZQfHx3P6K17L6Wl7fgABzjfXWCyFTW+B/f46tjSoJ+wr
 SyzgDrMLBhUIeylFqDvzrdXHKpuDmodu4/513q2Acjv4m7l6eRiu9Hb1d
 iaeNPyOw7kKOgyAeDImHahlTIj2FR5wQvRlYJpoeLIjQN+sS+9htoWyU4
 8FDp/5VCyoFZkp8h1KqDbopw5JhKV5o/2XGna+SZxvA5enPRA9npY0AlY
 9ME/m+zD/9rwcZaGQuyGwiIaRP+bD0GAvJfRo96k4ioiw6AlNQV0eD5wT A==;
X-CSE-ConnectionGUID: 0Z/4iDTPSkajSOxIZfA5mQ==
X-CSE-MsgGUID: CgOI9GoSQuaT8ctmmCyNnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90120174"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90120174"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:23 -0700
X-CSE-ConnectionGUID: 4pmKAS6uSPuhtKth2TiJ8Q==
X-CSE-MsgGUID: vuGXyWRuQ0qaOm3/pjceUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="270651609"
Received: from dut4435arlh.fm.intel.com ([10.105.8.61])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:22 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 07/16] drm/xe: Sort xe_config_device fields
Date: Thu, 24 Sep 2026 23:01:26 +0000
Message-ID: <20260924230120.389685-25-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924230120.389685-18-stuart.summers@intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
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
Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7,claude-opus-5
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 1237 +++++++++++++++---------------
 drivers/gpu/drm/xe/xe_configfs.h |   14 +-
 2 files changed, 632 insertions(+), 619 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 722babb8b328..9e0f5af30b0c 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -58,11 +58,14 @@
  *	│   └── ...
  *	:
  *	└── 0000:03:00.0
- *	    ├── survivability_mode
- *	    ├── gt_types_allowed
- *	    ├── engines_allowed
+ *	    ├── ctx_restore_mid_bb
+ *	    ├── ctx_restore_post_bb
+ *	    ├── enable_multi_queue
  *	    ├── enable_psmi
- *	    └── enable_vram_page_offline
+ *	    ├── enable_vram_page_offline
+ *	    ├── engines_allowed
+ *	    ├── gt_types_allowed
+ *	    └── survivability_mode
  *
  * After configuring the attributes as per next section, the device can be
  * probed with::
@@ -74,55 +77,93 @@
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
@@ -150,81 +191,55 @@
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
- *
- * This attribute can only be set on CRI before binding to the device.
- *
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
+ * Examples:
  *
- *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
+ * Allow both primary and media GTs to be initialized and used.  This matches
+ * the driver's default behavior::
  *
- * #. Simple register setting::
+ *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- *	<engine-class> reg <address> <value>
+ * Allow only the primary GT of each tile to be initialized and used,
+ * effectively disabling the media GT if it exists on the platform::
  *
- * Commands are saved per engine class: all instances of that class will execute
- * those commands during context switch. The instruction, dword arguments,
- * addresses and values are in hex format like in the examples below.
+ *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
- *    normal context restore::
+ * Allow only the media GT of each tile to be initialized and used,
+ * effectively disabling the primary GT.  **This configuration will cause
+ * device probe failure on all current platforms, but may be allowed on
+ * igpu platforms in the future**::
  *
- *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
- *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
+ *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
- *    beginning of the context restore::
+ * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
+ * **This configuration will cause device probe failure on all current
+ * platforms, but may be allowed on igpu platforms in the future**::
  *
- *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
- *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
-
- * #. Load certain values in a couple of registers (it can be used as a simpler
- *    alternative to the `cmd`) action::
+ *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
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
@@ -252,18 +267,6 @@
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
  * Remove devices
  * ==============
  *
@@ -282,14 +285,19 @@ struct xe_config_group_device {
 	struct config_group group;
 	struct config_group sriov;
 
+	/*
+	 * Fields sorted by type (largest first) then name: struct arrays,
+	 * u64, u32/unsigned int, u8, bool, sub-structs last. Within each
+	 * type, entries are sorted alphabetically.
+	 */
 	struct xe_config_device {
-		u64 gt_types_allowed;
-		u64 engines_allowed;
-		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
+		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
+		u64 engines_allowed;
+		u64 gt_types_allowed;
 		u8 survivability_mode;
-		bool enable_psmi;
 		bool enable_multi_queue;
+		bool enable_psmi;
 		bool enable_vram_page_offline;
 		struct {
 			unsigned int max_vfs;
@@ -306,11 +314,11 @@ struct xe_config_group_device {
 };
 
 static const struct xe_config_device device_defaults = {
-	.gt_types_allowed = U64_MAX,
 	.engines_allowed = U64_MAX,
+	.gt_types_allowed = U64_MAX,
 	.survivability_mode = 0,
-	.enable_psmi = false,
 	.enable_multi_queue = true,
+	.enable_psmi = false,
 	.enable_vram_page_offline = true,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
@@ -388,86 +396,347 @@ static bool is_bound(struct xe_config_group_device *dev)
 	return ret;
 }
 
-static ssize_t survivability_mode_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = to_xe_config_device(item);
-
-	return sprintf(page, "%u\n", dev->survivability_mode);
-}
+static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev);
 
-static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
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
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	u8 survivability_mode;
-	int ret;
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	ssize_t len;
 
-	ret = kstrtou8(page, 0, &survivability_mode);
-	if (ret)
-		return ret;
+	if (!dev)
+		return 0;
 
-	if (survivability_mode & ~XE_CONFIGFS_SURVIVABILITY_MASK)
-		return -EINVAL;
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
 
-	guard(mutex)(&dev->lock);
-	if (is_bound(dev))
-		return -EBUSY;
+	return len;
+}
 
-	dev->config.survivability_mode = survivability_mode;
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
 
 	return len;
 }
 
-static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
+static bool wa_bb_read_advance(bool dereference, char **p,
+			       const char *append, size_t len,
+			       size_t *max_size)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
-	char *p = page;
+	if (dereference) {
+		if (len >= *max_size)
+			return false;
+		*max_size -= len;
+		if (append)
+			memcpy(*p, append, len);
+	}
 
-	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
-		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
-			p += sprintf(p, "%s\n", gt_types[i].name);
+	*p += len;
 
-	return p - page;
+	return true;
 }
 
-static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
-				      size_t len)
+static ssize_t wa_bb_show(struct xe_config_group_device *dev,
+			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
+			  char *data, size_t sz)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
-	char *p = buf;
-	u64 typemask = 0;
+	char *p = data;
 
-	if (!buf)
-		return -ENOMEM;
+	guard(mutex)(&dev->lock);
 
-	while (p) {
-		char *typename = strsep(&p, ",\n");
-		bool matched = false;
+	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		enum xe_engine_class ec = engine_info[i].engine_class;
+		size_t len;
 
-		if (typename[0] == '\0')
+		if (!wa_bb[ec].len)
 			continue;
 
-		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
-			if (strcmp(typename, gt_types[i].name) == 0) {
-				typemask |= BIT(gt_types[i].type);
-				matched = true;
-				break;
-			}
+		len = snprintf(p, sz, "%s:", engine_info[i].cls);
+		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
+			return -ENOBUFS;
+
+		for (size_t j = 0; j < wa_bb[ec].len; j++) {
+			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);
+			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
+				return -ENOBUFS;
 		}
 
-		if (!matched)
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
+		return -EINVAL;
+
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
 			return -EINVAL;
+		}
 	}
 
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
 
-	dev->config.gt_types_allowed = typemask;
+	/*
+	 * 2. Allocate a u32 array and set the pointers to the right positions
+	 * according to the length of each class' wa_bb
+	 */
+	tmp = krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	if (!count) {
+		memset(wa_bb, 0, sizeof(tmp_wa_bb));
+		return len;
+	}
+
+	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
+		tmp_wa_bb[class].cs = tmp + count;
+		count += tmp_wa_bb[class].len;
+		tmp_wa_bb[class].len = 0;
+	}
+
+	/* 3. Parse wa_bb lines again, this time saving the values */
+	count = parse_wa_bb_lines(page, tmp_wa_bb);
+	if (count < 0)
+		return count;
+
+	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
 
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
+static ssize_t ctx_restore_post_bb_store(struct config_item *item,
+					 const char *data, size_t sz)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
+}
+
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
+
+	if (!dev)
+		return device_defaults.engines_allowed;
+
+	scoped_guard(mutex, &dev->lock)
+		engines_allowed = dev->config.engines_allowed;
+	config_group_put(&dev->group);
+
+	return engines_allowed;
+}
+
 static ssize_t engines_allowed_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -583,343 +852,308 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	return len;
 }
 
-static ssize_t enable_psmi_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = to_xe_config_device(item);
-
-	return sprintf(page, "%d\n", dev->enable_psmi);
-}
-
-static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
+static u64 get_gt_types_allowed(struct pci_dev *pdev)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	bool val;
-	int ret;
-
-	ret = kstrtobool(page, &val);
-	if (ret)
-		return ret;
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u64 mask;
 
-	guard(mutex)(&dev->lock);
-	if (is_bound(dev))
-		return -EBUSY;
+	if (!dev)
+		return device_defaults.gt_types_allowed;
 
-	dev->config.enable_psmi = val;
+	scoped_guard(mutex, &dev->lock)
+		mask = dev->config.gt_types_allowed;
+	config_group_put(&dev->group);
 
-	return len;
+	return mask;
 }
 
-static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
+/**
+ * xe_configfs_primary_gt_allowed - determine whether primary GTs are supported
+ * @pdev: pci device
+ *
+ * Return: True if primary GTs are enabled, false if they have been disabled via
+ *     configfs.
+ */
+bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
-
-	return sprintf(page, "%d\n", dev->enable_multi_queue);
+	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MAIN);
 }
 
-static ssize_t enable_multi_queue_store(struct config_item *item, const char *page,
-					size_t len)
+/**
+ * xe_configfs_media_gt_allowed - determine whether media GTs are supported
+ * @pdev: pci device
+ *
+ * Return: True if the media GTs are enabled, false if they have been disabled
+ *     via configfs.
+ */
+bool xe_configfs_media_gt_allowed(struct pci_dev *pdev)
 {
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
-	dev->config.enable_multi_queue = val;
-
-	return len;
+	return get_gt_types_allowed(pdev) & BIT_ULL(XE_GT_TYPE_MEDIA);
 }
 
-static ssize_t enable_vram_page_offline_show(struct config_item *item, char *page)
+static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
+	char *p = page;
 
-	return sprintf(page, "%s\n", str_yes_no(dev->enable_vram_page_offline));
+	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
+		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
+			p += sprintf(p, "%s\n", gt_types[i].name);
+
+	return p - page;
 }
 
-static ssize_t enable_vram_page_offline_store(struct config_item *item,
-					      const char *page, size_t len)
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
 
-	dev->config.enable_vram_page_offline = val;
+	dev->config.gt_types_allowed = typemask;
 
 	return len;
 }
 
-static bool wa_bb_read_advance(bool dereference, char **p,
-			       const char *append, size_t len,
-			       size_t *max_size)
+/**
+ * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
+ * @pdev: pci device
+ *
+ * Return: survivability_mode attribute in configfs
+ */
+u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 {
-	if (dereference) {
-		if (len >= *max_size)
-			return false;
-		*max_size -= len;
-		if (append)
-			memcpy(*p, append, len);
-	}
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u8 mode;
 
-	*p += len;
+	if (!dev)
+		return device_defaults.survivability_mode;
 
-	return true;
+	scoped_guard(mutex, &dev->lock)
+		mode = dev->config.survivability_mode;
+	config_group_put(&dev->group);
+
+	return mode;
 }
 
-static ssize_t wa_bb_show(struct xe_config_group_device *dev,
-			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
-			  char *data, size_t sz)
+static ssize_t survivability_mode_show(struct config_item *item, char *page)
 {
-	char *p = data;
-
-	guard(mutex)(&dev->lock);
-
-	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
-		enum xe_engine_class ec = engine_info[i].engine_class;
-		size_t len;
+	struct xe_config_device *dev = to_xe_config_device(item);
 
-		if (!wa_bb[ec].len)
-			continue;
+	return sprintf(page, "%u\n", dev->survivability_mode);
+}
 
-		len = snprintf(p, sz, "%s:", engine_info[i].cls);
-		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
-			return -ENOBUFS;
+static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	u8 survivability_mode;
+	int ret;
 
-		for (size_t j = 0; j < wa_bb[ec].len; j++) {
-			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);
-			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
-				return -ENOBUFS;
-		}
+	ret = kstrtou8(page, 0, &survivability_mode);
+	if (ret)
+		return ret;
 
-		if (!wa_bb_read_advance(data, &p, "\n", 1, &sz))
-			return -ENOBUFS;
-	}
+	if (survivability_mode & ~XE_CONFIGFS_SURVIVABILITY_MASK)
+		return -EINVAL;
 
-	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
-		return -ENOBUFS;
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
 
-	/* Reserve one more to match check for '\0' */
-	if (!data)
-		p++;
+	dev->config.survivability_mode = survivability_mode;
 
-	return p - data;
+	return len;
 }
 
-static ssize_t ctx_restore_mid_bb_show(struct config_item *item, char *page)
+/**
+ * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
+ * @pdev: pci device
+ *
+ * Return: true if multi-queue is enabled for this device (the default),
+ * false if it has been force-disabled via configfs.
+ */
+bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
 
-	return wa_bb_show(dev, dev->config.ctx_restore_mid_bb, page, SZ_4K);
-}
+	if (!dev)
+		return true;
 
-static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
-{
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_multi_queue;
+	config_group_put(&dev->group);
 
-	return wa_bb_show(dev, dev->config.ctx_restore_post_bb, page, SZ_4K);
+	return ret;
 }
 
-static void wa_bb_append(struct wa_bb *wa_bb, u32 val)
+static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
 {
-	if (wa_bb->cs)
-		wa_bb->cs[wa_bb->len] = val;
+	struct xe_config_device *dev = to_xe_config_device(item);
 
-	wa_bb->len++;
+	return sprintf(page, "%d\n", dev->enable_multi_queue);
 }
 
-static ssize_t parse_hex(const char *line, u32 *pval)
+static ssize_t enable_multi_queue_store(struct config_item *item, const char *page,
+					size_t len)
 {
-	char numstr[12];
-	const char *p;
-	ssize_t numlen;
-
-	p = line + strspn(line, " \t");
-	if (!*p || *p == '\n')
-		return 0;
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
 
-	numlen = strcspn(p, " \t\n");
-	if (!numlen || numlen >= sizeof(numstr) - 1)
-		return -EINVAL;
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
 
-	memcpy(numstr, p, numlen);
-	numstr[numlen] = '\0';
-	p += numlen;
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
 
-	if (kstrtou32(numstr, 16, pval))
-		return -EINVAL;
+	dev->config.enable_multi_queue = val;
 
-	return p - line;
+	return len;
 }
 
-/*
- * Parse lines with the format
- *
- *	<engine-class> cmd <u32> <u32...>
- *	<engine-class> reg <u32_addr> <u32_val>
- *
- * and optionally save them in @wa_bb[i].cs is non-NULL.
+/**
+ * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
+ * @pdev: pci device
  *
- * Return the number of dwords parsed.
+ * Return: enable_psmi setting in configfs
  */
-static ssize_t parse_wa_bb_lines(const char *lines,
-				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
+bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 {
-	ssize_t dwords = 0, ret;
-	const char *p;
-
-	/*
-	 * Each iteration consumes at least the engine class token if it doesn't
-	 * error out, so the loop always makes progress without advancing @p.
-	 */
-	for (p = lines; *p;) {
-		const struct engine_info *info = NULL;
-		u32 val, val2;
-
-		/* Also allow empty lines */
-		p += strspn(p, " \t\n");
-		if (!*p)
-			break;
-
-		ret = parse_engine(p, " \t\n", NULL, &info);
-		if (ret < 0)
-			return ret;
-
-		p += ret;
-		p += strspn(p, " \t");
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
 
-		if (str_has_prefix(p, "cmd")) {
-			for (p += strlen("cmd"); *p;) {
-				ret = parse_hex(p, &val);
-				if (ret < 0)
-					return -EINVAL;
-				if (!ret)
-					break;
+	if (!dev)
+		return false;
 
-				p += ret;
-				dwords++;
-				wa_bb_append(&wa_bb[info->engine_class], val);
-			}
-		} else if (str_has_prefix(p, "reg")) {
-			p += strlen("reg");
-			ret = parse_hex(p, &val);
-			if (ret <= 0)
-				return -EINVAL;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_psmi;
+	config_group_put(&dev->group);
 
-			p += ret;
-			ret = parse_hex(p, &val2);
-			if (ret <= 0)
-				return -EINVAL;
+	return ret;
+}
 
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
+static ssize_t enable_psmi_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
 
-	return dwords;
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
-CONFIGFS_ATTR(, enable_psmi);
-CONFIGFS_ATTR(, enable_vram_page_offline);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
+CONFIGFS_ATTR(, enable_multi_queue);
+CONFIGFS_ATTR(, enable_psmi);
+CONFIGFS_ATTR(, enable_vram_page_offline);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
-	&attr_enable_multi_queue,
-	&attr_enable_psmi,
-	&attr_enable_vram_page_offline,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
+	&attr_enable_multi_queue,
+	&attr_enable_psmi,
+	&attr_enable_vram_page_offline,
 	NULL,
 };
 
@@ -1196,12 +1430,12 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 				 dev->config.attr_); \
 	} while (0)
 
-	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
+	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
+	PRI_CUSTOM_ATTR("%u", survivability_mode);
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", enable_vram_page_offline);
-	PRI_CUSTOM_ATTR("%u", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1230,227 +1464,6 @@ void xe_configfs_check_device(struct pci_dev *pdev)
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
index 19b0bb596f5d..deae0ebf3c2b 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -26,19 +26,19 @@ struct pci_dev;
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev);
-bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
-bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
-u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
-bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
-bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
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
+u8 xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
+bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
-- 
2.43.0

