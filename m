Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3613C25B5C
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 03:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D36A10E5EF;
	Tue,  7 May 2024 03:29:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2635710E8BE;
 Tue,  7 May 2024 03:29:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Rename_few_xe?=
 =?utf-8?q?=5Fargs=2Eh_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 May 2024 03:29:52 -0000
Message-ID: <171505259215.1960082.5348837815171381026@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506215618.2703-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240506215618.2703-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Rename few xe_args.h macros
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
commit 1385169e09a5dacf298de74a0e080d55b5cad195
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon May 6 23:56:18 2024 +0200

    drm/xe: Rename few xe_args.h macros
    
    To minimize the risk of future name collisions, rename macros to
    always include the ARG or ARGS tag:
    
      DROP_FIRST to ARGS_TAIL
      PICK_FIRST to FIRST_ARG
      PICK_LAST to LAST_ARG
    
    Suggested-by:: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 980de4c8f9c4fc65bd51d355372e06dc576c3ea7 drm-intel
1385169e09a5 drm/xe: Rename few xe_args.h macros
-:13: WARNING:BAD_SIGN_OFF: Use a single space after Suggested-by:
#13: 
Suggested-by:: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-:290: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#290: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:290: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#290: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:290: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#290: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:290: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#290: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:58:
+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:291: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#291: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:291: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#291: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:291: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#291: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:291: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#291: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:59:
+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:292: WARNING:LONG_LINE: line length of 165 exceeds 100 columns
#292: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:292: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#292: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:292: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'prefix_' - possible side-effects?
#292: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

-:292: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'args_' - possible side-effects?
#292: FILE: drivers/gpu/drm/xe/xe_rtp_helpers.h:60:
+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)

total: 3 errors, 4 warnings, 6 checks, 261 lines checked


