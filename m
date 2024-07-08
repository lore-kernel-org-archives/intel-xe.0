Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A6FC3DA42
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 04:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9875F10E093;
	Mon,  8 Jul 2024 04:08:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F4D10E012;
 Mon,  8 Jul 2024 04:08:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Proper_GT_TLB_invali?=
 =?utf-8?q?dation_layering_and_new_coalescing_feature=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jul 2024 04:08:51 -0000
Message-ID: <172041173186.49295.6770048093394917995@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708040331.766264-1-matthew.brost@intel.com>
In-Reply-To: <20240708040331.766264-1-matthew.brost@intel.com>
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

Series: Proper GT TLB invalidation layering and new coalescing feature. (rev2)
URL   : https://patchwork.freedesktop.org/series/135809/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 70f1d41b827f drm-tip: 2024y-07m-07d-18h-38m-49s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
Applying: drm/xe: Drop xe_gt_tlb_invalidation_wait
Applying: drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
Applying: drm/xe: Add tlb_invalidation.seqno_lock
Applying: drm/xe: Add xe_gt_tlb_invalidation_done_handler
Applying: drm/xe: Add send tlb invalidation helpers
Applying: drm/xe: Add xe_guc_tlb_invalidation layer
Applying: drm/xe: Add multi-client support for GT TLB invalidations
Applying: drm/xe: Add GT TLB invalidation coalescing
Applying: drm/xe: Add GT TLB invalidation coalesce tracepoints
Applying: drm/xe: Add GT TLB invalidation watermark debugfs


