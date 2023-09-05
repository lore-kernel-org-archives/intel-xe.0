Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B098BC83F3E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 11:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7443110E4B5;
	Tue,  5 Sep 2023 11:13:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B28DA10E4B3;
 Tue,  5 Sep 2023 11:13:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A9616A47E9;
 Tue,  5 Sep 2023 11:13:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Danilo Krummrich" <dakr@redhat.com>
Date: Tue, 05 Sep 2023 11:13:23 -0000
Message-ID: <169391240366.19170.18384266908524960@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230811023137.659037-1-matthew.brost@intel.com>
In-Reply-To: <20230811023137.659037-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_DRM_scheduler_changes_for_Xe_=28rev4=29?=
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

Series: DRM scheduler changes for Xe (rev4)
URL   : https://patchwork.freedesktop.org/series/121744/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 7ec520d3a drm/xe/selftests: make eviction test tile centric
=== git am output follows ===
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2331
error: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/etnaviv/etnaviv_sched.c:133
error: drivers/gpu/drm/etnaviv/etnaviv_sched.c: patch does not apply
error: patch failed: drivers/gpu/drm/lima/lima_sched.c:488
error: drivers/gpu/drm/lima/lima_sched.c: patch does not apply
error: patch failed: drivers/gpu/drm/msm/msm_ringbuffer.c:93
error: drivers/gpu/drm/msm/msm_ringbuffer.c: patch does not apply
error: patch failed: drivers/gpu/drm/nouveau/nouveau_sched.c:407
error: drivers/gpu/drm/nouveau/nouveau_sched.c: patch does not apply
error: patch failed: drivers/gpu/drm/panfrost/panfrost_job.c:831
error: drivers/gpu/drm/panfrost/panfrost_job.c: patch does not apply
error: patch failed: drivers/gpu/drm/scheduler/sched_main.c:48
error: drivers/gpu/drm/scheduler/sched_main.c: patch does not apply
error: patch failed: drivers/gpu/drm/v3d/v3d_sched.c:388
error: drivers/gpu/drm/v3d/v3d_sched.c: patch does not apply
error: patch failed: include/drm/gpu_scheduler.h:473
error: include/drm/gpu_scheduler.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/sched: Convert drm scheduler to use a work queue rather than kthread
Patch failed at 0001 drm/sched: Convert drm scheduler to use a work queue rather than kthread
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


