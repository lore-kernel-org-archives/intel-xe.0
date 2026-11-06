Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA6E606A329
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 03:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437BA10E259;
	Fri,  6 Nov 2026 03:15:19 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFFD10E259;
 Fri,  6 Nov 2026 03:15:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/xe=3A_Preserve_healthy_preempted_LR_queues_across_syste?=
 =?utf-8?q?m_suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Huajun Li" <huajun.li@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Nov 2026 03:15:17 -0000
Message-ID: <179393491790.129844.8341971903696128322@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106042332.412621-1-huajun.li@intel.com>
In-Reply-To: <20261106042332.412621-1-huajun.li@intel.com>
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

Series: series starting with [1/1] drm/xe: Preserve healthy preempted LR queues across system suspend
URL   : https://patchwork.freedesktop.org/series/177913/
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
commit 824c5ef7fd4f60ab885a08c2fc7bc0fd66d273a6
Author: Huajun Li <huajun.li@intel.com>
Date:   Fri Nov 6 12:23:32 2026 +0800

    drm/xe: Preserve healthy preempted LR queues across system suspend
    
    System suspend uses the same submission-stop path as GT reset recovery.
    That path can ban user exec queues with started but unfinished jobs.
    Long-running (LR) compute jobs remain unfinished after preemption, so
    successfully suspended LR queues can be banned during system sleep.
    
    Introduce a suspend-specific submission-stop path that exempts healthy
    LR queues with completed suspension from the reset recovery ban policy.
    Require the suspended state, cleared suspend_pending, and cleared
    pending-disable state: the suspended bit is set before GuC acknowledges
    scheduling disable and does not prove completion by itself.
    
    Keep the existing ban policy for queues that fail these checks and for
    normal reset recovery. Log incomplete LR suspension to aid diagnosis.
    
    Stop CT and synchronize with the G2H worker before sampling queue state
    and issuing the GuC soft reset. CT stop does not drain outstanding
    acknowledgments.
    
    Fix an issue where system suspend/resume fails with GPU hang errors when
    running heavy AI workloads. The failure signature is logged as follows:
    
    =================================================================
    [ 6699.403689] PM: suspend entry (s2idle)
    [ 6699.405880] Filesystems sync: 0.002 seconds
    [ 6700.245000] Freezing user space processes
    [ 6700.247957] Freezing user space processes completed (elapsed 0.002 seconds)
    [ 6700.247964] OOM killer disabled.
    [ 6700.247966] Freezing remaining freezable tasks
    [ 6700.249672] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
    [ 6700.249677] printk: Suspending console(s) (use no_console_suspend to debug)
    [ 6700.412418] xe 0000:00:02.0: [drm] Tile0: GT0: Timedout job: seqno=6972, lrc_seqno=6972, guc_id=13, flags=0x20 in python3 [3208]
    [ 6700.412987] xe 0000:00:02.0: [drm] Xe device coredump has been created
    [ 6700.412991] xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
    [ 6700.413071] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Force wake domain 0: wake. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!
    [ 6700.413086] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Force wake domain 1: wake. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!
    ...
    
    Signed-off-by: Baichen Zhang <baichenx.zhang@intel.com>
    Signed-off-by: Huajun Li <huajun.li@intel.com>
+ /mt/dim checkpatch 939254095daf14bd6ed8b6ec575d9b0ac390d781 drm-intel
824c5ef7fd4f drm/xe: Preserve healthy preempted LR queues across system suspend
-:76: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#76: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:2737:
+static bool guc_exec_queue_should_preserve_lr(struct xe_guc *guc,
+				struct xe_exec_queue *q, bool suspend)

total: 0 errors, 0 warnings, 1 checks, 125 lines checked


