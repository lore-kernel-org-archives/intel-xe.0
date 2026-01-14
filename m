Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66193D31A0F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 05:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2584D10E39B;
	Wed, 14 Jan 2026 05:13:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5B610E39B;
 Wed, 14 Jan 2026 05:13:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_memory_leak?=
 =?utf-8?q?_in_guc=5Fexec=5Fqueue=5Ftimedout=5Fjob?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jan 2026 05:13:57 -0000
Message-ID: <176836763796.152800.6220862931912829479@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260114044140.4020785-1-jia.yao@intel.com>
In-Reply-To: <20260114044140.4020785-1-jia.yao@intel.com>
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

Series: drm/xe: Fix memory leak in guc_exec_queue_timedout_job
URL   : https://patchwork.freedesktop.org/series/160068/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6b0d67fe4ae4fe2b8be00edbae147b97b850a8c0
Author: Jia Yao <jia.yao@intel.com>
Date:   Wed Jan 14 04:41:40 2026 +0000

    drm/xe: Fix memory leak in guc_exec_queue_timedout_job
    
    When a timeout is resolved without creating a devcoredump (e.g., scheduling
    disable succeeds or check_timeout() determines there's no hang), the early
    pre-captured hardware engine snapshots allocated in guc_exec_queue_timedout_job
    are not freed. This leaves 64-byte snapshot structures and 8-byte engine name
    strings unreferenced, triggering kmemleak warnings.
    
    Fix by explicitly freeing pre-captured snapshots and releasing matched GuC
    capture nodes when returning DRM_GPU_SCHED_STAT_NO_HANG without creating a
    devcoredump.
    
    Reported by kmemleak:
      unreferenced object 0xffff8881078bb040 (size 64):
        xe_hw_engine_snapshot_capture+0x7d/0x500 [xe]
        xe_engine_snapshot_capture_for_queue+0x162/0x320 [xe]
        guc_exec_queue_timedout_job+0x99c/0x1ca0 [xe]
      unreferenced object 0xffff88810232f1c8 (size 8):
        kstrdup+0x38/0x90
        xe_hw_engine_snapshot_capture+0x97/0x500 [xe]
    
    Signed-off-by: Jia Yao <jia.yao@intel.com>
    Cc: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Xin Wang <x.wang@intel.com>
+ /mt/dim checkpatch 1580579412915ac76344699e53124b580060302d drm-intel
6b0d67fe4ae4 drm/xe: Fix memory leak in guc_exec_queue_timedout_job
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
pre-captured hardware engine snapshots allocated in guc_exec_queue_timedout_job

-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:65:
+static void cleanup_precaptured_snapshot_if_no_devcoredump(struct xe_device *xe,
+							  struct xe_gt *gt)

total: 0 errors, 1 warnings, 1 checks, 45 lines checked


