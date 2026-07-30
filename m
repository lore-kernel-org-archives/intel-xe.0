Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721CAC55164
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F8910EFB3;
	Thu, 30 Jul 2026 15:40:30 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8426B10EFB2;
 Thu, 30 Jul 2026 15:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_structured_?=
 =?utf-8?q?SIGID_error_logging_infrastructure_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 15:40:29 -0000
Message-ID: <178542602951.5682.12506423110217575153@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260730152121.576-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Add structured SIGID error logging infrastructure (rev3)
URL   : https://patchwork.freedesktop.org/series/171022/
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
commit 134863cf20fd6c0391fd8f7ea3dca2b4c6d42d8a
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jul 30 17:21:19 2026 +0200

    drm/xe/pci: Report 'cannot re-enable' error using SIGID
    
    Report 'cannot re-enable PCI device' error using xe_log() helper.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Riana Tauro <riana.tauro@intel.com>
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 5e24f68d311764bf343f9def49b752b509dfd5fd drm-intel
1104637ebb9d drm/xe: Introduce xe_any helpers
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

-:39: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#39: FILE: drivers/gpu/drm/xe/xe_any.h:11:
+#define __xe_any_to_self_assoc(type, any) \
+	const type * : (any), \
+	type * : (any)

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

-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#39: FILE: drivers/gpu/drm/xe/xe_any.h:11:
+#define __xe_any_to_self_assoc(type, any) \
+	const type * : (any), \
+	type * : (any)

-:50: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#50: FILE: drivers/gpu/drm/xe/xe_any.h:22:
+#define xe_any_if_type(any, type)						\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(type, (any)),				\
+		 default : NULL)

-:53: WARNING:TABSTOP: Statements should start on a tabstop
#53: FILE: drivers/gpu/drm/xe/xe_any.h:25:
+		 default : NULL)

-:53: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#53: FILE: drivers/gpu/drm/xe/xe_any.h:25:
+		 default : NULL)

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'const' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_any.h:59:
+#define __xe_any_to_other_assoc(const, from, other, p) \
+	const struct from * : __##from##_to_##other((const struct from *)(p))

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'from' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_any.h:59:
+#define __xe_any_to_other_assoc(const, from, other, p) \
+	const struct from * : __##from##_to_##other((const struct from *)(p))

-:87: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'from' may be better as '(from)' to avoid precedence issues
#87: FILE: drivers/gpu/drm/xe/xe_any.h:59:
+#define __xe_any_to_other_assoc(const, from, other, p) \
+	const struct from * : __##from##_to_##other((const struct from *)(p))

-:103: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#103: FILE: drivers/gpu/drm/xe/xe_any.h:75:
+#define xe_any_to_xe(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct xe_device, (any)),		\
+		 __xe_any_to_other_assoc(/* */, xe_tile, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(const, xe_tile, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(/* */, xe_gt, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(const, xe_gt, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(, drm_device, xe_device, (any)),	\
+		 __xe_any_to_other_assoc(, pci_dev, xe_device, (any)),		\
+		 __xe_any_to_other_assoc(, device, xe_device, (any)))

-:120: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#120: FILE: drivers/gpu/drm/xe/xe_any.h:92:
+#define xe_any_to_drm(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct drm_device, (any)),		\
+		 default : &xe_any_to_xe(any)->drm)

-:123: WARNING:TABSTOP: Statements should start on a tabstop
#123: FILE: drivers/gpu/drm/xe/xe_any.h:95:
+		 default : &xe_any_to_xe(any)->drm)

-:123: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#123: FILE: drivers/gpu/drm/xe/xe_any.h:95:
+		 default : &xe_any_to_xe(any)->drm)

-:131: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#131: FILE: drivers/gpu/drm/xe/xe_any.h:103:
+#define xe_any_to_dev(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct device, (any)),			\
+		 __xe_any_to_other_assoc(, pci_dev, device, (any)),		\
+		 default : xe_any_to_drm(any)->dev)

