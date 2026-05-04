Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D51FFF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AC410E36A;
	Mon,  4 May 2026 04:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ymsqo6b6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0BC10E366
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869833; x=1809405833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3h0R187CtwcY2LFbz/809NoqbBhLypozthDEx3lKIK0=;
 b=Ymsqo6b6XOdtx0LfpFTMsTapXj3R2QjhN2DNMKcNPdjMAr3sCiV7FCjh
 Menwhq7m0ZnykOn73s+H+v32Jf6n2F8+8ldu7+w/biVgJmoiXFToSNBJy
 8UasPzr4PZWAPHTcbnKNQSeF4nBCZyVV+ktSN8NZmE2I63sZsHZDh0sNE
 b70S15SHv3logo7WZBCTtZFYpzcQBjUCbz1rwZSel1tnYZ7fqBdZsnuJS
 LsBwCQOSNR1VLOFvP//uyAYPJj0WPcRHoy3DiDWmSbpmG7IHwxbcQwKTn
 FZqHOneUOpuiw7BvJNj0bgwougsqwprqaC68U4MSS9nDlGXjX/tJZCrjv w==;
X-CSE-ConnectionGUID: Xw21DaGtR/KXwYhi5nvW4Q==
X-CSE-MsgGUID: ZnuIOjGDRVqEEx4sTWpMOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96293560"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96293560"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:52 -0700
X-CSE-ConnectionGUID: Rn9aL0O4R/uH4qm/4O0MUw==
X-CSE-MsgGUID: JFiZ839PTrmUc+UORHRiLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="232773675"
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
Subject: [PATCH 5/9] drm/xe: Move debug configfs entries to xe_configfs_debug.c
Date: Mon,  4 May 2026 04:43:42 +0000
Message-ID: <20260504044348.209625-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504044348.209625-1-stuart.summers@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
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

Move the debug specific configfs attributes into the new
xe_configfs_debug.c file under a new debug configfs subdirectory.
Ensure these are wrapped in CONFIG_DRM_XE_DEBUG to allow finer grained
debug changes outside of more ABI specific configfs entries.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-4.7
---
 drivers/gpu/drm/xe/xe_configfs.c           | 889 ++-------------------
 drivers/gpu/drm/xe/xe_configfs.h           |  23 -
 drivers/gpu/drm/xe/xe_configfs_debug.c     | 861 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs_debug.h     |  36 +
 drivers/gpu/drm/xe/xe_configfs_types.h     |  19 +-
 drivers/gpu/drm/xe/xe_guc.c                |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.c          |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                |   1 +
 drivers/gpu/drm/xe/xe_pci.c                |   1 +
 drivers/gpu/drm/xe/xe_psmi.c               |   1 +
 drivers/gpu/drm/xe/xe_rtp.c                |   1 +
 drivers/gpu/drm/xe/xe_survivability_mode.c |   1 +
 12 files changed, 970 insertions(+), 865 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 85df8ce5cf2a..89e163ce56aa 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -6,13 +6,11 @@
 #include <linux/bitops.h>
 #include <linux/configfs.h>
 #include <linux/cleanup.h>
-#include <linux/find.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/string.h>
 
-#include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
 #include "xe_configfs_types.h"
 #include "xe_defaults.h"
@@ -50,15 +48,11 @@
  *
  *	/sys/kernel/config/xe/
  *	├── 0000:00:02.0
- *	│   └── ...
- *	├── 0000:00:02.1
- *	│   └── ...
- *	:
- *	└── 0000:03:00.0
- *	    ├── enable_survivability_mode
- *	    ├── gt_types_allowed
- *	    ├── engines_allowed
- *	    └── enable_psmi
+ *	│   └── sriov/
+ *	│       ├── admin_only_pf
+ *	│       └── max_vfs
+ *	└── 0000:00:02.1
+ *	    └── ...
  *
  * After configuring the attributes as per next section, the device can be
  * probed with::
