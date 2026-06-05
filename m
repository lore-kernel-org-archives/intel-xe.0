Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE0ACD6E79
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 12:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B0111A7E6;
	Fri,  5 Jun 2026 12:16:55 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F2511A7E6;
 Fri,  5 Jun 2026 12:16:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/tests=3A_Add_drm?=
 =?utf-8?q?=5Fexec_locking_benchmark_kunit_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jun 2026 12:16:54 -0000
Message-ID: <178066181400.47432.12304210545805316702@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605112700.181040-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260605112700.181040-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/tests: Add drm_exec locking benchmark kunit test
URL   : https://patchwork.freedesktop.org/series/167950/
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
commit 93d015b8f1085d00c6041da4d286ae0f55f05d89
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jun 5 13:26:58 2026 +0200

    dma-buf: Add generic dma_resv wound-wait transaction API
    
    Introduce dma_resv_txn, a subsystem-agnostic wound-wait locking
    protocol for sets of dma_resv objects.  It is a lower-level analogue
    of drm_exec, usable with any object that embeds or references a
    dma_resv — not just GEM buffers.
    
    Each participant type provides an ops vtable with callbacks to retrieve
    the associated dma_resv and release the object reference.
    
    dma_resv_txn_force_retry() allows callers to trigger an unconditional
    retry to recover from non-ww errors such as memory pressure.
    
    Assisted-by: GitHub_Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch fe3f27ecb39e8357b0af59cfe9402fd5cc0c07b1 drm-intel
93d015b8f108 dma-buf: Add generic dma_resv wound-wait transaction API
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

-:460: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#460: FILE: include/linux/dma-resv-txn.h:115:
+#define __dma_resv_txn_for_each_obj_ops(txn, obj, __ops, __curs)	\
+	for (struct dma_resv_txn_obj *__curs = (txn)->objects;		\
+	     __curs < &(txn)->objects[(txn)->num_objects] &&		\
+		     ((obj) = __curs->object, true);			\
+	     ++__curs)							\
+		if (unlikely(__curs->ops != (__ops))) {} else

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

-:460: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'txn' - possible side-effects?
#460: FILE: include/linux/dma-resv-txn.h:115:
+#define __dma_resv_txn_for_each_obj_ops(txn, obj, __ops, __curs)	\
+	for (struct dma_resv_txn_obj *__curs = (txn)->objects;		\
+	     __curs < &(txn)->objects[(txn)->num_objects] &&		\
+		     ((obj) = __curs->object, true);			\
+	     ++__curs)							\
+		if (unlikely(__curs->ops != (__ops))) {} else

-:460: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__curs' - possible side-effects?
#460: FILE: include/linux/dma-resv-txn.h:115:
+#define __dma_resv_txn_for_each_obj_ops(txn, obj, __ops, __curs)	\
+	for (struct dma_resv_txn_obj *__curs = (txn)->objects;		\
+	     __curs < &(txn)->objects[(txn)->num_objects] &&		\
+		     ((obj) = __curs->object, true);			\
+	     ++__curs)							\
+		if (unlikely(__curs->ops != (__ops))) {} else

-:460: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__curs' may be better as '(__curs)' to avoid precedence issues
#460: FILE: include/linux/dma-resv-txn.h:115:
+#define __dma_resv_txn_for_each_obj_ops(txn, obj, __ops, __curs)	\
+	for (struct dma_resv_txn_obj *__curs = (txn)->objects;		\
+	     __curs < &(txn)->objects[(txn)->num_objects] &&		\
+		     ((obj) = __curs->object, true);			\
+	     ++__curs)							\
+		if (unlikely(__curs->ops != (__ops))) {} else

-:465: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#465: FILE: include/linux/dma-resv-txn.h:120:
+		if (unlikely(__curs->ops != (__ops))) {} else

-:465: CHECK:BRACES: braces {} should be used on all arms of this statement
#465: FILE: include/linux/dma-resv-txn.h:120:
+		if (unlikely(__curs->ops != (__ops))) {} else
[...]
+		if (unlikely(__curs->ops != (__ops))) {} else
[...]

-:467: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#467: FILE: include/linux/dma-resv-txn.h:122:
+#define __dma_resv_txn_for_each_obj_ops_reverse(txn, obj, __ops, __idx)	\
+	for (unsigned long __idx = (txn)->num_objects;			\
+	     __idx-- > 0 &&						\
+		     ((obj) = (txn)->objects[__idx].object, true);	\
+	     )								\
+		if (unlikely((txn)->objects[__idx].ops != (__ops))) {} else

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

-:467: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'txn' - possible side-effects?
#467: FILE: include/linux/dma-resv-txn.h:122:
+#define __dma_resv_txn_for_each_obj_ops_reverse(txn, obj, __ops, __idx)	\
+	for (unsigned long __idx = (txn)->num_objects;			\
+	     __idx-- > 0 &&						\
+		     ((obj) = (txn)->objects[__idx].object, true);	\
+	     )								\
+		if (unlikely((txn)->objects[__idx].ops != (__ops))) {} else

-:467: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__idx' - possible side-effects?
#467: FILE: include/linux/dma-resv-txn.h:122:
+#define __dma_resv_txn_for_each_obj_ops_reverse(txn, obj, __ops, __idx)	\
+	for (unsigned long __idx = (txn)->num_objects;			\
+	     __idx-- > 0 &&						\
+		     ((obj) = (txn)->objects[__idx].object, true);	\
+	     )								\
+		if (unlikely((txn)->objects[__idx].ops != (__ops))) {} else

-:472: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#472: FILE: include/linux/dma-resv-txn.h:127:
+		if (unlikely((txn)->objects[__idx].ops != (__ops))) {} else

-:472: CHECK:BRACES: braces {} should be used on all arms of this statement
#472: FILE: include/linux/dma-resv-txn.h:127:
+		if (unlikely((txn)->objects[__idx].ops != (__ops))) {} else
[...]
+		if (unlikely((txn)->objects[__idx].ops != (__ops))) {} else
[...]

-:501: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#501: FILE: include/linux/dma-resv-txn.h:156:
+#define __dma_resv_txn_until_all_locked(txn, _label)			\
+_label:									\
+	for (void *const __maybe_unused __txn_retry_ptr = &&_label;	\
+	     dma_resv_txn_cleanup(txn);)

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

-:501: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_label' - possible side-effects?
#501: FILE: include/linux/dma-resv-txn.h:156:
+#define __dma_resv_txn_until_all_locked(txn, _label)			\
+_label:									\
+	for (void *const __maybe_unused __txn_retry_ptr = &&_label;	\
+	     dma_resv_txn_cleanup(txn);)

-:502: ERROR:SPACING: spaces required around that ':' (ctx:VxE)
#502: FILE: include/linux/dma-resv-txn.h:157:
+_label:									\
       ^

-:536: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#536: FILE: include/linux/dma-resv-txn.h:191:
+#define dma_resv_txn_retry_on_contention(txn)				\
+	do {								\
+		if (unlikely(dma_resv_txn_is_contended(txn)))		\
+			goto *__txn_retry_ptr;				\
+	} while (0)

-:551: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#551: FILE: include/linux/dma-resv-txn.h:206:
+#define dma_resv_txn_force_retry(txn)					\
+	do {								\
+		WARN_ON(dma_resv_txn_is_contended(txn));		\
+		goto *__txn_retry_ptr;					\
+	} while (0)

total: 6 errors, 3 warnings, 8 checks, 529 lines checked


