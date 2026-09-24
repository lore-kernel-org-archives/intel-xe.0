Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B101C9831E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 23:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B885010E236;
	Thu, 24 Sep 2026 23:08:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F42110E213;
 Thu, 24 Sep 2026 23:08:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_new_debug_infrastruct?=
 =?utf-8?q?ure_for_configfs_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Sep 2026 23:08:04 -0000
Message-ID: <179029128412.205806.8751115390385326579@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260924230120.389685-18-stuart.summers@intel.com>
In-Reply-To: <20260924230120.389685-18-stuart.summers@intel.com>
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

Series: Add new debug infrastructure for configfs (rev8)
URL   : https://patchwork.freedesktop.org/series/165879/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 011033f5c0b2b06a03fc1e5010cb3802401eea9a
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Thu Sep 24 23:01:35 2026 +0000

    drm/xe: Add enable_media module parameter
    
    The gt_types_allowed configfs attribute is debug-only, so provide a
    supported way to disable the media GT on production builds. The
    modparam takes precedence over configfs so a single knob is enough to
    guarantee the media GT is left alone.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
    Assisted-by: Copilot:claude-opus-5
+ /mt/dim checkpatch 999838292166407bbe911a41dee23112c49e9d44 drm-intel
ad4a460a5974 drm/xe: Guard configfs attribute reads in getters
0b5eb4619496 drm/xe/configfs: Fix out-of-bounds read in parse_wa_bb_lines()
7da2bf608453 drm/xe/configfs: Copy wa_bb out under the configfs lock
c99a1a4d47a9 drm/xe: Require CONFIGFS_FS
2f81e21ce2ab drm/xe: Invert vram_page_offline configfs attribute
1235318ad1b2 drm/xe: Make survivability_mode configfs attribute a bitmap
23bc29dc0360 drm/xe: Sort xe_config_device fields
2a9a0bb86197 drm/xe: Split out configfs data structures
-:101: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#101: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 123 lines checked
e5ede62d66f4 drm/xe: Add a new debug focused configfs group
-:50: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#50: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 60 lines checked
6363f86708c2 drm/xe: Move debug configfs entries to xe_configfs_debug.c
-:1561: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#1561: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:220:
+	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },

-:1562: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#1562: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:221:
+	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },

-:2297: WARNING:MACRO_ARG_UNUSED: Argument '_item' is not used in function-like macro
#2297: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:956:
+#define XE_PARAM_VISIBLE_ALWAYS(_item) \
+	(true)

total: 0 errors, 3 warnings, 0 checks, 2414 lines checked
e43518a04251 drm/xe/guc: Add configfs support for guc_log_level
ccabeafa49d5 drm/xe/guc: Add support for NPK as a GuC log target
-:180: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#180: FILE: drivers/gpu/drm/xe/xe_configfs_debug.h:53:
 }
+static inline u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)

total: 0 errors, 0 warnings, 1 checks, 182 lines checked
25f6e968d0d5 drm/xe: Add infrastructure for debug configfs parameters
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
+struct configfs_attribute xe_configfs_attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute xe_configfs_attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute xe_configfs_attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute xe_configfs_attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute xe_configfs_attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute xe_configfs_attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:194: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#194: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:114:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+struct configfs_attribute xe_configfs_attr_##_name = {                              \
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
+	extern struct configfs_attribute xe_configfs_attr_##_name;

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute xe_configfs_attr_##_name;

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute xe_configfs_attr_##_name;

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute xe_configfs_attr_##_name;

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute xe_configfs_attr_##_name;

-:376: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute xe_configfs_attr_##_name;

-:376: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#376: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:139:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	extern struct configfs_attribute xe_configfs_attr_##_name;

-:385: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	&xe_configfs_attr_##_name,

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
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	&xe_configfs_attr_##_name,

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	&xe_configfs_attr_##_name,

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	&xe_configfs_attr_##_name,

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	&xe_configfs_attr_##_name,

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	&xe_configfs_attr_##_name,

-:385: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#385: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:148:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val, _vis, _get, _fallback) \
+	&xe_configfs_attr_##_name,

-:396: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#396: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:159:
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

-:396: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#396: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:159:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:396: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#396: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:159:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:396: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#396: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:159:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:396: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#396: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:159:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:396: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#396: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:159:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:396: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#396: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:159:
+#define XE_PARAM_DECLARE_GETTER(_T, _name, _def, _val, _vis, _get, _fallback) \
+	XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev);

-:405: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#405: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:168:
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

-:405: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#405: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:168:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

-:405: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#405: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:168:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

-:405: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#405: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:168:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