@@ -70,144 +64,6 @@
  * Configure Attributes
  * ====================
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
- *
- *    .. note::
- *
- *       When using multiple lines, make sure to use a command that is
- *       implemented with a single write syscall, like HEREDOC.
- *
- * Currently this is implemented only for post and mid context restore and
- * these attributes can only be set before binding to the device.
- *
- * PSMI
- * ----
- *
- * Enable extra debugging capabilities to trace engine execution. Only useful
- * during early platform enabling and requires additional hardware connected.
- * Once it's enabled, additionals WAs are added and runtime configuration is
- * done via debugfs. Example to enable it::
- *
- *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
- *
- * This attribute can only be set before binding to the device.
- *
- * Survivability mode:
- * -------------------
- *
- * Enable survivability mode on supported cards. This setting only takes
- * effect when probing the device. Example to enable it::
- *
- *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_survivability_mode
- *
- * This attribute can only be set before binding to the device.
- *
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
- *
- * Note that the engine names are the per-GT hardware names. On multi-tile
- * platforms, writing ``rcs0,bcs0`` to this file would allow the first render
- * and copy engines on each tile.
- *
- * The requested configuration may not be supported by the platform and driver
- * may fail to probe. For example: if at least one copy engine is expected to be
- * available for migrations, but it's disabled. This is intended for debugging
- * purposes only.
- *
- * This attribute can only be set before binding to the device.
- *
- * Allowed GT types:
- * -----------------
- *
- * Allow only specific types of GTs to be detected and initialized by the
- * driver.  Any combination of GT types can be enabled/disabled, although
- * some settings will cause the device to fail to probe.
- *
- * Writes support both comma- and newline-separated input format. Reads
- * will always return one GT type per line. "primary" and "media" are the
- * GT type names supported by this interface.
- *
- * This attribute can only be set before binding to the device.
- *
- * Examples:
- *
- * Allow both primary and media GTs to be initialized and used.  This matches
- * the driver's default behavior::
- *
- *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
- *
- * Allow only the primary GT of each tile to be initialized and used,
- * effectively disabling the media GT if it exists on the platform::
- *
- *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
- *
- * Allow only the media GT of each tile to be initialized and used,
- * effectively disabling the primary GT.  **This configuration will cause
- * device probe failure on all current platforms, but may be allowed on
- * igpu platforms in the future**::
- *
- *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
- *
- * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
- * **This configuration will cause device probe failure on all current
- * platforms, but may be allowed on igpu platforms in the future**::
- *
- *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
- *
  * Max SR-IOV Virtual Functions
  * ----------------------------
  *
@@ -243,11 +99,15 @@
  */
 
 
-static const struct xe_config_device device_defaults = {
-	.enable_psmi = false,
-	.enable_survivability_mode = false,
-	.engines_allowed = U64_MAX,
-	.gt_types_allowed = U64_MAX,
+const struct xe_config_device xe_configfs_device_defaults = {
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	.debug = {
+		.enable_psmi = false,
+		.enable_survivability_mode = false,
+		.engines_allowed = U64_MAX,
+		.gt_types_allowed = U64_MAX,
+	},
+#endif
 	.sriov = {
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
 		.max_vfs = XE_DEFAULT_MAX_VFS,
@@ -256,40 +116,22 @@ static const struct xe_config_device device_defaults = {
 
 static void set_device_defaults(struct xe_config_device *config)
 {
-	*config = device_defaults;
+	*config = xe_configfs_device_defaults;
 #ifdef CONFIG_PCI_IOV
 	config->sriov.max_vfs = xe_modparam.max_vfs;
 #endif
 }
 
-struct engine_info {
-	const char *cls;
-	u64 mask;
-	enum xe_engine_class engine_class;
-};
-
-/* Some helpful macros to aid on the sizing of buffer allocation when parsing */
-#define MAX_ENGINE_CLASS_CHARS 5
-#define MAX_ENGINE_INSTANCE_CHARS 2
-
-static const struct engine_info engine_info[] = {
-	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
-	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, .engine_class = XE_ENGINE_CLASS_COPY },
-	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },
-	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },
-	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK, .engine_class = XE_ENGINE_CLASS_COMPUTE },
-	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
-};
-
-static const struct {
-	const char *name;
-	enum xe_gt_type type;
-} gt_types[] = {
-	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
-	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
-};
-
-static bool is_bound(struct xe_config_group_device *dev)
+/**
+ * xe_configfs_is_bound - check whether the matching pci device is bound
+ * @dev: configfs group device
+ *
+ * Caller must hold @dev->lock.
+ *
+ * Return: true if the matching pci_dev is already bound to a driver,
+ *     false otherwise.
+ */
+bool xe_configfs_is_bound(struct xe_config_group_device *dev)
 {
 	unsigned int domain, bus, slot, function;
 	struct pci_dev *pdev;
@@ -314,485 +156,14 @@ static bool is_bound(struct xe_config_group_device *dev)
 	return ret;
 }
 
