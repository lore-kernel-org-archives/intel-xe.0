Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D16C5ACD1
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 19:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C105910F5A2;
	Fri,  7 Aug 2026 19:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uj7YPDMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415A210E24A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 19:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786131921; x=1817667921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q4uxpOArWJciLlSW3Gm3YegOrz3GNssQLzDUxthuR64=;
 b=Uj7YPDMcVD38wTuSSqYLlbpVYPa/GrEih/3epOgJFdOG9naAIAs6xC3Q
 AkAYxnirjMwwFRUtj3GfC987yzzYb5nENgM6bg+KAs0NX4U82SfjZwDDs
 bM5K35WBl4iOb7gwnhnd6lbj/Ulj8EPIfYvRuV0K4k4sqasqE1j21N0L9
 iwScWzuK9JzTPSZHcHt4Nw7wnyCTv9V7NOnNYC4WnBkgfsXWpzKS6dIo1
 HvJdu8r4qv2g78joX6MFl21anzBT0oU4iLidlzVUiBCq46Y98xOdoYyuC
 NOHxW+DTi88kiiYdEWBxgp048D9uNyOpwwAYvuHm9gWjNJ8IcbV1XvXjS A==;
X-CSE-ConnectionGUID: zzDJ2UyVSreujyUZwP2XGA==
X-CSE-MsgGUID: TBAzcSEVSQ60r3o1QhxBNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86758821"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86758821"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 12:45:21 -0700
X-CSE-ConnectionGUID: S1T5ctG7TZm/aMY/F+YZEQ==
X-CSE-MsgGUID: Aho9oyyfSDauel5lwGLLsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258174088"
Received: from dut4475arls.fm.intel.com ([10.105.10.116])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 12:45:20 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 02/10] drm/xe: Sort xe_config_device fields
Date: Fri,  7 Aug 2026 19:45:19 +0000
Message-ID: <20260807194518.9474-14-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807194518.9474-12-stuart.summers@intel.com>
References: <20260807194518.9474-12-stuart.summers@intel.com>
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

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 1092 +++++++++++++++---------------
 drivers/gpu/drm/xe/xe_configfs.h |   24 +-
 2 files changed, 564 insertions(+), 552 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 0a85043a9dd0..cb6ab1fcb8c1 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -58,10 +58,11 @@
  *	│   └── ...
  *	:
  *	└── 0000:03:00.0
- *	    ├── survivability_mode
- *	    ├── gt_types_allowed
  *	    ├── engines_allowed
- *	    └── enable_psmi
+ *	    ├── gt_types_allowed
+ *	    ├── enable_multi_queue
+ *	    ├── enable_psmi
+ *	    └── survivability_mode
  *
  * After configuring the attributes as per next section, the device can be
  * probed with::
@@ -73,13 +74,82 @@
  * Configure Attributes
  * ====================
  *
- * Survivability mode:
- * -------------------
+
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
- *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
+ * The syntax allows to pass straight instructions to be executed by the engine
+ * in a batch buffer or set specific registers.
+ *
+ * #. Generic instruction::
+ *
+ *	<engine-class> cmd <instr> [[dword0] [dword1] [...]]
+ *
+ * #. Simple register setting::
+ *
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
+ * Allowed engines:
+ * ----------------
+ *
+ * Allow only a set of engine(s) to be available, disabling the other engines
+ * even if they are available in hardware. This is applied after HW fuses are
+ * considered on each tile. Examples:
+ *
+ * Allow only one render and one copy engines, nothing else::
+ *
+ *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
+ *
+ * Allow only compute engines and first copy engine::
+ *
+ *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
+ *
+ * Note that the engine names are the per-GT hardware names. On multi-tile
+ * platforms, writing ``rcs0,bcs0`` to this file would allow the first render
+ * and copy engines on each tile.
+ *
+ * The requested configuration may not be supported by the platform and driver
+ * may fail to probe. For example: if at least one copy engine is expected to be
+ * available for migrations, but it's disabled. This is intended for debugging
+ * purposes only.
  *
  * This attribute can only be set before binding to the device.
  *
@@ -121,29 +191,15 @@
  *
  *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
  *
