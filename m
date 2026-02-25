Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABD6FD45E4
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 19:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A2B10E376;
	Wed, 25 Feb 2026 19:45:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE5910E376;
 Wed, 25 Feb 2026 19:45:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fine_grained_fault_lockin?=
 =?utf-8?q?g=2C_threaded_prefetch=2C_storm_cache?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Feb 2026 19:45:00 -0000
Message-ID: <177204870081.288682.8457628943393066232@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260225184713.2606772-1-matthew.brost@intel.com>
In-Reply-To: <20260225184713.2606772-1-matthew.brost@intel.com>
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

Series: Fine grained fault locking, threaded prefetch, storm cache
URL   : https://patchwork.freedesktop.org/series/162167/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4037bdd0ed28962afe26a02d0aaaedd97b8b9d90
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Feb 25 10:47:13 2026 -0800

    drm/xe: Track parallel page fault activity in GT stats
    
    Add a new GT statistic, PARALLEL_PAGEFAULT_COUNT, to record when
    multiple page fault workers are active concurrently.
    
    When a worker dequeues a fault, scan peer workers for an active
    cache entry and increment the counter if another fault is already
    in flight. This provides basic visibility into parallel fault
    handling behavior for performance analysis and tuning.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 940d2c5064ed09bca924fd8aa017be99cc745b31 drm-intel
61d69cc0e5b3 drm/xe: Fine grained page fault locking
-:582: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#582: FILE: drivers/gpu/drm/xe/xe_userptr.c:61:
+}
+#define xe_vma_userptr_lockdep(uvma)	\

total: 0 errors, 0 warnings, 1 checks, 675 lines checked
7291aacd3ce2 drm/xe: Allow prefetch-only VM bind IOCTLs to use VM read lock
036b2f5887d3 drm/xe: Thread prefetch of SVM ranges
5b7c4aa69c00 drm/xe: Use a single page-fault queue with multiple workers
0fa2b26908bd drm/xe: Add num_pf_work modparam
b29cc2f628e4 drm/xe: Engine class and instance into a u8
3e56ef996b62 drm/xe: Track pagefault worker runtime
bd9b1d0ddf7a drm/xe: Chain page faults via queue-resident cache to avoid fault storms
-:34: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#34: 
Assisted-by: Chat-GPT # Documentation

-:34: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Chat-GPT # Documentation'
#34: 
Assisted-by: Chat-GPT # Documentation

-:446: ERROR:SPACING: space prohibited before that close parenthesis ')'
#446: FILE: drivers/gpu/drm/xe/xe_pagefault.c:571:
+		} else if (err ) {

-:455: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#455: FILE: drivers/gpu/drm/xe/xe_pagefault.c:578:
+				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);

total: 2 errors, 2 warnings, 0 checks, 803 lines checked
615dbe8e5b33 drm/xe: Add pagefault chaining stats
b739f1a9432d drm/xe: Add debugfs pagefault_info
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#14: 
Assisted-by: Chat-GPT # Documentation

-:14: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Chat-GPT # Documentation'
#14: 
Assisted-by: Chat-GPT # Documentation

-:128: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#128: FILE: drivers/gpu/drm/xe/xe_pagefault.c:909:
+
+	}

total: 1 errors, 1 warnings, 1 checks, 115 lines checked
772917759a0b drm/xe: batch CT pagefault acks with periodic flush
-:27: WARNING:BAD_SIGN_OFF: Non-standard signature: Assistent-by:
#27: 
Assistent-by: Chat-GPT # Documentation

-:27: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Chat-GPT # Documentation'
#27: 
Assistent-by: Chat-GPT # Documentation

-:254: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#254: FILE: drivers/gpu/drm/xe/xe_guc_ct.h:65:
 }
+void xe_guc_ct_send_flush(struct xe_guc_ct *ct);

total: 1 errors, 1 warnings, 1 checks, 368 lines checked
4037bdd0ed28 drm/xe: Track parallel page fault activity in GT stats


