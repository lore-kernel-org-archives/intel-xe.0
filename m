Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC663D1BDC3
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 16:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7AF10E482;
	Mon,  4 Nov 2024 16:57:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C9B10E4A9;
 Mon,  4 Nov 2024 16:57:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_build_error?=
 =?utf-8?q?_for_XE=5FIOCTL=5FDBG_macro_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "gyeyoung" <gye976@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Nov 2024 16:57:19 -0000
Message-ID: <173073943927.1400537.17381140953765975684@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241102022204.155039-1-gye976@gmail.com>
In-Reply-To: <20241102022204.155039-1-gye976@gmail.com>
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

Series: drm/xe: Fix build error for XE_IOCTL_DBG macro (rev5)
URL   : https://patchwork.freedesktop.org/series/140594/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 452d5f2ac0a5197c1d2a336cd9f98d945b5949c2
Author: Gyeyoung Baek <gye976@gmail.com>
Date:   Sat Nov 2 11:22:03 2024 +0900

    drm/xe: Fix build error for XE_IOCTL_DBG macro
    
    if CONFIG_DRM_USE_DYNAMIC_DEBUG is set,
    'drm_dbg' function is replaced with '__dynamic_func_call_cls',
    which is replaced with a do while statement.
    so in the previous code, there are the following build errors.
    
    include/linux/dynamic_debug.h:221:58: error: expected expression before ‘do’
      221 | #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
          |                                                          ^~
    include/linux/dynamic_debug.h:248:9: note: in expansion of macro ‘__dynamic_func_call_cls’
      248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
          |         ^~~~~~~~~~~~~~~~~~~~~~~
    include/drm/drm_print.h:425:9: note: in expansion of macro ‘_dynamic_func_call_cls’
      425 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
          |         ^~~~~~~~~~~~~~~~~~~~~~
    include/drm/drm_print.h:504:9: note: in expansion of macro ‘drm_dev_dbg’
      504 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
          |         ^~~~~~~~~~~
    include/drm/drm_print.h:522:33: note: in expansion of macro ‘drm_dbg_driver’
      522 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
          |                                 ^~~~~~~~~~~~~~
    drivers/gpu/drm/xe/xe_macros.h:14:21: note: in expansion of macro ‘drm_dbg’
       14 |         ((cond) && (drm_dbg(&(xe)->drm, \
          |                     ^~~~~~~
    drivers/gpu/drm/xe/xe_bo.c:2029:13: note: in expansion of macro ‘XE_IOCTL_DBG’
     2029 |         if (XE_IOCTL_DBG(xe, !gem_obj))
    
    the problem is that,
    XE_IOCTL_DBG uses this function for conditional expr.
    
    so I fix the expr to be compatible with the do while statement,
    by referring to "https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html".
    
    v2: I modified this to print when only cond is true.
    v3: Modify to evaluate cond only once.
    v4: There was a mistake in v3, send this again.
    
    Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
+ /mt/dim checkpatch 0a6cc4357ae4d824f909468ca1deed28ae5ac96f drm-intel
452d5f2ac0a5 drm/xe: Fix build error for XE_IOCTL_DBG macro
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
  248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)

-:61: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#61: FILE: drivers/gpu/drm/xe/xe_macros.h:15:
+^Iif (cond__)                                           ^I^I\$

-:62: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#62: FILE: drivers/gpu/drm/xe/xe_macros.h:16:
+^I^Idrm_dbg(&(xe)->drm,                                    ^I\$

-:64: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#64: FILE: drivers/gpu/drm/xe/xe_macros.h:18:
+^I^I^I__FILE__, __LINE__, #cond);                    ^I\$

-:65: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#65: FILE: drivers/gpu/drm/xe/xe_macros.h:19:
+^Icond__;                                                        ^I\$

total: 0 errors, 5 warnings, 0 checks, 17 lines checked