-static ssize_t enable_survivability_mode_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = xe_configfs_to_device(item);
-
-	return sprintf(page, "%d\n", dev->enable_survivability_mode);
-}
-
-static ssize_t enable_survivability_mode_store(struct config_item *item, const char *page,
-					       size_t len)
-{
-	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
-	bool enable_survivability_mode;
-	int ret;
-
-	ret = kstrtobool(page, &enable_survivability_mode);
-	if (ret)
-		return ret;
-
-	guard(mutex)(&dev->lock);
-	if (is_bound(dev))
-		return -EBUSY;
-
-	dev->config.enable_survivability_mode = enable_survivability_mode;
-
-	return len;
-}
-
-static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = xe_configfs_to_device(item);
-	char *p = page;
-
-	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
-		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
-			p += sprintf(p, "%s\n", gt_types[i].name);
-
-	return p - page;
-}
-
-static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
-				      size_t len)
-{
-	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
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
-	struct xe_config_device *dev = xe_configfs_to_device(item);
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
-	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
-	ssize_t patternlen, p;
-	u64 mask, val = 0;
-
-	for (p = 0; p < len; p += patternlen + 1) {
-		patternlen = parse_engine(page + p, ",\n", &mask, NULL);
-		if (patternlen < 0)
-			return -EINVAL;
-
-		val |= mask;
-	}
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
-	struct xe_config_device *dev = xe_configfs_to_device(item);
-
-	return sprintf(page, "%d\n", dev->enable_psmi);
-}
-
-static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
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
-{
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
-
-	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
-		return -ENOBUFS;
-
-	/* Reserve one more to match check for '\0' */
-	if (!data)
-		p++;
-
-	return p - data;
-}
-
-static ssize_t ctx_restore_mid_bb_show(struct config_item *item, char *page)
-{
-	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
-
-	return wa_bb_show(dev, dev->config.ctx_restore_mid_bb, page, SZ_4K);
-}
-
-static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
-{
-	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
-
-	return wa_bb_show(dev, dev->config.ctx_restore_post_bb, page, SZ_4K);
-}
-
-static void wa_bb_append(struct wa_bb *wa_bb, u32 val)
-{
-	if (wa_bb->cs)
-		wa_bb->cs[wa_bb->len] = val;
-
-	wa_bb->len++;
-}
-
-static ssize_t parse_hex(const char *line, u32 *pval)
-{
-	char numstr[12];
-	const char *p;
-	ssize_t numlen;
-
-	p = line + strspn(line, " \t");
-	if (!*p || *p == '\n')
-		return 0;
-
-	numlen = strcspn(p, " \t\n");
-	if (!numlen || numlen >= sizeof(numstr) - 1)
-		return -EINVAL;
-
-	memcpy(numstr, p, numlen);
-	numstr[numlen] = '\0';
-	p += numlen;
-
-	if (kstrtou32(numstr, 16, pval))
-		return -EINVAL;
-
-	return p - line;
-}
-
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
-{
-	ssize_t dwords = 0, ret;
-	const char *p;
-
-	for (p = lines; *p; p++) {
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
-
-		if (str_has_prefix(p, "cmd")) {
-			for (p += strlen("cmd"); *p;) {
-				ret = parse_hex(p, &val);
-				if (ret < 0)
-					return -EINVAL;
-				if (!ret)
-					break;
-
-				p += ret;
-				dwords++;
-				wa_bb_append(&wa_bb[info->engine_class], val);
-			}
-		} else if (str_has_prefix(p, "reg")) {
-			p += strlen("reg");
-			ret = parse_hex(p, &val);
-			if (ret <= 0)
-				return -EINVAL;
-
-			p += ret;
-			ret = parse_hex(p, &val2);
-			if (ret <= 0)
-				return -EINVAL;
-
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
-
-	return dwords;
-}
-
-static ssize_t wa_bb_store(struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
-			   struct xe_config_group_device *dev,
-			   const char *page, size_t len)
-{
-	/* tmp_wa_bb must match wa_bb's size */
-	struct wa_bb tmp_wa_bb[XE_ENGINE_CLASS_MAX] = { };
-	ssize_t count, class;
-	u32 *tmp;
-
-	/* 1. Count dwords - wa_bb[i].cs is NULL for all classes */
-	count = parse_wa_bb_lines(page, tmp_wa_bb);
-	if (count < 0)
-		return count;
-
-	guard(mutex)(&dev->lock);
-
-	if (is_bound(dev))
-		return -EBUSY;
-
-	/*
-	 * 2. Allocate a u32 array and set the pointers to the right positions
-	 * according to the length of each class' wa_bb
-	 */
-	tmp = krealloc(wa_bb[0].cs, count * sizeof(u32), GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	if (!count) {
-		memset(wa_bb, 0, sizeof(tmp_wa_bb));
-		return len;
-	}
-
-	for (class = 0, count = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
-		tmp_wa_bb[class].cs = tmp + count;
-		count += tmp_wa_bb[class].len;
-		tmp_wa_bb[class].len = 0;
-	}
-
-	/* 3. Parse wa_bb lines again, this time saving the values */
-	count = parse_wa_bb_lines(page, tmp_wa_bb);
-	if (count < 0)
-		return count;
-
-	memcpy(wa_bb, tmp_wa_bb, sizeof(tmp_wa_bb));
-
-	return len;
-}
-
-static ssize_t ctx_restore_mid_bb_store(struct config_item *item,
-					const char *data, size_t sz)
-{
-	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
-
-	return wa_bb_store(dev->config.ctx_restore_mid_bb, dev, data, sz);
-}
-
-static ssize_t ctx_restore_post_bb_store(struct config_item *item,
-					 const char *data, size_t sz)
-{
-	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
-
-	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
-}
-
-CONFIGFS_ATTR(, ctx_restore_mid_bb);
-CONFIGFS_ATTR(, ctx_restore_post_bb);
-CONFIGFS_ATTR(, enable_psmi);
-CONFIGFS_ATTR(, enable_survivability_mode);
-CONFIGFS_ATTR(, engines_allowed);
-CONFIGFS_ATTR(, gt_types_allowed);
-
-static struct configfs_attribute *xe_config_device_attrs[] = {
-	&attr_ctx_restore_mid_bb,
-	&attr_ctx_restore_post_bb,
-	&attr_enable_psmi,
-	&attr_enable_survivability_mode,
-	&attr_engines_allowed,
-	&attr_gt_types_allowed,
-	NULL,
-};
-
 static void xe_config_device_release(struct config_item *item)
 {
 	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
 
 	mutex_destroy(&dev->lock);
 
-	kfree(dev->config.ctx_restore_mid_bb[0].cs);
-	kfree(dev->config.ctx_restore_post_bb[0].cs);
+	kfree(dev->config.debug.ctx_restore_mid_bb[0].cs);
+	kfree(dev->config.debug.ctx_restore_post_bb[0].cs);
 	kfree(dev);
 }
 
@@ -800,27 +171,8 @@ static struct configfs_item_operations xe_config_device_ops = {
 	.release	= xe_config_device_release,
 };
 
-static bool xe_config_device_is_visible(struct config_item *item,
-					struct configfs_attribute *attr, int n)
-{
-	struct xe_config_group_device *dev = xe_configfs_to_group_device(item);
-
-	if (attr == &attr_enable_survivability_mode) {
-		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
-			return false;
-	}
-
-	return true;
-}
-
-static struct configfs_group_operations xe_config_device_group_ops = {
-	.is_visible	= xe_config_device_is_visible,
-};
-
 static const struct config_item_type xe_config_device_type = {
 	.ct_item_ops	= &xe_config_device_ops,
-	.ct_group_ops	= &xe_config_device_group_ops,
-	.ct_attrs	= xe_config_device_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -844,7 +196,7 @@ static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, s
 
 	guard(mutex)(&dev->lock);
 
-	if (is_bound(dev))
+	if (xe_configfs_is_bound(dev))
 		return -EBUSY;
 
 	ret = kstrtouint(page, 0, &max_vfs);
@@ -875,7 +227,7 @@ static ssize_t sriov_admin_only_pf_store(struct config_item *item, const char *p
 
 	guard(mutex)(&dev->lock);
 
-	if (is_bound(dev))
+	if (xe_configfs_is_bound(dev))
 		return -EBUSY;
 
 	ret = kstrtobool(page, &admin_only_pf);
@@ -886,12 +238,12 @@ static ssize_t sriov_admin_only_pf_store(struct config_item *item, const char *p
 	return len;
 }
 
-CONFIGFS_ATTR(sriov_, admin_only_pf);
 CONFIGFS_ATTR(sriov_, max_vfs);
+CONFIGFS_ATTR(sriov_, admin_only_pf);
 
 static struct configfs_attribute *xe_config_sriov_attrs[] = {
-	&sriov_attr_admin_only_pf,
 	&sriov_attr_max_vfs,
+	&sriov_attr_admin_only_pf,
 	NULL,
 };
 
@@ -1048,19 +400,36 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
 	return xe_configfs_to_group_device(item);
 }
 
+/**
+ * xe_configfs_find_device - find the configfs group device for a pci_dev
+ * @pdev: pci device
+ *
+ * Look up the &xe_config_group_device associated with @pdev. On success,
+ * an additional reference is held on the returned group; the caller must
+ * drop it with config_group_put() when done.
+ *
+ * Return: pointer to &xe_config_group_device, or %NULL if no group exists.
+ */
+struct xe_config_group_device *xe_configfs_find_device(struct pci_dev *pdev)
+{
+	return find_xe_config_group_device(pdev);
+}
+
 static void dump_custom_dev_config(struct pci_dev *pdev,
 				   struct xe_config_group_device *dev)
 {
 #define PRI_CUSTOM_ATTR(fmt_, attr_) do { \
-		if (dev->config.attr_ != device_defaults.attr_) \
+		if (dev->config.attr_ != xe_configfs_device_defaults.attr_) \
 			pci_info(pdev, "configfs: " __stringify(attr_) " = " fmt_ "\n", \
 				 dev->config.attr_); \
 	} while (0)
 
-	PRI_CUSTOM_ATTR("%d", enable_psmi);
-	PRI_CUSTOM_ATTR("%d", enable_survivability_mode);
-	PRI_CUSTOM_ATTR("%llx", engines_allowed);
-	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	PRI_CUSTOM_ATTR("%d", debug.enable_psmi);
+	PRI_CUSTOM_ATTR("%d", debug.enable_survivability_mode);
+	PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
+	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
+#endif
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1081,7 +450,7 @@ void xe_configfs_check_device(struct pci_dev *pdev)
 		return;
 
 	/* memcmp here is safe as both are zero-initialized */
-	if (memcmp(&dev->config, &device_defaults, sizeof(dev->config))) {
+	if (memcmp(&dev->config, &xe_configfs_device_defaults, sizeof(dev->config))) {
 		pci_info(pdev, "Found custom settings in configfs\n");
 		dump_custom_dev_config(pdev, dev);
 	}
@@ -1089,156 +458,6 @@ void xe_configfs_check_device(struct pci_dev *pdev)
 	config_group_put(&dev->group);
 }
 
-/**
- * xe_configfs_get_enable_survivability_mode - get configfs survivability mode attribute
- * @pdev: pci device
- *
- * Return: enable_survivability_mode attribute in configfs
- */
-bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	bool mode;
-
-	if (!dev)
-		return device_defaults.enable_survivability_mode;
-
-	mode = dev->config.enable_survivability_mode;
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
-	mask = dev->config.gt_types_allowed;
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
-	engines_allowed = dev->config.engines_allowed;
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
-	ret = dev->config.enable_psmi;
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
-	if (cs)
-		*cs = dev->config.ctx_restore_mid_bb[class].cs;
-
-	len = dev->config.ctx_restore_mid_bb[class].len;
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
-	*cs = dev->config.ctx_restore_post_bb[class].cs;
-	len = dev->config.ctx_restore_post_bb[class].len;
-	config_group_put(&dev->group);
-
-	return len;
-}
-
 #ifdef CONFIG_PCI_IOV
 /**
  * xe_configfs_admin_only_pf() - Get PF's operational mode.
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 517de4946d35..67887923ea8b 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -9,7 +9,6 @@
 #include <linux/types.h>
 
 #include "xe_defaults.h"
-#include "xe_hw_engine_types.h"
 #include "xe_module.h"
 
 struct pci_dev;
@@ -18,17 +17,6 @@ struct pci_dev;
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev);
-bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
-bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
-u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
-bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
-u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
-				       enum xe_engine_class class,
-				       const u32 **cs);
-u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
-					enum xe_engine_class class,
-					const u32 **cs);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
@@ -37,17 +25,6 @@ bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
-static inline bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev) { return false; }
-static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
-static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
-static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
-static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
-static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
-						     enum xe_engine_class class,
-						     const u32 **cs) { return 0; }
-static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
-						      enum xe_engine_class class,
-						      const u32 **cs) { return 0; }
 #ifdef CONFIG_PCI_IOV
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
 {
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index 45617282cec5..adf193d48a63 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -3,12 +3,871 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/bitops.h>
 #include <linux/configfs.h>
-#include <linux/module.h>
+#include <linux/cleanup.h>
+#include <linux/find.h>
+#include <linux/pci.h>
+#include <linux/string.h>
 
+#include "abi/guc_log_abi.h"
+#include "instructions/xe_mi_commands.h"
 #include "xe_configfs_debug.h"
 #include "xe_configfs_types.h"
+#include "xe_gt_types.h"
+#include "xe_hw_engine_types.h"
+#include "xe_pci_types.h"
+
+/**
+ * DOC: Xe Configfs Debug Attributes
+ *
+ * Overview
+ * ========
+ *
+ * The following configfs attributes are only available when the kernel is
+ * built with ``CONFIG_DRM_XE_DEBUG=y``. They appear under the ``debug/``
+ * subdirectory of each xe configfs device. They are intended for hardware
+ * and driver debugging and are not stable ABI. Using them is "at your own
+ * risk".
+ *
+ * See the top-level ``Xe Configfs`` documentation in ``xe_configfs.c``
+ * for how to create, probe and remove configfs devices. Once a device
+ * directory exists, the driver populates it with a ``debug/`` subdirectory
+ * containing the entries described below::
+ *
+ *	/sys/kernel/config/xe/
+ *	└── 0000:03:00.0
+ *	    └── debug/
+ *	        ├── ctx_restore_mid_bb
+ *	        ├── ctx_restore_post_bb
+ *	        ├── enable_psmi
+ *	        ├── enable_survivability_mode
+ *	        ├── engines_allowed
+ *	        └── gt_types_allowed
+ *
+ * Configure Attributes
+ * ====================
+ *
+ * Context restore BB
+ * ------------------
+ *
+ * Allow to execute a batch buffer during any context switches. When the
+ * GPU is restoring the context, it executes additional commands. It's useful
+ * for testing additional workarounds and validating certain HW behaviors: it's
+ * not intended for normal execution and will taint the kernel with TAINT_TEST
+ * when used.
+ *
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
+ *		> /sys/kernel/config/xe/0000:03:00.0/debug/ctx_restore_post_bb
+ *
+ * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10 at the
+ *    beginning of the context restore::
+ *
+ *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
+ *		> /sys/kernel/config/xe/0000:03:00.0/debug/ctx_restore_mid_bb
+ *
+ * #. Load certain values in a couple of registers (it can be used as a simpler
+ *    alternative to the `cmd`) action::
+ *
+ *	# cat > /sys/kernel/config/xe/0000:03:00.0/debug/ctx_restore_post_bb <<EOF
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
+ * PSMI
+ * ----
+ *
+ * Enable extra debugging capabilities to trace engine execution. Only useful
+ * during early platform enabling and requires additional hardware connected.
+ * Once it's enabled, additionals WAs are added and runtime configuration is
+ * done via debugfs. Example to enable it::
+ *
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/debug/enable_psmi
+ *
+ * This attribute can only be set before binding to the device.
+ *
+ * Survivability mode:
+ * -------------------
+ *
+ * Enable survivability mode on supported cards. Refer DOC in xe_survivability_mode.c for
+ * details of this mode. Example to enable it::
+ *
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/debug/enable_survivability_mode
+ *
+ * This attribute can only be set before binding to the device.
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
+ *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/debug/engines_allowed
+ *
+ * Allow only compute engines and first copy engine::
+ *
+ *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/debug/engines_allowed
+ *
+ * Note that the engine names are the per-GT hardware names. On multi-tile
+ * platforms, writing ``rcs0,bcs0`` to this file would allow the first render
+ * and copy engines on each tile.
+ *
+ * The requested configuration may not be supported by the platform and driver
+ * may fail to probe. For example: if at least one copy engine is expected to be
+ * available for migrations, but it's disabled. This is intended for debugging
+ * purposes only.
+ *
+ * This attribute can only be set before binding to the device.
+ *
+ * Allowed GT types:
+ * -----------------
+ *
+ * Allow only specific types of GTs to be detected and initialized by the
+ * driver.  Any combination of GT types can be enabled/disabled, although
+ * some settings will cause the device to fail to probe.
+ *
+ * Writes support both comma- and newline-separated input format. Reads
+ * will always return one GT type per line. "primary," "media," and "hl_media"
+ * are the GT type names supported by this interface.
+ *
+ * This attribute can only be set before binding to the device.
+ *
+ * Examples:
+ *
+ * Allow both primary and media GTs to be initialized and used.  This matches
+ * the driver's default behavior::
+ *
+ *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
+ *
+ * Allow only the primary GT of each tile to be initialized and used,
+ * effectively disabling the media GT if it exists on the platform::
+ *
+ *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
+ *
+ * Allow only the media GT of each tile to be initialized and used,
+ * effectively disabling the primary GT.  **This configuration will cause
+ * device probe failure on all current platforms, but may be allowed on
+ * igpu platforms in the future**::
+ *
+ *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
+ *
+ * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
+ * **This configuration will cause device probe failure on all current
+ * platforms, but may be allowed on igpu platforms in the future**::
+ *
+ *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
+ *
+ */
+
+struct engine_info {
+	const char *cls;
+	u64 mask;
+	enum xe_engine_class engine_class;
+};
+
+/* Some helpful macros to aid on the sizing of buffer allocation when parsing */
+#define MAX_ENGINE_CLASS_CHARS 5
+#define MAX_ENGINE_INSTANCE_CHARS 2
+
+static const struct engine_info engine_info[] = {
+	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
+	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, .engine_class = XE_ENGINE_CLASS_COPY },
+	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK,
+	  .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },
+	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK,
+	  .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },
+	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK, .engine_class = XE_ENGINE_CLASS_COMPUTE },
+	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
+};
+
+static const struct {
+	const char *name;
+	enum xe_gt_type type;
+} gt_types[] = {
+	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
+	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
+};
+
+static struct xe_config_group_device *debug_to_group_device(struct config_item *item)
+{
+	return xe_configfs_to_group_device(item->ci_parent);
+}
+
+static struct xe_config_device *debug_to_device(struct config_item *item)
+{
+	return xe_configfs_to_device(item->ci_parent);
+}
+
+static u64 get_gt_types_allowed(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = xe_configfs_find_device(pdev);
+	u64 mask;
+
+	if (!dev)
+		return xe_configfs_device_defaults.debug.gt_types_allowed;
+
+	mask = dev->config.debug.gt_types_allowed;
+	config_group_put(&dev->group);
+
+	return mask;
+}
+
+/**
+ * xe_configfs_get_enable_survivability_mode - get configfs survivability mode attribute
+ * @pdev: pci device
+ *
+ * Return: enable_survivability_mode attribute in configfs
+ */
+bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = xe_configfs_find_device(pdev);
+	bool mode;
+
+	if (!dev)
+		return xe_configfs_device_defaults.debug.enable_survivability_mode;
+
+	mode = dev->config.debug.enable_survivability_mode;
+	config_group_put(&dev->group);
+
+	return mode;
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
+/**
+ * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
+ * @pdev: pci device
+ *
+ * Return: engine mask with allowed engines set in configfs
+ */
+u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = xe_configfs_find_device(pdev);
+	u64 engines_allowed;
+
+	if (!dev)
+		return xe_configfs_device_defaults.debug.engines_allowed;
+
+	engines_allowed = dev->config.debug.engines_allowed;
+	config_group_put(&dev->group);
+
+	return engines_allowed;
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
+	struct xe_config_group_device *dev = xe_configfs_find_device(pdev);
+	bool ret;
+
+	if (!dev)
+		return false;
+
+	ret = dev->config.debug.enable_psmi;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
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
+{
+	struct xe_config_group_device *dev = xe_configfs_find_device(pdev);
+	u32 len;
+
+	if (!dev)
+		return 0;
+
+	if (cs)
+		*cs = dev->config.debug.ctx_restore_mid_bb[class].cs;
+
+	len = dev->config.debug.ctx_restore_mid_bb[class].len;
+	config_group_put(&dev->group);
+
+	return len;
+}
+
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
+{
+	struct xe_config_group_device *dev = xe_configfs_find_device(pdev);
+	u32 len;
+
+	if (!dev)
+		return 0;
+
+	*cs = dev->config.debug.ctx_restore_post_bb[class].cs;
+	len = dev->config.debug.ctx_restore_post_bb[class].len;
+	config_group_put(&dev->group);
+
+	return len;
+}
+
+static ssize_t enable_survivability_mode_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = debug_to_device(item);
+
+	return sprintf(page, "%d\n", dev->debug.enable_survivability_mode);
+}
+
+static ssize_t enable_survivability_mode_store(struct config_item *item, const char *page,
+					       size_t len)
+{
+	struct xe_config_group_device *dev = debug_to_group_device(item);
+	bool enable_survivability_mode;
+	int ret;
+
+	ret = kstrtobool(page, &enable_survivability_mode);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (xe_configfs_is_bound(dev))
+		return -EBUSY;
+
+	dev->config.debug.enable_survivability_mode = enable_survivability_mode;
+
+	return len;
+}
+
+static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = debug_to_device(item);
+	char *p = page;
+
+	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
+		if (dev->debug.gt_types_allowed & BIT_ULL(gt_types[i].type))
+			p += sprintf(p, "%s\n", gt_types[i].name);
+
+	return p - page;
+}
+
+static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
+				      size_t len)
+{
+	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
+	struct xe_config_group_device *dev = debug_to_group_device(item);
+	u64 typemask = 0;
+	char *p = buf;
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
+	if (xe_configfs_is_bound(dev))
+		return -EBUSY;
+
+	dev->config.debug.gt_types_allowed = typemask;
+
+	return len;
+}
+
+static ssize_t engines_allowed_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = debug_to_device(item);
+	char *p = page;
+
+	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
+		u64 mask = engine_info[i].mask;
+
+		if ((dev->debug.engines_allowed & mask) == mask) {
+			p += sprintf(p, "%s*\n", engine_info[i].cls);
+		} else if (mask & dev->debug.engines_allowed) {
+			u16 bit0 = __ffs64(mask), bit;
+
+			mask &= dev->debug.engines_allowed;
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
+	struct xe_config_group_device *dev = debug_to_group_device(item);
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
+	if (xe_configfs_is_bound(dev))
+		return -EBUSY;
+
+	dev->config.debug.engines_allowed = val;
+
+	return len;
+}
+
+static ssize_t enable_psmi_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = debug_to_device(item);
+
+	return sprintf(page, "%d\n", dev->debug.enable_psmi);
+}
+
+static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = debug_to_group_device(item);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (xe_configfs_is_bound(dev))
+		return -EBUSY;
+
+	dev->config.debug.enable_psmi = val;
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
+	struct xe_config_group_device *dev = debug_to_group_device(item);
+
+	return wa_bb_show(dev, dev->config.debug.ctx_restore_mid_bb, page, SZ_4K);
+}
+
+static ssize_t ctx_restore_post_bb_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = debug_to_group_device(item);
+
+	return wa_bb_show(dev, dev->config.debug.ctx_restore_post_bb, page, SZ_4K);
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
+	for (p = lines; *p; p++) {
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
+	guard(mutex)(&dev->lock);
+
+	if (xe_configfs_is_bound(dev))
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
+	struct xe_config_group_device *dev = debug_to_group_device(item);
+
+	return wa_bb_store(dev->config.debug.ctx_restore_mid_bb, dev, data, sz);
+}
+
+static ssize_t ctx_restore_post_bb_store(struct config_item *item,
+					 const char *data, size_t sz)
+{
+	struct xe_config_group_device *dev = debug_to_group_device(item);
+
+	return wa_bb_store(dev->config.debug.ctx_restore_post_bb, dev, data, sz);
+}
+
+CONFIGFS_ATTR(, ctx_restore_mid_bb);
+CONFIGFS_ATTR(, ctx_restore_post_bb);
+CONFIGFS_ATTR(, enable_psmi);
+CONFIGFS_ATTR(, enable_survivability_mode);
+CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, gt_types_allowed);
+
+static bool xe_configfs_debug_is_visible(struct config_item *item,
+					 struct configfs_attribute *attr,
+					 int n)
+{
+	struct xe_config_group_device *dev = debug_to_group_device(item);
+
+	if (attr == &attr_enable_survivability_mode) {
+		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
+			return false;
+	}
+
+	return true;
+}
+
+static struct configfs_group_operations xe_configfs_debug_group_ops = {
+	.is_visible = xe_configfs_debug_is_visible,
+};
+
+static struct configfs_attribute *xe_configfs_debug_attrs[] = {
+	&attr_ctx_restore_mid_bb,
+	&attr_ctx_restore_post_bb,
+	&attr_enable_psmi,
+	&attr_enable_survivability_mode,
+	&attr_engines_allowed,
+	&attr_gt_types_allowed,
+	NULL,
+};
 
 const struct config_item_type xe_configfs_debug_type = {
+	.ct_group_ops	= &xe_configfs_debug_group_ops,
+	.ct_attrs	= xe_configfs_debug_attrs,
 	.ct_owner	= THIS_MODULE,
 };
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
index 01170dc2f97e..bfbfbda1073f 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.h
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
@@ -5,4 +5,40 @@
 #ifndef _XE_CONFIGFS_DEBUG_H_
 #define _XE_CONFIGFS_DEBUG_H_
 
