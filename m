Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0592ED68B3C
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 16:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EDA10E094;
	Thu, 14 Nov 2024 16:48:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBFB10E094;
 Thu, 14 Nov 2024 16:48:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/7=5D_drm/radeon=3A_switch_over_to_drm=5Fexec_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 16:48:25 -0000
Message-ID: <173160290505.4131425.5386456331583782105@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114153020.6209-1-christian.koenig@amd.com>
In-Reply-To: <20241114153020.6209-1-christian.koenig@amd.com>
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

Series: series starting with [1/7] drm/radeon: switch over to drm_exec v2
URL   : https://patchwork.freedesktop.org/series/141361/
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
commit 5816fada7c36eddb1a86a6b841522f7c89f6b9f0
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Thu Nov 14 16:30:20 2024 +0100

    drm/ttm: remove ttm_execbug_util
    
    Replaced by drm_exec and not used any more.
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch 5ca0ec447ff9c0868ef93556f1f99828be0fa336 drm-intel
f7ae6926484c drm/radeon: switch over to drm_exec v2
-:369: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 302 lines checked
f47b17679721 drm/qxl: switch to using drm_exec v2
-:201: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 161 lines checked
3c79c0ad19d1 drm/vmwgfx: start to phase out ttm_exec
-:10: WARNING:REPEATED_WORD: Possible repeated word: 'just'
#10: 
unnecessary complex calls with just just single BO dma_resv locking.

-:42: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!ticket"
#42: FILE: drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:540:
+	ret = ttm_bo_reserve(*bo, interruptible, (ticket == NULL), ticket);

-:111: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 2 warnings, 1 checks, 86 lines checked
d15b0b69e744 drm/vmwgfx: use the new drm_exec object
-:75: CHECK:LINE_SPACING: Please don't use multiple blank lines
#75: FILE: drivers/gpu/drm/vmwgfx/vmwgfx_validation.c:871:
+
+

-:160: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 1 checks, 131 lines checked
aef2ce0be9eb drm/vmwgfx: replace ttm_validate_buffer with separate struct
-:469: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 381 lines checked
cb0cfe735f42 drm/xe: drop unused component dependencies
-:60: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
5816fada7c36 drm/ttm: remove ttm_execbug_util
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
deleted file mode 100644

-:319: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 2 warnings, 0 checks, 10 lines checked


