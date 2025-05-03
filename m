Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53834C369C2
	for <intel-xe@archiver.kernel.org>; Sat,  3 May 2025 21:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CD410E257;
	Sat,  3 May 2025 21:14:27 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E02F10E227;
 Sat,  3 May 2025 21:14:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/sched=3A_Allow_d?=
 =?utf-8?q?rivers_to_skip_the_reset_with_DRM=5FGPU=5FSCHED=5FSTAT=5FRUNNING?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 03 May 2025 21:14:25 -0000
Message-ID: <174630686556.38894.15529148290401590467@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
In-Reply-To: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
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

Series: drm/sched: Allow drivers to skip the reset with DRM_GPU_SCHED_STAT_RUNNING
URL   : https://patchwork.freedesktop.org/series/148575/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5063c346ff2c drm-tip: 2025y-05m-03d-03h-41m-28s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/v3d/v3d_sched.c:751
error: drivers/gpu/drm/v3d/v3d_sched.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/sched: Allow drivers to skip the reset and keep on running
Applying: drm/sched: Always free the job after the timeout
Applying: drm/sched: Reduce scheduler's timeout for timeout tests
Applying: drm/sched: Add new test for DRM_GPU_SCHED_STAT_RUNNING
Applying: drm/v3d: Use DRM_GPU_SCHED_STAT_RUNNING to skip the reset
Patch failed at 0005 drm/v3d: Use DRM_GPU_SCHED_STAT_RUNNING to skip the reset
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


