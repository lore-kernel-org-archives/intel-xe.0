Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C6AC8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 15:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBF910E696;
	Tue,  8 Jul 2025 15:33:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F3210E115;
 Tue,  8 Jul 2025 15:33:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/sched=3A_Allow_driver?=
 =?utf-8?q?s_to_skip_the_reset_with_DRM=5FGPU=5FSCHED=5FSTAT=5FNO=5FHANG_=28?=
 =?utf-8?q?rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 15:33:13 -0000
Message-ID: <175198879353.143863.953207602813180416@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
In-Reply-To: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
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

Series: drm/sched: Allow drivers to skip the reset with DRM_GPU_SCHED_STAT_NO_HANG (rev4)
URL   : https://patchwork.freedesktop.org/series/149696/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bf9623d3b5d3a0aaa6d840733a2a3fb8704d595a
Author: Maíra Canal <mcanal@igalia.com>
Date:   Tue Jul 8 10:25:48 2025 -0300

    drm/panfrost: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
    
    Panfrost can skip the reset if TDR has fired before the free-job worker.
    Currently, since Panfrost doesn't take any action on these scenarios, the
    job is being leaked, considering that `free_job()` won't be called.
    
    To avoid such leaks, inform the scheduler that the job did not actually
    timeout and no reset was performed through the new status code
    DRM_GPU_SCHED_STAT_NO_HANG.
    
    Signed-off-by: Maíra Canal <mcanal@igalia.com>
    Reviewed-by: Steven Price <steven.price@arm.com>
+ /mt/dim checkpatch a47871d8948c3cd802af1ee3684799cc798067d8 drm-intel
5da8124cfdcf drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RESET
31a35e5254f4 drm/sched: Allow drivers to skip the reset and keep on running
b3398ab45c08 drm/sched: Make timeout KUnit tests faster
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
[15:42:26] Elapsed time: 15.637s total, 0.002s configuring, 10.387s building, 5.229s running

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
60cad55c3f89 drm/sched: Add new test for DRM_GPU_SCHED_STAT_NO_HANG
62be011678a2 drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
dbccd2c25038 drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
95347bd1b3b1 drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
bf9623d3b5d3 drm/panfrost: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset


