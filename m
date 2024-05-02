Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02412C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 20:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8D110F76C;
	Thu,  2 May 2024 20:07:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75E710F760;
 Thu,  2 May 2024 20:07:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Define_generic_helpers_fo?=
 =?utf-8?q?r_manipulating_macro_arguments_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 20:07:14 -0000
Message-ID: <171468043481.1869305.11048108497734486346@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502195619.2483-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240502195619.2483-1-michal.wajdeczko@intel.com>
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

Series: Define generic helpers for manipulating macro arguments (rev2)
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
commit 929a46fe29bf7166493cfbb50bdaed3ff84caf76
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu May 2 21:56:19 2024 +0200

    drm/xe/rtp: Prefer helper macros from xe_args.h
    
    Some custom implementation can be replaced with generic macros
    from the linux/args.h or xe_args.h.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 9bc56b5d5f4e38bd455b3bc78932b73af09a9b72 drm-intel
158ec7ef910e drm/xe: Add helpers for manipulating macro arguments
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

-:134: ERROR:SPACING: space prohibited before that ',' (ctx:WxE)
#134: FILE: drivers/gpu/drm/xe/xe_args.h:112:
+#define ARGS_SEP_COMMA			,
                       			^

-:134: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#134: FILE: drivers/gpu/drm/xe/xe_args.h:112:
+#define ARGS_SEP_COMMA			,

total: 2 errors, 1 warnings, 0 checks, 114 lines checked
929a46fe29bf drm/xe/rtp: Prefer helper macros from xe_args.h
-:74: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#74: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:56:
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)

-:74: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#74: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:56:
+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)

-:76: WARNING:LONG_LINE: line length of 166 exceeds 100 columns
#76: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:76: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#76: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:76: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#76: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:76: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#76: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:77: WARNING:LONG_LINE: line length of 166 exceeds 100 columns
#77: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:77: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#77: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#77: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#77: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:78: WARNING:LONG_LINE: line length of 166 exceeds 100 columns
#78: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:78: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#78: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:78: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#78: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:78: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#78: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

total: 3 errors, 4 warnings, 7 checks, 65 lines checked


