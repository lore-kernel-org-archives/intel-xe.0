Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8668AE95A91
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 09:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF8110E25C;
	Mon,  9 Oct 2023 09:58:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C13910E25C;
 Mon,  9 Oct 2023 09:58:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 280CCAA915;
 Mon,  9 Oct 2023 09:58:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 09 Oct 2023 09:58:05 -0000
Message-ID: <169684548516.24833.14522802777938456051@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231009090037.29132-2-matthew.auld@intel.com>
In-Reply-To: <20231009090037.29132-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/bo=3A_don=27t_hold_dma-resv_lock_over_drm=5Fgem=5Fhandle?=
 =?utf-8?q?=5Fcreate?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/bo: don't hold dma-resv lock over drm_gem_handle_create
URL   : https://patchwork.freedesktop.org/series/124804/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d52c5b8b92b155d59e10490d94f97bab665994fe
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Oct 9 10:00:38 2023 +0100

    drm/xe/bo: don't hold dma-resv lock over drm_gem_handle_create
    
    This seems to create a locking inversion with object_name_lock. The lock
    is held by drm_prime_fd_to_handle when calling our xe_gem_prime_import
    hook, which might eventually go on to grab the dma-resv lock during the
    attach. However we also have the opposite locking order in
    xe_gem_create_ioctl which is holding the dma-resv lock when calling
    drm_gem_handle_create, which wants to eventually grab object_name_lock:
    
    -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
    <4> [635.739288]        lock_acquire+0x169/0x3d0
    <4> [635.739294]        __ww_mutex_lock.constprop.0+0x164/0x1e60
    <4> [635.739300]        ww_mutex_lock_interruptible+0x42/0x1a0
    <4> [635.739305]        drm_gem_shmem_pin+0x4b/0x140 [drm_shmem_helper]
    <4> [635.739317]        dma_buf_dynamic_attach+0x101/0x430
    <4> [635.739323]        xe_gem_prime_import+0xcc/0x2e0 [xe]
    <4> [635.739499]        drm_prime_fd_to_handle_ioctl+0x184/0x2e0 [drm]
    <4> [635.739594]        drm_ioctl_kernel+0x16f/0x250 [drm]
    <4> [635.739693]        drm_ioctl+0x35e/0x620 [drm]
    <4> [635.739789]        __x64_sys_ioctl+0xb7/0xf0
    <4> [635.739794]        do_syscall_64+0x3c/0x90
    <4> [635.739799]        entry_SYSCALL_64_after_hwframe+0x6e/0xd8
    <4> [635.739805]
    -> #0 (&dev->object_name_lock){+.+.}-{3:3}:
    <4> [635.739813]        check_prev_add+0x1ba/0x14a0
    <4> [635.739818]        __lock_acquire+0x203e/0x2ff0
    <4> [635.739823]        lock_acquire+0x169/0x3d0
    <4> [635.739827]        __mutex_lock+0x124/0x1310
    <4> [635.739832]        drm_gem_handle_create+0x32/0x50 [drm]
    <4> [635.739927]        xe_gem_create_ioctl+0x1d3/0x550 [xe]
    <4> [635.740102]        drm_ioctl_kernel+0x16f/0x250 [drm]
    <4> [635.740197]        drm_ioctl+0x35e/0x620 [drm]
    <4> [635.740293]        __x64_sys_ioctl+0xb7/0xf0
    <4> [635.740297]        do_syscall_64+0x3c/0x90
    <4> [635.740302]        entry_SYSCALL_64_after_hwframe+0x6e/0xd8
    <4> [635.740307]
    
    It looks like it should be safe to simply drop the dma-resv lock prior
    to publishing the object when calling drm_gem_handle_create.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/743
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 973ab92d198430d6023aa21b93ce665193b00342 drm-intel
d52c5b8b9 drm/xe/bo: don't hold dma-resv lock over drm_gem_handle_create


