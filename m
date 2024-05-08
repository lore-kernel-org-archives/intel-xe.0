Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C0FC19F4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 17:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAC5113122;
	Wed,  8 May 2024 17:20:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C355113122;
 Wed,  8 May 2024 17:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Rename_few_xe?=
 =?utf-8?q?=5Fargs=2Eh_macros_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 17:20:14 -0000
Message-ID: <171518881424.2017562.2607205627924406515@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508171000.1864-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240508171000.1864-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Rename few xe_args.h macros (rev3)
URL   : https://patchwork.freedesktop.org/series/133258/
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
commit c875457bb76a4266fd0858cf6d53a5b5f9e32eaf
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed May 8 19:10:00 2024 +0200

    drm/xe: Rename few xe_args.h macros
    
    To minimize the risk of future name collisions, rename macros to
    always include the ARG or ARGS tag:
    
      DROP_FIRST to DROP_FIRST_ARG
      PICK_FIRST to FIRST_ARG
      PICK_LAST to LAST_ARG
    
    Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> #v2
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 34d52122a69076639d526b035c8edd5b43201f84 drm-intel
c875457bb76a drm/xe: Rename few xe_args.h macros
-:74: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#74: FILE: drivers/gpu/drm/xe/tests/xe_args_test.c:67:
+#define foo	X, Y, Z, Q

-:347: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#347: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:347: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#347: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:347: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#347: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:347: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#347: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:348: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#348: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:348: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#348: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:348: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#348: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:348: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#348: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:349: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#349: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:349: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#349: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:349: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#349: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:349: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#349: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

total: 4 errors, 3 warnings, 6 checks, 317 lines checked