- * Allowed engines:
- * ----------------
- *
- * Allow only a set of engine(s) to be available, disabling the other engines
- * even if they are available in hardware. This is applied after HW fuses are
- * considered on each tile. Examples:
- *
- * Allow only one render and one copy engines, nothing else::
- *
- *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
- *
- * Allow only compute engines and first copy engine::
- *
- *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
+ * Enable multi-queue
+ * ------------------
  *
- * Note that the engine names are the per-GT hardware names. On multi-tile
- * platforms, writing ``rcs0,bcs0`` to this file would allow the first render
- * and copy engines on each tile.
+ * Multi-queue support on the device is enabled by default where the
+ * hardware supports it. Writing 0 force-disables multi-queue support:
+ * multi-queue exec-queue group creation via ioctl is refused, and the
+ * GuC feature is disabled::
  *
- * The requested configuration may not be supported by the platform and driver
- * may fail to probe. For example: if at least one copy engine is expected to be
- * available for migrations, but it's disabled. This is intended for debugging
- * purposes only.
+ *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_multi_queue
  *
  * This attribute can only be set before binding to the device.
  *
@@ -159,57 +215,15 @@
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
- *
- * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 after the
- *    normal context restore::
- *
- *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
- *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
- *
- * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
- *    beginning of the context restore::
- *
- *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
- *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_mid_bb
-
- * #. Load certain values in a couple of registers (it can be used as a simpler
- *    alternative to the `cmd`) action::
- *
- *	# cat > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb <<EOF
- *	rcs reg 4F100 DEADBEEF
- *	rcs reg 4F104 FFFFFFFF
- *	EOF
+ * Survivability mode:
+ * -------------------
  *
- *    .. note::
+ * Enable survivability mode on supported cards. This setting only takes
+ * effect when probing the device. Example to enable it::
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
@@ -237,18 +251,6 @@
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
@@ -267,14 +269,19 @@ struct xe_config_group_device {
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
-		bool survivability_mode;
-		bool enable_psmi;
+		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
+		u64 engines_allowed;
+		u64 gt_types_allowed;
 		bool enable_multi_queue;
+		bool enable_psmi;
+		bool survivability_mode;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -290,11 +297,11 @@ struct xe_config_group_device {
 };
 
 static const struct xe_config_device device_defaults = {
-	.gt_types_allowed = U64_MAX,
 	.engines_allowed = U64_MAX,
-	.survivability_mode = false,
-	.enable_psmi = false,
+	.gt_types_allowed = U64_MAX,
 	.enable_multi_queue = true,
+	.enable_psmi = false,
+	.survivability_mode = false,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -371,247 +378,60 @@ static bool is_bound(struct xe_config_group_device *dev)
 	return ret;
 }
 
-static ssize_t survivability_mode_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = to_xe_config_device(item);
-
-	return sprintf(page, "%d\n", dev->survivability_mode);
-}
+static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev *pdev);
 
-static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
+/**
+ * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
+ * @pdev: pci device
+ * @class: hw engine class
+ * @cs: pointer to the bb to use - only valid during probe
+ *
+ * Return: Number of dwords used in the mid_ctx_restore setting in configfs
+ */
+u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+				       enum xe_engine_class class,
+				       const u32 **cs)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	bool survivability_mode;
-	int ret;
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u32 len;
 
-	ret = kstrtobool(page, &survivability_mode);
-	if (ret)
-		return ret;
+	if (!dev)
+		return 0;
 
-	guard(mutex)(&dev->lock);
-	if (is_bound(dev))
-		return -EBUSY;
+	scoped_guard(mutex, &dev->lock) {
+		if (cs)
+			*cs = dev->config.ctx_restore_mid_bb[class].cs;
 
-	dev->config.survivability_mode = survivability_mode;
+		len = dev->config.ctx_restore_mid_bb[class].len;
+	}
+	config_group_put(&dev->group);
 
 	return len;
 }
 
-static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
+/**
+ * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
+ * @pdev: pci device
+ * @class: hw engine class
+ * @cs: pointer to the bb to use - only valid during probe
+ *
+ * Return: Number of dwords used in the post_ctx_restore setting in configfs
+ */
+u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+					enum xe_engine_class class,
+					const u32 **cs)
 {
-	struct xe_config_device *dev = to_xe_config_device(item);
-	char *p = page;
-
-	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
-		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
-			p += sprintf(p, "%s\n", gt_types[i].name);
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u32 len;
 
-	return p - page;
-}
+	if (!dev)
+		return 0;
 
