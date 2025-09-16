Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27354CAC59D
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D958810E561;
	Tue, 16 Sep 2025 21:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEMMnvNI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B85110E561
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758057364; x=1789593364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BJjShZY1FonEjZ3B7g3XI/BNV/8nrQ+AYKhmwd6aREg=;
 b=DEMMnvNI+B9bQhd5k2CrLDrdBjT5H+4+60JfbL2F/+KSk6wsjXBA1DPm
 SNch+EQUIGmGMzxs9wH0PA56vH8YnOQLpMWo1Ps3zpQrdaS/PVt+mnKyS
 4f6PgvtEQqMubsoNf/3cEXL1qNvS6r2lOGXQ7lHv/jN28tStQlswHvosY
 28c52haa9Qlokl7nbrZJKz9IAYPBODIZCkRZ/l6ImI5tflzcCG096WCtK
 G36+uUo6J+vYJ5KrLVcbM2yl4Kq4e8/aG7UuxBbh/IcV2qOFzsdpALvtE
 rhhFNxmYxrnxKzlkSncLaUjUi7rY15qBM9qKbe/J1rqXiv82RcPMxCEVs Q==;
X-CSE-ConnectionGUID: q+FEus4bTXCiQQCwWD1TNA==
X-CSE-MsgGUID: t95S7f06QUi9p+QApgRCUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="82949107"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="82949107"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
X-CSE-ConnectionGUID: TQuyALBtSmOt1XURqbsTmQ==
X-CSE-MsgGUID: JWyp/R8jQTihw9xW3aw1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="175146068"
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
Subject: [PATCH v5 4/7] drm/xe/configfs: Add post context restore bb
Date: Tue, 16 Sep 2025 14:15:41 -0700
Message-ID: <20250916-wa-bb-cmds-v5-4-306bddbc15da@intel.com>
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

Allow the user to specify commands to execute during a context restore.
Currently it's possible to parse 2 types of actions:

	- cmd: the instructions are added as is to the bb
	- reg: just use the address and value, without worrying about
	  encoding the right LRI instruction. This is possibly the most
	  useful use case, so added a dedicated action for that.

This also prepares for future BBs: mid context restore and rc6 context
restore that can re-use the same parsing functions.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
- use bin attribute to be allow multiline
v3:
- revert attribute back to a simple attribute rather than binary:
  otherwise configfs only calls the callback on the file release and
  ignores the result. With that the user can't rely on the return
  code to know if the setting was accepted.

  To still allow multiline, a method that uses just one syscall should
  be used. In bash, echo will end up using more syscalls. This can be
  workarounded by using heredoc, or simply writing it in C
  (rewrote that listening to
   https://www.youtube.com/watch?v=1S1fISh-pag, you're welcome to review
   listening to that beauty too)
v4: taint with TAINT_TEST (Matt Roper)
v5: move taint to previous patch (Raag)
---
 drivers/gpu/drm/xe/xe_configfs.c | 280 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 278 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index d86c75af03278..9a30dc958c35c 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/ctype.h>
 #include <linux/configfs.h>
 #include <linux/cleanup.h>
 #include <linux/find.h>
@@ -12,6 +13,7 @@
 #include <linux/pci.h>
 #include <linux/string.h>
 
+#include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
 #include "xe_hw_engine_types.h"
 #include "xe_module.h"
@@ -115,6 +117,37 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * Context restore BB
+ * ------------------
+ *
+ * Allow to execute a batch buffer during any context switches. When the
+ * GPU is restoring the context, it executes additional commands. It's useful
+ * for testing additional workarounds and validating certain HW behaviors: it's
+ * not intended for normal execution and will taint the kernel with TAINT_TEST
+ * when used.
+ *
+ * Currently this is implemented only for post context restore. Examples:
+ *
+ * #. Execute a LRI command to write 0xDEADBEEF to register 0x4f10::
+ *
+ *	# echo 'rcs cmd 11000001 4F100 DEADBEEF' \
+ *		> /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb
+ *
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
+ * This attribute can only be set before binding to the device.
+ *
  * Remove devices
  * ==============
  *
@@ -123,11 +156,18 @@
  *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
  */
 
+/* Similar to struct xe_bb, but not tied to HW (yet) */
+struct wa_bb {
+	u32 *cs;
+	u32 len; /* in dwords */
+};
+
 struct xe_config_group_device {
 	struct config_group group;
 
 	struct xe_config_device {
 		u64 engines_allowed;
+		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
 		bool enable_psmi;
 	} config;
@@ -371,11 +411,233 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
 	return len;
 }
 
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
+static ssize_t ctx_restore_post_bb_store(struct config_item *item,
+					 const char *data, size_t sz)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
+}
+
+CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
+	&attr_ctx_restore_post_bb,
 	&attr_enable_psmi,
 	&attr_engines_allowed,
 	&attr_survivability_mode,
@@ -387,6 +649,8 @@ static void xe_config_device_release(struct config_item *item)
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 
 	mutex_destroy(&dev->lock);
+
+	kfree(dev->config.ctx_restore_post_bb[0].cs);
 	kfree(dev);
 }
 
@@ -636,14 +900,26 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 /**
  * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
  * @pdev: pci device
+ * @class: hw engine class
+ * @cs: pointer to the bb to use - only valid during probe
  *
- * Return: post_ctx_restore setting in configfs
+ * Return: Number of dwords used in the post_ctx_restore setting in configfs
  */
 u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
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
+	*cs = dev->config.ctx_restore_post_bb[class].cs;
+	len = dev->config.ctx_restore_post_bb[class].len;
+	config_group_put(&dev->group);
+
+	return len;
 }
 
 int __init xe_configfs_init(void)

-- 
2.50.1

