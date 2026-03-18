Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56676FCD0C1
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D0910E6A7;
	Wed, 18 Mar 2026 07:34:38 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34FB10E6A7;
 Wed, 18 Mar 2026 07:34:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Access_counter_?=
 =?utf-8?q?consumer_layer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Mar 2026 07:34:36 -0000
Message-ID: <177381927677.370303.15897289618781512700@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe: Access counter consumer layer
URL   : https://patchwork.freedesktop.org/series/163429/
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
commit 722116be97eb29b05dfc5d6e8a116200e6e6afda
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Mar 18 13:14:56 2026 +0530

    drm/xe/pt: Set NC PTE bit for VMAs ineligible for access counting
    
    Set XE_PPGTT_PTE_NC on PTEs for VMAs that can't benefit from access
    counter migration hints, avoiding wasteful slot allocation.
    
    Bspec: 67095
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 146a21986f74225d0343edeb925095825fa5474f drm-intel
a34ae79aabf3 drm/xe: Add xe_usm_queue generic USM circular buffer
-:19: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#19: 
new file mode 100644

-:77: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#77: FILE: drivers/gpu/drm/xe/xe_usm_queue.h:54:
+}
+/**

total: 0 errors, 1 warnings, 1 checks, 100 lines checked
ef7ba0ced1e6 drm/xe/pagefault: Use xe_usm_queue helpers
96db1d53a369 drm/xe: Stub out new access_counter layer
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 204 lines checked
67c41fd9b2e5 drm/xe: Implement xe_access_counter_init
b4fd5859c2d2 drm/xe: Implement xe_access_counter_handler
54b53d5dd1dd drm/xe: Extract xe_vma_lock_and_validate helper
ab7b7bdecbe8 drm/xe: Move ASID to FAULT VM lookup to xe_device
6ca35a793038 drm/xe: Implement xe_access_counter_queue_work
24fc8fc6bec7 drm/xe/trace: Add xe_vma_acc trace event for access counter notifications
-:74: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#74: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:133:
+	    TP_STRUCT__entry(

-:84: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#84: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:143:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 75 lines checked
2b1673bca06e drm/xe/svm: Handle svm ranges on access ctr trigger
869d75abbabb drm/xe: Add xe_guc_access_counter layer
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 100 lines checked
dd0bdd77cda5 drm/xe/uapi: Add access counter parameter extension for exec queue
56d33bf0de01 drm/xe/lrc: Pass exec_queue to xe_lrc_create for access counter params
14844dea0366 drm/xe/vm: Add xe_vma_supports_access_ctr() helper
722116be97eb drm/xe/pt: Set NC PTE bit for VMAs ineligible for access counting


