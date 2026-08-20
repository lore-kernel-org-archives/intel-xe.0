Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D74AC5DF90
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 20:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96B010EBA5;
	Thu, 20 Aug 2026 20:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9dv5Xvd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E11D10E64A
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787256450; x=1818792450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ssNqnnAocQgV1gnBRiTwjs/f8gKnVV7/8rxR0eGp6Qs=;
 b=Z9dv5Xvd4LRF77lpp/IJCihzaopCw8rWE1e5QWiQpN2SG3+Gcp1DWA9v
 j9unwrvecIaZqpiKzH/swCWwVrFa7Uv/1Aj3Ox2AxFJP/8aT0vXrXC3dk
 HwPsNkh17NeMPoGJbgMczrZDUNDNPHOuBpOaBNh//GnPRO42Mv2T0os3s
 DKworDeNP01EtnWk7l6p22WDBsL8LscTyQji4UUyPbobNyCoWrHHFu8oD
 XqBOY981YP/s45z3PN1o/GcRkQTT9Hpk4sWQVgY3TXa6aOPWZ+S0FgYmv
 6bV5QB7G0S9H5OgYNDGU3PjCzX6s1CZvBMT8uJffBEFsPILl3WIhFFkfV Q==;
X-CSE-ConnectionGUID: LWZwt7sdSfawXpmBaKknPA==
X-CSE-MsgGUID: MUVeZs5XSzOVjbXiZcO6mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98139253"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98139253"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:07:29 -0700
X-CSE-ConnectionGUID: ETYbjWbBQBOcu5WgemrfZQ==
X-CSE-MsgGUID: AffvII0+Ra69aPcv6c0C8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="262410762"
Received: from dut4475arls.fm.intel.com ([10.105.8.198])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:07:27 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 08/10] drm/xe: Add infrastructure for debug configfs parameters
Date: Thu, 20 Aug 2026 20:07:25 +0000
Message-ID: <20260820200719.84681-20-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820200719.84681-12-stuart.summers@intel.com>
References: <20260820200719.84681-12-stuart.summers@intel.com>
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

invoked as
'param(type, name, default, validator, visibility, getter, fallback)'
for each debug configfs parameter. The matching backing struct, default
initializer fragment, configfs_attribute objects, show/store handlers,
entries in xe_configfs_debug_attrs[] and the xe_configfs_get_<name>()
accessor are all generated from this single list.

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

The visibility slot is a function-like macro that takes a config_item
and returns whether the attribute should be visible.

The getter and fallback slots drive the generated
xe_configfs_get_<name>(pdev) accessor: getter(dev, name) computes the
return value from a found device group, while fallback is returned
when no device group matches. Most parameters just read the stored
value and repeat their default as the fallback (XE_PARAM_GETTER_READ);
a parameter can override either slot when its accessor needs different
behavior.

The auto-generated handlers, configfs_attribute objects and getters
live in a new xe_configfs_debug_params.c so they do not crowd the
hand-written entries in xe_configfs_debug.c. The attribute objects are
non-static (declared 'extern' in the header) so xe_configfs_debug.c can
splice them into xe_configfs_debug_attrs[] and reference them from
is_visible().

The parameter list is intentionally empty in this patch; converting
existing entries (or adding new ones) is left to follow-up changes so
this infrastructure can be reviewed in isolation.

Note that the expectation is a user will only set these debug
parameters when CONFIG_DRM_XE_DEBUG is set; the entire facility lives
behind that Kconfig.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7,claude-sonnet-5
---
 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/gpu/drm/xe/xe_configfs_debug_params.c | 151 +++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug_params.h | 173 ++++++++++++++++++
 3 files changed, 325 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0b71f311c9c4..2fcde432abc6 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -163,7 +163,7 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
-xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) := xe_configfs_debug.o
+xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) := xe_configfs_debug.o xe_configfs_debug_params.o
 xe-$(CONFIG_CONFIGFS_FS) += $(xe_debug_configfs_obj-y)
 
 # graphics virtualization (SR-IOV) support
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.c b/drivers/gpu/drm/xe/xe_configfs_debug_params.c
new file mode 100644
index 000000000000..00e5ff175c0a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_debug_params.c
@@ -0,0 +1,151 @@
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
+ *
+ * This file also generates the xe_configfs_get_<name>() accessors used
+ * by the rest of the driver to read a parameter's effective value; see
+ * the DOC section below.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/configfs.h>
+#include <linux/kernel.h>
+#include <linux/pci.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+
+#include "xe_configfs_debug_params.h"
+#include "xe_configfs.h"
+
+#define _XE_PARAM_DEFINE_OPS_NUMERIC(_T, _name, _kstrto, _fmt, _validator) \
+static ssize_t _name##_show(struct config_item *item, char *page) \
+{ \
+	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item); \
+	XE_PARAM_TYPE_##_T val; \
+	scoped_guard(mutex, &dev->lock) \
+		val = dev->config.debug.params._name; \
+	return sprintf(page, _fmt "\n", val); \
+} \
+static ssize_t _name##_store(struct config_item *item, const char *page, size_t len) \
+{ \
+	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item); \
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
+	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item); \
+	bool val; \
+	scoped_guard(mutex, &dev->lock) \
+		val = dev->config.debug.params._name; \
+	return sprintf(page, "%d\n", val); \
+} \
+static ssize_t _name##_store(struct config_item *item, const char *page, size_t len) \
+{ \
+	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item); \
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
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator, _vis, _get, _fallback) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DEFINE_OPS)
+
+/*
+ * Define the configfs_attribute objects. These are non-static so they
+ * can be referenced from xe_configfs_debug.c.
+ */
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};
+
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DEFINE_ATTR)
+
+/**
+ * DOC: Debug configfs parameter getters
+ *
+ * xe_configfs_get_<name>() accessors for every parameter declared via
+ * XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH() are generated below from that
+ * same list. Each looks up the &xe_config_group_device matching @pdev,
+ * applies the parameter's "getter" macro to compute the return value,
+ * and drops the reference before returning. If no matching device
+ * group exists, the parameter's "fallback" value is returned instead.
+ *
+ * The CONFIG_DRM_XE_DEBUG=n stub for each of these accessors is
+ * generated separately, in xe_configfs_debug.h.
+ */
+#define _XE_PARAM_DEFINE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	struct xe_config_group_device *dev = xe_configfs_find_group_device(pdev); \
+	XE_PARAM_TYPE_##_T ret; \
+	if (!dev) \
+		return (_fallback); \
+	scoped_guard(mutex, &dev->lock) \
+		ret = _get(dev, _name); \
+	config_group_put(&dev->group); \
+	return ret; \
+}
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DEFINE_GETTER)
+#undef _XE_PARAM_DEFINE_GETTER
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.h b/drivers/gpu/drm/xe/xe_configfs_debug_params.h
new file mode 100644
index 000000000000..954ca4343136
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_debug_params.h
@@ -0,0 +1,173 @@
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
+struct pci_dev;
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
+ * full type range is acceptable.
+ */
+#define XE_PARAM_VALIDATE_NONE(_v)		(0)
+
+/*
+ * Per-parameter getter helpers.
+ *
+ * "getter" is a function-like macro invoked as ``getter(dev, name)``,
+ * where @dev is a non-NULL, already-looked-up &xe_config_group_device;
+ * it expands to the value xe_configfs_get_<name>() should return.
+ * XE_PARAM_GETTER_READ is the default for parameters with no special
+ * behavior: read the value straight out of the stored params struct.
+ *
+ * "fallback" is the value xe_configfs_get_<name>() returns when no
+ * device group is found for the given PCI device, and unconditionally
+ * when CONFIG_DRM_XE_DEBUG is disabled (the generated accessor is then
+ * a static inline stub in xe_configfs_debug.h, with no device group to
+ * look up at all). Because it must be evaluable in both of those
+ * contexts, it must never reference @dev or &xe_config_group_device.
+ * It is usually just the parameter's default value; override it when
+ * the "nothing configured" value differs from the initial stored
+ * value, as with guc_log_level falling back to the guc_log_level
+ * module parameter.
+ */
+#define XE_PARAM_GETTER_READ(_dev, _name)	((_dev)->config.debug.params._name)
+
+/**
+ * XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH - iterate over debug configfs params
+ * @param: function-like macro called as
+ *	   ``param(type, name, default, validator, visibility, getter, fallback)``
+ *
+ *   type:      parameter type token, one of {int, bool, u8, u16, u32, u64}
+ *   name:      parameter name; appears as a configfs file at
+ *              /sys/kernel/config/xe/<bdf>/debug/<name>
+ *   default:   initial/default value of the parameter
+ *   validator: function-like macro ``v -> int`` returning 0 or a negative
+ *              errno; use XE_PARAM_VALIDATE_NONE when no extra constraints
+ *              apply beyond the underlying type's range
+ *   visibility: function-like macro ``item -> bool`` returning true when
+ *              the attribute should be visible; evaluated in
+ *              xe_configfs_debug.c where the platform descriptor is
+ *              accessible; use XE_PARAM_VISIBLE_ALWAYS for unconditional
+ *              visibility
+ *   getter:    function-like macro ``(dev, name) -> value``; use
+ *              XE_PARAM_GETTER_READ unless the accessor needs bespoke
+ *              behavior
+ *   fallback:  value returned when there is no configfs override to
+ *              consult; usually just repeat the default
+ *
+ * To add a new debug-only configfs parameter, append a single line to
+ * this list. The infrastructure auto-generates the struct member,
+ * default initialization, configfs attribute (show/store), inclusion in
+ * the debug attrs[] array, the xe_configfs_get_<name>() accessor (both
+ * its CONFIG_DRM_XE_DEBUG=y implementation and its =n stub), and the
+ * diagnostic dump in dump_custom_dev_config().
+ *
+ * Generated configfs files use the default permissions provided by the
+ * configfs core (read-write); a system administrator can restrict them
+ * at runtime if needed.
+ */
+#define XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(param) \
+	/* No parameters yet - add entries above this line. */
+
+/* Generate the struct that backs all debug params in xe_config_device. */
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;
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
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),
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
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DECLARE_ATTR)
+#undef _XE_PARAM_DECLARE_ATTR
+
+/*
+ * Helper used by xe_configfs_debug.c to splice the auto-generated
+ * attribute pointers into its xe_configfs_debug_attrs[] array.
+ */
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,
+
+/*
+ * Declarations of the per-parameter xe_configfs_get_<name>() accessors.
+ *
+ * The CONFIG_DRM_XE_DEBUG=y implementations are generated alongside the
+ * show/store handlers in xe_configfs_debug_params.c; see the DOC section
+ * there for what they do. xe_configfs_debug.h uses this macro to declare
+ * the matching prototypes for its callers.
+ */
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);
+
+/*
+ * CONFIG_DRM_XE_DEBUG=n stub for xe_configfs_get_<name>(). There is no
+ * configfs facility to consult in this configuration, so the accessor
+ * unconditionally returns its "fallback" value. Used by
+ * xe_configfs_debug.h.
+ */
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}
+
+#endif /* _XE_CONFIGFS_DEBUG_PARAMS_H_ */
-- 
2.43.0