-static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
-				      size_t len)
-{
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
-	char *p = buf;
-	u64 typemask = 0;
-
-	if (!buf)
-		return -ENOMEM;
-
-	while (p) {
-		char *typename = strsep(&p, ",\n");
-		bool matched = false;
-
-		if (typename[0] == '\0')
-			continue;
-
-		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
-			if (strcmp(typename, gt_types[i].name) == 0) {
-				typemask |= BIT(gt_types[i].type);
-				matched = true;
-				break;
-			}
-		}
-
-		if (!matched)
-			return -EINVAL;
-	}
-
-	guard(mutex)(&dev->lock);
-	if (is_bound(dev))
-		return -EBUSY;
-
-	dev->config.gt_types_allowed = typemask;
-
-	return len;
-}
-
-static ssize_t engines_allowed_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = to_xe_config_device(item);
-	char *p = page;
-
-	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
-		u64 mask = engine_info[i].mask;
-
-		if ((dev->engines_allowed & mask) == mask) {
-			p += sprintf(p, "%s*\n", engine_info[i].cls);
-		} else if (mask & dev->engines_allowed) {
-			u16 bit0 = __ffs64(mask), bit;
-
-			mask &= dev->engines_allowed;
-
-			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
-				p += sprintf(p, "%s%u\n", engine_info[i].cls,
-					     bit - bit0);
-		}
-	}
-
-	return p - page;
-}
-
-/*
- * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
- * instance in @pattern.
- *
- * Examples of inputs:
- * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
- *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
- * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
- *   mask == XE_HW_ENGINE_RCS_MASK
- * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
- */
-static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
-{
-	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
-		u8 instance;
-		u16 bit;
-
-		if (!str_has_prefix(pattern, engine_info[i].cls))
-			continue;
-
-		pattern += strlen(engine_info[i].cls);
-		if (!mask)
-			return *pattern ? NULL : &engine_info[i];
-
-		if (!strcmp(pattern, "*")) {
-			*mask = engine_info[i].mask;
-			return &engine_info[i];
-		}
-
-		if (kstrtou8(pattern, 10, &instance))
-			return NULL;
-
-		bit = __ffs64(engine_info[i].mask) + instance;
-		if (bit >= fls64(engine_info[i].mask))
-			return NULL;
-
-		*mask = BIT_ULL(bit);
-		return &engine_info[i];
-	}
-
-	return NULL;
-}
-
-static int parse_engine(const char *s, const char *end_chars, u64 *mask,
-			const struct engine_info **pinfo)
-{
-	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
-	const struct engine_info *info;
-	size_t len;
-
-	len = strcspn(s, end_chars);
-	if (len >= sizeof(buf))
-		return -EINVAL;
-
-	memcpy(buf, s, len);
-	buf[len] = '\0';
-
-	info = lookup_engine_info(buf, mask);
-	if (!info)
-		return -ENOENT;
-
-	if (pinfo)
-		*pinfo = info;
-
-	return len;
-}
-
-static ssize_t engines_allowed_store(struct config_item *item, const char *page,
-				     size_t len)
-{
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
-	ssize_t patternlen, p;
-	u64 mask, val = 0;
-
-	for (p = 0; p < len; p += patternlen + 1) {
-		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
-		if (patternlen < 0)
-			return -EINVAL;
-
-		val |= mask;
+	scoped_guard(mutex, &dev->lock) {
+		*cs = dev->config.ctx_restore_post_bb[class].cs;
+		len = dev->config.ctx_restore_post_bb[class].len;
 	}
-
-	guard(mutex)(&dev->lock);
-	if (is_bound(dev))
-		return -EBUSY;
-
-	dev->config.engines_allowed = val;
-
-	return len;
-}
-
-static ssize_t enable_psmi_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = to_xe_config_device(item);
-
-	return sprintf(page, "%d\n", dev->enable_psmi);
-}
-
-static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
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
-	dev->config.enable_psmi = val;
-
-	return len;
-}
-
-static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = to_xe_config_device(item);
-
-	return sprintf(page, "%d\n", dev->enable_multi_queue);
-}
-
-static ssize_t enable_multi_queue_store(struct config_item *item, const char *page,
-					size_t len)
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
-	dev->config.enable_multi_queue = val;
+	config_group_put(&dev->group);
 
 	return len;
 }
