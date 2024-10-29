Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C29D5B874
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 06:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFA810E5A7;
	Tue, 29 Oct 2024 06:19:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D57210E5A6;
 Tue, 29 Oct 2024 06:19:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_build_error?=
 =?utf-8?q?_for_XE=5FIOCTL=5FDBG_macro_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "gyeyoung" <gye976@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 06:19:22 -0000
Message-ID: <173018276205.1357705.17703943112187145545@2413ebb6fbb6>
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

Series: drm/xe: Fix build error for XE_IOCTL_DBG macro (rev2)
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
commit 774c5db879794eb5ef105d806aa88be2a2d6a122
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
+ /mt/dim checkpatch 79811c7809c46a23b7cfceaf36d4994792c850da drm-intel
774c5db87979 drm/xe: Fix build error for XE_IOCTL_DBG macro
Use of uninitialized value in concatenation (.) or string at scripts/checkpatch.pl line 2029.


