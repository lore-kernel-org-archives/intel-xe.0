Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D342EC36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 13:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C94A10E886;
	Wed,  9 Apr 2025 13:05:27 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6B510E87B;
 Wed,  9 Apr 2025 13:05:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_dma-fence=3A_Rename_?=
 =?utf-8?q?dma=5Ffence=5Fis=5Fsignaled=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Philipp Stanner" <phasta@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 13:05:26 -0000
Message-ID: <174420392696.52067.8285552021642255707@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250409120640.106408-2-phasta@kernel.org>
In-Reply-To: <20250409120640.106408-2-phasta@kernel.org>
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

Series: dma-fence: Rename dma_fence_is_signaled()
URL   : https://patchwork.freedesktop.org/series/147461/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a4fa94e2a404 drm-tip: 2025y-04m-09d-10h-59m-10s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6860
error: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: patch does not apply
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:287
error: drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c: patch does not apply
error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:387
error: drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: dma-fence: Rename dma_fence_is_signaled()
Patch failed at 0001 dma-fence: Rename dma_fence_is_signaled()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


