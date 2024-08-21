Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A399C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 17:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B79610E68F;
	Wed, 21 Aug 2024 17:47:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DE810E68F;
 Wed, 21 Aug 2024 17:47:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fixup_xe=5Fallo?=
 =?utf-8?q?c=5Fpf=5Fqueue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Aug 2024 17:47:05 -0000
Message-ID: <172426242542.721581.1322819413520345241@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821171917.417386-2-matthew.auld@intel.com>
In-Reply-To: <20240821171917.417386-2-matthew.auld@intel.com>
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

Series: drm/xe: fixup xe_alloc_pf_queue
URL   : https://patchwork.freedesktop.org/series/137584/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4af590fe0fb63dfc67373759601cf87c46accbf9
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Aug 21 18:19:18 2024 +0100

    drm/xe: fixup xe_alloc_pf_queue
    
    kzalloc expects number of bytes, therefore we should convert the number
    of dw into bytes, otherwise we are likely just accessing beyond the
    array causing all kinds of carnage. Also fixup the error handling while
    we are here.
    
    Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Stuart Summers <stuart.summers@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ddbda36f876f53498924155abfa1cd4c58517903 drm-intel
4af590fe0fb6 drm/xe: fixup xe_alloc_pf_queue
-:25: WARNING:ALLOC_WITH_MULTIPLY: Prefer kcalloc over kzalloc with multiply
#25: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:420:
+	pf_queue->data = kzalloc(pf_queue->num_dw * sizeof(u32), GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


