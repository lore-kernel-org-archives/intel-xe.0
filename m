Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021B7C3DA42
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 04:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD1F10E1CE;
	Mon,  8 Jul 2024 04:09:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C3110E012;
 Mon,  8 Jul 2024 04:09:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Proper_GT_TLB_invalidatio?=
 =?utf-8?q?n_layering_and_new_coalescing_feature=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jul 2024 04:09:18 -0000
Message-ID: <172041175874.49182.9711438967397160181@2413ebb6fbb6>
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
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f6fe56731fbedb1885dabb719ffad9cc4b2cc058
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun Jul 7 21:03:31 2024 -0700

    drm/xe: Add GT TLB invalidation watermark debugfs
    
    Add GT TLB invalidation watermark to debugfs for feature tuning and
    disabling (less than equal to a value of 1).
    
    v2:
     - Change watermark logic to be zero based
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 70f1d41b827fa9d1275748e655912f991635f595 drm-intel
87dcd50ca950 drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
d458a70192b7 drm/xe: Drop xe_gt_tlb_invalidation_wait
fe0ae3fb43f2 drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
26d3b0653d7e drm/xe: Add tlb_invalidation.seqno_lock
fe12ea983a93 drm/xe: Add xe_gt_tlb_invalidation_done_handler
29df74d5da5f drm/xe: Add send tlb invalidation helpers
c532b6075231 drm/xe: Add xe_guc_tlb_invalidation layer
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:289: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#289: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 399 lines checked
90bbdccd3712 drm/xe: Add multi-client support for GT TLB invalidations
1c57782d4cc6 drm/xe: Add GT TLB invalidation coalescing
449ced0751a8 drm/xe: Add GT TLB invalidation coalesce tracepoints
f6fe56731fbe drm/xe: Add GT TLB invalidation watermark debugfs


