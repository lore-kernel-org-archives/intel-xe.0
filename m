Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CA6C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 22:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBD510E514;
	Wed, 22 Jul 2026 22:25:27 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491F710E4F4;
 Wed, 22 Jul 2026 22:25:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_new_debug_infrastruct?=
 =?utf-8?q?ure_for_configfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jul 2026 22:25:26 -0000
Message-ID: <178475912627.218318.15618654634712127353@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722214656.107936-11-stuart.summers@intel.com>
In-Reply-To: <20260722214656.107936-11-stuart.summers@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Add new debug infrastructure for configfs (rev2)
URL   : https://patchwork.freedesktop.org/series/165879/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 138b6c7a2b2cb072fa5c05f2056333bbd6fbae89
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Wed Jul 22 21:47:05 2026 +0000

    drm/xe: Taint kernel when debug configfs parameters are set
    
    Writing any debug configfs attribute indicates the system is running
    in a non-standard configuration that may mask bugs or produce misleading
    behaviour. Taint the kernel with TAINT_TEST on each successful write so
    bug reports clearly reflect when debug settings were active.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
    Assisted-by: Copilot:claude-sonnet-4.6,claude-sonnet-5
+ /mt/dim checkpatch aff95d2d4b516f1618e3fb1cdb5850b6e1b19bb9 drm-intel
a30ee3f5fea7 drm/xe: Sort xe_config_device fields
-:834: WARNING:LINE_SPACING: Missing a blank line after declarations
#834: FILE: drivers/gpu/drm/xe/xe_configfs.c:862:
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 1266 lines checked
220c52c39d90 drm/xe: Split out configfs data structures
-:100: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#100: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 122 lines checked
f6b8d8661e1a drm/xe: Add a new debug focused configfs group
-:50: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#50: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
10811c9297b8 drm/xe: Move debug configfs entries to xe_configfs_debug.c
-:1495: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#1495: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:219:
+	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },

-:1496: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#1496: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:220:
+	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },

-:2198: WARNING:MACRO_ARG_UNUSED: Argument '_item' is not used in function-like macro
#2198: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:922:
+#define XE_PARAM_VISIBLE_ALWAYS(_item) \
+	(true)

-:2200: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_item' - possible side-effects?
#2200: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:924:
+#define XE_PARAM_VISIBLE_SURVIVABILITY(_item) \
+	(xe_configfs_subgroup_to_group_device(_item)->desc->is_dgfx && \
+	 xe_configfs_subgroup_to_group_device(_item)->desc->platform >= XE_BATTLEMAGE)

total: 0 errors, 3 warnings, 1 checks, 2324 lines checked
89adee2120e3 drm/xe/guc: Add configfs support for guc_log_level
7b6ee311894e drm/xe/guc: Add support for NPK as a GuC log target
-:177: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#177: FILE: drivers/gpu/drm/xe/xe_configfs_debug.h:53:
 }
+static inline u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)

total: 0 errors, 0 warnings, 1 checks, 179 lines checked
bf629054f4b4 drm/xe: Add infrastructure for debug configfs parameters
-:76: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#76: 
new file mode 100644

-:124: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#124: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:44:
+#define _XE_PARAM_DEFINE_OPS_NUMERIC(_T, _name, _kstrto, _fmt, _validator) \
+static ssize_t _name##_show(struct config_item *item, char *page) \
+{ \
+	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item); \
+	return sprintf(page, _fmt "\n", dev->debug.params._name); \
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

-:157: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#157: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:77:
+#define _XE_PARAM_DEFINE_OPS_bool(_name, _validator) \
+static ssize_t _name##_show(struct config_item *item, char *page) \
+{ \
+	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item); \
+	return sprintf(page, "%d\n", dev->debug.params._name); \
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

-:180: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#180: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:100:
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator, _vis, _get, _fallback) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)

-:180: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#180: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:100:
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator, _vis, _get, _fallback) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)

-:180: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#180: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:100:
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator, _vis, _get, _fallback) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)

-:180: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#180: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:100:
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator, _vis, _get, _fallback) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)

-:188: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#188: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:108:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:188: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#188: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:108:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:188: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#188: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:108:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:188: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#188: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:108:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:188: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#188: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:108:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:188: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#188: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:108:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:188: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#188: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:108:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:212: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#212: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:132:
+#define _XE_PARAM_DEFINE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	struct xe_config_group_device *dev = xe_configfs_find_group_device(pdev); \
+	XE_PARAM_TYPE_##_T ret; \
+	if (!dev) \
+		return (_fallback); \
+	ret = _get(dev, _name); \
+	config_group_put(&dev->group); \
+	return ret; \
+}

