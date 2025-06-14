Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D641C71136
	for <intel-xe@archiver.kernel.org>; Sat, 14 Jun 2025 00:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1721810E9BF;
	Sat, 14 Jun 2025 00:18:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CEF10E9BD;
 Sat, 14 Jun 2025 00:18:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/sched=3A_Increment_jo?=
 =?utf-8?q?b_count_before_swapping_tail_spsc_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 14 Jun 2025 00:18:47 -0000
Message-ID: <174986032734.79414.17130318600829114061@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613212013.719312-1-matthew.brost@intel.com>
In-Reply-To: <20250613212013.719312-1-matthew.brost@intel.com>
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

Series: drm/sched: Increment job count before swapping tail spsc queue
URL   : https://patchwork.freedesktop.org/series/150259/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 639634fe6da168377daade63c2395e028ae87bec
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jun 13 14:20:13 2025 -0700

    drm/sched: Increment job count before swapping tail spsc queue
    
    A small race exists between spsc_queue_push and the run-job worker, in
    which spsc_queue_push may return not-first while the run-job worker has
    already idled due to the job count being zero. If this race occurs, job
    scheduling stops, leading to hangs while waiting on the job’s DMA
    fences.
    
    Seal this race by incrementing the job count before appending to the
    SPSC queue.
    
    This race was observed on a drm-tip 6.16-rc1 build with the Xe driver in
    an SVM test case.
    
    Fixes: 1b1f42d8fde4 ("drm: move amd_gpu_scheduler into common location")
    Fixes: 27105db6c63a ("drm/amdgpu: Add SPSC queue to scheduler.")
    Cc: stable@vger.kernel.org
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 4d016d6e602638e0ebc3895331224e057508c07a drm-intel
639634fe6da1 drm/sched: Increment job count before swapping tail spsc queue
-:37: WARNING:MEMORY_BARRIER: memory barrier without comment
#37: FILE: include/drm/spsc_queue.h:74:
+	smp_mb__after_atomic();

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


