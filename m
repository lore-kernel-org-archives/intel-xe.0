Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F72C3271E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9719310E2C6;
	Sat,  6 Jul 2024 00:07:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C421510E2C6;
 Sat,  6 Jul 2024 00:07:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Proper_GT_TLB_invalidatio?=
 =?utf-8?q?n_layering_and_new_coalescing_feature=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 06 Jul 2024 00:07:30 -0000
Message-ID: <172022445079.32361.16347684724620285855@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240706000252.702044-1-matthew.brost@intel.com>
In-Reply-To: <20240706000252.702044-1-matthew.brost@intel.com>
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

Series: Proper GT TLB invalidation layering and new coalescing feature.
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
commit add369b9dd02604ad7af4ad7d1dbc6bdfd81b24b
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jul 5 17:02:52 2024 -0700

    drm/xe: Add GT TLB invalidation watermark debugfs
    
    Add GT TLB invalidation watermark to debugfs for feature tuning and
    disabling (less than equal to a value of 1).
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cdd1a80a2d16d5213af20a29eb7570a7651db7dc drm-intel
5df0ad1b6c07 drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
4a5f0c02cc00 drm/xe: Drop xe_gt_tlb_invalidation_wait
57c61caeb9d7 drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
3e910510de9d drm/xe: Add tlb_invalidation.seqno_lock
38107fd496bc drm/xe: Add xe_gt_tlb_invalidation_done_handler
0ed80ccf39b3 drm/xe: Add send tlb invalidation helpers
f20ea6bc64cb drm/xe: Add xe_guc_tlb_invalidation layer
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:286: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#286: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 405 lines checked
6aecf1f99a48 drm/xe: Add multi-client support for GT TLB invalidations
8e25fd9d90f0 drm/xe: Add GT TLB invalidation coalescing
-:177: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#177: FILE: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:152:
 }
+static void

-:489: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#489: FILE: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:618:
+	if ((list_empty(&gt->tlb_invalidation.pending_fences) ||
+	    list_is_singular(&gt->tlb_invalidation.pending_fences)) &&

total: 0 errors, 0 warnings, 2 checks, 662 lines checked
c0fd00ff6ca0 drm/xe: Add GT TLB coalesce tracepoints
add369b9dd02 drm/xe: Add GT TLB invalidation watermark debugfs


