Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82377C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 03:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7B610E3ED;
	Tue, 31 Oct 2023 03:31:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0AB5510E3E9;
 Tue, 31 Oct 2023 03:31:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 014C5AADDD;
 Tue, 31 Oct 2023 03:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Danilo Krummrich" <dakr@redhat.com>
Date: Tue, 31 Oct 2023 03:31:29 -0000
Message-ID: <169872308997.27660.6770100759946614589@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231031032439.1558703-1-matthew.brost@intel.com>
In-Reply-To: <20231031032439.1558703-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_DRM_scheduler_changes_for_Xe_=28rev10=29?=
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

Series: DRM scheduler changes for Xe (rev10)
URL   : https://patchwork.freedesktop.org/series/121744/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 1e652bcf7 drm/xe/xelpmp: Extend Wa_22016670082 to Xe_LPM+
=== git am output follows ===
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:290
error: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c: patch does not apply
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1659
error: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c: patch does not apply
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4861
error: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/msm/adreno/adreno_device.c:841
error: drivers/gpu/drm/msm/adreno/adreno_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/scheduler/sched_main.c:439
error: drivers/gpu/drm/scheduler/sched_main.c: patch does not apply
error: patch failed: include/drm/gpu_scheduler.h:552
error: include/drm/gpu_scheduler.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/sched: Add drm_sched_wqueue_* helpers
Patch failed at 0001 drm/sched: Add drm_sched_wqueue_* helpers
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


