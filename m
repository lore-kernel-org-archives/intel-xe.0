Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA17C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 22:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB8E112723;
	Thu,  2 May 2024 22:54:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74601112723;
 Thu,  2 May 2024 22:54:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Define_generic_helpers_fo?=
 =?utf-8?q?r_manipulating_macro_arguments_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 22:54:57 -0000
Message-ID: <171469049747.1869305.6858458153479387900@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502223313.2527-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240502223313.2527-1-michal.wajdeczko@intel.com>
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

Series: Define generic helpers for manipulating macro arguments (rev3)
URL   : https://patchwork.freedesktop.org/series/133123/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 84ea8ad784373666de18fe96e7527634b9681cf1
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri May 3 00:33:13 2024 +0200

    drm/xe/rtp: Prefer helper macros from xe_args.h
    
    Some custom implementation can be replaced with generic macros
    from the linux/args.h or xe_args.h.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 92054b4391b7438d7af372e0415d96551353ae1c drm-intel
421f0104b193 drm/xe: Add helpers for manipulating macro arguments
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:19: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#19: 
new file mode 100644

-:142: ERROR:SPACING: space prohibited before that ',' (ctx:WxE)
#142: FILE: drivers/gpu/drm/xe/xe_args.h:119:
+#define ARGS_SEP_COMMA			,
                       			^

-:142: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#142: FILE: drivers/gpu/drm/xe/xe_args.h:119:
+#define ARGS_SEP_COMMA			,

total: 2 errors, 1 warnings, 0 checks, 121 lines checked
9c93d544da22 drm/xe/kunit: Add simple tests for new xe_args macros
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

-:40: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#40: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:12:
+#define foo	X, Y, Z, Q

-:54: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#54: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:26:
+#define foo	X, Y, Z, Q

-:67: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#67: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:39:
+#define foo	X, Y, Z, Q

-:81: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#81: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:53:
+#define foo	X, Y, Z, Q

-:93: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#93: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:65:
+#define foo(f)	f(X) f(Y) f(Z) f(Q)

-:93: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'f' - possible side-effects?
#93: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:65:
+#define foo(f)	f(X) f(Y) f(Z) f(Q)

-:112: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#112: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:84:
+#define FOO_ARGS	X, Y, Z, Q

-:113: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#113: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:85:
+#define MAX_ARGS	-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12

total: 7 errors, 1 warnings, 1 checks, 197 lines checked
84ea8ad78437 drm/xe/rtp: Prefer helper macros from xe_args.h
-:75: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#75: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:56:
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)

-:75: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#75: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:56:
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)

-:77: WARNING:LONG_LINE: line length of 166 exceeds 100 columns
#77: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:77: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#77: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#77: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#77: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:78: WARNING:LONG_LINE: line length of 166 exceeds 100 columns
#78: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:78: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#78: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:78: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#78: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:78: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#78: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:79: WARNING:LONG_LINE: line length of 166 exceeds 100 columns
#79: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:79: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#79: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:79: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#79: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:79: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#79: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

total: 3 errors, 4 warnings, 7 checks, 65 lines checked


