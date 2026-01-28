Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE75BD46BEB
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 18:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5E010E755;
	Wed, 28 Jan 2026 18:09:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DF310E754;
 Wed, 28 Jan 2026 18:09:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_Wa=5F14?=
 =?utf-8?q?025883347_for_GuC_DMA_failure_on_reset_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jan 2026 18:09:31 -0000
Message-ID: <176962377153.202473.244270915182700118@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260128115134.657091-4-sk.anirban@intel.com>
In-Reply-To: <20260128115134.657091-4-sk.anirban@intel.com>
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

Series: drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset (rev3)
URL   : https://patchwork.freedesktop.org/series/160091/
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
commit 9b8b31f58ca833c9dd07717f5850d1c377f5e898
Author: Sk Anirban <sk.anirban@intel.com>
Date:   Wed Jan 28 17:21:37 2026 +0530

    drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset
    
    Prevent GuC firmware DMA failures during GuC-only reset by disabling
    idle flow and verifying SRAM handling completion. Without this, reset
    can be issued while SRAM handler is copying WOPCM to SRAM,
    causing GuC HW to get stuck.
    
    v2: Modify error message (Badal)
        Rename reg bit name (Daniele)
        Update WA skip condition (Daniele)
        Update SRAM handling logic (Daniele)
    v3: Reorder WA call (Badal)
        Wait for GuC ready status (Daniele)
    
    Signed-off-by: Sk Anirban <sk.anirban@intel.com>
+ /mt/dim checkpatch 8059f097e25f736bb3da09af6a9b283079abfd4f drm-intel
3d7ec4cc64fb drm/xe/rtp: Extend support for max rules/actions per entry
-:41: WARNING:LONG_LINE: line length of 167 exceeds 100 columns
#41: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:69:
+#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:41: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#41: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:69:
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

-:41: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#41: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:69:
+#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:41: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#41: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:69:
+#define XE_RTP_PASTE_13(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_12(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:42: WARNING:LONG_LINE: line length of 167 exceeds 100 columns
#42: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:70:
+#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:42: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#42: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:70:
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

-:42: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#42: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:70:
+#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:42: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#42: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:70:
+#define XE_RTP_PASTE_14(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_13(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:43: WARNING:LONG_LINE: line length of 167 exceeds 100 columns
#43: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:71:
+#define XE_RTP_PASTE_15(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_14(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:43: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#43: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:71:
+#define XE_RTP_PASTE_15(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_14(prefix_, sep_, _XE_TUPLE_TAIL args_)

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

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#43: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:71:
+#define XE_RTP_PASTE_15(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_14(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#43: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:71:
+#define XE_RTP_PASTE_15(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_14(prefix_, sep_, _XE_TUPLE_TAIL args_)

total: 3 errors, 3 warnings, 6 checks, 25 lines checked
9b8b31f58ca8 drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset


