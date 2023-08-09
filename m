Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC02C0015E
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 22:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7DF10E137;
	Wed,  9 Aug 2023 22:54:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 11DDF10E135;
 Wed,  9 Aug 2023 22:54:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F301CAADEB;
 Wed,  9 Aug 2023 22:54:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Danilo Krummrich" <dakr@redhat.com>
Date: Wed, 09 Aug 2023 22:54:12 -0000
Message-ID: <169162165296.10294.4903076994933191477@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230809221729.3657-1-dakr@redhat.com>
In-Reply-To: <20230809221729.3657-1-dakr@redhat.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/sched=3A_support_multiple_rings_per_gpu=5Fscheduler?=
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

Series: drm/sched: support multiple rings per gpu_scheduler
URL   : https://patchwork.freedesktop.org/series/122247/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: b921a7374 drm/xe: Add Wa_14015150844 for DG2 and Xe_LPG
=== git am output follows ===
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2491
error: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/etnaviv/etnaviv_sched.c:133
error: drivers/gpu/drm/etnaviv/etnaviv_sched.c: patch does not apply
error: patch failed: drivers/gpu/drm/lima/lima_sched.c:488
error: drivers/gpu/drm/lima/lima_sched.c: patch does not apply
error: patch failed: drivers/gpu/drm/msm/msm_ringbuffer.c:93
error: drivers/gpu/drm/msm/msm_ringbuffer.c: patch does not apply
error: drivers/gpu/drm/nouveau/nouveau_sched.c: does not exist in index
error: patch failed: drivers/gpu/drm/panfrost/panfrost_job.c:814
error: drivers/gpu/drm/panfrost/panfrost_job.c: patch does not apply
error: patch failed: drivers/gpu/drm/scheduler/sched_main.c:24
error: drivers/gpu/drm/scheduler/sched_main.c: patch does not apply
error: patch failed: drivers/gpu/drm/v3d/v3d_sched.c:387
error: drivers/gpu/drm/v3d/v3d_sched.c: patch does not apply
error: patch failed: include/drm/gpu_scheduler.h:465
error: include/drm/gpu_scheduler.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/sched: support multiple rings per gpu_scheduler
Patch failed at 0001 drm/sched: support multiple rings per gpu_scheduler
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