+#include <linux/types.h>
+
+#include "xe_hw_engine_types.h"
+
+struct pci_dev;
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) && IS_ENABLED(CONFIG_CONFIGFS_FS)
+bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev);
+bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
+bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
+u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
+bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+				       enum xe_engine_class class,
+				       const u32 **cs);
+u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+					enum xe_engine_class class,
+					const u32 **cs);
+#else
+/*
+ * Dummy values here are not used since these function accesses are always
+ * wrapped in CONFIG_DRM_XE_DEBUG.
+ */
+static inline bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev) { return false; }
+static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
+static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
+static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
+static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+						     enum xe_engine_class class,
+						     const u32 **cs) { return 0; }
+static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+						      enum xe_engine_class class,
+						      const u32 **cs) { return 0; }
+#endif
+
 #endif /* _XE_CONFIGFS_DEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index c9d94a3c26a7..02d5709bcfd3 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -14,6 +14,7 @@
 #include "xe_sriov_types.h"
 
 struct config_item;
+struct pci_dev;
 
 /* Similar to struct xe_bb, but not tied to HW (yet) */
 struct wa_bb {
@@ -29,12 +30,14 @@ struct xe_config_group_device {
 #endif
 
 	struct xe_config_device {
-		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
-		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
-		bool enable_psmi;
-		bool enable_survivability_mode;
-		u64 engines_allowed;
-		u64 gt_types_allowed;
+		struct {
+			struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
+			struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
+			bool enable_psmi;
+			bool enable_survivability_mode;
+			u64 engines_allowed;
+			u64 gt_types_allowed;
+		} debug;
 		struct {
 			bool admin_only_pf;
 			unsigned int max_vfs;
@@ -59,6 +62,10 @@ static inline struct xe_config_device *xe_configfs_to_device(struct config_item
 	return &xe_configfs_to_group_device(item)->config;
 }
 
+bool xe_configfs_is_bound(struct xe_config_group_device *dev);
+struct xe_config_group_device *xe_configfs_find_device(struct pci_dev *pdev);
+extern const struct xe_config_device xe_configfs_device_defaults;
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 extern const struct config_item_type xe_configfs_debug_type;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e468b638271b..e520afbf1f22 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -18,6 +18,7 @@
 #include "regs/xe_irq_regs.h"
 #include "xe_bo.h"
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0f0e08bcc182..7cefa91e37af 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -18,6 +18,7 @@
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_device.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9db914584347..e801d28e13af 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -19,6 +19,7 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue_types.h"
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e30f293ae825..051bd045e1bb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -19,6 +19,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
index 899b01f72ba3..59af3d145418 100644
--- a/drivers/gpu/drm/xe/xe_psmi.c
+++ b/drivers/gpu/drm/xe/xe_psmi.c
@@ -8,6 +8,7 @@
 #include "xe_bo.h"
 #include "xe_device_types.h"
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_psmi.h"
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 1a4dcbbbc176..02c33ff41b5e 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -10,6 +10,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 7c85bdb267af..3e3fe1e5b1c1 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -11,6 +11,7 @@
 #include <linux/sysfs.h>
 
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_device.h"
 #include "xe_heci_gsc.h"
 #include "xe_i2c.h"
-- 
2.43.0

