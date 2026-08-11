Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BA9C5CFC1
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 23:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1602410E3A7;
	Tue, 11 Aug 2026 23:59:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D56610E3A7;
 Tue, 11 Aug 2026 23:59:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_SIGID_API_for_PCODE_a?=
 =?utf-8?q?nd_CSC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Aug 2026 23:59:22 -0000
Message-ID: <178649276237.41847.12071256195080807474@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
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

Series: Use SIGID API for PCODE and CSC
URL   : https://patchwork.freedesktop.org/series/172039/
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
commit 699e3c91b81bc56d3bf40c774e89b61fa738f328
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Tue Aug 11 16:52:59 2026 -0700

    drm/xe/ras: Report CSC errors using SIGID
    
    Use xe_log_err() to report CSC errors using SIGID.
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch aabf41c0ea0ad661a2e384e51955b24343f6ca25 drm-intel
73ef06f1a51c drm/xe/log: DO NOT REVIEW
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

-:192: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#192: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:131:
+#define DEFINE_XE_LOG_COMPONENTS(define) \
+	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
+	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)

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

-:192: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#192: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:131:
+#define DEFINE_XE_LOG_COMPONENTS(define) \
+	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
+	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)

-:196: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#196: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:135:
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
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
+

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

-:196: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#196: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:135:
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
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
+

-:225: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#225: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:164:
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	/*     HARDWARE, 3, RESERVED */						\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\
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

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#225: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:164:
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	/*     HARDWARE, 3, RESERVED */						\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\
+	/* eod */

-:239: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#239: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:178:
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

-:239: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#239: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:178:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

-:239: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#239: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:178:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

-:252: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#252: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:191:
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

-:252: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#252: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:191:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:252: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#252: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:191:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:252: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#252: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:191:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:477: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#477: FILE: drivers/gpu/drm/xe/xe_any.h:11:
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

-:477: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#477: FILE: drivers/gpu/drm/xe/xe_any.h:11:
+#define __xe_any_to_self_assoc(type, any) \
+	const type * : (any), \
+	type * : (any)

-:488: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#488: FILE: drivers/gpu/drm/xe/xe_any.h:22:
+#define xe_any_if_type(any, type)						\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(type, (any)),				\
+		default :								\
+			NULL)

-:526: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'const' - possible side-effects?
#526: FILE: drivers/gpu/drm/xe/xe_any.h:60:
+#define __xe_any_to_other_assoc(const, from, other, p) \
+	const struct from * : __##from##_to_##other((const struct from *)(p))

-:526: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'from' - possible side-effects?
#526: FILE: drivers/gpu/drm/xe/xe_any.h:60:
+#define __xe_any_to_other_assoc(const, from, other, p) \
+	const struct from * : __##from##_to_##other((const struct from *)(p))

-:526: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'from' may be better as '(from)' to avoid precedence issues
#526: FILE: drivers/gpu/drm/xe/xe_any.h:60:
+#define __xe_any_to_other_assoc(const, from, other, p) \
+	const struct from * : __##from##_to_##other((const struct from *)(p))

-:542: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#542: FILE: drivers/gpu/drm/xe/xe_any.h:76:
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

-:559: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#559: FILE: drivers/gpu/drm/xe/xe_any.h:93:
+#define xe_any_to_drm(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct drm_device, (any)),		\
+		default :								\
+			&xe_any_to_xe(any)->drm)

-:571: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#571: FILE: drivers/gpu/drm/xe/xe_any.h:105:
+#define xe_any_to_dev(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct device, (any)),			\
+		 __xe_any_to_other_assoc(, pci_dev, device, (any)),		\
+		default :								\
+			xe_any_to_drm(any)->dev)

-:584: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#584: FILE: drivers/gpu/drm/xe/xe_any.h:118:
+#define xe_any_to_pdev(any)							\
+	_Generic((any),								\
+		 __xe_any_to_self_assoc(struct pci_dev, (any)),			\
+		default :								\
+			to_pci_dev(xe_any_to_dev(any)))

-:599: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#599: FILE: drivers/gpu/drm/xe/xe_any.h:133:
+#define xe_any_id(any)								\
+	_Generic((any),								\
+		 __xe_any_to_other_assoc(/* */, xe_tile, id, (any)),		\
+		 __xe_any_to_other_assoc(const, xe_tile, id, (any)),		\
+		 __xe_any_to_other_assoc(/* */, xe_gt, id, (any)),		\
+		 __xe_any_to_other_assoc(const, xe_gt, id, (any)),		\
+		default :								\
+			0)

-:655: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#655: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return /* _CLASS _ID _SIG _NAME */ #_TAG ": ";

-:655: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#655: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return /* _CLASS _ID _SIG _NAME */ #_TAG ": ";

-:655: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#655: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return /* _CLASS _ID _SIG _NAME */ #_TAG ": ";

-:655: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#655: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return /* _CLASS _ID _SIG _NAME */ #_TAG ": ";

-:655: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#655: FILE: drivers/gpu/drm/xe/xe_log.c:41:
+#define MAKE_XE_LOG_COMPONENT_CASE_PREFIX(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	case XE_LOG_COMPONENT_##_TAG: return /* _CLASS _ID _SIG _NAME */ #_TAG ": ";

-:891: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#891: FILE: drivers/gpu/drm/xe/xe_log.h:50:
+#define xe_log_location(any) \
+	PREP_XE_LOG_LOCATION(xe_log_location_type(any), xe_any_id(any))

total: 6 errors, 11 warnings, 14 checks, 962 lines checked
91f16c2da7ad drm/xe/pcode: Use int instead of u32 for mailbox status
fc29a59d5b18 drm/xe/pcode: Report pcode errors using SIGID
-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/xe/xe_pcode.c:325:
+		xe_log_err(xe, PCODE, -ret,
+			"Initialization timed out after: %d min\n", timeout_us / 60000000);

total: 0 errors, 0 warnings, 1 checks, 36 lines checked
699e3c91b81b drm/xe/ras: Report CSC errors using SIGID


