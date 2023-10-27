Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13520C25B6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06C410E94F;
	Fri, 27 Oct 2023 08:04:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3916D10E94F;
 Fri, 27 Oct 2023 08:04:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 367ECAADD5;
 Fri, 27 Oct 2023 08:04:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 27 Oct 2023 08:04:37 -0000
Message-ID: <169839387721.19710.1821559024068819841@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ba?=
 =?utf-8?q?ckport_display_parameter_patches?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Backport display parameter patches
URL   : https://patchwork.freedesktop.org/series/125671/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ed18a3f2e84008bcc81a15ff8db63790906e2177
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Oct 27 10:59:18 2023 +0300

    fixup! drm/xe/display: Implement display support
    
    We can remove all display parameters from xe params as they are all
    now available in xe_device->display->params.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 76d7314ce7ceb58ee595a0ae1ba45bc99b9e277d drm-intel
39f69f29f Revert "FIXME: drm/i915: xe doesn't have i915_modparams.verbose_state_checks"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'e1253319ab3fb9a6d229e01fc36386d5a464c5ca', maybe rebased or not pulled?
#10: 
This reverts commit e1253319ab3fb9a6d229e01fc36386d5a464c5ca.

total: 0 errors, 1 warnings, 0 checks, 18 lines checked
4ada4a812 drm/i915: convert INTEL_DISPLAY_ENABLED() into a function
80d4a614f drm/i915: separate display runtime info init
291feca3b drm/i915: separate subplatform init and runtime feature init
a24831fde drm/i915/display: Add framework to add parameters specific to display
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:87: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#87: 
new file mode 100644

-:215: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#215: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs_params.c:124:
+intel_display_debugfs_create_int(const char *name, umode_t mode,
+			struct dentry *parent, int *value)

-:224: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#224: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs_params.c:133:
+intel_display_debugfs_create_uint(const char *name, umode_t mode,
+			 struct dentry *parent, unsigned int *value)

-:231: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mode' - possible side-effects?
#231: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs_params.c:140:
+#define _intel_display_param_create_file(parent, name, mode, valp)	\
+	do {								\
+		if (mode)						\
+			_Generic(valp,					\
+				 bool * : debugfs_create_bool,		\
+				 int * : intel_display_debugfs_create_int, \
+				 unsigned int * : intel_display_debugfs_create_uint, \
+				 unsigned long * : debugfs_create_ulong, \
+				 char ** : debugfs_create_str) \
+				(name, mode, parent, valp);		\
+	} while (0)

-:231: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'valp' - possible side-effects?
#231: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs_params.c:140:
+#define _intel_display_param_create_file(parent, name, mode, valp)	\
+	do {								\
+		if (mode)						\
+			_Generic(valp,					\
+				 bool * : debugfs_create_bool,		\
+				 int * : intel_display_debugfs_create_int, \
+				 unsigned int * : intel_display_debugfs_create_uint, \
+				 unsigned long * : debugfs_create_ulong, \
+				 char ** : debugfs_create_str) \
+				(name, mode, parent, valp);		\
+	} while (0)

-:234: CHECK:CAMELCASE: Avoid CamelCase: <_Generic>
#234: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs_params.c:143:
+			_Generic(valp,					\

-:239: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#239: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs_params.c:148:
+				 char ** : debugfs_create_str) \
 				      ^

-:239: ERROR:SPACING: space prohibited after that '*' (ctx:OxW)
#239: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs_params.c:148:
+				 char ** : debugfs_create_str) \
 				       ^

-:263: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#263: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs_params.c:172:
+#define REGISTER(T, x, unused, mode, ...) _intel_display_param_create_file( \
+		dir, #x, mode, &i915->display.params.x);

-:339: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#339: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:9:
+#define intel_display_param_named(name, T, perm, desc) \
+	module_param_named(name, intel_display_modparams.name, T, perm); \
+	MODULE_PARM_DESC(name, desc)

-:342: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#342: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:12:
+#define intel_display_param_named_unsafe(name, T, perm, desc) \
+	module_param_named_unsafe(name, intel_display_modparams.name, T, perm); \
+	MODULE_PARM_DESC(name, desc)

