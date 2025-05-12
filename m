Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE15BC3ABCC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788A810E1C3;
	Mon, 12 May 2025 16:27:22 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804D910E1C3;
 Mon, 12 May 2025 16:27:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Replace_xe=5Fhmm_with_gpu?=
 =?utf-8?q?svm_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 16:27:21 -0000
Message-ID: <174706724152.69697.7558589461243200893@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512150637.61462-10-matthew.auld@intel.com>
In-Reply-To: <20250512150637.61462-10-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm (rev4)
URL   : https://patchwork.freedesktop.org/series/146553/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5ed3c4000526d24988aac7776d2403dc0d17658d
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon May 12 16:06:46 2025 +0100

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
+ /mt/dim checkpatch f3767db51c5d8bc3ba3f2b342332ab329044fe5b drm-intel
b9609f762d84 drm/gpusvm: fix hmm_pfn_to_map_order() usage
-:19: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#19: 
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
0422f6b8647e drm/gpusvm: use more selective dma dir in get_pages()
9d3adf3a3418 drm/gpusvm: pull out drm_gpusvm_pages substructure
e66b592b62d8 drm/gpusvm: refactor core API to use pages struct
1cc5a4d1e008 drm/gpusvm: export drm_gpusvm_pages API
0e4dfea89a24 drm/xe/vm: split userptr bits into separate file
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 855 lines checked
7a6528a1d89a drm/xe/userptr: replace xe_hmm with gpusvm
-:101: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#101: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 583 lines checked
5ed3c4000526 drm/xe/pt: unify xe_pt_svm_pre_commit with userptr


