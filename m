Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604F9C531CC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F1B10F20E;
	Thu, 23 Jul 2026 20:44:20 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8C110F20D;
 Thu, 23 Jul 2026 20:44:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_structured_?=
 =?utf-8?q?SIGID_error_logging_infrastructure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jul 2026 20:44:19 -0000
Message-ID: <178483945910.221667.11053908079094647122@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Add structured SIGID error logging infrastructure
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
commit 83370fd5c591fc01132cb41ffac909227e7dd9f5
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jul 23 22:37:52 2026 +0200

    drm/xe/pci: Report 'cannot re-enable' error using SIGID
    
    Report 'cannot re-enable PCI device' error using xe_log() helper.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Riana Tauro <riana.tauro@intel.com>
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch 1b41172259f1c761714ee4d65a4386b42181c492 drm-intel
a286959c6435 drm/xe/log: Add structured SIGID error logging infrastructure
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 360 lines checked
97ceba5a328b drm/xe: Introduce xe_any helpers
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

-:46: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#46: FILE: drivers/gpu/drm/xe/xe_any.h:21:
+#define xe_any_if_type(any, type)						\
+	_Generic((any),								\
+		 type * : (any),						\
+		 const type * : (any),						\
+		 default : NULL)

-:50: WARNING:TABSTOP: Statements should start on a tabstop
#50: FILE: drivers/gpu/drm/xe/xe_any.h:25:
+		 default : NULL)

-:50: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#50: FILE: drivers/gpu/drm/xe/xe_any.h:25:
+		 default : NULL)

-:90: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#90: FILE: drivers/gpu/drm/xe/xe_any.h:65:
+#define xe_any_to_xe(any)							\
+	_Generic((any),								\
+		 struct pci_dev * : pdev_to_xe_device((struct pci_dev *)(any)),	\
+		 struct xe_device * : (any),					\
+		 struct xe_tile * : ((struct xe_tile *)(any))->xe,		\
+		 struct xe_gt * : ((struct xe_gt *)(any))->tile->xe)

-:103: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#103: FILE: drivers/gpu/drm/xe/xe_any.h:78:
+#define xe_any_to_dev(any)							\
+	_Generic((any),								\
+		 struct device * : (any),					\
+		 default : xe_any_to_xe(any)->drm.dev)

-:106: WARNING:TABSTOP: Statements should start on a tabstop
#106: FILE: drivers/gpu/drm/xe/xe_any.h:81:
+		 default : xe_any_to_xe(any)->drm.dev)

-:106: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#106: FILE: drivers/gpu/drm/xe/xe_any.h:81:
+		 default : xe_any_to_xe(any)->drm.dev)

-:114: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#114: FILE: drivers/gpu/drm/xe/xe_any.h:89:
+#define xe_any_to_pdev(any)							\
+	_Generic((any),								\
+		 struct pci_dev * : (any),					\
+		 default : to_pci_dev(xe_any_to_dev(any)))

-:117: WARNING:TABSTOP: Statements should start on a tabstop
#117: FILE: drivers/gpu/drm/xe/xe_any.h:92:
+		 default : to_pci_dev(xe_any_to_dev(any)))

-:117: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#117: FILE: drivers/gpu/drm/xe/xe_any.h:92:
+		 default : to_pci_dev(xe_any_to_dev(any)))

-:125: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#125: FILE: drivers/gpu/drm/xe/xe_any.h:100:
+#define xe_any_id(any)							\
+	_Generic((any),							\
+		 struct pci_dev * : 0,						\
+		 struct xe_device * : 0,					\
+		 struct xe_tile * : ((struct xe_tile *)(any))->id,		\
+		 struct xe_gt * : ((struct xe_gt *)(any))->info.id)