-:135: WARNING:TABSTOP: Statements should start on a tabstop
#135: FILE: drivers/gpu/drm/xe/xe_any.h:107:
+		 default : xe_any_to_drm(any)->dev)

-:135: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#135: FILE: drivers/gpu/drm/xe/xe_any.h:107:
+		 default : xe_any_to_drm(any)->dev)

-:143: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#143: FILE: drivers/gpu/drm/xe/xe_any.h:115:
+#define xe_any_to_pdev(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct pci_dev, (any)),			\
+		 default : to_pci_dev(xe_any_to_dev(any)))

-:146: WARNING:TABSTOP: Statements should start on a tabstop
#146: FILE: drivers/gpu/drm/xe/xe_any.h:118:
+		 default : to_pci_dev(xe_any_to_dev(any)))

-:146: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#146: FILE: drivers/gpu/drm/xe/xe_any.h:118:
+		 default : to_pci_dev(xe_any_to_dev(any)))

-:157: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#157: FILE: drivers/gpu/drm/xe/xe_any.h:129:
+#define xe_any_id(any)								\
+	_Generic((any),								\
+		 __xe_any_to_other_assoc(/* */, xe_tile, id, (any)),		\
+		 __xe_any_to_other_assoc(const, xe_tile, id, (any)),		\
+		 __xe_any_to_other_assoc(/* */, xe_gt, id, (any)),		\
+		 __xe_any_to_other_assoc(const, xe_gt, id, (any)),		\
+		 default : 0)

-:163: WARNING:TABSTOP: Statements should start on a tabstop
#163: FILE: drivers/gpu/drm/xe/xe_any.h:135:
+		 default : 0)

-:163: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#163: FILE: drivers/gpu/drm/xe/xe_any.h:135:
+		 default : 0)

total: 6 errors, 6 warnings, 10 checks, 137 lines checked
2e9b4150b3a0 drm/xe/log: Add structured SIGID error logging infrastructure
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 363 lines checked
01c2ec090967 drm/xe/log: Introduce structured component/location identifiers
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

-:152: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#152: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:131:
+#define DEFINE_XE_LOG_COMPONENTS(define) \
+	/* */									\
+	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
+	define(SYSTEM, 2, DRM, SW, "DRM")					\
+	/* */									\
+	define(DRIVER, 1, XE, SW, "Xe Driver")					\
+	define(DRIVER, 2, PROBE, PROBE, "Driver Initialization")		\
+	define(DRIVER, 3, WEDGED, WEDGED, "Device Malfunction")			\
+	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
+	define(DRIVER, 5, WA, SW, "Workarounds")				\
+	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
+	/* */									\
+	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
+	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
+	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
+	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
+	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
+	/* */									\
+	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
+	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
+	define(DRIVER_FEATURE, 3, SURVIVABILITY, SURVIVABILITY, "Survivability") \
+	define(DRIVER_FEATURE, 4, RAS, SW, "Reliability, Accessibility, Serviceability") \
+	/* */									\
+	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
+	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
+	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
+	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
+	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
+	/* eod */

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

-:152: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#152: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:131:
+#define DEFINE_XE_LOG_COMPONENTS(define) \
+	/* */									\
+	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
+	define(SYSTEM, 2, DRM, SW, "DRM")					\
+	/* */									\
+	define(DRIVER, 1, XE, SW, "Xe Driver")					\
+	define(DRIVER, 2, PROBE, PROBE, "Driver Initialization")		\
+	define(DRIVER, 3, WEDGED, WEDGED, "Device Malfunction")			\
+	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
+	define(DRIVER, 5, WA, SW, "Workarounds")				\
+	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
+	/* */									\
+	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
+	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
+	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
+	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
+	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
+	/* */									\
+	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
+	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
+	define(DRIVER_FEATURE, 3, SURVIVABILITY, SURVIVABILITY, "Survivability") \
+	define(DRIVER_FEATURE, 4, RAS, SW, "Reliability, Accessibility, Serviceability") \
+	/* */									\
+	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
+	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
+	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
+	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
+	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
+	/* eod */

