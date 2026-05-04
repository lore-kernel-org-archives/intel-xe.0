Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A33BCD3423
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 05:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0C910E373;
	Mon,  4 May 2026 05:30:52 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6094E10E36F;
 Mon,  4 May 2026 05:30:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_new_debug_infrastruct?=
 =?utf-8?q?ure_for_configfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 May 2026 05:30:51 -0000
Message-ID: <177787265139.33916.4602625594088075973@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504044348.209625-1-stuart.summers@intel.com>
In-Reply-To: <20260504044348.209625-1-stuart.summers@intel.com>
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

Series: Add new debug infrastructure for configfs
URL   : https://patchwork.freedesktop.org/series/165879/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b22dcaff1c2ae70ee14a72f3a51f0ae7ab2e49e4
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Mon May 4 04:43:46 2026 +0000

    drm/xe: Migrate existing debug configfs entries to params infrastructure
    
    Move the four existing debug configfs entries whose semantics fit the
    generic show/store template into the new parameter list:
    
      - enable_psmi                (bool)
      - enable_survivability_mode  (bool)
      - guc_log_level              (int, validated against GUC_LOG_LEVEL_MAX,
                                    accepting any negative value as "unset")
      - guc_log_target             (u8,  validated against GUC_LOG_TARGET_MAX)
    
    guc_log_level keeps its module-parameter fallback in the public getter
    xe_configfs_get_guc_log_level(): a negative value stored in configfs
    (the default is %XE_GUC_LOG_LEVEL_UNSET, -1) means "use the modparam";
    only a value >= 0 overrides it. The validator therefore allows any
    negative value through so the sentinel can be written back from
    userspace.
    
    The remaining hand-written entries (ctx_restore_mid_bb,
    ctx_restore_post_bb, engines_allowed, gt_types_allowed) all have
    custom string parsing or per-class indexing that does not fit the
    generic template and stay as-is.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
    Assisted-by: Copilot:claude-opus-4.7
+ /mt/dim checkpatch 59b0faed1d239bc0f433999671c2d195bd62f9b8 drm-intel
a43da1486476 drm/xe: Rename survivability_mode to enable_survivability_mode
bcb4520c13a0 drm/xe: Sort xe_config_device fields and defaults alphabetically
1b67b92aeb7d drm/xe: Split out configfs data structures
-:270: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#270: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 291 lines checked
7b8d7a78f666 drm/xe: Add a new debug focused configfs group
-:40: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#40: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 57 lines checked
f156c79f9fce drm/xe: Move debug configfs entries to xe_configfs_debug.c
fab710158ad5 drm/xe/guc: Add configfs support for guc_log_level
8ac835cbc4de drm/xe/guc: Add support for NPK as a GuC log target
0d59bf681606 drm/xe: Add infrastructure for debug configfs parameters
-:80: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#80: FILE: drivers/gpu/drm/xe/xe_configfs.c:439:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:80: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#80: FILE: drivers/gpu/drm/xe/xe_configfs.c:439:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:80: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#80: FILE: drivers/gpu/drm/xe/xe_configfs.c:439:
+#define _XE_PARAM_DUMP(_T, _name, _def, _val) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);

-:108: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#108: 
new file mode 100644

-:151: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#151: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:39:
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

-:184: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_name' - possible side-effects?
#184: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:72:
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

-:207: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#207: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:95:
+#define _XE_PARAM_DEFINE_OPS(_T, _name, _def, _validator) \
+	_XE_PARAM_DEFINE_OPS_##_T(_name, _validator)

-:215: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#215: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:103:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:215: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#215: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:103:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:215: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#215: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:103:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:215: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#215: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.c:103:
+#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val) \
+struct configfs_attribute attr_##_name = {                              \
+	.ca_name	= __stringify(_name),                           \
+	.ca_owner	= THIS_MODULE,                                  \
+	.ca_mode	= 0644,                                         \
+	.show		= _name##_show,                                 \
+	.store		= _name##_store,                                \
+};

-:280: WARNING:MACRO_ARG_UNUSED: Argument '_v' is not used in function-like macro
#280: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:50:
+#define XE_PARAM_VALIDATE_NONE(_v)		(0)

-:309: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#309: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:79:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val) XE_PARAM_TYPE_##_T _name;

-:309: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#309: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:79:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val) XE_PARAM_TYPE_##_T _name;

-:309: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#309: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:79:
+#define _XE_PARAM_MEMBER(_T, _name, _def, _val) XE_PARAM_TYPE_##_T _name;

-:323: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#323: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:93:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val)	._name = (_def),

-:323: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#323: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:93:
+#define _XE_PARAM_DEFAULT_INIT(_T, _name, _def, _val)	._name = (_def),

-:336: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#336: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:106:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val) \
+	extern struct configfs_attribute attr_##_name;

-:336: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#336: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:106:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val) \
+	extern struct configfs_attribute attr_##_name;

-:336: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#336: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:106:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val) \
+	extern struct configfs_attribute attr_##_name;

-:336: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#336: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:106:
+#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val) \
+	extern struct configfs_attribute attr_##_name;

-:345: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#345: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:115:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val) &attr_##_name,

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

-:345: WARNING:MACRO_ARG_UNUSED: Argument '_T' is not used in function-like macro
#345: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:115:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val) &attr_##_name,

-:345: WARNING:MACRO_ARG_UNUSED: Argument '_def' is not used in function-like macro
#345: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:115:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val) &attr_##_name,

-:345: WARNING:MACRO_ARG_UNUSED: Argument '_val' is not used in function-like macro
#345: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:115:
+#define XE_PARAM_ATTR_PTR(_T, _name, _def, _val) &attr_##_name,

total: 1 errors, 22 warnings, 2 checks, 284 lines checked
b22dcaff1c2a drm/xe: Migrate existing debug configfs entries to params infrastructure
-:288: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_v' - possible side-effects?
#288: FILE: drivers/gpu/drm/xe/xe_configfs_debug_params.h:54:
+#define XE_PARAM_VALIDATE_GUC_LOG_LEVEL(_v) \
+	((((_v) < 0) || ((_v) <= GUC_LOG_LEVEL_MAX)) ? 0 : -EINVAL)

total: 0 errors, 0 warnings, 1 checks, 264 lines checked


