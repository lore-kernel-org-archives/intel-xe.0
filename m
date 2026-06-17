Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E8FCD98E1
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 02:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A213F10E8D6;
	Wed, 17 Jun 2026 02:38:52 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD1510E8D6;
 Wed, 17 Jun 2026 02:38:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_Drop_tt-=3Eres?=
 =?utf-8?q?tore_after_successful_restore?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jun 2026 02:38:51 -0000
Message-ID: <178166393143.86684.16014983554853524035@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617015531.1164189-1-matthew.brost@intel.com>
In-Reply-To: <20260617015531.1164189-1-matthew.brost@intel.com>
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

Series: drm/ttm: Drop tt->restore after successful restore
URL   : https://patchwork.freedesktop.org/series/168645/
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
commit 9d57ab01821dbdb69ac4c88bb60cdd722dc9c4ff
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 16 18:55:31 2026 -0700

    drm/ttm: Drop tt->restore after successful restore
    
    ttm_pool_restore_and_alloc() can successfully complete the restore
    process via ttm_pool_restore_commit(), but tt->restore is not dropped
    afterward. As a result, subsequent backup/restore flows observe what
    appears to be a completed restore, while in reality shmem handles are
    still installed in tt->pages, leading to the stack trace below.
    
    Fix this by freeing and dropping tt->restore in
    ttm_pool_restore_and_alloc() upon successful completion of the restore.
    
    20545 [  309.784531] RIP: 0010:sg_alloc_append_table_from_pages+0x38c/0x490
    20547 [  309.809570] RSP: 0018:ffffc9000623b838 EFLAGS: 00010206
    20548 [  309.814827] RAX: 0000000000001000 RBX: ffff88816e42a160 RCX: 0000000000000000
    20549 [  309.821986] RDX: 0000000000002000 RSI: 0000000000000003 RDI: 0000000000001000
    20550 [  309.829147] RBP: ffff88816e42a168 R08: 0000000000000002 R09: 000000007ffff000
    20551 [  309.836310] R10: ffffc9000623b928 R11: 0000000000000000 R12: 000000007ffff000
    20552 [  309.843471] R13: ffff88815ba5a100 R14: 0000000000000000 R15: 0000000000000001
    20553 [  309.850634] FS:  00007f9ff305e700(0000) GS:ffff888276c94000(0000) knlGS:0000000000000000
    20554 [  309.858749] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    20555 [  309.864519] CR2: 00007f9fca701000 CR3: 00000001565e2005 CR4: 0000000008f70ef0
    20556 [  309.871678] PKRU: 55555558
    20557 [  309.874403] Call Trace:
    20558 [  309.876866]  <TASK>
    20559 [  309.878988]  sg_alloc_table_from_pages_segment+0x60/0x100
    20560 [  309.884415]  ? ttm_resource_manager_usage+0x36/0x60 [ttm]
    20561 [  309.889845]  ? xe_tt_map_sg+0x7d/0xd0 [xe]
    20562 [  309.894045]  xe_tt_map_sg+0x7d/0xd0 [xe]
    20563 [  309.898037]  xe_bo_move+0x927/0xaa0 [xe]
    20564 [  309.902029]  ttm_bo_handle_move_mem+0xba/0x170 [ttm]
    20565 [  309.907022]  ttm_bo_validate+0xbe/0x190 [ttm]
    20566 [  309.911405]  xe_bo_validate+0x9a/0x120 [xe]
    20567 [  309.915663]  xe_gpuvm_validate+0xd9/0x140 [xe]
    20568 [  309.920206]  drm_gpuvm_validate+0x2f0/0x5b0 [drm_gpuvm]
    20569 [  309.925459]  ? drm_exec_lock_obj+0x63/0x210 [drm_exec]
    20570 [  309.930627]  xe_vm_validate_rebind+0x46/0xb0 [xe]
    20571 [  309.935428]  xe_exec_fn+0x20/0x40 [xe]
    20572 [  309.939249]  drm_gpuvm_exec_lock+0x78/0xc0 [drm_gpuvm]
    20573 [  309.944410]  xe_validation_exec_lock+0x5a/0xa0 [xe]
    20574 [  309.949385]  xe_exec_ioctl+0x806/0xc30 [xe]
    20575 [  309.953639]  ? ttwu_queue_wakelist+0xd9/0xf0
    20576 [  309.957935]  ? __pfx_xe_exec_fn+0x10/0x10 [xe]
    20577 [  309.962449]  ? __wake_up_common+0x73/0xa0
    20578 [  309.966482]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
    20579 [  309.971263]  drm_ioctl_kernel+0xa3/0x100
    20580 [  309.975209]  drm_ioctl+0x213/0x440
    20581 [  309.978637]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
    20582 [  309.983415]  xe_drm_ioctl+0x67/0xd0 [xe]
    20583 [  309.987408]  __x64_sys_ioctl+0x7f/0xd0
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: Huang Rui <ray.huang@amd.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-kernel@vger.kernel.org
    Cc: stable@vger.kernel.org
    Fixes: b63d715b8090 ("drm/ttm/pool, drm/ttm/tt: Provide a helper to shrink pages")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 29ea43790111df065ed84e6cb076c64322c306f1 drm-intel
9d57ab01821d drm/ttm: Drop tt->restore after successful restore
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
20545 [  309.784531] RIP: 0010:sg_alloc_append_table_from_pages+0x38c/0x490

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


