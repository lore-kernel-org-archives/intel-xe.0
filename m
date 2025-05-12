Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB90C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 17:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494F810E1CB;
	Mon, 12 May 2025 17:00:28 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E6D10E1CB;
 Mon, 12 May 2025 17:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Prefetch_Support_for?=
 =?utf-8?q?_svm_ranges_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 17:00:27 -0000
Message-ID: <174706922719.70813.5349909872392247616@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
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

Series: Prefetch Support for svm ranges (rev6)
URL   : https://patchwork.freedesktop.org/series/146079/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f3767db51c5d drm-tip: 2025y-05m-12d-14h-06m-28s UTC integration manifest
=== git am output follows ===
Applying: drm/gpusvm: Introduce devmem_only flag for allocation
Applying: drm/xe: Strict migration policy for atomic SVM faults
Applying: drm/gpusvm: Add timeslicing support to GPU SVM
Applying: drm/xe: Timeslice GPU on atomic SVM fault
Applying: drm/xe: Add atomic_svm_timeslice_ms debugfs entry
Applying: drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
Applying: drm/xe: Make xe_svm_alloc_vram public
Applying: drm/xe/svm: Helper to add tile masks to svm ranges
Applying: drm/xe/svm: Make to_xe_range a public function
Applying: drm/xe/svm: Make xe_svm_range_* end/start/size public
Applying: drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
Applying: drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
Applying: drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
Applying: drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
Applying: drm/xe/svm: Make xe_svm_range_needs_migrate_to_vram() public
Applying: drm/xe/svm: Add xe_svm_range_validate() and xe_svm_range_migrate_to_smem()
Applying: drm/gpusvm: Introduce drm_gpusvm_find_vma_start() function
Applying: drm/xe/svm: Add xe_svm_find_vma_start() helper
Applying: drm/xe/svm: Implement prefetch support for SVM ranges
Applying: drm/xe/vm: Add debug prints for SVM range prefetch


