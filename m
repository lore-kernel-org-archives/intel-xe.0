Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2147CC369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 17:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D608910E025;
	Thu, 24 Apr 2025 17:45:53 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0509510E047;
 Thu, 24 Apr 2025 17:45:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Replace_xe=5Fhmm_with_gpu?=
 =?utf-8?q?svm_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 17:45:53 -0000
Message-ID: <174551675302.7634.18439648555375623893@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424121827.862729-9-matthew.auld@intel.com>
In-Reply-To: <20250424121827.862729-9-matthew.auld@intel.com>
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

Series: Replace xe_hmm with gpusvm (rev3)
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
commit 31c9339c6b9431c046ec881cdd4a0c5e046f7ea9
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Apr 24 13:18:35 2025 +0100

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
+ /mt/dim checkpatch 6176f71822602f52bc4327965090275c5570ed0d drm-intel
49e73d0ce1de drm/gpusvm: fix hmm_pfn_to_map_order() usage
-:19: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#19: 
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
37c5edb50bee drm/gpusvm: use more selective dma dir in get_pages()
f22b0f344b5c drm/gpusvm: pull out drm_gpusvm_pages substructure
97671627927a drm/gpusvm: refactor core API to use pages struct
844417938b2a drm/gpusvm: export drm_gpusvm_pages API
cfcfb6c5d8fd drm/xe/userptr: replace xe_hmm with gpusvm
-:81: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#81: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 494 lines checked
31c9339c6b94 drm/xe/pt: unify xe_pt_svm_pre_commit with userptr


