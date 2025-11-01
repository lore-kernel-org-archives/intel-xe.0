Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0F1CCF9F8
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 03:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6D210E339;
	Sat,  1 Nov 2025 03:43:11 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EC310E339;
 Sat,  1 Nov 2025 03:43:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Context_based_TLB_invalid?=
 =?utf-8?q?ations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 01 Nov 2025 03:43:09 -0000
Message-ID: <176196858991.8737.9904601059540281786@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251101010225.3095457-1-matthew.brost@intel.com>
In-Reply-To: <20251101010225.3095457-1-matthew.brost@intel.com>
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

Series: Context based TLB invalidations
URL   : https://patchwork.freedesktop.org/series/156874/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 32b8fe31dbd0fb412c3e2b71cb16dc4089623b82
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Oct 31 18:02:25 2025 -0700

    drm/xe: Enable context TLB invalidations for CI
    
    Do not review, CI only.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 089e83683d58db86cc4c69d34fba3a96904e40e1 drm-intel
63fdaa83fd43 drm/xe: Add normalize_invalidation_range
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: 'Sigend-off-by:' - perhaps 'Signed-off-by:'?
#14: 
Sigend-off-by: Nirmoy Das <nirmoy.das@intel.com>

total: 0 errors, 1 warnings, 0 checks, 88 lines checked
ad2b824c2f8f drm/xe: Make usm.asid_to_vm allocation use GFP_NOWAIT
86f1aa804e5f drm/xe: Add xe_device_asid_to_vm helper
acf19c56f324 drm/xe: Add vm to exec queues association
1b4213d47ef9 drm/xe: Taint TLB invalidation seqno lock with GFP_KERNEL
56457d21515a drm/xe: Do not forward invalid TLB invalidation seqnos to upper layers
5080760fffb5 drm/xe: Rename send_tlb_inval_ppgtt to send_tlb_inval_asid_ppgtt
9f87f012af5c drm/xe: Add send_tlb_inval_ppgtt helper
d10f10ae2c31 drm/xe: Add xe_tlb_inval_idle helper
93092f25f400 drm/xe: Add exec queue active vfunc
8278f5ee18d5 drm/xe: Add context-based invalidation to GuC TLB invalidation backend
-:67: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#67: FILE: drivers/gpu/drm/xe/xe_guc_tlb_inval.c:148:
+	xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE &&
+		     !xe->info.has_ctx_tlb_inval) ||

-:99: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#99: FILE: drivers/gpu/drm/xe/xe_guc_tlb_inval.c:209:
+		return PTR_ERR(vm);;

total: 0 errors, 1 warnings, 1 checks, 193 lines checked
32b8fe31dbd0 drm/xe: Enable context TLB invalidations for CI


