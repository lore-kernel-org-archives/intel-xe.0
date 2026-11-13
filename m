Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149B606A8A5
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DF010FDD9;
	Fri, 13 Nov 2026 13:58:41 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32F410F2D1;
 Fri, 13 Nov 2026 13:58:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fix_UAF_race_be?=
 =?utf-8?q?tween_exec-queue_teardown_and_GuC_CT_pause-abort?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 13:58:40 -0000
Message-ID: <179457832098.20475.2771158659080650020@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
In-Reply-To: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe: fix UAF race between exec-queue teardown and GuC CT pause-abort
URL   : https://patchwork.freedesktop.org/series/178483/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 602ed71aba3eb286ba9531d9df55a45b6d665ca0
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Fri Nov 13 18:51:50 2026 +0530

    drm/xe: fix UAF race between exec-queue teardown and GuC CT pause-abort
    
    xe_guc_submit_pause_abort() walks guc->submission_state.exec_queue_lookup
    and unconditionally calls guc_exec_queue_kill() on every entry found,
    without verifying the queue hasn't already begun/finished its own
    independent teardown. guc_exec_queue_fini() (run once a queue's own
    refcount drops to zero via the normal close path) only erases its xarray
    entry partway through its body, via release_guc_id() -- so there is a
    window where a queue's refcount is already 0 but its xarray entry is
    still present.
    
    This was caught as a debug assertion firing on both BMG and CRI:
    
            xe 0000:00:03.0: [drm] Assertion `kref_read(&q->refcount)` failed!
            WARNING: drivers/gpu/drm/xe/xe_guc_submit.c:2242 at guc_exec_queue_kill+0x2e2/0x360 [xe]
            Call Trace:
             guc_exec_queue_kill+0x2e2/0x360 [xe]
             xe_guc_submit_pause_abort+0x8e/0xf0 [xe]
             guc_submit_fini+0x11f/0x180 [xe]
             devm_action_release+0x15/0x30
             ...
             device_release_driver_internal+0x230/0x270
             unbind_store+0xac/0xc0                          [BMG: igt@xe_configfs, sysfs unbind]
             pci_iov_remove_virtfn+0xd1/0x140
             sriov_disable+0x42/0x100
             pci_disable_sriov+0x23/0x40
             xe_pci_sriov_configure+0x2b9/0x1350 [xe]
             sriov_numvfs_store+0x136/0x1f0           [CRI: igt@xe_pmu, SR-IOV VF disable]
    
    Pin the queue with kref_get_unless_zero() before touching it, skipping entries
    that have already independently reached a zero refcount instead of operating on
    an object that's already being torn down elsewhere.
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch d41695c479e8bb24eb941e5ba916e42784af6f4d drm-intel
602ed71aba3e drm/xe: fix UAF race between exec-queue teardown and GuC CT pause-abort
-:34: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#34: 
Pin the queue with kref_get_unless_zero() before touching it, skipping entries

-:64: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 20 lines checked