-:405: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#405: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:168:
+#define XE_PARAM_DECLARE_GETTER_STUB(_T, _name, _def, _val, _vis, _get, _fallback) \
+static inline XE_PARAM_TYPE_##_T xe_configfs_get_##_name(struct pci_dev *pdev) \
+{ \
+	return _fallback; \
+}

total: 3 errors, 52 warnings, 3 checks, 333 lines checked
d2da286a559b drm/xe: Migrate existing debug configfs entries to params infrastructure
-:48: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:514:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:514:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_vis' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:514:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:514:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:514:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:48: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:514:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:350: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_item' - possible side-effects?
#350: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:845:
+#define XE_PARAM_VISIBLE_VRAM_PAGE_OFFLINE(_item) \
+	(xe_configfs_subgroup_to_group_device(_item)->desc->is_dgfx && \
+	 xe_configfs_subgroup_to_group_device(_item)->desc->platform == XE_CRESCENTISLAND)

-:364: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros starting with if should be enclosed by a do - while loop to avoid possible if/else logic defects
#364: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:852:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &xe_configfs_attr_##_name) \
+		return _vis(item);

-:364: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#364: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:852:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &xe_configfs_attr_##_name) \
+		return _vis(item);

-:364: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#364: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:852:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &xe_configfs_attr_##_name) \
+		return _vis(item);

-:364: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#364: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:852:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &xe_configfs_attr_##_name) \
+		return _vis(item);

-:364: WARNING:MACRO_ARG_UNUSED: Argument '_get' is not used in function-like macro
#364: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:852:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &xe_configfs_attr_##_name) \
+		return _vis(item);

-:364: WARNING:MACRO_ARG_UNUSED: Argument '_fallback' is not used in function-like macro
#364: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:852:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &xe_configfs_attr_##_name) \
+		return _vis(item);

-:364: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#364: FILE: drivers/gpu/drm/xe/xe_configfs_debug.c:852:
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &xe_configfs_attr_##_name) \
+		return _vis(item);

-:457: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_v' - possible side-effects?
#457: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:58:
+#define XE_PARAM_VALIDATE_GUC_LOG_LEVEL(_v) \
+	(((_v) == XE_GUC_LOG_LEVEL_UNSET || \
+	  ((_v) >= 0 && (_v) <= GUC_LOG_LEVEL_MAX)) ? 0 : -EINVAL)

-:470: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#470: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:86:
+#define XE_PARAM_GETTER_GUC_LOG_LEVEL(_dev, _name) \
+	({ typeof((_dev)->config.debug.params._name) __v = (_dev)->config.debug.params._name; \
+	   __v >= 0 ? __v : xe_modparam.guc_log_level; })

-:482: WARNING:LONG_LINE: line length of 202 exceeds 100 columns
#482: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:125:
+	param(int,  guc_log_level,	      XE_GUC_LOG_LEVEL_UNSET,	 XE_PARAM_VALIDATE_GUC_LOG_LEVEL,  XE_PARAM_VISIBLE_ALWAYS,	       XE_PARAM_GETTER_GUC_LOG_LEVEL, xe_modparam.guc_log_level) \

-:483: WARNING:LONG_LINE: line length of 202 exceeds 100 columns
#483: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:126:
+	param(u8,   guc_log_target,	      XE_DEFAULT_GUC_LOG_TARGET, XE_PARAM_VALIDATE_GUC_LOG_TARGET, XE_PARAM_VISIBLE_ALWAYS,	       XE_PARAM_GETTER_READ,	      XE_DEFAULT_GUC_LOG_TARGET) \

-:484: WARNING:LONG_LINE: line length of 181 exceeds 100 columns
#484: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:127:
+	param(bool, enable_multi_queue,	      true,			 XE_PARAM_VALIDATE_NONE,	   XE_PARAM_VISIBLE_ALWAYS,	       XE_PARAM_GETTER_READ,	      true) \

-:485: WARNING:LONG_LINE: line length of 182 exceeds 100 columns
#485: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:128:
+	param(bool, enable_psmi,	      false,			 XE_PARAM_VALIDATE_NONE,	   XE_PARAM_VISIBLE_ALWAYS,	       XE_PARAM_GETTER_READ,	      false) \

-:486: WARNING:LONG_LINE: line length of 179 exceeds 100 columns
#486: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:129:
+	param(bool, enable_vram_page_offline, true,			 XE_PARAM_VALIDATE_NONE,	   XE_PARAM_VISIBLE_VRAM_PAGE_OFFLINE, XE_PARAM_GETTER_READ,	      true)

total: 1 errors, 17 warnings, 3 checks, 481 lines checked
beac1e317101 drm/xe: Taint kernel when debug configfs parameters are set
011033f5c0b2 drm/xe: Add enable_media module parameter


