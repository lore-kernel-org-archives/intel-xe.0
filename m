Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E11E6B242
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 10:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1703310E973;
	Fri,  1 Nov 2024 10:11:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6744E10E976;
 Fri,  1 Nov 2024 10:11:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_build_error?=
 =?utf-8?q?_for_XE=5FIOCTL=5FDBG_macro_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gyeyoung Baek" <gye976@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Nov 2024 10:11:46 -0000
Message-ID: <173045590641.1387146.6408364807662249875@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029084859.135172-1-gye976@gmail.com>
In-Reply-To: <20241029084859.135172-1-gye976@gmail.com>
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

Series: drm/xe: Fix build error for XE_IOCTL_DBG macro (rev3)
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
commit 173447bfb1cba2481cce57a600a56fd9f354050c
Author: Gyeyoung Baek <gye976@gmail.com>
Date:   Tue Oct 29 17:48:58 2024 +0900

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
    
    Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
+ /mt/dim checkpatch 73837e0500d417f9ff3afdf145ee7e1b152d9c24 drm-intel
173447bfb1cb drm/xe: Fix build error for XE_IOCTL_DBG macro
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
  248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


