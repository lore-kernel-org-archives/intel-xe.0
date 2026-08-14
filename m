Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6719DC5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCE310E190;
	Fri, 14 Aug 2026 17:25:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B67810E190;
 Fri, 14 Aug 2026 17:25:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_structured_?=
 =?utf-8?q?SIGID_error_logging_infrastructure_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Aug 2026 17:25:26 -0000
Message-ID: <178672832656.54048.3481133898138995537@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Add structured SIGID error logging infrastructure (rev5)
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
commit 770114873a7ef1f0e0cb35fe256d991f31a75638
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Aug 14 19:17:59 2026 +0200

    drm/xe/pci: Report 'cannot re-enable' error using SIGID
    
    Report 'cannot re-enable PCI device' error using xe_log() helper.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Riana Tauro <riana.tauro@intel.com>
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 9832bc7a458a4a67e68dcf96927588859c1994f3 drm-intel
806a3b09ecc5 drm/xe: Introduce xe_any helpers
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
d2803a9563c1 drm/xe/log: Add structured SIGID error logging infrastructure
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 342 lines checked
f4b06c249eee drm/xe/log: Introduce structured component/location identifiers
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

-:154: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#154: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:132:
+#define DEFINE_XE_LOG_COMPONENTS(define) \
+	/* */									\
+	define(SYSTEM, 1, PCI, IO_BUS, "Linux PCI Subsystem")			\
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

-:154: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#154: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:132:
+#define DEFINE_XE_LOG_COMPONENTS(define) \
+	/* */									\
+	define(SYSTEM, 1, PCI, IO_BUS, "Linux PCI Subsystem")			\
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

-:189: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#189: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:167:
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

-:189: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#189: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:167:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

-:189: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#189: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:167:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

-:202: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#202: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:180:
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

-:202: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#202: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:180:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:202: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#202: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:180:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:202: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#202: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:180:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

total: 3 errors, 6 warnings, 1 checks, 187 lines checked
e5ecfc871bc3 drm/xe/log: Add component/location decorations to dmesg
-:41: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#41: FILE: drivers/gpu/drm/xe/xe_log.c:26:
+#define MAKE_XE_LOG_COMPONENT_CLASS_PREFIX(_CLASS) \
+	case XE_LOG_COMPONENT_CLASS_##_CLASS: return #_CLASS "? ";

-:56: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#56: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:56: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#56: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:56: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#56: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:56: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#56: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:56: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#56: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

total: 0 errors, 6 warnings, 0 checks, 126 lines checked
f6cc0dfe28ca drm/xe/log: Add SIGID log helpers for severity
60e556751b3c drm/xe/log: Add SIGID log helpers for location
-:45: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#45: FILE: drivers/gpu/drm/xe/xe_log.h:49:
+#define xe_log_location(any) \
+	PREP_XE_LOG_LOCATION(xe_log_location_type(any), xe_any_id(any))

total: 0 errors, 0 warnings, 1 checks, 47 lines checked
33cda540d8d3 drm/xe/log: Add SIGID log helpers for location & severity
89d82e368869 drm/xe/log: Add SIGID log helpers for components
4f2867653df0 drm/xe/log: Add SIGID log helpers for component & severity
73a5d9ba7097 drm/xe/log: Add SIGID log helpers for errno-only
65b3688b1d12 drm/xe/log: Index all SIGID printk messages
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
  <3> drivers/gpu/drm/xe/xe_log.c:142 log_dmesg_vprintk "%s %s: [drm] *ERROR* %pV"

