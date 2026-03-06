Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B283AF51405
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 06:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6509710E275;
	Fri,  6 Mar 2026 06:21:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C1210E275;
 Fri,  6 Mar 2026 06:21:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Enable_Wa=5F140?=
 =?utf-8?q?25515070=2C_Enable_indirect_ring_state_for_XE2+_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 06:21:50 -0000
Message-ID: <177277811026.324694.1994852065055458550@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304003431.758201-3-julia.filipchuk@intel.com>
In-Reply-To: <20260304003431.758201-3-julia.filipchuk@intel.com>
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

Series: drm/xe: Enable Wa_14025515070, Enable indirect ring state for XE2+ (rev9)
URL   : https://patchwork.freedesktop.org/series/160812/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5b92d02fbe3f83c57b658cda0e2201ac5ff6f3f2
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Tue Mar 3 16:34:24 2026 -0800

    drm/xe: Enable Wa_14025515070
    
    Corrects a failure on context switch. On registration of context with
    indirect ring state will correct state of targeted and idle command
    streamers.
    
    This Wa requires GuC 70.53+ (uapi 1.26+).  If indirect_ring_state is
    enabled and Wa is unavailable, notify and disable indirect_ring_state.
    
    Added additional XE_RTP_PASTE macros for expansion of longer rules.
    
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 79792a2fc5d37b5446e543f1de05158ab0f551c9 drm-intel
5b92d02fbe3f drm/xe: Enable Wa_14025515070
-:71: WARNING:LONG_LINE: line length of 167 exceeds 100 columns
#71: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:69:
+#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:71: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#71: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:69:
+#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)

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

-:71: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#71: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:69:
+#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:71: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#71: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:69:
+#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:72: WARNING:LONG_LINE: line length of 167 exceeds 100 columns
#72: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:70:
+#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:72: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#72: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:70:
+#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)

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

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#72: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:70:
+#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#72: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:70:
+#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)

total: 2 errors, 2 warnings, 4 checks, 51 lines checked


