Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479ACCA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F7F10E4B1;
	Mon, 18 Aug 2025 17:04:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6875410E4AB;
 Mon, 18 Aug 2025 17:04:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Replace_xe=5Fhmm_with_gpu?=
 =?utf-8?q?svm_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Aug 2025 17:04:14 -0000
Message-ID: <175553665438.244962.9187531299991112157@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818152152.67815-10-matthew.auld@intel.com>
In-Reply-To: <20250818152152.67815-10-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm (rev5)
URL   : https://patchwork.freedesktop.org/series/146553/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f9f73643ede960b986329c70a979999910f50e16
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Aug 18 16:22:01 2025 +0100

    drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
    
    We now use the same notifier lock for SVM and userptr, with that we can
    combine xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit.
    
    v2: (Matt B)
      - Re-use xe_svm_notifier_lock/unlock for userptr.
      - Combine svm/userptr handling further down into op_check_svm_userptr.
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 912c10fafebf45522f7f56e33a020284e83c27ab drm-intel
11babbe1d197 drm/gpusvm: fix hmm_pfn_to_map_order() usage
-:19: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#19: 
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
cd0f97a95eb3 drm/gpusvm: use more selective dma dir in get_pages()
85d4dcd0a32a drm/gpusvm: pull out drm_gpusvm_pages substructure
4c5b6f3e354e drm/gpusvm: refactor core API to use pages struct
b4c94067c7a9 drm/gpusvm: export drm_gpusvm_pages API
84568269c8b1 drm/xe/vm: split userptr bits into separate file
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 857 lines checked
5a26add70022 drm/xe/userptr: replace xe_hmm with gpusvm
-:102: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#102: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 677 lines checked
f9f73643ede9 drm/xe/pt: unify xe_pt_svm_pre_commit with userptr


