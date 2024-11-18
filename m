Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62840D60CFD
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 23:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177D810E571;
	Mon, 18 Nov 2024 23:55:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DDC10E571;
 Mon, 18 Nov 2024 23:55:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_UMD_direct_submissio?=
 =?utf-8?q?n_in_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 23:55:30 -0000
Message-ID: <173197413038.96945.10778086231095368965@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118233757.2374041-1-matthew.brost@intel.com>
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
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

Series: UMD direct submission in Xe
URL   : https://patchwork.freedesktop.org/series/141524/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1fe9a6cc7d13 drm-tip: 2024y-11m-18d-21h-03m-03s UTC integration manifest
=== git am output follows ===
Applying: dma-fence: Add dma_fence_preempt base class
Applying: dma-fence: Add dma_fence_user_fence
Applying: drm/xe: Use dma_fence_preempt base class
Applying: drm/xe: Allocate doorbells for UMD exec queues
Applying: drm/xe: Add doorbell ID to snapshot capture
Applying: drm/xe: Break submission ring out into its own BO
Applying: drm/xe: Break indirect ring state out into its own BO
Applying: drm/xe: Clear GGTT in xe_bo_restore_kernel
Applying: FIXME: drm/xe: Add pad to ring and indirect state
Applying: drm/xe: Enable indirect ring on media GT
Applying: drm/xe: Don't add pinned mappings to VM bulk move
Applying: drm/xe: Add exec queue post init extension processing
Applying: drm/xe/mmap: Add mmap support for PCI memory barrier
Applying: drm/xe: Add support for mmapping doorbells to user space
Applying: drm/xe: Add support for mmapping submission ring and indirect ring state to user space
Applying: drm/xe/uapi: Define UMD exec queue mapping uAPI
Applying: drm/xe: Add usermap exec queue extension
Applying: drm/xe: Drop EXEC_QUEUE_FLAG_UMD_SUBMISSION flag
Applying: drm/xe: Do not allow usermap exec queues in exec IOCTL
Applying: drm/xe: Teach GuC backend to kill usermap queues
Applying: drm/xe: Enable preempt fences on usermap queues
Applying: drm/xe/uapi: Add uAPI to convert user semaphore to / from drm syncobj
Applying: drm/xe: Add user fence IRQ handler
Applying: drm/xe: Add xe_hw_fence_user_init
Applying: drm/xe: Add a message lock to the Xe GPU scheduler
Applying: drm/xe: Always wait on preempt fences in vma_check_userptr
Applying: drm/xe: Teach xe_sync layer about drm_xe_semaphore
Applying: drm/xe: Add VM convert fence IOCTL
Applying: drm/xe: Add user fence TDR


