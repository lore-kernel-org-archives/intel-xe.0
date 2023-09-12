Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382D1CA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 02:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41E210E265;
	Tue, 12 Sep 2023 02:20:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3AABB10E265;
 Tue, 12 Sep 2023 02:20:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2964BAADE3;
 Tue, 12 Sep 2023 02:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Danilo Krummrich" <dakr@redhat.com>
Date: Tue, 12 Sep 2023 02:20:16 -0000
Message-ID: <169448521613.31796.4838554843286835596@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230912021615.2086698-1-matthew.brost@intel.com>
In-Reply-To: <20230912021615.2086698-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_DRM_scheduler_changes_for_Xe_=28rev5=29?=
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

Series: DRM scheduler changes for Xe (rev5)
URL   : https://patchwork.freedesktop.org/series/121744/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: b4ddac861 fixup! drm/xe/display: Implement display support
=== git am output follows ===
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:290
error: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c: patch does not apply
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1659
error: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c: patch does not apply
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4614
error: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/msm/adreno/adreno_device.c:809
error: drivers/gpu/drm/msm/adreno/adreno_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/scheduler/sched_main.c:439
error: drivers/gpu/drm/scheduler/sched_main.c: patch does not apply
error: patch failed: include/drm/gpu_scheduler.h:550
error: include/drm/gpu_scheduler.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/sched: Add drm_sched_submit_* helpers
Patch failed at 0001 drm/sched: Add drm_sched_submit_* helpers
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


