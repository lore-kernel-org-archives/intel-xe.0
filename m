Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C13C4452D
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 05:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB0E10E74D;
	Wed, 22 Jul 2026 05:41:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9706110E74D;
 Wed, 22 Jul 2026 05:41:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=5Fads=3A_alloc?=
 =?utf-8?q?ate_UM_queues_in_a_separate_UC_BO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jul 2026 05:41:02 -0000
Message-ID: <178469886261.214685.12173774948189700048@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722053410.2767369-1-jia.yao@intel.com>
In-Reply-To: <20260722053410.2767369-1-jia.yao@intel.com>
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

Series: drm/xe/guc_ads: allocate UM queues in a separate UC BO
URL   : https://patchwork.freedesktop.org/series/170879/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b19a063d78acc72bfcc507071441e931bb38bdfb
Author: Jia Yao <jia.yao@intel.com>
Date:   Wed Jul 22 05:34:10 2026 +0000

    drm/xe/guc_ads: allocate UM queues in a separate UC BO
    
    The HW unit that writes to the UM fault queue is not always coherent
    with the CPU cache. Ensure the UM queue memory is uncached on the CPU
    side so that GuC always reads descriptors from memory rather than a
    stale CPU cache line.
    
    Allocate the UM queues in a dedicated UC BO (ads->um_queue_bo) instead
    of the main ADS blob. This also prevents xe_guc_ads_populate()'s
    memset from zeroing any fault descriptor written between GDRST and GuC
    restart. On dGFX, VRAM placement gives a well-defined DPA.
    
    v3: simplify commit message and code comments per reviewer feedback;
        add Fixes tag and stable Cc
    
    v2: also fix dGFX (VRAM placement + UC flag); remove now-dead
        guc_ads_um_queues_size/offset helpers
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Jia Yao <jia.yao@intel.com>
+ /mt/dim checkpatch 5726f9c4bde0290e5e60e636b9632bb03a57498c drm-intel
b19a063d78ac drm/xe/guc_ads: allocate UM queues in a separate UC BO
-:94: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#94: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:460:
+		bo = xe_managed_bo_create_pin_map(xe, tile,
+					  GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX,

total: 0 errors, 0 warnings, 1 checks, 121 lines checked


