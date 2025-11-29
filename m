Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618D3CFD2F6
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 23:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1741310E218;
	Sat, 29 Nov 2025 23:02:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B6210E218;
 Sat, 29 Nov 2025 23:02:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/configfs=3A_free_a?=
 =?utf-8?q?ux=2E_array_after_storing_the_wa=5Fbb?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 29 Nov 2025 23:02:48 -0000
Message-ID: <176445736879.40284.5262512587409512318@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251129222541.3306090-1-michal.grzelak@intel.com>
In-Reply-To: <20251129222541.3306090-1-michal.grzelak@intel.com>
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

Series: drm/xe/configfs: free aux. array after storing the wa_bb
URL   : https://patchwork.freedesktop.org/series/158244/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 34d992b9c27a2b52b9a7b09cf7bacd6426106091
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Sat Nov 29 23:25:41 2025 +0100

    drm/xe/configfs: free aux. array after storing the wa_bb
    
    When commands issued via configfs are executed mid- or post GPU context
    restoration, a temporary buffer is reallocated in order to store all of
    commands of varying count. However, after content of the buffer has been
    copied to the desired location it is never freed, which causes following
    memory leak to appear when running igt@xe_configfs@ctx-restore-mid-bb:
    
        kmemleak_alloc+0x4a/0x90
        __kmalloc_node_track_caller_noprof+0x645/0x9d0
        krealloc_node_align_noprof+0x206/0x3c0
        wa_bb_store+0xf4/0x2c0 [xe]
        ctx_restore_mid_bb_store+0x21/0x30 [xe]
        configfs_write_iter+0xe6/0x150
        vfs_write+0x231/0x540
        ksys_write+0x6d/0xf0
        __x64_sys_write+0x19/0x30
        x64_sys_call+0x79/0x2350
        do_syscall_64+0x93/0x10f0
        entry_SYSCALL_64_after_hwframe+0x76/0x7e
    
    Deallocate temporary array upon finishing the store of batch buffer
    into wa_bb.
    
    Fixes: 39ac06f7006f ("drm/xe/configfs: Add post context restore bb")
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch 157d0854a24fa73f7516908563d3ee9eacc679fc drm-intel
34d992b9c27a drm/xe/configfs: free aux. array after storing the wa_bb
-:31: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '39ac06f7006f', maybe rebased or not pulled?
#31: 
Fixes: 39ac06f7006f ("drm/xe/configfs: Add post context restore bb")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


