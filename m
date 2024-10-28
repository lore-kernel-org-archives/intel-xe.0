Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7537AD3E2BA
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 19:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005D210E51F;
	Mon, 28 Oct 2024 19:20:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AE210E51F;
 Mon, 28 Oct 2024 19:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_build_error?=
 =?utf-8?q?_for_XE=5FIOCTL=5FDBG_macro?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gyeyoung Baek" <gye976@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 19:20:10 -0000
Message-ID: <173014321058.1355839.5389072143444641424@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241027045752.10530-1-gye976@gmail.com>
In-Reply-To: <20241027045752.10530-1-gye976@gmail.com>
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

Series: drm/xe: Fix build error for XE_IOCTL_DBG macro
URL   : https://patchwork.freedesktop.org/series/140594/
State : success

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
commit 4af7c289c9f7e1318407a8cf81362ac022436550
Author: Gyeyoung Baek <gye976@gmail.com>
Date:   Sun Oct 27 13:57:52 2024 +0900

    drm/xe: Fix build error for XE_IOCTL_DBG macro
    
    In the previous code, there is build error.
    if CONFIG_DRM_USE_DYNAMIC_DEBUG is set,
    'drm_dbg' function is replaced with '__dynamic_func_call_cls',
    which is replaced with a do while statement.
    
    The problem is that,
    XE_IOCTL_DBG uses this function for conditional expression.
    
    so I fix the expression to be compatible with the do while statement,
    by referring to "https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html".
    
    Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
+ /mt/dim checkpatch f21e568eed1e2d11e338b440ac2dd1c33fb9e7b1 drm-intel
4af7c289c9f7 drm/xe: Fix build error for XE_IOCTL_DBG macro
Use of uninitialized value in concatenation (.) or string at scripts/checkpatch.pl line 2029.


