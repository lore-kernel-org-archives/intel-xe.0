Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D341C28B28
	for <intel-xe@archiver.kernel.org>; Sat, 15 Mar 2025 12:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576A610E28A;
	Sat, 15 Mar 2025 12:14:03 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC69510E03A;
 Sat, 15 Mar 2025 12:14:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Fix_b?=
 =?utf-8?q?uild_error_without_DRM=5FFBDEV=5FEMULATION?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yue Haibing" <yuehaibing@huawei.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Mar 2025 12:14:01 -0000
Message-ID: <174204084196.39706.8639648305422245174@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250315120143.2344958-1-yuehaibing@huawei.com>
In-Reply-To: <20250315120143.2344958-1-yuehaibing@huawei.com>
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

Series: drm/i915/display: Fix build error without DRM_FBDEV_EMULATION
URL   : https://patchwork.freedesktop.org/series/146350/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 058b9fa8312d457c82345b5047cdc63bfc699c25
Author: Yue Haibing <yuehaibing@huawei.com>
Date:   Sat Mar 15 20:01:43 2025 +0800

    drm/i915/display: Fix build error without DRM_FBDEV_EMULATION
    
    In file included from <command-line>:
    ./drivers/gpu/drm/i915/display/intel_fbdev.h: In function ‘intel_fbdev_framebuffer’:
    ./drivers/gpu/drm/i915/display/intel_fbdev.h:32:16: error: ‘NULL’ undeclared (first use in this function)
       32 |         return NULL;
          |                ^~~~
    ./drivers/gpu/drm/i915/display/intel_fbdev.h:1:1: note: ‘NULL’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
      +++ |+#include <stddef.h>
        1 | /* SPDX-License-Identifier: MIT */
    ./drivers/gpu/drm/i915/display/intel_fbdev.h:32:16: note: each undeclared identifier is reported only once for each function it appears in
       32 |         return NULL;
          |                ^~~~
    
    Build fails if CONFIG_DRM_FBDEV_EMULATION is n, add missing header file.
    
    Fixes: 9fa154f40eb6 ("drm/{i915,xe}: Run DRM default client setup")
    Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
+ /mt/dim checkpatch deccd667e475e826a1cdd91ab9aec4f897bd30c4 drm-intel
058b9fa8312d drm/i915/display: Fix build error without DRM_FBDEV_EMULATION