@@ -718,6 +538,9 @@ static ssize_t parse_hex(const char *line, u32 *pval)
 	return p - line;
 }
 
+static int parse_engine(const char *s, const char *end_chars, u64 *mask,
+			const struct engine_info **pinfo);
+
 /*
  * Parse lines with the format
  *
@@ -802,70 +625,439 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
 		return count;
 
 	guard(mutex)(&dev->lock);
-
+
+	if (is_bound(dev))
+		return -EBUSY;
+
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
+
+	return len;
+}
+
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
+static ssize_t engines_allowed_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	char *p = page;
+
+	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		u64 mask = engine_info[i].mask;
+
+		if ((dev->engines_allowed & mask) == mask) {
+			p += sprintf(p, "%s*\n", engine_info[i].cls);
+		} else if (mask & dev->engines_allowed) {
+			u16 bit0 = __ffs64(mask), bit;
+
+			mask &= dev->engines_allowed;
+
+			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
+				p += sprintf(p, "%s%u\n", engine_info[i].cls,
+					     bit - bit0);
+		}
+	}
+
+	return p - page;
+}
+
+/*
+ * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
+ * instance in @pattern.
+ *
+ * Examples of inputs:
+ * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
+ *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
+ * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
+ *   mask == XE_HW_ENGINE_RCS_MASK
+ * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
+ */
+static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
+{
+	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		u8 instance;
+		u16 bit;
+
+		if (!str_has_prefix(pattern, engine_info[i].cls))
+			continue;
+
+		pattern += strlen(engine_info[i].cls);
+		if (!mask)
+			return *pattern ? NULL : &engine_info[i];
+
+		if (!strcmp(pattern, "*")) {
+			*mask = engine_info[i].mask;
+			return &engine_info[i];
+		}
+
+		if (kstrtou8(pattern, 10, &instance))
+			return NULL;
+
+		bit = __ffs64(engine_info[i].mask) + instance;
+		if (bit >= fls64(engine_info[i].mask))
+			return NULL;
+
+		*mask = BIT_ULL(bit);
+		return &engine_info[i];
+	}
+
+	return NULL;
+}
+
+static int parse_engine(const char *s, const char *end_chars, u64 *mask,
+			const struct engine_info **pinfo)
+{
+	char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
+	const struct engine_info *info;
+	size_t len;
+
+	len = strcspn(s, end_chars);
+	if (len >= sizeof(buf))
+		return -EINVAL;
+
+	memcpy(buf, s, len);
+	buf[len] = '\0';
+
+	info = lookup_engine_info(buf, mask);
+	if (!info)
+		return -ENOENT;
+
+	if (pinfo)
+		*pinfo = info;
+
+	return len;
+}
+
+static ssize_t engines_allowed_store(struct config_item *item, const char *page,
+				     size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	ssize_t patternlen, p;
+	u64 mask, val = 0;
+
+	for (p = 0; p < len; p += patternlen + 1) {
+		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
+		if (patternlen < 0)
+			return -EINVAL;
+
+		val |= mask;
+	}
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.engines_allowed = val;
+
+	return len;
+}
+
+static u64 get_gt_types_allowed(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u64 mask;
+
+	if (!dev)
+		return device_defaults.gt_types_allowed;
+
+	scoped_guard(mutex, &dev->lock)
+		mask = dev->config.gt_types_allowed;
+	config_group_put(&dev->group);
+
+	return mask;
+}
+
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
+
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
+}
+
+static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	char *p = page;
+
+	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
+		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
+			p += sprintf(p, "%s\n", gt_types[i].name);
+
+	return p - page;
+}
+
+static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
+				      size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
+	char *p = buf;
+	u64 typemask = 0;
+
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
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.gt_types_allowed = typemask;
+
+	return len;
+}
+
+/**
+ * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
+ * @pdev: pci device
+ *
+ * Return: true if multi-queue is enabled for this device (the default),
+ * false if it has been force-disabled via configfs.
+ */
+bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
+
+	if (!dev)
+		return true;
+
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_multi_queue;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
+static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->enable_multi_queue);
+}
+
+static ssize_t enable_multi_queue_store(struct config_item *item, const char *page,
+					size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.enable_multi_queue = val;
+
+	return len;
+}
+
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
+
+	if (!dev)
+		return false;
+
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_psmi;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
+static ssize_t enable_psmi_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->enable_psmi);
+}
+
+static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
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
+ * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
+ * @pdev: pci device
+ *
+ * Return: survivability_mode attribute in configfs
+ */
+bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool mode;
 
