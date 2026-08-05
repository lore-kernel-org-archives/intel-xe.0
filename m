Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD9BC55ABF
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 23:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD7289CAC;
	Wed,  5 Aug 2026 23:59:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E049589CAC;
 Wed,  5 Aug 2026 23:59:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_new_debug_infrastruct?=
 =?utf-8?q?ure_for_configfs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 23:59:10 -0000
Message-ID: <178597435091.23279.11605106476246033031@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805232021.337103-12-stuart.summers@intel.com>
In-Reply-To: <20260805232021.337103-12-stuart.summers@intel.com>
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

Series: Add new debug infrastructure for configfs (rev4)
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
commit d0a674d2a49d70b2e9307fbbd61332ab107c8e56
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Wed Aug 5 23:20:31 2026 +0000

    drm/xe: Taint kernel when debug configfs parameters are set
    
    Writing any debug configfs attribute indicates the system is running
    in a non-standard configuration that may mask bugs or produce misleading
    behaviour. Taint the kernel with TAINT_TEST on each successful write so
    bug reports clearly reflect when debug settings were active.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
    Assisted-by: Copilot:claude-sonnet-4.6,claude-sonnet-5
+ /mt/dim checkpatch caffd4cac0c4c2696d90c76d21f81342c288784e drm-intel
e5d0c8e0fd11 drm/xe: Guard configfs attribute reads in getters
fe56e2e81997 drm/xe: Sort xe_config_device fields
-:825: WARNING:LINE_SPACING: Missing a blank line after declarations
#825: FILE: drivers/gpu/drm/xe/xe_configfs.c:868:
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 1269 lines checked
f5c88fbdb9aa drm/xe: Split out configfs data structures
-:100: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#100: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 122 lines checked
3fb389920a97 drm/xe: Add a new debug focused configfs group
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
6937e102327b drm/xe: Move debug configfs entries to xe_configfs_debug.c
-:1504: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#1504: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:219:
+	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },

-:1505: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#1505: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:220:
+	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },

-:2216: WARNING:MACRO_ARG_UNUSED: Argument '_item' is not used in function-like macro
#2216: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:931:
+#define XE_PARAM_VISIBLE_ALWAYS(_item) \
+	(true)

-:2218: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_item' - possible side-effects?
#2218: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:933:
+#define XE_PARAM_VISIBLE_SURVIVABILITY(_item) \
+	(xe_configfs_subgroup_to_group_device(_item)->desc->is_dgfx && \
+	 xe_configfs_subgroup_to_group_device(_item)->desc->platform >= XE_BATTLEMAGE)

total: 0 errors, 3 warnings, 1 checks, 2338 lines checked
e438960160bd drm/xe/guc: Add configfs support for guc_log_level
95933951daf3 drm/xe/guc: Add support for NPK as a GuC log target
-:178: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#178: FILE: drivers/gpu/drm/xe/xe_configfs_debug.h:53:
 }
+static inline u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)

total: 0 errors, 0 warnings, 1 checks, 180 lines checked
b523aea24b80 drm/xe: Add infrastructure for debug configfs parameters
-:76: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#76: 
new file mode 100644

-:124: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#124: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:44:
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

-:160: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#160: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:80:
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

-:186: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#186: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:106:
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator, _vis, _get, _fallback) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)

-:186: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#186: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:106:
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator, _vis, _get, _fallback) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)

-:186: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#186: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:106:
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator, _vis, _get, _fallback) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)

-:186: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#186: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:106:
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator, _vis, _get, _fallback) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:218: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#218: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:138:
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

-:218: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#218: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:138:
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

-:218: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#218: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:138:
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

-:218: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#218: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:138:
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

-:230: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#230: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:150:
+}
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DEFINE_GETTER)

-:287: WARNING:MACRO_ARG_UNUSED: Argument '_v' is not used in function-like macro
#287: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:50:
+#define XE_PARAM_VALIDATE_NONE(_v)		(0)

-:349: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#349: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
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

-:349: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#349: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:349: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#349: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:349: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#349: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:349: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#349: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:349: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#349: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:349: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#349: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:112:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;

-:363: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#363: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),

-:363: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#363: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),

-:363: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#363: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),

-:363: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#363: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),

-:363: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#363: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val, _vis, _get, _fallback)	._name = (_def),

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:376: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute attr_##_name;

-:385: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
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

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) &attr_##_name,

-:395: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#395: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
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

-:395: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#395: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:395: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#395: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:395: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#395: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:395: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#395: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:395: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#395: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:395: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#395: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:158:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:404: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#404: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:167:
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

-:404: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#404: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:167:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

-:404: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#404: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:167:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

-:404: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#404: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:167:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

-:404: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#404: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:167:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

total: 3 errors, 52 warnings, 3 checks, 332 lines checked
ba801810ef87 drm/xe: Migrate existing debug configfs entries to params infrastructure
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

-:338: CHECK:LINE_SPACING: Please don't use multiple blank lines
#338: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:809:
 
+

-:352: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros starting with if should be enclosed by a do - while loop to avoid possible if/else logic defects
#352: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:828:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:352: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#352: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:828:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:352: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#352: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:828:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:352: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#352: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:828:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:352: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#352: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:828:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:352: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#352: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:828:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:352: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#352: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:828:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &attr_##_name) \
+		return _vis(item);

-:445: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_v' - possible side-effects?
#445: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:58:
+#define XE_PARAM_VALIDATE_GUC_LOG_LEVEL(_v) \
+	(((_v) == XE_GUC_LOG_LEVEL_UNSET || \
+	  ((_v) >= 0 && (_v) <= GUC_LOG_LEVEL_MAX)) ? 0 : -EINVAL)

-:458: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#458: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:86:
+#define XE_PARAM_GETTER_GUC_LOG_LEVEL(_dev, _name) \
+	({ typeof((_dev)->config.debug.params._name) __v = (_dev)->config.debug.params._name; \
+	   __v >= 0 ? __v : xe_modparam.guc_log_level; })

-:470: WARNING:LONG_LINE: line length of 192 exceeds 100 columns
#470: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:125:
+	param(int,  guc_log_level,      XE_GUC_LOG_LEVEL_UNSET,    XE_PARAM_VALIDATE_GUC_LOG_LEVEL,  XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_GUC_LOG_LEVEL, xe_modparam.guc_log_level) \

-:471: WARNING:LONG_LINE: line length of 192 exceeds 100 columns
#471: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+	param(u8,   guc_log_target,     XE_DEFAULT_GUC_LOG_TARGET, XE_PARAM_VALIDATE_GUC_LOG_TARGET, XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_READ,          XE_DEFAULT_GUC_LOG_TARGET) \

-:472: WARNING:LONG_LINE: line length of 171 exceeds 100 columns
#472: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:127:
+	param(bool, enable_multi_queue, true,                      XE_PARAM_VALIDATE_NONE,           XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_READ,          true) \

-:473: WARNING:LONG_LINE: line length of 172 exceeds 100 columns
#473: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:128:
+	param(bool, enable_psmi,        false,                     XE_PARAM_VALIDATE_NONE,           XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_READ,          false) \

-:474: WARNING:LONG_LINE: line length of 170 exceeds 100 columns
#474: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:129:
+	param(bool, survivability_mode, false,                     XE_PARAM_VALIDATE_NONE,           XE_PARAM_VISIBLE_SURVIVABILITY, XE_PARAM_GETTER_READ,          false)

total: 1 errors, 17 warnings, 3 checks, 469 lines checked
d0a674d2a49d drm/xe: Taint kernel when debug configfs parameters are set


