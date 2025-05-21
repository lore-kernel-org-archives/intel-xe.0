Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD19C2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 16:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C439B10E944;
	Wed, 21 May 2025 16:02:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C596510E944;
 Wed, 21 May 2025 16:02:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/i915/dp=3A_Fix_t?=
 =?utf-8?q?he_enabling/disabling_of_audio_SDP_splitting_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 16:02:40 -0000
Message-ID: <174784336080.10279.7641125089972943558@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520142219.1688401-1-imre.deak@intel.com>
In-Reply-To: <20250520142219.1688401-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Fix the enabling/disabling of audio SDP splitting (rev3)
URL   : https://patchwork.freedesktop.org/series/149254/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2d8dc23f1e6c drm-tip: 2025y-05m-21d-13h-29m-52s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_audio.c:397
error: drivers/gpu/drm/i915/display/intel_audio.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_audio.h:31
error: drivers/gpu/drm/i915/display/intel_audio.h: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_ddi.c:3507
error: drivers/gpu/drm/i915/display/intel_ddi.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_dp_mst.c:1336
error: drivers/gpu/drm/i915/display/intel_dp_mst.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915/dp: Fix the enabling/disabling of audio SDP splitting
Patch failed at 0001 drm/i915/dp: Fix the enabling/disabling of audio SDP splitting
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


