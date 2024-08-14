Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FA9C52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 12:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B6010E45B;
	Wed, 14 Aug 2024 12:17:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2E710E45A;
 Wed, 14 Aug 2024 12:17:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_prevent_UAF_aro?=
 =?utf-8?q?und_preempt_fence?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Aug 2024 12:17:42 -0000
Message-ID: <172363786244.632722.8906727398133692253@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814110129.825847-2-matthew.auld@intel.com>
In-Reply-To: <20240814110129.825847-2-matthew.auld@intel.com>
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

Series: drm/xe: prevent UAF around preempt fence
URL   : https://patchwork.freedesktop.org/series/137297/
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
commit 2c85f26453b974fda401bc6eb7a7106c03b1a872
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Aug 14 12:01:30 2024 +0100

    drm/xe: prevent UAF around preempt fence
    
    The fence lock is part of the queue, therefore in the current design
    anything locking the fence should then also hold a ref to the queue to
    prevent the queue from being freed.
    
    However, currently it looks like we signal the fence and then drop the
    queue ref, but if something is waiting on the fence, the waiter is
    kicked to wake up at some later point, where upon waking up it first
    grabs the lock before checking the fence state. But if we have already
    dropped the queue ref, then the lock might already be freed as part of
    the queue, leading to uaf.
    
    To prevent this, move the fence lock into the fence itself so we don't
    run into lifetime issues. Alternative might be to have device level
    lock, or only release the queue in the fence release callback, however
    that might require pushing to another worker to avoid locking issues.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2454
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2342
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2020
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch 95179e2efd2e2f61d5453d323fdb6e136fc15df6 drm-intel
2c85f26453b9 drm/xe: prevent UAF around preempt fence
-:23: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#23: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2454

-:24: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#24: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2342

-:25: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#25: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2020

total: 0 errors, 3 warnings, 0 checks, 33 lines checked


