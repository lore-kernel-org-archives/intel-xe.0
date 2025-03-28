Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5536C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 20:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A371910EAC2;
	Fri, 28 Mar 2025 20:47:08 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E11E10EAC2;
 Fri, 28 Mar 2025 20:47:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Replace_xe=5Fhmm_with_gpu?=
 =?utf-8?q?svm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 20:47:07 -0000
Message-ID: <174319482724.17146.11687819129022191237@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328181028.288312-9-matthew.auld@intel.com>
In-Reply-To: <20250328181028.288312-9-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm (rev2)
URL   : https://patchwork.freedesktop.org/series/146553/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3f609c821a5c6f5a929e9c2956db2af12ca961c8
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Mar 28 18:10:36 2025 +0000

    drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
    
    We now use the same notifier lock for SVM and userptr, with that we can
    combine xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit.
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch b8a000ee8dbf41db533796cefbfb275cd306eb5b drm-intel
929bce4fd08d drm/gpusvm: fix hmm_pfn_to_map_order() usage
-:19: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#19: 
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
616e715847a0 drm/gpusvm: use more selective dma dir in get_pages()
cfa7c02bfb7d drm/gpusvm: pull out drm_gpusvm_pages substructure
6d8e98d48cd9 drm/gpusvm: refactor core API to use pages struct
9f6fcb323d0a drm/gpusvm: export drm_gpusvm_pages API
2a3bd6491d32 drm/xe/userptr: replace xe_hmm with gpusvm
-:79: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#79: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 436 lines checked
3f609c821a5c drm/xe/pt: unify xe_pt_svm_pre_commit with userptr


