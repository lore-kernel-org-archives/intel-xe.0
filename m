Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBFCCD343A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFBA10E378;
	Mon,  4 May 2026 04:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJqoVqYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F7710E183
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869833; x=1809405833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=umGdb+uPMrnvEdqNQi9IffLJYUGfBvFiDYmZjMSabKY=;
 b=RJqoVqYFNw2A687Mmj8Kz5rAvv4BmZuYJGnwrV4gtDtUA4kyqIOt/OQ+
 PlkuLThRg/GPr9slWKPbsML/6WVMz9p++hn7OM1QPWntmPzLuD56/QNB5
 IWDefQJAv5yHMulnhPF+T1NfWKe/Cn8fQEh5xOI9ZpB8WPe8IlH2mlxee
 qCxEIi8CC2puek+iiJmakCBfJ75vxwV3niWlmqMcvRby0py0k6taqRCq7
 VOPOvnvpZqFxNI5Tiebh/TsAfeEFEWv+Hl1J7FmKgNhB7G3CXjLvKZK3S
 v5S6ue1qU4XCA94xIx1jLWL6VfbUoR47Lq/vGhURqtuU56AYMpFM+d8JI Q==;
X-CSE-ConnectionGUID: lyaPaMEpSMmDvlXROTDlBg==
X-CSE-MsgGUID: GmIjPND5QsWq8sMJlJvgPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96293563"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96293563"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:52 -0700
X-CSE-ConnectionGUID: v2vEDmEPQOOfJt7os+e4mg==
X-CSE-MsgGUID: U0buM5IZSuCKCdUN0fQSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="232773683"
Received: from dut4435arlh.fm.intel.com ([10.105.8.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:51 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 8/9] drm/xe: Add infrastructure for debug configfs parameters
Date: Mon,  4 May 2026 04:43:45 +0000
Message-ID: <20260504044348.209625-9-stuart.summers@intel.com>
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

Borrow the X-macro pattern from i915_debugfs_params.c and adapt it to
the Xe debug configfs interface, so future debug-only configfs entries
can be added with a single line.

Add a new header xe_configfs_debug_params.h that defines:

  XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(param)

invoked as 'param(type, name, default, validator)' for each debug
configfs parameter. The matching backing struct, default initializer
fragment, configfs_attribute objects, show/store handlers and entries
in xe_configfs_debug_attrs[] are all generated from this single list.

Supported type tokens are int, bool, u8, u16, u32 and u64. Sized
unsigned types are used directly rather than mirroring i915's
int/unsigned int (which exists there only because those debugfs
entries shadow module_param values, and module_param itself does not
support sized types).

The validator slot is a function-like macro that takes the parsed
typed value and returns 0 or a negative errno. XE_PARAM_VALIDATE_NONE
is provided for parameters whose full type range is acceptable.
Function-like macros (rather than function pointers) let the compiler
fold trivial validators away entirely.

The auto-generated handlers and configfs_attribute objects live in a
new xe_configfs_debug_params.c so they do not crowd the hand-written
entries in xe_configfs_debug.c. The attribute objects are non-static
(declared 'extern' in the header) so xe_configfs_debug.c can splice
them into xe_configfs_debug_attrs[] and reference them from
is_visible().

The parameter list is intentionally empty in this patch; converting
existing entries (or adding new ones) is left to follow-up changes so
this infrastructure can be reviewed in isolation.

Note that the expectation is a user will only set these debug
parameters when CONFIG_DRM_XE_DEBUG is set; the entire facility lives
behind that Kconfig.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-4.7
---
 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/gpu/drm/xe/xe_configfs.c              |   7 ++
 drivers/gpu/drm/xe/xe_configfs_debug.c        |   2 +
 drivers/gpu/drm/xe/xe_configfs_debug_params.c | 112 +++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug_params.h | 117 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_types.h        |   2 +
 6 files changed, 241 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b58667b0b18e..d7b165356bb8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -161,7 +161,7 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
-xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) := xe_configfs_debug.o
+xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) := xe_configfs_debug.o xe_configfs_debug_params.o
 xe-$(CONFIG_CONFIGFS_FS) += $(xe_debug_configfs_obj-y)
 
 # graphics virtualization (SR-IOV) support
diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 4a5bd53af443..59cd83c2ac53 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -108,6 +108,9 @@ const struct xe_config_device xe_configfs_device_defaults = {
 		.gt_types_allowed = U64_MAX,
 		.guc_log_level = XE_GUC_LOG_LEVEL_UNSET,
 		.guc_log_target = XE_DEFAULT_GUC_LOG_TARGET,
+		.params = {
+			XE_CONFIGFS_DEBUG_PARAMS_DEFAULTS
+		},
 	},
 #endif
 	.sriov = {
@@ -433,6 +436,10 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
 	PRI_CUSTOM_ATTR("%d", debug.guc_log_level);
 	PRI_CUSTOM_ATTR("%d", debug.guc_log_target);
+#define _XE_PARAM_DUMP(_T, _name, _def, _val) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);
+	XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DUMP)
+#undef _XE_PARAM_DUMP
 #endif
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index af4ee420cf6f..fcd6c81de3bb 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -13,6 +13,7 @@
 #include "abi/guc_log_abi.h"
 #include "instructions/xe_mi_commands.h"
 #include "xe_configfs_debug.h"
+#include "xe_configfs_debug_params.h"
 #include "xe_configfs_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc_log.h"
@@ -1007,6 +1008,7 @@ static struct configfs_attribute *xe_configfs_debug_attrs[] = {
 	&attr_gt_types_allowed,
 	&attr_guc_log_level,
 	&attr_guc_log_target,
+	XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(XE_PARAM_ATTR_PTR)
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.c b/drivers/gpu/drm/xe/xe_configfs_debug_params.c
new file mode 100644
index 000000000000..09500e7ebe3c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_debug_params.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/*
+ * Auto-generated debug configfs parameters.
+ *
+ * This file expands XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH() (defined in
+ * xe_configfs_debug_params.h) to define the show/store handlers and
+ * configfs_attribute objects for every parameter in the list.
+ *
+ * Per-type ops generators are provided for the simple scalar types
+ * supported by &struct xe_configfs_debug_params: int, bool, u8, u16,
+ * u32, u64. The integer template is parameterised on the kstrto helper
+ * and the printf format string; bool gets its own template because
+ * kstrtobool() has a different signature.
+ *
+ * Each store handler invokes the per-parameter validator (a
+ * function-like macro from the X-macro list), allowing range or
+ * sentinel checks to be expressed declaratively next to the parameter
+ * definition.
+ *
+ * Generated configfs_attribute objects are non-static so that
+ * xe_configfs_debug.c can reference them by symbol (attr_<name>) when
+ * assembling its xe_configfs_debug_attrs[] array and its is_visible()
+ * callback.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/configfs.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+
+#include "xe_configfs_debug_params.h"
+#include "xe_configfs_types.h"
+
+#define _XE_PARAM_DEFINE_OPS_NUMERIC(_T, _name, _kstrto, _fmt, _validator) \
+static ssize_t _name##_show(struct config_item *item, char *page) \
+{ \
+	struct xe_config_device *dev = xe_configfs_to_device(item->ci_parent); \
+	return sprintf(page, _fmt "\n", dev->debug.params._name); \
+} \
+static ssize_t _name##_store(struct config_item *item, const char *page, size_t len) \
+{ \
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item->ci_parent); \
+	XE_PARAM_TYPE_##_T val; \
+	int ret = _kstrto(page, 0, &val); \
+	if (ret) \
+		return ret; \
+	ret = _validator(val); \
+	if (ret) \
+		return ret; \
+	guard(mutex)(&dev->lock); \
+	if (xe_configfs_is_bound(dev)) \
+		return -EBUSY; \
+	dev->config.debug.params._name = val; \
+	return len; \
+}
+
+#define _XE_PARAM_DEFINE_OPS_int(_name, _validator) \
+	_XE_PARAM_DEFINE_OPS_NUMERIC(int, _name, kstrtoint, "%d", _validator)
+#define _XE_PARAM_DEFINE_OPS_u8(_name, _validator) \
+	_XE_PARAM_DEFINE_OPS_NUMERIC(u8,  _name, kstrtou8,  "%u", _validator)
+#define _XE_PARAM_DEFINE_OPS_u16(_name, _validator) \
+	_XE_PARAM_DEFINE_OPS_NUMERIC(u16, _name, kstrtou16, "%u", _validator)
+#define _XE_PARAM_DEFINE_OPS_u32(_name, _validator) \
+	_XE_PARAM_DEFINE_OPS_NUMERIC(u32, _name, kstrtou32, "%u", _validator)
+#define _XE_PARAM_DEFINE_OPS_u64(_name, _validator) \
+	_XE_PARAM_DEFINE_OPS_NUMERIC(u64, _name, kstrtou64, "%llu", _validator)
+#define _XE_PARAM_DEFINE_OPS_bool(_name, _validator) \
+static ssize_t _name##_show(struct config_item *item, char *page) \
+{ \
+	struct xe_config_device *dev = xe_configfs_to_device(item->ci_parent); \
+	return sprintf(page, "%d\n", dev->debug.params._name); \
+} \
+static ssize_t _name##_store(struct config_item *item, const char *page, size_t len) \
+{ \
+	struct xe_config_group_device *dev = xe_configfs_to_group_device(item->ci_parent); \
+	bool val; \
+	int ret = kstrtobool(page, &val); \
+	if (ret) \
+		return ret; \
+	ret = _validator(val); \
+	if (ret) \
+		return ret; \
+	guard(mutex)(&dev->lock); \
+	if (xe_configfs_is_bound(dev)) \
+		return -EBUSY; \
+	dev->config.debug.params._name = val; \
+	return len; \
+}
+
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DEFINE_OPS)
+
+/*
+ * Define the configfs_attribute objects. These are non-static so they
+ * can be referenced from xe_configfs_debug.c.
+ */
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};
+
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DEFINE_ATTR)
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.h b/drivers/gpu/drm/xe/xe_configfs_debug_params.h
new file mode 100644
index 000000000000..9cf9256eb851
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_debug_params.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_CONFIGFS_DEBUG_PARAMS_H_
+#define _XE_CONFIGFS_DEBUG_PARAMS_H_
+
+#include <linux/configfs.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+
+/*
+ * Internal type/format aliases resolved by XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH().
+ *
+ * Each parameter declares its type using one of these tokens; the helper
+ * macros below and in xe_configfs_debug_params.c resolve the token to the
+ * underlying C type, printf format, and kstrto helper.
+ *
+ * Supported type tokens: int, bool, u8, u16, u32, u64. Add new types by
+ * defining matching XE_PARAM_TYPE_<token> and XE_PARAM_FMT_<token> here,
+ * plus an ops generator in xe_configfs_debug_params.c.
+ */
+#define XE_PARAM_TYPE_int		int
+#define XE_PARAM_TYPE_bool		bool
+#define XE_PARAM_TYPE_u8		u8
+#define XE_PARAM_TYPE_u16		u16
+#define XE_PARAM_TYPE_u32		u32
+#define XE_PARAM_TYPE_u64		u64
+
+#define XE_PARAM_FMT_int		"%d"
+#define XE_PARAM_FMT_bool		"%d"
+#define XE_PARAM_FMT_u8			"%u"
+#define XE_PARAM_FMT_u16		"%u"
+#define XE_PARAM_FMT_u32		"%u"
+#define XE_PARAM_FMT_u64		"%llu"
+
+/*
+ * Per-parameter validators
+ *
+ * A validator is a function-like macro that takes the (already-parsed)
+ * typed value and expands to an int expression: 0 if the value is
+ * acceptable, a negative errno (typically -EINVAL) otherwise.
+ *
+ * XE_PARAM_VALIDATE_NONE is the no-op validator for parameters whose
+ * full type range is acceptable. Param-specific validators are defined
+ * alongside the X-macro list below so that the constraints live next to
+ * the entries that depend on them.
+ */
+#define XE_PARAM_VALIDATE_NONE(_v)		(0)
+
+/**
+ * XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH - iterate over debug configfs params
+ * @param: function-like macro called as
+ *	   ``param(type, name, default, validator)``
+ *
+ *   type:      parameter type token, one of {int, bool, u8, u16, u32, u64}
+ *   name:      parameter name; appears as a configfs file at
+ *              /sys/kernel/config/xe/<bdf>/debug/<name>
+ *   default:   initial/default value of the parameter
+ *   validator: function-like macro ``v -> int`` returning 0 or a negative
+ *              errno; use XE_PARAM_VALIDATE_NONE when no extra constraints
+ *              apply beyond the underlying type's range
+ *
+ * To add a new debug-only configfs parameter, append a single line to
+ * this list. The infrastructure auto-generates the struct member,
+ * default initialization, configfs attribute (show/store), inclusion in
+ * the debug attrs[] array, and the diagnostic dump in
+ * dump_custom_dev_config().
+ *
+ * Generated configfs files use the default permissions provided by the
+ * configfs core (read-write); a system administrator can restrict them
+ * at runtime if needed.
+ */
+#define XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(param) \
+	/* No parameters yet - add entries above this line. */
+
+/* Generate the struct that backs all debug params in xe_config_device. */
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val) XE_PARAM_TYPE_##_T _name;
+struct xe_configfs_debug_params {
+	XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_MEMBER)
+};
+
+#undef _XE_PARAM_MEMBER
+
+/*
+ * Designated-initializer fragment for &xe_configfs_device_defaults. Use as:
+ *
+ *	.debug.params = {
+ *		XE_CONFIGFS_DEBUG_PARAMS_DEFAULTS
+ *	},
+ */
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val)	._name = (_def),
+#define XE_CONFIGFS_DEBUG_PARAMS_DEFAULTS \
+	XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DEFAULT_INIT)
+
+/*
+ * Forward declarations of the per-parameter configfs_attribute objects.
+ *
+ * The objects themselves are defined in xe_configfs_debug_params.c (as
+ * non-static so they can be referenced from xe_configfs_debug.c's
+ * xe_configfs_debug_attrs[] array and is_visible() callback). They live
+ * in the same translation unit as the X-macro-generated show/store
+ * handlers; consumers should reference them via attr_<name>.
+ */
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val) \
+	extern struct configfs_attribute attr_##_name;
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DECLARE_ATTR)
+#undef _XE_PARAM_DECLARE_ATTR
+
+/*
+ * Helper used by xe_configfs_debug.c to splice the auto-generated
+ * attribute pointers into its xe_configfs_debug_attrs[] array.
+ */
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val) &attr_##_name,
+
+#endif /* _XE_CONFIGFS_DEBUG_PARAMS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index 8773adeffd4e..16e91d8072f4 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#include "xe_configfs_debug_params.h"
 #include "xe_hw_engine_types.h"
 #include "xe_pci_types.h"
 #include "xe_sriov_types.h"
@@ -39,6 +40,7 @@ struct xe_config_group_device {
 			u64 gt_types_allowed;
 			int guc_log_level;
 			u8 guc_log_target;
+			struct xe_configfs_debug_params params;
 		} debug;
 		struct {
 			bool admin_only_pf;
-- 
2.43.0

