Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1645DC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 16:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C574F10FCCA;
	Tue, 23 Apr 2024 16:04:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469E610FCE1;
 Tue, 23 Apr 2024 16:04:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_Revert_=22drm/xe/vm=3A_drop_vm-=3Edestroy=5Fwork=22_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 16:04:08 -0000
Message-ID: <171388824828.1608578.15690292135471765059@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423074721.119633-3-matthew.auld@intel.com>
In-Reply-To: <20240423074721.119633-3-matthew.auld@intel.com>
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

Series: series starting with [1/2] Revert "drm/xe/vm: drop vm->destroy_work" (rev2)
URL   : https://patchwork.freedesktop.org/series/132756/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3012fe112a0780da3e8ed0e23e6f1ea0c804c29c
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Apr 23 08:47:23 2024 +0100

    drm/xe/vm: prevent UAF in rebind_work_func()
    
    We flush the rebind worker during the vm close phase, however in places
    like preempt_fence_work_func() we seem to queue the rebind worker
    without first checking if the vm has already been closed.  The concern
    here is the vm being closed with the worker flushed, but then being
    rearmed later, which looks like potential uaf, since there is no actual
    refcounting to track the queued worker. We can't take the vm->lock here
    in preempt_rebind_work_func() to first check if the vm is closed since
    that will deadlock, so instead flush the worker again when the vm
    refcount reaches zero.
    
    v2:
     - Grabbing vm->lock in the preempt worker creates a deadlock, so
       checking the closed state is tricky. Instead flush the worker when
       the refcount reaches zero. It should be impossible to queue the
       preempt worker without already holding vm ref.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1676
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1591
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1304
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1249
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch d3158dfc418559bcd958bae7af47374e38d6f468 drm-intel
02706f940276 Revert "drm/xe/vm: drop vm->destroy_work"
3012fe112a07 drm/xe/vm: prevent UAF in rebind_work_func()


