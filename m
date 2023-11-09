Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05753C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 22:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B765510E406;
	Thu,  9 Nov 2023 22:20:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC26310E406;
 Thu,  9 Nov 2023 22:20:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 67470A7DFB;
 Thu,  9 Nov 2023 22:20:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 09 Nov 2023 22:20:37 -0000
Message-ID: <169956843738.26591.1628951743641418211@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Sync_DRM_scheduler_with_upstream_=28with_fixups=29_=28rev2?=
 =?utf-8?q?=29?=
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

Series: Sync DRM scheduler with upstream (with fixups) (rev2)
URL   : https://patchwork.freedesktop.org/series/126196/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: b11007e91 drm/xe/tests: Fix migrate test
=== git am output follows ===
Applying: Revert "drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode"
Applying: Revert "drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy"
Applying: Revert "drm/sched: Move schedule policy to scheduler"
Applying: Revert "drm/sched: Add helper to set TDR timeout"
Applying: Revert "drm/sched: Submit job before starting TDR"
Applying: Revert "drm/sched: Start run wq before TDR in drm_sched_start"
Applying: Revert "drm/sched: Add generic scheduler message interface"
Applying: Revert "drm/sched: Convert drm scheduler to use a work queue rather than kthread"
Applying: Revert "drm/sched: Don't store self-dependencies"
Applying: gpu/drm: Eliminate DRM_SCHED_PRIORITY_UNSET
Applying: drm/sched: Convert the GPU scheduler to variable number of run-queues
Applying: dma-buf: add dma_fence_timestamp helper
Applying: drm/sched: Add drm_sched_wqueue_* helpers
Applying: drm/sched: Convert drm scheduler to use a work queue rather than kthread
Applying: drm/sched: Split free_job into own work item
Applying: drm/sched: Add drm_sched_start_timeout_unlocked helper
Applying: drm/sched: Add a helper to queue TDR immediately
Applying: fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
Applying: fixup! drm/xe: Fix potential deadlock handling page faults
Applying: drm/xe: Use pool of ordered wq for GuC submission