-:212: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#212: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:132:
+#define _XE_PARAM_DEFINE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	struct xe_config_group_device *dev = xe_configfs_find_group_device(pdev); \
+	XE_PARAM_TYPE_##_T ret; \
+	if (!dev) \
+		return (_fallback); \
+	ret = _get(dev, _name); \
+	config_group_put(&dev->group); \
+	return ret; \
+}

-:212: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#212: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:132:
+#define _XE_PARAM_DEFINE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	struct xe_config_group_device *dev = xe_configfs_find_group_device(pdev); \
+	XE_PARAM_TYPE_##_T ret; \
+	if (!dev) \
+		return (_fallback); \
+	ret = _get(dev, _name); \
+	config_group_put(&dev->group); \
+	return ret; \
+}

-:223: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#223: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:143:
+}
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DEFINE_GETTER)

-:280: WARNING:MACRO_ARG_UNUSED: Argument '_v' is not used in function-like macro
#280: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:50:
+#define XE_PARAM_VALIDATE_NONE(_v)		(0)

-:342: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#342: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:342: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#342: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:342: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#342: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:342: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#342: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:342: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#342: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:342: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#342: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:342: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#342: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:356: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#356: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),

-:356: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#356: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),

-:356: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#356: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),

-:356: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#356: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),

-:356: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#356: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),

-:369: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#369: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:369: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#369: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:369: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#369: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:369: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#369: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:369: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#369: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:369: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#369: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:369: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#369: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:378: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#378: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:378: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#378: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:378: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#378: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:378: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#378: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:378: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#378: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:378: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#378: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:378: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#378: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:388: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#388: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:388: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#388: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:388: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#388: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:388: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#388: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:388: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#388: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:388: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#388: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:388: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#388: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:397: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#397: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:167:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:397: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#397: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:167:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

-:397: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#397: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:167:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

-:397: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#397: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:167:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

-:397: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#397: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:167:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

total: 2 errors, 52 warnings, 3 checks, 325 lines checked
18d3da64ce82 drm/xe: Migrate existing debug configfs entries to params infrastructure
-:48: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:421:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:421:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:421:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:421:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:421:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:48: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:421:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:332: CHECK:LINE_SPACING: Please don't use multiple blank lines
#332: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:803:
 
+

-:346: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros starting with if should be enclosed by a do - while loop to avoid possible if/else logic defects
#346: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:822:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:346: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#346: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:822:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:346: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#346: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:822:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:346: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#346: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:822:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:346: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#346: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:822:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:346: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#346: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:822:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:346: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#346: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:822:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:439: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_v' - possible side-effects?
#439: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:58:
+#define XE_PARAM_VALIDATE_GUC_LOG_LEVEL(_v) \
+	((((_v) < 0) || ((_v) <= GUC_LOG_LEVEL_MAX)) ? 0 : -EINVAL)

-:451: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#451: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:85:
+#define XE_PARAM_GETTER_GUC_LOG_LEVEL(_dev, _name) \
+	({ typeof((_dev)->config.debug.params._name) __v = (_dev)->config.debug.params._name; \
+	   __v >= 0 ? __v : xe_modparam.guc_log_level; })

-:463: WARNING:LONG_LINE: line length of 192 exceeds 100 columns
#463: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:124:
+	param(int,  guc_log_level,      XE_GUC_LOG_LEVEL_UNSET,    XE_PARAM_VALIDATE_GUC_LOG_LEVEL,  XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_GUC_LOG_LEVEL, xe_modparam.guc_log_level) \

-:464: WARNING:LONG_LINE: line length of 192 exceeds 100 columns
#464: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:125:
+	param(u8,   guc_log_target,     XE_DEFAULT_GUC_LOG_TARGET, XE_PARAM_VALIDATE_GUC_LOG_TARGET, XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_READ,          XE_DEFAULT_GUC_LOG_TARGET) \

-:465: WARNING:LONG_LINE: line length of 171 exceeds 100 columns
#465: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+	param(bool, enable_multi_queue, true,                      XE_PARAM_VALIDATE_NONE,           XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_READ,          true) \

-:466: WARNING:LONG_LINE: line length of 172 exceeds 100 columns
#466: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:127:
+	param(bool, enable_psmi,        false,                     XE_PARAM_VALIDATE_NONE,           XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_READ,          false) \

-:467: WARNING:LONG_LINE: line length of 170 exceeds 100 columns
#467: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:128:
+	param(bool, survivability_mode, false,                     XE_PARAM_VALIDATE_NONE,           XE_PARAM_VISIBLE_SURVIVABILITY, XE_PARAM_GETTER_READ,          false)

total: 1 errors, 17 warnings, 3 checks, 462 lines checked
138b6c7a2b2c drm/xe: Taint kernel when debug configfs parameters are set


