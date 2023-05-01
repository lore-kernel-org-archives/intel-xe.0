Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE72DC77B61
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 08:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0643310E2E1;
	Mon,  1 May 2023 07:54:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33C8110E356;
 Mon,  1 May 2023 07:54:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2E213A41FB;
 Mon,  1 May 2023 07:54:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Mon, 01 May 2023 07:54:14 -0000
Message-ID: <168292765417.29668.10590679305415962811@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230501075114.3108352-1-matthew.brost@intel.com>
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Upstreaming_prep_/_all_of_mbrosts_patches?=
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

Series: Upstreaming prep / all of mbrosts patches
URL   : https://patchwork.freedesktop.org/series/117156/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: f7b51a4d5 drm/xe: Fix media detection for pre-GMD_ID platforms
=== git am output follows ===
.git/rebase-apply/patch:26: trailing whitespace.
	
warning: 1 line adds whitespace errors.
Applying: drm/sched: Add run_wq argument to drm_sched_init
Applying: drm/sched: Move schedule policy to scheduler
Applying: drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
Applying: drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
Applying: drm/xe: Long running job update
Applying: drm/xe: Ensure LR engines are not persistent
Applying: drm/xe: Only try to lock external BOs in VM bind
Applying: drm/xe: VM LRU bulk move
Applying: drm/xe/guc: Read HXG fields from DW1 of G2H response
Applying: drm/xe/guc: Return the lower part of blocking H2G message
Applying: drm/xe/guc: Use doorbells for submission if possible
Applying: drm/xe/guc: Print doorbell ID in GuC engine debugfs entry
Applying: maple_tree: split up MA_STATE() macro
Applying: maple_tree: Export mas_preallocate
Applying: drm: manager to keep track of GPUs VA mappings
Applying: drm/xe: Port Xe to GPUVA
Applying: drm/xe: NULL binding implementation
Applying: drm/xe: Avoid doing rebinds
Applying: drm/xe: Reduce the number list links in xe_vma
Applying: drm/xe: Optimize size of xe_vma allocation
Applying: drm/gpuva: Add drm device to GPUVA manager
Applying: drm/gpuva: Move dma-resv to GPUVA manager
Applying: drm/gpuva: Add support for extobj
Applying: drm/xe: Userptr refactor
Applying: drm: execution context for GEM buffers v3
Applying: drm/exec: Always compile drm_exec
Applying: drm/xe: Use drm_exec for locking rather than TTM exec helpers
Applying: drm/xe: Allow dma-fences as in-syncs for compute / faulting VM
Applying: drm/xe: Allow compute VMs to output dma-fences on binds
Applying: drm/xe: remove async worker, sync binds, new error handling


