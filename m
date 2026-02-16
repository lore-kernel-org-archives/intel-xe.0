Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E02E7BDA9
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 12:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D6010E05D;
	Mon, 16 Feb 2026 12:23:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B16710E04C;
 Mon, 16 Feb 2026 12:23:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/pagemap=3A_pass_pagem?=
 =?utf-8?q?ap=5Faddr_by_reference?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Feb 2026 12:23:39 -0000
Message-ID: <177124461955.255575.14784228109645564852@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260216121709.2345721-1-arnd@kernel.org>
In-Reply-To: <20260216121709.2345721-1-arnd@kernel.org>
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

Series: drm/pagemap: pass pagemap_addr by reference
URL   : https://patchwork.freedesktop.org/series/161644/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 37f57e8793234a759860d614a0643aa8be3ef556
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Feb 16 13:16:43 2026 +0100

    drm/pagemap: pass pagemap_addr by reference
    
    Passing a structure by reference into a function is sometimes problematic,
    for a number of reasons. Of of these is a warning from the 32-bit arm
    compiler:
    
    drivers/gpu/drm/drm_gpusvm.c: In function '__drm_gpusvm_unmap_pages':
    drivers/gpu/drm/drm_gpusvm.c:1152:33: note: parameter passing for argument of type 'struct drm_pagemap_addr' changed in GCC 9.1
     1152 |                                 dpagemap->ops->device_unmap(dpagemap,
          |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     1153 |                                                             dev, *addr);
          |                                                             ~~~~~~~~~~~
    
    This particular problem is harmless since we are not mixing compiler versions
    inside of the compiler. However, passing this by reference avoids the warning
    along with providing slightly better calling conventions as it avoids an
    extra copy on the stack.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 61f9012482333d2ee4749de5a493993211a28671 drm-intel
37f57e879323 drm/pagemap: pass pagemap_addr by reference
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
 1152 |                                 dpagemap->ops->device_unmap(dpagemap,

total: 0 errors, 1 warnings, 0 checks, 41 lines checked


