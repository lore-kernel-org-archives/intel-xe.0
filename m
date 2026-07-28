Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBA9C54F4D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D556510E5BB;
	Tue, 28 Jul 2026 16:17:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D60510E5BB;
 Tue, 28 Jul 2026 16:17:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_structured_?=
 =?utf-8?q?SIGID_error_logging_infrastructure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jul 2026 16:17:18 -0000
Message-ID: <178525543830.231569.15697089819937473924@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Add structured SIGID error logging infrastructure (rev2)
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
commit fae2b92f00b64bc3e03957a8b3bb14a1ecca0342
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jul 28 18:10:37 2026 +0200

    drm/xe/pci: Report 'cannot re-enable' error using SIGID
    
    Report 'cannot re-enable PCI device' error using xe_log() helper.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Riana Tauro <riana.tauro@intel.com>
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 231ba00442a06ee877bfed4765c0b1b48bebbf78 drm-intel
56c655077570 drm/xe: Introduce xe_any helpers
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#43: FILE: drivers/gpu/drm/xe/xe_any.h:18:
+#define xe_any_if_type(any, type)						\
+	_Generic((any),								\
+		 type * : (any),						\
+		 const type * : (any),						\
+		 default : NULL)

-:47: WARNING:TABSTOP: Statements should start on a tabstop
#47: FILE: drivers/gpu/drm/xe/xe_any.h:22:
+		 default : NULL)

-:47: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#47: FILE: drivers/gpu/drm/xe/xe_any.h:22:
+		 default : NULL)

-:87: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#87: FILE: drivers/gpu/drm/xe/xe_any.h:62:
+#define xe_any_to_xe(any)								\
+	_Generic((any),									\
+		 struct xe_device * : (any),						\
+		 const struct xe_device * : (any),					\
+		 struct xe_tile * : tile_to_xe((struct xe_tile *)(any)),		\
+		 const struct xe_tile * : tile_to_xe((const struct xe_tile *)(any)),	\
+		 struct xe_gt * : gt_to_xe((struct xe_gt *)(any)),			\
+		 const struct xe_gt * : gt_to_xe((const struct xe_gt *)(any)),		\
+		 struct pci_dev * : pdev_to_xe_device((struct pci_dev *)(any)),		\
+		 struct device * : kdev_to_xe_device((struct device *)(any)))

-:104: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#104: FILE: drivers/gpu/drm/xe/xe_any.h:79:
+#define xe_any_to_dev(any)							\
+	_Generic((any),								\
+		 struct device * : (any),					\
+		 default : xe_any_to_xe(any)->drm.dev)

-:107: WARNING:TABSTOP: Statements should start on a tabstop
#107: FILE: drivers/gpu/drm/xe/xe_any.h:82:
+		 default : xe_any_to_xe(any)->drm.dev)

-:107: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#107: FILE: drivers/gpu/drm/xe/xe_any.h:82:
+		 default : xe_any_to_xe(any)->drm.dev)

-:115: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#115: FILE: drivers/gpu/drm/xe/xe_any.h:90:
+#define xe_any_to_pdev(any)							\
+	_Generic((any),								\
+		 struct pci_dev * : (any),					\
+		 default : to_pci_dev(xe_any_to_dev(any)))

-:118: WARNING:TABSTOP: Statements should start on a tabstop
#118: FILE: drivers/gpu/drm/xe/xe_any.h:93:
+		 default : to_pci_dev(xe_any_to_dev(any)))

-:118: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#118: FILE: drivers/gpu/drm/xe/xe_any.h:93:
+		 default : to_pci_dev(xe_any_to_dev(any)))

-:126: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#126: FILE: drivers/gpu/drm/xe/xe_any.h:101:
+#define xe_any_id(any)								\
+	_Generic((any),								\
+		 struct xe_gt * : ((struct xe_gt *)(any))->info.id,		\
+		 const struct xe_gt * : ((const struct xe_gt *)(any))->info.id,	\
+		 struct xe_tile * : ((struct xe_tile *)(any))->id,		\
+		 const struct xe_tile * : ((const struct xe_tile *)(any))->id,	\
+		 struct xe_device * : 0,					\
+		 const struct xe_device * : 0,					\
+		 struct pci_dev * : 0,						\
+		 struct device * : 0)

total: 3 errors, 4 warnings, 5 checks, 112 lines checked
b398f16ee34c drm/xe/log: Add structured SIGID error logging infrastructure
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 363 lines checked
c2abf0c55928 drm/xe/log: Introduce structured component/location identifiers
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

-:150: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#150: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:130:
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

-:150: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#150: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:130:
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

-:185: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#185: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:165:
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

-:185: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#185: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:165:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

-:185: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#185: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:165:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

-:198: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#198: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:178:
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

-:198: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#198: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:178:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:198: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#198: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:178:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:198: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#198: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:178:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

total: 3 errors, 6 warnings, 1 checks, 185 lines checked
857d2c52f847 drm/xe/log: Add component/location decorations to dmesg
-:35: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_log.c:22:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:35: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_log.c:22:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:35: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_log.c:22:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:35: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#35: FILE: drivers/gpu/drm/xe/xe_log.c:22:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

-:35: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#35: FILE: drivers/gpu/drm/xe/xe_log.c:22:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return #_TAG ": ";

total: 0 errors, 5 warnings, 0 checks, 106 lines checked
886cd48c2df3 drm/xe/log: Add SIGID log helpers for severity
e0d63997b932 drm/xe/log: Add SIGID log helpers for location
-:44: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#44: FILE: drivers/gpu/drm/xe/xe_log.h:49:
+#define xe_log_location(any) \
+	PREP_XE_LOG_LOCATION(xe_log_location_type(any), xe_any_id(any))

total: 0 errors, 0 warnings, 1 checks, 47 lines checked
35055b71024c drm/xe/log: Add SIGID log helpers for location & severity
a7651bad09df drm/xe/log: Add SIGID log helpers for components
9e6a67c86efa drm/xe/log: Add SIGID log helpers for errno-only
18f14af80ea2 drm/xe/log: Add hardware error signatures
5ec51ce609eb drm/xe/log: Extend components list with hardware items
-:23: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#23: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:134:
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
#23: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:134:
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
 	/* */									\
 	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
 	define(SYSTEM, 2, DRM, SW, "DRM")					\

-:32: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#32: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:163:
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
#32: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:163:
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	/*     HARDWARE, 3, RESERVED */						\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\
 	/* eod */

total: 2 errors, 0 warnings, 2 checks, 24 lines checked
b773712c4923 drm/xe/ras: Check RAS and LOG component definitions
35b11d827714 drm/xe/kunit: Setup driver data in the test device
62357b1a3193 drm/xe/tests: Add Kunit tests for xe_log
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

total: 0 errors, 5 warnings, 0 checks, 512 lines checked
b8c199034655 drm/xe: Report 'probe blocked' error using SIGID
6844b0cac047 drm/xe: Report 'device wedged' errors using SIGID
4edc148b3c2e drm/xe: Report 'Survivability Mode' errors using SIGID
fb4a9ce39f47 drm/xe/guc: Report 'GuC mmio' errors using SIGID
c78de87889d9 drm/xe/pcode: Report 'Mailbox failed' error using SIGID
ec8375ad8847 drm/xe/gt: Report 'reset failed' errors using SIGID
7720f044c76a drm/xe/gt: Report 'pagefault' errors using SIGID
fae2b92f00b6 drm/xe/pci: Report 'cannot re-enable' error using SIGID


