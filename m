Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE16D73EA8
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC99E10E1EA;
	Thu, 29 Jan 2026 23:06:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EEA10E1EA;
 Thu, 29 Jan 2026 23:06:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_warning_of_kerneldoc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jan 2026 23:06:07 -0000
Message-ID: <176972796706.207489.1827979132251531848@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129225606.412902-5-shuicheng.lin@intel.com>
In-Reply-To: <20260129225606.412902-5-shuicheng.lin@intel.com>
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

Series: Fix warning of kerneldoc
URL   : https://patchwork.freedesktop.org/series/160866/
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
commit f01a3377a17cb613b55df6d4c67c3bdce2685a1f
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Jan 29 22:56:10 2026 +0000

    drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep
    
    Correct the function name in the kerneldoc.
    It is for below warning:
    "Warning: drivers/gpu/drm/xe/xe_tlb_inval_job.c:210 expecting prototype for
    xe_tlb_inval_alloc_dep(). Prototype was for xe_tlb_inval_job_alloc_dep() instead"
    
    Fixes: 15366239e2130 ("drm/xe: Decouple TLB invalidations from GT")
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch bd9c2b8a3a5b7bd8c38108929bfabd7a40dc922b drm-intel
be5a582ce339 drm/xe: Fix kerneldoc for xe_migrate_exec_queue
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
xe_get_migrate_exec_queue(). Prototype was for xe_migrate_exec_queue() instead"

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
969b81c80caa drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
xe_gt_tlb_inval_init(). Prototype was for xe_gt_tlb_inval_init_early() instead"

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
f01a3377a17c drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
xe_tlb_inval_alloc_dep(). Prototype was for xe_tlb_inval_job_alloc_dep() instead"

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


