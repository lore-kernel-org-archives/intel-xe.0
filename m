Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDD2C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 18:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D50B113D3E;
	Wed, 24 Apr 2024 18:54:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A5B113D3E;
 Wed, 24 Apr 2024 18:54:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Prep_patches_for_1_j?=
 =?utf-8?q?ob_per_VM_bind_IOCTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 18:54:46 -0000
Message-ID: <171398488667.1632086.3182583351746678395@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424172352.1704851-1-matthew.brost@intel.com>
In-Reply-To: <20240424172352.1704851-1-matthew.brost@intel.com>
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

Series: Prep patches for 1 job per VM bind IOCTL (rev2)
URL   : https://patchwork.freedesktop.org/series/132246/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ad654139fd5a drm-tip: 2024y-04m-24d-16h-23m-13s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Lock all gpuva ops during VM bind IOCTL
Applying: drm/xe: Add ops_execute function which returns a fence
Applying: drm/xe: Move migrate to prefetch to op_lock_and_prep function
Applying: drm/xe: Add struct xe_vma_ops abstraction
Applying: drm/xe: Use xe_vma_ops to implement xe_vm_rebind
Applying: drm/xe: Simplify VM bind IOCTL error handling and cleanup
Applying: drm/xe: Use xe_vma_ops to implement page fault rebinds
Applying: drm/xe: Add some members to xe_vma_ops
Applying: drm/xe: Add vm_bind_ioctl_ops_fini helper
Applying: drm/xe: Move ufence check to op_lock_and_prep
Applying: drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
Applying: drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
Applying: drm/xe: Delete PT update selftest


