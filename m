Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BE5C3ABCC
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 12:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635AD10E612;
	Wed, 14 May 2025 12:07:10 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD9410E612;
 Wed, 14 May 2025 12:07:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Prefetch_Support_for?=
 =?utf-8?q?_svm_ranges_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 12:07:08 -0000
Message-ID: <174722442851.77995.990832868656530025@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250513040228.470682-1-himal.prasad.ghimiray@intel.com>
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

Series: Prefetch Support for svm ranges (rev9)
URL   : https://patchwork.freedesktop.org/series/146079/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2e72fd09b4fb drm-tip: 2025y-05m-14d-09h-10m-15s UTC integration manifest
=== git am output follows ===
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