total: 3 errors, 4 warnings, 5 checks, 107 lines checked
cda2c8890280 drm/xe/log: Add simple helpers for xe_log_emit
cd5cacb970e5 drm/xe/log: Allow to emit SIGID dmesg/cper separately
c1f92749f1a9 drm/xe/log: Add Tile/GT decorations for dmesg message
-:40: ERROR:SPACING: spaces required around that '=' (ctx:VxW)
#40: FILE: drivers/gpu/drm/xe/xe_log.h:39:
+	struct xe_tile *__tile__= (tile);						\
 	                        ^

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fmt' - possible side-effects?
#51: FILE: drivers/gpu/drm/xe/xe_log.h:50:
+#define xe_log_emit_dmesg_from(any, sev, sig, data, len, fmt, args...) do {		\
+	typeof(any) __any_ = (any);							\
+	struct pci_dev *__pdev_ = xe_any_to_pdev(__any_);				\
+	struct xe_tile *__tile_ = xe_any_if_tile(__any_);				\
+	struct xe_device *__xe_ = xe_any_if_xe(__any_);					\
+	struct xe_gt *__gt_ = xe_any_if_gt(__any_);					\
+	int __sev_ = (sev);								\
+	int __sig_ = (sig);								\
+	const void *__data_ = (data);							\
+	size_t __len_ = (len);								\
+	if (__gt_)									\
+		xe_log_emit_gt_dmesg(__gt_, __sev_, __sig_,				\
+				     __data_, __len_, fmt, ##args);			\
+	else if (__tile_)								\
+		xe_log_emit_tile_dmesg(__tile_, __sev_, __sig_,				\
+				       __data_, __len_, fmt, ##args);			\
+	else if (__xe_)									\
+		xe_log_emit_xe_dmesg(__xe_, __sev_, __sig_,				\
+				     __data_, __len_, fmt, ##args);			\
+	else if (!__gt_ && !__tile_ && !__xe_)						\
+		xe_log_emit_dmesg(__pdev_, __sev_, __sig_,				\
+				  __data_, __len_, fmt, ##args);			\
+} while (0)

-:75: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fmt' - possible side-effects?
#75: FILE: drivers/gpu/drm/xe/xe_log.h:74:
+#define xe_log_emit_from(any, sev, sig, comp, loc, data, len, fmt, args...) do {	\
+	typeof(any) ___any = (any);							\
+	struct pci_dev *___pdev = xe_any_to_pdev(___any);				\
+	int ___sev = (sev);								\
+	int ___sig = (sig);								\
+	const void *___data = (data);							\
+	size_t ___len = (len);								\
+	xe_log_emit_dmesg_from(___any, ___sev, ___sig, ___data, ___len, fmt, ##args);	\
+	xe_log_emit_cper(___pdev, ___sev, ___sig, (comp), (loc),			\
+			 ___data, ___len, fmt, ##args);					\
+} while (0)

total: 1 errors, 0 warnings, 2 checks, 71 lines checked
ce5303aefb06 drm/xe/log: Introduce structured log components
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

-:144: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#144: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:126:
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

-:144: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#144: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:126:
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

-:179: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#179: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:161:
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

-:179: WARNING:MACRO_ARG_UNUSED: Argument '_SIG' is not used in function-like macro
#179: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:161:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

-:179: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#179: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:161:
+#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
+	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
+	/* eod */

-:192: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#192: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:174:
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

-:192: WARNING:MACRO_ARG_UNUSED: Argument '_CLASS' is not used in function-like macro
#192: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:174:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:192: WARNING:MACRO_ARG_UNUSED: Argument '_ID' is not used in function-like macro
#192: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:174:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

-:192: WARNING:MACRO_ARG_UNUSED: Argument '_NAME' is not used in function-like macro
#192: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:174:
+#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
+	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
+	/* eod */

total: 3 errors, 6 warnings, 1 checks, 181 lines checked
35be1e207724 drm/xe/log: Add component based SIGID log helper
-:39: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'any' - possible side-effects?
#39: FILE: drivers/gpu/drm/xe/xe_log.h:110:
+#define xe_log_location(any) \
+	PREP_XE_LOG_LOCATION(xe_log_location_type(any), xe_any_id(any))

-:42: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#42: FILE: drivers/gpu/drm/xe/xe_log.h:113:
+#define __XE_LOG_COMP_FMT(TAG, fmt, args...)	#TAG ": " fmt, ##args

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

-:57: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fmt' - possible side-effects?
#57: FILE: drivers/gpu/drm/xe/xe_log.h:128:
+#define xe_log_emit_comp(any, cper_sev, TAG, data, len, fmt, args...) do {		\
+	typeof(any) __any = (any);							\
+	struct pci_dev *__pdev = xe_any_to_pdev(__any);					\
+	int __sev = (cper_sev);								\
+	int __sig = XE_LOG_COMPONENT_##TAG##_SIGID;					\
+	u32 __component = XE_LOG_COMPONENT_##TAG;					\
+	u32 __location = xe_log_location(__any);					\
+	const void *__data = (data);							\
+	size_t __len = (len);								\
+	xe_log_emit_dmesg_from(__any, __sev, __sig, __data, __len,			\
+			       __XE_LOG_COMP_FMT(TAG, fmt, ##args));			\
+	xe_log_emit_cper(__pdev, __sev, __sig, __component, __location,			\
+			 __data, __len,	fmt, ##args);					\
+} while (0)

total: 1 errors, 0 warnings, 2 checks, 51 lines checked
6a3b7be42fb6 drm/xe/log: Add errno-only SIGID log helpers
f9f212ce882e drm/xe/log: Add hardware error signatures
1b99d74513ec drm/xe/log: Extend components list with hardware items
-:22: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#22: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:130:
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

-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#22: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:130:
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
 	/* */									\
 	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
 	define(SYSTEM, 2, DRM, SW, "DRM")					\

-:31: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#31: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:159:
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	define(HARDWARE, 3, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 4, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 5, SOC, SOC_INTERNAL, "SoC Internal")			\
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

-:31: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'define' - possible side-effects?
#31: FILE: drivers/gpu/drm/xe/abi/xe_log_abi.h:159:
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	define(HARDWARE, 3, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 4, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 5, SOC, SOC_INTERNAL, "SoC Internal")			\
 	/* eod */

total: 2 errors, 0 warnings, 2 checks, 23 lines checked
66f46dcb36f7 drm/xe/tests: Add Kunit tests for xe_log
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 363 lines checked
d3e41c43dcbc drm/xe: Report 'probe blocked' error using SIGID
27350b2454af drm/xe: Report 'device wedged' errors using SIGID
951f7d5cb7a5 drm/xe: Report 'Survivability Mode' errors using SIGID
ee870e530088 drm/xe/guc: Report 'GuC mmio' errors using SIGID
dc8470cd25f5 drm/xe/pcode: Report 'Mailbox failed' error using SIGID
39fc90da37f5 drm/xe/gt: Report 'reset failed' errors using SIGID
eddf76157013 drm/xe/gt: Report 'pagefault' errors using SIGID
83370fd5c591 drm/xe/pci: Report 'cannot re-enable' error using SIGID


