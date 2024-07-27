Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB79EC3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 02:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB87010E08C;
	Sat, 27 Jul 2024 02:57:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D14C10E08C;
 Sat, 27 Jul 2024 02:57:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_rtp_when_processing_O?=
 =?utf-8?q?OB_workarounds_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 27 Jul 2024 02:57:36 -0000
Message-ID: <172204905605.387619.6148780722751647616@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240727015907.899192-1-lucas.demarchi@intel.com>
In-Reply-To: <20240727015907.899192-1-lucas.demarchi@intel.com>
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

Series: Fix rtp when processing OOB workarounds (rev4)
URL   : https://patchwork.freedesktop.org/series/136538/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ee2c6cfae16c094e1b3e138936ecec25f4dd6bf1
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Jul 26 18:59:07 2024 -0700

    drm/xe: Migrate OOB WAs to OR rules
    
    Now that rtp has OR rules, it's not needed to extend it to process OOB
    WAs. Previously if an entry had no name, it was considered as "a set of
    rules OR'ed with the last named entry".
    
    Instead of generating new entries, add OR rules. The syntax for
    xe_wa_oob.rules remains the same, with xe_gen_wa_oob generating the
    slightly different table. Object sizes delta are negligible, but having
    just one logic makes it easier to maintain:
    
            add/remove: 0/0 grow/shrink: 1/2 up/down: 160/-269 (-109)
            Function                                     old     new   delta
            __compound_literal                          6104    6264    +160
            xe_wa_dump                                  1839    1810     -29
            oob_was                                      816     576    -240
            Total: Before=17257, After=17148, chg -0.63%
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e948842a6cba538c9f5f5dc8535a88d82a3fc0fe drm-intel
71c9c0be5f40 drm/xe/kunit: Test WAs for BMG
812a2ce78b9e drm/xe/kunit: Rename count to count_sr_entries
e66f1953ef8f drm/xe/kunit: Test active rtp entries
f113dd5253b3 drm/xe/kunit: Rename rtp test cases
232444888edd drm/xe/kunit: Test rtp with no actions
5c3ce4487d18 drm/xe/rtp: Simplify marking active workarounds
3878dd578a8d drm/xe/rtp: Expand max rules/actions per entry again
-:55: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#55: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:63:
+#define XE_RTP_PASTE_7(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_6(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:55: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#55: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:63:
+#define XE_RTP_PASTE_7(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_6(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:55: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#55: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:63:
+#define XE_RTP_PASTE_7(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_6(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:55: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#55: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:63:
+#define XE_RTP_PASTE_7(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_6(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:56: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#56: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:64:
+#define XE_RTP_PASTE_8(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_7(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:56: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#56: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:64:
+#define XE_RTP_PASTE_8(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_7(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:56: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#56: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:64:
+#define XE_RTP_PASTE_8(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_7(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:56: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#56: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:64:
+#define XE_RTP_PASTE_8(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_7(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:57: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#57: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:65:
+#define XE_RTP_PASTE_9(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_8(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:57: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#57: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:65:
+#define XE_RTP_PASTE_9(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_8(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:57: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#57: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:65:
+#define XE_RTP_PASTE_9(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_8(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:57: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#57: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:65:
+#define XE_RTP_PASTE_9(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_8(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:58: WARNING:LONG_LINE: line length of 166 exceeds 100 columns
#58: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:66:
+#define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:58: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#58: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:66:
+#define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:58: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#58: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:66:
+#define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:58: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#58: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:66:
+#define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:59: WARNING:LONG_LINE: line length of 167 exceeds 100 columns
#59: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:67:
+#define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:59: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#59: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:67:
+#define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:59: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#59: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:67:
+#define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:59: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#59: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:67:
+#define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:60: WARNING:LONG_LINE: line length of 167 exceeds 100 columns
#60: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:68:
+#define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:60: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#60: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:68:
+#define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:60: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#60: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:68:
+#define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:60: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#60: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:68:
+#define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)

total: 6 errors, 6 warnings, 12 checks, 28 lines checked
ee2c6cfae16c drm/xe: Migrate OOB WAs to OR rules