-:69: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#69: FILE: drivers/gpu/drm/xe/xe_log.h:26:
+#define __xe_log_emit_printk_index(level, fmt) \
+	dev_printk_index_emit(level, "%s SIGID=%u %s" fmt);

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'sev' - possible side-effects?
#72: FILE: drivers/gpu/drm/xe/xe_log.h:29:
+#define xe_log_emit(pdev, sev, sig, comp, loc, data, len, fmt, args...) do {		\
+	__xe_log_emit_printk_index(__xe_log_const_sev_to_level(sev), fmt);		\
+	__xe_log_emit((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
+} while (0)

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fmt' - possible side-effects?
#72: FILE: drivers/gpu/drm/xe/xe_log.h:29:
+#define xe_log_emit(pdev, sev, sig, comp, loc, data, len, fmt, args...) do {		\
+	__xe_log_emit_printk_index(__xe_log_const_sev_to_level(sev), fmt);		\
+	__xe_log_emit((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
+} while (0)

total: 0 errors, 2 warnings, 2 checks, 43 lines checked
624f6d92dd2d drm/xe/log: Add hardware error signatures
c11d3cb5f0c7 drm/xe/log: Extend components list with hardware items
-:25: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#25: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:136:
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
 	/* */									\
 	define(SYSTEM, 1, PCI, IO_BUS, "Linux PCI Subsystem")			\
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

-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#25: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:136:
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
 	/* */									\
 	define(SYSTEM, 1, PCI, IO_BUS, "Linux PCI Subsystem")			\
 	define(SYSTEM, 2, DRM, SW, "DRM")					\

-:34: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#34: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:165:
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, DEVICE_MEMORY, DEVICE_MEMORY, "Device Memory")	\
+	define(HARDWARE, 2, CORE_COMPUTE, CORE_COMPUTE, "Core Compute")		\
+	/*     HARDWARE, 3, RESERVED */						\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC_INTERNAL, SOC_INTERNAL, "SoC Internal")		\
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

-:34: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#34: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:165:
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, DEVICE_MEMORY, DEVICE_MEMORY, "Device Memory")	\
+	define(HARDWARE, 2, CORE_COMPUTE, CORE_COMPUTE, "Core Compute")		\
+	/*     HARDWARE, 3, RESERVED */						\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC_INTERNAL, SOC_INTERNAL, "SoC Internal")		\
 	/* eod */

total: 2 errors, 0 warnings, 2 checks, 24 lines checked
4c974641c065 drm/xe/ras: Check RAS and LOG component definitions
0aa89a9e0064 drm/xe/kunit: Setup driver data in the test device
0c6661611353 drm/xe/tests: Add Kunit tests for xe_log
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/tests/xe_log_kunit.c:28:
+#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return _NAME;

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/tests/xe_log_kunit.c:28:
+#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return _NAME;

-:48: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#48: FILE: drivers/gpu/drm/xe/tests/xe_log_kunit.c:28:
+#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return _NAME;

-:48: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#48: FILE: drivers/gpu/drm/xe/tests/xe_log_kunit.c:28:
+#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return _NAME;

total: 0 errors, 5 warnings, 0 checks, 585 lines checked
dfacd40898c6 drm/xe/tests: Add kunit tests for xe_any
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 220 lines checked
f4f82ebabbb2 drm/xe: Report 'probe blocked' status using SIGID
c2d794a04eb7 drm/xe: Report all probe errors using SIGID
f1242c1acd8c drm/xe/survivability: Report 'boot status' using SIGID
d9d9d07fcde4 drm/xe/survivability: Report sysfs failure in one place
c0da3308e09d drm/xe/survivability: Report 'boot status' on sysfs failure
75212278110c drm/xe/survivability: Report 'Boot Mode enabled' status using SIGID
b780cf1053a8 drm/xe/survivability: Report 'Runtime Mode enabled' status using SIGID
cfa28049215c drm/xe: Report 'device wedged' errors using SIGID
daf9316a1469 drm/xe/pcode: Report 'Mailbox failed' error using SIGID
cafbb5f4b111 drm/xe/pcode: Report 'timeout, retrying' error using SIGID
05583bde19e8 drm/xe/pcode: Report 'initialization timedout' error using SIGID
8a97e51854b2 drm/xe/guc: Report 'GuC mmio' errors using SIGID
41159d399b5d drm/xe/gt: Report 'reset failed' errors using SIGID
2bf3d8cb0db8 drm/xe/gt: Report 'Fault response' pagefault error using SIGID
60d26a58b898 drm/xe/gt: Report 'Queue full' pagefault error using SIGID
770114873a7e drm/xe/pci: Report 'cannot re-enable' error using SIGID


