Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32B5C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 17:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6009210F279;
	Wed, 17 Apr 2024 17:28:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D85510F279;
 Wed, 17 Apr 2024 17:28:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vm=3A_prevent_UAF_?=
 =?utf-8?q?in_rebind=5Fwork=5Ffunc=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 17:28:55 -0000
Message-ID: <171337493525.1482849.16588780133804316585@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417163107.270053-2-matthew.auld@intel.com>
In-Reply-To: <20240417163107.270053-2-matthew.auld@intel.com>
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

Series: drm/xe/vm: prevent UAF in rebind_work_func()
URL   : https://patchwork.freedesktop.org/series/132571/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f5fb02e01091a469b6325b72a47b3a0a1e96309c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ab31e8462d276b92d43188e83fae015e388f7f74
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Apr 17 17:31:08 2024 +0100

    drm/xe/vm: prevent UAF in rebind_work_func()
    
    We flush the rebind worker during the vm close phase, however in places
    like preempt_fence_work_func() we seem to queue the rebind worker
    without first checking if the vm has already been closed.  The concern
    here is the vm being closed with the worker flushed, but then being
    rearmed later, which looks like potential uaf, since there is no actual
    refcounting to track the queued worker. To ensure this can't happen
    prevent queueing the rebind worker once the vm has been closed.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1591
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1304
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1249
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch 64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3 drm-intel
ab31e8462d27 drm/xe/vm: prevent UAF in rebind_work_func()


