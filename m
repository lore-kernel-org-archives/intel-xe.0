Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64751C4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 22:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F305A10F3A1;
	Wed,  1 May 2024 22:38:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE05A10F3A1;
 Wed,  1 May 2024 22:38:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Define_generic_helpers_fo?=
 =?utf-8?q?r_manipulating_macro_arguments?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 May 2024 22:38:28 -0000
Message-ID: <171460310890.1841037.15311189012679385490@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240501223221.2395-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240501223221.2395-1-michal.wajdeczko@intel.com>
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

Series: Define generic helpers for manipulating macro arguments
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
commit 416437a4f85a214f221fc6951804d5e72286218b
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu May 2 00:32:21 2024 +0200

    drm/xe/rtp: Prefer helper macros from args.h
    
    Some custom implementation can be replaced with generic macros
    from the args.h.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 0c418be899e4476fb09eec9f6693432bcc0c45d1 drm-intel
6fea51ff7703 args.h: add more helpers for manipulating macro arguments
-:121: ERROR:SPACING: space prohibited before that ',' (ctx:WxE)
#121: FILE: include/linux/args.h:129:
+#define ARGS_SEP_COMMA			,
                       			^

-:121: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#121: FILE: include/linux/args.h:129:
+#define ARGS_SEP_COMMA			,

total: 2 errors, 0 warnings, 0 checks, 107 lines checked
416437a4f85a drm/xe/rtp: Prefer helper macros from args.h
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