-:351: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#351: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:21:
+};
+/*

-:369: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#369: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:39:
+#define _param_dup(valp)				\
+	_Generic(valp,					\
+		 char ** : _param_dup_charp,		\
+		 default : _param_nop)			\
+		(valp)

-:369: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'valp' - possible side-effects?
#369: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:39:
+#define _param_dup(valp)				\
+	_Generic(valp,					\
+		 char ** : _param_dup_charp,		\
+		 default : _param_nop)			\
+		(valp)

-:371: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#371: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:41:
+		 char ** : _param_dup_charp,		\
 		      ^

-:371: ERROR:SPACING: space prohibited after that '*' (ctx:OxW)
#371: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:41:
+		 char ** : _param_dup_charp,		\
 		       ^

-:372: WARNING:TABSTOP: Statements should start on a tabstop
#372: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:42:
+		 default : _param_nop)			\

-:372: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#372: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:42:
+		 default : _param_nop)			\

-:378: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#378: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:48:
+#define DUP(T, x, ...) _param_dup(&dest->x);

-:378: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#378: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:48:
+#define DUP(T, x, ...) _param_dup(&dest->x);

-:389: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#389: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:59:
+#define _param_free(valp)				\
+	_Generic(valp,					\
+		 char ** : _param_free_charp,		\
+		 default : _param_nop)			\
+		(valp)

-:389: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'valp' - possible side-effects?
#389: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:59:
+#define _param_free(valp)				\
+	_Generic(valp,					\
+		 char ** : _param_free_charp,		\
+		 default : _param_nop)			\
+		(valp)

-:391: CHECK:SPACING: spaces preferred around that '*' (ctx:WxO)
#391: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:61:
+		 char ** : _param_free_charp,		\
 		      ^

-:391: ERROR:SPACING: space prohibited after that '*' (ctx:OxW)
#391: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:61:
+		 char ** : _param_free_charp,		\
 		       ^

-:392: WARNING:TABSTOP: Statements should start on a tabstop
#392: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:62:
+		 default : _param_nop)			\

-:392: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#392: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:62:
+		 default : _param_nop)			\

-:398: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#398: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:68:
+#define FREE(T, x, ...) _param_free(&params->x);

-:398: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#398: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:68:
+#define FREE(T, x, ...) _param_free(&params->x);

-:408: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/i915/display/intel_display_params.h', please use '/*' instead
#408: FILE: drivers/gpu/drm/i915/display/intel_display_params.h:1:
+// SPDX-License-Identifier: MIT

-:408: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#408: FILE: drivers/gpu/drm/i915/display/intel_display_params.h:1:
+// SPDX-License-Identifier: MIT

-:432: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros with multiple statements should be enclosed in a do - while loop
#432: FILE: drivers/gpu/drm/i915/display/intel_display_params.h:25:
+#define MEMBER(T, member, ...) T member;

-:432: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#432: FILE: drivers/gpu/drm/i915/display/intel_display_params.h:25:
+#define MEMBER(T, member, ...) T member;

-:436: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#436: FILE: drivers/gpu/drm/i915/display/intel_display_params.h:29:
+};
+#undef MEMBER

total: 8 errors, 9 warnings, 16 checks, 371 lines checked
e4aae8f15 drm/i915/display: Dump also display parameters
-:66: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#66: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:65:
+#define _param_print(p, driver_name, name, val)			\
+	_Generic(val,						\
+		 bool : _param_print_bool,			\
+		 int : _param_print_int,			\
+		 unsigned int : _param_print_uint,		\
+		 unsigned long : _param_print_ulong,		\
+		 char * : _param_print_charp)(p, driver_name, name, val)

-:67: CHECK:CAMELCASE: Avoid CamelCase: <_Generic>
#67: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:66:
+	_Generic(val,						\

-:83: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#83: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:82:
+#define PRINT(T, x, ...) _param_print(p, i915->drm.driver->name, #x, i915->display.params.x);

total: 0 errors, 1 warnings, 2 checks, 128 lines checked
13c8e7488 drm/i915/display: Move enable_fbc module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:38: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#38: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:31:
+intel_display_param_named_unsafe(enable_fbc, int, 0400,
+	"Enable frame buffer compression for power savings "

total: 0 errors, 1 warnings, 1 checks, 73 lines checked
5fa3e17d4 drm/i915/display: Move psr related module parameters under display
-:34: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#34: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:35:
+intel_display_param_named_unsafe(enable_psr, int, 0400,
+	"Enable PSR "

-:39: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#39: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:40:
+intel_display_param_named(psr_safest_params, bool, 0400,
+	"Replace PSR VBT parameters by the safest and not optimal ones. This "

-:45: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#45: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:46:
+intel_display_param_named_unsafe(enable_psr2_sel_fetch, bool, 0400,
+	"Enable PSR2 selective fetch "

total: 0 errors, 0 warnings, 3 checks, 121 lines checked
5c716d160 drm/i915/display: Move vbt_firmware module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:31:
+intel_display_param_named_unsafe(vbt_firmware, charp, 0400,
+	"Load VBT from specified file under /lib/firmware");

total: 0 errors, 1 warnings, 1 checks, 40 lines checked
aa66126b3 drm/i915/display: Move lvds_channel_mode module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:34:
+intel_display_param_named_unsafe(lvds_channel_mode, int, 0400,
+	 "Specify LVDS channel mode "

total: 0 errors, 1 warnings, 1 checks, 44 lines checked
85b36ac6b drm/i915/display: Move panel_use_ssc module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:38:
+intel_display_param_named_unsafe(panel_use_ssc, int, 0400,
+	"Use Spread Spectrum Clock with panels [LVDS/eDP] "

total: 0 errors, 1 warnings, 1 checks, 44 lines checked
f21b0f881 drm/i915/display: Move vbt_sdvo_panel_type module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:38: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#38: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:42:
+intel_display_param_named_unsafe(vbt_sdvo_panel_type, int, 0400,
+	"Override/Ignore selection of SDVO panel mode in the VBT "

total: 0 errors, 1 warnings, 1 checks, 42 lines checked
aa72f9239 drm/i915/display: Move enable_dc module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:46:
+intel_display_param_named_unsafe(enable_dc, int, 0400,
+	"Enable power-saving display C-states. "

total: 0 errors, 1 warnings, 1 checks, 44 lines checked
76479dedb drm/i915/display: Move enable_dpt module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:51:
+intel_display_param_named_unsafe(enable_dpt, bool, 0400,
+	"Enable display page table (DPT) (default: true)");

total: 0 errors, 1 warnings, 1 checks, 63 lines checked
bb68249b9 drm/i915/display: Move enable_sagv module parameter under display
-:30: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#30: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:54:
+intel_display_param_named_unsafe(enable_sagv, bool, 0400,
+	"Enable system agent voltage/frequency scaling (SAGV) (default: true)");

total: 0 errors, 0 warnings, 1 checks, 49 lines checked
a19474eb1 drm/i915/display: Move disable_power_well module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:57:
+intel_display_param_named_unsafe(disable_power_well, int, 0400,
+	"Disable display power wells when possible "

total: 0 errors, 1 warnings, 1 checks, 77 lines checked
9c6e9e846 drm/i915/display: Move enable_ips module parameter under display
de3c75ba7 drm/i915/display: Move invert_brightness module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:54: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#54: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:63:
+intel_display_param_named_unsafe(invert_brightness, int, 0400,
+	"Invert backlight brightness "

total: 0 errors, 1 warnings, 1 checks, 63 lines checked
610251afe drm/i915/display: Move edp_vswing module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:42: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#42: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:71:
+intel_display_param_named_unsafe(edp_vswing, int, 0400,
+	"Ignore/Override vswing pre-emph table selection from VBT "

total: 0 errors, 1 warnings, 1 checks, 49 lines checked
be8c2a1c4 drm/i915/display: Move enable_dpcd_backlight module parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:76:
+intel_display_param_named(enable_dpcd_backlight, int, 0400,
+	"Enable support for DPCD backlight control"

total: 0 errors, 1 warnings, 1 checks, 50 lines checked
a85bc7d33 drm/i915/display: Move load_detect_test parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:47: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#47: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:80:
+intel_display_param_named_unsafe(load_detect_test, bool, 0400,
+	"Force-enable the VGA load detect code for testing (default:false). "

total: 0 errors, 1 warnings, 1 checks, 50 lines checked
1fdd25a53 drm/i915/display: Move force_reset_modeset_test parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:25: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#25: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:84:
+intel_display_param_named_unsafe(force_reset_modeset_test, bool, 0400,
+	"Force a modeset during gpu reset for testing (default:false). "

total: 0 errors, 1 warnings, 1 checks, 42 lines checked
1381e666f drm/i915/display: Move disable_display parameter under display
-:11: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:37: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#37: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:88:
+intel_display_param_named(disable_display, bool, 0400,
+	"Disable display (default: false)");

total: 0 errors, 1 warnings, 1 checks, 39 lines checked
448ace7e1 drm/i915/display: Use device parameters instead of module in I915_STATE_WARN
-:42: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#42: FILE: drivers/gpu/drm/i915/i915_params.c:97:
+i915_param_named(verbose_state_checks, bool, 0400,
 	"Enable verbose logs (ie. WARN_ON()) in case of unexpected hw state conditions.");

total: 0 errors, 0 warnings, 1 checks, 17 lines checked
05e3fa9d4 drm/i915/display: Move verbose_state_checks under display
-:42: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#42: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:91:
+intel_display_param_named(verbose_state_checks, bool, 0400,
+	"Enable verbose logs (ie. WARN_ON()) in case of unexpected hw state conditions.");

total: 0 errors, 0 warnings, 1 checks, 40 lines checked
4120063a8 drm/i915/display: Move nuclear_pageflip under display
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:37: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#37: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:94:
+intel_display_param_named_unsafe(nuclear_pageflip, bool, 0400,
+	"Force enable atomic functionality on platforms that don't have full support yet.");

total: 0 errors, 1 warnings, 1 checks, 40 lines checked
2d98f1d8a drm/i915/display: Move enable_dp_mst under display
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:24: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#24: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:97:
+intel_display_param_named_unsafe(enable_dp_mst, bool, 0400,
+	"Enable multi-stream transport (MST) for new DisplayPort sinks. (default: true)");

total: 0 errors, 1 warnings, 1 checks, 55 lines checked
954147280 fixup! drm/xe/display: Implement display support
dc923c86e fixup! drm/xe/display: Implement display support
fa7f8ac73 fixup! drm/xe/display: Implement display support
ed18a3f2e fixup! drm/xe/display: Implement display support