-	/* 3. Parse wa_bb lines again, this time saving the values */
-	count = parse_wa_bb_lines(page, tmp_wa_bb);
-	if (count < 0)
-		return count;
+	if (!dev)
+		return device_defaults.survivability_mode;
 
-	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
+	scoped_guard(mutex, &dev->lock)
+		mode = dev->config.survivability_mode;
+	config_group_put(&dev->group);
 
-	return len;
+	return mode;
 }
 
-static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
-					const char *data, size_t sz)
+static ssize_t survivability_mode_show(struct config_item *item, char *page)
 {
-	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	struct xe_config_device *dev = to_xe_config_device(item);
 
-	return wa_bb_store(dev->config.ctx_restore_mid_bb, dev, data, sz);
+	return sprintf(page, "%d\n", dev->survivability_mode);
 }
 
-static ssize_t ctx_restore_post_bb_store(struct config_item *item,
-					 const char *data, size_t sz)
+static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool survivability_mode;
+	int ret;
 
-	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
+	ret = kstrtobool(page, &survivability_mode);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.survivability_mode = survivability_mode;
+
+	return len;
 }
 
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
-CONFIGFS_ATTR(, enable_multi_queue);
-CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
+CONFIGFS_ATTR(, enable_multi_queue);
+CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
-	&attr_enable_multi_queue,
-	&attr_enable_psmi,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
+	&attr_enable_multi_queue,
+	&attr_enable_psmi,
 	&attr_survivability_mode,
 	NULL,
 };
@@ -1138,8 +1330,8 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 				 dev->config.attr_); \
 	} while (0)
 
-	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
+	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
@@ -1171,186 +1363,6 @@ void xe_configfs_check_device(struct pci_dev *pdev)
 	config_group_put(&dev->group);
 }
 
-/**
- * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
- * @pdev: pci device
- *
- * Return: survivability_mode attribute in configfs
- */
-bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	bool mode;
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
- * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
- * @pdev: pci device
- * @class: hw engine class
- * @cs: pointer to the bb to use - only valid during probe
- *
- * Return: Number of dwords used in the mid_ctx_restore setting in configfs
- */
-u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
-				       enum xe_engine_class class,
-				       const u32 **cs)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	u32 len;
-
-	if (!dev)
-		return 0;
-
-	scoped_guard(mutex, &dev->lock) {
-		if (cs)
-			*cs = dev->config.ctx_restore_mid_bb[class].cs;
-
-		len = dev->config.ctx_restore_mid_bb[class].len;
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
- * @cs: pointer to the bb to use - only valid during probe
- *
- * Return: Number of dwords used in the post_ctx_restore setting in configfs
- */
-u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
-					enum xe_engine_class class,
-					const u32 **cs)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	u32 len;
-
-	if (!dev)
-		return 0;
-
-	scoped_guard(mutex, &dev->lock) {
-		*cs = dev->config.ctx_restore_post_bb[class].cs;
-		len = dev->config.ctx_restore_post_bb[class].len;
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
index 4fbbeafba473..bba592fb612c 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -18,18 +18,18 @@ struct pci_dev;
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
-bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
-bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
-u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
-bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
-bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
 u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 					enum xe_engine_class class,
 					const u32 **cs);
+u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
+bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
+bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
+bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
+bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
@@ -38,18 +38,18 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
-static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
-static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
-static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
-static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
-static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
-static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
 static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 						      enum xe_engine_class class,
 						      const u32 **cs) { return 0; }
+static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
+static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
+static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
+static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
+static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 #ifdef CONFIG_PCI_IOV
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
 {
-- 
2.43.0

