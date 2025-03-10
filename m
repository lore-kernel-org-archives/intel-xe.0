Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AE2C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0854E10E10C;
	Mon, 10 Mar 2025 12:35:12 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F3810E093;
 Mon, 10 Mar 2025 12:35:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Prefetch_Support_for?=
 =?utf-8?q?_svm_ranges?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 12:35:11 -0000
Message-ID: <174161011174.13756.16636750629632837751@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
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

Series: Prefetch Support for svm ranges
URL   : https://patchwork.freedesktop.org/series/146079/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 0457c65354c6 drm-tip: 2025y-03m-10d-09h-55m-22s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
Applying: drm/xe: Make xe_svm_alloc_vram public
Applying: drm/xe/svm: Helper to add tile masks to svm ranges
Applying: drm/xe/svm: Make to_xe_range a public function
Applying: drm/xe/svm: Make xe_svm_range_* end/start/size public
Applying: drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
Applying: drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
Applying: drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
Applying: drm/xe/svm: Allow unaligned addresses and ranges for prefetch
Applying: drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
Applying: drm/xe/svm: Implement prefetch support for SVM ranges
Applying: drm/xe/vm: Add debug prints for SVM range prefetch


