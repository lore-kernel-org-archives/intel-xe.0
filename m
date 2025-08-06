Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD94AC87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 13:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7630110E775;
	Wed,  6 Aug 2025 13:18:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F66B10E3E1;
 Wed,  6 Aug 2025 13:18:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Improve_VF_prov?=
 =?utf-8?q?ision_stability_with_fault_injection_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 13:18:27 -0000
Message-ID: <175448630712.216422.6997893180279603926@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250806132748.6697-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250806132748.6697-1-satyanarayana.k.v.p@intel.com>
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

Series: drm/xe: Improve VF provision stability with fault injection (rev4)
URL   : https://patchwork.freedesktop.org/series/151499/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 56939294f494933db91e8306105410e1fced4032
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Wed Aug 6 18:57:48 2025 +0530

    drm/xe: Improve VF provision stability with fault injection
    
    When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
    flag, the driver initiates TLB invalidation requests via the CTB mechanism
    while releasing the BO. However a premature release of the CTB BO can lead
    to system crashes, as observed in:
    
    Oops: Oops: 0000 [#1] SMP NOPTI
    RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
    Call Trace:
     guc_ct_send_locked+0x8b/0x670 [xe]
     xe_guc_ct_send_locked+0x19/0x60 [xe]
     send_tlb_invalidation+0xb4/0x460 [xe]
     xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
     ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
     ggtt_node_remove+0x110/0x140 [xe]
     xe_ggtt_node_remove+0x40/0xa0 [xe]
     xe_ggtt_remove_bo+0x87/0x250 [xe]
    
    Introduce a devm-managed release action during xe_guc_ct_init() to ensure
    proper CTB disablement before resource deallocation, preventing the
    use-after-free scenario.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Summers Stuart <stuart.summers@intel.com>
+ /mt/dim checkpatch 886b8d8ef3839f604e3e7f6187ac6c46eb21b802 drm-intel
56939294f494 drm/xe: Improve VF provision stability with fault injection
-:77: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 38 lines checked