-:187: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#187: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:166:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

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

-:187: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#187: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:166:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

-:187: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#187: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:166:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

-:200: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#200: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:179:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

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

-:200: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#200: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:179:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:200: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#200: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:179:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:200: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#200: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:179:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

total: 3 errors, 6 warnings, 1 checks, 186 lines checked
a71ac3694436 drm/xe/log: Add component/location decorations to dmesg
-:40: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#40: FILE: drivers/gpu/drm/xe/xe_log.c:26:
+#define MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(_CLASS) \
+	case XE_LOG_COMPONENT_CLASS_##_CLASS: return #_CLASS "? ";

-:55: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#55: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:55: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#55: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:55: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#55: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:55: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#55: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:55: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#55: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

total: 0 errors, 6 warnings, 0 checks, 126 lines checked
e0ddd154a05d drm/xe/log: Add SIGID log helpers for severity
8196ff7a09c5 drm/xe/log: Add SIGID log helpers for location
-:44: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#44: FILE: drivers/gpu/drm/xe/xe_log.h:49:
+#define xe_log_location(any) \
+	PREP_XE_LOG_LOCATION(xe_log_location_type(any), xe_any_id(any))

total: 0 errors, 0 warnings, 1 checks, 47 lines checked
72c346c194d9 drm/xe/log: Add SIGID log helpers for location & severity
0fe82a8702af drm/xe/log: Add SIGID log helpers for components
6c4987878ea9 drm/xe/log: Add SIGID log helpers for errno-only
5828bebeeab1 drm/xe/log: Add hardware error signatures
94da8c283f42 drm/xe/log: Extend components list with hardware items
-:23: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#23: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:135:
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
 	/* */									\
 	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
 	define(SYSTEM, 2, DRM, SW, "DRM")					\

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

-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#23: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:135:
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
 	/* */									\
 	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
 	define(SYSTEM, 2, DRM, SW, "DRM")					\

-:32: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#32: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:164:
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	/*     HARDWARE, 3, RESERVED */						\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\
 	/* eod */

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

-:32: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#32: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:164:
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	/*     HARDWARE, 3, RESERVED */						\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\
 	/* eod */

total: 2 errors, 0 warnings, 2 checks, 24 lines checked
d2d2d640a48f drm/xe/ras: Check RAS and LOG component definitions
06331dd4fcaf drm/xe/kunit: Setup driver data in the test device
fa4405457be7 drm/xe/tests: Add Kunit tests for xe_log
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

-:47: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#47: FILE: drivers/gpu/drm/xe/tests/xe_log_kunit.c:28:
+#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return _NAME;

-:47: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#47: FILE: drivers/gpu/drm/xe/tests/xe_log_kunit.c:28:
+#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return _NAME;

-:47: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#47: FILE: drivers/gpu/drm/xe/tests/xe_log_kunit.c:28:
+#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return _NAME;

-:47: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#47: FILE: drivers/gpu/drm/xe/tests/xe_log_kunit.c:28:
+#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return _NAME;

-:522: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#522: FILE: drivers/gpu/drm/xe/tests/xe_log_kunit.c:503:
+		xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PROBE,
+			param->comp, param->loc,

total: 0 errors, 5 warnings, 1 checks, 577 lines checked
13223ad8afe9 drm/xe/tests: Add kunit tests for xe_any
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 195 lines checked
f9fc901a845b drm/xe: Report 'probe blocked' error using SIGID
55171a73c3d5 drm/xe: Report 'device wedged' errors using SIGID
a90d1ad6f571 drm/xe: Report 'Survivability Mode' errors using SIGID
f504a12a26da drm/xe/guc: Report 'GuC mmio' errors using SIGID
4b1ef0ba18fc drm/xe/pcode: Report 'Mailbox failed' error using SIGID
e658f45ffc9f drm/xe/gt: Report 'reset failed' errors using SIGID
93f9798b6dc3 drm/xe/gt: Report 'pagefault' errors using SIGID
134863cf20fd drm/xe/pci: Report 'cannot re-enable' error using SIGID


